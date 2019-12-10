//
//  DashboardInteractor.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

class DashboardInteractor: DashboardInteractorInputProtocol {
    var presenter: DashboardInteractorOutputProtocol?
    
    func newsDetails() {
        ApiRequestManager.shared().makeNewsApiCall(pageNo: 2) {[weak self] (response) in
            switch response {
            case .success(let response):
                let news = response as? NewsData
                self?.presenter?.retrieveNewsData(response: news)
                break
                
            case .failure(let error):
                self?.presenter?.onErrorView(response: error)
                break
            }
        }
    }
}
