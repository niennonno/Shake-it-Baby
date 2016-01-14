//
//  ViewController.swift
//  Shake it, Baby
//
//  Created by Aditya Vikram Godawat on 14/01/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["blood", "dumdum", "knife", "pop", "sheath", "shot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
        
            print("Shake")
    
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
        
            do {    try player = AVAudioPlayer (contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                    player.play()
                
            } catch {   print("Error")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

