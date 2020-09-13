//
//  ItemCourse.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemCourse: View {
    var course : Course
    var body: some View {
        HStack(spacing: 15) {
            
            AnimatedImage(url: URL(string: self.course.imageUrl))
            .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(self.course.name)
                
                Text(self.course.shortDescription)
                    .font(.caption)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

struct ItemCourse_Previews: PreviewProvider {
    static var previews: some View {
        ItemCourse(course: Course(id: 1, name: "Curso de python para inciantes", shortDescription: "Curso voltado pra quem gosta de python", imageUrl: "https://season-training.s3-sa-east-1.amazonaws.com/images/blog/blog-17.jpg", value: 10000, initDate: Date(), finishDate: Date()))
    }
}
