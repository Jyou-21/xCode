//
//  GameScene.swift
//  Snake
//
//  Created by Jack Younger on 4/15/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameLogo: SKLabelNode!
    var bestScore: SKLabelNode!
    var playButton: SKShapeNode!
    var currentScore: SKLabelNode!
    var playerPositions: [(Int, Int)] = []
    var gameBG: SKShapeNode!
    var gameArray: [(node: SKShapeNode, x: Int, y: Int)] = []
    var nodeList: [SKNode] = []
    var scorePos: CGPoint?
    var game: GameManager!
    
    @objc func swipeR() {
        game.swipe(ID: 3)
    }
    @objc func swipeL() {
        game.swipe(ID: 1)
    }
    @objc func swipeU() {
        game.swipe(ID: 2)
    }
    @objc func swipeD() {
        game.swipe(ID: 4)
    }
    
    override func didMove(to view: SKView) {
        game = GameManager(scene: self)
        initializeMenu()
        initializeGameView()
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeR))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeL))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeU))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeD))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    private func initializeGameView() {
        currentScore = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        currentScore.zPosition = 1
        currentScore.position = CGPoint(x: 0, y: (frame.size.height / -2) + 60)
        currentScore.fontSize = 40
        currentScore.isHidden = true
        currentScore.text = "Score: 0"
        currentScore.fontColor = SKColor.white
        self.addChild(currentScore)
        let width = frame.size.width - 200
        let height = frame.size.height - 300
        let rect = CGRect(x: -width / 2, y: -height / 2, width: width, height: height)
        gameBG = SKShapeNode(rect: rect, cornerRadius: 0.02)
        gameBG.fillColor = SKColor.darkGray
        gameBG.zPosition = 2
        gameBG.isHidden = true
        self.addChild(gameBG)
        createGameBoard(width: Int(width), height: Int(height))
    }
    
    private func createGameBoard(width:Int, height: Int){
        let cellWidth: CGFloat = 27.5
        let numRows = 40
        let numCols = 20
        var x = CGFloat(width / -2) + (cellWidth / 2)
        var y = CGFloat(height / 2) - (cellWidth / 2)
        for i in 0...numRows - 1 {
            for j in 0...numCols - 1 {
                let cellNode = SKShapeNode(rectOf: CGSize(width: cellWidth, height: cellWidth))
                cellNode.strokeColor = SKColor.black
                cellNode.zPosition = 2
                cellNode.position = CGPoint(x: x, y: y)
                gameArray.append((node: cellNode, x: i, y: j))
                gameBG.addChild(cellNode)
                x += cellWidth
            }
            x = CGFloat(width / -2) + (cellWidth / 2)
            y -= cellWidth
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                if node.name == "play_button" {
                    startGame()
                }
            }
        }
    }
    
    private func initializeMenu(){
        initGameLogo()
        initBestScore()
        initPlayButton()
        for node in nodeList {
            self.addChild(node)
        }
    }
    
    private func startGame() {
        print("start game")
        gameLogo.run(SKAction.move(by: CGVector(dx: -50, dy: 600), duration: 0.5)) {
            self.gameLogo.isHidden = true
        }
        playButton.run(SKAction.scale(to: 0, duration: 0.3)) {
            self.playButton.isHidden = true
        }
        let bottomCorner = CGPoint(x: 0, y: (frame.size.height / -2) + 20)
        bestScore.run(SKAction.move(to: bottomCorner, duration: 0.4)) {
            self.gameBG.setScale(0)
            self.currentScore.setScale(0)
            self.gameBG.isHidden = false
            self.currentScore.isHidden = false
            self.gameBG.run(SKAction.scale(to: 1, duration: 0.4))
            self.currentScore.run(SKAction.scale(to: 1, duration: 0.4))
            self.game.initGame()
        }
    }
    
    private func initGameLogo() {
        gameLogo = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        //position
        gameLogo.zPosition = 1
        gameLogo.position = CGPoint(x: 0, y: (frame.size.height / 2) - 200)
        //text
        gameLogo.fontSize = 60
        gameLogo.text = "Snake"
        gameLogo.fontColor = UIColor.red
        nodeList.append(gameLogo)
    }
    
    private func initBestScore() {
        bestScore = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        //position
        bestScore.zPosition = 1
        bestScore.position = CGPoint(x: 0, y: gameLogo.position.y - 50)
        //text
        bestScore.fontSize = 40
        bestScore.text = "Best Score: 0"
        bestScore.fontColor = SKColor.white
        bestScore.text = "Best Score: \(UserDefaults.standard.integer(forKey: "bestScore"))"
        
        nodeList.append(bestScore)
    }
    
    private func initPlayButton() {
        playButton = SKShapeNode()
        playButton.name = "play_button"
        //position
        playButton.zPosition = 1
        playButton.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        //Outline
        let topCorner = CGPoint(x: -50, y: 50)
        let bottomCorner = CGPoint(x: -50, y: -50)
        let middle = CGPoint(x: 50, y: 0)
        let path = CGMutablePath()
        path.addLines(between: [topCorner, bottomCorner, middle])
        //misc
        playButton.fillColor = UIColor.cyan
        playButton.path = path
        
        nodeList.append(playButton)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        game.update(time: currentTime)
    }
}

