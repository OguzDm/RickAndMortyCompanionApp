//
//  Service.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 27.06.2021.
//

import Foundation
import Alamofire


class Service {
    static let shared = Service()
    
    func requestAF(completionHandler: @escaping(Result<CharacterModel,Error>) -> Void){
        AF.request(Constants.baseUrl + "/character").responseDecodable(of:CharacterModel.self) { response in
            switch response.result {
            case .success(let model):
                completionHandler(.success(model))
            case .failure(let error):
                print(error)
            }
        }
    }
}
