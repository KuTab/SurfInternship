//
//  View.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation
import UIKit

/// Используется для передачи данных из ViewController для отображения
protocol DisplaysView: UIView {
    func configure()
}

/// Используется для передачи события из View во ViewController
protocol ViewDelegate: AnyObject {
    func presentInfo()
}

final class View: UIView {
    weak var delegate: ViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)//UIFont.systemFont(ofSize: 24, weight: UIFont.Weight(700))
        label.textColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.59, green: 0.58, blue: 0.61, alpha: 1.00)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var sendApplicationButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Отправить заявку", for: .normal)
        button.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(sendApplication), for: .touchUpInside)
        return button
    }()
    
    lazy var wantLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.59, green: 0.58, blue: 0.61, alpha: 1.00)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.59, green: 0.58, blue: 0.61, alpha: 1.00)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    required init(delegate: ViewDelegate, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource) {
        self.delegate = delegate
        super.init(frame: .zero)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        secondCollectionView.dataSource = collectionViewDataSource
        secondCollectionView.delegate = collectionViewDelegate
        addSubviews()
        makeConstraints()
        backgroundColor = UIColor.white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(collectionView)
        addSubview(infoLabel)
        addSubview(secondCollectionView)
        addSubview(sendApplicationButton)
        addSubview(wantLabel)
    }
    
    func makeConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sendApplicationButton.translatesAutoresizingMaskIntoConstraints = false
        wantLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        secondCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sendApplicationButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            sendApplicationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sendApplicationButton.widthAnchor.constraint(equalToConstant: 219),
            sendApplicationButton.heightAnchor.constraint(equalToConstant: 60),
            wantLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            wantLabel.centerYAnchor.constraint(equalTo: sendApplicationButton.centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60),
            infoLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            secondCollectionView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            secondCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            secondCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    
    private struct Constants {
        static let minimumLineSpacing: CGFloat = 16.0
        static let sectionInset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 40)
    }
    
    @objc private func sendApplication() {
        let alertController = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .default)
        alertController.addAction(cancelAction)
        delegate?.presentInfo()
    }
}

extension View: DisplaysView {
    func configure() {
        collectionView.reloadData()
        secondCollectionView.reloadData()
    }
}

extension View {
    func createLayout() -> UICollectionViewLayout {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = Constants.minimumLineSpacing
        collectionViewLayout.sectionInset = Constants.sectionInset
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return collectionViewLayout
    }
}
