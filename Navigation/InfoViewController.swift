//
//  InfoViewController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

class InfoViewController: UIViewController {
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Show message", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupButton()
        
    }
    
    private func setupButton() {
        view.addSubview(backButton)
        backButton.center = view.center
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc private func backAction() {
        let alert = UIAlertController(title: "Сообщение", message: "Вывести сообщение?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Кнопка 1", style: .default) { _ in
            print("Нажата кнопка 1")
        }
        let cancelAction = UIAlertAction(title: "Кнопка 2", style: .destructive){
            _ in
                print("Нажата кнопка 2")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
   
}

