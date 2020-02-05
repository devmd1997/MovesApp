//
//  ViewController.swift
//  Moves
//
//  Created by Devon Adams on 12/22/18.
//  Copyright © 2018 Devon Adams. All rights reserved.
//

import UIKit

class HotController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var Flyer : [Flyers] = {
        let BeachParty = Flyers()
        BeachParty.title = "Beach Party"
        BeachParty.cost = 5
        BeachParty.dateDay = "29"
        BeachParty.dateMonth = "Aug"
        BeachParty.likes = 5000
        BeachParty.thumbnailImage = "Screen Shot 2019-01-03 at 4.56.40 PM"
        BeachParty.people = 400
        
        let SummerParty = Flyers()
        SummerParty.title = "Summer Party"
        SummerParty.cost = 5
        SummerParty.dateDay = "28"
        SummerParty.dateMonth = "Aug"
        SummerParty.likes = 4000
        SummerParty.thumbnailImage = "SummerParty"
        SummerParty.people = 500
        
        let GlowParty = Flyers()
        GlowParty.title = "Glow Party"
        GlowParty.cost = 15
        GlowParty.dateDay = "30"
        GlowParty.dateMonth = "Aug"
        GlowParty.likes = 4000
        GlowParty.thumbnailImage = "GlowParty"
        GlowParty.people = 300
        
        let ClubParty = Flyers()
        ClubParty.title = "Club Party"
        ClubParty.cost = 10
        ClubParty.dateDay = "28"
        ClubParty.dateMonth = "Aug"
        ClubParty.likes = 6000
        ClubParty.thumbnailImage = "ClubParty"
        ClubParty.people = 1000
        
        return [BeachParty,SummerParty,GlowParty,ClubParty]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.red
        navigationItem.title = "Baltimore"
        
        let titleLabel = UILabel()
//        titleLabel.text = "Baltimore"
//        titleLabel.font = UIFont(name: "OpenSans-LightItalic", size: 20)
//        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel.navigationBarFont(title: "Baltimore")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        //Sets the Grdient colors for Navigation Bar
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [Colors.darkPurple.cgColor, Colors.royalPurple.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }
        //Sets shadow under navigation bar
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        self.navigationController?.navigationBar.layer.masksToBounds = false
        
        let settingImage = UIImage(named: "icons8-settings-filled-50")?.resizedImage(newSize: CGSize(width: 20, height: 20))
        let personImage = UIImage(named: "icons8-customer-filled-50")?.resizedImage(newSize: CGSize(width: 20, height: 20))
        let settings = UIBarButtonItem(image: settingImage?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(goToSettings))
        let profile = UIBarButtonItem(image: personImage?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(goToProfile))
        navigationItem.leftBarButtonItem = settings
        navigationItem.rightBarButtonItem = profile
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(FlyerCell.self, forCellWithReuseIdentifier: "cellId")
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func goToSettings(){
        
    }
    @objc func goToProfile(){
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Flyer.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FlyerCell
        cell.flyer = Flyer[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 325, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let layout = UICollectionViewFlowLayout()
        let detailController = EventController(collectionViewLayout: StretchyHeaderLayout())
        navigationController?.pushViewController(detailController, animated: true)
    }
}


