//
//  ViewController.swift
//  shotoku-taishi
//
//  Created by Hikaru Takemura on 2015/05/02.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {

    var gameManager: GameManager = GameManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(sender: AnyObject) {
        gameManager.start()
    }
}
