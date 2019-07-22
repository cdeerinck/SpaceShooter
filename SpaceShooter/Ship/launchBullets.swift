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
    bullet.physicsBody?.contactTestBitMask = friendBulletContact
    bullet.physicsBody?.collisionBitMask = friendBulletCollision
    bullet.physicsBody?.categoryBitMask = friendBulletCategory
    bullet.physicsBody?.mass = 0.005
    bullet.physicsBody?.velocity = CGVector(dx: 0, dy: 500.0)
    bullet.position.x = scene.shipNode.position.x
    bullet.position.y = scene.shipNode.position.y + CGFloat(100)
    //bullet.run(SKAction.sequence([SKAction.moveTo(y: scene.frame.maxY, duration: 1),SKAction.removeFromParent()]))
    bullet.run(SKAction.wait(forDuration: 5.0),completion: {bullet.removeFromParent()})
    scene.addChild(bullet)
}
