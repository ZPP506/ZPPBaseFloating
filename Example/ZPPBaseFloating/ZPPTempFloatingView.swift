//
//  ZPPTempFloatingView.swift
//  ZPPBaseFloating_Example
//
//  Created by admin on 2020/10/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ZPPBaseFloating

class ZPPTempFloatingView: ZPPBaseFloatingView {

    required init(frame: CGRect, config: ZPPFloatingConfig = .defulter) {
        super.init(frame: frame, config: config)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
