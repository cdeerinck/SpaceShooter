//
//  SpriteFlags.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/19/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit

struct Sprites {
    var spriteNode: SKSpriteNode
    var inScene: Bool

    init (in scene:SKScene, named name:String, inScene:Bool=true) {
        self.spriteNode = SKSpriteNode(imageNamed:name)
        spriteNode.name = name
        self.inScene = inScene
        if inScene { scene.addChild(spriteNode) }
    }

    mutating func removeSprite(from scene:SKScene) {
        if self.inScene {
            scene.removeChildren(in: [self.spriteNode])
            inScene = false
        }
    }

    mutating func addSprite(to scene:SKScene) {
        if !self.inScene {
            scene.addChild(self.spriteNode)
            self.inScene = true
        }
    }
}