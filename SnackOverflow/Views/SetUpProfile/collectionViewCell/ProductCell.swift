//
//  ProductCell.swift
//  SnackOverflow
//
//  Created by Capgemini on 18/07/23.
//

import UIKit

class ProductCell: UICollectionViewCell {

    static let identifier = "product item cell"                             ///identifier will be used later to identify the cell when dequeuing it from the collection view
    
    @IBOutlet var itemCellView: UICollectionViewCell!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var outerCellView: UIView!
    @IBOutlet weak var selectedTick: UIImageView!
    @IBOutlet weak var innerCellView: UIView!
    
    static var nib: UINib {
            return UINib(nibName: String(describing: self), bundle: nil)
                                                                            ///returns a nib object based on the name of the class-----uses String(describing: self) to get the class name as a string----- nib object is used to load the cell from a nib (XIB) file
        }

        func setImage(image: UIImage){
            self.itemImage.image = image                                    ///used to set the image of the selectedBoxListImage property with the provided image.
        }
    
        func setName(name: String){
            self.itemName.text = name                                       ///used to set the text of the listProductName property with the provided name.
        }
    
}
