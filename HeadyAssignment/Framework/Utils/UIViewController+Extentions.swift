//
//  UIViewController+Extentions.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 10/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import UIKit
import JGProgressHUD
import ReactiveKit

extension UIViewController {

    var inNavigation: UINavigationController {
        return UINavigationController(rootViewController: self)
    }

    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar || false
    }
}

extension UIViewController {

    @objc func showLoading() {
        let view = self.view
        if let hud = JGProgressHUD.allProgressHUDs(in: view!).first {
            hud.accessibilityLabel = "Processing"
            guard !hud.isVisible else { return }
            hud.show(in: view!, animated: true)
        } else {
            let hud = JGProgressHUD(style: .extraLight)
            hud.position = .center
            hud.show(in: view!, animated: true)
        }
    }

    @objc func hideLoading() {
        let view = self.view
        guard let hud = JGProgressHUD.allProgressHUDs(in: view!).first else { return }
        guard hud.isVisible else { return }
        hud.dismiss(animated: true)
    }

    @objc func loadingFailed() {
        let view = self.view
        guard let hud = JGProgressHUD.allProgressHUDs(in: view!).first else { return }
        guard hud.isVisible else { return }
        hud.dismiss(animated: true)
    }
}
