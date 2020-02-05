//
//  HeaderPhoto.swift
//  Moves
//
//  Created by Devon Adams on 7/1/19.
//  Copyright © 2019 Devon Adams. All rights reserved.
//

import UIKit

class HeaderPhoto: UICollectionReusableView {
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ClubPartyHeader"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        //blur
        setupVisualEffectBlur()
    }
    var animator: UIViewPropertyAnimator!
    fileprivate func setupVisualEffectBlur(){
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self]  in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperView()
        })
//        animator.fractionComplete = 0.5
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
