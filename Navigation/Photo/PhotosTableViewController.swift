

import UIKit

final class PhotosTableViewController: UIViewController {
    
    private let photo: [Photo] = Photo.fillPhoto()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var myCollectionView = makeCollectionView(scrollDirection: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupTablePhotos()
    }
    
        
    func setupTablePhotos() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
    }
    
    func layout() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(myCollectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            myCollectionView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 12),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


extension PhotosTableViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
        cell.setupCell(photo: photo[indexPath.row])
        return cell
    }
}

extension PhotosTableViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = collectionView.bounds.height - sideInset * 2
            return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Секция \(indexPath.section), ячейка \(indexPath.item)")
//        let vc = PhotosTableViewCell()
//        present(vc, animated: true)
    }
    
}

extension UIViewController {
    func makeCollectionView(scrollDirection: UICollectionView.ScrollDirection) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        collectionView.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: PhotosTableViewCell.identifier)
        return collectionView
    }
}

