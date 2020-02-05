//
//  TabBar.swift
//  Moves
//
//  Created by Devon Adams on 1/4/19.
//  Copyright © 2019 Devon Adams. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    fileprivate func SetGradient() {
        let gradient = CAGradientLayer()
        var bounds = tabBar.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [Colors.darkPurple.cgColor, Colors.royalPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = getImageFrom(gradientLayer: gradient) {
            tabBar.backgroundImage = image
            //                tabBar.backgroundImage(image, for: UIBarMetrics.default)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        let hotController = HotController(collectionViewLayout: layout)
        let hotNavController = UINavigationController(rootViewController: hotController)
        hotNavController.tabBarItem.title = "Hot"
        let image = UIImage(named: "heat")?.resizedImage(newSize: CGSize(width: 21.2, height: 24.23))
        hotNavController.tabBarItem.image = image?.maskWithColor(color: UIColor.white).withRenderingMode(.alwaysOriginal)
        
        let navController1 = createNavController(title: "Near me", imageName: "near")
        let navController2 = createNavController(title: "Favorites", imageName: "icons8-heart-filled-90")
        let navController3 = createNavController(title: "Search", imageName: "icons8-search-filled-50")
        viewControllers = [hotNavController,navController1,navController2,navController3]
        
        tabBar.isTranslucent = false
        
        SetGradient()
        
        }
    
    private func createNavController(title: String, imageName: String)-> UINavigationController{
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        let image = UIImage(named: imageName)?.resizedImage(newSize: CGSize(width: 26, height: 26)).withRenderingMode(.alwaysOriginal)
        
        navController.tabBarItem.image = image?.maskWithColor(color: UIColor.white).withRenderingMode(.alwaysOriginal)
        return navController
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
