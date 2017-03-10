//
//  ViperActivityIndicator.swift
//  ViperKit
//
//  Created by Jacob Sikorski on 2017-02-27.
//  Copyright © 2017 Tamarai Studios. All rights reserved.
//

import Foundation
import UIKit

class ViperActivityIndicator: UIActivityIndicatorView {
    convenience init() {
        self.init(activityIndicatorStyle: .gray)
    }
    
    override init(activityIndicatorStyle style: UIActivityIndicatorViewStyle) {
        super.init(activityIndicatorStyle: style)
        self.setup()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.hidesWhenStopped = true
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let bounds = self.superview?.bounds {
            let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
            self.center = center
        }
        
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    }
}
