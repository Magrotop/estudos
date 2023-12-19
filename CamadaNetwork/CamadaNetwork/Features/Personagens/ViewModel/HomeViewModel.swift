//
//  PersonagensViewModel.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 05/12/23.
//

import Foundation

class HomeViewModel {
        
    var personagens: Personagens?
    var personagem: Personagem?
    var localizacao: Localizacao?
    var epsodio: Epsodio?
    var statusRequest = StatusRequest()
    
    // MARK: requisicao dos dados
    func fetch<T: Decodable>(endpoint: RickAndMortyEndpoints, responseModel: T.Type) async {
        let result = await HTTPClient.share.request(endpoint: endpoint,
                                                    responseModel: responseModel)
        
        switch result {
        case .success(let response):
            setResponse(response: response, endpoint: endpoint)
            setStatusRequest(status: true, endpoint: endpoint)
        case .failure(let error):
            print("Falha na request: \(error)")
            setStatusRequest(status: false, endpoint: endpoint)
        }
    }
    
    private func setResponse(response: Any, endpoint: RickAndMortyEndpoints) {
        switch endpoint {
        case .listaPersonagens:
            personagens = response as? Personagens
        case .personagem:
            personagem = response as? Personagem
        case .epsodio:
            epsodio = response as? Epsodio
        case .localizacaoPersonagem:
            localizacao = response as? Localizacao
        }
    }
    
    private func setStatusRequest(status: Bool, endpoint: RickAndMortyEndpoints) {
        switch endpoint {
        case .listaPersonagens:
            statusRequest.personagens = status
        case .personagem:
            statusRequest.personagem = status
        case .epsodio:
            statusRequest.epsodio = status
        case .localizacaoPersonagem:
            statusRequest.localizacao = status
        }
    }
    
//    func fetchDataPersonagens() async {
//        let result = await HTTPClient.share.request(endpoint: RickAndMortyEndpoints.listaPersonagens,
//                                                    responseModel: Personagens.self)
//
//        switch result {
//        case .success(let response):
//            personangens = response
////            print("Sucesso na request: \(response)")
//        case .failure(let error):
//            print("Falha na request: \(error)")
//        }
//    }
//
//    func fetchDataPersonagem(id: Int) async {
//        let result = await HTTPClient.share.request(endpoint: RickAndMortyEndpoints.personagem(id),
//                                                    responseModel: Personagem.self)
//
//        switch result {
//        case .success(let response):
//            personagem = response
////            print("Sucesso na request: \(response)")
//        case .failure(let error):
//            print("Falha na request: \(error)")
//        }
//    }
//
//    func fetchDataLocalizacao(id: Int) async {
//        let result = await HTTPClient.share.request(endpoint: RickAndMortyEndpoints.localizacaoPersonagem(id),
//                                                    responseModel: Localizacao.self)
//
//        switch result {
//        case .success(let response):
//            localizacao = response
////            print("Sucesso na request: \(response)")
//        case .failure(let error):
//            print("Falha na request: \(error)")
//        }
//    }
//
//    func fetchDataEpsodio(id: Int) async {
//        let result = await HTTPClient.share.request(endpoint: RickAndMortyEndpoints.epsodio(id),
//                                                    responseModel: Epsodio.self)
//
//        switch result {
//        case .success(let response):
//            epsodio = response
////            print("Sucesso na request: \(response)")
//        case .failure(let error):
//            print("Falha na request: \(error)")
//        }
//    }
    
    // MARK: configuracoes da table view
    
    /// Define a quantidade de celulas em cada secao
    /// - parameter section: section da tableview
    /// - returns: quantidade de celulas na secao
    func numberOfRow(_ section: Int) -> Int {
        switch section {
        case Section.personagens.rawValue:
            return 2
        case Section.localizacoes.rawValue:
            return 1
        case Section.epsodios.rawValue:
            return 1
        default:
            return 0
        }
    }
    
    func typeOfCell(section: Int, row: Int) -> TypeOfCell {
        switch section {
        case Section.personagens.rawValue:
            if row == 0 {
                return .personagens
            } else if row == 1 {
                return .personagem
            }
        case Section.localizacoes.rawValue:
            return .localizacoes
        case Section.epsodios.rawValue:
            return .episodios
        default:
            return .padrao
        }
        return .padrao
    }
    
    /// Define o titulo em cada secao
    /// - parameter section: section da tableview
    /// - returns: titulo da secao
    func titleOfSection(_ section: Int) -> String {
        switch section {
        case Section.personagens.rawValue:
            return "personagens"
        case Section.localizacoes.rawValue:
            return "localizacoes"
        case Section.epsodios.rawValue:
            return "epsodios"
        default:
            return ""
        }
    }
    
    /// Tratativa de dados das células da seção Section.personagens
    func dataConfigurationOfPersonagens() -> Personagens? {
        return personagens
    }
    
    /// Tratativa de dados das células da seção Section.personagem
    func dataConfigurationOfPersonagem() {
        
    }
    
    /// Tratativa de dados das células da seção Section.localizacao
    func dataConfigurationOfLocalizacao() {
        
    }
    
    /// Tratativa de dados das células da seção Section.localizacao
    func dataConfigurationOfLocalizacao2() {
        
    }
    
    /// Tratativa de dados das células da seção Section.epsodio
    func dataConfigurationOfEpsodio() {
        
    }
}

extension HomeViewModel: Mockable {
    func fetchJson<T: Decodable>(fileName: RickAndMortyMock, responseModel: T.Type) async {
        let response = loadJSON(filename: fileName.rawValue, type: responseModel)
        print("Sucesso: \(response)")
    }
}
