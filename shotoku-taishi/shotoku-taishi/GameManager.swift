//
//  GameManager.swift
//  shotoku-taishi
//
//  Created by Yosuke SAITO on 2015/05/03.
//  Copyright (c) 2015年 Hikaru Takemura. All rights reserved.
//

import Foundation

class GameManager {
    class var sharedInstance: GameManager {
        struct Static {
            static let instance = GameManager()
        }
        return Static.instance
    }

    let MAX_COUNT = 5
    var currentGameCount: Int

    init() {
        currentGameCount = 1
    }

    func next() {
        currentGameCount++
    }

    func reset() {
        currentGameCount = 1
    }

    func getCurrentGameCount() -> Int {
        return currentGameCount
    }

    func isFinalGame() -> Bool {
        if currentGameCount == MAX_COUNT {
            return true
        }
        return false
    }
}
