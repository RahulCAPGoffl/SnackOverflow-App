//  OnboardingViewController.swift
//  SnackOverflow

import UIKit

class OnboardingViewController: UIViewController {    //new class OnboardingViewController subclass of UIViewController....this will serve as viewcontroller for onboarding screen

    @IBOutlet weak var pageControl: UIPageControl!        //IBOutlet created for pagecontrol-which indicates current page in collecction view
    @IBOutlet weak var getStartedButton: UIButton!        //creates outlet for a UIButton named getStartedButton
    @IBOutlet weak var collectionView: UICollectionView!  //creates an outlet for a UICollectionView named collectionView
    var pageControlImages: [UIImage] = [ UIImage(named: "page1Control")!,UIImage(named: "page2Control")!, UIImage(named: "page3Control")!]  //this array holds 3 uiimages that are uused to set page inndicators
    var slides: [OnboardingSlide] = [
        OnboardingSlide(title: "Hand-pickle high quality snacks.",image:UIImage(named: "Slide 1 Pic")!),
        OnboardingSlide(title: "Shop global. Mind-blownly affordable", image: UIImage(named: "Slide 2 Pic")!),
        OnboardingSlide(title: "Deliver on the promise of time.", image: UIImage(named: "Slide 3 Pic")!)]
                    ///slides is an array which has an instance of struuct OnboardingSlide from models
    
    var currentPage = 0{                 //declares property "currentPage"
        didSet{                          // didset is used so that it updates the UIPageControl and Button text when the current page changes
            pageControl.currentPage = currentPage
            if currentPage == slides.count-1{
                getStartedButton.setTitle("Get Started", for: .normal)
            }
            else{
                getStartedButton.setTitle("Next", for: .normal)
            }
            
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()  //inBuilt lifecycle method that is called when view has been loaded into the memory
        pageControl.setCurrentPageIndicatorImage(UIImage(named: "page1Control"), forPage: 0)  //set pageindiactor to 1
        pageControl.pageIndicatorTintColor = UIColor.clear          ///hides page inndicator dots
       
    }
    
    @IBAction func onClickGetStarted(_ sender: Any) {         //IBAction is created so that when user intracts by pressing the button
        if currentPage == slides.count-1{   /// goes to next viewcontroller if iit is last slide
            let welcomeMainViewController = WelcomeMainViewController(nibName: "WelcomeMainViewController", bundle: nil)    //instannce of welcomeaminview conrtoler is created annd nib name is specified for the file associated with that viewcontroller
            // bundle is set to nil because the it is present in the main bundle
                    self.navigationController?.pushViewController(welcomeMainViewController, animated: true)   //it meanns the welcomemainviewcontroller is bbeing pushed to navigation stack and the new view controller is the top view controller now
        }
        else{                               /// goes to next slide if there are more slides left
            currentPage += 1      //current page is incremented
            let indexPath = IndexPath(item: currentPage, section: 0)  ///specifies the index of next slide
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.setCurrentPageIndicatorImage(pageControlImages[indexPath.row], forPage: indexPath.row)  // sets current pagecontrol image specified in pagecontrolimage array for the current page index
        }
        
    }

}


// MARK: - CollectionView Delegate Methods
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource{  //extension takes protocols from datasource and delegates soo that it can handle events annd provide data to collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    } // returns number of Onboardingslides in collectioon view
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardCell", for: indexPath) as! OnboardingCollectionViewCellController
        cell.setUpSlide(slides[indexPath.row])
        return cell
    } // returns what every cell should display
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height:collectionView.frame.height )
    } // returns CGSize;Measurement;Width and height of each cell
      ///optional delegate function
    

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
        currentPage = indexPath.item
    } //to get to know the current page index
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(item: currentPage, section: 0)
        pageControl.setCurrentPageIndicatorImage(pageControlImages[indexPath.row], forPage: indexPath.row)
        pageControl.pageIndicatorTintColor = UIColor.clear
    } //what happenes after we swipe
      // current page is changed right after swiping is done
 
}
