//
//  ViewController.swift
//  ZPPBaseFloating
//
//  Created by ZPP506 on 10/13/2020.
//  Copyright (c) 2020 ZPP506. All rights reserved.
//

import UIKit
import ZPPBaseFloating

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var config = ZPPFloatingConfig.defulter
        config.maginAll = 15
        config.maginBottom = 50
       let floating = ZPPTempFloatingView(frame: CGRect(x: 100, y: 100, width: 100, height: 100), config: config)
        self.view.addSubview(floating)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

