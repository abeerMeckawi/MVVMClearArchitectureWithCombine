//
//  UserDetailsRouter.swift
//  MVVMClearArchitecture
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import SwiftUI

final class UserDetailsRouter{
    
    public static func destinationsForeMoreInfoAction(user: User) -> some View {
    
        return MoreInfoConfigurator.configureMoreInfoView(with: user)
    }
    
}
