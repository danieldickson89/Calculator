//
//  Stack.swift
//  Calculator
//
//  Created by Daniel Dickson on 2/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Stack {
    
    private var arrayOfFloats = [Float]()
    
    func pop() -> Float? {
        return arrayOfFloats.removeLast()
    }
    
    func push(number: Float) {
        arrayOfFloats.append(number)
    }
    
    func log() {
        print(arrayOfFloats)
    }
    
    func count() -> Int {
        return arrayOfFloats.count
    }
    
}