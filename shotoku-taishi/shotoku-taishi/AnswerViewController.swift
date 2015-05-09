//
//  AnswerViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/03.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit
import iAd

class AnswerViewController: UIViewController {

    @IBOutlet weak var currentQuestionLabel: UILabel!
    var gameManager: GameManager = GameManager.sharedInstance

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var message: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true

        label1.text = gameManager.options[0]
        label2.text = gameManager.options[1]
        label3.text = gameManager.options[2]
        label4.text = gameManager.options[3]
        label5.text = gameManager.options[4]

        if contains(gameManager.answers, label1.text!) {
            label1.backgroundColor = UIColor.orangeColor()
        }
        if contains(gameManager.answers, label2.text!) {
            label2.backgroundColor = UIColor.orangeColor()
        }
        if contains(gameManager.answers, label3.text!) {
            label3.backgroundColor = UIColor.orangeColor()
        }
        if contains(gameManager.answers, label4.text!) {
            label4.backgroundColor = UIColor.orangeColor()
        }
        if contains(gameManager.answers, label5.text!) {
            label5.backgroundColor = UIColor.orangeColor()
        }

        if gameManager.isCorrect() {
            message.text = "正解！"
        } else {
            message.text = "残念！"
        }
        // println(gameManager.answers)

        currentQuestionLabel.text
            = "\(gameManager.getCurrentGameCount()) / \(gameManager.GAME_COUNT)"

        if gameManager.isFinalGame() {
            quitButton.hidden = true
            nextButton.setTitle("トップに戻る", forState: nil)
        } else {
            nextButton.setTitle("次へ", forState: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextOrReset(sender: AnyObject) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if gameManager.isFinalGame() {
            gameManager.reset()
            let reset:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! UIViewController
            self.presentViewController(reset, animated: false, completion: nil)
        } else {
            gameManager.next()
            let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("SoundViewController") as! UIViewController
            self.presentViewController(next, animated: false, completion: nil)
        }
    }

    @IBAction func reset(sender: AnyObject) {
        gameManager.reset()
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
