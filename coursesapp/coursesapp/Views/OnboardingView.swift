//
//  OnboardingView.swift
//  coursesapp
//
//  Created by student-2 on 30/08/24.
//

import SwiftUI
import RiveRuntime
struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State var showModel = false
    @Binding var show: Bool
    var body: some View {
        ZStack{
            background
            
            content
                .offset(y: showModel ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModel ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showModel {
                SignInView(showModel: $showModel)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()){
                                showModel = false
                            }
                        } label : {
                            Image(systemName: "xmark")
                                .frame(width: 36,height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x:0, y:3)
                        }
                            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
                    )
                    .zIndex(1)
            }
            
            Button {
                withAnimation {
                    show = false
                }
            } label : {
                Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10,x:0,y:10)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .topTrailing)
            .padding(20)
            .offset(y: showModel ? -200 : 80)
        }
    }
    
    var content : some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            Text("Don't skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            Spacer()
            
            button.view()
                .frame(width: 236,height: 64)
                .overlay{
                    Label("Start the courses",systemImage: "arrow.forward")
                        .offset(x:4,y:4)
                        .font(.headline)
                }
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y:10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()){
                            showModel = true
                        }
                        
                    }
            }
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .padding(40)
        .padding(.top,40)
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x:200, y:100)
            )
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true))
    }
}
