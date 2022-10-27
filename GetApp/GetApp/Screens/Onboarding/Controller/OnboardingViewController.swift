//
//  OnboardingViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 27.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    let slides: [OnboardingSlide] = [OnboardingSlide(title: "Everything you desire is here.", description: "From Fashion, to automotive supplies and handmade art, we offer customers a vast selection of products and services to choose from, with delivery options that meet their needs. ", image: UIImage(named: "slide1")!),
                                     OnboardingSlide(title: "Fast Delivery", description: "Getting orders from delivery stations to customers’ doorsteps is the “last mile” for delivery. We deliver goods to homes, businesses, Lockers, and even cars all over the world. This network is powered by hundreds of small businesses and tens of thousands of drivers that leverage Amazon technology.", image: UIImage(named: "slide2")!),
                                     OnboardingSlide(title: "Secure Payment", description: "Online Pay is a way to check out quickly and securely online, and your eligible purchases of physical goods are protected by our A-to-z Guarantee.", image: UIImage(named: "slide3")!)]
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                btn.setTitle("Get started", for: .normal)
            } else {
                btn.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            print("you are in the last page")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
       
        
        
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    
    
}
// MARK: UICollectionViewFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
