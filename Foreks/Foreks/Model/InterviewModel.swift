//
//  InterviewModel.swift
//  Foreks
//
//  Created by Onur Başdaş on 19.01.2022.
//

import Foundation

struct HTTPSInterview: Codable {
    let l: [L]
    let z: String
}

// MARK: - L
struct L: Codable {
    let tke, clo, pdd, las: String
}
