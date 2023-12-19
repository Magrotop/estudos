//
//  Endpoint.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 04/12/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: String { get }
    var query: [String : String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}
