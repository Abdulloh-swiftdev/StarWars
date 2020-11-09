//
//  Character.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import Foundation

struct Characters: Codable {
    let count: Int
    let results: Array<Character>
}

struct Character: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
}
