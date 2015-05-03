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
    @IBOutlet weak var currentQuestionLabel: UILabel!
    var timer : NSTimer!
    
    var soundManager: SoundManager!
    var gameManager: GameManager = GameManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // println("Sound: \(gameManager.getCurrentGameCount())")
        currentQuestionLabel.text
            = "\(gameManager.getCurrentGameCount()) / \(gameManager.MAX_COUNT)"

        /* gameManager = GameManager()
        if let gameManager = gameManager {
            println("2回目以降")
        } else {
            println("初めて")
            gameManager = GameManager()
        } */

        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
            selector: "update:", userInfo: nil, repeats: true)
        
        soundManager = SoundManager(rightSound: "banana", centerSound: "mango", leftSound: "ichigo")
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

        // next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
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
