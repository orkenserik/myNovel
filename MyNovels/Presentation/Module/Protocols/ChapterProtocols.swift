//
//  ChapterProtocols.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import Foundation
import UIKit

protocol ChapterViewProtocols {
  var viewRef: ChapterController? {get set}
  var chapterWireframe: ChapterWireframe? {get set}
  var chapterInteractor: ChapterInteractor? {get set}
  func viewDidLoad()
}

protocol ChapterPresenterProtocol {
  func updateChapter(chapter: Chapter?, error: Error?)
}

protocol ChapterInteractorInputProtocol {
  var presenter: ChapterPresenter? {get set}
  //Presenter -> Interactor
  func getChapter()
}

protocol ChapterInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingChapter(chapter: Chapter?, error: Error?)
  
}

