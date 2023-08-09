//  SetUpSlideFour.swift
//  SnackOverflow

import UIKit

class SetUpSlideFour: UIView {                                              ///A new class SetUpSlideFour is defined, which inherits from the UIView class

    @IBOutlet var slideFour: UIView!
    @IBOutlet weak var selectedItemBox: UICollectionView!
    @IBOutlet weak var itemListView: UICollectionView!
    @IBOutlet weak var bundleEdit: UIButton!
    
    var selectedItems: [String] = []                                        ///array of strings that will store the selected items.
    
    override init(frame: CGRect) {
        super.init(frame: frame)                                            ///initiializer method when view is created programitically with a frame
        self.commonInit()                                                   ///setting up the view
    }

    required init?(coder: NSCoder) {                                        ///initializing for view created in XIB
        super.init(coder: coder)
        self.commonInit()

    }

    func commonInit(){                                                      ///setting up the view

        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))   ///new UINib object is created, nib name is set to nname of the class....bundle is set to bundle of the class , so that the nib is loaded from appropriate bundle
        nib.instantiate(withOwner: self, options: nil)                                                     ///instantiating the nib, connecting its elements to the current instance of the view class
        slideFour.frame = self.bounds                                                                      ///making slidefour to fill entire view
        slideFour.translatesAutoresizingMaskIntoConstraints = true                                         ///Enables Auto Layout constraints for the slideFour view.
        addSubview(slideFour)                                                                              ///slideFour view is added as a subview to the current view
    }
    
}
extension SetUpSlideFour: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{    ///extends its functionality to adopt three protocols ... Instances of this class can act as the data source, delegate, and layout delegate for a UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (selectedItems.count)                                                   ///Returns the count of selectedItems, which determines the number of cells to be displayed
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == selectedItemBox{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedBoxItemCell.identifier, for: indexPath) as! SelectedBoxItemCell
                       ///cell is dequeued with SelectedBoxItemCell and casts it to SelectedBoxItemCell
            cell.selectedBoxImage.layer.cornerRadius = 10
            cell.setImage(image:UIImage(named: selectedItems[indexPath.row])!)
            return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedItemListCell.identifier, for: indexPath) as! SelectedItemListCell
                       ///cell is dequeued with SelectedItemListCell and casts it to SelectedItemListCell
            cell.setImage(image:UIImage(named: selectedItems[indexPath.row])!)
            cell.setName(name: selectedItems[indexPath.row])
            cell.listView.layer.cornerRadius = 10
            return cell
        }
    }
}
