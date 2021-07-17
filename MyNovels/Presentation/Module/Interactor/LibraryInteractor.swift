//
//  LibraryInteractor.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import UIKit

class LibraryInteractor: LibraryInteractorInputProtocol {

  var presenter: LibraryPresenter?
    
  func getBooks() {
    ApiClient.shared.makeRequest(NovelApi.library, arrayModel: Book.self, path: "books", showLoad: true) { [weak self] (arrModel) in
        guard let `self` = self else {return}
        DispatchQueue.main.async {
            self.presenter?.didFinishFetchingBooks(books: arrModel, error: nil)
        }
    } failure: { [weak self] (errorMessage) in
        print(errorMessage)
//        guard let `self` = self else {return}
//        self.presenter?.didFinishFetchingBooks(books: [], error: errorMessage)
    }

  }
    
}
