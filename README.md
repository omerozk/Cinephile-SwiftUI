# Cinephile-SwiftUI

List watched movies/series using Trakt API (https://trakt.docs.apiary.io). 
Also include some user statistics and trending movies/series.  

## Why this project? 

Creation of a project using SwiftUI to play around and see the limitation

Limitation observed: 
- TabView state of tabs are not saved which lead to reload view each time we change tab
- TabView don't go to root view on tap of tabItem (when in a pushed view)
- Can't create ImageStyle (like ButtonStyle)
- Xcode Preview crash often

## Technology

- Xcode 11.4.1
- Swift 5
- Swift Package Manager
- Dev target: iOS 13.4

### Libraries

- Alamofire (v5.1.0) https://github.com/Alamofire/Alamofire.git
- OAuth2 (v5.2.0) https://github.com/p2/OAuth2.git
- Kingfisher (v5.13.4) https://github.com/onevcat/Kingfisher.git

Fixed version to update each of them manually, to be able to verify quality of updates.

## TODO 

- SwiftLint (compilcation error because of library dependencies using SPM)
- Error management
- Loading
- Empty states
- (UI)
