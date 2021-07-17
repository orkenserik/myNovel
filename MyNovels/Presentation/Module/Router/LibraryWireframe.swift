//
//  LibraryWireframe.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import UIKit

class LibraryWireframe {
  
  func navigateToChapter(from classRef: UIViewController) {
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let mapsController = mainStoryBoard.instantiateViewController(withIdentifier: "ChapterController") as! ChapterController
    guard let sourceNavigationController = classRef.navigationController else {
      classRef.present(mapsController, animated: true, completion: nil)
      return
    }
    sourceNavigationController.pushViewController(mapsController, animated: true)
    
  }
  
  class func loadLibraryPageComponents(withPresenter presenter: LibraryPresenter) {
    presenter.libraryWireframe = LibraryWireframe()
    presenter.libraryInteractor = LibraryInteractor()
    presenter.libraryInteractor?.presenter = presenter
  }
  
}

extension LibraryWireframe: LibraryWireframeProtocol {
  func showChapter(from controller: LibraryController) {
    navigateToChapter(from: controller)
  }
}
