
import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileHeadView = ProfileHeaderView()
    private var constraintsPortrait = [NSLayoutConstraint]()
    private var constraintsLandscape = [NSLayoutConstraint]()
    
    private var isPortraitOrientation: Bool {
        return UIDevice.current.orientation == .portrait
    }
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        view.backgroundColor = .white
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        profileHeadView.backgroundColor = .systemGray4
        view.addSubview(profileHeadView)
        view.addSubview(newButton)

        constraintsPortrait = [
            profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeadView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeadView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeadView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButton.heightAnchor.constraint(equalToConstant: 50),
        
        ]
        
        constraintsLandscape = [
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
    
    private func activatePortrait() {
        NSLayoutConstraint.deactivate(constraintsLandscape)
        NSLayoutConstraint.activate(constraintsPortrait)
    }
    
    private func activateLandscape() {
        NSLayoutConstraint.deactivate(constraintsPortrait)
        NSLayoutConstraint.activate(constraintsLandscape)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        isPortraitOrientation ? profileHeadView.activatePortrait() : profileHeadView.activateLandscape()
        isPortraitOrientation ? activatePortrait() : activateLandscape()
    }
    
}
