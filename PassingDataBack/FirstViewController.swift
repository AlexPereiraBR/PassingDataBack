//
//  FirstViewController.swift
//  PassingDataBack
//
//  Created by Aleksandr Shchukin on 13/05/25.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureInterface()
    }

    // MARK: - UI Setup

    private func configureInterface() {
        let openWithClosureButton = UIButton(type: .system)
        openWithClosureButton.setTitle("Open with Closure", for: .normal)
        openWithClosureButton.addTarget(self, action: #selector(openSecondViewControllerUsingClosure), for: .touchUpInside)
        openWithClosureButton.translatesAutoresizingMaskIntoConstraints = false

        let openWithDelegateButton = UIButton(type: .system)
        openWithDelegateButton.setTitle("Open with Delegate", for: .normal)
        openWithDelegateButton.addTarget(self, action: #selector(openSecondViewControllerUsingDelegate), for: .touchUpInside)
        openWithDelegateButton.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [openWithClosureButton, openWithDelegateButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Navigation

    @objc private func openSecondViewControllerUsingClosure() {
        let secondViewController = SecondViewController()
        secondViewController.onColorChange = { [weak self] newColor in
            self?.updateBackgroundColor(with: newColor)
        }
        navigationController?.pushViewController(secondViewController, animated: true)
    }

    @objc private func openSecondViewControllerUsingDelegate() {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }

    // MARK: - Helpers

    private func updateBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}

// MARK: - SecondViewControllerDelegate

extension FirstViewController: SecondViewControllerDelegate {
    func changeColor(to color: UIColor) {
        updateBackgroundColor(with: color)
    }
}
