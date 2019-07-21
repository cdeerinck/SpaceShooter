//
//  GameScene.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var frameCount:Int = 0

    private var spinnyNode : SKShapeNode?
    var shipNode: SKSpriteNode = SKSpriteNode()
    private var goto: CGPoint?
    private var h:CGFloat = 0
    var backgroundNode1: SKSpriteNode?
    var backgroundNode2: SKSpriteNode?
    var asteroids: [Sprites] = []
    var enemy:SKSpriteNode = SKSpriteNode()
    override func didMove(to view: SKView) {

        // Get label node from scene and store it for use later
        self.backgroundNode1 = self.childNode(withName: "background1") as? SKSpriteNode
        self.backgroundNode2 = self.childNode(withName: "background2") as? SKSpriteNode
        self.shipNode = self.childNode(withName: "player") as! SKSpriteNode
        self.enemy = self.childNode(withName: "enemy") as! SKSpriteNode

    }


    func touchDown(atPoint pos : CGPoint) {
        goto = pos
    }

    func touchMoved(toPoint pos : CGPoint) {
            goto = pos
    }

    func touchUp(atPoint pos : CGPoint) {
            goto = nil
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }


    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        frameCount += 1
        drawBackground(scene: self, frameCount:frameCount)
        contemplateAsteroid(scene: self)
        spawnEnemy(in: self)
        if goto != nil {
            //print(goto as Any)
            moveFighter(to: goto!, in: self)
            launchBullets(in:self)
        }
    }

}

