//
//  UsersRouter.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import SwiftUI

final class UserRouter{
    
    public static func destinationForTappedUser(user:User) -> some View{
        
        return UserDetailsConfigurator.configureUserDetailsView(with: user)
        
    }
}
