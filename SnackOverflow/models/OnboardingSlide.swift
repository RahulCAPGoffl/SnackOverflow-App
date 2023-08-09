//  OnboardingSlide.swift
//  SnackOverflow

import UIKit

struct OnboardingSlide{                                              //encapsulates data properties and functionalities
    let title: String                                                // hold title property of each onboarding slide
    let image: UIImage                                               // hold image property of each onboarding slide
    
    init(title: String, image: UIImage) {                            // initalizer is used here to create and setup instance of struct
        self.title = title
        self.image = image                                           //self is used so that it specifies that the instance is being created
                            
    }
}
