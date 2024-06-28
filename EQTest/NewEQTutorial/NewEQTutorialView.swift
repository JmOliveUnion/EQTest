//
//  NewEQTutorialView.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit

import SnapKit
import Then

class NewEQTutorialView: UIView {
    
    let topRightXbutton = UIButton().then {
        $0.setImage(UIImage(named: "whatButton"), for: .normal)
    }
    
    let selectSoundView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "소리 선택하기"
        label.font = .systemFont(ofSize: 20)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        let arrowView = UIImageView()
        view.addSubview(arrowView)
        arrowView.image = UIImage(named: "whatButton")
        arrowView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }

        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var dotView: DottedBoarderView = {
       let view = DottedBoarderView()
        view.addSubview(selectSoundView)
        selectSoundView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
//            $0.height.equalTo(50)
        }
        view.layer.cornerRadius = 10
        return view
        
    }()
    
    let presetView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "프리셋"
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        let description = UILabel()
        description.text = "여러가지 문제 상황에 맞춰 알맞은 소리를 선택해보세요.직접 저장한 설정도 이곳에 기록됩니다."
        description.textColor = .lightGray
        description.font = .systemFont(ofSize: 16)
        description.numberOfLines = 0
        view.addSubview(description)
        description.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(label.snp.bottom).offset(10)
        }
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Set Up
    
    private func setUp() {
        self.backgroundColor = .black.withAlphaComponent(0.8)
        
        addSubview(topRightXbutton)
        topRightXbutton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        self.addSubview(dotView)
        dotView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(topRightXbutton.snp.bottom).offset(20)
            $0.height.equalTo(73)
        }
        
        addSubview(presetView)
        presetView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(dotView.snp.bottom).offset(10)
            $0.height.equalTo(110)
        }
        
    }
    
    
}
