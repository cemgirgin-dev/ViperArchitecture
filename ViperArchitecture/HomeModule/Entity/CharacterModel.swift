//
//  CharacterModel.swift
//  ViperArchitecture
//
//  Created by Cem Girgin on 8.11.2022.
//

import Foundation


struct CharacterModel : Codable{
    let info: Info
    let results: [Results]
}

struct Info : Codable{
    let count:Int
    let pages:Int
    let next:String
    let prev:String?
}

struct Results: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location:Codable {
    let name:String
    let url:String
}
