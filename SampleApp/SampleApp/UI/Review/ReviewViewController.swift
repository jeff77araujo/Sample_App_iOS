//
//  ReviewViewController.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol ReviewViewControllerProtocol {
    var interactor: ReviewInteractorProtocol? { get set }
}

class ReviewViewController: UIViewController, ReviewViewControllerProtocol {
    
    var interactor: ReviewInteractorProtocol?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .cyan
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.load()
    }

}
