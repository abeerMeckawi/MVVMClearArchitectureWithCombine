//
//  UserService.swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation
import Combine

protocol UsersServiceProtocol: AnyObject {
    
    var networker : NetworkerProtocol {get}
    
    func getUsers() -> AnyPublisher<Users,Error>
    func getUsers(count : Int) -> AnyPublisher<Users,Error>
    func getUser(id: String) -> AnyPublisher<User,Error>
    
}
    
    final class UsersService : UsersServiceProtocol {

        var networker: NetworkerProtocol

        init(networker: NetworkerProtocol = NetWorker()){
            self.networker = networker
        }

        func getUsers() -> AnyPublisher<Users, Error> {
            
            let endpoint = EndPoint.users
            return networker.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
        }

        func getUsers(count: Int) -> AnyPublisher<Users, Error> {
            
            let endpoint = EndPoint.users(count: count)
            return networker.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
        }

        func getUser(id: String) -> AnyPublisher<User, Error> {
            let endpoint = EndPoint.user(id: id)
            return networker.get(type: User.self, url: endpoint.url, headers: endpoint.headers)
        }

    }
