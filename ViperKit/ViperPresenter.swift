//
//  ViperPresenter.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation

open class ViperPresenter<V: ViperView> {
    open var view: V?
    
    public init(view: V) {
        self.view = view
    }
    
    open func showActivityIndicator() {
        view?.showActivityIndicator()
    }
    
    open func hideActivityIndicator() {
        view?.hideActivityIndicator()
    }
    
    open func presentAlert(title: String?, message: String? = nil,  okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    
    open func presentCancelAlert(title: String?, message: String? = nil, okHandler: ((UIAlertAction) -> Swift.Void)? = nil, cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: okHandler))
        
        if cancelHandler != nil {
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: cancelHandler))
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    open func present(_ error: Error, okHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        if okHandler != nil || cancelHandler != nil {
            self.presentCancelAlert(title: error.localizedDescription, message: nil, okHandler: okHandler, cancelHandler: cancelHandler)
        } else {
            self.presentAlert(title: error.localizedDescription, message: nil, okHandler: okHandler)
        }
    }
    
    open func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Swift.Void)?) {
        self.view?.present(viewController, animated: animated, completion: completion)
    }
}
