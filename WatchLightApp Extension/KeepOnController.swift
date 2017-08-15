//
//  KeepOnController.swift
//  WatchLight
//
//  Created by Michael Bischof on 05.10.15.
//  Copyright © 2015 Michael Bischof. All rights reserved.
//

import WatchKit
import Foundation


class KeepOnController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func buttonBackPressed() {
        dismiss()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
