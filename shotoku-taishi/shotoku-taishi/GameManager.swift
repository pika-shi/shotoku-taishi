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

    let GAME_COUNT   = 5 // 1ゲームの問題数
    let OPTION_COUNT = 5 // 選択肢の数
    let ANSWER_COUNT = 3 // 答えの数

    // ファイル名と答えのペア
    let fruits = ["grape" : "ぶどう",
                  "melon" : "メロン",
                  "ringo" : "りんご",
                  "banana": "バナナ",
                  "ichigo": "いちご",
                  "mango" : "マンゴー",
                  "cherry": "さくらんぼ"]

    var currentGameCount: Int    = 0
    var sounds: Array<String>    = []
    var answers: Array<String>   = []
    var userAnswers: Array<Bool> = []
    var options: Array<String>   = []

    init() {
        currentGameCount = 1
    }

    func start() {
        currentGameCount = 1
        setSounds()
        setOptions()
        // println(answers)
    }

    func next() {
        currentGameCount++
        setSounds()
        setOptions()
        // println(answers)
    }

    func reset() {
        currentGameCount = 1
    }

    func getCurrentGameCount() -> Int {
        return currentGameCount
    }

    func isFinalGame() -> Bool {
        if currentGameCount == GAME_COUNT {
            return true
        }
        return false
    }

    func readyToAnswer() {
        userAnswers = Array(count: options.count, repeatedValue: false)
    }

    func addUserAnswers(index: Int) {
        userAnswers[index] = true
    }

    func removeUserAnswers(index: Int) {
        userAnswers[index] = false
    }

    func getUserAnswer(index: Int) -> Bool {
        return userAnswers[index]
    }

    // 正しい答えかどうか判定
    func isCorrect() -> Bool {
        // answersに答えの配列
        // userAnswersに答えの
        var tempAnswers: Array<String> = []
        for i in 0..<userAnswers.count {
            if userAnswers[i] {
                tempAnswers.append(options[i])
            }
        }
        // println(tempAnswers)
        // println(answers)
        for answer in answers {
            if !contains(tempAnswers, answer) {
                return false
            }
        }
        return true
    }

    // 音と答えをセット
    private func setSounds() {
        sounds.removeAll()
        answers.removeAll()
        getRandomFruits()
        answers.append(fruits[sounds[0]]!)
        answers.append(fruits[sounds[1]]!)
        answers.append(fruits[sounds[2]]!)
    }

    // 答えに合わせて選択肢をセット
    private func setOptions() {
        options.removeAll()
        var tempOptions = fruits.values.array
        tempOptions.shuffle(tempOptions.count)
        // 選択肢に答えをセット
        options = answers
        // ダミーの選択肢をセット
        for option in tempOptions {
            if !contains(answers, option) {
                options.append(option)
            }
            if options.count >= OPTION_COUNT {
                break
            }
        }
        // 順番をシャッフル
        options.shuffle(options.count)
    }

    // 問題となる音源をランダムに選択しセット
    private func getRandomFruits() {
        var randomIndex = 0
        var candidateSound = ""
        var count = 0
        while (count < ANSWER_COUNT) {
            randomIndex = Int(arc4random_uniform(UInt32(fruits.count)))
            candidateSound = fruits.keys.array[randomIndex]
            if (!contains(sounds, candidateSound)) {
                sounds.append(candidateSound)
                count++
            }
        }
    }
}
