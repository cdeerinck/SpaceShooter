//
//  Asteroids.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/22/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import SpriteKit

class Asteroid:SKSpriteNode {
    public var rockSize:CGFloat = 0.20 {
        didSet {
            self.setScale(self.rockSize)
            self.physicsBody?.mass = self.rockSize / 0.20
            switch self.rockSize { //The bigger the rock, the more damage it can take
            case 0.18...1.0:
                self.damageCounter = 3
            case 0.09...1.0:
                self.damageCounter = 2
            default:
                self.damageCounter = 1
            }
        }
    }
    public var damageCounter = 2 //Decrements, at zero it will  break.
}
