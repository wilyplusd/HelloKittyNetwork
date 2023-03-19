//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private let profile = ProfileViewController()
    private let newsFeed = FeedViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()

        // Do any additional setup after loading the view.
    }

    private func setupControllers(){
        let navigationController1 = UINavigationController(rootViewController: profile)
        let navigationController2 = UINavigationController(rootViewController: newsFeed)
        

        newsFeed.tabBarItem.title = "Feed"
        newsFeed.tabBarItem.image = UIImage(systemName: "note")
        profile.tabBarItem.title = "Profile"
        profile.tabBarItem.image = UIImage(systemName: "folder")
        
        viewControllers = [navigationController1, navigationController2]
    }

}
