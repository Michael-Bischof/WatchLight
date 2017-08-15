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

        buttonTwitter.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        buttonMail.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    @IBAction func buttonTwitterPressed(_ sender: AnyObject) {
        let url:Optional<URL> = URL(string: "https://twitter.com/michael_bischof")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.openURL(url!)
        }
    }
    
    @IBAction func buttonMailPressed(_ sender: AnyObject) {
        if (MFMailComposeViewController.canSendMail()) {
            
            let emailTitle = "WatchLight Software Feedback"
            let messageBody = ""
            let toRecipents = ["michael.bischof.dev@icloud.com"]
            
            let mc:MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            
            mc.setMessageBody(messageBody, isHTML: false)
            
            mc.setToRecipients(toRecipents)
            
            self.present(mc, animated: true, completion: nil)
            
        }else {
            
            print("No email account found")
            
        }
    }
    
    
    @IBAction func buttonExitPressed(_ sender: AnyObject) {
        dismiss(animated: true) { () -> Void in }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
            
        case MFMailComposeResult.cancelled.rawValue:
            print("Mail Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Mail Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Mail Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Mail Failed")
        default:
            break
            
        }
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
