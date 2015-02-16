//
//  Lexi.swift
//  wiw
//
//  Created by Markus Bayer on 14.02.15.
//  Copyright (c) 2015 neungrad. All rights reserved.
//

import Foundation

// TODO docstring
class Lexi {

    let alphabet: [Character] = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "ä", "ö", "ß", "ü"
    ]

    // TODO Double is enough
    let letterFrequency: [Character: [String: Float]] = [
        "e": ["from": 83.08, "to": 100.00],     // 16.92
        "n": ["from": 72.55, "to": 83.08],      // 10.53
        "i": ["from": 64.53, "to": 72.55],      // 8.02
        "r": ["from": 57.64, "to": 64.53],      // 6.89
        "s": ["from": 51.22, "to": 57.64],      // 6.42
        "t": ["from": 45.43, "to": 51.22],      // 5.79
        "a": ["from": 39.85, "to": 45.43],      // 5.58
        "h": ["from": 34.87, "to": 39.85],      // 4.98
        "d": ["from": 29.89, "to": 34.87],      // 4.98
        "u": ["from": 26.06, "to": 29.89],      // 3.83
        "l": ["from": 22.46, "to": 26.06],      // 3.60
        "c": ["from": 19.30, "to": 22.46],      // 3.16
        "g": ["from": 16.28, "to": 19.30],      // 3.02
        "m": ["from": 13.73, "to": 16.28],      // 2.55
        "o": ["from": 11.49, "to": 13.73],      // 2.24
        "b": ["from": 9.53, "to": 11.49],       // 1.96
        "w": ["from": 7.75, "to": 9.53],        // 1.78
        "f": ["from": 6.26, "to": 7.75],        // 1.49
        "k": ["from": 4.94, "to": 6.26],        // 1.32
        "z": ["from": 3.73, "to": 4.94],        // 1.21
        "v": ["from": 2.89, "to": 3.73],        // 0.84
        "p": ["from": 2.22, "to": 2.89],        // 0.67
        "ü": ["from": 1.57, "to": 2.22],        // 0.65
        "ä": ["from": 1.03, "to": 1.57],        // 0.54
        "ß": ["from": 0.66, "to": 1.03],        // 0.37
        "ö": ["from": 0.36, "to": 0.66],        // 0.30
        "j": ["from": 0.12, "to": 0.36],        // 0.24
        "y": ["from": 0.07, "to": 0.12],        // 0.05
        "x": ["from": 0.02, "to": 0.07],        // 0.05
        "q": ["from": 0.00, "to": 0.02],        // 0.02
    ]

    let scrabbleLetterScore: [Character: Int] = [
        "e": 1,         // 15 <- amount
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


    /// dice a random Int within a given range
    /// :param: inRange range between the desired lowest and highest possible value
    /// :returns: a random Int within the range
    func randomRangeInt(inRange: Range<Int>) -> Int {
        return Int(inRange.startIndex + arc4random_uniform(inRange.endIndex - inRange.startIndex + 1))
    }

    /// dice a random Int within a given range
    /// :param: lower desired lowest possible value
    /// :param: upper desired highest possible value
    /// :returns: a random Float within the range
    func randomRangeFloat(lower: Double, upper: Double) -> Float {
        let arc4randoMax:Double = 0x100000000
        
        // TODO Double is enough
        return Float((Double(arc4random()) / arc4randoMax) * (upper - lower) + lower)
    }

    /// dice a letter based on the language letter frequency distribution
    /// :returns: a random letter based on the language letter frequency distribution
    func getRandomLetter() -> Character {
        // TODO implement difficulty
        var resultLetter: Character? = nil
        var freq: Float = randomRangeFloat(0.00, 100.00)
        
        // find the letter in that range
        for (letter, fromTo) in letterFrequency {
            if((freq > fromTo["from"]) && freq <= fromTo["to"]) {
                resultLetter = letter
            }
        }
        
        return resultLetter!
    }
}