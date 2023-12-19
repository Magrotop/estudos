//
//  PersonagensView.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 05/12/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonagemTableViewCell.self,
                           forCellReuseIdentifier: PersonagemTableViewCell.identifier)
        tableView.register(PersonagensTableViewCell.self,
                           forCellReuseIdentifier: PersonagensTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implmented")
    }
    
    func setupDelegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func addView() {
        addSubview(tableView)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
