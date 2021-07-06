//
//  CharactersRouter.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 6.07.2021.
//

import Foundation
import UIKit

final class CharactersRouter {
    
    static func createModule() -> CharactersViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CharactersViewController") as! CharactersViewController
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}
