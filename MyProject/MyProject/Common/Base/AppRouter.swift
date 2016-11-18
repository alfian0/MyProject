//
//  AppRouter.swift
//  TableStyle
//
//  Created by alfian on 16/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import Swinject

class AppRouter: IAppRouter {
    private let rootVC:UIViewController!
    private let assembler:Assembler!
    private let modules : [String:(appRouter:IAppRouter)->IModule]
    private let navigationController:UINavigationController?
    
    init(rootVC:UIViewController, navigationController:UINavigationController?, assembler:Assembler, modules:[String:(appRouter:IAppRouter)->IModule]){
        self.rootVC = rootVC
        self.navigationController = navigationController
        self.assembler = assembler
        self.modules = modules
    }
    
    var resolver: ResolverType {
        return assembler.resolver
    }
    
    func presentModule(module:Module,parameters:[String:Any]){
        if let moduleConstuctor = modules[module.routePath] {
            let module = moduleConstuctor(appRouter: self)
            module.presentView(parameters)
        }
    }
    
    
    func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool){
        displayView(view, animateDismiss:animateDismiss, animateDisplay:animateDisplay, completion:nil)
    }
    
    func displayView(view:UIViewController?, animateDismiss:Bool, animateDisplay:Bool, completion:(() -> Void)?){
        rootVC.dismissViewControllerAnimated(animateDismiss, completion: {() in
            if(view != nil){
                self.rootVC.presentViewController(view!, animated: animateDisplay, completion: completion)
            }
        })
    }
    
    func displayViewWithoutDismiss(view:UIViewController?,animateDisplay:Bool)
    {
        view?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(view!, animated: true)
    }
    
    func stackToViewControllerType<T: UIViewController>(type: T.Type) -> [UIViewController]? {
        if let array = navigationController?.viewControllers {
            var controllers: [UIViewController] = [UIViewController]()
            for vc in array {
                if let _ = vc as? T {
                    return controllers
                }
                controllers.append(vc)
            }
        }
        return nil
    }
    
    func setViewControllersToStack(controllers:[UIViewController], animated: Bool) {
        for vc in controllers {
            if navigationController?.viewControllers.indexOf(vc) == nil {
                navigationController?.viewControllers.insert(vc, atIndex: (navigationController?.viewControllers.count)! - 1)
            }
        }
        navigationController?.setViewControllers(controllers, animated: animated)
    }
    
    func dismissViewFromNavigationController(animated:Bool,completion:()->())
    {
        navigationController?.popViewControllerAnimated(true)
        completion()
//        navigationController?.popViewControllerWithHandler(animated,completion:completion)
    }
    
    func dismissPresentedViewController(animated:Bool, completion:(() -> Void)?) {
        navigationController?.presentedViewController?.dismissViewControllerAnimated(animated, completion: completion)
    }
    
    func presentViewController(view:UIViewController, animated:Bool, completion:(() -> Void)?) {
        view.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.rootVC.presentViewController(view, animated: animated, completion: completion)
    }
    
    func resetStackToView(view: UIViewController, animated: Bool) {
        navigationController?.setViewControllers([view], animated: true)
    }
}

extension AppRouter {
    private class func createAppRouter() -> IAppRouter {
        let vc = UIApplication.sharedApplication().delegate?.window??.rootViewController!
        
        var modules : [String:(appRouter:IAppRouter)->IModule] = [ : ]
            modules[Module.Home.routePath] = {(appRouter:IAppRouter) in HomeModule(appRouter:appRouter)}
        
        let assembler = Assembler()
            assembler.applyAssemblies(
                [
                    CommonAssembly()
                ]
            )
            assembler.applyAssemblies(
                [
                    HomeAssembly()
                ]
            )
        return AppRouter(rootVC: vc!, navigationController:getNavigationController(), assembler:assembler, modules: modules)
    }
    
    private class func getNavigationController() -> UINavigationController {
        let nc = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController ?? UINavigationController()
        return nc
    }
    
    class var sharedInstance : IAppRouter {
        struct Singleton {
            static let instance = AppRouter.createAppRouter()
        }
        return Singleton.instance
    }
}
