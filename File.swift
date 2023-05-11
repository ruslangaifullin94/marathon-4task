import UIKit

class ViewController2: UIViewController {
    
    struct Item {
        let number: Int
        var isSelected: Bool
    }
    
    var items = [Item]()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task 4"
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .done, target: self, action: #selector(shuffle))
        self.navigationItem.rightBarButtonItem?.tintColor = .systemMint
        
        for i in 0...30 {
            items.append(.init(number: i, isSelected: false))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    func shuffle() {
        self.items.shuffle()
        tableView.beginUpdates()
        self.tableView.reloadRows(at: items.map{IndexPath(row: $0.number, section: 0)}, with: .bottom)
         tableView.endUpdates()
    }
}

extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row].number.description
        cell.accessoryType = items[indexPath.row].isSelected ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isSelected.toggle()
        tableView.reloadRows(at: [indexPath], with: .none)
        if items[indexPath.row].isSelected {
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            items.insert(items[indexPath.row], at: 0)
            items.remove(at: indexPath.row + 1)
        } else {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
