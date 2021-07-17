//
//  ChapterInteractor.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import UIKit

class ChapterInteractor: ChapterInteractorInputProtocol {

  var presenter: ChapterPresenter?
    
  func getChapter() {
    ApiClient.shared.makeRequest(NovelApi.chapter, objectModel: Chapter.self, path: "data", showLoad: true) { [weak self] (model) in
        guard let `self` = self else {return}
        DispatchQueue.main.async {
            self.presenter?.didFinishFetchingChapter(chapter: model, error: nil)
        }
    } failure: { (errorMessage) -> Void? in
        print(errorMessage)
    }


  }
    
}
