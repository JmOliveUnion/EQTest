////
////  PresetTableViewCell.swift
////  EQTest
////
////  Created by 김민종 on 6/28/24.
////
//
//import UIKit
//import SnapKit
//import Then
//
//
//class PresetTableViewCell: UITableViewCell {
//    
//    weak var delegate: NewEQDetailVC?
//
//    let titleLabel = UILabel().then {
//        $0.text = "본인 목소리 울림"
//        $0.font = .systemFont(ofSize: 18)
//    }
//    
//    let underView = UIView().then {
//        $0.backgroundColor = .lightGray
//    }
//    
//    let backgrounView = UIView().then {
//        $0.backgroundColor = .lightGray
//        $0.isHidden = true
//    }
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none
//
//        contentView.addSubview(backgrounView)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(underView)
//
//        titleLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalToSuperview().offset(20)
//        }
//        
//        underView.snp.makeConstraints {
//            $0.height.equalTo(1)
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview()
//        }
//        
//        backgrounView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    func presetButtonPressed() {
//        delegate?.presetTapped()
//    }
//}
