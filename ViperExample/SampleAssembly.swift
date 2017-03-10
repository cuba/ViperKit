//
//  SampleAssembly.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation
import UIKit

class SampleAssembly {
    static func createSampleViewController() -> ViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        viewController.interactor = SampleInteractor(viewController)
        return viewController
    }
    
    static func getCloseBarButton(target: Any, action: Selector) -> UIBarButtonItem {
        let button: UIButton = UIButton(type: .custom)
        button.clipsToBounds = true
        button.setTitle("Close", for: .normal)
        
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }
}
