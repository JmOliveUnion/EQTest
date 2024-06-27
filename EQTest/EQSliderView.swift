//
//  EQSliderView.swift
//  EQTest
//
//  Created by 김민종 on 6/27/24.
//

import UIKit
import SnapKit
import Then

class EQSliderView: UIView {
    
    let slider1TopLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    let slider1: VerticalSlider = {
        let slider = VerticalSlider()
        slider.maximumValue = 18
        slider.minimumValue = 0
//        slider.minimumTrackTintColor = .init(light: .l_gray600, dark: .d_gray100)
//        slider.maximumTrackTintColor = .init(light: .l_gray300, dark: .d_gray300)
        slider.minimumTrackTintColor = .gray
        slider.maximumTrackTintColor = .gray
        
        return slider
    }()
    
    let slider1BottomLabel = UILabel().then {
        $0.text = "250"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13)

    }
    
    lazy var sliderStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [slider1TopLabel, slider1, slider1BottomLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()
    
    init(topLabel: String, bottomLabel: String) {
        super.init(frame: .zero)
        setUp(topLabel: topLabel, bottomLabel: bottomLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUp(topLabel: String, bottomLabel: String) {
        
        slider1TopLabel.text = topLabel
        slider1BottomLabel.text = bottomLabel

        self.addSubview(sliderStack)
        sliderStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
    }
    

}
