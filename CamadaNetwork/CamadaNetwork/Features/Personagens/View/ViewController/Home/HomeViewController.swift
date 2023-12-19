//
//  RickAndMortyViewController.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 05/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    let customView = HomeView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomView()
        
        Task {
            await viewModel.fetch(endpoint: RickAndMortyEndpoints.listaPersonagens, responseModel: Personagens.self)
//            await viewModel.fetch(endpoint: RickAndMortyEndpoints.personagem(1), responseModel: Personagem.self)
//            await viewModel.fetchJson(fileName: RickAndMortyMock.MockPersonagem, responseModel: Personagem.self)
            await viewModel.fetch(endpoint: RickAndMortyEndpoints.epsodio(1), responseModel: Epsodio.self)
            await viewModel.fetch(endpoint: RickAndMortyEndpoints.localizacaoPersonagem(1), responseModel: Localizacao.self)
            setReloadView()
        }
    }
    
    private func setCustomView() {
        customView.addView()
        customView.addConstraint()
        customView.setupDelegateTableView(delegate: self, dataSource: self)
    }
    
    private func setReloadView() {
        customView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleOfSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let typeOfCell = viewModel.typeOfCell(section: indexPath.section, row: indexPath.row)
        
        switch typeOfCell {
        case .personagens:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PersonagensTableViewCell.identifier) as? PersonagensTableViewCell {
                cell.setupTableViewCell(status: viewModel.statusRequest.personagens,
                                        data: viewModel.dataConfigurationOfPersonagens())
                return cell
            }
        case .personagem:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PersonagemTableViewCell.identifier) as? PersonagemTableViewCell {
                cell.setupTableViewCell(status: viewModel.statusRequest.personagem)
                return cell
            }
        case .episodios:
            return UITableViewCell()
        case .episodio:
            return UITableViewCell()
        case .localizacoes:
            return UITableViewCell()
        case .localizacao:
            return UITableViewCell()
        case .padrao:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
