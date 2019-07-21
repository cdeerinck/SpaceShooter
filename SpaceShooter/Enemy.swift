//
//  Enemy.swift
//  SpaceShooter
//
//  Created by Luke Deerinck on 7/20/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func setupEnemy(in scene: SKScene) {
    // commAtlas = SKTextureAtlas(named: "Red Comm Ship Atlas")
    var animationFrames: [SKTexture] = []
    for i in 1...3 {
        animationFrames.append(SKTexture(imageNamed: "Red Comm Ship \(i)"))
    }
    let shipNode = SKSpriteNode(texture: animationFrames[0])
    shipNode.zPosition = 1
    shipNode.setScale(0.3)
    shipNode.name = "enemy"
    shipNode.position.x = scene.frame.minX - 300
    shipNode.position.y = scene.frame.minY - 300
    shipNode.run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.025)))
    scene.addChild(shipNode)
}

func spawnEnemy(in scene: GameScene){
    if scene.frameCount%300 != 0 { return}
    let enemy = scene.enemy.copy() as! SKSpriteNode
    scene.addChild(enemy)
    let center = enemy.position
    //let path = CGPath(ellipseIn: scene.frame, transform: nil)
    
    let pathNode = SKShapeNode(splinePoints: center,CGPoint(x: CGFloat.random(in: scene.frame.minX...scene.frame.maxX), y: 0), count: 3)
    enemy.run(SKAction.sequence([SKAction.follow(path, duration: 15),SKAction.removeFromParent()]))
}
