//
//  LoginVM.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 09/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import Foundation
class LoginVM: ObservableObject {
    @Published var isLoading : Bool = true
    var login : String = ""
    var senha : String = ""
    
}
