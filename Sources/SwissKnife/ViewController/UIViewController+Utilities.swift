import UIKit

extension UIViewController {
    static func topViewController() -> UIViewController? {
        return self.topViewControllerWithRootViewController(Application.shared.keyWindow?.rootViewController)
    }

    fileprivate static func topViewControllerWithRootViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        if let rootViewController = rootViewController {
            if rootViewController.isKind(of: UITabBarController.self),
                let tabBarController = rootViewController as? UITabBarController {
                return self.topViewControllerWithRootViewController(tabBarController.selectedViewController)
            } else if rootViewController.isKind(of: UINavigationController.self),
                let navigationController = rootViewController as? UINavigationController {
                return self.topViewControllerWithRootViewController(navigationController.visibleViewController)
            } else if rootViewController.presentedViewController != nil {
                return self.topViewControllerWithRootViewController(rootViewController.presentedViewController)
            } else {
                return rootViewController
            }
        }

        return rootViewController
    }
 
}

fileprivate class Application {
    static var shared: UIApplication {
        let sharedSelector = NSSelectorFromString("sharedApplication")
        guard UIApplication.responds(to: sharedSelector) else {
            fatalError("[Extensions cannot access Application]")
        }
        let shared = UIApplication.perform(sharedSelector)
        return shared?.takeUnretainedValue() as! UIApplication
    }
}
