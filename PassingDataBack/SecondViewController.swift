//
//  SecondViewController.swift
//  PassingDataBack
//
//  Created by Aleksandr Shchukin on 13/05/25.
//

import UIKit

// MARK: - Protocol

protocol SecondViewControllerDelegate: AnyObject {
    func changeColor(to color: UIColor)
}

// MARK: - View Controller

class SecondViewController: UIViewController {

    // MARK: - Properties

    weak var delegate: SecondViewControllerDelegate?
    var onColorChange: ((UIColor) -> Void)?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupChangeColorButton()
    }

    // MARK: - UI Setup

    private func setupChangeColorButton() {
        let changeColorButton = UIButton(type: .system)
        changeColorButton.setTitle("Change First View Controller Background", for: .normal)
        changeColorButton.addTarget(self, action: #selector(didTapChangeColorButton), for: .touchUpInside)
        changeColorButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(changeColorButton)

        NSLayoutConstraint.activate([
            changeColorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeColorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions

    @objc private func didTapChangeColorButton() {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0.3...1),
            green: CGFloat.random(in: 0.3...1),
            blue: CGFloat.random(in: 0.3...1),
            alpha: 1.0
        )

        if let onColorChange = onColorChange {
            onColorChange(randomColor)
        } else {
            delegate?.changeColor(to: randomColor)
        }

        navigationController?.popViewController(animated: true)
    }
}
