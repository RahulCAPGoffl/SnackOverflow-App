//  SetUpSlideThree.swift
//  SnackOverflow

import UIKit

class SetUpSlideThree: UIView {                                                          ///A new class SetUpSlideFour is defined, which inherits from the UIView class

    @IBOutlet var slideThree: UIView!
    @IBOutlet weak var backToSlideTwo: UIButton!
    @IBOutlet weak var productViewCollection: UICollectionView!
    @IBOutlet weak var continueToSlideFour: UIButton!
    public var selectedItems : [String] = []                                             ///declares a public array variable called selectedItems, which is initially empty
   
    
    let products : [String] = [ "Dalgona","Oreo","RedBeanMochi","Samosa","ShavedIce","Simit", "Strawberry","Taiyaki"]   ///Constant array products of 8 elements
    
    override init(frame: CGRect) {                                                      ///initiializer method when view is created programitically with a frame
        super.init(frame: frame)
        self.commonInit()                                                               ///setting up the view
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)                                                        ///initializing for view created in XIB
        self.commonInit()

    }

    func commonInit(){                                                                  ///Setting up the view
        
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))     ///new UINib object is created, nib name is set to nname of the class....bundle is set to bundle of the class , so that the nib is loaded from appropriate bundle
        nib.instantiate(withOwner: self, options: nil)                                                        ///instantiating the nib, connecting its elements to the current instance of the view class
        slideThree.frame = self.bounds                                                                        ///making slideThree to fill entire view
        slideThree.translatesAutoresizingMaskIntoConstraints = true                                           ///Enables Auto Layout constraints for the slideFour view.
        addSubview(slideThree)                                                                                ///slideThree view is added as a subview to the current view
    }

}

extension SetUpSlideThree : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{          ///extends its functionality to adopt three protocols ... Instances of this class can act as the data source, delegate, and layout delegate for a UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (products.count)
                                ///Returns the count of products in collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
                                ///dequeues a reusable cell of type ProductCell from the collection view and configures it with the product data.
        cell.itemName.lineBreakMode = .byWordWrapping                           ///property determines how the text inside the label should be laid out if it exceeds the label's width
        cell.outerCellView.layer.cornerRadius = 10
        cell.innerCellView.layer.cornerRadius = 10
        cell.itemImage.layer.cornerRadius = 10
        cell.setImage(image:UIImage(named: products[indexPath.row])!)           ///sets the image corresponding to the product based on indexPath.row in the products array
        cell.setName(name: products[indexPath.row])                             ///sets the name corresponding to the product based on indexPath.row in the products array
            
             return cell
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {

        let cell = collectionView.cellForItem(at: indexPath) as! ProductCell
        if selectedItems.count < 4 || selectedItems.contains(cell.itemName.text!){             ///if number of selected items is less than 4 OR selected items already conntain an item name which is selected
            
            if (cell.selectedTick.isHidden){                                                  ///for selection
                cell.outerCellView.isHidden = true                                            ///hides outer cell
                cell.selectedTick.isHidden = false                                            ///shows the checkmark by disabling ishidden
                cell.innerCellView.layer.borderColor = UIColor(red:200/255, green:207/255, blue:45/255, alpha: 1).cgColor   ///setting inner border for item
                cell.innerCellView.layer.borderWidth = 2
                selectedItems.append(cell.itemName.text!)                                     ///Adds the item's name to the selectedItems array
            }
            else{                                                                             ///for deselction
                cell.outerCellView.isHidden = false                                           ///shows outer cell
                cell.selectedTick.isHidden = true                                             ///disables the checkmark
                cell.innerCellView.layer.borderColor = UIColor.clear.cgColor                  ///clears border
                cell.innerCellView.layer.borderWidth = 0
                selectedItems.remove(at: selectedItems.firstIndex(of: cell.itemName.text!)!)  ///removes the item's name from the selectedItems array.
            }
            return true
        }
        else{ return false }
        
    }
    
}
