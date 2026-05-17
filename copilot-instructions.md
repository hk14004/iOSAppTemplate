You are assisting with an iOS codebase in this repository.
You are expert iOS developer.

Apply these rules when analyzing or changing code.


## Main engineering goals
Optimize for:
- maintainability
- clarity
- modularity
- correctness
- testability
- safe long-term evolution

Prefer incremental refactoring over unnecessary rewrites.
Preserve consistency with existing good patterns in the codebase.
Do not recommend abstraction unless it materially improves the design.

## Architecture expectations
Follow pragmatic Clean Architecture boundaries:
- Presentation layer: SwiftUI views, UIKit view controllers, coordinators, view models
- Domain layer: entities, value objects, use cases, domain services, repository contracts
- Data layer: API clients, persistence, DTOs, repository implementations, mappers

Rules:
- Presentation must not directly depend on networking, persistence, analytics, or external SDK details.
- Domain must not depend on UIKit, SwiftUI, Core Data, SwiftData, URLSession, Firebase, or other infrastructure frameworks.
- Data may depend on domain abstractions, but domain must not depend on data implementations.

Call out architecture boundary violations explicitly.
Business rules must not live in views, view controllers, SwiftUI views, or infrastructure code.

## SOLID guidance
Enforce SOLID pragmatically.
Call out the specific violated principle when relevant:
- SRP: types should have one clear responsibility
- OCP: prefer extension through composition and protocol boundaries
- LSP: abstractions must behave consistently
- ISP: prefer small focused protocols
- DIP: high-level logic should depend on abstractions, not concrete infrastructure

## MVVM guidance
View models should:
- expose UI-ready state
- transform user actions into intents
- call use cases or domain services
- manage loading, empty, success, and error states
- handle presentation-oriented formatting when appropriate

View models should not:
- contain direct networking unless explicitly justified
- directly access persistence frameworks
- embed complex business rules
- handle unrelated responsibilities
- become god objects

Flag oversized or multi-responsibility view models.

## SwiftUI guidance
These rules apply to SwiftUI codebases. Projects may target iOS 15+ or iOS 17+. Apply the appropriate ownership model based on the deployment target.

### State ownership — iOS 15+ (`ObservableObject`)
- `@StateObject` — the view **owns** the object. Use when the view creates the ViewModel itself. The instance is created once and survives re-renders.
- `@ObservedObject` — the view **observes** but does not own. Use when the ViewModel is injected from outside. Using `@ObservedObject` for a locally created VM silently resets all state on every re-render.
- `@State` — local, ephemeral UI state only: sheet toggles, text field input, animation flags. Never use for business data or ViewModel-owned state.
- `@Binding` — derived mutable state passed down from a parent. Should flow through or from the ViewModel, not bypass it to reach child views directly.

### State ownership — iOS 17+ (`@Observable`)
- `@Observable` replaces `ObservableObject`. SwiftUI tracks individual property access automatically — no `@Published` needed.
- Own an `@Observable` object with `@State` — equivalent to `@StateObject`. Pass it as a regular property to children.
- Use `@Bindable` to create two-way bindings to `@Observable` object properties.
- `@Environment(MyModel.self)` replaces `@EnvironmentObject` — the hidden dependency concern applies equally.
- Flag mixing `@Observable` and `ObservableObject` in the same feature without clear justification.

### Environment dependencies
- `@EnvironmentObject` and `@Environment(MyModel.self)` introduce hidden implicit dependencies — they contradict DIP and hurt testability. Prefer explicit initializer injection for feature-level dependencies.
- `@Environment` for system values (`\.colorScheme`, `\.locale`, `\.dismiss`) is appropriate — these are environmental by nature.
- Flag feature-level ViewModels or services injected via environment instead of initializer.

### View decomposition
- Extract subviews when `body` exceeds ~40 lines or when a logical UI component can stand alone with its own inputs.
- Prefer small focused views over one large view with deeply nested conditionals and multiple responsibilities.
- Extracted subviews should receive only the data they need — avoid passing the entire ViewModel down when a few properties suffice.

### Side effects
- Prefer `.task` for async work — it is automatically cancelled when the view disappears, tying async lifetime to view lifetime.
- `.onAppear` is appropriate for synchronous triggers: analytics events, focus requests, scroll resets.
- Avoid `.onAppear + Task {}` without managing cancellation — the Task outlives the view disappearance.
- Views should call ViewModel methods from lifecycle modifiers, not embed logic directly.

### View identity
- `ForEach` requires stable, unique identifiers. Never use array index as `id` — it causes silent state resets, broken animations, and incorrect diffing.
- `.id()` modifier forces complete view recreation. Use intentionally, not as a workaround for stale state.
- Unstable IDs are a common source of hard-to-diagnose UI bugs — flag them explicitly.

Flag:
- `@ObservedObject` used for a ViewModel created inside the same view — should be `@StateObject`
- `@StateObject` used for an injected ViewModel — takes unintended ownership
- `@EnvironmentObject` or `@Environment(MyModel.self)` used for feature-level dependencies
- business logic or use case calls embedded directly in `View` body, `.onAppear`, or `.task` closures
- `ForEach` with index-based or otherwise unstable IDs
- monolithic `body` with deeply nested conditionals — extract focused subviews
- `.onAppear + Task {}` without cancellation handling
- mixing `@Observable` and `ObservableObject` in the same feature without clear justification

### ViewModel state modeling
How state is structured in a ViewModel has direct consequences for rendering correctness, testability, and bug surface. The rules differ by OS era.

**The core problem with multiple independent boolean/optional properties:**
When a ViewModel exposes `isLoading`, `errorMessage`, `isEmpty`, and `orders` as separate properties, impossible states become representable — `isLoading = true` and `errorMessage = "Failed"` simultaneously is incoherent but nothing prevents it. This leads to defensive view logic, hard-to-reproduce bugs, and tests that assert multiple properties to verify a single conceptual state.

**Pre-iOS 17 (`ObservableObject`) — use a single state struct:**
With `ObservableObject`, every `@Published` property mutation fires `objectWillChange` separately. Updating three properties in a Combine sink or async callback emits up to three notifications, and the view may observe intermediate invalid states between them. Wrapping all state in a single struct solves both problems — one mutation, one emission, one consistent snapshot delivered to the view.

Prefer this structure:
- One `@Published private(set) var state: ScreenState` that owns the content lifecycle
- `ScreenState` is a struct containing a nested `ContentState` enum (`idle`, `loading`, `content(Data)`, `empty`, `error(String)`) plus any truly independent properties such as `isRefreshing` or `selectedID`
- All transitions are a single assignment to `state` — atomic and safe across async boundaries

**iOS 17+ (`@Observable`) — typed content state, separate independent properties:**
SwiftUI now tracks per-property access rather than whole-object observation, so multiple property mutations no longer cause cascading re-renders of unrelated views. The performance argument for a single struct largely disappears. However, the correctness argument does not — impossible states are still representable and still cause bugs.

Prefer this structure:
- A typed `ContentState` enum for the content lifecycle — the non-negotiable part in both eras
- Genuinely independent UI concerns (`isRefreshing`, `searchQuery`, `selectedID`) as separate stored properties — fine because `@Observable` handles re-render granularity automatically
- No boolean flag clusters (`isLoading` + `hasError` + `isEmpty`) — they compose into impossible states regardless of framework version

**How to decide if a property is truly independent:**
Ask: can this property change while the content is in *any* state (idle, loading, content, empty, error) and still make sense? If yes in all cases, it is independent. If some combinations are incoherent, it belongs in the typed enum.

Independent — separate property is appropriate:
- `isRefreshing` — the screen can show content *and* be refreshing simultaneously; coexists with `.content(data)` naturally
- `selectedID` — selection persists across loading cycles; orthogonal to content lifecycle
- `searchQuery` — user input exists regardless of whether data has loaded
- `isPresentingSheet` — sheet presentation is unrelated to data state

Not independent — belongs in `ContentState`:
- `isLoading` + `errorMessage` — if loading is true, error must be nil; some combinations are incoherent
- `isEmpty` — always derivable from content data; a separate flag that must stay in sync is redundant and a source of drift
- `hasLoadedOnce` + `isLoading` — these imply rules about each other that the type system should enforce

Secondary tell: if you find yourself writing `guard !isLoading else { return }` or `if isLoading && errorMessage == nil`, you are manually enforcing state machine rules that a typed enum would make impossible to violate.

**Testability benefit:**
A typed state means assertions are a single pattern match: `viewModel.contentState == .error("No connection")`. Asserting `!viewModel.isLoading && viewModel.errorMessage == "No connection" && viewModel.orders.isEmpty` is fragile, verbose, and obscures intent.

Flag:
- boolean flag clusters (`isLoading`, `hasError`, `isEmpty` as separate independent booleans) — impossible state risk
- multiple `@Published` properties mutated separately in a single logical action on pre-iOS 17 — intermediate invalid states leak to the view
- content lifecycle state spread across unrelated properties instead of a typed enum
- views with `if isLoading { } else if hasError { } else if isEmpty { }` chains — signals missing typed state in the ViewModel

### Composite screens and child ViewModels
When designing a new screen with multiple components, use this decision sequence to determine the correct ViewModel structure. Work through each step in order and stop at the first match.

**Step 1 — single data source?**
If all screen content comes from one use case call, use a single ViewModel with a typed `ContentState`. No child VMs needed. Stop here.

**Step 2 — are components fully independent?**
If each major component has its own use case, its own loading/error lifecycle, and its own user interactions with no dependency on other components, use self-contained child ViewModels. Each child view owns its VM via `@StateObject` (iOS 15) or `@State` (iOS 17+). The parent view is a layout container with minimal or no ViewModel. Shared data (auth, user context, global config) is injected into each child VM at init via repositories or services — not passed through a parent VM. Stop here.

**Step 3 — is coordination required?**
If any of the following are true, use a coordinating parent ViewModel that owns child VMs:
- Component B's load depends on component A's result
- A global action (refresh all, apply filter) must sequence or coordinate child loads
- A selection or state change in one component affects another component's data

In this pattern:
- The parent VM creates, owns, and holds child VMs as stored properties
- Child VM types are **protocol-typed** in the parent — required for independent testability
- The parent View passes child VMs into child views — it is the wiring point, not the owner
- Child views observe their VM but do not own it — `@ObservedObject` on iOS 15, plain property on iOS 17+
- Components are decoupled from each other — no widget references a sibling directly
- The parent observes child `ContentState` to drive sequencing; children have no knowledge of each other or the parent

**Step 4 — navigation from child ViewModels (applies to steps 2 and 3)**
A child VM must never hold a direct reference to the parent VM or coordinator. Navigation intent flows outward via closure or publisher injected at init:
- Use a closure for 1–2 navigation actions — simple, no extra type needed
- Use a `PassthroughSubject` publisher for components with multiple distinct navigation events — parent subscribes and routes
- The child declares *what happened*, the parent decides *where to go* — the child has no knowledge of the navigation destination

**Ownership summary:**
- Parent VM owns: child VM instances, loading sequencing, cross-component coordination, screen-level navigation state
- Child VM owns: its own `ContentState`, its own use case calls, its own interaction logic
- Parent View owns: wiring child VMs into child views, layout
- Child View owns: nothing — observes its injected VM only

Flag:
- reaching for a coordinating parent VM without a genuine coordination requirement — self-contained VMs are simpler and less coupled
- child view creating its own VM with `@StateObject` when an injected coordinated VM is required — breaks the ownership chain
- child VM holding a direct reference to the parent VM or coordinator — inverted dependency
- navigation actions handled entirely inside a child VM without delegation — couples child to navigation infrastructure
- single monolithic ViewModel for a screen where components have independent data sources and lifecycles — Massive ViewModel

## Dependency management
Prefer:
- initializer injection
- explicit constructor-based dependency passing
- composition roots / assembly layers
- protocol-based boundaries where substitution matters

Avoid:
- hidden dependencies
- uncontrolled singleton usage
- global mutable state
- service locators unless already established and tightly constrained

Call out hidden dependencies that hurt testability.

## Modular architecture
Prefer vertical feature slices over a thin horizontal Core. Features are self-contained vertical modules; shared infrastructure and domain contracts live in horizontal Core modules.

Preferred structure:
```
App (thin, composition root)
├── FeatureAuth        → imports CoreDomain, CoreNetworking, SharedUI
├── FeaturePayments    → imports CoreDomain, CoreNetworking, SharedUI
├── FeatureProfile     → imports CoreDomain, CorePersistence, SharedUI
├── CoreDomain         → pure Swift, zero infrastructure
├── CoreNetworking     → URLSession, auth adapters
├── CorePersistence    → Core Data / SwiftData stack
└── SharedUI           → design system, reusable views
```

Module roles:
- **Feature modules** — one per product feature; contain presentation, feature-specific use cases, and local view models. Import Core, never siblings.
- **CoreDomain** — entities, value objects, use case protocols, repository contracts. Pure Swift. No UIKit, SwiftUI, URLSession, or persistence imports.
- **CoreNetworking / CorePersistence** — infrastructure implementations of CoreDomain contracts. Import URLSession, Core Data, etc. here only.
- **SharedUI** — design system components, reusable views, no business logic.
- **App target** — composition root only. Wires modules together. Contains minimal logic.

Dependency direction rules:
- Arrows point inward only: Feature → Core. Never Feature → Feature.
- App is the only module that may import all other modules.
- CoreDomain must never import infrastructure modules.
- Circular dependencies are always wrong; treat them as a signal of a missing abstraction.

Access control discipline:
- `public` is a deliberate API contract, not a default. Only expose what cross-module callers actually need.
- Expose protocols, not concrete types, across module boundaries.
- Concrete implementations should rarely be `public`; prefer `internal`.
- Flag indiscriminate `public` usage on concrete types — it leaks implementation details and defeats module isolation.

When not to modularize:
- A small app with a single developer does not need 10+ SPM modules.
- Recommend modularization when build times are painful, teams work on parallel features, or enforced layer boundaries are needed.
- Premature modularization adds overhead without benefit.

Flag:
- feature modules importing sibling feature modules
- infrastructure types (`URLSession`, `NSManagedObject`) appearing in CoreDomain or Feature modules
- `public` used as default instead of deliberate API design
- SharedUI or Shared modules accumulating unrelated business logic
- App target containing logic beyond composition and wiring

## Testability
Prefer code that can be tested without UI, network, or persistence running.
Look for:
- unit-testable use cases
- unit-testable view models
- deterministic logic separated from side effects
- repository/service abstractions at meaningful boundaries

Flag code that is difficult to isolate or requires heavy integration setup.

## Error handling strategy
Use cases return `AnyPublisher<T, Error>` — type-erased errors are acceptable for lowest composition friction across modules.

The critical rule is where and how errors are translated, not what the final type is:
- Repository implementations must `mapError` from infrastructure errors to domain-meaningful errors before the error crosses the repository boundary. `URLError`, `DecodingError`, `NSError`, and other infrastructure-specific types must never reach a use case or ViewModel.
- The repository is the single seam where infrastructure language becomes domain language. Everything above it must be infrastructure-agnostic.
- Use cases pass errors through — they do not catch, transform, or suppress errors unless applying explicit domain policy.
- ViewModels receive `Error` and map it to explicit presentation state — a user-facing message, an error view state, or a recovery action. Never leave errors unhandled.
- ViewModels must not downcast `Error` to infrastructure types such as `URLError` — that is a boundary violation in disguise.

Flag:
- `URLError`, `DecodingError`, or `NSError` appearing in use cases or ViewModels
- repository `mapError` absent — raw infrastructure errors passed through unchecked
- `catch`, `replaceError(with:)`, or `try?` used without explicit error handling — silent error loss
- ViewModels downcasting `Error` to infrastructure-specific types
- error states not modeled in ViewModel output — errors swallowed without UI consequence

## Model boundaries
Keep these models separate where appropriate:
- API DTOs
- persistence models
- domain models
- presentation/view data models

Call out leaked DTOs, missing mappers, and over-coupling to backend or storage schemas.

## Readability and cohesion
Prefer code that is:
- readable
- intention-revealing
- cohesive
- minimally coupled
- easy to navigate

Encourage:
- meaningful names
- focused functions
- early returns over deep nesting
- local reasoning
- comments that explain why, not what

Flag:
- god classes
- large files with mixed concerns
- vague helpers/managers
- utility dumping grounds
- excessive indirection without value
- cleverness over clarity

## Anti-patterns to actively flag
- Massive ViewModel
- Massive ViewController
- business logic in SwiftUI Views / UIViewController
- repositories doing mapping, caching, networking, policy, and orchestration all at once
- service objects with unrelated responsibilities
- domain depending on infrastructure details
- DTOs used directly in UI
- singletons accessed throughout the app
- large protocols with unrelated methods
- side-effect-heavy code with no isolation
- hidden threading assumptions
- unstructured async logic
- god modules / utility files
- premature abstraction
- overuse of static functions instead of explicit collaborators

## Screen and ViewModel review

When asked to review a screen or ViewModel by name without code provided, always locate and read all relevant files first — the view, its ViewModel, and any use cases it calls directly. Do not respond before reading the code.

Then apply all guidance sections naturally and respond using the `## How to respond` format.

**Priority checklist (opt-in):**
When the request explicitly says "use the priority checklist" or "run the screen review checklist", apply these steps in order and skip any that are not relevant to the screen:

Always check:
1. **Layer boundaries** — business logic or infrastructure imports present in the view or ViewModel?
2. **ViewModel structure** — apply the Step 1–3 decision from `### Composite screens and child ViewModels`. Is the current structure justified?
3. **State modeling** — typed `ContentState` or boolean flag cluster? Correct approach for the deployment target?
4. **Property wrapper ownership** — `@StateObject`, `@ObservedObject`, and `@State` used with correct ownership semantics?
5. **Error handling** — infrastructure errors mapped at the repository boundary? Errors modeled in ViewModel output, not silently swallowed?

Check only when the relevant construct is present:
- **View decomposition** — if `body` is large or contains deeply nested conditionals
- **`ForEach` identity** — if `ForEach` is used, are IDs stable and non-index-based?
- **Child VM navigation** — if child ViewModels are present, does navigation delegate via closure or publisher?

Then respond using the `## How to respond` format.

## How to respond
Be direct, concrete, and technically precise.
Do not give vague advice.

When reviewing code, use this structure:
1. Summary
2. What is good
3. Issues found
4. Why they matter
5. Suggested improvements
6. Refactoring priority
7. Example improved direction if useful

Classify issues where possible, for example:
- SOLID violation
- Clean Architecture boundary violation
- MVVM misuse
- testability problem
- readability/cohesion issue
- concurrency risk

Distinguish clearly between:
- critical architectural issues
- medium-priority design problems
- minor cleanup suggestions

Prefer the smallest safe change that materially improves the code.
Preserve behavior.
