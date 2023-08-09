//
//  SelectedItemListCell.swift
//  SnackOverflow
//
//  Created by Capgemini on 20/07/23.
//

import UIKit

class SelectedItemListCell: UICollectionViewCell {             ///This line defines a new Swift class named SelectedItemListCell which is a subclass of UICollectionViewCell. It means that this class represents a custom cell that will be used in a collection view

    @IBOutlet weak var selectedBoxListImage: UIImageView!
    @IBOutlet weak var listProductName: UILabel!
    @IBOutlet weak var listView: UIView!
    
    
    
    static let identifier = "selected box item list"            ///identifier will be used later to identify the cell when dequeuing it from the collection view
    static var nib: UINib {
            
            return UINib(nibName: String(describing: self), bundle: nil)
                            ///returns a nib object based on the name of the class-----uses String(describing: self) to get the class name as a string----- nib object is used to load the cell from a nib (XIB) file
        }

        func setImage(image: UIImage){
            self.selectedBoxListImage.image = image
                                ///used to set the image of the selectedBoxListImage property with the provided image.
        }
        func setName(name: String){
        self.listProductName.text = name
                                ///used to set the text of the listProductName property with the provided name.
        }
}
