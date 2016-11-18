//
//  IAppRouter.swift
//  TableStyle
//
//  Created by alfian on 16/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import Swinject

public protocol IAppRouter : class {
    
    var resolver: ResolverType { get }
    
    func presentModule(module:Module,parameters:[String:Any])
    
    func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool)
    func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool, completion:(() -> Void)?)
    func displayViewWithoutDismiss(view:UIViewController?,animateDisplay:Bool)
    func dismissViewFromNavigationController(animated:Bool,completion: ()->())
    
    func presentViewController(view:UIViewController, animated:Bool, completion:(() -> Void)?)
    func dismissPresentedViewController(animated:Bool, completion:(() -> Void)?)
    
    func stackToViewControllerType<T: UIViewController>(type: T.Type) -> [UIViewController]?
    func setViewControllersToStack(controllers:[UIViewController], animated: Bool)
    
    func resetStackToView(view: UIViewController, animated: Bool)
}