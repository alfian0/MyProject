//
//  HomePresenter.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//
import Foundation

protocol IHomePresenter: class {
    func doGetBucket(id: Int)
    func successGetBucket()
    func failedGetBucket(error: NSError)
    func successAddEvent()
    func failedAddEvent(error: NSError)
}

class HomePresenter : IHomePresenter {
	weak private var view: IHomeView!
	private let interactor: IHomeInteractor
    private let wireframe: IHomeWireFrame
    private let viewModel: HomeViewModel

    init(view: IHomeView, viewModel:HomeViewModel, interactor: IHomeInteractor, wireframe: IHomeWireFrame) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.viewModel = viewModel
    }
    
    func doGetBucket(id: Int) {
        self.view.showLoading()
        self.interactor.getBuckets(id)
    }
    
    func successGetBucket() {
        self.view.hideLoading()
    }
    
    func failedGetBucket(error: NSError) {
        self.view.hideLoading()
        self.view.failedToFetch(error)
    }
    
    func successAddEvent() {
        self.view.failedToFetch(NSError.errorWithCode(200, message: "Success add event."))
    }
    
    func failedAddEvent(error: NSError) {
        self.view.failedToFetch(error)
    }
}


