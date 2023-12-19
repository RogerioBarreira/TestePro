//
//  ListViewController.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import UIKit

class ListViewController: UIViewController {

    lazy var viewList: ListView = {
        let view = ListView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = viewList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewList.setupTableView(delegate: self, dataSource: self)
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
            cell.setupCell(name: "Rogerio")
            return cell
        }
       return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

