//
//  UserPictureService.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation
import Combine

protocol UserPictureServiceProtocol : AnyObject {
    
    var networker : NetworkerProtocol {get}
    
    func getAvtarData(urlString: String) -> AnyPublisher<Data,Error>
}

final class UserPictureService : UserPictureServiceProtocol {
    
    
    var networker: NetworkerProtocol
    
    init(networker : NetworkerProtocol = NetWorker()){
        self.networker = networker
    }
    

    func getAvtarData(urlString: String) -> AnyPublisher<Data, Error> {
        
        guard let url = URL(string: urlString) else {
            return Fail<Data,Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return networker.getData(url: url, headers: [:])
            .mapError{ _ in UserPictureError.dataInvalid}
            .eraseToAnyPublisher()
    }
    
    
}
