//
//  SamplePresenter.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation
import ViperKit

class SamplePresenter: ViperPresenter<ViewController> {
    func showActivityCount(count: Int) {
        view?.showActivityCount(count: count)
    }
    
    func showActivityIndicator() {
        view?.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        view?.hideActivityIndicator()
    }
}
