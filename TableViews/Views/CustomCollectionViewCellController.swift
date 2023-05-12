import UIKit

class CustomCollectionViewCellController: UIViewController {
    
    var collectionView : UICollectionView = {
        var collectionView = UICollectionView()
        collectionView.register(UICollectionViewCell.self forCellWithReuseIdentifier: <#T##String#>)
       return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
