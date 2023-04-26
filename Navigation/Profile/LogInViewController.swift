import UIKit
import SwiftUI

final class LogInViewController: UIViewController {
    private(set) public var isLoggedIn: Bool = false
    private let logView = LogInHederView()
    private let notification = NotificationCenter.default
 
    override func loadView() {
        super.loadView()
        view = logView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        logView.addLoginButtonTarget(self, action: #selector(buttonPressed))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            logView.scrollView.contentInset.bottom = keybordSize.height
            logView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        logView.scrollView.contentInset = .zero
        logView.scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
    @objc private func buttonPressed() {
        logView.endEditing(true)
        if (logView.validateInputs()) {
            isLoggedIn = logView.getName() == "user@vk.com" && logView.getPass() == "password"
            if (isLoggedIn) {
                navigationController?.popViewController(animated: true)
            } else {
                let alert = UIAlertController(title: "Ошибка аутентификации", message: "Неверное имя пользователя или пароль", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion:nil)
            }
        }
    }    
}
