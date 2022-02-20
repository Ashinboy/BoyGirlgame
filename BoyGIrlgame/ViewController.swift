//
//  ViewController.swift
//  RPSgame
//
//  Created by Ashin Wang on 2022/2/20.
//

import UIKit

class ViewController: UIViewController {
    //圖片
    
    @IBOutlet weak var chestnutImage: UIImageView!
    
    let handImageView = ["upHand","downHand","leftHand","rightHand"]
    
    let chestnutImageView = ["up","down","left","right"]
    
    //按鈕
    @IBOutlet weak var upButtonOutlet: UIButton!
    @IBOutlet weak var downButtonOutlet: UIButton!
    @IBOutlet weak var leftButtonOutlet: UIButton!
    @IBOutlet weak var rightButtonOutlet: UIButton!
    
    //再玩一次
    @IBOutlet weak var playAgainButtonOutlet: UIButton!
    //計分板
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var AIScoreLabel: UILabel!
    
    var Aiscore = 0
    var score = 0
    let dirctions : [Direction] = [.up,.down,.left,.right]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "玩家得分：0"
        AIScoreLabel.text = "電腦得分：0"
        chestnutImage.image = UIImage(named: "front")
        
        // Do any additional setup after loading the view.
    }
    @IBAction func dirsctionsButton(_ sender: UIButton) {
        
        let direction = dirctions.randomElement()!
        
        chestnutImage.image = UIImage(named: direction.rawValue)
        
        var isWIn = false
        switch sender{
        case upButtonOutlet:
            isWIn = direction == .up
        case downButtonOutlet:
            isWIn = direction == .down
            
        case leftButtonOutlet:
            isWIn = direction == .left
            
        case rightButtonOutlet:
            isWIn = direction == .right
            
        default:
            break
        }
        
        if isWIn{
            score += 5
            scoreLabel.text = "玩家得分：" + "\(score)"
            
            if score == 30 {
                let controller = UIAlertController(title: "你是鬼吧!這樣都可以贏!", message: "恭喜玩家獲得\(score)分!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "結束", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
                endGame()
                
            }
        }else{
            Aiscore += 5
            AIScoreLabel.text = "電腦得分：" + "\(Aiscore)"
            if Aiscore == 30{
                let controller = UIAlertController(title: "知道厲害了吧!", message: "恭喜AI獲得\(Aiscore)分!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "結束", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
                endGame()
            }
        }
        
        
    }
    
    func endGame() {
        score = 0
        scoreLabel.text = "玩家得分：" + "\(score)"
        
        Aiscore = 0
        AIScoreLabel.text = "電腦得分：" + "\(Aiscore)"
        
        chestnutImage.image = UIImage(named: "front")
    }
    
    
    //    @IBAction func rePlay(_ sender: UIButton) {
    //        score = 0
    //        scoreLabel.text = "玩家得分：" + "\(score)"
    //
    //        Aiscore = 0
    //        AIScoreLabel.text = "電腦得分：" + "\(Aiscore)"
    //
    //        chestnutImage.image = UIImage(named: "front")
    //    }
    //
    
}

