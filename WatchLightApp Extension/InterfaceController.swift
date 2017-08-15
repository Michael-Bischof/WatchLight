//
//  InterfaceController.swift
//  WatchLightApp Extension
//
//  Created by Michael Bischof on 03.10.15.
//  Copyright © 2015 Michael Bischof. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var userDefaults = UserDefaults.standard
    var timer:Timer?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(InterfaceController.showAlert), userInfo: nil, repeats: false)
        
    }
    
    func showAlert() {
        let alertShown = userDefaults.bool(forKey: "AlertShown")
        timer?.invalidate()
        
        if !alertShown {
            userDefaults.set(true, forKey: "AlertShown")
            let okButton = WKAlertAction(title: "OK", style: WKAlertActionStyle.cancel, handler: { () -> Void in
                print("ok")
            })
            let actions = [okButton]
            presentAlert(withTitle: "Hey there!", message: "Thanks for downloading WatchLight! To ensure that your WatchLight does not turn off, move the Digital Crown around while using WatchLight. Use Force Touch to get more information about how to enhance your WatchLight experience.", preferredStyle: WKAlertControllerStyle.alert, actions: actions)
            
            
        }
    }

    @IBAction func menuItemBrightness() {
        presentController(withName: "BrightnessController", context: nil)
    }
    
    @IBAction func menuItemKeepOn() {
        presentController(withName: "KeepOnController", context: nil)
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
