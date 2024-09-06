import Foundation

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
    ///     - entityId: イベントの対象エンティティID
    ///     - eventType: イベントのタイプ名
    ///     - createdAt: イベントの作成日時。指定しない場合は現在日時が設定される
    ///     - key: イベントの順序を保持するための値。この値が同じもののみ順序が保証される
    func produce(
        _ event: some Codable,
        entityId: some Codable,
        eventType: String,
        createdAt: Date?,
        key: String?
    ) async throws
}

extension EventProducible {
    public func produce(
        _ event: some Codable,
        entityId: some Codable,
        eventType: String,
        createdAt: Date? = nil,
        key: String? = nil
    ) async throws {
        try await produce(
            event,
            entityId: entityId,
            eventType: eventType,
            createdAt: createdAt ?? Date(),
            key: key
        )
    }
}
