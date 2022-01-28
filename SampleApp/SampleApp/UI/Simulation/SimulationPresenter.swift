//
//  SimulationPresenter.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol SimulationPresenterProtocol {
    var viewController: SimulationViewControllerProtocol? { get set }
    
    func presentSimulation(simulationModel: SimulationModel)
    func presentReview(reviewModel: ReviewModel)
}

class SimulationPresenter: SimulationPresenterProtocol {
    
    var viewController: SimulationViewControllerProtocol?
    
    init(viewController: SimulationViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func presentSimulation(simulationModel: SimulationModel) {
        
//        let valorDisponivel = simulationModel.valorDisponivel
        
        let valorDisponivelFormatado = simulationModel.valorDisponivelFormatado
        
        viewController?.displaySimulation(requestedValue: valorDisponivelFormatado)
    }
    
    func presentReview(reviewModel: ReviewModel) {
        viewController?.routeToReview(reviewModel: reviewModel)
    }
    
}
