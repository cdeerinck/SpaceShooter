//
//  hitAsteroid.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/22/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation

func hitAsteroid (_ asteroid:Asteroid) {
    asteroid.damageCounter -= 1
    if asteroid.damageCounter <= 0 {
        if asteroid.rockSize < 0.07 { //It's too small, so vaporize it
            asteroid.removeFromParent()
            return
        }
        let (little,big) = fragmentSize(size: asteroid.rockSize)
        asteroid.rockSize = big
        asteroid.physicsBody!.angularVelocity *= 2
        let newAsteroid = makeAsteroid(from: asteroid, in: asteroid.parent as! GameScene, at: asteroid.position)
        newAsteroid.rockSize = little
        newAsteroid.physicsBody!.velocity.dx *= -1
        newAsteroid.physicsBody!.velocity.dy *= 1
        newAsteroid.physicsBody!.angularVelocity *= -1
        //Do we need to attach an animation to this?
    }
}
