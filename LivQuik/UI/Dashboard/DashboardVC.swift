//
//  DashboardVC.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    // MARK: Variables
    var presenter: DashboardPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DashboardVC: DashboardVCProtocol {
    
}
