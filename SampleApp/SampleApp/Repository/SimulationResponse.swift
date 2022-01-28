//
//  SimulationResponse.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

class SimulationResponse: NSObject {
    
    var identifier = UUID()
    
    var maxInstallment: Int
    var requestedValue: Double
    
    var taxes: Double
    
    var finalInstallment: Double
    var totalValue: Double

    init(requestedValue: Double) {
        
        self.requestedValue = requestedValue
        
        self.maxInstallment = Int.random(in: 1...24)
        self.taxes = Double.random(in: 1...2)
        
        let plot = requestedValue / Double(maxInstallment)
        
        self.finalInstallment = plot * taxes
        self.totalValue = finalInstallment * Double(maxInstallment)
    }
    
}
