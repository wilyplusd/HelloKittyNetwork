
import UIKit

final class ProfileViewController: UIViewController, PhotosTableDelegate {
    private var post: [Post] = Post.makePost()
    
    private let photosController = PhotosTableViewController()
    
    internal func galleryButtonClicked() {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        photosController.delegate = self
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
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 0
        }
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setPost(post: post[indexPath.row])
        cell.setIndexPath(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.post.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 200
        }
        if (section == 1) {
            return 160
        }
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            let view = ProfileHeaderView()
            view.setupView()
            return view
        }
        if (section == 1) {
            return photosController.view
        }
        return UIView()
    }
}

extension ProfileViewController: UITableViewDelegate {}

extension ProfileViewController: PostTableViewCellDelegate {
    func likeTapped(cell: PostTableViewCell, indexPath: IndexPath) {
        let i = indexPath.row
        var p = self.post[i]
        p.likes = (p.likes ?? 0) + 1
        self.post[i] = p
        cell.setPost(post: p)
    }

    func imageTapped(cell: PostTableViewCell, indexPath: IndexPath) {
        let i = indexPath.row
        var p = self.post[i]
        let postController = PostViewController(post: p)
        self.present(postController, animated: true)

        p.view = (p.view ?? 0) + 1
        self.post[i] = p
        cell.setPost(post: p)
    }
}
