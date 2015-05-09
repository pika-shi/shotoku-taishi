//
//  SoundViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/02.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit
import iAd

class SoundViewController: UIViewController {

    let maxCount = 3 // 何秒カウントダウンするか

    var count : Int = 1
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var currentQuestionLabel: UILabel!
    var timer : NSTimer!
    
    var soundManager: SoundManager!
    var gameManager: GameManager = GameManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        
        currentQuestionLabel.text
            = "\(gameManager.getCurrentGameCount()) / \(gameManager.GAME_COUNT)"

        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
            selector: "update:", userInfo: nil, repeats: true)
        
        soundManager = SoundManager(rightSound: gameManager.sounds[0],
            centerSound: gameManager.sounds[1], leftSound: gameManager.sounds[2])
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
            soundManager.playSound()
            timer.invalidate()
            transition()
        } else {
            countDownLabel.text = "\(maxCount - count)"
            count++
        }
    }

    func transition() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("QuestionViewController") as! UIViewController
        self.presentViewController(next, animated: false, completion: nil)
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
