//
//  Bit Masks.swift
//  SpaceShooter
//
//  Created by Chuck Deerinck on 7/21/19.
//  Copyright © 2019 Chuck Deerinck. All rights reserved.
//
import CoreGraphics

let friendShipCategory:UInt32      = 0x00000001
let enemyShipCategory:UInt32       = 0x00000002
let asteroidCategory:UInt32        = 0x00000004
let friendBulletCategory:UInt32    = 0x00000008
let enemyBulletCategory:UInt32     = 0x00000010
let friendSpaceMineCategory:UInt32 = 0x0000002
let enemySpaceMineCategory:UInt32  = 0x00000040
let friendSmartBombCategory:UInt32 = 0x00000080
let enemySmartBombCategory:UInt32  = 0x00000100

//These are for Physics Interaction
let friendShipCollision:UInt32 = 0x00000000
let enemyShipCollision:UInt32 = 0x00000000
let asteroidCollision:UInt32 = friendBulletCategory | enemyBulletCategory | asteroidCategory
let friendBulletCollision:UInt32 = friendSpaceMineCategory | asteroidCategory
let enemyBulletCollision:UInt32 = enemySpaceMineCategory | asteroidCategory
let friendSpaceMineCollision:UInt32 = 0x00000000
let enemySpaceMineCollision:UInt32 = 0x00000000
let friendSmartBombCollision:UInt32 = 0x00000000
let enemySmartBombCollision:UInt32 = 0x00000000

//These are for notifications of contact
let friendShipContact = enemySmartBombCategory | enemySpaceMineCategory | enemyBulletCategory | asteroidCategory | enemyShipCategory
let enemyShipContact = friendSmartBombCategory | friendSpaceMineCategory | friendBulletCategory | asteroidCategory | friendShipCategory
let asteroidContact = asteroidCategory | enemyShipCategory | friendShipCategory
let friendBulletContact = enemySmartBombCategory | enemySpaceMineCategory | asteroidCategory | enemyShipCategory
let enemyBulletContact = friendSmartBombCategory | friendSpaceMineCategory | asteroidCategory | friendShipCategory
let friendSpaceMineContact = enemySmartBombCategory | enemySpaceMineCategory | asteroidCategory | enemyShipCategory
let enemySpaceMineContact = friendSmartBombCategory | friendSpaceMineCategory | asteroidCategory | friendShipCategory
let friendSmartBombContact = enemySmartBombCategory | enemySpaceMineCategory | asteroidCategory | enemyShipCategory
let enemySmartBombContact = friendSmartBombCategory | friendSpaceMineCategory | asteroidCategory | friendShipCategory

//these are zPosition values for node types
let backgroundZDepth:CGFloat = 0
let asteroidZPDepth:CGFloat = 1
let bulletZDepth:CGFloat = 2
let mineZDepth:CGFloat = 3
let bombZDepth:CGFloat = 4
let shipZDepth:CGFloat = 5
