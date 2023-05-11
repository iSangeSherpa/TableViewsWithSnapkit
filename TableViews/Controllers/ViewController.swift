import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    // MARK: Variables
    var tableView : UITableView = {
       var table = UITableView()
        table.allowsSelection = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    
    // MARK: Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    // MARK: UI Setup
    func setupUI() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{ maker in
            maker.leading.top.bottom.trailing.equalToSuperview()
        }
        
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
