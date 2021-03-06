//
//  MyPageModel.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import Foundation

struct Defaults: Codable {
    let mypageDefaults: [MainDefaults]
    let mypage: [Mypage]
}

struct MainDefaults : Codable {
    let cod : String
    let gro : String
    let tke : String
    let def : String
}

struct Mypage: Codable {
    let name, key: String
}
