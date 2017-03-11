//
//  ViewController.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import UIKit
import ViperKit

class ViewController: ViperViewController {
    @IBOutlet weak var tasksLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var replaceButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var sampleInteractor: SampleInteractor? {
        return interactor as? SampleInteractor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sampleInteractor == nil {
            interactor = SampleInteractor(self)
        }
        
        self.view.backgroundColor = sampleInteractor?.currentColor
        navigateButton.isEnabled = navigationController != nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func replaceAction(_ sender: Any) {
        sampleInteractor?.performReplace()
    }
    
    @IBAction func presentAction(_ sender: Any) {
        sampleInteractor?.performPresent()
    }
    
    @IBAction func navigateAction(_ sender: Any) {
        sampleInteractor?.performNavigate()
    }
    
    @IBAction func performLongTask(_ sender: Any) {
        sampleInteractor?.performLongTask()
    }
    
    @IBAction func performLongTaskWithError(_ sender: Any) {
        sampleInteractor?.performLongTaskWithError()
    }
    
    func showActivityCount(count: Int) {
        tasksLabel.text = "Number of tasks: \(count)"
    }
    
    func showActivityIndicator() {
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
}

