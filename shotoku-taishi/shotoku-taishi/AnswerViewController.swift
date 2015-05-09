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

    var _answerArray = []
    var shotokuArray = [true, false, true, true, false]

    @IBOutlet weak var currentQuestionLabel: UILabel!
    var gameManager: GameManager = GameManager.sharedInstance

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var message: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        
        if _answerArray == shotokuArray {
            message.text = "お主は聖徳太子レベルじゃ"
        } else {
            message.text = "常人では仕方あるまい…"
        }

        currentQuestionLabel.text
            = "\(gameManager.getCurrentGameCount()) / \(gameManager.MAX_COUNT)"

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
