//
//  Login.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @ObservedObject var vm = LoginVM()
    var body: some View {
        VStack(spacing: 25){
            TextField("Login", text: $vm.login)
            TextField("Password", text: $vm.senha)
        }
        .padding(25)
        .padding(.horizontal)
        .padding(.vertical)
    .navigationBarTitle("Login")
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
