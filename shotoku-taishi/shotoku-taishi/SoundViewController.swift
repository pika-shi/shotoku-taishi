//
//  SoundViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/02.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit

class SoundViewController: UIViewController {

    let maxCount = 3

    var count : Int = 1
    @IBOutlet weak var countDownLabel: UILabel!
    var timer : NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
            selector: "update:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update(timer : NSTimer) {
        if (count == maxCount) {
            // カウントが0になったら
            // よく聞いてねラベルを表示
            countDownLabel.text = "よく聴くのじゃ"
            count++
        } else if (count > maxCount) {
            // よく聞いてねラベルが表示されて1秒経ったら
            // 音声を流して問題画面に遷移
        } else {
            countDownLabel.text = "\(maxCount - count)"
            count++
        }
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
