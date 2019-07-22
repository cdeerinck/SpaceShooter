//
//  fragmentSize.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/22/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import CoreGraphics

func fragmentSize (size:CGFloat) -> (CGFloat,CGFloat) {
    //Asteroids range from 0.05 to 0.2
    //Any smaller than 0.05 should never be sent here (they should be vaporized).
    let totalArea = CGFloat.pi * size * size
    if totalArea/2.0 < 0.00786 /* 0.007854 rounded up */ { return (0.05,0.05) }
    let noMoreThanHalfArea = CGFloat.random(in: 0.007854...(totalArea/2.0)) //This min value is the area of a 0.05 asteroid
    let remainingArea = totalArea - noMoreThanHalfArea
    let noMoreThanHalfRadius = CGFloat(sqrt(Double(noMoreThanHalfArea)/Double.pi))
    let remainingRadius = CGFloat(sqrt(Double(remainingArea)/Double.pi))
    print("Turned \(size) into \(noMoreThanHalfRadius) and \(remainingRadius)")
    return (noMoreThanHalfRadius, remainingRadius)
}
