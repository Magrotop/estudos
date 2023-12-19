//
//  ComunicacaoTableViewCell.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 07/12/23.
//

import UIKit

class PersonagemTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: PersonagemTableViewCell.self)
    let customView = PersonagemCardView()
    
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
    
    func setupTableViewCell(status: Bool?) {
        if let status = status {
            if status {
                cardSucesso()
            } else {
                cardErro()
            }
        } else {
            cardCarregando()
        }
    }
    
    private func cardErro() {
        customView.title.text = "Personagem: erro"
        customView.backgroundColor = .red
    }
    
    private func cardSucesso() {
        customView.title.text = "Personagem: sucesso"
        customView.backgroundColor = .green
    }
    
    private func cardCarregando() {
        customView.title.text = "Personagem: carregando"
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
