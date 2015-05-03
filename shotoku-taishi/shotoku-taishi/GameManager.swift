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
    // ファイル名と答えのペア
    let fruits = ["grape": "ぶどう", "melon": "メロン", "ringo": "りんご",
                  "banana": "バナナ", "ichigo": "いちご", "mango": "マンゴー"]
    var currentGameCount: Int
    var sounds: Array<String> = []
    var answers: Array<String> = []
    var options: Array<String> = []

    init() {
        currentGameCount = 1
        setSounds()
        setAnswers()
        setOptions()
    }

    func next() {
        currentGameCount++
        setSounds()
        setAnswers()
        setOptions()
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

    private func setSounds() {
        sounds = Array()
        sounds.append("banana")
        sounds.append("mango")
        sounds.append("ichigo")
    }

    private func setAnswers() {
        answers.removeAll()
        answers.append(fruits["banana"]!)
        answers.append(fruits["mango"]!)
        answers.append(fruits["ichigo"]!)
    }

    private func setOptions() {
        options.removeAll()
        options.append(fruits["ichigo"]!)
        options.append(fruits["melon"]!)
        options.append(fruits["mango"]!)
        options.append(fruits["banana"]!)
        options.append(fruits["grape"]!)
    }
}
