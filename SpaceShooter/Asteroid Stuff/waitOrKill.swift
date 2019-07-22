//
//  waitOrKill.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/22/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

//let asteroidCategory:UInt32        = 0x00000004

func waitOrKill(in scene:GameScene, for theSprite:SKSpriteNode) {
    if theSprite.physicsBody!.node!.position.x < scene.frame.minX - 150 ||
        theSprite.physicsBody!.node!.position.x > scene.frame.maxX + 150 ||
        theSprite.physicsBody!.node!.position.y < scene.frame.minY - 150 ||
        theSprite.physicsBody!.node!.position.y > scene.frame.maxY + 150 {
        theSprite.removeFromParent()
    }
    else {
        theSprite.run(SKAction.wait(forDuration: 3.0), completion: { waitOrKill(in:scene, for: theSprite) })
    }
}
