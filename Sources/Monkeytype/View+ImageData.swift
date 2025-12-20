//
//  Created by Artem Novichkov on 20.11.2024.
//

import SwiftUI

public extension View {
    func makeImageData(size: CGSize) -> Data? {
        let imageRenderer = ImageRenderer(content: frame(width: size.width, height: size.height))
        imageRenderer.scale = 4
        guard let cgImage = imageRenderer.cgImage else {
            return nil
        }
        let bitmapImageRep = NSBitmapImageRep(cgImage: cgImage)
        return bitmapImageRep.representation(using: .jpeg, properties: [:])
    }
}
