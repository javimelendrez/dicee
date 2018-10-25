//
//  ViewController.swift
//  Dicee
//
//  Created by javier melendrez on 10/10/18.
//  Copyright © 2018 Javier Melendrez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //how to create and array
    //array index starts at 0 like in c++
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    //going to create a variable
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    //create an instance of AVAudioPLayer using the AVFoundation frameworks
    var audioPlayer : AVAudioPlayer!
    
    
    @IBOutlet weak var diceimageview1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func RollButtonPressed(_ sender: UIButton) {
        //call the function
        updateDiceImages()
        //calll func to play audio sound of rolling dice
        playSoundW(fileName: "roll", fileEx: "wav")
    }
    //this is for the dice to roll after the motion has ended
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        //you call this function to change images when the phone gets shaked
        updateDiceImages()
        //calll func to play audio sound of rolling dice
        playSoundW(fileName: "roll", fileEx: "wav")

    }
    
    func updateDiceImages()
    {
        //this will execute when the button is pressed
        //this assigns new numbers that are random between 0-5
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        //this is how to print to the console
       // print(randomDiceIndex1)
        //print(randomDiceIndex2)
        
        //this access the image and changes its values
        //use the random number to access the index of the array image name
        diceimageview1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    //func to play the sound
    func playSoundW (fileName : String, fileEx : String) -> Void
    {
        //gather the audio file source location
        let audioSourceUrl : URL!
        audioSourceUrl = Bundle.main.url(forResource: fileName, withExtension: fileEx)
        //now check if file contanis an address or nil value
        if audioSourceUrl == nil
        {
            print("can not play song")
        }
        else
        {
            //prepare the audio to play the track
            do
            {
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceUrl)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch
            {
                print(error)
            }
        }
    }
}

