
import UIKit

final class PhotosTableViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
//        imageView.addTarget(self, action: imageButton, for: .touchUpInside)
        return imageView
    }()
    
    func setupCell(photo: Photo) {
        imageView.image = UIImage(named: photo.image)
        addSubview(imageView)
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    @objc private func imageButton(){
        let main = PhotosViewController()
        main.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(main, animated: true)
 
//        present(main, animated: true)

    }
    
}
