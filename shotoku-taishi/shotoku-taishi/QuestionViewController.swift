//
//  QuestionViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/02.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit
import iAd

class QuestionViewController: UIViewController {

    var gameManager: GameManager = GameManager.sharedInstance
    @IBOutlet weak var currentQuestionLabel: UILabel!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true

        gameManager.readyToAnswer()

        label1.tag = 0
        label2.tag = 1
        label3.tag = 2
        label4.tag = 3
        label5.tag = 4

        label1.text = gameManager.options[label1.tag]
        label2.text = gameManager.options[label2.tag]
        label3.text = gameManager.options[label3.tag]
        label4.text = gameManager.options[label4.tag]
        label5.text = gameManager.options[label5.tag]

        currentQuestionLabel.text
            = "\(gameManager.getCurrentGameCount()) / \(gameManager.GAME_COUNT)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            // なぜか必要
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)

        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            switch t.view.tag {
            case label1.tag:
                toggleLabel(label1.tag)
            case label2.tag:
                toggleLabel(label2.tag)
            case label3.tag:
                toggleLabel(label3.tag)
            case label4.tag:
                toggleLabel(label4.tag)
            case label5.tag:
                toggleLabel(label5.tag)
            default:
                break
            }
        }
    }

    // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    //     if (segue.identifier == "segue") {
    //         var answerView : AnswerViewController
    //             = segue.destinationViewController as! AnswerViewController
    //         answerView._answerArray = answerArray
    //     }
    // }

    func toggleLabel(labelNumber: Int) {
        switch labelNumber {
        case label1.tag:
            if gameManager.getUserAnswer(label1.tag) {
                label1.backgroundColor = UIColor.lightGrayColor()
                gameManager.removeUserAnswers(label1.tag)
            } else {
                label1.backgroundColor = UIColor.orangeColor()
                gameManager.addUserAnswers(label1.tag)
            }
        case label2.tag:
            if gameManager.getUserAnswer(label2.tag) {
                label2.backgroundColor = UIColor.lightGrayColor()
                gameManager.removeUserAnswers(label2.tag)
            } else {
                label2.backgroundColor = UIColor.orangeColor()
                gameManager.addUserAnswers(label2.tag)
            }
        case label3.tag:
            if gameManager.getUserAnswer(label3.tag) {
                label3.backgroundColor = UIColor.lightGrayColor()
                gameManager.removeUserAnswers(label3.tag)
            } else {
                label3.backgroundColor = UIColor.orangeColor()
                gameManager.addUserAnswers(label3.tag)
            }
        case label4.tag:
            if gameManager.getUserAnswer(label4.tag) {
                label4.backgroundColor = UIColor.lightGrayColor()
                gameManager.removeUserAnswers(label4.tag)
            } else {
                label4.backgroundColor = UIColor.orangeColor()
                gameManager.addUserAnswers(label4.tag)
            }
        case label5.tag:
            if gameManager.getUserAnswer(label5.tag) {
                label5.backgroundColor = UIColor.lightGrayColor()
                gameManager.removeUserAnswers(label5.tag)
            } else {
                label5.backgroundColor = UIColor.orangeColor()
                gameManager.addUserAnswers(label5.tag)
            }
        default:
            break
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
