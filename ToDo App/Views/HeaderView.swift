//
//  HeaderView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 08/06/2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subTitle:String
    let angle:Double
    let background:Color
    let offSetValue:Double
    let height:Double
    let paddingTop:Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle)) // 15
                
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top,paddingTop)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 300)
        .offset(y: offSetValue)    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "ToDo List", subTitle: "Login", angle: 15, background: .pink, offSetValue: -100,height: 300,paddingTop: 30)
    }
}
