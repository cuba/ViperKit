//
//  SampleInteractor.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation
import ViperKit

class SampleInteractor: ViperInteractor {
    static let colors:[UIColor] = [UIColor.white, UIColor.green, UIColor.red, UIColor.cyan]
    var presenter: SamplePresenter
    var router: ViperRouter?
    
    var currentColorIndex = 0 {
        didSet {
            if currentColorIndex >= SampleInteractor.colors.count {
                currentColorIndex = 0
            }
        }
    }
    
    open var activityCounter = 0 {
        didSet {
            guard activityCounter >= 0 else {
                activityCounter = 0
                return
            }
            
            if activityCounter > 0 {
                self.presenter.showActivityIndicator()
            } else {
                self.presenter.hideActivityIndicator()
            }
            
            presenter.showActivityCount(count: activityCounter)
        }
    }
    
    var currentColor: UIColor {
        return SampleInteractor.colors[currentColorIndex]
    }
    
    init(_ viewController: ViewController) {
        presenter = SamplePresenter(viewController)
        router = viewController
    }
    
    override func viewWillAppear() {
        presenter.showActivityCount(count: 0)
    }
    
    func performPresent() {
        let viewController = SampleAssembly.createSampleViewController()
        viewController.sampleInteractor?.currentColorIndex = currentColorIndex + 1
        let navigationController = UINavigationController(rootViewController: viewController)
        let buttonItem = SampleAssembly.getCloseBarButton(target: self, action: #selector(SampleInteractor.closeWindow))
        viewController.navigationItem.leftBarButtonItems = [buttonItem]
        presenter.present(navigationController, animated: true, completion: nil)
    }
    
    func performReplace() {
        let viewController = SampleAssembly.createSampleViewController()
        router?.replace(viewController, options: .transitionFlipFromLeft)
    }
    
    func performNavigate() {
        let viewController = SampleAssembly.createSampleViewController()
        viewController.sampleInteractor?.currentColorIndex = currentColorIndex
        router?.navigateTo(viewController, animated: true)
    }
    
    func performLongTask() {
        SampleTaskDispatcher.performLongTask(seconds: 5, successHandlerWrapper({ (result: String) in
            self.presenter.presentAlert(title: result, message: nil, okHandler: nil)
        }))
    }
    
    func performLongTaskWithError() {
        SampleTaskDispatcher.performLongTask(seconds: 5, successful: false, successHandlerWrapper({ (result: String) in
            self.presenter.presentAlert(title: result, message: nil, okHandler: nil)
        }))
    }
    
    @objc func closeWindow() {
        router?.dismiss(animated: true, completion: nil)
    }
    
    open func successHandlerWrapper<R>(_ successHandler: @escaping (R) -> Void) -> (R?, Error?) ->Void {
        return successHandlerWrapper(silent: false, successHandler)
    }
    
    open func successHandlerWrapper<R>(silent: Bool, _ successHandler: @escaping (R) -> Void) -> (R?, Error?) ->Void {
        
        return requestHandlerWrapper(silent: silent) { response, error in
            if let response = response {
                successHandler(response)
            }
        }
    }
    
    open func requestHandlerWrapper<R>(silent: Bool, _ responseHandler: @escaping (R?, Error?) -> Void) -> (R?, Error?) ->Void {
        
        if !silent {
            activityCounter += 1
        }
        
        return { (response: R?, error: Error?) in
            if let error = error, !silent {
                self.presenter.present(error)
            }
            
            responseHandler(response, error)
            
            if !silent {
                self.activityCounter -= 1
            }
        }
    }
}
