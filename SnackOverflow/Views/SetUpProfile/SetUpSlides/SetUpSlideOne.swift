//
//  SetUpSlideOne.swift
//  SnackOverflow
//
//  Created by Capgemini on 17/07/23.
//

import UIKit

class SetUpSlideOne: UIView {                           ///A new class SetUpSlideOne is defined, which inherits from the UIView class
   
    @IBOutlet var slideOne: UIView!
    @IBOutlet weak var buttonEdit: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    
    override init(frame: CGRect) {                      ///initiializer method when view is created programitically with a frame
        super.init(frame: frame)
        self.commonInit()                               ///setting up the view
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()                               ///initializing for view created in XIB

    }

    func commonInit(){

        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))              ///new UINib object is created, nib name is set to nname of the class....bundle is set to bundle of the class , so that the nib is loaded from appropriate bundle
        nib.instantiate(withOwner: self, options: nil)        ///instantiating the nib, connecting its elements to the current instance of the view class
        slideOne.frame = self.bounds                          ///making slideOne to fill entire view
        slideOne.translatesAutoresizingMaskIntoConstraints = true     ///Enables Auto Layout constraints for the slideOne view.
        continueButton.isHidden = true                       ///hides continue button
        addSubview(slideOne)                                  ///slideOne view is added as a subview to the current view
    }
    
    
    
}
