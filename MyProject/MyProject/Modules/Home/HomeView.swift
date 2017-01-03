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

class HomeView: ContainerController, IHomeView {
	var presenter: IHomePresenter!

    init(){
        super.init(nibName: "HomeView", bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.navigationController?.navigationBarHidden = true
        self.presenter.doGetBucket(11345)
        self.view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
//        self.automaticallyAdjustsScrollViewInsets = true
//        self.edgesForExtendedLayout = .None
        
//        let navigationBar: UINavigationBar = (self.navigationController?.navigationBar)!
//            navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//            navigationBar.shadowImage = UIImage()
//            navigationBar.backgroundColor = UIColor.clearColor()
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

extension HomeView: ISlideOutMenu {
    func setCenterViewController() -> ICenterViewController {
        let cv = CenterView()
            cv.presenter = self.presenter
        return cv
    }
    
    func setLeftViewController() -> UIViewController? {
        let lv = LeftView()
            lv.presenter = self.presenter
        return lv
    }
    
    func setRightViewController() -> UIViewController? {
        let rv = RightView()
            rv.presenter = self.presenter
        return rv
    }
}