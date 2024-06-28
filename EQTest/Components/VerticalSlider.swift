//
//  VerticalSlider.swift
//  EQTest
//
//  Created by 김민종 on 6/26/24.
//

import UIKit
import SnapKit

enum trackingEvent {
  case onMoving, endMoving, cancelMoving
}

protocol VerticalSliderDelegate: AnyObject {
    func trackingContinue(channel: Int)
    func trackingEnd()
}

class VerticalSlider: UIView, VerticalSliderEventHandlerDelegate {
    
    let eventHandler = VerticalSliderEventHandler()
    var delegate : VerticalSliderDelegate? = nil
    var channel = 0

    // required for IBDesignable class to properly render
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
////        let imageThumb = UIImage(named: "eqKnob")
////        let size = CGSize(width: imageThumb!.size.width * 0.7, height: imageThumb!.size.height * 0.7)
////        print(size)
////        eventHandler.setThumbImage(imageThumb!.scaleToSize(newSize: size), for: .normal)
////        //slider.setThumbImage(imageThumb, for: .normal)
////        initialize()
//    }
    
    // required for IBDesignable class to properly render
//    required override public init(frame: CGRect) {
//        super.init(frame: frame)
//        let imageThumb = UIImage(named: "eqKnob")
//        let size = CGSize(width: imageThumb!.size.width * 0.7, height: imageThumb!.size.height * 0.7)
//        print(size)
//        eventHandler.setThumbImage(imageThumb!.scaleToSize(newSize: size), for: .normal)
//        initialize()
//    }
    
    init() {
//        let imageThumb = UIImage(named: "eqKnob")
//        let size = CGSize(width: imageThumb?.size.width ?? 1, height: imageThumb?.size.height ?? 1)
//        eventHandler.setThumbImage(imageThumb, for: .normal)
        super.init(frame: .zero)

        
        setupImageView()

        initialize()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let imageView: UIImageView? = UIImageView()

    private func setupImageView() {
        if let imageThumb = UIImage(named: "eqKnob") {
            
            let size = CGSize(width: imageThumb.size.width * 1.2, height: imageThumb.size.height * 1.2)

            eventHandler.setThumbImage(imageThumb.scaleToSize(newSize: size), for: .normal)
           
        } else {
            // Handle the case where the image is not found
            print("Image 'eqKnob' not found")
        }
    }
    
    
    
    
    fileprivate func initialize() {
        updateSlider()
        addSubview(eventHandler)
        eventHandler.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            
        }
        eventHandler.setDelegate(self)
    }
        
    func trackingEvent(event : trackingEvent) {
        switch event {
        case .onMoving:
            delegate?.trackingContinue(channel: channel)
        case .endMoving, .cancelMoving:
            delegate?.trackingEnd()
        }
    }
        
    func setDelegate(delegate: VerticalSliderDelegate, channel : Int) {
        self.delegate =  delegate
        self.channel = channel
    }
    
    fileprivate func updateSlider() {
                
        if !ascending {
            eventHandler.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) * -0.5)
        } else {
            eventHandler.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) * 0.5).scaledBy(x: 1, y: -1)
        }
        
        eventHandler.minimumValue = minimumValue
        eventHandler.maximumValue = maximumValue
        eventHandler.value = value
        eventHandler.thumbTintColor = thumbTintColor
        eventHandler.minimumTrackTintColor = minimumTrackTintColor
        eventHandler.maximumTrackTintColor = maximumTrackTintColor
        eventHandler.isContinuous = isContinuous
    }
    
    @IBInspectable open var ascending: Bool = false {
        didSet {
            updateSlider()
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        eventHandler.bounds.size.width = bounds.height
        eventHandler.center.x = bounds.midX
        eventHandler.center.y = bounds.midY
    }
    
    override open var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: eventHandler.intrinsicContentSize.height, height: eventHandler.intrinsicContentSize.width)
        }
    }
    
    @IBInspectable open var minimumValue: Float = -1 {
        didSet {
            updateSlider()
        }
    }
    
    @IBInspectable open var maximumValue: Float = 1 {
        didSet {
            updateSlider()
        }
    }
    
    @IBInspectable open var value: Float {
        get {
            return eventHandler.value
        }
        set {
            eventHandler.setValue(newValue, animated: true)
        }
    }
    
    @IBInspectable open var thumbTintColor: UIColor? {
        didSet {
            updateSlider()
        }
    }
    
    @IBInspectable open var minimumTrackTintColor: UIColor? {
        didSet {
            updateSlider()
        }
    }
    
    @IBInspectable open var maximumTrackTintColor: UIColor? {
        didSet {
            updateSlider()
        }
    }
    
    @IBInspectable open var isContinuous: Bool = true {
        didSet {
            updateSlider()
        }
    }

}

extension UIImage {
    func scaleToSize(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return newImage
    }
}

extension UIImage{
    //creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
