# dotLottieR

[![CI Status](https://img.shields.io/travis/eharrison/dotLottieR.svg?style=flat)](https://travis-ci.org/eharrison/dotLottieR)
[![Version](https://img.shields.io/cocoapods/v/dotLottieR.svg?style=flat)](https://cocoapods.org/pods/dotLottieR)
[![License](https://img.shields.io/cocoapods/l/dotLottieR.svg?style=flat)](https://cocoapods.org/pods/dotLottieR)
[![Platform](https://img.shields.io/cocoapods/p/dotLottieR.svg?style=flat)](https://cocoapods.org/pods/dotLottieR)

## Introducing dotLottie

<p align="center">
  <img src="/Example/dotLottie/Assets/Images.xcassets/AppIcon.appiconset/dotLottie2048-1024.png" width="400">
</p>

dotLottie is an open-source file format that aggregates one or more Lottie files and their associated resources into a single file. They are ZIP archives compressed with the Deflate compression method and carry the file extension of ".lottie".

## View documentation, FAQ, help, examples, and more at [dotlottie.io](http://dotlottie.io/)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 5.0
- iOS 9
- macOS 10.12
- tvOS 9.0
- watchOS 6.0

## Installation

### Cocoapods

dotLottieR-ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'dotLottieR', :git => 'https://github.com/dotlottie/dotlottieR-ios.git'
```

### Swift Package Manager

```swift
.package(url: "https://github.com/dotlottie/dotlottieR-ios.git", from: "0.1.0")
```

## Using dotLottieR
```swift
import dotLottieR
```

##### Enabling log
```swift
dotLottieR.isLogEnabled = true
```
 
 ### Loading animation on iOS
 
 ```swift
 let animator = DotLottieRAnimator(url: url, imageView: anyImageView)
 animator.loopMode = .loop
 animator.play()
 ```
 
 ### Loading animation on watchOS
 
 ```swift
 let animator = DotLottieRAnimator(url: url, imageView: anyInterfaceImage)
 animator.loopMode = .loop
 animator.play()
 ```

## Author

[Evandro Harrison Hoffmann](https://github.com/eharrison) | evandro.hoffmann@gmail.com

## License

dotLottieR-ios is available under the MIT license. See the LICENSE file for more info.
