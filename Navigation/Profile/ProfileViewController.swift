
import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileHeadView = ProfileHeaderView()
    private var constraintsHeadView = [NSLayoutConstraint]()
   
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.setTitle("New button", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        navigationItem.hidesBackButton = true
        profileHeadView.backgroundColor = .lightGray
        view.backgroundColor = .white
        setupProfileHeadView()
        
    }
    
    private func setupProfileHeadView(){
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        profileHeadView.backgroundColor = .systemGray4
        view.addSubview(profileHeadView)
        view.addSubview(newButton)

        constraintsHeadView = [
            profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeadView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50),
        
        ]
        profileHeadView.setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLayoutConstraint.activate(constraintsHeadView)
        profileHeadView.activateView()
    }
    
}
