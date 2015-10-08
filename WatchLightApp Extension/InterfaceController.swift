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

    var userDefaults = NSUserDefaults.standardUserDefaults()
    var timer:NSTimer?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        //userDefaults.setBool(false, forKey: "AlertShown")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showAlert", userInfo: nil, repeats: false)
        
    }
    
    func showAlert() {
        let alertShown = userDefaults.boolForKey("AlertShown")
        timer?.invalidate()
        
        if !alertShown {
            userDefaults.setBool(true, forKey: "AlertShown")
            let okButton = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                print("ok")
            })
            let actions = [okButton]
            presentAlertControllerWithTitle("Hey there!", message: "Thanks for downloading WatchLight! To ensure that your WatchLight does not turn off, move the Digital Crown around while using WatchLight. Use Force Touch to get more information about how to enhance your WatchLight experience.", preferredStyle: WKAlertControllerStyle.Alert, actions: actions)
            
            
        }
    }

    @IBAction func menuItemBrightness() {
        presentControllerWithName("BrightnessController", context: nil)
    }
    
    @IBAction func menuItemKeepOn() {
        presentControllerWithName("KeepOnController", context: nil)
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
