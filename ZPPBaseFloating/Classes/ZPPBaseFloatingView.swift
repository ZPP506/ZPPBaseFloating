//
//  ZPPFloatingView.swift
//  ZPPProduct
//
//  Created by admin on 2020/10/12.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public struct ZPPFloatingConfig {
    public static var defulter: ZPPFloatingConfig {
        var m =  ZPPFloatingConfig()
        m.maginAll = 15
        return m
    }
    public var maginAll = 0.0
    public var maginTop = 0.0
    public var maginBottom = 0.0
    public var maginLeft = 0.0
    public var maginRight = 0.0
}
open class ZPPBaseFloatingView: UIView {
    var config: ZPPFloatingConfig = .defulter
    private(set) var reSize: CGSize = .zero
    private(set) var rePoint: CGPoint = .zero
    private(set) lazy var superViewSize: CGSize = {
        var size = self.superview?.frame.size ?? .zero
        if size == .zero {
            self.superview?.layoutIfNeeded()
            size = self.superview?.frame.size ?? .zero
        }
        return size
    }()
    required public init(frame: CGRect, config: ZPPFloatingConfig = .defulter) {
        super.init(frame: frame)
        self.config = config
        self.reSize = frame.size
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panStart(pan:)))
        self.addGestureRecognizer(pan)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func panStart(pan: UIPanGestureRecognizer) {
        
        if pan.state == .changed {
            let point = pan.location(in: self.superview)
            let offsetX = point.x - rePoint.x
            let offsetY = point.y - rePoint.y
            self.frame = CGRect(x: offsetX ,y: offsetY, width: reSize.width, height: reSize.height)
            return
        }
        
        let point = pan.location(in: self)
        if rePoint != .zero {
            let (offsetX, offsetY) = configOffsetXY()
            UIView.animate(withDuration: 0.25) {
                self.frame = CGRect(x: offsetX ,y: offsetY, width: self.reSize.width, height: self.reSize.height)
            }
        }
        rePoint = point
    }
    
    /// 获取视图偏移量
    /// - Returns: (offsetX, offsetY)
     func configOffsetXY() -> (CGFloat, CGFloat) {
        
        var offsetX = self.frame.origin.x
        var offsetY = self.frame.origin.y
        
        let centerx = self.frame.origin.x + reSize.width * 0.5
        if centerx < superViewSize.width * 0.5 {
            offsetX = CGFloat(config.maginLeft == 0 ? config.maginAll : config.maginLeft)
        }else{
            let rightMagin = CGFloat(config.maginRight == 0 ? config.maginAll : config.maginRight)
            offsetX = superViewSize.width -  reSize.width - rightMagin
        }
        let topMagin = CGFloat(config.maginTop == 0 ? config.maginAll : config.maginTop)
        if offsetY < topMagin {
            offsetY = topMagin
        }
        let bottomMagin = CGFloat(config.maginBottom == 0 ? config.maginAll : config.maginBottom)
        if offsetY > superViewSize.height - reSize.height - bottomMagin {
            offsetY = superViewSize.height - reSize.height - bottomMagin
        }
        return (offsetX, offsetY)
    }
}
