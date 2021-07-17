//
//  LibraryPresenter.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//


import UIKit

class LibraryPresenter: LibraryViewProtocols {
  var viewRef: LibraryController?
  var libraryWireframe: LibraryWireframe?
  var libraryInteractor: LibraryInteractor?
  
  func viewDidLoad() {
    LibraryWireframe.loadLibraryPageComponents(withPresenter: self)
    libraryInteractor?.getBooks()
  }
}

extension LibraryPresenter: LibraryInteractorOutputProtocol {
  
  func didFinishFetchingBooks(books: [Book]?, error: Error?) {
    guard let books = books else {
      return
    }
    viewRef?.updateBookList(books: books, error: nil)
  }
    
  func showChapter() {
    guard let sourceController = viewRef else {
      return
    }
    libraryWireframe?.showChapter(from: sourceController)
  }
  
}


