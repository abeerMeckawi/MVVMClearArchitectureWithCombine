//
//  UsersViewModel.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation
import Combine


class UsersViewModel : ObservableObject{
    
    @Published var users : Users = Users(data: [])
    
    private var userService : UsersServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(users:Users = Users(data: []),userService: UsersServiceProtocol = UsersService()){
        
        self.users = users
        self.userService = userService
        
    }
    
    func onAppear(){
        self.getUsers(count: 40)
    }
    
    private func getUsers(count:Int){
        userService.getUsers(count: count)
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            
                
            }receiveValue: { [weak self] users in
                
                self?.users = users
            }
            .store(in: &cancellables)
    }
    
    
}
