//
//  PersonagensModel.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 05/12/23.
//

import Foundation

struct Personagens: Codable {
    let info: InfoPersonagens
    let results: [Personagem]
}

struct InfoPersonagens: Codable {
    let count: Int
    let pages: Int
    let next: String
}

struct Personagem: Codable {
    let id: Int
    let name: String
    let origin: Origem
    let image: String
}

struct Origem: Codable {
    let name: String
    let url: String
}

struct Localizacao: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

struct Epsodio: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case airDate = "air_date"
        case episode = "episode"
        case characters = "characters"
        case url = "url"
        case created = "created"
    }
}

enum Section: Int {
    case personagens = 0
    case localizacoes = 1
    case epsodios = 2
}

enum SectionComunication: Int {
    case links = 0
    case wifi = 1
    case switchs = 2
}

/// Se o valor for nil, a requisicao nao terminou, se o valor for true, a requisicao terminou com sucesso e se for false, a requisicao terminou com erro
struct StatusRequest {
    var personagens: Bool?
    var personagem: Bool?
    var localizacao: Bool?
    var epsodio: Bool?
}

enum TypeOfCell {
    case personagens
    case personagem
    case episodios
    case episodio
    case localizacoes
    case localizacao
    case padrao
}



enum RickAndMortyMock: String {
    case MockPersonagem
}
