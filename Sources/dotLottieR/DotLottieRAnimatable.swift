//
//  dotLottieInterfaceImage.swift
//  dotLottieR-iOS
//
//  Created by Evandro Harrison Hoffmann on 06/08/2020.
//

import dotLottieLoader
import SDWebImageLottieCoder

public protocol DotLottieRAnimatable: AnyObject {
    var animationUrl: URL? {get set}
    var coder: SDImageLottieCoder? {get set}
    var currentFrame: UInt {get set}
    var speed: Double {get set}
    var loopMode: DotLottieRLoopMode {get set}
    var isPlaying: Bool {get set}
    
    func imageUpdated(image: UIImage?)
}

public extension DotLottieRAnimatable {
    
    func load(url: URL) {
        animationUrl = url
        isPlaying = true
        
        dotLottieLoader.load(from: url) { [weak self] (dotLottieFile) in
            self?.animationUrl = dotLottieFile?.animationUrl ?? url
            self?.setupAnimation()
        }
    }
    
    private func dataForAnimation(completion: @escaping (Data) -> Void) {
        guard let json = animationUrl else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: URLRequest(url: json)) { (data, response, error) in
            guard let data = data else { return }
            completion(data)
        }
        dataTask.resume()
    }

    private func setupAnimation() {
        dataForAnimation { [weak self] (data) in
            self?.setupAnimation(data: data)
        }
    }

    private func setupAnimation(data: Data) {
        coder = SDImageLottieCoder(animatedImageData: data, options: [SDImageCoderOption.decodeLottieResourcePath: Bundle.main.resourcePath!])
            
        guard let coder = coder else { return }
        dotLottieUtils.log("fames: \(coder.animatedImageFrameCount)")
            
        currentFrame = 0

        imageUpdated(image: coder.animatedImageFrame(at: currentFrame))
        
        guard isPlaying else { return }
        nextFrame()
    }

    func nextFrame() {
        guard let coder = coder else { return }

        currentFrame += 1
        
        guard currentFrame < coder.animatedImageFrameCount else {
            handleAnimationCompleted()
            return
        }
        
        dotLottieUtils.log("currentFrame: \(currentFrame)")
        
        imageUpdated(image: coder.animatedImageFrame(at: currentFrame))
        
        guard isPlaying else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01/speed) { [weak self] in
            self?.nextFrame()
        }
    }

    private func handleAnimationCompleted() {
        guard isPlaying else { return }
        
        switch loopMode {
        case .playOnce:
            break
        case .play(let times):
            guard times > 0 else { return }
            loopMode = .play(times: times-1)
            currentFrame = 0
            nextFrame()
        case .loop:
            currentFrame = 0
            nextFrame()
        }
    }

    func play() {
        isPlaying = true
        nextFrame()
    }
    
    func pause() {
        isPlaying = false
    }
}

