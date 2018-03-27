# UnsplashSwift
🌯 A Swift wrapper for the Unsplash API

## 🛠 Installation

### CocoaPods

To integrate UnsplashSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'UnsplashSwift'
```

## 👨🏻‍💻 Usage

```swift
let unsplash = Provider<Unsplash>(clientID: "xxx") // only for public actions

// OR

let unsplash = Provider<Unsplash>(token: "xxx") // for all actions

provider.request(.photos(page: 1, perPage: 10, orderBy: .popular)).responseJSON { response in
    // do something with the response
}
```
UnsplashSwift is build on top of Alamofire.

See [Alamofire](https://github.com/Alamofire/Alamofire) for more information about `Response Handling`, `Response Validation`

## 🐨 Author
Created with ❤️ by [Joan Disho](https://twitter.com/_disho)

## 🙏 Acknowledgements
Inspired by [Moya](https://github.com/Moya/Moya)

### 📃 License

UnsplashSwift is released under an MIT license. See [License.md](https://github.com/jdisho/UnsplashSwift/blob/master/LICENSE) for more information.
