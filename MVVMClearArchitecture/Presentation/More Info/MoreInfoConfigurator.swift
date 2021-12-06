//
//  MoreInfoConfigurator.swift
//  MVVMClearArchitecture
//
//  Created by Abeer Meckawi on 03/12/2021.
//

import Foundation

final class MoreInfoConfigurator {
    
    static func configureMoreInfoView(with user :User) -> MoreInfoView {
        
        return MoreInfoView(viewModel: MoreInfoViewModel(user: user))
    }
}
