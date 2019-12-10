//
//  DashboardProtocols.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

protocol DashboardVCProtocol: class {
    var presenter: DashboardPresenterProtocol? {get set}
}

protocol DashboardPresenterProtocol: class {
    var view: DashboardVCProtocol? {get set}
    var interactor: DashboardInteractorInputProtocol? {get set}
    var router: DashboardRouterProtocol? {get set}
    
    func viewDidLoad()
}

protocol DashboardInteractorInputProtocol: class {
    var presenter: DashboardInteractorOutputProtocol? {get set}
    
    func newsDetails()
}

protocol DashboardInteractorOutputProtocol: class {
    func retrieveNewsData(response: NewsData?)
    func onErrorView(response: ResponseError)
}

protocol DashboardRouterProtocol: class {
    
}
