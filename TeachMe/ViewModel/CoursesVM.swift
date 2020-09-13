//
//  FetchCourses.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import Foundation
import SwiftUI

class CoursesVM : ObservableObject {
    @Published var list : [Course] = []
    @Published var isLoading : Bool = true
    @Published var isLogged : Bool = false
    let url = "https://igit-pai-ios.s3-sa-east-1.amazonaws.com/courses-data.json"
    
    func checkLogin(){
        let user : User? = User.getPref();
        self.isLogged = user != nil
    }
    
    func fetch(){
        DispatchQueue.main.async {
            self.list = []
            self.isLoading = true
            self.isLogged = false
        }
        checkLogin()
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: URL(string: url)!) { (data,_,_) in
            guard let list = data else {return}
            do{
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decoded = try decoder.decode([Course].self, from: list)
                print(decoded)
                DispatchQueue.main.async {
                    self.list = decoded
                    self.isLoading = false
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
