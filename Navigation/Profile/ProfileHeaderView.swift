
import UIKit

final class ProfileHeaderView: UIView {
    private var isPortraitOrientation: Bool {
        return UIDevice.current.orientation == .portrait
    }
    
    private var portaraitLayout = [NSLayoutConstraint]()
    private var landscapeLayout = [NSLayoutConstraint]()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "avatar")
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Johnny Catsvill"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Online"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.textColor = UIColor.systemGray6
        textField.text = "Введите статус"
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    @objc private func buttonPressed() {
        statusLabel.text = statusTextField.text!
        //print(statusLabel.text!)
    }
    public func activatePortrait() {
        NSLayoutConstraint.deactivate(landscapeLayout)
        NSLayoutConstraint.activate(portaraitLayout)
    }
    
    public func activateLandscape() {
        NSLayoutConstraint.deactivate(portaraitLayout)
        NSLayoutConstraint.activate(landscapeLayout)
    }
    
    func setupView(){
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)

        portaraitLayout = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),

            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            
            setStatusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ]
        
        landscapeLayout = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),

            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            
            setStatusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ]
    }

}
