import KnitMacros
import Models
import Observation

@Observable
final class ContentViewModel {
    var title: String

    @Resolvable<BaseResolver>
    init() {
        title = "MyApp"
    }

    func refreshTitle() {
        title = "MyApp (updated)"
    }
}
