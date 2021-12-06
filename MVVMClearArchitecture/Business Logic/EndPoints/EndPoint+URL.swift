//
//  EndPoint+URL.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation


extension EndPoint{
    
    var url : URL {
        var components = URLComponents()
        components.scheme = Constant.schema
        components.host = Constant.host
        components.path = Constant.path + path
        components.queryItems = queryItems
        
        guard let url = components.url else{
            preconditionFailure("Invalid URL compontents: \(components)")
        }
        
        return url
    }
    
    var headers : [String:Any] {
        
        return[
            "app-id":Constant.apiKey
        ]
    }
    
}
