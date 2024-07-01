//
//  NewEQView.swift
//  EQTest
//
//  Created by 김민종 on 6/26/24.
//

import UIKit

import SnapKit
import Then

class NewEQView: UIView, UIScrollViewDelegate {
    let screenSize: CGRect = UIScreen.main.bounds
    
    let eqScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let eqContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //Navigation View
    let topTitle = UILabel().then {
        $0.text = "Hearing EQ"
        $0.font = .systemFont(ofSize: 30)
    }
    
    let topLeftButton = UIButton().then {
        $0.setImage(UIImage(named: "whatButton"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    let topRightXbutton = UIButton().then {
        $0.setImage(UIImage(named: "whatButton"), for: .normal)
    }
    
    lazy var topNaviBarView: UIView = {
        let view = UIView()
        view.addSubview(topTitle)
        view.addSubview(topRightXbutton)
        view.addSubview(topLeftButton)

        topLeftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        
        topTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        topRightXbutton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        return view
        
    }()
    
    let choiceLabel = UILabel().then() {
        $0.text = "소리 선택:"
        $0.font = .systemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var customSoundLabel = UILabel().then {
        $0.text = "My Custom ..."
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.sizeToFit()
        
        
    }
    
    let choiceImage = UIImageView().then {
        $0.image = UIImage(named: "whatButton")
        
        $0.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
    }
    
    lazy var choiceStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [choiceLabel, customSoundLabel, choiceImage])
        stack.spacing = 5
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    let selectButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    
    
    lazy var selectSoundView: UIView = {
        let view = UIView()
        
        view.addSubview(choiceStack)
        view.addSubview(selectButton)
        
        choiceStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        selectButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.layer.cornerRadius = 4
        view.backgroundColor = .lightGray
        return view
    }()
    
    let topView = UIView().then{
        let view = UIView()
        view.backgroundColor = .black
        
        $0.addSubview(view)
        view.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        $0.backgroundColor = .lightGray
    }
    
    let leftEarButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let leftEarLabel = UILabel().then {
        $0.text = "왼쪽"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    lazy var leftEarView: UIView = {
        let view = UIView()
        
        view.addSubview(leftEarLabel)
        view.addSubview(leftEarButton)
        
        leftEarLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        leftEarButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(screenSize.width * 0.33)
        }
        
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    let rightEarButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let rightEarLabel = UILabel().then {
        $0.text = "오른쪽"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    lazy var rightEarView: UIView = {
        let view = UIView()
       
        view.addSubview(rightEarLabel)
        view.addSubview(rightEarButton)
        
        rightEarLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        rightEarButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(screenSize.width * 0.33)
        }
        
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    let chainEarButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let chainButtonImage = UIImageView().then {
        $0.image = UIImage(named: "chain_active")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var chaingView: UIView = {
        let view = UIView()
        
        view.addSubview(chainButtonImage)
        chainButtonImage.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        view.addSubview(chainEarButton)
        chainEarButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.backgroundColor = .gray
        view.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(screenSize.width * 0.1)
        }
        
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var topLeftRightButtons: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftEarView, chaingView, rightEarView])
        stack.distribution = .fillProportionally
        stack.spacing = 20
        return stack
    }()
    
    let totalSliderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let slider1 = EQSliderView(topLabel: "0", bottomLabel: "250")
    let slider2 = EQSliderView(topLabel: "0", bottomLabel: "500")
    let slider3 = EQSliderView(topLabel: "0", bottomLabel: "1k")
    let slider4 = EQSliderView(topLabel: "0", bottomLabel: "1.5k")
    let slider5 = EQSliderView(topLabel: "0", bottomLabel: "2k")
    let slider6 = EQSliderView(topLabel: "0", bottomLabel: "3k")
    let slider7 = EQSliderView(topLabel: "0", bottomLabel: "4k")
    let slider8 = EQSliderView(topLabel: "0", bottomLabel: "6k")
    let slider9 = EQSliderView(topLabel: "0", bottomLabel: "8k")
    
    lazy var eqSliderStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [slider1, slider2, slider3, slider4, slider5, slider6, slider7, slider8, slider9])
        //stack.spacing = 7
        stack.distribution = .fillEqually
        return stack
    }()
    
    let leftEQBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    let middleEQBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    let rightEQBackGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    // MARK: - Bottom View
    
    let presetFirst = EQPresetView(imageLabel: "whatButton", titleLabel: "내 목소리 울림")
    
    let presetSecond = EQPresetView(imageLabel: "whatButton", titleLabel: "다른 사람 목소리 크기")
    
    let presetThird = EQPresetView(imageLabel: "whatButton", titleLabel: "다른 사람 목소리 울림")
    
    let presetFourth = EQPresetView(imageLabel: "whatButton", titleLabel: "날카로운 소리")
    
    lazy var presetStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [presetFirst, presetSecond, presetThird, presetFourth])
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - Set Button
    
    let defaultButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var defaultButtonView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.text = "기본설정으로"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .label
        view.addSubview(defaultButton)
        
        view.addSubview(label)
        
        
        
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        defaultButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 6
        view.layer.cornerRadius = 34
        return view
    }()
    
    let saveButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var saveButtonView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.text = "저장하기"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        view.addSubview(saveButton)
        
        view.addSubview(label)
        view.layer.cornerRadius = 28
        
        view.backgroundColor = .label
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    
    lazy var bottomButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [defaultButtonView, saveButtonView])
        
        stack.spacing = 5
        stack.distribution = .fillEqually
        return stack
    }()
    
    let retryShadowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "recordShadowImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Tutorial View
    
    let eqTutorial = NewEQTutorialView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        eqScrollView.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Set Up
    
    private func setUp() {
        self.backgroundColor = .label
        
        addSubview(eqScrollView)
        eqScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        eqScrollView.addSubview(eqContentView)
        eqContentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
            $0.centerX.bottom.equalToSuperview()
        }
        
        eqContentView.addSubview(topNaviBarView)
        topNaviBarView.snp.makeConstraints {
            $0.height.equalTo(50)

            $0.top.equalToSuperview().offset(screenSize.height * 0.05)
            $0.leading.trailing.equalToSuperview()
        }
        
        eqContentView.addSubview(selectSoundView)
        selectSoundView.snp.makeConstraints {
            $0.top.equalTo(topNaviBarView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        eqContentView.addSubview(topView)
        topView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
            $0.top.equalTo(selectSoundView.snp.bottom).offset(20)
        }
        
        topView.addSubview(topLeftRightButtons)
        
        topLeftRightButtons.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
            
        }
        
        
        topView.addSubview(totalSliderView)
        totalSliderView.snp.makeConstraints {
            $0.height.equalTo(180)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(topLeftRightButtons.snp.bottom).offset(20)
        }
        
        totalSliderView.addSubview(eqSliderStackView)
        eqSliderStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        eqContentView.addSubview(presetFirst)
        presetFirst.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)
        }
        
        eqContentView.addSubview(presetSecond)
        presetSecond.snp.makeConstraints {
            $0.top.equalTo(presetFirst.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)
        }
        
        eqContentView.addSubview(presetThird)
        presetThird.snp.makeConstraints {
            $0.top.equalTo(presetSecond.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)
        }
        
        eqContentView.addSubview(presetFourth)
        presetFourth.snp.makeConstraints {
            $0.top.equalTo(presetThird.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.18)
            $0.bottom.equalToSuperview().offset(-screenSize.height * 0.16)
        }
        
        //        eqContentView.addSubview(bottomButtonStack)
        //        bottomButtonStack.snp.makeConstraints {
        //            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
        //            $0.leading.trailing.equalToSuperview().inset(20)
        //            $0.height.equalTo(56)
        //        }
        eqContentView.addSubview(retryShadowImage)
        eqContentView.addSubview(bottomButtonStack)
        bottomButtonStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-15)
            //            if UIDevice.iPhoneSE_7_8_Series {
            //                $0.height.equalTo(90)
            //            } else {
            //                $0.height.equalTo(120)
            //            }
            $0.height.equalTo(56)
            
        }
        
        retryShadowImage.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(0)
            $0.leading.equalTo(self.snp.leading).offset(0)
            $0.trailing.equalTo(self.snp.trailing).offset(0)
        }
        
        eqContentView.addSubview(eqTutorial)
        eqTutorial.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.bottom.equalTo(self.snp.bottom)

            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        
        // Check if the scroll view is at the bottom
        if contentOffsetY >= (contentHeight - scrollViewHeight) {
            
            retryShadowImage.isHidden = true
        } else {
            retryShadowImage.isHidden = false
            
        }
    }
}

