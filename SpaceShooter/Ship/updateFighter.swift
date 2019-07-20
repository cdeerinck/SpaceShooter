//
//  updateFighter.swift
//  Space Shooter
//
//  Created by Luke Deerinck on 7/19/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func moveFighter(to goto:CGPoint, in scene: GameScene)  {
    scene.shipNode.position.x = lerp(start: scene.shipNode.position.x, end: goto.x, weight: 0.1)
    scene.shipNode.position.y = scene.frame.minY + scene.shipNode.size.height/2
}
