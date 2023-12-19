//
//  ComunicacaoCardView.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 07/12/23.
//

import UIKit

class PersonagemCardView: UIView {
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.text = "Personagem"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(title)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
