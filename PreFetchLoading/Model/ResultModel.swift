//
//  Response.swift
//  PreFetchLoading
//
//  Created by MACBOOK on 09/07/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

// MARK: - ResultModel
struct ResultModel: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Result]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? DocumentDefaultValues.Empty.string
        version = try values.decodeIfPresent(Double.self, forKey: .version) ?? DocumentDefaultValues.Empty.double
        href = try values.decodeIfPresent(String.self, forKey: .href) ?? DocumentDefaultValues.Empty.string
        results = try values.decodeIfPresent([Result].self, forKey: .results) ?? []
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let href: String
    let ingredients: String
    let thumbnail: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? DocumentDefaultValues.Empty.string
        href = try values.decodeIfPresent(String.self, forKey: .href) ?? DocumentDefaultValues.Empty.string
        ingredients = try values.decodeIfPresent(String.self, forKey: .ingredients) ?? DocumentDefaultValues.Empty.string
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? DocumentDefaultValues.Empty.string
    }
}
