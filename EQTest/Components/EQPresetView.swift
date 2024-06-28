//
//  EQPresetView.swift
//  EQTest
//
//  Created by 김민종 on 6/27/24.
//

import UIKit
import SnapKit
import Then

class EQPresetView: UIView {
    
    let customImage = UIImageView().then {
        $0.image = UIImage(named: "whatButton")
        $0.sizeToFit()
    }
    
    let customTitleLabel = UILabel().then {
        $0.text = "내 목소리 울림"
        $0.font = .systemFont(ofSize: 18)
        $0.sizeToFit()
    }
    
    lazy var titleStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [customImage, customTitleLabel])
        stack.spacing = 5
        stack.sizeToFit()
        
        return stack
    }()
    
    let smallButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var smallView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "작게"
        label.font = .systemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        view.addSubview(smallButton)
        smallButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 4

        return view
    }()
    
    let largeButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var largeView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "크게"
        label.font = .systemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        view.addSubview(largeButton)
        largeButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var buttonStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [smallView, largeView])
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }()
    
    let underLineView = UIView().then {
        
        $0.backgroundColor = .gray
    }
    

    init(imageLabel: String, titleLabel: String) {
        super.init(frame: .zero)
        setUp(imageLabel: imageLabel, titleLabel: titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(imageLabel: String, titleLabel: String) {
        
        customImage.image = UIImage(named: imageLabel)
        customTitleLabel.text = titleLabel
        
        addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        addSubview(buttonStack)
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(titleStack.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        addSubview(underLineView)
        underLineView.snp.makeConstraints {
//            $0.top.equalTo(buttonStack.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }

}
