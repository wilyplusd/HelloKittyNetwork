//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private let profileHeadView = ProfileHeaderView(frame: CGRect(x: 0, y: 50, width: 400, height: 720))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileHeadView.backgroundColor = .lightGray
        profileHeadView.setupView()
        view.addSubview(profileHeadView)
    }
}
