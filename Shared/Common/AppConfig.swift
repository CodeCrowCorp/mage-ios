import UIKit
import SwiftUI

enum AppConfig {
    static let emptySpacing: CGFloat = 0.0
    static let defaultLineWidth: CGFloat = 1.0
    static let sideOffset: CGFloat = 16.0
    static let smallRadius: CGFloat = 8.0
    static let defaultRadius: CGFloat = 16.0
    static let microOffset: CGFloat = 1.0
    static let smallestOffset: CGFloat = 2.0
    static let smallOffset: CGFloat = 4.0
    static let minOffset: CGFloat = 6.0
    static let mediumOffset: CGFloat = 8.0
    static let largeOffset: CGFloat = 20.0
    static let highOffset: CGFloat = 12.0
    static let defaultSpacing: CGFloat = 16.0
    static let defaultMinSpacing: CGFloat = 18.0
    static let defaultMediumSpacing: CGFloat = 20.0
    static let defaultHighSpacing: CGFloat = 24.0
    static let defaultSectionSpacing: CGFloat = 32.0
    static let midSectionSpacing: CGFloat = 40.0
    static let bigSectionSpacing: CGFloat = 42.0
    static let minLoadingViewHeight: CGFloat = 82.0
    static let loaderViewBigHeight = 250.0
    static let navigationBarHeight: CGFloat = 44.0
    static let minButtonHeight: CGFloat = 50.0
    static let textFieldDefaultHeight: CGFloat = 46.0
    static let tabsTopOfset: CGFloat = (AppConfig.navigationBarHeight + AppConfig.defaultSpacing)
    static let shadowColor: Color = .black.opacity(0.1)
    static let tabBarHeight: CGFloat = 80.0
    static let tabBarBottomOffset: CGFloat = 24.0
    static let tabBarSideOffset: CGFloat = 40.0
    static let screensBottomOffset: CGFloat = AppConfig.tabBarHeight + (AppConfig.tabBarBottomOffset * 2.0)
    
    static let defaultCellEdgeIncets: EdgeInsets = .init(
        top: AppConfig.mediumOffset,
        leading: AppConfig.defaultSpacing,
        bottom: AppConfig.mediumOffset,
        trailing: AppConfig.defaultSpacing
    )
}
