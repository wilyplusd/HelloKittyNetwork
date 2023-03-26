//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private let profileHeadView = ProfileHeaderView(frame: CGRect(x: 0, y: 100, width: 400, height: 660))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        profileHeadView.backgroundColor = .lightGray
        
        view.addSubview(profileHeadView)
        profileHeadView.setupView()
    }
}
