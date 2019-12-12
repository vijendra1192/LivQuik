//
//  DashboardProtocols.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

/**
# Responsibility - This protocol create a request for data
*/
protocol DashboardVCProtocol: class {
    var presenter: DashboardPresenterProtocol? {get set}
    
    func showNewsData(data: [Articles])
    func showFooterView(isHidden: Bool)
}

/**
# Responsibility - This protocol is responsible for bussiness login, data formatting and routing one VC to another VC etc.
*/
protocol DashboardPresenterProtocol: class {
    var view: DashboardVCProtocol? {get set}
    var interactor: DashboardInteractorInputProtocol? {get set}
    var router: DashboardRouterProtocol? {get set}
    
    func viewDidLoad()
    func willDisplayCell(at index: Int)
}

/**
# Responsibility - This protocol make api call
*/
protocol DashboardInteractorInputProtocol: class {
    var presenter: DashboardInteractorOutputProtocol? {get set}
    
    func newsDetails(pageNo: Int)
}

/**
# Responsibility - Once output come from api, interactor submit their output to presenter
*/
protocol DashboardInteractorOutputProtocol: class {
    func retrieveNewsData(response: News?)
    func onErrorView(response: ResponseError)
}

/**
# Responsibility - Ony navigation from one VC to other VC
*/
protocol DashboardRouterProtocol: class {
    
}
