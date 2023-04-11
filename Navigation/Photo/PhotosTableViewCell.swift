
import UIKit

final class PhotosTableViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
//        imageView.addTarget(self, action: imageButton, for: .touchUpInside)
        return imageView
    }()
    
    func setupCell(photo: Photo) {
        imageView.image = UIImage(named: photo.image)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc private func imageButton(){
//        let main = PhotosViewController()
//        main.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(main, animated: true)
 
//        present(main, animated: true)

    }
    
}
