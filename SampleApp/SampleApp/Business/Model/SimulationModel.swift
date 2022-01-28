//
//  SimulationModel.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

class SimulationModel {

    var valorFinal: Double
    var valorParcela: Double
    var quantidadeParcelas: Int
    var valorDisponivel: Double
    
    var customFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.currencySymbol = "R$"
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    init(valorFinal: Double, valorParcela: Double, quantidadeParcelas: Int, valorDisponivel: Double) {
        self.valorFinal = valorFinal
        self.valorParcela = valorParcela
        self.quantidadeParcelas = quantidadeParcelas
        self.valorDisponivel = valorDisponivel
    }
    
    var valorFinalFormatado: String {
        let number = NSNumber(value: valorFinal)
        return customFormatter.string(from: number) ?? "---"
    }
    
    var valorDisponivelFormatado: String {
        let number = NSNumber(value: valorDisponivel)
        return customFormatter.string(from: number) ?? "---"
    }
    
}
