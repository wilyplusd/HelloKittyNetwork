//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ira on 19.03.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        
        image.layer.cornerRadius = 75
        image.layer.masksToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        
        image.image = UIImage(named: "avatar")
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 190, y: 27, width: 300, height: 50))
        label.text = "Johnny Catsvill"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 190, y: 120, width: 300, height: 20))
        label.text = "Online..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 182, width: 354, height: 50))
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    func setupView(){
        
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
    }
        
    @objc private func buttonPressed() {
        print(statusLabel.text!)
    }
}
