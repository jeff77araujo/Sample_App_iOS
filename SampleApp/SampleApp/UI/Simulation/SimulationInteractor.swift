//
//  SimulationInteractor.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol SimulationInteractorProtocol {
    var presenter: SimulationPresenterProtocol? { get set }
    var repository: SimulationRepositoryProtocol? { get set }
    
    func fetchSimulation()
    func fetchReviewConfirmation()
}

class SimulationInteractor: SimulationInteractorProtocol {
    
    var presenter: SimulationPresenterProtocol?
    
    var repository: SimulationRepositoryProtocol?
    
    init(presenter: SimulationPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchSimulation() {
        guard let repo = repository else { return }
        
        repo.simulate { (response) in
            
            let model = SimulationModel(valorFinal: response.totalValue,
                                        valorParcela: response.finalInstallment,
                                        quantidadeParcelas: response.maxInstallment,
                                        valorDisponivel: response.requestedValue)
            
            presenter?.presentSimulation(simulationModel: model)
        }
    }
    
    func fetchReviewConfirmation() {
        guard let repo = repository else { return }
        
        repo.confirm { (response) in
            
            var model = ReviewModel()
            
            let convertedItems = response.items.compactMap { (item) -> ReviewModel.Item? in
                
                let itemKey = item.key
                let itemValue = "\(item.value)"
                
                let reviewItem = ReviewModel.Item(key: itemKey, value: itemValue)
                
                return reviewItem
            }
            
            model.items = convertedItems
            
            presenter?.presentReview(reviewModel: model)
        }
    }

}
