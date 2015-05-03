//
//  QuestionViewController.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/02.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    let APPLE  = 0
    let MELON  = 1
    let MANGO  = 2
    let BANANA = 3
    let GRAPE  = 4

    var answerArray = Array(count: 5, repeatedValue: false)

    @IBOutlet weak var apple:  UILabel!
    @IBOutlet weak var melon:  UILabel!
    @IBOutlet weak var mango:  UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var grape:  UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        apple.tag  = APPLE
        melon.tag  = MELON
        mango.tag  = MANGO
        banana.tag = BANANA
        grape.tag  = GRAPE
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            // let location = touch.locationInNode(self)
            // myImage.position = location
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)

        for touch: AnyObject in touches {
            var t: UITouch = touch as! UITouch
            // println(t.view.tag)
            switch t.view.tag {
            case apple.tag:
                toggleLabel(APPLE)
            case melon.tag:
                toggleLabel(MELON)
            case mango.tag:
                toggleLabel(MANGO)
            case banana.tag:
                toggleLabel(BANANA)
            case grape.tag:
                toggleLabel(GRAPE)
            default:
                break
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segue") {
            var answerView : AnswerViewController
                = segue.destinationViewController as! AnswerViewController
            answerView._answerArray = answerArray
        }
    }

    func toggleLabel(fruitNumber: Int) {
        switch fruitNumber {
        case APPLE:
            if answerArray[APPLE] {
                apple.backgroundColor = UIColor.lightGrayColor()
                answerArray[APPLE] = false
            } else {
                apple.backgroundColor = UIColor.orangeColor()
                answerArray[APPLE] = true
            }
        case MELON:
            if answerArray[MELON] {
                melon.backgroundColor = UIColor.lightGrayColor()
                answerArray[MELON] = false
            } else {
                melon.backgroundColor = UIColor.orangeColor()
                answerArray[MELON] = true
            }
        case MANGO:
            if answerArray[MANGO] {
                mango.backgroundColor = UIColor.lightGrayColor()
                answerArray[MANGO] = false
            } else {
                mango.backgroundColor = UIColor.orangeColor()
                answerArray[MANGO] = true
            }
        case BANANA:
            if answerArray[BANANA] {
                banana.backgroundColor = UIColor.lightGrayColor()
                answerArray[BANANA] = false
            } else {
                banana.backgroundColor = UIColor.orangeColor()
                answerArray[BANANA] = true
            }
        case GRAPE:
            if answerArray[GRAPE] {
                grape.backgroundColor = UIColor.lightGrayColor()
                answerArray[GRAPE] = false
            } else {
                grape.backgroundColor = UIColor.orangeColor()
                answerArray[GRAPE] = true
            }
        default:
            break
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
