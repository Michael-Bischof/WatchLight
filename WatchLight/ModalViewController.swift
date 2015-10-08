//
//  ModalViewController.swift
//  WatchLight
//
//  Created by Michael Bischof on 07.10.15.
//  Copyright © 2015 Michael Bischof. All rights reserved.
//

import UIKit
import MessageUI

class ModalViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var buttonTwitter: UIButton!
    @IBOutlet weak var buttonMail: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonTwitter.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonMail.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        // Do any additional setup after loading the view.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func buttonTwitterPressed(sender: AnyObject) {
        let url:Optional<NSURL> = NSURL(string: "https://twitter.com/michael_bischof")
        if UIApplication.sharedApplication().canOpenURL(url!) {
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    @IBAction func buttonMailPressed(sender: AnyObject) {
        if (MFMailComposeViewController.canSendMail()) {
            
            let emailTitle = "WatchLight Software Feedback"
            let messageBody = ""
            let toRecipents = ["michael.bischof.dev@icloud.com"]
            
            let mc:MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            
            mc.setMessageBody(messageBody, isHTML: false)
            
            mc.setToRecipients(toRecipents)
            
            self.presentViewController(mc, animated: true, completion: nil)
            
        }else {
            
            print("No email account found")
            
        }
    }
    
    
    @IBAction func buttonExitPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("Mail Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail Failed")
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
