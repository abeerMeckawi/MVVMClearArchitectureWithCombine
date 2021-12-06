//
//  EndPoint+Users.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation

extension EndPoint{
    
    static var users : Self {
        
        return EndPoint(path: Constant.pathUser)
    }
    
    static func users(count:Int) -> Self{
        
        return EndPoint(path: Constant.pathUser ,queryItems: [URLQueryItem(name: "limit", value: "\(count)")])
    }
    
    static func user(id:String) -> Self{
        return EndPoint(path: Constant.pathUser + id)
    }
}
