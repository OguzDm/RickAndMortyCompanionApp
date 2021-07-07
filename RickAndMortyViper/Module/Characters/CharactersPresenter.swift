//
//  CharactersPresenter.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 6.07.2021.
//

import Foundation
protocol CharactersPresenterInterface {
    func viewDidLoad()
    var numberOfChars: Int {get}
    func charForIndex(_ index: Int) -> CharacterResult?
    func returnColorForStatus(_ index: Int) -> String
}
final class CharactersPresenter {
    
    private var chars = [CharacterResult]()
    weak var view: CharactersViewInterface?
    private let interactor: CharactersInteractorInterface
    init(view: CharactersViewInterface, interactor: CharactersInteractorInterface) {
        self.interactor = interactor
        self.view = view
    }
    
    private func fetchChars(){
        interactor.fetchCharacters()
    }
}
extension CharactersPresenter: CharactersPresenterInterface {
    func returnColorForStatus(_ index: Int) -> String {
        return (chars[safe: index]?.status == "Alive") ? "#00FF00FF" : "#FF0000FF"
    }
    
    func charForIndex(_ index: Int) -> CharacterResult? {
        chars[safe: index]
    }
    
    var numberOfChars: Int {
        chars.count
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
        fetchChars()
    }
}
extension CharactersPresenter: CharactersInteractorOutput {
    func handleCharsResult(_ result: [CharacterResult]) {
        chars = result
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
}
