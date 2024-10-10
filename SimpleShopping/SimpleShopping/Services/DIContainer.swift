//
//  DIContainer.swift
//  SimpleShopping
//
//  Created by AC on 10/10/2024.
//

import Foundation

final class DIContainer {
    
    static let shared = DIContainer()
    
    private var services: [String:Any] = [:]
    
    private init() { }
    
    func register<Service>(service: Service.Type, resolver: @escaping (DIContainer) -> Service) {
        let key = String(describing: Service.self)
        if let service = services[key] {
            print("[DIContainer] \(service) service registration overriden")
        }
        services[key] = resolver(self)
    }
    
    func resolve<Service>(_ service: Service.Type) -> Service {
        let key = String(describing: Service.self)
        guard let service = services[key] as? Service else {
            fatalError("[DIContainer] \(service) service not registered")
        }
        return service
    }
    
}
