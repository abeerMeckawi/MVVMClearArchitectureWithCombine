//
//  UserDetailsViewModel .swift
//  MVVMClearStructure
//
//  Created by Abeer Meckawi on 02/12/2021.
//

import Foundation
import UIKit
import Combine

class UserDetailsViewModel : ObservableObject {
    
    @Published var avtar : UIImage = UIImage()
    
    
    let user : User
    
    private var userPictureService : UserPictureServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(user : User,userPictureService : UserPictureServiceProtocol = UserPictureService()){
        
        self.userPictureService = userPictureService
        self.user = user
    }
    
    func onAppear(){
        
        self.getAvtarData()
    }
    
    private func getAvtarData(){
        
        guard let pictureUrlString = user.picture else {
            
            print("Url Not exist")
            return
        }
        
        self.userPictureService.getAvtarData(urlString: pictureUrlString)
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                
                switch completion{
                    
                case .finished:
                    break
                case .failure(let error):
                    
                    print("Error \(error)")
                }
                
            }receiveValue: { [weak self] data in
                guard let image = UIImage(data: data) else {return}
                self?.avtar = image
            }.store(in: &cancellables)
    }
}
