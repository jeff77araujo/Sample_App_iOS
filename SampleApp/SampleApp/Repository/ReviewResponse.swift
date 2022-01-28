//
//  ReviewResponse.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

class ReviewResponse: NSObject {
    
    var items: [Item]

    init(simulation: SimulationResponse) {
        
        items = []
        
        let requested = ReviewResponse.Item(key: "Valor do empréstimo:", value: simulation.requestedValue)
        items.append(requested)
        
        let installments = ReviewResponse.Item(key: "Parcelas:", value: Double(simulation.maxInstallment))
        items.append(installments)
        
        let installmentValue = ReviewResponse.Item(key: "Valor da parcela:", value: simulation.finalInstallment)
        items.append(installmentValue)
        
        let total = ReviewResponse.Item(key: "Valor Total:", value: simulation.totalValue)
        items.append(total)
    }
    
    struct Item {
        var key: String
        var value: Double
    }
}
