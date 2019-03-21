//
//  SwipingController.swift
//  AutoLayout
//
//  Created by RAFAEL on 2/18/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

//Controller: is responsable for the coordinaton between the view and the model 

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "Breakfast", headerText: "Join us today in our fun game!", bodyText: "Are you ready for loads and loadas of fun? Don't wait any Longer! We hope to see you in our stores soon"),
        Page(imageName: "Lunch", headerText: "Suscribe and get coupons in our daily events", bodyText: "Get notified of the saving immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "Snack", headerText: "VIP members special services", bodyText: "Special servies are available for VIP members, including special coupons of amazing descount."),
        Page(imageName: "Dinner", headerText: "Join us today in our fun game!", bodyText: "Are you ready for loads and loadas of fun? Don't wait any Longer! We hope to see you in our stores soon"),
        Page(imageName: "Coffee", headerText: "Suscribe and get coupons in our daily events", bodyText: "Get notified of the saving immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "Smoothie", headerText: "VIP members special services", bodyText: "Special servies are available for VIP members, including special coupons of amazing descount.")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handlePrevious(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()

    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.axis = .horizontal
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            //previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.isPagingEnabled = true
    }
    
    
}
