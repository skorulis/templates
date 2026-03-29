import ASKCore
import Foundation
import Knit
import KnitMacros
import Models
import SwiftUI

final class MyAppAssembly: AutoInitModuleAssembly {
    static var dependencies: [any Knit.ModuleAssembly.Type] = []
    typealias TargetResolver = BaseResolver

    private let purpose: IOCPurpose

    init() {
        self.purpose = .testing
    }

    init(purpose: IOCPurpose ) {
        self.purpose = purpose
    }

    @MainActor func assemble(container: Container<TargetResolver>) {
        ASKCoreAssembly(purpose: purpose).assemble(container: container)

        registerServices(container: container)
        registerStores(container: container)
        registerViewModels(container: container)
    }

    @MainActor
    private func registerServices(container: Container<TargetResolver>) {

    }

    @MainActor
    private func registerStores(container: Container<TargetResolver>) {

    }

    @MainActor
    private func registerViewModels(container: Container<TargetResolver>) {
        container.register(ContentViewModel.self) { ContentViewModel.make(resolver: $0) }
    }
}

extension MyAppAssembly {
    @MainActor static func testing() -> ScopedModuleAssembler<BaseResolver> {
        ScopedModuleAssembler<BaseResolver>([MyAppAssembly()])
    }
}

public extension EnvironmentValues {
    @Entry var resolver: BaseResolver?
}
