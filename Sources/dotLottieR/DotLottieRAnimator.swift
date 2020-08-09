//
//  DotLottieRAnimationManager.swift
//  dotLottieLoader-iOS
//
//  Created by Evandro Harrison Hoffmann on 09/08/2020.
//

import Foundation
import SDWebImageLottieCoder

#if os(watchOS)
import WatchKit
#endif

public class DotLottieRAnimator: DotLottieRAnimatable {
    public var animationUrl: URL?
    public var coder: SDImageLottieCoder?
    public var currentFrame: UInt = 0
    public var speed: Double = 1.0
    public var loopMode: DotLottieRLoopMode = .playOnce
    public var isPlaying: Bool = false
    public var imageView: AnyObject?
    
    public init(url: URL, imageView: AnyObject) {
        self.animationUrl = url
        self.imageView = imageView
        load(url: url)
    }
    
    public func imageUpdated(image: UIImage?) {
        #if os(watchOS)
        let imageView = self.imageView as? WKInterfaceImage
        imageView?.setImage(image)
        #endif
    }
}
