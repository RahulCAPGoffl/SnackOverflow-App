//
//  WelcomeMainViewController.swift
//  SnackOverflow
//
//  Created by Capgemini on 23/06/23.
//

import UIKit

class WelcomeMainViewController: UIViewController {      //WelcomeMainViewController will inherit all properties and behaviour of UIViewController
    
    override func viewDidLoad() {                 // called when viewcontrollers view is loaded into memory
        super.viewDidLoad()
        setBackground()                           // setBackground function is called
        self.navigationController?.navigationBar.isHidden = true  //for hiding the navigation bar
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {  //called when login Button is pressed
        let welcomeLoginViewController = WelcomeLoginViewController(nibName: "WelcomeLoginViewController", bundle: nil)           //new instance of WelcomeLoginViewController is created
                self.navigationController?.pushViewController(welcomeLoginViewController, animated: true)   //pushes welcomeLoginViewController to navigation stack

    }
    
    @IBAction func emailPressed(_ sender: Any) {   //called when login Button is pressed
        let signupViewController = SignupViewController(nibName: "SignupViewController", bundle: nil)       //new instance of WelcomeLoginViewController is created/
                self.navigationController?.pushViewController(signupViewController, animated: true)         //pushes signupViewController to navigation stack
    }
    
}


extension WelcomeMainViewController{
    func setBackground(){
        let background = UIImage(named: "OrangeBackground")
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill    ///maintains the aspect ratio and fills the entire view with the image
        imageView.clipsToBounds = true  ///Clips the image view to its bounds, ensuring that the image doesn't overflow outside of the view's boundaries
        imageView.image = background   ///Sets the loaded image as the content of the image view.
        imageView.center = view.center
        imageView.alpha = 0.30         ///making it slightly transparent
        view.addSubview(imageView)
        self.view.insertSubview(imageView, at: 0)
    }
}
