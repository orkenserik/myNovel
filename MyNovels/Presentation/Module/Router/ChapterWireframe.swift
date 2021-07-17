//
//  ChapterWireframe.swift
//  MyNovels
//
//  Created by Orken Serik on 18.07.2021.
//

import Foundation
import UIKit

class ChapterWireframe {
  
  class func loadChapterPageComponents(withPresenter presenter: ChapterPresenter) {
    presenter.chapterWireframe = ChapterWireframe()
    presenter.chapterInteractor = ChapterInteractor()
    presenter.chapterInteractor?.presenter = presenter
  }
  
}
