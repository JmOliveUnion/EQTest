//
//  CustomTableViewCell.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

//
//  PresetTableViewCell.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit
import Combine
import SnapKit
import Then

class CustomTableViewCell: UITableViewCell {
    var cancellableBag = Set<AnyCancellable>()


    let titleLabel = UILabel().then {
        $0.text = "My Custom EQ 1"
        $0.font = .systemFont(ofSize: 18)
    }
    
    let underView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    let cellButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    lazy var backgrounView = UIView().then {
       
        $0.backgroundColor = .lightGray
        $0.isHidden = true
    }
    let xbutton = UIButton().then {
        
        $0.setImage(UIImage(named: "whatButton"), for: .normal)
        $0.setImage(UIImage(named: "eqKnob"), for: .selected)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        contentView.addSubview(backgrounView)

        contentView.addSubview(titleLabel)
        contentView.addSubview(underView)
        contentView.addSubview(xbutton)

        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        xbutton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.width.equalTo(20)
        }
        
        underView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        backgrounView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bind()
    }
    
    
    func bind() {
        
        xbutton.tapPublisher
            .sink { _ in
                print("xbutton")
            }
            .store(in: &cancellableBag)
    }
    
    func presetButtonPressed(index: Int) {
            print("여기를 타?\(index)")
        backgrounView.isHidden = false
        titleLabel.textColor = .blue
        xbutton.isSelected = true
        }
    
    func resetButton() {
        backgrounView.isHidden = true
        titleLabel.textColor = .black
        xbutton.isSelected = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
