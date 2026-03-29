import ASKCoordinator
import Knit
import Models
import SwiftUI

@main
struct MyAppApp: App {
    private let assembler: ScopedModuleAssembler<BaseResolver> = {
        let assembler = ScopedModuleAssembler<BaseResolver>(
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
