//
//  ListCourse.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import SwiftUI

struct ListCourse: View {
    @ObservedObject var vm = CoursesVM()
    
    var body: some View {
        ZStack{
            if self.vm.isLoading {
                Indicator()
                    .frame(width: 50, height: 50)
            }else{
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 0){
                        ForEach(self.vm.list) { course in
                            NavigationLink(destination: CourseDetails(course: course)){
                                ItemCourse(course: course)
                            }
                        }
                    }
                }
            }
        }
        .onAppear(){
            self.vm.fetch()
            
        }
        .navigationBarTitle("Cursos")
        .navigationBarItems(trailing: self.buildTrailing)
        
    }
    var buildTrailing: some View {
        if vm.isLoading{
             return AnyView(Text(""))
        }else
            if vm.isLogged {
                return AnyView(NavigationLink(destination: MyCourses(),label: {
                    Text("Meus cursos")
                    }))
            }
            else{
                return AnyView(NavigationLink(destination: Login(),label: {
                Text("Login")
                }))
        }
    }
}

struct ListCourse_Previews: PreviewProvider {
    static var previews: some View {
        ListCourse()
    }
}
