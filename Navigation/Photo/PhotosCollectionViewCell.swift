import UIKit

protocol PhotosCollectionCellDelegate: AnyObject {
    func photoTapped(image: UIImage?, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotosCollectionCellDelegate?

    private var indexPath = IndexPath()

    private let imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(PhotosCollectionViewCell.imageTapped))
        imageView.addGestureRecognizer(imageTapRecognizer)
        imageView.isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    
    func setIndexPath(indexPath: IndexPath) {
        self.indexPath = indexPath
    }

    @objc private func imageTapped() {
        delegate?.photoTapped(image: imageView.image, indexPath: self.indexPath)
    }
}
