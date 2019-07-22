//
//  drawShip.swift
//  Space Shooter
//
//  Created by Luke Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func setupFighter(in scene: GameScene) {
    let fighterAtlas = SKTextureAtlas(named: "Blue Fighter Atlas")
    var animationFrames: [SKTexture] = []
    for name in fighterAtlas.textureNames {
        animationFrames.append(fighterAtlas.textureNamed(name))
    }
    let shipNode = SKSpriteNode(texture: animationFrames[0])
    shipNode.physicsBody = SKPhysicsBody(circleOfRadius: 20.0)
    shipNode.physicsBody?.categoryBitMask = friendShipCategory
    shipNode.physicsBody?.contactTestBitMask = friendShipContact 
    shipNode.physicsBody?.collisionBitMask = friendShipCollision
    //shipNode.physicsBody?.allowsRotation = false
    //shipNode.physicsBody?.isDynamic = false

    shipNode.zPosition = 1
    shipNode.setScale(0.3)
    shipNode.position.y = scene.frame.minY + shipNode.size.height/2
    shipNode.name = "player"

    shipNode.run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.025)))
    scene.addChild(shipNode)
}



