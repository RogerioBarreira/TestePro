//
//  ListView.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import Foundation
import UIKit

class ListView: UIView {
    
    let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsVisual()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElementsVisual() {
        addSubview(myTableView)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        myTableView.delegate = delegate
        myTableView.dataSource = dataSource
    }
    
    func tableViewReloadData() {
        myTableView.reloadData()
    }
}
