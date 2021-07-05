//
//  CharacterModel.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 27.06.2021.
//

import Foundation

struct CharacterModel: Codable {
    let info: Info
    let results: [CharacterResult]
}
struct Info: Codable {
    let pages: Int
    let next: String
}
struct CharacterResult: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
