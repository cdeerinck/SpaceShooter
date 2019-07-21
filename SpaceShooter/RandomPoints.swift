//
//  RandomPoints.swift
//  SpaceShooter
//
//  Created by Luke Deerinck on 7/20/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import CoreGraphics

func randomPoint(in scene: GameScene, atY y:CGFloat) -> CGPoint {
    return CGPoint(x: CGFloat.random(in:scene.frame.minX...scene.frame.maxX),y: y)
}

func randomPointOffscreen(in scene: GameScene, atY y:CGFloat, by:CGFloat) -> CGPoint {
    return CGPoint(x: CGFloat.random(in:scene.frame.minX*(1+by)...scene.frame.maxX*(1+by)), y: y)
}

func randomPointAround(origin:CGPoint, radius:CGFloat) -> CGPoint {
    let theta:
    //return CGPoint(x: origin.x + atan,y: origin.y)
}
