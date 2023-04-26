//
//  PostViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

class PostViewController: UIViewController {


    
    private let post: Post?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(postLabel)
        title = post?.title
        makeBarItem()

    }
    
    private let postLabel: UITextView = {
        let label = UITextView(frame: CGRect(x: 10, y: 150, width: 350, height: 100))
        label.backgroundColor = .systemGray6
        return label
    }()
    
  
    init(post: Post? = nil) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        postLabel.text = post?.title
        
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
