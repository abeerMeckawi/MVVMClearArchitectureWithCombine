//
//  UserDetailsView.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var viewModel : UserDetailsViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State private var showingModelSheet = false
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.avtar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth * 0.2, height: screenWidth * 0.2,alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue,lineWidth: 3))
                .padding()
            
            HStack{
                Text(viewModel.user.firstName)
                Text(viewModel.user.lastName)
            }
            Button(action: {showingModelSheet.toggle()
                
            }){
                Text("Get More Info")
                    .padding()
                    .frame(width:screenWidth * 0.6)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(16)
            }.sheet(isPresented: $showingModelSheet, content: {
                UserDetailsRouter.destinationsForeMoreInfoAction(user: viewModel.user)
            })
            .padding(.top,20)
            Spacer()
        }.navigationTitle(viewModel.user.firstName)
            .onAppear(perform: {
                self.viewModel.onAppear()
            })
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(viewModel: UserDetailsViewModel(user: User.fake()))
    }
}
