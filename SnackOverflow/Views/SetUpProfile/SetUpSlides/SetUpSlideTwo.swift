//  SetUpSlideTwo.swift
//  SnackOverflow

import UIKit

class SetUpSlideTwo: UIView {                                 ///A new class SetUpSlideTwo is defined, which inherits from the UIView class

    @IBOutlet var SlideTwo: UIView!
    @IBOutlet weak var continueToSlideThree: UIButton!
    @IBOutlet weak var backToSlideOne: UIButton!
    
    override init(frame: CGRect) {                           //initiializer method when view is created programitically with a frame
        super.init(frame: frame)
        self.commonInit()                                     ///setting up the view
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()                                     ///initializing for view created in XIB

    }

    func commonInit(){

        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))             ///new UINib object is created, nib name is set to nname of the class....bundle is set to bundle of the class , so that the nib is loaded from appropriate bundle
        nib.instantiate(withOwner: self, options: nil)       ///instantiating the nib, connecting its elements to the current instance of the view class
        SlideTwo.frame = self.bounds                         ///making slideTwo to fill entire view
        SlideTwo.translatesAutoresizingMaskIntoConstraints = true  ///Enables Auto Layout constraints for the slideTwo view.
        addSubview(SlideTwo)                                 ///slideThree view is added as a subview to the current view
    }
    
}
