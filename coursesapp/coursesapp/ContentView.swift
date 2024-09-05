//
//  ContentView.swift
//  coursesapp
//
//  Created by student-2 on 30/08/24.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selecteedTab: Tab = .chat 
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    @State var isOpen = false
    @State var show = false
    var body: some View {
        ZStack{
            Color("Background 2").ignoresSafeArea()
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(
                    .degrees(isOpen ? 0 :30),axis: (x: 0, y: 1, z: 0)
                )
            Group {
                switch selecteedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("search")
                case .timer:
                    Text("timer")
                case .bell:
                    Text("bell")
                case .user:
                    Text("user")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .rotation3DEffect(
                .degrees(isOpen ? 30 : 0),axis: (x: 0, y: isOpen ? -1 : 0, z: 0)
            )
            .offset(x:isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .scaleEffect(show ? 0.92 : 1)
            .ignoresSafeArea()
            
            Image(systemName: "person")
                .frame(width: 36, height: 36)
                .background(.white)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .onTapGesture {
                    withAnimation(.spring()){
                        show = true
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .topTrailing)
                .offset(x:-10,y: 20)
                .offset(x: isOpen ? 100 : 0)
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction:0.7)){
                        isOpen.toggle()
                    }
                }
                .zIndex(1)
            Tabbar()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
                .offset(y: -24)
                .background(
                    LinearGradient(colors: [Color("Background").opacity(0),Color("Background")], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .bottom)
                        .allowsHitTesting(false)
                        .opacity(isOpen ? 0 : 1)
                )
                .ignoresSafeArea()
                
            
            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: show ? -10 : 0)
                    
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
