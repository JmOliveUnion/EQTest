//
//  NewEQTutorialView.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit
import Combine

import SnapKit
import Then

enum EQTutotroialPage: Int {
    case pageOne = 1
    case pageTwo = 2
    case pageThree = 3
    case pageFour = 4

}

final class NewEQTutorialView: UIView {
    
    let screenSize: CGRect = UIScreen.main.bounds

    
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
    
    // MARK: - Second Tutorial

    
    let slidertutorial1 = EQSliderView(topLabel: "0", bottomLabel: "250").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial2 = EQSliderView(topLabel: "0", bottomLabel: "500").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial3 = EQSliderView(topLabel: "0", bottomLabel: "1k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial4 = EQSliderView(topLabel: "0", bottomLabel: "1.5k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial5 = EQSliderView(topLabel: "0", bottomLabel: "2k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial6 = EQSliderView(topLabel: "0", bottomLabel: "3k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial7 = EQSliderView(topLabel: "0", bottomLabel: "4k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial8 = EQSliderView(topLabel: "0", bottomLabel: "6k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    let slidertutorial9 = EQSliderView(topLabel: "+3", bottomLabel: "8k").then {
        $0.slider1TopLabel.textColor = .systemBackground
        $0.slider1BottomLabel.textColor = .systemBackground
    }
    
    // Low sound view
    
    lazy var lowSoundStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [slidertutorial1, slidertutorial2])
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var lowDotView: DottedBoarderView = {
       let view = DottedBoarderView()
    
        view.addSubview(lowSoundStack)
        lowSoundStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
//            $0.height.equalTo(50)
        }
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let lowSoundLabel = UILabel().then {
        $0.text = "저음"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .systemBackground
    }
    
    lazy var lowEQStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [lowSoundLabel, lowDotView])
        stack.axis = .vertical
        stack.spacing = 5

        return stack
    }()
    
    //middle View
    
    lazy var middleSoundStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [slidertutorial3, slidertutorial4, slidertutorial5, slidertutorial6, slidertutorial7])
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var middleDotView: DottedBoarderView = {
       let view = DottedBoarderView()
    
        view.addSubview(middleSoundStack)
        middleSoundStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
//            $0.height.equalTo(50)
        }
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let middleSoundLabel = UILabel().then {
        $0.text = "중음"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .systemBackground
    }
    
    lazy var middleEQStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [middleSoundLabel, middleDotView])
        stack.axis = .vertical
        stack.spacing = 5

        return stack
    }()
    
    // High View
    
    lazy var highSoundStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [slidertutorial8, slidertutorial9])
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var highDotView: DottedBoarderView = {
       let view = DottedBoarderView()
    
        view.addSubview(highSoundStack)
        highSoundStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
//            $0.height.equalTo(50)
        }
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let highSoundLabel = UILabel().then {
        $0.text = "고음"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .systemBackground
    }
    
    lazy var highEQStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [highSoundLabel, highDotView])
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    lazy var tutorialEQStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [lowEQStack, middleEQStack, highEQStack])
        stack.isHidden = true
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let soundRangeView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "저음범위 (250 ~ 500Hz)"
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        let description = UILabel()
        description.text = "소음이 많이 들릴 경우 조절해보세요."
        description.textColor = .lightGray
        description.font = .systemFont(ofSize: 16)
        description.numberOfLines = 1
        view.addSubview(description)
        description.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(label.snp.bottom).offset(10)
        }
        
        let label2 = UILabel()
        label2.text = "중음범위 (1K ~ 4KHz)"
        label2.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label2)
        label2.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(description.snp.bottom).offset(20)
        }
        
        let description2 = UILabel()
        description2.text = "소음이 많이 들릴 경우 조절해보세요."
        description2.textColor = .lightGray
        description2.font = .systemFont(ofSize: 16)
        description2.numberOfLines = 1
        view.addSubview(description2)
        description2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(label2.snp.bottom).offset(10)
        }
        
        let label3 = UILabel()
        label3.text = "고음범위 (6K ~ 8KHz)"
        label3.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label3)
        label3.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(description2.snp.bottom).offset(20)
        }
        
        let description3 = UILabel()
        description3.text = "높고 깨지는 듯한 소리가 들릴 경우 조절해보세요."
        description3.textColor = .lightGray
        description3.font = .systemFont(ofSize: 16)
        description3.numberOfLines = 1
        view.addSubview(description3)
        description3.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(label3.snp.bottom).offset(10)
        }
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.isHidden = true
        return view
    }()
    
    
    // MARK: - Third Tutorial
    
    let soundControlView: UIView = {
       let view = UIView()
        let label = UILabel()
        label.text = "소리 조절하기"
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        let description = UILabel()
        description.text = "내 목소리, 다른사람 목소리와 같이 원하는 소리를 키우고 줄일 수 있습니다. 자유롭게 조절해보세요."
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
        view.isHidden = true
        
        return view
    }()
    
    lazy var presetFirstTutorial = EQPresetView(imageLabel: "whatButton", titleLabel: "내 목소리 울림").then {
        $0.backgroundColor = .white
        $0.snp.makeConstraints {
            $0.height.equalTo(screenSize.height * 0.18)
            
        }
    }
    
    lazy var presetSecondTutorial = EQPresetView(imageLabel: "whatButton", titleLabel: "다른 사람 목소리 크기").then {
        $0.backgroundColor = .white

        $0.snp.makeConstraints {
            $0.height.equalTo(screenSize.height * 0.18)
        }
    }
    

    
    lazy var tutorialThirdBottomView = UIView().then {
        $0.addSubview(presetStackTutorial)
        $0.backgroundColor = .systemBackground
    }
    
    let backButtonSecond: UIButton = {
       let button = UIButton()
        button.setTitle("이전", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.systemBackground, for: .normal)
//        button.setBackgroundColor(.white, for: .normal)
        button.backgroundColor = .black
        button.snp.makeConstraints {
            $0.height.equalTo(60)
        }
//        button.layer.borderColor = UIColor.l_keyBlue600.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButtonSecond: UIButton = {
       let button = UIButton()
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.label, for: .normal)
//        button.setBackgroundColor(.l_keyBlue600, for: .normal)
        button.backgroundColor = .white

        button.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStackSecond: UIStackView = {
     let stack = UIStackView(arrangedSubviews: [backButtonSecond, nextButtonSecond])
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    

    
    lazy var presetStackTutorial: UIView = {
        let view = UIView()
        
        view.addSubview(presetFirstTutorial)
        view.addSubview(presetSecondTutorial)
        
        presetFirstTutorial.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)

        }
        
        presetSecondTutorial.snp.makeConstraints {
            $0.top.equalTo(presetFirstTutorial.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)

        }
        
        view.addSubview(buttonStackSecond)
        buttonStackSecond.snp.makeConstraints {
//            $0.top.equalTo(presetSecondTutorial.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-36)
        }
        
        view.isHidden = true
        view.backgroundColor = .systemBackground
        
        return view
        
        
    }()
    
    
    // MARK: - Bottom Button
    let firstNextButton: UIButton = {
       let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.label, for: .normal)
//        button.setBackgroundColor(.l_keyBlue600, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        return button
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("이전", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.systemBackground, for: .normal)
//        button.setBackgroundColor(.white, for: .normal)
        button.backgroundColor = .black
        button.snp.makeConstraints {
            $0.height.equalTo(60)
        }
//        button.layer.borderColor = UIColor.l_keyBlue600.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
       let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.label, for: .normal)
//        button.setBackgroundColor(.l_keyBlue600, for: .normal)
        button.backgroundColor = .white

        button.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
     let stack = UIStackView(arrangedSubviews: [backButton, nextButton])
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.isHidden = true
        return stack
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
        
        addSubview(tutorialEQStack)
        tutorialEQStack.snp.makeConstraints {
            $0.top.equalTo(screenSize.height * 0.3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(screenSize.height * 0.25)
        }
        
        addSubview(soundRangeView)
        soundRangeView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(tutorialEQStack.snp.bottom).offset(20)
            $0.height.equalTo(screenSize.height * 0.25)
        }
        
 
        
        addSubview(presetStackTutorial)
        presetStackTutorial.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.5)
//            $0.top.greaterThanOrEqualTo(soundControlView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
        
        addSubview(soundControlView)
        soundControlView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(110)
            $0.bottom.equalTo(presetStackTutorial.snp.top).offset(-20)

        }
        
        addSubview(firstNextButton)
        firstNextButton.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-36)
        }
        
        addSubview(buttonStack)
        buttonStack.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-36)
        }
        
    }
    
    
}
