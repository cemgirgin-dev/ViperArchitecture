//
//  HomePresenter.swift
//  ViperArchitecture
//
//  Created by Cem Girgin on 8.11.2022.
//

import Foundation

enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    var router : AnyRouter? {get set}
    
    func didDownloadData(result: Result<[Results], Error>)
}

class HomePresenter : AnyPresenter
{
 
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.dowloadData()
        }
    }
    
    var view: AnyView?
    
    var router: AnyRouter?
    
    func didDownloadData(result: Result<[Results], Error>) {
        switch result {
            case .success(let characters):
                view?.update(with: characters)
            case .failure(_):
                view?.update(with: "Try again later")
        }
    }
    
    
}
