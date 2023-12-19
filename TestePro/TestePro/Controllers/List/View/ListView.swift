//
//  ListView.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import Foundation
import UIKit

class ListView: UIView {
    
    let loading: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        load.translatesAutoresizingMaskIntoConstraints = false
        load.frame.size = CGSize(width: 50, height: 50)
        let scale = CGAffineTransform(scaleX: 2, y: 2)
        load.transform = scale
        load.color = .blue
        load.backgroundColor = .clear
        return load
    }()
    
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
        addSubview(loading)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor)
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
