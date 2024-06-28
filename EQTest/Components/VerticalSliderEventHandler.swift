//
//  VerticalSliderEventHandler.swift
//  EQTest
//
//  Created by 김민종 on 6/26/24.
//


import UIKit

protocol VerticalSliderEventHandlerDelegate: AnyObject {
    func trackingEvent(event : trackingEvent)
}

class VerticalSliderEventHandler: UISlider {

    var delegate : VerticalSliderEventHandlerDelegate? = nil
    
    func setDelegate(_ delegate: VerticalSliderEventHandlerDelegate) {
        self.delegate = delegate
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
    
    override open func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let result = super.continueTracking(touch, with: event)
        delegate?.trackingEvent(event: .onMoving)
        return result
    }
    
    override open func cancelTracking(with event: UIEvent?) {
        delegate?.trackingEvent(event: .cancelMoving)
        super.cancelTracking(with: event)
    }
    
    override open func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        delegate?.trackingEvent(event: .endMoving)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.trackRect(forBounds: bounds)
        result.origin.x = 0
//        print("result.origin = \(result.origin.y)")
//        print("result.size.width= \(result.size.width)")

        result.origin.y = (self.bounds.height / 2)
        

        result.size.width = bounds.size.width
        result.size.height = 2
        return result
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
           var thumbRect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
           
           // Adjust the thumbRect to center the thumb image
//        print(bounds.origin.y)

//        thumbRect.origin.x = bounds.size.height
        thumbRect.origin.y = 1.5
           
           return thumbRect
       }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
