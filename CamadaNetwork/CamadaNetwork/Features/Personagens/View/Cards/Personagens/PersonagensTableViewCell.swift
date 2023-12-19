//
//  PersonagensTableViewCell.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 07/12/23.
//

import UIKit

class PersonagensTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: PersonagensTableViewCell.self)
    let customView = PersonagensCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        customView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewCell(status: Bool?, data: Personagens?) {
        if let status = status {
            if status {
                cardSucesso(data: data)
            } else {
                cardErro()
            }
        } else {
            cardCarregando()
        }
    }
    
    private func cardErro() {
        customView.title.text = "Personagens: erro"
        customView.backgroundColor = .red
    }
    
    private func cardSucesso(data: Personagens?) {
        customView.title.text = "Personagens: sucesso"
        customView.backgroundColor = .green
    }
    
    private func cardCarregando() {
        customView.title.text = "Personagens: carregando"
        customView.backgroundColor = .gray
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: topAnchor),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
