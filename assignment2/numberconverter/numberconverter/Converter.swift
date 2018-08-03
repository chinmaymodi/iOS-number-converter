//
//  Converter.swift
//  numberconverter
//
//  Created by  on 3/4/17.
//  Copyright © 2017 vergil. All rights reserved.
//

import Foundation

class Converter {
    var val: Int
    var stringOfNumber: String
    var base: Int
    
    init(_ cs: String, _ bs: Int) {
        stringOfNumber = cs
        base = bs
        if(bs == 0) {
            base = 2
        }
        else if(base == 1) {
            base = 8
        }
        else if(base == 2) {
            base = 10
        }
        else {
            base = 16
        }
        val = Int(stringOfNumber, radix: base)!
    }
    
    func increment() -> String {
        val += 1
        return (String(val, radix: base)).uppercased()
    }
    func decrement() -> String {
        val -= 1
        return (String(val, radix: base)).uppercased()
    }
    func convertTo(_ inBase: Int) -> String {
        return (String(val, radix: inBase)).uppercased()
    }
}
