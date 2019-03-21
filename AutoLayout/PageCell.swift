//
//  PageCell.swift
//  AutoLayout
//
//  Created by RAFAEL on 2/18/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

//View:  Is responsable for presentig all particular data contained in the page model 

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
            guard let unwarappedPage = page else {return}
            
            bearImageView.image = UIImage(named: unwarappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwarappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n \(unwarappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads amd loads fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        
        let topImageContaierView = UIView()
        //topImageContaierView.backgroundColor = .blue
        addSubview(topImageContaierView)
        
        topImageContaierView.translatesAutoresizingMaskIntoConstraints = false
        topImageContaierView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContaierView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContaierView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContaierView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContaierView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContaierView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContaierView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContaierView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContaierView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
