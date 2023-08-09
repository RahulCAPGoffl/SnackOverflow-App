// WelcomeLoginViewController.swift
//  SnackOverflow


import UIKit

class WelcomeLoginViewController: UIViewController,UITextFieldDelegate {      ///WelcomeLoginViewController inherits from UIViewController and confirms UITextFieldDelegate prootocol

    @IBOutlet weak var logo: UIImageView!                               
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: UITextField!{
        didSet{                                                                 //didset is executed when outlet is connected to UIelement in XIB
          emailTextField.setLeftView(image: UIImage.init(named: "Email")!)      //sets image named as email to the left side
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{                                                                    //didset is executed when outlet is connected to UIelement in XIB
          passwordTextField.setLeftView(image: UIImage.init(named: "Password")!)   //sets image named password to left side
          passwordTextField.isSecureTextEntry = true                               //sets text field to be a secured text entry
          setRightView(image: UIImage.init(named: "Seen")!)                        //sets image named seen to right side
        }
    
    }
    
    override func viewDidLoad() {                             //viewcontroller's view is loaded into the memory
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()                   //gesture to hide keyboard when tapped outside oof textfield
        emailTextField.delegate = self                        //WelcomeLoginViewController will handle events related to emailTextField
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)       //Adjusts layout when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)       //Adjusts layout when keyboard disappears
    }
    
    @objc func keyboardWillShow(notification:NSNotification){            //called when keyboard is about to show

        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            logoTopConstraint.constant = 20                              //moves logo upto 20points
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){            //called when keyboard is about to hide
        logoTopConstraint.constant = 158                                 //moves logo to original position
    }
    
    
    func setRightView(image: UIImage) {                                  //used to set right view on password textfield
       let iconView = UIImageView(frame: CGRect(x: 0, y: 10, width: 25, height: 25))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
       iconContainerView.addSubview(iconView)
        passwordTextField.rightView = iconContainerView
        passwordTextField.rightViewMode = .always
       let tapOnShow = UITapGestureRecognizer(target: self, action: #selector(showPassword(_:)))    ///UITapGestureRecognizer is used to add gesture for that image
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapOnShow)                           ///when the image view is tapped, the associated action showPassword will be executed.
        
     }
    @objc func showPassword(_ sender: Any){                                 //called when image on passwordtextfield is tapped
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry    //toggling isSecureTextEntry mode
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {              ///implements UITextField delegate
        print(emailTextField.text!)
        emailTextField.endEditing(true)
        return true                                                             ///emails text field is printed
    }
    
  
    
    @IBAction func loginButtonClicked(_ sender: Any) {                    //mmethod for Login button being clicked
    }
}



extension WelcomeLoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(WelcomeLoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false                           //gesture on viewcontroller to dismiss the keyboard when touched anywhere on screen other than the textfield
        view.addGestureRecognizer(tap)          
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)                                       //dismissing the keyboard
    }
    
}


extension UITextField {
  
    func setLeftView(image: UIImage) {                          //function to set image in a textfield on the left side
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
  }
    
}
