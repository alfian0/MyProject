//
//  HomeView.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

import UIKit

protocol IHomeView : class {

}

class HomeView: UIViewController, IHomeView {
 
	var presenter: IHomePresenter!

    init(){
        super.init(nibName: "HomeView", bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        self.automaticallyAdjustsScrollViewInsets = true
        self.edgesForExtendedLayout = .None
        
        let navigationBar: UINavigationBar = (self.navigationController?.navigationBar)!
            navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            navigationBar.shadowImage = UIImage()
            navigationBar.backgroundColor = UIColor.clearColor()
    }
}