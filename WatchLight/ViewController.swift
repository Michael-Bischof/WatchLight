//
//  ViewController.swift
//  WatchLight
//
//  Created by Michael Bischof on 03.10.15.
//  Copyright © 2015 Michael Bischof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:NSTimer?
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var buttonTut: UIButton!
    
    var tutorialShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func buttonTutPressed(sender: AnyObject) {
        
        if tutorialShowing {
            tutorialShowing = false
            resetLabelAndButton()
        } else {
            showTut()
        }
    }
    
    func resetLabelAndButton(){
        imageViewBackground.stopAnimating()
        buttonTut.setTitle("How to keep WatchLight on", forState: UIControlState.Normal)
        labelText.text = "Install WatchLight on your Apple Watch to get a flashlight right on your wrist."
        timer?.invalidate()
        timer = nil
    }
    
    func showTut() {
        var animationArray = [UIImage]()
        
        for i in 0...59 {
            if i < 10 {
                animationArray.append(UIImage(named: "WatchLight_AppleWatch_big_0\(i)")!)
            } else {
                animationArray.append(UIImage(named: "WatchLight_AppleWatch_big_\(i)")!)
            }
            
        }
        
        imageViewBackground.animationImages = animationArray
        imageViewBackground.animationDuration = 2.0
        imageViewBackground.animationRepeatCount = 0
        imageViewBackground.startAnimating()
        
        buttonTut.setTitle("Got it!", forState: UIControlState.Normal)
        labelText.text = "To ensure that your WatchLight does not turn off, move the Digital Crown up and down while using WatchLight. If the screen turns off anyway, tap the screen once."
        
        tutorialShowing = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

