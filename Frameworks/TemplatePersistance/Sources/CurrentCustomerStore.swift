import Foundation
import TemplateApplication

public protocol CurrentCustomerStore {
    func getCurrentCustomer() -> Customer?
    func setCurrentCustomer(_ customer: Customer?)
}

public class DefaultCurrentCustomerStore: CurrentCustomerStore {
    private var customer: Customer?
    
    public init(customer: Customer? = nil) {
        self.customer = customer
    }
    
    public func getCurrentCustomer() -> Customer? {
        customer
    }
    
    public func setCurrentCustomer(_ customer: Customer?) {
        self.customer = customer
    }
}
