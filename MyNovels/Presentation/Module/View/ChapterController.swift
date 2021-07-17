//
//  ChapterController.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import UIKit

class ChapterController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    var presenter: ChapterPresenter = ChapterPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.backgroundColor = .clear
        presenter.viewRef = self
        presenter.viewDidLoad()
    }

    deinit {
        print("deinit \(self)")
    }
    
}

//MARK: ChapterPresenterProtocol
extension ChapterController: ChapterPresenterProtocol {
    
  
  func updateChapter(chapter: Chapter?, error: Error?) {
    guard let fetchedChapter = chapter else { return }
    self.setData(fetchedChapter)
  }
  
}

//MARK: - Actions
extension ChapterController {
    private func setData(_ chapter: Chapter) {
        titleLabel.text = chapter.title
        textView.text = chapter.dataDescription
    }
}
