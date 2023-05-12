import UIKit
import SnapKit

class DescriptionViewController: UIViewController {
    
    var imageView : UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "questionmark")
        return image
    }()
    
    var descriptionLabel : UILabel = {
        var text = UILabel()
        text.text = "Nothing to show"
        text.font = .boldSystemFont(ofSize: 20)
        return text
    }()
    
    lazy var stack : UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageView, descriptionLabel])
        stack.alignment = .center
        stack.spacing = 20
        stack.axis = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(stack)
        
        stack.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(stack.snp.centerX)
        }
    }
}
