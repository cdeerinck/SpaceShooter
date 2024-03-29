//
//  GameViewController.swift
//  Space Shooter
//
//  Created by Chuck Deerinck on 7/18/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//

import UIKit
import CoreGraphics
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'

            let scene = GameScene()
            scene.size = view.frame.size //CGSize(width: 100, height: 100)
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //if let scene = SKScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            setupBackground(scene: scene)
            for i in 0...3 {
                scene.asteroids.append(Asteroid(imageNamed:"Asteroid Type \(i+1)"))
                scene.asteroids[i].name = "Asteroid"
                scene.asteroids[i].zPosition = 2 //Just above the background
            }
            setupFighter(in: scene)
            setupEnemy(in: scene)
            // Present the scene
            view.presentScene(scene)

            //}

            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true


        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

