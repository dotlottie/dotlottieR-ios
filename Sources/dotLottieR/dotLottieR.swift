//
//  DotLottieAnimation.swift
//  dotLottie-ios
//
//  Created by Evandro Hoffmann on 05/08/2020.
//  Copyright (c) 2020 dotLottie. All rights reserved.
//
import Foundation
import dotLottieLoader
import SDWebImageLottieCoder
import SDWebImage

public class dotLottieR {
    
    /// Enables log printing
    public static var isLogEnabled: Bool {
        get {
            dotLottieUtils.isLogEnabled
        }
        set {
            dotLottieUtils.isLogEnabled = newValue
        }
    }
    
    /// Loads animation in bundle with given name
    /// - Parameters:
    ///   - name: name of animation in bundle
    ///   - cache: Cache type
    ///   - completion: Lottie Animation
    public static func load(name: String, cache: dotLottieCache = .cache, completion: @escaping (Animation?) -> Void) {
        dotLottieLoader.load(name: name, cache: cache) { (dotLottieFile) in
            guard let url = dotLottieFile?.animationUrl ?? dotLottieUtils.bundleURL(for: name) else {
                completion(nil)
                return
            }
            animation(for: url, completion: completion)
        }
    }
    
    /// Loads an animation from a URL
    /// If it's a remote .lottie file, we download, unzip and extract the animation
    /// For .json files, we simply show the animation
    /// - Parameters:
    ///   - url: url to load animation from
    ///   - cache: Cache type
    ///   - completion: Lottie Animation
    public static func load(from url: URL, cache: dotLottieCache = .cache, completion: @escaping (Animation?) -> Void) {
        dotLottieLoader.load(from: url, cache: cache) { (dotLottieFile) in
            animation(for: dotLottieFile?.animationUrl ?? url, completion: completion)
        }
    }
    
    /// Loads Lottie animation with url to JSON file
    /// - Parameters:
    ///   - url: url to load animation from
    ///   - completion: Lottie animation
    public static func animation(for url: URL, completion: @escaping (Animation?) -> Void) {
        guard url.isJsonFile else {
            dotLottieUtils.log("""
                    Not a JSON file, instead use:
                    DotLottieAnimation.load(from: URL, completion: (Animation?) -> Void)
                  """)
            completion(nil)
            return
        }
        
        Animation.loadedFrom(url: url, closure: { (animation) in
            completion(animation)
        }, animationCache: LRUAnimationCache.sharedCache)
    }
}
