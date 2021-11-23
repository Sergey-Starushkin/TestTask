//
//  UIViewControllerExtansion.swift
//  TestTask
//
//  Created by Sergey Starushkin on 20.11.21.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    func alert(title: String? = nil, message: String? = nil, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectVC(vc: UIViewController) {
        if let destinationViewController = navigationController?.viewControllers.filter({$0 .isKind(of: vc.classForCoder)
        }).first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        } else {
            let pushVC = vc
            navigationController?.pushViewController(pushVC, animated: true)
        }
    }
    
}
