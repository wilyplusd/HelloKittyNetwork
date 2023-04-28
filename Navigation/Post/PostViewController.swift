//
//  PostViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    private let post: Post?
    private let insets: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(postImageView)
        view.addSubview(postTitle)
        view.addSubview(postDescription)
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: view.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            postTitle.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: insets),
            postTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
            postTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),
                
            postDescription.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: insets),
            postDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
            postDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),
        ])

        title = post?.title
        makeBarItem()
    }
        
    private let postImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let postTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let postDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
  
    init(post: Post? = nil) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        postTitle.text = post?.title
        postDescription.text = post?.description
        postImageView.image = UIImage(named: post?.image ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func barItemAction() {
        let info = InfoViewController()
        info.title = "Profile?"
        info.modalPresentationStyle = .fullScreen
        present(info, animated: true)
    }

}
