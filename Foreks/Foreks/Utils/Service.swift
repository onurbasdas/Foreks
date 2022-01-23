//
//  Service.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import Foundation
import Alamofire

class WebService {
    
    static func getPageDefaults(completion:@escaping ([MainDefaults]) -> ()) {
        AF.request(Constants.baseURL + Constants.settingsURL, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let pageResponse = try JSONDecoder().decode(Defaults.self, from:data)
                completion(pageResponse.mypageDefaults)
            }catch let e {
                print(e)
            }
        }
    }
    
    static func getMainName(completion:@escaping ([Mypage]) -> ()) {
        AF.request(Constants.baseURL + Constants.settingsURL, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let pageResponse = try JSONDecoder().decode(Defaults.self, from:data)
                completion(pageResponse.mypage)
            }catch let e {
                print(e)
            }
        }
    }
    
    static func getPageDetail(firstItem: String, secondItem: String, tke: String, completion:@escaping ([L]) -> ()) {
        let URL = Constants.baseURL + Constants.interViewURL + firstItem + "," + secondItem + "&stcs=" + tke
        AF.request(URL, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let pageResponse = try JSONDecoder().decode(HTTPSInterview.self, from:data)
                completion(pageResponse.l)
            }catch let e {
                print(e)
            }
        }
    }
}

