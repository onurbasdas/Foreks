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
    
    static func getPageDetail(tke: String, completion:@escaping ([L]) -> ()) {
        AF.request(Constants.baseURL + Constants.interViewURL + tke, method: .get,encoding: JSONEncoding.default).response{ response in
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

