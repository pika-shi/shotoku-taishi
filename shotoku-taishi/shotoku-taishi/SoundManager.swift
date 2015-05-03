//
//  SoundManager.swift
//  shotoku-taishi
//
//  Created by Hikaru Takemura on 2015/05/03.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager: NSObject, AVAudioPlayerDelegate {
    var playerRight: AVAudioPlayer!
    var playerLeft: AVAudioPlayer!
    var playerCenter: AVAudioPlayer!
    
    var path: NSString!
    var url: NSURL!

    
    init(rightSound: String, centerSound: String, leftSound: String) {
        
        super.init()
        
        path = NSBundle.mainBundle().pathForResource(rightSound, ofType: "m4a")!
        url = NSURL(fileURLWithPath: path as String)!
        playerRight = AVAudioPlayer(contentsOfURL: url, error: nil)
        playerRight.delegate = self
        playerRight.pan = 1.0
        playerRight.prepareToPlay()
        
        path = NSBundle.mainBundle().pathForResource(centerSound, ofType: "m4a")!
        url = NSURL(fileURLWithPath: path as String)!
        playerCenter = AVAudioPlayer(contentsOfURL: url, error: nil)
        playerCenter.delegate = self
        playerCenter.pan = 0
        playerCenter.prepareToPlay()
        
        path = NSBundle.mainBundle().pathForResource(leftSound, ofType: "m4a")!
        url = NSURL(fileURLWithPath: path as String)!
        playerLeft = AVAudioPlayer(contentsOfURL: url, error: nil)
        playerLeft.delegate = self
        playerLeft.pan = -1.0
        playerLeft.prepareToPlay()
    }
    
    func playSound() {
        playerRight.play()
        playerCenter.play()
        playerLeft.play()
    }
}