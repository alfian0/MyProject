//
//  HomeInteractor.swift
//  GoProducts
//
//  Created by Alfiansyah.
//  Copyright © 2016 Go-jek. All rights reserved.
//

protocol IHomeInteractor: class {
    weak var presenter: IHomePresenter? { get set }
}

class HomeInteractor : IHomeInteractor{
    weak var presenter: IHomePresenter?
}
