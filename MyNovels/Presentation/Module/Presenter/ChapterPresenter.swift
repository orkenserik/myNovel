//
//  ChapterPresenter.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import UIKit

class ChapterPresenter: ChapterViewProtocols {
  var viewRef: ChapterController?
  var chapterWireframe: ChapterWireframe?
  var chapterInteractor: ChapterInteractor?
  
  func viewDidLoad() {
    ChapterWireframe.loadChapterPageComponents(withPresenter: self)
    chapterInteractor?.getChapter()
  }
}

extension ChapterPresenter: ChapterInteractorOutputProtocol {
  
  func didFinishFetchingChapter(chapter: Chapter?, error: Error?) {
    guard let chapter = chapter else {
      return
    }
    viewRef?.updateChapter(chapter: chapter, error: nil)
  }
  
}


