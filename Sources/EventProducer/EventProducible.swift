/// イベント配信プロトコル
///
/// Event Sourcingにおけるイベントの保存・配信を行うサービスプロトコル
///
/// ```swift
/// let producer: some EventProducible
/// producer.produce(event)
/// ```
public protocol EventProducible: Sendable {
    /// イベントの配信する
    ///
    /// - Parameters:
    ///     - event: 配信するイベント
    func produce(_ event: some Codable) async throws
}
