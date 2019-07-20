//
//  drawBackground.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

func drawBackground(scene: GameScene, frameCount:Int) {
    
    let backgroundFrame = -10 * frameCount % Int(scene.backgroundNode1!.frame.height)
    scene.backgroundNode1!.position.y = CGFloat(backgroundFrame) + scene.backgroundNode2!.frame.height
    scene.backgroundNode2!.position.y = CGFloat(backgroundFrame)
}
