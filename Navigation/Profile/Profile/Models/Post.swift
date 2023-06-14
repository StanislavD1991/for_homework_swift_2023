import Foundation
import UIKit

// MARK: - Profile
struct Profile {
    let name: String
    let surname: String
    let job: String
    let description: String
    let image: UIImage?

    var fullname: String {
        self.name + " " + self.surname
    }
}

// MARK: - Post
struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}
