//
//  UIViewControllerExtension.swift
//  TableStyle
//
//  Created by alfian on 16/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(error: NSError) {
        let message: String = error.localizedDescription
        self.showErrorAlertWithMessage(message, title: "Error")
    }
    
    func showErrorAlertWithMessage(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
}