
import SwiftUI

private enum Config {
    static let offset: CGFloat = 8.0
    static let verticalPadding: CGFloat = 8.0
    static let defaultFontSize: CGFloat = 14.0
    static let defaultButtonHeight: CGFloat = 48.0
    static let defaultCornerRadius: CGFloat = 16.0
    static let borderWidth: CGFloat = 1.0
}

enum ButtonContentViewType {
    case border
    case filled
    case clear
}

enum ButtonContentViewState {
    case regular
    case progress
    case disable
    
    func isUserInteractionEnable() -> Bool {
        switch self {
        case .regular: return true
        case .progress, .disable: return false
        }
    }
}

struct ButtonBaseView: View {
    
    private let title: String?
    private let leftIcon: Image?
    private let rightIcon: Image?
    private let color: Color
    private let textColor: Color?
    private let font: SwiftUI.Font
    private let type: ButtonContentViewType
    private let state: ButtonContentViewState
    private let height: CGFloat
    private let cornerRadius: CGFloat
    private let shouldFillToWidth: Bool
    
    private var viewTypeTextColor: Color {
        get {
            if let textColor = textColor { return textColor }
            
            switch type {
            case .border, .clear: return stateColor
            default: return .mage_blue
            }
        }
    }
    
    private var stateColor: Color {
        get {
            switch state {
            case .regular: return color
            case .progress, .disable: return color.opacity(0.5)
            }
        }
    }
    
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
         shouldFillToWidth: Bool = true) {
        self.title = title
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.color = color ?? .blue
        self.textColor = textColor
        self.font = font ?? AppFonts.font(size: 16, style: .medium)
        self.type = type ?? .filled
        self.state = state
        self.height = height ?? Config.defaultButtonHeight
        self.cornerRadius = cornerRadius ?? Config.defaultCornerRadius
        self.shouldFillToWidth = shouldFillToWidth
    }
    
    var body: some View {
        mainBackground {
            
            HStack(spacing: Config.offset) {
                
                if shouldFillToWidth {
                    Spacer()
                }
                
                if state == .progress {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: viewTypeTextColor))
                        .aspectRatio(1.0, contentMode: .fill)
                        .padding([ .top, .bottom ], Config.verticalPadding)
                }
                
                if let icon = leftIcon {
                    image(icon)
                }
                
                if let title = title {
                    Text(title)
                        .foregroundColor(viewTypeTextColor)
                        .font(font)
                }
                
                if let icon = rightIcon {
                    image(icon.renderingMode(.template))
                }
                
                if shouldFillToWidth {
                    Spacer()
                }
            }
            .frame(height: height)
            .padding(.horizontal, shouldFillToWidth ? AppConfig.emptySpacing : AppConfig.largeOffset)
        }
    }
    
    // MARK: - Actions
    
    @ViewBuilder private func mainBackground<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        switch type {
        case .border: borderViewType(content: content)
        case .filled: filledViewType(content: content)
        case .clear: clearViewType(content: content)
        }
    }
    
    private func borderViewType<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        return VStack {
            content()
        }
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay( RoundedRectangle(cornerRadius: cornerRadius).stroke(stateColor, lineWidth: Config.borderWidth) )
        .padding(.horizontal, Config.borderWidth)
    }
    
    private func filledViewType<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        return VStack {
            content()
        }
        .background(stateColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    private func clearViewType<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        return VStack {
            content()
        }
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    private func image(_ icon: Image) -> some View {
        let widthHeight = height - (Config.verticalPadding)
        
        return icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding([ .top, .bottom ], Config.verticalPadding)
            .frame(width: widthHeight, height: widthHeight)
            .foregroundColor(stateColor)
    }
}

#if DEBUG
struct ButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBaseView(title: "Some title",
                       leftIcon: .discord,
                          color: .black,
                          type: .border,
                          state: .regular,
                          height: 48.0)
    }
}
#endif
