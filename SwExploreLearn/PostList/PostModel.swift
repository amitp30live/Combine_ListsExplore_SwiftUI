//
//  PostModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
}
