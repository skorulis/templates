import ASKCoordinator
import ASKCore
import Knit
import SwiftUI

@main
struct MyAppApp: App {
    private let assembler: ScopedModuleAssembler<Resolver> = {
        let assembler = ScopedModuleAssembler<Resolver>(
            [
                MyAppAssembly(purpose: .normal)
            ]
        )
        return assembler
    }()

    var body: some Scene {
        WindowGroup {
            if ProcessInfo.isRunningTests {
                Color.clear
            } else {
                CoordinatorView(coordinator: Coordinator(root: MainPath.content))
                    .withRenderers(resolver: assembler.resolver)
                    .environment(\.resolver, assembler.resolver)
            }
        }
    }
}

private extension ProcessInfo {
    static var isRunningTests: Bool {
        processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
