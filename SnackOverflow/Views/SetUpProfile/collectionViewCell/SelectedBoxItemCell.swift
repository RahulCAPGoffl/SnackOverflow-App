//
//  SelectedBoxItemCell.swift
//  SnackOverflow
//
//  Created by Capgemini on 20/07/23.
//

import UIKit

class SelectedBoxItemCell: UICollectionViewCell {               ///new Swift class called SelectedBoxItemCell, which inherits from UICollectionViewCell

    @IBOutlet weak var selectedBoxImage: UIImageView!

    static let identifier = "selected box item cell"            ///identifier which can be used to register and dequeue the cell in the collection view
    
    static var nib: UINib {
            return UINib(nibName: String(describing: self), bundle: nil)
                                                    ///returns a nib object based on the name of the class-----uses String(describing: self) to get the class name as a string----- nib object is used to load the cell from a nib (XIB) file
        }

        func setImage(image: UIImage){
            self.selectedBoxImage.image = image
                                                    ///this function sets the image property of the selectedBoxImage UIImageView by updating the image displayed in the cell.
        }
}
