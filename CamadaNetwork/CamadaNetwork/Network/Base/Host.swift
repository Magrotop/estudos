//
//  Host.swift
//  CamadaNetwork
//
//  Created by Rodrigo Takumi on 04/12/23.
//

import Foundation

enum Host {
    case rickAndMorty
    
    var value : String {
        switch self {
        case .rickAndMorty:
            return "rickandmortyapi.com"
        }
      }
}
