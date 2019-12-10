//
//  DashboardRouter.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter: DashboardRouterProtocol {
    static func createDashBoardVC() -> UIViewController {
        let vc = UIUtitls.createViewController(storyBoardName: "Main", withIdentifier: "DashboardVC") as? DashboardVC
        let presenter: DashboardPresenterProtocol & DashboardInteractorOutputProtocol = DashboardPresenter()
        let interactor: DashboardInteractorInputProtocol = DashboardInteractor()
        let router: DashboardRouterProtocol = DashboardRouter()
        
        vc?.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return vc!
    }
}
