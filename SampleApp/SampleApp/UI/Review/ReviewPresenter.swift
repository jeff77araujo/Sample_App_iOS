//
//  ReviewPresenter.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol ReviewPresenterProtocol {
    var viewController: ReviewViewControllerProtocol? { get set }
}

class ReviewPresenter: ReviewPresenterProtocol {

    var viewController: ReviewViewControllerProtocol?
    
    init(viewController: ReviewViewControllerProtocol) {
        self.viewController = viewController
    }
}
