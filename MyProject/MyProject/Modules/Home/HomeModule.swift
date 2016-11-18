//
//  HomeInteractor.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

import Foundation

class HomeModule: IModule {
    let appRouter: IAppRouter

    init(appRouter:IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters:[String:Any]) {
        let wireframe = appRouter.resolver.resolve(IHomeWireFrame.self, argument:appRouter)!
            wireframe.presentView(HomeViewModel())
    }
}
