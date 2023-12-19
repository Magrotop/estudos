//
//  RickAndMorty.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 04/12/23.
//

import Foundation

enum RickAndMortyEndpoints {
    case listaPersonagens
    case personagem(_ id: Int)
    case localizacaoPersonagem(_ id: Int)
    case epsodio(_ id: Int)
}

extension RickAndMortyEndpoints: Endpoint {
    var scheme: String {
        return "https"
    }
    
    var method: String{
        return "GET"
    }
    
    var host: String {
        return Host.rickAndMorty.value
    }
    
    var query: [String : String]? {
        return nil
    }
    
    var path: String {
        switch self {
        case .listaPersonagens:
            return "/api/character"
        case .personagem(let id):
            return "/api/character/\(id)"
        case .localizacaoPersonagem(let id):
            return "/api/location/\(id)"
        case .epsodio(let id):
            return "/api/episode/\(id)"
        }
    }
}
