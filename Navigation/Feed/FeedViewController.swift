//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    
    
    private let post = Post(author: "Иванов И.И.", title: "На занятии вы узнали о UIViewController и его жизненном цикле.")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .white
        postLabel.text = post.title
        view.addSubview(postLabel)
        setupButton()
    }
    
    private let postLabel: UITextView = {
        let label = UITextView(frame: CGRect(x: 10, y: 150, width: 350, height: 100))
        label.backgroundColor = .systemGray6
        return label
    }()
    
    private let FeedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 270, width: 200, height: 50))
        button.setTitle("Read", for: .normal)
        button.backgroundColor = .systemGray3
        return button
    }()

    private func setupButton() {
        view.addSubview(FeedButton)
        //FeedButton.center = view.public struct Post {public var title: String}center
        FeedButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    @objc private func tapAction() {
        let postRead = PostViewController(post: post)
        postRead.title = "Post"
        navigationController?.pushViewController(postRead, animated: true)
    }

    

}
