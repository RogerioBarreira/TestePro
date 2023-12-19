//
//  Coordinator.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import Foundation
import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func start() {
        let vc = ListViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
