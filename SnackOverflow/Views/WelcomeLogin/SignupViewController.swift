//
//  SignupViewController.swift
//  SnackOverflow
//
//  Created by Capgemini on 05/07/23.
//

import UIKit

    class SignupViewController: UIViewController {          //SignupViewController inherits from UIViewController

        @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!   //this outlet is used to connect constraint in XIB
        @IBOutlet weak var emailTextField: UITextField!{            //Emailinput field
            didSet{                                                 //didset is executed when outlet is connected to UIelement in XIB
              emailTextField.setLeftView(image: UIImage.init(named: "Email")!)       //sets image named as email to the left side
            }
        }

        @IBOutlet weak var createButtonClicked: UIButton!           //used to connect button in XIB
        
        @IBOutlet weak var passwordTextField: UITextField!{         //Password input field
            didSet{
              passwordTextField.setLeftView(image: UIImage.init(named: "Password")!)       //sets image named password to left side
              passwordTextField.isSecureTextEntry = true                                   //sets text field to be a secured text entry
              setRightView(image: UIImage.init(named: "Seen")!)                            //sets image named seen to right side
            }
        }


        override func viewDidLoad() {                   //Viewcontroller's view is loaded into memory
            super.viewDidLoad()
            self.hideKeyboardWhenTappedAround()         ///gesture to hide the keyboard when the user taps outside the text fields
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)      //Adjusts layout when keyboard appears
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)      //Adjusts layout when keyboard disappears
        }
        @objc func keyboardWillShow(notification:NSNotification){           //called when keyboard is about to show

            if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
                logoTopConstraint.constant = 20                             //moves logo upto 20points
            }
        }
        
        @objc func keyboardWillHide(notification:NSNotification){           //called when keyboard is about to hide
            logoTopConstraint.constant = 158                                //moves logo back to original position
        }
        

        func setRightView(image: UIImage) {                                 //used to set right view on password textfield
           let iconView = UIImageView(frame: CGRect(x: 0, y: 10, width: 25, height: 25))
           iconView.image = image
           let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
           iconContainerView.addSubview(iconView)
            passwordTextField.rightView = iconContainerView
            passwordTextField.rightViewMode = .always
           let tapOnShow = UITapGestureRecognizer(target: self, action: #selector(showPassword(_:)))   ///UITapGestureRecognizer is used to add gesture for that image
            iconView.isUserInteractionEnabled = true
            iconView.addGestureRecognizer(tapOnShow)      ///when the image view is tapped, the associated action showPassword will be executed.
         }

 
        @objc func showPassword(_ sender: Any) {          //called when image on passwordtextfield is tapped
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry     //toggling isSecureTextEntry mode
        }
        
        
        @IBAction func createButtonAction(_ sender: Any) {           //Action taken place when CreateButton is tapped
            let setUpViewController = SetUpViewController(nibName: "SetUpViewController", bundle: nil)
                    self.navigationController?.pushViewController(setUpViewController, animated: true)     ///new instance of SetUpViewController is created and sent to the navigation stack to navigate to new view controller
        }
        
        
    }

    extension SignupViewController{
        func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(WelcomeLoginViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false            //gesture on viewcontroller to dismiss the keyboard when touched anywhere on screen other than the textfield
            view.addGestureRecognizer(tap)
                                                                        
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)                               //dismissing the keyboard
        }
    }


   
   

