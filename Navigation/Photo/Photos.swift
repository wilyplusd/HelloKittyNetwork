

import UIKit

public struct Photo {
    var image: String

    static func fillPhoto() -> [Photo] {
        return [
            Photo(image: "1" ),
            Photo(image: "2"),
            Photo(image: "3" ),
            Photo(image: "4" ),
            Photo(image: "5" ),
            Photo(image: "6" )
        ]
    }
}
