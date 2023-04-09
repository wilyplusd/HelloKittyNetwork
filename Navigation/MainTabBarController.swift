import UIKit

final class MainTabBarController: UITabBarController {
    private let profile = ProfileViewController()
    private let newsFeed = FeedViewController()
    private let logIn = LogInViewController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        if (!logIn.isLoggedIn) {
            navigationController?.pushViewController(logIn, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        let navigationController1 = UINavigationController(rootViewController: profile)
        let navigationController2 = UINavigationController(rootViewController: newsFeed)
        
        newsFeed.tabBarItem.title = "Feed"
        newsFeed.tabBarItem.image = UIImage(systemName: "note")
        profile.tabBarItem.title = "Profile"
        profile.tabBarItem.image = UIImage(systemName: "folder")
        
        viewControllers = [navigationController1, navigationController2]
     
    }

}
