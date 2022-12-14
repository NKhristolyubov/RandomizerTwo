//
//  File.swift
//  RandomizerTwo
//
//  Created by Николай Христолюбов on 11.10.2022.
//

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}

