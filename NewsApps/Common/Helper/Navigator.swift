//
//  Navigator.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import UIKit

public protocol Navigator: AnyObject {
    func push(viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func present(
        viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
}

public extension Navigator {
    func push(viewController: UIViewController) {
        push(viewController: viewController, animated: true)
    }
    
    func popViewController() {
        popViewController(animated: true)
    }
    
    func present(viewController: UIViewController) {
        present(viewController: viewController, animated: true, completion: nil)
    }
    
    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        dismissViewController(animated: true, completion: nil)
    }
}

final class NavigatorImpl: Navigator {
    private weak var viewController: UIViewController?
    
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func push(viewController: UIViewController, animated: Bool) {
        if let navigationController = self.viewController as? UINavigationController {
            navigationController.pushViewController(viewController, animated: animated)
        } else {
            self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func popViewController(animated: Bool) {
        if let navigationController = self.viewController as? UINavigationController {
            navigationController.popViewController(animated: animated)
        } else {
            self.viewController?.navigationController?.popViewController(animated: animated)
        }
    }
    
    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.viewController?.present(viewController, animated: animated, completion: completion)
    }
    
    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: animated, completion: completion)
    }
}

