//
//  CustomButton.swift
//  ToDo App
//
//  Created by Damaris Muhia on 14/06/2023.
//

import SwiftUI

struct CustomButton: View {
    let btnTitle:String
    let btnBgColor:Color
    //defina aclosure that will be triggered when the button in clicked
    let btnClicked: () -> Void
    var body: some View {
        Button  {
            //action
            btnClicked()
        }
    label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 55)
                    .foregroundColor(btnBgColor)
                Text(btnTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(btnTitle: "Btn Tit", btnBgColor: .blue){
            //closure body
        }
    }
}
