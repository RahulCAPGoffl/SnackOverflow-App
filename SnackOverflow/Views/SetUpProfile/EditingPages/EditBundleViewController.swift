//  EditBundleViewController.swift
//  SnackOverflow
import UIKit

class EditBundleViewController: UIViewController {                          ///EditBundleViewController which is a subclass of UIViewController. This means that EditBundleViewController will inherit properties and behaviors from UIViewController

    override func viewDidLoad() {                                           ///method is automatically called when the view of the view controller is loaded into memory.
        
        super.viewDidLoad()

        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.layer.borderColor = UIColor.systemGray5.cgColor
        
    }

    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func closeEditBundle(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func confirmEditBundle(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }

}
