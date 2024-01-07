
import SwiftUI

struct ButtonDestinationView <DestinationType: View>: View {
    
    private let title: String?
    private let leftIcon: Image?
    private let rightIcon: Image?
    private let color: Color?
    private let textColor: Color?
    private let font: SwiftUI.Font?
    private let type: ButtonContentViewType?
    private let state: ButtonContentViewState
    private let height: CGFloat?
    private let cornerRadius: CGFloat?
    private let shouldFillToWidth: Bool
    private let destination: DestinationType
    
    // MARK: - Initialize
    
    init(title: String? = nil,
         leftIcon: Image? = nil,
         rightIcon: Image? = nil,
         color: Color? = nil,
         textColor: Color? = nil,
         font: SwiftUI.Font? = nil,
         type: ButtonContentViewType? = nil,
         state: ButtonContentViewState = .regular,
         height: CGFloat? = nil,
         cornerRadius: CGFloat? = nil,
         shouldFillToWidth: Bool = true,
         destination: DestinationType) {
        self.title = title
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.color = color
        self.textColor = textColor
        self.font = font
        self.type = type
        self.state = state
        self.height = height
        self.cornerRadius = cornerRadius
        self.shouldFillToWidth = shouldFillToWidth
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            ButtonBaseView(title: title,
                              leftIcon: leftIcon,
                              rightIcon: rightIcon,
                              color: color,
                              textColor: textColor,
                              font: font,
                              type: type,
                              state: state,
                              height: height,
                              cornerRadius: cornerRadius,
                              shouldFillToWidth: shouldFillToWidth)
        }.allowsHitTesting(state.isUserInteractionEnable())
    }
}

#if DEBUG
struct ButtonDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDestinationView(title: "Some title",
                              destination: EmptyView())
    }
}
#endif
