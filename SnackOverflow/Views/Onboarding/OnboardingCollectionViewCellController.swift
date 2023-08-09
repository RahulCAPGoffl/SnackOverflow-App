//
//  OnboardingCollectionViewCellController.swift
//  SnackOverflow
//
//  Created by Capgemini on 22/06/23.
//

import UIKit

class OnboardingCollectionViewCellController: UICollectionViewCell {  //new class which is a subclass of UICollectionCell....will serve as a custom cell in collection view used in onboarding screen
    
    @IBOutlet weak var slideTitle: UILabel!              ///reates an outlet for a UILabel named slideTitle used to display title
    @IBOutlet weak var slideImageView: UIImageView!      ///creates an outlet for a UIImageView named slideImageView used to display image
    
    func setUpSlide(_ slide:OnboardingSlide){     
        self.slideTitle.text = slide.title             ///It updates the label's text to display the title of the onboarding slide
        self.slideImageView.image = slide.image        ///It updates the image view's image to display the image of the onboarding slide.
        
    }
    
}
