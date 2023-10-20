import SwiftUI

struct ImageView: View {
    
    private let imagePath: String?
    
    private let image: Image?
    private let placeholderImage: Image
    private var onDownloadedImage: ((UIImage) -> Void)?
    private var onFailureDownloadImage: (() -> Void)?
    
    // MARK: - Initialize
    
    init(imagePath: String? = nil,
         image: Image? = nil,
         placeholderImage: Image = .logo,
         onDownloadedImage: ((UIImage) -> Void)? = nil,
         onFailureDownloadImage: (() -> Void)? = nil) {
        self.imagePath = imagePath
        self.image = image
        self.placeholderImage = placeholderImage
        self.onDownloadedImage = onDownloadedImage
        self.onFailureDownloadImage = onFailureDownloadImage
    }
    
    var body: some View {
        if let image = image {
            setupImage(image)
        } else {
            setupImage(placeholderImage)
        }
    }
    
    // MARK: - Helpers
    
    private func setupImage(_ image: Image) -> some View {        
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
#endif
