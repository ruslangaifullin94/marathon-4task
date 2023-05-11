//
//  ViewController.swift
//  4 Task
//
//  Created by Руслан Гайфуллин on 10.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var dataData: Data?
    
//    var dataSource: UITableViewDiffableDataSource<CellReuseID, Bool>?
    
    fileprivate var data = Data.make()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.delegate = self
        table.dataSource = self
        
//        table.allowsMultipleSelection = true
        table.register(DataViewCell.self, forCellReuseIdentifier: CellReuseID.base.rawValue)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraits()
    }
    

   private func setupView() {
        title = "4 Task"
        view.backgroundColor = .systemBackground
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .plain, target: self, action: #selector(didTapShuffleButton))
       view.addSubview(tableView)
    }
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)

        ])
    }
    
   @objc private func didTapShuffleButton() {
       
//       tableView.beginUpdates()
       tableView.performBatchUpdates({
           data.shuffle()
           tableView.reloadSections(IndexSet(integer: 0), with: .bottom)
       })
      
//       tableView.endUpdates()

   }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        if cell?.accessoryType != .checkmark {
            cell?.accessoryType = .checkmark
            data[indexPath.row].check = true
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            data.insert(data[indexPath.row], at: 0)
            data.remove(at: indexPath.row + 1)
        } else {
            cell?.accessoryType = .none
            data[indexPath.row].check = false
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath) as? DataViewCell else { fatalError("could not dequeueReusableCell") }
      
        cell.update(data[indexPath.row])
        
        if let selectedRows = tableView.indexPathsForSelectedRows,
           selectedRows.contains(indexPath)
        {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        if data[indexPath.row].check == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
       
        return cell
    }
    
    
}



