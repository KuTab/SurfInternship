//
//  CollectionCell.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -24),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -12),
            self.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
