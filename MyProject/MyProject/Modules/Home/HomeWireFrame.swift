//
//  HomeWireFrame.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//


protocol IHomeWireFrame: class {
    func presentView(viewModel:HomeViewModel)
}

class HomeWireFrame: IHomeWireFrame {

    let appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(viewModel: HomeViewModel) {
        let view = appRouter.resolver.resolve(HomeView.self, arguments:(appRouter, viewModel))!
        appRouter.resetStackToView(view, animated: false)
    }
}