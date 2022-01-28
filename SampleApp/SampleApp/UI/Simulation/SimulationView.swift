//
//  SimulationView.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

class SimulationView: UIView {
    
    lazy var requestedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var borderedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 16
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        borderedView.addSubview(requestedValueLabel)
        
        addSubview(borderedView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            requestedValueLabel.topAnchor.constraint(equalTo: borderedView.topAnchor, constant: padding),
            requestedValueLabel.centerXAnchor.constraint(equalTo: borderedView.centerXAnchor),
            requestedValueLabel.centerYAnchor.constraint(equalTo: borderedView.centerYAnchor),
            
            borderedView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            borderedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            borderedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            borderedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }

}
