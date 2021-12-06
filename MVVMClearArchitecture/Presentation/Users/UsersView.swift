//
//  ContentView.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var viewModel : UsersViewModel
    
    var body: some View {
        
        NavigationView{
            List(viewModel.users.data){ user in
                
                NavigationLink(destination: UserRouter.destinationForTappedUser(user: user)){
                    
                    Text(user.firstName)
                }
                
            }.navigationTitle("Users")
        }.onAppear(perform: {viewModel.onAppear()})
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: UsersViewModel())
    }
}
