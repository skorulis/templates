import ASKCore
import KnitMacros
import Observation

@Observable
final class ContentViewModel {
    var title: String

    @Resolvable<Resolver>
    init() {
        title = "MyApp"
    }

    func refreshTitle() {
        title = "MyApp (updated)"
    }
}
