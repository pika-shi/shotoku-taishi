//
//  AnswerViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/03.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var _answerArray = []
    var shotokuArray = [true, false, true, true, false]

    @IBOutlet weak var message: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if _answerArray == shotokuArray {
            message.text = "お主は聖徳太子レベルじゃ"
        } else {
            message.text = "常人では仕方あるまい…"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
