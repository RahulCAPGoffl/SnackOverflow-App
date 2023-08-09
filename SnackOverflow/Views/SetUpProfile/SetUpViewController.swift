// SetUpViewController.swift
//  SnackOverflow


import UIKit

class SetUpViewController: UIViewController {                     //new class SetUpViewController inherits from UIViewController
    
    @IBOutlet weak var segmentControl: UISegmentedControl!        ///IBOutlet created to connect segmented views that has multiple segments, where onnlyy onne particuular segment can be selected at a time
    @IBOutlet weak var slideView: UIView!                         ///IBOutlet created to give reference for UIView that contains other subviews based on other user interactions
    var setSlideOne = SetUpSlideOne()                             ///initializing instance named setSlideOne for custom class named SetUpSlideOne
    var setSlideTwo = SetUpSlideTwo()                             ///initializing instance named setSlideTwo for custom class named SetUpSlideTwo
    var setSlideThree = SetUpSlideThree()                         ///initializing instance named setSlideThree for custom class named SetUpSlideThree
    var setSlideFour = SetUpSlideFour()                           ///initializing instance named setSlideFour for custom class named SetUpSlideFour
   
    override func viewDidLoad() {                                 ///calling this function so that the ViewControllers's view is loaded into memory
        super.viewDidLoad()
        segmentControls()
        slideOneSetUp()
    }
}


extension SetUpViewController{                                    // will have functions that extend functionality of SetUpViewConntroller, these are other methods that are defined outside of main class
    @objc func editClicked(_ : UIButton){                         //event for when edit button is clicked
        let vc = PersonalinfoViewController(nibName: "PersonalinfoViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen                   ///when action is performed entire PersonalinfoViewController is presented on fullscreen
        self.present(vc, animated: true, completion: nil)         ///This line presents the "vc" view controller modally on top of the current view controller
    }
    
    @objc func bundleEditClicked(_ : UIButton){                   ///event for BundleEdit button being clicked
        let vc = EditBundleViewController(nibName: "EditBundleViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen                   ///means the view controller will cover the full screen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func confirmInfoClicked(_ : UIButton){                  ///function called when "confirmButtonPressed" notification is recieved
          setSlideOne.continueButton.isHidden = false             ///shows the hidden property for editing the innfo page
    }
    @objc func slideOneSetUp(){
        setSlideOne = SetUpSlideOne(frame: slideView.bounds)        ///sets up the first slide
        slideView.addSubview(setSlideOne)                           ///adds setSlideOne as a subview of slideView
        segmentControl.selectedSegmentIndex = 0                     ///configures segment control to show this as first segment
        setSlideOne.buttonEdit.addTarget(self, action: #selector(editClicked(_:)), for: .touchUpInside)        ///sets up a target-action relationship for the button with the "buttonEdit" and tells when button is clicked editClicked function method is performed
        setSlideOne.continueButton.addTarget(self, action: #selector(slideTwoSetUp(_:)), for: .touchUpInside)  ///sets up a target-action relationship for the button with the "continueButtonn" and tells when button is clicked slideTwoSetUp function method is performed
        NotificationCenter.default.addObserver(self, selector: #selector(confirmInfoClicked(_ :)), name: NSNotification.Name(rawValue:"confirmButtonPressed"), object: nil)                                 ///when confirmButtonPressed notification is recieved, confirmInfoClicked method is performed
    }
    @objc func slideTwoSetUp(_: UIButton){
        setSlideTwo = SetUpSlideTwo(frame: slideView.bounds)         ///sets up the second slide
        slideView.addSubview(setSlideTwo)                            ///adds setSlideTwo as a subview of slideView
        segmentControl.selectedSegmentIndex = 1                      ///configures segment control to show this as second segment
        setSlideTwo.backToSlideOne.addTarget(self, action: #selector(slideOneSetUp), for: .touchUpInside)            ///sets up a target-action relationship for the back button and tells when button is clicked slideOneSetUp function method is performed
        setSlideTwo.continueToSlideThree.addTarget(self, action: #selector(slideThreeSetUp), for: .touchUpInside)    ///sets up a target-action relationship for the button with the "continueToSlideThree" and tells when button is clicked slideThreeSetUp function method is performed
    }
    @objc func slideThreeSetUp(){
        setSlideThree = SetUpSlideThree(frame: slideView.bounds)     ///sets up the third slide
        slideView.addSubview(setSlideThree)                          ///adds setSlideThree as a subview of slideView
        segmentControl.selectedSegmentIndex = 2                      ///configures segment control to show this as third segment
        setSlideThree.productViewCollection.register(ProductCell.nib, forCellWithReuseIdentifier: ProductCell.identifier) ///registering custom cell productCell with a collection view....so that the product cell is reused again
        setSlideThree.backToSlideTwo.addTarget(self, action: #selector(slideTwoSetUp(_:)), for: .touchUpInside)      ///sets up a target-action relationship for the back button and tells when button is clicked slideTwoSetUp function method is performed
        setSlideThree.continueToSlideFour.addTarget(self, action: #selector(slideFourSetUp), for: .touchUpInside)    ///sets up a target-action relationship for the button with the "continueToSlideFour" and tells when button is clicked slideFourSetUp function method is performed
    }
    @objc func slideFourSetUp(){
        setSlideFour = SetUpSlideFour(frame: slideView.bounds)       ///sets up the fourth slide
        slideView.addSubview(setSlideFour)                           ///adds setSlideFour as a subview of slideView
        segmentControl.selectedSegmentIndex = 3                      ///configures segment control to show this as fourthh segment
        setSlideFour.selectedItems = setSlideThree.selectedItems     ///sets data for slidefour based on items selected in slidethree
        setSlideFour.selectedItemBox.register(SelectedBoxItemCell.nib, forCellWithReuseIdentifier: SelectedBoxItemCell.identifier)   ///registering custom cell SelectedBoxItemCell with a collection view
        setSlideFour.itemListView.register(SelectedItemListCell.nib, forCellWithReuseIdentifier: SelectedItemListCell.identifier)    ///registering custom cell SelectedItemListCell with a table view .... lists out all the selected items
        setSlideFour.bundleEdit.addTarget(self, action: #selector(bundleEditClicked(_:)), for: .touchUpInside)                      ///sets up a target-action relationship for the edit button and tells when button is clicked bundleEditClicked method is performed
    }
    
    
        func segmentControls(){
            segmentControl.backgroundColor = UIColor.clear                  ///Setting its background color to clear
            segmentControl.setDividerImage(UIImage(systemName: "square.fill"), forLeftSegmentState: UIControl.State.disabled, rightSegmentState: UIControl.State.selected, barMetrics: UIBarMetrics
               .default)                                                    ///The custom divider image is a filled square system icon, and it will be shown when the left segment is disabled and the right segment is selected.
        }
    
}

 

