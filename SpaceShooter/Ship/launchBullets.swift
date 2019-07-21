//
//  launchBullets.swift
//  Space Shooter
//
//  Created by Luke Deerinck on 7/19/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func launchBullets(in scene: GameScene) {
    if scene.frameCount%5 != 0 { return }
    let bullet = SKSpriteNode(imageNamed: "Blue Bullet")
    bullet.name = "Bullet"
    bullet.zPosition = 1
    bullet.physicsBody = SKPhysicsBody(circleOfRadius: 10.0)
    bullet.physicsBody?.contactTestBitMask = 0x0146
    bullet.physicsBody?.collisionBitMask = 0x0024
    bullet.physicsBody?.categoryBitMask = 0x0008
    bullet.physicsBody?.velocity = CGVector(dx: 0, dy: 300.0)
    bullet.position.x = scene.shipNode.position.x
    bullet.position.y = scene.shipNode.position.y + CGFloat(100)
    //bullet.run(SKAction.sequence([SKAction.moveTo(y: scene.frame.maxY, duration: 1),SKAction.removeFromParent()]))
    bullet.run(SKAction.wait(forDuration: 5.0),completion: {SKAction.removeFromParent()})
    scene.addChild(bullet)
}
