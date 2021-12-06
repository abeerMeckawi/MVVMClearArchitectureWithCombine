//
//  UsersConfiguratior.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation

final class UserConfigurator {
    
    static func configureUsersView(with viewModel : UsersViewModel = UsersViewModel()) -> UsersView {
        
        return UsersView(viewModel: viewModel)
    }
}
