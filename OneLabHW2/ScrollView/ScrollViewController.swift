//
//  ViewController.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 01.04.2023.
//

import UIKit
import SnapKit
class ScrollViewController: UIViewController {
    private let buttonTitles = ["Button One", "Button Two", "Button Three", "Button Four", "Button Five", "Button Six", "Button Seven" , "Button Eight", "Button Nine"]
    private var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Account"
        view.backgroundColor = .systemGray5
        setupButtons()
        setConstraints()
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .equalSpacing
        return stack
    }()
    private func createButton(_ buttonTitle: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 8
        button.isUserInteractionEnabled = false
        return button
    }
    private func setupButtons() {
        for title in buttonTitles {
            let button = createButton(title)
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    private func setButtonConstraints(_ button: UIButton) {
        button.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(70)
        }
    }
    private func contentHeight() -> CGFloat {
        let buttonHeight: CGFloat = 70
        let spacing: CGFloat = 2
        let numberOfButtons = CGFloat(stackView.arrangedSubviews.count)
        let totalHeight = (buttonHeight * numberOfButtons) + (spacing * (numberOfButtons - 1))
        return totalHeight
    }
    
    func setConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.right.equalTo(view.snp.right).offset(-16)
            make.left.equalTo(view.snp.left).offset(16)
            make.height.equalTo(contentHeight())
            make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(-60)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.snp.edges)
            make.width.equalTo(scrollView.snp.width)
        }
        for button in buttons {
            setButtonConstraints(button)
        }
    }
}
