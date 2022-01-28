//
//  ReviewInteractor.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

protocol ReviewInteractorProtocol {
    var presenter: ReviewPresenterProtocol? { get set }
    
    var reviewModel: ReviewModel? { get set }
    
    func load()
}

class ReviewInteractor: ReviewInteractorProtocol {
    
    var presenter: ReviewPresenterProtocol?
    
    var reviewModel: ReviewModel?
    
    init(presenter: ReviewPresenterProtocol) {
        self.presenter = presenter
    }
    
    func load() {
         presenter.presentReview()
    }
}
