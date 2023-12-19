//
//  ErroRequest.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 04/12/23.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case invalidResponse
    case badRequest(_ statusCode: Int)
    case authenticationError(_ statusCode: Int)
    case unexpectedStatusCode(_ statusCode: Int)
    case unknown(descricao: String)
    
    var mensagem: String {
        switch self {
        case .decode:
            return "erro na decodificacao"
        case .invalidURL:
            return "URL invalida"
        case .invalidResponse:
            return "Response invalido"
        case .unknown(let descricao):
            return "erro desconhecido: \(descricao)"
        case .unexpectedStatusCode(let statusCode):
            return "status code inesperado \(statusCode)"
        case .badRequest(let statusCode):
            return "bad request: statuscode \(statusCode)"
        case .authenticationError(let statusCode):
            return "falha de autenticacao: statuscode \(statusCode)"
        }
    }
}
