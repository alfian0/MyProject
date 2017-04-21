//
//  HomeView.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

import UIKit
import SlideOutMenu

protocol IHomeView : class {
    func showLoading()
    func hideLoading()
    func failedToFetch(error: NSError)
}

class HomeView: UIViewController, IHomeView {
	var presenter: IHomePresenter!

    @IBOutlet weak var appLauncherButton: UIButton!
    
    init(){
        super.init(nibName: "HomeView", bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        appLauncherButton.addTarget(self, action: #selector(launchApp), forControlEvents: .TouchUpInside)
    }
    
    func launchApp() {
        AppLauncher().launchView()
    }
    
    func showLoading() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func hideLoading() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func failedToFetch(error: NSError) {
        self.showErrorAlert(error)
    }
}