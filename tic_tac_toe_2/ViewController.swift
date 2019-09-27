//
//  ViewController.swift
//  tic_tac_toe_2
//
//  Created by COE-02 on 26/09/19.
//  Copyright © 2019 COE-02. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var label: UILabel!
   
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameisActive = true
    @IBAction func cross(_ sender: AnyObject)
    {
        if(gameState[sender.tag-1] == 0 && gameisActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "cro1.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "nou1.jpg"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameisActive = false
                
                if gameState[combination[0]] == 1
                {
                        print ("cro1")
                        label.text = "Cross Has Won"
                }
                else
                {
                    label.text = "Nought Has Won"
                }
                playagainbutton.isHidden = false
                label.isHidden = false
            }
        }
    gameisActive = false
        
        for i in gameState
        {
            if i == 0
            {
               gameisActive = true
                break
            }
        }
        
        if gameisActive == false
        {
            label.text = "It Was A Draw"
            label.isHidden = false
            playagainbutton.isHidden = false
        }
    }
    @IBAction func playagain(_ sender: Any)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameisActive = true
        activePlayer = 1
        
        playagainbutton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    @IBOutlet weak var playagainbutton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

