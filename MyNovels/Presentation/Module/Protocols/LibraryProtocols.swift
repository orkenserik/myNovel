//
//  LibraryProtocols.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import Foundation
import UIKit

protocol LibraryViewProtocols {
  var viewRef: LibraryController? {get set}
  var libraryWireframe: LibraryWireframe? {get set}
  var libraryInteractor: LibraryInteractor? {get set}
  func viewDidLoad()
}

protocol LibraryPresenterProtocol {
  func updateBookList(books: [Book]?, error: Error?)
}

protocol LibraryInteractorInputProtocol {
  var presenter: LibraryPresenter? {get set}
  //Presenter -> Interactor
  func getBooks()
}

protocol LibraryInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingBooks(books: [Book]?, error: Error?)
  
}

protocol LibraryWireframeProtocol {
  func showChapter(from controller: LibraryController)
}

