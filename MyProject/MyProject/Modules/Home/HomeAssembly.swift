//
//  HomeAssembly.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

import Foundation
import Swinject

class HomeAssembly: AssemblyType {

    func assemble(container: Container) {
        container.register(IHomeInteractor.self) { _ in
            HomeInteractor()
        }

        container.register(IHomeWireFrame.self) { (r, appRouter: IAppRouter) in
            HomeWireFrame(appRouter: appRouter)
        }

        container.register(IHomePresenter.self) { (r, view: IHomeView, viewModel:HomeViewModel, appRouter: IAppRouter) in
            let interactor = r.resolve(IHomeInteractor.self)!
            let wireframe = r.resolve(IHomeWireFrame.self, argument: appRouter)!
            let presenter = HomePresenter(view: view, viewModel:viewModel, interactor: interactor, wireframe: wireframe)
            interactor.presenter = presenter
            return presenter
        }

        container.register(HomeView.self) {  (r, appRouter: IAppRouter, viewModel:HomeViewModel) in
            let view = HomeView()
            let presenter = r.resolve(IHomePresenter.self, arguments: (view as IHomeView,viewModel:viewModel, appRouter))!
            view.presenter = presenter

            return view
        }

    }

}