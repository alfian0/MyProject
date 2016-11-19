//
//  HomeInteractor.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

protocol IHomeInteractor: class {
    weak var presenter: IHomePresenter? { get set }
    func getBuckets(id: Int)
}

class HomeInteractor : IHomeInteractor{
    weak var presenter: IHomePresenter?
    
    let service:IService
    
    init(service:IService){
        self.service = service
    }
    
    func getBuckets(id: Int) {
        self.service.getBuckets(id, success: { (response) in
            guard let response = response else {
                return
            }
            guard let thisError = response.error else {
                return
            }
            self.presenter?.failedToFetch(thisError.nsError)
            }) { (_, _, error) in
                guard let thisError = error else {
                    return
                }
                self.presenter?.failedToFetch(thisError)
        }
    }
}
