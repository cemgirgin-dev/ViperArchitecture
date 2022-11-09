//
//  HomeRouter.swift
//  ViperArchitecture
//
//  Created by Cem Girgin on 8.11.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class HomeRouter : AnyRouter {
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = HomeRouter()
        
        var view : AnyView = HomeViewController()
        var presenter : AnyPresenter = HomePresenter()
        var interactor : AnyInteractor = HomeInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
        
    }
    
}
