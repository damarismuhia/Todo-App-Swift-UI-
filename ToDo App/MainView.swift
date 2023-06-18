//
//  ContentView.swift
//  ToDo App
//
//  Created by Damaris Muhia on 07/06/2023.
//

import SwiftUI


struct MainView: View {
    @StateObject var viewmodel = MainViewModel()
    var body: some View {
        if(!viewmodel.currentUserId.isEmpty && viewmodel.isUserSignedIn){
            //Bottom navigation view by use of TabView
            TabView{
                HomeView()
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem(){
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }else{
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

