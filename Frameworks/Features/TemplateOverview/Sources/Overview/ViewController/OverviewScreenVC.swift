//
//  DashboardScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import DevToolsCore
import DevToolsUI
import DevToolsLocalization
import TemplateDesignSystem

class OverviewScreenVC: RuntimeLocalizedUIViewController {
    // MARK: Properties
    let viewModel: OverviewScreenVM
    lazy var rootView = OverviewScreenView.RootView()
    lazy var dataSource = makeDataSource()
    private var cancelBag = Set<AnyCancellable>()
    private var initialRender = true
    
    // MARK: Lifecycle
    init(viewModel: OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Private
extension OverviewScreenVC {
    private func setup() {
        rootView.tableView.dataSource = dataSource
        rootView.tableView.delegate = self
        bindActions()
        bindOutput()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        runtimeLocalizedTitleKey = AppStrings.Tabbar.Tabs.Overview.titleKey
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: rootView.profileButton),
            UIBarButtonItem(customView: rootView.notificationsButton)
        ]
        rootView.profileButton.configure(text: viewModel.customer.getInitials())
    }
    
    private func bindOutput() {
        bindSectionsChanged()
        bindIsRefreshing()
    }
    
    private func bindSectionsChanged() {
        viewModel.tableSnapshot
            .debounce(
                for: .milliseconds(initialRender ? 0 : UIConstant.TableView.updateDebounce),
                scheduler: RunLoop.main
            )
            .receiveOnMainThread()
            .sink { [weak self] snapshot in
                self?.dataSource.apply(snapshot)
                self?.initialRender = false
            }
            .store(in: &cancelBag)
    }
    
    private func bindIsRefreshing() {
        viewModel.isRefreshing
            .receiveOnMainThread()
            .dropFirst()
            .sink { [weak self] isRefreshing in
                self?.rootView.configureIsRefreshing(isRefreshing)
            }
            .store(in: &cancelBag)
    }
    
    private func bindActions() {
        bindNotificationsTapAction()
        bindProfileTapAction()
        bindPullToRefresh()
    }
    
    private func bindNotificationsTapAction() {
        rootView.didTapNotificationsButton
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.didTapNotifications()
            })
            .store(in: &cancelBag)
    }
    
    private func bindProfileTapAction() {
        rootView.didTapProfileButton
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.didTapProfile()
            })
            .store(in: &cancelBag)
    }
    
    private func bindPullToRefresh() {
        rootView.didPullToRefresh
            .receiveOnMainThread()
            .sink(receiveValue: { [weak self] _ in
                self?.viewModel.didPullToRefresh()
            })
            .store(in: &cancelBag)
    }
}
