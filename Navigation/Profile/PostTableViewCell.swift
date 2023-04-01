//
//  ProfileTableHederViewTableViewCell.swift
//  Navigation
//
//  Created by Ira on 01.04.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let postContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let postImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let postTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let postDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private var postLike: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var postView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        postTitle.text = ""
        postDescription.text = ""
        postLike.text = ""
        postView.text = ""
    }
    
    func setupCell(post: Post) {
        postImageView.image = UIImage(named: post.image ?? "")
        postTitle.text = post.title
        postDescription.text = post.description
        postLike.text = "Likes: " + String(post.likes ?? 0)
        postView.text = "Views: " + String(post.view ?? 0)
    }
    
    private func customizeCell() {
        postContentView.backgroundColor = .white
    }
    
    var insets: CGFloat = 16
    
    private func layout() {
        [postContentView, postImageView, postTitle, postDescription, postLike, postView].forEach { contentView.addSubview($0) }
            
        NSLayoutConstraint.activate([
            postContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            postTitle.topAnchor.constraint(equalTo: postContentView.topAnchor, constant: insets),
            postTitle.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: insets),
            postTitle.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -insets),

            postImageView.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: insets),
            postImageView.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor),

            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: insets),
            postDescription.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: insets),
            postDescription.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -insets),

            postLike.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: insets),
            postLike.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: insets),
            postLike.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -insets),
            
            postView.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: insets),
            postView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -insets),
            postView.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -insets),
        ])
        
//        NSLayoutConstraint.activate([
//            postContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
//            postContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
//            postContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
//            postContentView.heightAnchor.constraint(equalToConstant: superview contentView.trailingAnchor, constant: -viewInset),
////            postContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset)
//        ])
//
//
//        NSLayoutConstraint.activate([
//            postTitle.topAnchor.constraint(equalTo: postContentView.topAnchor),
//            postTitle.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor),
//            postTitle.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor),
////            postTitle.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor),
//            postTitle.widthAnchor.constraint(equalTo: postContentView.widthAnchor),
//        ])
//
//        NSLayoutConstraint.activate([
//            postImageView.topAnchor.constraint(equalTo: postTitle.topAnchor, constant: 12),
//            //postImageView.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: imageInset),
//            postImageView.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor),
//           // postImageView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -16),
//
//          //  postImageView.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -imageInset),
//          //  postImageView.widthAnchor.constraint(equalToConstant: heightView - imageInset * 2)
//        ])
//
//
//
//        NSLayoutConstraint.activate([
//            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
//            postDescription.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
//            postDescription.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
//            postDescription.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -imageInset)
//        ])
//
//        NSLayoutConstraint.activate([
//            postView.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
//            postView.leadingAnchor.constraint(equalTo: postDescription.leadingAnchor),
//            postView.trailingAnchor.constraint(equalTo: postDescription.trailingAnchor),
//            postView.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -imageInset)
//        ])
//
//        NSLayoutConstraint.activate([
//            postLike.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
//            postLike.leadingAnchor.constraint(equalTo: postDescription.leadingAnchor),
//            postLike.trailingAnchor.constraint(equalTo: postDescription.trailingAnchor),
//            postLike.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -imageInset)
//        ])
//
    }

    
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
