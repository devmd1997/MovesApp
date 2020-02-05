//
//  FlyerCell.swift
//  Moves
//
//  Created by Devon Adams on 12/23/18.
//  Copyright © 2018 Devon Adams. All rights reserved.
//

import UIKit

class FlyerCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadowWithCorners()
        setupViews()
    }
    
    let borderView = UIView()
    let gradientView = UIView()
    var flyer: Flyers?{
        didSet{
            dateLabel.text = flyer?.dateMonth
            dateNumberLabel.text = flyer?.dateDay
            titleLabel.text = flyer?.title
            coinNumber.text = "\((flyer?.cost)!)"
            peopleNumber.text = "\((flyer?.people)!)"
            likeNumber.text = "\((flyer?.likes)!)"
            thumnnailImageView.image = UIImage(named: (flyer?.thumbnailImage)!)
        }
    }
    let thumnnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Screen Shot 2019-01-03 at 4.56.40 PM")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Aug"
        label.font = UIFont(name: "KozGoPr6N-Light", size: 20)
        label.textColor = Colors.darkOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "28"
        label.font = UIFont(name: "KozGoPr6N-Bold", size: 20)
        label.textColor = Colors.deepBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Party"
        label.font = UIFont(name: "OpenSans-LightItalic", size: 19)
        label.textColor = Colors.deepBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let peopleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icons8-queue-filled-50")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.darkOrange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let peopleNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"KozGoPr6N-Medium", size: 11)
        label.text = "3,450"
        label.textColor = Colors.darkOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icons8-heart-filled-90")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.darkOrange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let likeNumber: UILabel = {
        let label = UILabel()
        label.text = "7,080"
        label.font = UIFont(name:"KozGoPr6N-Medium", size: 11)
        label.textColor = Colors.darkOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let coinImage: UIImageView = {
        let coinImage = UIImageView()
        coinImage.image = UIImage(named: "icons8-expensive-price--filled-50")?.withRenderingMode(.alwaysTemplate)
        coinImage.tintColor = Colors.darkOrange
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        return coinImage
    }()
    let coinNumber: UILabel = {
        let label = UILabel()
        label.text = "5-15"
        label.font = UIFont(name:"KozGoPr6N-Medium", size: 11)
        label.textColor = Colors.darkOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let goButton: UIButton = {
        let button = UIButton()
        button.bounds.size = CGSize(width: 25, height: 25)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.masksToBounds = true
        let image = UIImage(named: "icons8-checkmark-filled-50")
        let resizedImage = image?.resizedImage(newSize: CGSize(width: 19, height: 19))
        button.setImage(resizedImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = Colors.darkOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.bounds.size = CGSize(width: 25, height: 25)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.masksToBounds = true
        let image = UIImage(named: "icons8-heart-filled-90")
        let resizedImage = image?.resizedImage(newSize: CGSize(width: 19, height: 19))
        button.setImage(resizedImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = Colors.darkOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let upperBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupViews(){
        borderView.setGradientBackground(colorOne: Colors.darkOrange , colorTwo: Colors.brightOrange)
        borderView.addSubview(thumnnailImageView)
        borderView.addSubview(bottomView)
        bottomView.addSubview(upperBorder)
        bottomView.addSubview(dateLabel)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(peopleImage)
        bottomView.addSubview(peopleNumber)
        bottomView.addSubview(likeImage)
        bottomView.addSubview(likeNumber)
        bottomView.addSubview(coinImage)
        bottomView.addSubview(coinNumber)
        bottomView.addSubview(goButton)
        bottomView.addSubview(favoriteButton)
        bottomView.addSubview(dateNumberLabel)
        
        
    
        //Constraints for thmbnailImageView (Top Image)
        thumnnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        thumnnailImageView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        thumnnailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        thumnnailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        thumnnailImageView.heightAnchor.constraint(equalToConstant: 145).isActive = true
        
        //Constraints for the bottom Menu
        bottomView.topAnchor.constraint(equalTo: thumnnailImageView.bottomAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        upperBorder.topAnchor.constraint(equalTo: thumnnailImageView.bottomAnchor).isActive = true
        upperBorder.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        upperBorder.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        upperBorder.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        upperBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //Constraints for the Date Label
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 4))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 16))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        //Width Contraint
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40))
        
        //Constraints for the Date Number Label
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: dateNumberLabel, attribute: .top, relatedBy: .equal, toItem: dateLabel, attribute: .bottom, multiplier: 1, constant: 0))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: dateNumberLabel, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 20))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: dateNumberLabel, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: dateNumberLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        //Width Contraint
        addConstraint(NSLayoutConstraint(item: dateNumberLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        
        
        //Constraints for TitleLabel
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 4))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 56))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 200))
        
        //Constraints for PeopleImage
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: peopleImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 3))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: peopleImage, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 56))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: peopleImage, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: peopleImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 19))
        //Width Contraint
        addConstraint(NSLayoutConstraint(item: peopleImage, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 19))
        
        //Constraints for PeopleNumber
        //Top Constaint
        addConstraint(NSLayoutConstraint(item: peopleNumber, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 6))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: peopleNumber, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 80))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: peopleNumber, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: peopleNumber, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 11))
        addConstraint(NSLayoutConstraint(item: peopleNumber, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 28))
        
        //Constraints for Heart Image
        addConstraint(NSLayoutConstraint(item: likeImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 3))
        addConstraint(NSLayoutConstraint(item: likeImage, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 116))
        addConstraint(NSLayoutConstraint(item: likeImage, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: likeImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 19))
        addConstraint(NSLayoutConstraint(item: likeImage, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 19))
        //Constraints for Like Number
        //Top Constaint
        addConstraint(NSLayoutConstraint(item: likeNumber, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 6))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: likeNumber, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 140))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: likeNumber, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: likeNumber, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 11))
        addConstraint(NSLayoutConstraint(item: likeNumber, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 28))
        
        //Constraints for coin Image
        //Top Constraint
        addConstraint(NSLayoutConstraint(item: coinImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 3))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: coinImage, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 175))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: coinImage, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: coinImage, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 19))
        //Width Contraint
        addConstraint(NSLayoutConstraint(item: coinImage, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 19))
        //Constriant for Coin Number
        //Top Constaint
        addConstraint(NSLayoutConstraint(item: coinNumber, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 6))
        //Left Constraint
        addConstraint(NSLayoutConstraint(item: coinNumber, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 198))
        //Right Constraint
        addConstraint(NSLayoutConstraint(item: coinNumber, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        //Height Constraint
        addConstraint(NSLayoutConstraint(item: coinNumber, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 11))
        addConstraint(NSLayoutConstraint(item: coinNumber, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 28))
        
        //Constraint for go Button
        //Top Constaint
        addConstraint(NSLayoutConstraint(item: goButton, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: -15))
        addConstraint(NSLayoutConstraint(item: goButton, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 268))
        addConstraint(NSLayoutConstraint(item: goButton, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: goButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        addConstraint(NSLayoutConstraint(item: goButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
        //Constrains for favorite Button
        //Top Constaint
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: -15))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .left, relatedBy: .equal, toItem: bottomView, attribute: .left, multiplier: 1, constant: 297))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .right, relatedBy: .equal, toItem: bottomView, attribute: .right, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
    }
    private func addShadowWithCorners(){
        backgroundColor = UIColor.clear
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
        
        
        borderView.frame = bounds
        borderView.layer.cornerRadius = 10
        borderView.layer.borderColor = UIColor.white.cgColor
        borderView.layer.borderWidth = 1.0
        borderView.layer.masksToBounds = true
        addSubview(borderView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
