
import UIKit

final class ProfileHeaderView: UIView {
    
    private var viewLayout = [NSLayoutConstraint]()
    private var statusText:String?
    
    private let profileContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "Введите статус"
        
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
        statusLabel.text = statusText ?? " "
    }
    
    @objc private func statusTextChanged(){
        statusText = statusTextField.text ?? " "
    }
    
    func setupView() {
        backgroundColor = .systemGray4
        addSubview(profileContentView)
        profileContentView.addSubview(avatarImageView)
        profileContentView.addSubview(fullNameLabel)
        profileContentView.addSubview(statusLabel)
        profileContentView.addSubview(statusTextField)
        profileContentView.addSubview(setStatusButton)

        NSLayoutConstraint.activate([
            profileContentView.topAnchor.constraint(equalTo: topAnchor),
            profileContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileContentView.heightAnchor.constraint(equalToConstant: 220),

            avatarImageView.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileContentView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

            fullNameLabel.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileContentView.leadingAnchor, constant: 140),

            statusLabel.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: profileContentView.leadingAnchor, constant: 140),

            statusTextField.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 80),
            statusTextField.leadingAnchor.constraint(equalTo: profileContentView.leadingAnchor, constant: 140),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: profileContentView.trailingAnchor, constant: -20),

            setStatusButton.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 130),
            setStatusButton.leadingAnchor.constraint(equalTo: profileContentView.leadingAnchor, constant: 20),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.trailingAnchor.constraint(equalTo: profileContentView.trailingAnchor, constant: -20),
        ])
    }

}
