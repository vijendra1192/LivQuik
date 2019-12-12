//
//  DashboardPresenter.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

class DashboardPresenter: DashboardPresenterProtocol {
    weak var view: DashboardVCProtocol?
    var interactor: DashboardInteractorInputProtocol?
    var router: DashboardRouterProtocol?
    
    var pagination: Pagination<Articles> = Pagination(pageSize: 20)
    
    func viewDidLoad() {
        pagination.reset()
        getNewsData()
    }
    
    func reset() {
        pagination.reset()
    }
    
    func getNewsData() {
        if pagination.isLoading {
            return
        }
        pagination.start()
        
        if pagination.data.count == 0 {
//            view?.showLoading(message: R.string.localizable.alertLoaderPlease_wait())
        } else {
            view?.showFooterView(isHidden: false)
        }
        interactor?.newsDetails(pageNo: pagination.page)
    }
    
    func willDisplayCell(at index: Int) {
        if pagination.canLoadNow(index: index) {
            getNewsData()
        }
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func retrieveNewsData(response: News?) {
        guard let data = response else {
            return
        }
        pagination.success(objects: data.articles)
        view?.showNewsData(data: pagination.data)
        print("total page count is \(pagination.data.count)")
    }
    
    func onErrorView(response: ResponseError) {
        view?.showFooterView(isHidden: true)
    }
}
