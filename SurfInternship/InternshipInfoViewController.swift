//
//  InternshipInfoViewController.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 10.02.2023.
//

import UIKit

/// Протокол, через который Presenter общается с ViewController
protocol DisplaysLogic: AnyObject {
    /// Отобразить список направлений
    func displayFetchedDirections(_ viewModel: DataFlow.FetchDirections.ViewModel)
}

public class InternshipInfoViewController: UIViewController {
    
    private let interactor: BusinessLogic
    private var internshipDirections: [DirectionModel]
    
    lazy var contentView: DisplaysView = View(delegate: self, collectionViewDelegate: self, collectionViewDataSource: self)
    
    init(interactor: BusinessLogic) {
        self.interactor = interactor
        self.internshipDirections = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = contentView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        /// Запрос к Interactor на загрузку списка товаров
        interactor.fetchDirections(.init())
    }
}

extension InternshipInfoViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        internshipDirections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell
        if internshipDirections[indexPath.row].pressState == .unchosen {
            cell?.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.00)
            cell?.titleLabel.textColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
        }
        else {
            cell?.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
            cell?.titleLabel.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        }
        cell?.titleLabel.text = internshipDirections[indexPath.row].title
        cell?.layer.cornerRadius = 12
        return cell ?? .init()
    }
}

extension InternshipInfoViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        collectionView.performBatchUpdates {
            UIView.animate(withDuration: 0.2, delay: 0) { [self] in
                if internshipDirections[indexPath.row].pressState == .unchosen {
                    let chosendirection = internshipDirections.remove(at: indexPath.row)
                    internshipDirections.insert(chosendirection, at: 0)
                    internshipDirections[0].pressState = .chosen

                }
                else {
                    internshipDirections[indexPath.row].pressState = .unchosen
                }
            }
            
        }
    }
}

extension InternshipInfoViewController: DisplaysLogic {
    func displayFetchedDirections(_ viewModel: DataFlow.FetchDirections.ViewModel) {
        self.internshipDirections = viewModel.directions
        contentView.configure()
    }
}

extension InternshipInfoViewController: ViewDelegate {
    func presentInfo() {
        let alertController = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .default)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}
