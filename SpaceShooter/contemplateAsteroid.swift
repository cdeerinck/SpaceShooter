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
    if let candidate = scene.asteroids.filter({!$0.inScene}).randomElement() {
        //print("pew", candidate)
        candidate.spriteNode.position = CGPoint(x: CGFloat(Float.random(in: Float(scene.frame.minX)...Float(scene.frame.maxX))), y:scene.frame.maxY-100)
        candidate.spriteNode.setScale(CGFloat.random(in: 0.05...0.20))
        //prepare the physics
        candidate.spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: 20.0)
        candidate.spriteNode.physicsBody?.angularVelocity = CGFloat.random(in: -1.0...1.0)
        candidate.spriteNode.physicsBody?.linearDamping = 0.0
        candidate.spriteNode.physicsBody?.angularDamping = 0.0
        //candidate.spriteNode.physicsBody?.isDynamic = true
        //candidate.spriteNode.physicsBody?.restitution = 1.0
        candidate.spriteNode.physicsBody?.mass = 1.0
        candidate.spriteNode.physicsBody?.velocity = CGVector(dx: 0, dy: -45.0)
        candidate.spriteNode.physicsBody?.contactTestBitMask = 0b0
        candidate.spriteNode.physicsBody?.collisionBitMask = 0b0_0001_1100 //0x001C
        candidate.spriteNode.physicsBody?.categoryBitMask =  0b0_0000_1000 //0x0008

        candidate.addSprite(to: scene)

        candidate.spriteNode.run(SKAction.wait(forDuration: 20.0), completion:  {candidate.removeSprite(from: scene)})
        //candidate.spriteNode.run(SKAction.group([SKAction.rotate(byAngle: CGFloat(2*Float.pi), duration: 9.0),SKAction.moveTo(y: scene.frame.minY-100, duration: 5.0)]),completion: {candidate.removeSprite(from: scene)})
        //.removeFromParent()
        /*
            group
                Rotate once per second
                Move to destination over 5 seconds
        */
    }
}
