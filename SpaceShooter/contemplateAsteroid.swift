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
    if Float.random(in: 0...200) != 42 { return } //Why 42?  Why not.
    if let candidate = scene.asteroids.filter({!$0.inScene}).first {
        candidate.spriteNode.position = CGPoint(x: CGFloat(Float.random(in: Float(scene.frame.minX)...Float(scene.frame.maxX))), y:scene.frame.maxY)
        //candidate.run(SKAction.o) //.run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.025)))
    }
}
