import UIKit
import SnapKit

class TableViewController: UIViewController {
    
    public var products = [Product]()
    
    // MARK: Variables
    let customCell = "CustomCell"
    
    lazy var tableView : UITableView = {
       var table = UITableView()
        table.allowsSelection = true
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: customCell)
        return table
    }()

    
    // MARK: Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createProducts()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    // MARK: UI Setup
    func setupUI() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{ maker in
            maker.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    
    func createProducts() {
        products.append(Product(productName: "Product 1", productImage: UIImage(named: "img1")!))
        products.append(Product(productName: "Product 2", productImage: UIImage(named: "img2")!))
        products.append(Product(productName: "Product 3", productImage: UIImage(named: "img3")!))
        products.append(Product(productName: "Product 4", productImage: UIImage(named: "img4")!))
    }
}


// MARK: Extension
extension TableViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell, for: indexPath) as! CustomTableViewCell
        
        // Cell Configuration
        cell.productImageLabel.image = products[indexPath.row].productImage
        cell.productNameLabel.text = products[indexPath.row].productName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DescriptionViewController()
        vc.imageView.image = products[indexPath.row].productImage
        vc.descriptionLabel.text = products[indexPath.row].productName
        present(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
