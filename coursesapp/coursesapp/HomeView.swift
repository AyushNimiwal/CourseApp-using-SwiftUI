//
//  HomeView.swift
//  coursesapp
//
//  Created by student-2 on 04/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            ScrollView(.vertical,showsIndicators: false) {
                content
            }
        }
    }
    
    var content : some View {
        VStack(alignment:.leading ,spacing:0) {
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        VCard(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom,10)
            }
            Text("Recent")
                .customFont(.title3)
                .padding(.horizontal,20)
            VStack(spacing:20) {
                ForEach(courseSections) { courseSection in
                    HCard(section: courseSection)
                }
            }
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
