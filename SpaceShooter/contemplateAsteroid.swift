//
//  contemplateAsteroid.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

//let asteroidCategory:UInt32        = 0x00000004

func waitOrKill(in scene:GameScene, for theSprite:Sprites) {
    if theSprite.spriteNode.physicsBody!.node!.position.x < scene.frame.minX - 150 ||
        theSprite.spriteNode.physicsBody!.node!.position.x > scene.frame.maxX + 150 ||
        theSprite.spriteNode.physicsBody!.node!.position.y < scene.frame.minY - 150 ||
        theSprite.spriteNode.physicsBody!.node!.position.y > scene.frame.maxY + 150 {
        theSprite.removeSprite(from: scene)
    }
    else {
        theSprite.spriteNode.run(SKAction.wait(forDuration: 3.0), completion: { waitOrKill(in:scene, for: theSprite) })
    }
}

func contemplateAsteroid(scene: GameScene) {
    if Int.random(in: 0...42) != 42 { return } //Why 42?  Why not.
    if let candidate = scene.asteroids.filter({!$0.inScene}).randomElement() {
        //print("pew", candidate)
        candidate.spriteNode.position = CGPoint(x: CGFloat(Float.random(in: Float(scene.frame.minX)...Float(scene.frame.maxX))), y:scene.frame.maxY+100)
        candidate.spriteNode.setScale(CGFloat.random(in: 0.05...0.20))
        //prepare the physics
        candidate.spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: 20.0)
        candidate.spriteNode.physicsBody?.angularVelocity = CGFloat.random(in: -1.0...1.0)
        candidate.spriteNode.physicsBody?.linearDamping = 0.0
        candidate.spriteNode.physicsBody?.angularDamping = 0.0
        candidate.spriteNode.physicsBody?.mass = candidate.spriteNode.xScale / 0.20
        candidate.spriteNode.physicsBody?.velocity = CGVector(dx: 0, dy: -45.0)
        candidate.spriteNode.physicsBody?.contactTestBitMask = asteroidContact
        candidate.spriteNode.physicsBody?.collisionBitMask = asteroidCollision
        candidate.spriteNode.physicsBody?.categoryBitMask =  asteroidCategory
        candidate.addSprite(to: scene)
        candidate.spriteNode.run(SKAction.wait(forDuration: 5.0), completion:  {waitOrKill(in:scene, for: candidate)})

    }
}
