//
//  HomeInteractor.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//
import Foundation

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
            guard let buckets = response?.buckets else {
                self.presenter?.failedGetBucket(NSError.errorWithCode(404, message: "Buckets is empty."))
                return
            }
            self.presenter?.successGetBucket()
            }) { (_, _, error) in
                guard let thisError = error else {
                    return
                }
                self.presenter?.failedGetBucket(thisError)
        }
    }
}
