import Foundation

/// イベントを購読するプロトコル
///
/// このプロトコルに準拠するサービスを登録することにより配信されたイベントを購読することができる
public protocol EventConsumer: Sendable {
    associatedtype Event: Codable

    /// 購読するイベントのタイプ名
    var subscribeFor: [String] { get }

    /// イベントの購読
    ///
    /// - Parameters:
    ///     - event: 配信されたイベント
    ///     - createdAt: 配信日時
    func subscribe(event: Event, createdAt: Date) async throws
}
