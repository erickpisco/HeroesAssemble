//
//  HeroServices.swift
//  HeroesAssemble
//
//  Created by erick pisco on 16/05/19.
//  Copyright © 2019 erick pisco. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelServices {
    
    static private let base_URL = ""
    static private let privateKey = ""
    static private let publicKey = ""
    static private let limit = 50
    
    class func getHeroes(name: String?, page: Int = 0, completion: @escaping (MarvelInfo?) -> Void) {
        
        let offset = page * limit
        let startWith: String
        if let name = name, !name.isEmpty {
            startWith = "nameStartWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startWith = ""
        }
        
        let url = base_URL + "offset=\(offset)&limit=\(limit)&" + startWith + getCredentials()
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else {
                completion(nil)
                return
                
            }
            do {
                let heroInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                completion(heroInfo)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
                
                
            
                
            }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    
}
