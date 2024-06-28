//
//  DottedBoarderView.swift
//  EQTest
//
//  Created by 김민종 on 6/28/24.
//

import UIKit

class DottedBoarderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addDottedBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addDottedBorder()
    }
    
    private func addDottedBorder() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineDashPattern = [9, 7] // 점선 패턴: 5pt 선, 5pt 공백
        shapeLayer.frame = bounds
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        shapeLayer.cornerRadius = 15
        layer.addSublayer(shapeLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 레이아웃이 변경될 때마다 경계 업데이트
        if let shapeLayer = layer.sublayers?.first as? CAShapeLayer {
            shapeLayer.path = UIBezierPath(rect: bounds).cgPath
            shapeLayer.frame = bounds
        }
    }
}
