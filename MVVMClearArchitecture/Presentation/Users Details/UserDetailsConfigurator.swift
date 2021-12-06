//
//  UserDetailsConfigurator.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation

final class UserDetailsConfigurator{
    
    static func configureUserDetailsView(with user : User) -> UserDetailsView{
        
        return UserDetailsView(viewModel: UserDetailsViewModel(user: user))
    }
}
