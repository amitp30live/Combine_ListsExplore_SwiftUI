//
//  CommentModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation

struct CommentModel: Identifiable, Codable {
    let id: Int
    let name: String
    let body: String
}
