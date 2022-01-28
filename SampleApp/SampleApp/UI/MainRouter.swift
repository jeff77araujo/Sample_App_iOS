//
//  MainRouter.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

class MainRouter {

    func simulation() -> SimulationViewController {
        
        let vc = SimulationViewController()
        vc.router = self
        
        let presenter = SimulationPresenter(viewController: vc)
        let interactor = SimulationInteractor(presenter: presenter)
        interactor.repository = SimulationRepository()
        
        vc.interactor = interactor
        
        return vc
    }
    
    func review(model: ReviewModel) -> ReviewViewController {
        
        let vc = ReviewViewController()
        
        let presenter = ReviewPresenter(viewController: vc)
        let interactor = ReviewInteractor(presenter: presenter)
        interactor.reviewModel = model
        
        vc.interactor = interactor
        
        return vc
    }
    
//    func simulation(callingController: UIViewController) {
//
//        let vc = SimulationViewController()
//
//        let presenter = SimulationPresenter(viewController: vc)
//        let interactor = SimulationInteractor(presenter: presenter)
//        interactor.repository = SimulationRepository()
//
//        vc.interactor = interactor
//
//        callingController.present(vc, animated: true)
//    }
    
    
    
}
