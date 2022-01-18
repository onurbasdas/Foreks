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
        AF.request(Constants.baseUrl, method: .get,encoding: JSONEncoding.default).response{ response in
            guard let data = response.data else {return}
            do {
                let pageResponse = try JSONDecoder().decode(Defaults.self, from:data)
                completion(pageResponse.mypageDefaults)
            }catch let e {
                print(e)
            }
        }
    }
}

