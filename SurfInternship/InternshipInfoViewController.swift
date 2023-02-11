//
//  InternshipInfoViewController.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 10.02.2023.
//

import UIKit

class InternshipInfoViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        configureSubviews()
        layoutSubviews()
    }
    
    private func configureSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(sendApplicationButton)
        view.addSubview(wantLabel)
    }
    
    private func layoutSubviews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sendApplicationButton.translatesAutoresizingMaskIntoConstraints = false
        wantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            sendApplicationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sendApplicationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            sendApplicationButton.widthAnchor.constraint(equalToConstant: 219),
            sendApplicationButton.heightAnchor.constraint(equalToConstant: 60),
            wantLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            wantLabel.centerYAnchor.constraint(equalTo: sendApplicationButton.centerYAnchor)
        ])
    }
}
