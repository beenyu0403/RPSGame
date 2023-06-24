//
//  ViewController.swift
//  RPSGame
//
//  Created by user on 2023/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImage: UIImageView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var comLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    var rpsArr:[UIImage] = [#imageLiteral(resourceName: "paper"), #imageLiteral(resourceName: "scissors"), #imageLiteral(resourceName: "rock")]
    var myChoice:Rps = Rps.rock
    var score:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        let title = sender.currentTitle!
        comImage.image = #imageLiteral(resourceName: "ready")
        comLabel.text = "준비"
        switch title {
        case "가위":
            myChoice = Rps.scissors
            myImage.image = rpsArr[1]
            myLabel.text = "가위"
        case "바위":
            myChoice = Rps.rock
            myImage.image = rpsArr[2]
            myLabel.text = "바위"
        case "보":
            myChoice = Rps.paper
            myImage.image = rpsArr[0]
            myLabel.text = "보"
        default:
            break
        }
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        comImage.image = rpsArr.randomElement()
        switch comImage.image {
        case rpsArr[0]:
            comLabel.text = "보"
        case rpsArr[1]:
            comLabel.text = "가위"
        case rpsArr[2]:
            comLabel.text = "바위"
        default:
            comLabel.text = "준비"
        }
        
        switch myChoice {
        case Rps.rock:
            
            if comImage.image == rpsArr[0] {
                mainLabel.text = "졌습니다.."
                score -= 1
                scoreLabel.text = "SCORE: " + String(score)
            }else if comImage.image == rpsArr[1] {
                mainLabel.text = "이겼습니다!"
                score += 1
                scoreLabel.text = "SCORE: " + String(score)
            }else {
                mainLabel.text = "비겼습니다"
                scoreLabel.text = "SCORE: " + String(score)
            }
        case Rps.scissors:
            
            if comImage.image == rpsArr[0] {
                mainLabel.text = "이겼습니다!"
                score += 1
                scoreLabel.text = "SCORE: " + String(score)
            }else if comImage.image == rpsArr[1] {
                mainLabel.text = "비겼습니다"
                scoreLabel.text = "SCORE: " + String(score)
            }else {
                mainLabel.text = "졌습니다.."
                score -= 1
                scoreLabel.text = "SCORE: " + String(score)
            }
        case Rps.paper:
            
            if comImage.image == rpsArr[0] {
                mainLabel.text = "비겼습니다"
                scoreLabel.text = "SCORE: " + String(score)
            }else if comImage.image == rpsArr[1] {
                mainLabel.text = "졌습니다.."
                score -= 1
                scoreLabel.text = "SCORE: " + String(score)
            }else {
                mainLabel.text = "이겼습니다!"
                score += 1
                scoreLabel.text = "SCORE: " + String(score)
            }
        default:
            break
        }
        
        
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        comImage.image = #imageLiteral(resourceName: "ready")
        myImage.image = #imageLiteral(resourceName: "ready")
        comLabel.text = "준비"
        myLabel.text = "준비"
        scoreLabel.text = "SCORE: 0"
        score = 0
    }
    

}

