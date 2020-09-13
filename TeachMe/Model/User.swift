//
//  User.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import Foundation
struct User: Identifiable,Codable {
    var id : Int
    var name : String
    var email : String
    var password : String
    var iamgeUrl : String
    
    func savePref() ->  Bool{
        let pref = UserDefaults.standard
        let json : String? = encodeJson()
        if json == nil {
            return false
        }
        pref.setValue(json, forKey: "user_pref")
        pref.synchronize()
        return true
    }
    private static func decodeJson(json:String) -> User? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(User.self, from: json.data(using: .utf8)!)
        }
        catch {
        }
        return nil
    }
    private   func encodeJson()->String?{
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)!
        }
        catch {
        }
        return nil
    }
    static func getPref() -> User?{
        let pref = UserDefaults.standard
        if let json = pref.string(forKey: "user_pref"){
            return decodeJson(json: json)
        }else{
            return nil
        }
    }
}
