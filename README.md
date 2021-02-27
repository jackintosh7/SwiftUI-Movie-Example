# SwiftUI-Movie-Example

Basic application that searches the **omdbapi** for common movie series - Harry Potter, Fast and Furious, Batman, Mission Impossible.

 - SwiftUI 
 - MVVM architecture pattern
 - Alamofire (Networking)
 - Kingfisher (Downloading images)

Contains a `List` with horizontal `ScrollView` to display movie poster images, when selected, pass movie object to detail view where an API call will fetch the full details for a given movie. 

**Goal:** Demonstrate core SwiftUI function while reusing a networking/data layer from [this](https://github.com/jackintosh7/Swift-Movie-Search-Challenge) UIKit project that searches for movies by title. 

**Main View**
<img src="https://user-images.githubusercontent.com/6379311/109381068-09d83280-78a6-11eb-915a-48f2fbd05196.png" height=844 width=390>

**Detail View**
<img src="https://user-images.githubusercontent.com/6379311/109381073-0cd32300-78a6-11eb-8ac1-be17f9d54e06.png" height=844 width=390>
