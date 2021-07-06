//
//  CharactersInteractor.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 6.07.2021.
//

import Foundation
//Presenter -> InteractorInterface
protocol CharactersInteractorInterface {
    func fetchCharacters()
}
//Output -> Presenter
protocol CharactersInteractorOutput: AnyObject {
    func handleCharsResult(_ result: [CharacterResult])
}

final class CharactersInteractor {
    weak var output: CharactersInteractorOutput?
}

extension CharactersInteractor: CharactersInteractorInterface {
    func fetchCharacters() {
        Service.shared.requestAF { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.output?.handleCharsResult(model.results)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
