//
//  ListCell.swift
//  TestePro
//
//  Created by Rogerio Martins on 18/12/23.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = .black
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    static let identifier = String(describing: ListCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementsVisual()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElementsVisual() {
        addSubview(labelName)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            labelName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func setupCell(name: String) {
        labelName.text = name
    }
}
