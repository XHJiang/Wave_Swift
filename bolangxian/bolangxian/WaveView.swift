//
//  WaveView.swift
//  bolangxian
//
//  Created by 蒋潇涵 on 2017/1/4.
//  Copyright © 2017年 蒋潇涵. All rights reserved.
//

import UIKit

class WaveView: UIView {
    
    public var _h: Float = 25
    public var speed: Float = 2
    public var waveHeight: Float = 5
    
    func wave() {
        _link = CADisplayLink.init(target: self, selector: #selector(doAni))
        _link?.add(to: RunLoop.current , forMode: .commonModes)
    }
    
    public func stop() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayerAndProperty()
        wave()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        initLayerAndProperty()
        wave()
    }
    
    
    
    private func initLayerAndProperty() {
        
        _h = Float(bounds.size.height) - waveHeight - 3
        
        _layer = CAShapeLayer()
        _layer?.frame = bounds
        _layer?.opacity = 0.5
        layer.addSublayer(_layer!)
        
        _layer2 = CAShapeLayer()
        _layer2?.frame = bounds
        _layer2?.opacity = 0.5
        layer.addSublayer(_layer2!)
    }
    
    
    
    func doAni() {
        _offset += speed
        
        let pathRef = CGMutablePath()
        let startY = waveHeight * sinf(_offset * Float(M_PI) / _waveWidth)
        pathRef.move(to: CGPoint(x: 0, y: CGFloat(startY)))
        for i in 0..<Int(_waveWidth) {
            let y = 1.1 * waveHeight * sinf(2.5 * Float(M_PI) * Float(i) / _waveWidth + _offset * Float(M_PI) / _waveWidth) + _h
            pathRef.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
            //            print(CGPoint(x: CGFloat(i), y: CGFloat(y)))
        }
        pathRef.addLine(to: CGPoint(x: CGFloat(_waveWidth), y: bounds.size.height))
        //        print(CGPoint(x: CGFloat(_waveWidth), y: 0))
        pathRef.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        pathRef.closeSubpath()
        
        _layer?.path = pathRef
        _layer?.fillColor = UIColor.lightGray.cgColor
        
        let pathRef2 = CGMutablePath()
        let startY2 = waveHeight * sinf(_offset * Float(M_PI) / _waveWidth + Float(M_PI) / 4)
        pathRef2.move(to: CGPoint(x: 0, y: CGFloat(startY2)))
        for i in 0..<Int(_waveWidth) {
            let y = waveHeight * sinf(2.5 * Float(M_PI) * Float(i) / _waveWidth + 3 * _offset * Float(M_PI) / _waveWidth + Float(M_PI) / 4) + _h
            pathRef2.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
        }
        pathRef2.addLine(to: CGPoint(x: CGFloat(_waveWidth), y: bounds.size.height))
        pathRef2.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        pathRef2.closeSubpath()
        
        _layer2?.path = pathRef2
        _layer2?.fillColor = UIColor.lightGray.cgColor
        
    }
    
    
    private var _link: CADisplayLink?
    private var _offset: Float = 0
    private var _waveWidth: Float {
        return Float(bounds.size.width)
    }
    
    private var _layer: CAShapeLayer?
    private var _layer2: CAShapeLayer?
    
    
}

