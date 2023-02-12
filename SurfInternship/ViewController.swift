//
//  ViewController.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()
        layoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        presentModal()
    }

    private func configureSubviews() {
        imageView.image = UIImage(named: "3 6.png")
        view.addSubview(imageView)
    }
    
    private func layoutSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func presentModal() {
        let vc = Factory().build()
        vc.modalPresentationStyle = .formSheet
        vc.sheetPresentationController?.preferredCornerRadius = 36
        vc.isModalInPresentation = true
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .custom { _ in
                    return 276
                },
                .custom { context in
                    return context.maximumDetentValue * 0.6
                },
                .large()
            ]
        }
        
        self.present(vc, animated: true)
    }
}

