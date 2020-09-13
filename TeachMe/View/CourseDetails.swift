//
//  CourseDetails.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetails: View {
    let course : Course
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
            VStack( spacing: 15){
                AnimatedImage(url: URL(string: self.course.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame( height: 255)
                    .clipShape(Circle())
                
                
                Text(course.shortDescription)
                    .font(.caption)
                
                HStack(){
                    Text("Data de inicio: ")
                    Text(course.printInitDate())
                        .font(.caption)
                }
                HStack(){
                    Text("Data de fim: ")
                    Text(course.printFinishDate())
                        .font(.caption)
                }
                HStack(){
                    Text("Valor: ")
                    Text(course.printValyeFormatted())
                        .font(.caption)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .navigationBarTitle("\(course.name)", displayMode: .inline)

    }
    
}

struct CourseDetails_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetails(course : Course(id: 1, name: "Curso de python para inciantes", shortDescription: "Curso voltado pra quem gosta de python", imageUrl: "https://season-training.s3-sa-east-1.amazonaws.com/images/blog/blog-17.jpg", value: 10000, initDate: Date(), finishDate: Date()))
    }
}
