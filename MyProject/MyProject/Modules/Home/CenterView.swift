//
//  CenterView.swift
//  MyProject
//
//  Created by alfian on 28/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import SlideOutMenu

class CenterView: UIViewController, ICenterViewController {
    var delegate: ISlideOutMenuDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Organize, target: self, action: #selector(self.actionButton(_:)))
    }
    
    @objc func actionButton(sender: UIButton) {
        self.delegate.toggleLeftPanel()
    }
}