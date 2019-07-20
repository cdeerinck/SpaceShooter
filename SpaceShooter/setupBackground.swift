//
//  setupBackground.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func setupBackground(scene: SKScene) {
    //Here
    let backgroundNode1 = SKSpriteNode(imageNamed: "background")
    backgroundNode1.zPosition = 0
    backgroundNode1.scale(to: CGSize(width: scene.frame.width*2, height: scene.frame.height*2))
    let backgroundNode2 = backgroundNode1.copy() as! SKSpriteNode
    backgroundNode1.name = "background1"
    backgroundNode2.name = "background2"
    scene.addChild(backgroundNode1)
    scene.addChild(backgroundNode2)

}
