//
//  AppLauncher.swift
//  MyProject
//
//  Created by PayPro on 4/21/17.
//  Copyright © 2017 alfian.official.organization. All rights reserved.
//

import UIKit

class AppLauncher: NSObject {
    
    func launchView() {
        if let window = UIApplication.sharedApplication().keyWindow {
            let view = UIView(frame: window.frame)
                view.backgroundColor = UIColor.whiteColor()
                view.frame = CGRect(x: window.frame.width - 10, y: window.frame.height - 10, width: 10, height: 10)
            
            window.addSubview(view)
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: { 
                view.frame = window.frame
                }, completion: { (completed) in
                    
            })
        }
    }
}