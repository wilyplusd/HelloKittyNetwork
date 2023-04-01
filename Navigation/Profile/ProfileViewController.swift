
import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileHeadView = ProfileHeaderView()
    private let post: [Post] = Post.makePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupProfileHeadView()
        setupTable()
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupProfileHeadView(){
        profileHeadView.setupView()
    }
   
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: post[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            let headerView = ProfileHeaderView()
            headerView.setupView()
            return headerView
        }
        return nil
    }
    
}

extension ProfileViewController: UITableViewDelegate {
}


    
