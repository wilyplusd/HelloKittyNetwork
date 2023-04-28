import UIKit

final class PhotosViewController: UIViewController {
    
    private let photo: [Photo] = Photo.fillPhoto()
    
    private var initialImageRect = CGRect()

    private lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var backView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.7
        return view
    }()
    
    private lazy var  animatingImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var closeImageButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 80, width: 50, height: 50))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeImageTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        self.navigationController?.navigationBar.isHidden = false
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated) // No need for semicolon
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        layout()
        setupTablePhotos()
    }
    
    func setupTablePhotos() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func layout() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func animateImage(_ image: UIImage?) {
        view.addSubview(backView)
        view.addSubview(animatingImageView)
        view.addSubview(closeImageButton)
        animatingImageView.image = image
        animatingImageView.frame = CGRect(x: initialImageRect.origin.x,
                                          y: initialImageRect.origin.y,
                                          width: initialImageRect.width,
                                          height: initialImageRect.height)
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.alpha = 1.0
        }
    }
    
    private func animateImageToInitial() {
        backView.removeFromSuperview()
        closeImageButton.removeFromSuperview()
        UIView.animate(withDuration: 0.6) {
            let rect = self.initialImageRect
            self.animatingImageView.frame = CGRect(x: rect.origin.x,
                                                   y: rect.origin.y,
                                                   width: rect.width,
                                                   height: rect.height)
            self.animatingImageView.alpha = 0.0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
            self.animatingImageView.image = nil
        }
    }
    
    @objc private func closeImageTapped() {
        animateImageToInitial()
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photo: photo[indexPath.row])
        cell.setIndexPath(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - sideInset) / 3 - sideInset
            return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

extension PhotosViewController: PhotosCollectionCellDelegate {
    func photoTapped(image: UIImage?, indexPath: IndexPath) {
        let cellAttr = collectionView.layoutAttributesForItem(at: indexPath)!
        initialImageRect = collectionView.convert(cellAttr.frame, to: collectionView.superview)
        animateImage(image)
    }
}
