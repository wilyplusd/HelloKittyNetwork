//
//  ProfileController.swift
//  Navigation
//
//  Created by Ira on 18.03.2023.
//

import UIKit

final class ProfileController: UINavigationController {

    private let textForLabel: String?
    
    private let myLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 150, width: 200, height: 40))
        label.backgroundColor = .red
        return label
    }()
    
    init(textForLabel: String? = nil) {
        self.textForLabel = textForLabel
        super.init(nibName: nil, bundle: nil)
        myLabel.text = textForLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(myLabel)
        title = textForLabel
    }
}
