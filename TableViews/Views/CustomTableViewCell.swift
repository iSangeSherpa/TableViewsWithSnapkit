import SnapKit
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var productNameLabel : UILabel = {
        var label = UILabel()
        label.text = "Error"
        return label
    }()

    var productImageLabel : UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "img1")
        return image
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        addSubview(productNameLabel)
        addSubview(productImageLabel)
        
        self.backgroundColor = .gray
        
        productImageLabel.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().offset(20)
            maker.bottom.equalToSuperview().offset(-20)
            maker.width.height.equalTo(100)
        }
        productNameLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(productImageLabel.snp.trailing).offset(20)
            maker.centerY.equalTo(productImageLabel.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
