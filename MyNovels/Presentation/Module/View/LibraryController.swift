//
//  LibraryController.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import UIKit
import SVProgressHUD

class LibraryController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: LibraryPresenter = LibraryPresenter()
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Novels"
        presenter.viewRef = self
        presenter.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    deinit {
        print("deinit \(self)")
    }

}

//MARK: LibraryPresenterProtocol
extension LibraryController: LibraryPresenterProtocol {
  
  func updateBookList(books: [Book]?, error: Error?) {
    guard let fetchedBooks = books else { return }
    self.books = fetchedBooks
    collectionView.reloadData()
  }
  
}

// MARK: - UICollectionViewDelegate & DataSource
extension LibraryController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width - 55) / 3
        return CGSize(width: width, height: 280)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: App.CellIdentifier.bookCellId, for: indexPath) as! BookCell
        let book = books[indexPath.row]
        cell.setCell(item: book)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showChapter()
    }
    
}
