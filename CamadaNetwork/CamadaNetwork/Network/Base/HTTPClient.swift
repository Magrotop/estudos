//
//  Network.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 01/12/23.
//

import Foundation

class HTTPClient {
    
    static let share = HTTPClient()
    
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        guard let url = urlRequest(endpoint) else { return .failure(.invalidURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: nil
        )
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                guard let decodeResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodeResponse)
            case 400...499:
                return .failure(.authenticationError(httpResponse.statusCode))
            case 500...599:
                return .failure(.badRequest(httpResponse.statusCode))
            default:
                return .failure(.unexpectedStatusCode(httpResponse.statusCode))
            }
        } catch {
            return .failure(.unknown(descricao: error.localizedDescription))
        }
    }
    
    private func urlRequest(_ endpoint: Endpoint) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = endpoint.scheme
        urlComponent.host = endpoint.host
        urlComponent.path = endpoint.path
        urlComponent.queryItems = configuraQueryItem(endpoint.query)
        return urlComponent.url
    }
    
    private func configuraQueryItem(_ items: [String:String]?) -> [URLQueryItem]? {
        if let items = items {
            return items.map { URLQueryItem(name: $0.key, value: $0.value) }
        } else {
            return nil
        }
    }
    
    // path sempre exisitrá, então não preciso verificar se existe
    func configuraPath(url: inout URLComponents, _ path: String?) {
        if let path = path {
            url.path = path
        }
    }
}
