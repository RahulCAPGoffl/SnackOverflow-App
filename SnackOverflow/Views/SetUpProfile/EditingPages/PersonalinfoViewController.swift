//  PersonalinfoViewController.swift
//  SnackOverflow

import UIKit
class PersonalinfoViewController: UIViewController {                            ///PersonalinfoViewController which is a subclass of UIViewController. This means that PersonalinfoViewController will inherit properties and behaviors from UIViewController
    
    override func viewDidLoad() {                                               ///method is automatically called when the view of the view controller is loaded into memory.
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }

    @IBAction func confirmButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"confirmButtonPressed"), object: nil)
        self.dismiss(animated: true,completion: nil)
        ///the code sends a notification with the name "confirmButtonPressed" using the default NotificationCenter. After posting the notification, it dismisses the current view controller with an optional animated transition.
        
    }

}
