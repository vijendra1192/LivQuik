//
//  DashboardPresenter.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

class DashboardPresenter: DashboardPresenterProtocol {
    var view: DashboardVCProtocol?
    var interactor: DashboardInteractorInputProtocol?
    var router: DashboardRouterProtocol?
    
    func viewDidLoad() {
        interactor?.newsDetails()
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func retrieveNewsData(response: NewsData?) {
        guard let data = response else {
            return
        }
    }
    
    func onErrorView(response: ResponseError) {

    }
}
