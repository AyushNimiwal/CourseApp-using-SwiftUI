//
//  MenuRow.swift
//  coursesapp
//
//  Created by student-2 on 04/09/24.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItem 
    @Binding var selectedMenu: SelectedMenu
    var body: some View {
        HStack(spacing: 14){
            item.icon.view()
                    .frame(width: 32,height: 32)
            Text(item.text)
                    .customFont(.headline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
            )
            .background(Color("Background 2"))
            .onTapGesture {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    item.icon.setInput("active", value: false)
                }
                withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                    selectedMenu = item.menu
                }
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: menuItems[0],selectedMenu: .constant(.home))
    }
}
