//
//  SimulationRepositoryProtocol.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol SimulationRepositoryProtocol {
    func simulate(completion: (SimulationResponse) -> Void)
    func confirm(completion: (ReviewResponse) -> Void)
}

class SimulationRepository: SimulationRepositoryProtocol {
    
    var currentSimulation: SimulationResponse?
    
    func simulate(completion: (SimulationResponse) -> Void) {
        
//         perform(request: someRequest, completion: )
        
        let min: Double = 10000
        let max: Double = 200000

        let requested = Double.random(in: min...max)
        let response = SimulationResponse(requestedValue: requested)

        currentSimulation = response

        completion(response)
    }
    
    func confirm(completion: (ReviewResponse) -> Void) {
        
        guard let simulation = currentSimulation else { return }
        
        let reviewResponse = ReviewResponse(simulation: simulation)
        
        completion(reviewResponse)
    }
}
