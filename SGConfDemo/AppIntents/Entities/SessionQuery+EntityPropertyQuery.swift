//
//  SessionQuery+EntityPropertyQuery.swift
//  SGConfDemo
//
//  Created by Vince Davis on 1/15/25.
//

import AppIntents
import SwiftUI

extension SessionQuery: EntityPropertyQuery {
    
    /**
     The type of the comparator to use for the property query. This sample uses `Predicate`, but other apps could use `NSPredicate` (for
     Core Data) or an entirely custom comparator that works with an existing data model.
     */
    typealias ComparatorMappingType = Predicate<SessionEntity>
    
    /**
     Declare the entity properties that are available for queries and in the Find intent, along with the comparator the app uses when querying the
     property.
     */
    static let properties = QueryProperties {
        Property(\SessionEntity.$name) {
            ContainsComparator { searchValue in
                #Predicate<SessionEntity> { $0.name.localizedStandardContains(searchValue) }
            }
            EqualToComparator { searchValue in
                #Predicate<SessionEntity> { $0.name == searchValue }
            }
            NotEqualToComparator { searchValue in
                #Predicate<SessionEntity> { $0.name != searchValue }
            }
        }
        
//        Property(\TrailEntity.$trailLength) {
//            LessThanOrEqualToComparator { searchValue in
//                #Predicate<TrailEntity> { entity in
//                    entity.trailLength <= searchValue
//                }
//            }
//            GreaterThanOrEqualToComparator { searchValue in
//                #Predicate<TrailEntity> { entity in
//                    entity.trailLength >= searchValue
//                }
//            }
//        }
    }
    
    /// Declare the entity properties available as sort criteria in the Find intent.
    static let sortingOptions = SortingOptions {
        SortableBy(\SessionEntity.$name)
        //SortableBy(\TrailEntity.$trailLength)
    }
    
    /// The text that people see in the Shortcuts app, describing what this intent does.
    static var findIntentDescription: IntentDescription? {
        IntentDescription("Search for the sessions you want to see",
                          categoryName: "Discover",
                          searchKeywords: ["session", "conference"],
                          resultValueName: "Sessions")
    }

    /// Performs the Find intent using the predicates that the individual enters in the Shortcuts app.
    func entities(matching comparators: [Predicate<SessionEntity>],
                  mode: ComparatorMode,
                  sortedBy: [EntityQuerySort<SessionEntity>],
                  limit: Int?) async throws -> [SessionEntity] {
        
        /// Get the trail entities that meet the criteria of the comparators.
        var matchedSessions = try await sessions(matching: comparators, mode: mode)

        for sortOperation in sortedBy {
            switch sortOperation.by {
            case \.$name:
                matchedSessions.sort(using: KeyPathComparator(\SessionEntity.name, order: sortOperation.order.sortOrder))
//            case \.$trailLength:
//                matchedTrails.sort(using: KeyPathComparator(\SessionEntity.trailLength, order: sortOperation.order.sortOrder))
            default:
                break
            }
        }
        
        /**
         People can optionally customize a limit to the number of results that a query returns.
         If your data model supports query limits, you can also use the limit parameter when querying
         your data model, to allow for faster searches.
         */
        if let limit, matchedSessions.count > limit {
            matchedSessions.removeLast(matchedSessions.count - limit)
        }

        return matchedSessions
    }
    
    /// - Returns: The trail entities that meet the criteria of `comparators` and `mode`.
    private func sessions(matching comparators: [Predicate<SessionEntity>], mode: ComparatorMode) async throws -> [SessionEntity] {
        try await ConfSessionManager().fetchSessions().compactMap { session in
            let entity = SessionEntity(session: session)
            
            /**
             For an AND search (criteria1 AND criteria2 AND ...), this variable starts as `true`.
             If any of the comparators don't match, the app sets it to `false`, allowing the comparator loop to break early because a comparator
             doesn't satisfy the AND requirement.
             
             For an OR search (criteria1 OR criteria2 OR ...), this variable starts as `false`.
             If any of the comparators match, the app sets it to `true`, allowing the comparator loop to break early because any comparator that
             matches satisfies the OR requirement.
             */
            var includeAsResult = mode == .and ? true : false
            let earlyBreakCondition = includeAsResult
            for comparator in comparators {
                guard includeAsResult == earlyBreakCondition else {
                    break
                }
                
                /// Runs the `Predicate` expression with the specific `TrailEntity` to determine whether the entity matches the conditions.
                includeAsResult = try comparator.evaluate(entity)
            }
            return includeAsResult ? entity : nil
        }
    }
}

extension EntityQuerySort.Ordering {
    /// Convert sort information from `EntityQuerySort` to  Foundation's `SortOrder`.
    var sortOrder: SortOrder {
        switch self {
        case .ascending:
            return SortOrder.forward
        case .descending:
            return SortOrder.reverse
        }
    }
}
