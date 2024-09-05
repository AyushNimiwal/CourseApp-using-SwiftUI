//
//  HCard.swift
//  coursesapp
//
//  Created by student-2 on 04/09/24.
//

import SwiftUI

struct HCard: View {
    var section : CourseSection
    var body: some View {
        HStack(spacing:20){
            VStack(alignment: .leading, spacing: 8){
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        HCard(section: courseSections[1])
    }
}
