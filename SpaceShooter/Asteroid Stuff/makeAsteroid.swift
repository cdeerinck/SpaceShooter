//
//  makeAsteroid.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/22/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import Foundation
import SpriteKit



func makeAsteroid(from template:Asteroid, in scene:GameScene, at point: CGPoint) -> Asteroid {
    let newAsteroid = template.copy() as! Asteroid
    newAsteroid.position = point
    newAsteroid.rockSize = CGFloat.random(in: 0.05...0.20)
    //prepare the physics
    newAsteroid.physicsBody = SKPhysicsBody(circleOfRadius: 20.0)
    newAsteroid.physicsBody?.angularVelocity = CGFloat.random(in: -1.0...1.0)
    newAsteroid.physicsBody?.linearDamping = 0.0
    newAsteroid.physicsBody?.angularDamping = 0.0
    newAsteroid.physicsBody?.velocity = CGVector(dx: 0, dy: -45.0)
    newAsteroid.physicsBody?.contactTestBitMask = asteroidContact
    newAsteroid.physicsBody?.collisionBitMask = asteroidCollision
    newAsteroid.physicsBody?.categoryBitMask =  asteroidCategory
    scene.addChild(newAsteroid)
    newAsteroid.run(SKAction.wait(forDuration: 5.0), completion:  {waitOrKill(in:scene, for: newAsteroid)})
    return newAsteroid
}
