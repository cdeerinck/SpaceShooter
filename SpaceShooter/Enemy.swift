//
//  Enemy.swift
//  SpaceShooter
//
//  Created by Luke Deerinck on 7/20/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func setupEnemy(in scene: GameScene) {
    // commAtlas = SKTextureAtlas(named: "Red Comm Ship Atlas")
    var animationFrames: [SKTexture] = []
    for i in 1...3 {
        animationFrames.append(SKTexture(imageNamed: "Red Comm Ship \(i)"))
    }
    let shipNode = SKSpriteNode(texture: animationFrames[0])
    shipNode.zPosition = 1
    shipNode.setScale(0.1)
    shipNode.name = "enemy"
    shipNode.position.x = 0
    shipNode.position.y = 0
    shipNode.run(SKAction.repeatForever(SKAction.animate(with: animationFrames, timePerFrame: 0.025)))
    //scene.addChild(shipNode)
    scene.enemy = shipNode
}

func spawnEnemy(in scene: GameScene){
    if scene.frameCount%60 != 0 { return}
    let enemy = scene.enemy.copy() as! SKSpriteNode
    scene.addChild(enemy)
    let start = randomPointAround(origin: CGPoint(x: scene.frame.minX - 100,y: scene.frame.minY - 100), radius: 25)
    let center = randomPoint(in: scene, atY: 0)
    let end = randomPointOffscreen(in: scene, atY: scene.frame.maxY, by: 0.2)
    var curve = [start,center,end]
    print(curve)
    let pathNode = SKShapeNode(splinePoints: &curve , count: 3)
    enemy.run(SKAction.sequence([SKAction.follow(pathNode.path!, speed: 300),SKAction.removeFromParent()]))
    //enemy.run(SKAction.follow(pathNode.path!, speed: 300))
}
