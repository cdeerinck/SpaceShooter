//
//  contemplateAsteroid.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit


func contemplateAsteroid(scene: GameScene) {
    if Int.random(in: 0...42) != 42 { return } //Why 42?  Why not.
    if let candidate = scene.asteroids.randomElement() {
        _ = makeAsteroid(from: candidate, in: scene, at:CGPoint(x: CGFloat(Float.random(in: Float(scene.frame.minX)...Float(scene.frame.maxX))), y:scene.frame.maxY+100))
    }
}
