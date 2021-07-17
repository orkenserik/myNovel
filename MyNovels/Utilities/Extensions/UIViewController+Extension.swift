//
//  UIViewController.swift
//  Randlook
//
//  Created by orken serik on 9/10/19.
//  Copyright © 2019 orken serik. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// shows an UIAlertController alert with error title and message
    public func showError(_ title: String, message: String? = nil) {
        if !Thread.current.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.showError(title, message: message)
            }
            return
        }
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.view.tintColor = UIWindow.appearance().tintColor
        controller.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    
    public func customStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views )
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }
    
    func share(text: String, imageName: String? = nil, link: String) {
        var shareAll : [Any] = []
        if let imageName = imageName {
            if let image = UIImage(named: imageName) {
                shareAll.append(image)
            }
        }
        if let myWebsite = NSURL(string: link) {
            shareAll.append(myWebsite)
        }
        shareAll.append(text)

        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}


extension UIViewController {
//    func add(_ child: UIViewController) {
//        addChild(child)
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


// MARK: - Alert
extension UIViewController {
  public func showAlert(_ title: String, _ message: String, _ completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.popoverPresentationController?.sourceView = view
    alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: { _ in
      if let completion = completion {
        completion()
      }
    }))
    present(alert, animated: true, completion: nil)
  }
  
  public func showAlert(
    _ title: String,
    _ message: String,
    _ actionButtonTitle: String,
    _ cancelButtonTitle: String? = nil,
    _ completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.popoverPresentationController?.sourceView = view
    alert.addAction(UIAlertAction(title: actionButtonTitle, style: .default, handler: { _ in
      if let completion = completion {
        completion()
      }
    }))
    let cancelButtonTitle = cancelButtonTitle ?? "Отмена"
    alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  public func showOkAlert(
    _ title: String,
    _ message: String,
    _ okButtonTitle: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.popoverPresentationController?.sourceView = view
    alert.addAction(UIAlertAction(title: okButtonTitle, style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
