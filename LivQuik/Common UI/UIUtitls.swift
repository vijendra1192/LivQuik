//
//  File.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation
import UIKit
/**
# Responsibility - This one is builder design pattern i.e create and reuse its UI
*/
class UIUtitls {
    class func createViewController(storyBoardName name: String, withIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: withIdentifier)
        return controller
    }
}
