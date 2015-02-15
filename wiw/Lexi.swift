//
//  Lexi.swift
//  wiw
//
//  Created by Markus Bayer on 14.02.15.
//  Copyright (c) 2015 neungrad. All rights reserved.
//

import Foundation

class Lexi {
    let letterFrequency; [String: Double] = [
        "e": 17,40,
        "n": 9,78,
        "i": 7,55,
        "s": 7,27,
        "r": 7,00,
        "a": 6,51,
        "t": 6,15,
        "d": 5,08,
        "h": 4,76,
        "u": 4,35,
        "l": 3,44,
        "c": 3,06,
        "g": 3,01,
        "m": 2,53,
        "o": 2,51,
        "b": 1,89,
        "w": 1,89,
        "f": 1,66,
        "k": 1,21,
        "z": 1,13,
        "p": 0,79,
        "v": 0,67,
        "ü": 0,65,
        "ä": 0,54,
        "ß": 0,31,
        "ö": 0,30,
        "j": 0,27,
        "y": 0,04,
        "x": 0,03,
        "q": 0,02
    ]
    
    let scrabbleLetterScore; [String: Int] = [
        "e": 1,         // 15
        "n": 1,         // 9
        "s": 1,         // 7
        "i": 1,         // 6
        "r": 1,         // 6
        "t": 1,         // 6
        "u": 1,         // 6
        "a": 1,         // 5
        "d": 1,         // 4
    
        "h": 2,         // 4
        "g": 2,         // 3
        "l": 2,         // 3
        "o": 2,         // 3

        "m": 3,         // 4
        "b": 3,         // 2
        "w": 3,         // 2
        "z": 3,         // 1

        "c": 4,         // 2
        "f": 4,         // 2
        "k": 4,         // 2
        "p": 4,         // 1
    
        "ä": 6,         // 1
        "j": 6,         // 1
        "ü": 6,         // 1
        "v": 6,         // 1
    
        "ö": 8,         // 1
        "x": 8,         // 1

        "ß": 8,         // 1
    
        "q": 10,        // 1
        "y": 10,        // 1
    ]
}

// playground

// Playground - noun: a place where people can play

import UIKit

let alphabet: [Character] = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "ä", "ö", "ß", "ü"
]

// TODO sub ß from s...
let letterFrequency: [Character: Double] = [
    "e": 17.40,
    "n": 9.78,
    "i": 7.55,
    "s": 7.27,
    "r": 7.00,
    "a": 6.51,
    "t": 6.15,
    "d": 5.08,
    "h": 4.76,
    "u": 4.35,
    "l": 3.44,
    "c": 3.06,
    "g": 3.01,
    "m": 2.53,
    "o": 2.51,
    "b": 1.89,
    "w": 1.89,
    "f": 1.66,
    "k": 1.21,
    "z": 1.13,
    "p": 0.79,
    "v": 0.67,
    "ü": 0.65,
    "ä": 0.54,
    "ß": 0.31,
    "ö": 0.30,
    "j": 0.27,
    "y": 0.04,
    "x": 0.03,
    "q": 0.02
]

var absArr: [Character] = []
let divider: Double = 0.01
for (l, f) in letterFrequency {
    var share: Double = f / divider
    for i in 0...Int(share) {
        absArr.append(l)
    }
}

println(absArr.count)

var a = 0.03 / divider


if(alphabet.count == letterFrequency.count) {
    println("yo")
}
let scrabbleLetterScore: [Character: Int] = [
    "e": 1,         // 15
    "n": 1,         // 9
    "s": 1,         // 7
    "i": 1,         // 6
    "r": 1,         // 6
    "t": 1,         // 6
    "u": 1,         // 6
    "a": 1,         // 5
    "d": 1,         // 4
    
    "h": 2,         // 4
    "g": 2,         // 3
    "l": 2,         // 3
    "o": 2,         // 3
    
    "m": 3,         // 4
    "b": 3,         // 2
    "w": 3,         // 2
    "z": 3,         // 1
    
    "c": 4,         // 2
    "f": 4,         // 2
    "k": 4,         // 2
    "p": 4,         // 1
    
    "ä": 6,         // 1
    "j": 6,         // 1
    "ü": 6,         // 1
    "v": 6,         // 1
    
    "ö": 8,         // 1
    "x": 8,         // 1
    
    "ß": 8,         // 1
    
    "q": 10,        // 1
    "y": 10,        // 1
]


func randomRangeInt(range: Range<Int>) -> Int {
    return Int(range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1))
}

func randomRangeFloat(lower: Double, upper: Double) -> Float {
    let arc4randoMax:Double = 0x100000000
    
    return Float((Double(arc4random()) / arc4randoMax) * (upper - lower) + lower)
}

func getRandomLetter(difficulty: Int) -> Character {
    var letter: Character? = nil
    
    while(letter == nil) {
        // dice a letter
        let maxIndex: Int = Int(alphabet.count - 1)
        // -1 wtf
        var letterNr: Int = randomRangeInt(0...maxIndex - 1)
        // println(letterNr)
        var letterTmp: Character = alphabet[letterNr]
        
        // check if the frequency matches
        var frequency: Float = randomRangeFloat(0.0, 1.0)
        if(letterFrequency[letterTmp] > Double(frequency)) {
            letter = letterTmp
        }
    }
    
    return letter!
}

var fl: Float = 0.33
var fl2: Float = fl * 2

for (l, f) in letterFrequency {
    // println("\(l): \(f)")
}


alphabet[29]

for index in 0...1 {
    var l = getRandomLetter(1)
}














