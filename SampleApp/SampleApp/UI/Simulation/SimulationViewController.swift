//
//  SimulationViewController.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol SimulationViewControllerProtocol {
    var interactor: SimulationInteractorProtocol? { get set }
    
    func displaySimulation(requestedValue: String)
    func routeToReview(reviewModel: ReviewModel)
}

class SimulationViewController: UIViewController {
    
    var router: MainRouter?
        
    var interactor: SimulationInteractorProtocol?
    
    // MARK: View
    
    lazy var mainScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ mainLabel, simulateButton, simulationView, hireButton ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clique em Simular para visualizar o seu empréstimo disponível"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var simulateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Simular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(simulateTouched), for: .touchDown)
        return button
    }()
    
    lazy var simulationView: SimulationView = {
        let view = SimulationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var hireButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.isHidden = true
        button.addTarget(self, action: #selector(hireTouched), for: .touchDown)
        return button
    }()
    
    // MARK: Lifecycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        
        mainScroll.addSubview(mainStack)
        view.addSubview(mainScroll)
        
        let margin: CGFloat = 16
        
        NSLayoutConstraint.activate([
            mainScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: mainScroll.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: mainScroll.leadingAnchor, constant: margin),
            mainStack.trailingAnchor.constraint(equalTo: mainScroll.trailingAnchor, constant: -margin),
            mainStack.bottomAnchor.constraint(equalTo: mainScroll.bottomAnchor),
            
            mainStack.centerXAnchor.constraint(equalTo: mainScroll.centerXAnchor),
            
            simulateButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc private func simulateTouched() {
        debugPrint("Simulate")
        
        interactor?.fetchSimulation()
    }
    
    @objc private func hireTouched() {
        debugPrint("Continuar")
        
        interactor?.fetchReviewConfirmation()
    }
    
}

extension SimulationViewController: SimulationViewControllerProtocol {
    
    func displaySimulation(requestedValue: String) {
        simulationView.requestedValueLabel.text = requestedValue
        simulationView.isHidden = false
        
        hireButton.isHidden = false
    }
    
    func routeToReview(reviewModel: ReviewModel) {
        guard let review = router?.review(model: reviewModel) else { return }
        
        self.present(review, animated: true)
    }
    
}

