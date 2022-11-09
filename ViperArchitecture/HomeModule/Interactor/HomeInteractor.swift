//
//  HomeInteractor.swift
//  ViperArchitecture
//
//  Created by Cem Girgin on 8.11.2022.
//

import Foundation


protocol AnyInteractor{
    var presenter:AnyPresenter? {get set}
    
    func dowloadData()
}

class HomeInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func dowloadData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character")else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else{
                self.presenter?.didDownloadData(result: .failure(NetworkError.networkFailed))
                return
            }
            do{
                let characters = try JSONDecoder().decode(CharacterModel.self, from: data)
                self.presenter?.didDownloadData(result: .success(characters.results))
                print(characters)
            }catch{
                self.presenter?.didDownloadData(result: .failure(NetworkError.parsingFailed))
            }
        }
        task.resume()

    }
    
    
}
