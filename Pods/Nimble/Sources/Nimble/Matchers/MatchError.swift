/// A Nimble matcher that succeeds when the actual expression evaluates to an
/// error from the specified case.
///
/// Errors are tried to be compared by their implementation of Equatable,
/// otherwise they fallback to comparison by _domain and _code.
public func matchError<T: Error>(_ error: T) -> Matcher<Error> {
    return Matcher.define { actualExpression in
        let actualError = try actualExpression.evaluate()

        let message = messageForError(
            postfixMessageVerb: "match",
            actualError: actualError,
            error: error
        )

        var matches = false
        if let actualError = actualError, errorMatchesExpectedError(actualError, expectedError: error) {
            matches = true
        }

        return MatcherResult(bool: matches, message: message)
    }
}

/// A Nimble matcher that succeeds when the actual expression evaluates to an
/// error from the specified case.
///
/// Errors are tried to be compared by their implementation of Equatable,
/// otherwise they fallback to comparision by _domain and _code.
public func matchError<T: Error & Equatable>(_ error: T) -> Matcher<Error> {
    return Matcher.define { actualExpression in
        let actualError = try actualExpression.evaluate()

        let message = messageForError(
            postfixMessageVerb: "match",
            actualError: actualError,
            error: error
        )

        var matches = false
        if let actualError = actualError as? T, error == actualError {
            matches = true
        }

        return MatcherResult(bool: matches, message: message)
    }
}

/// A Nimble matcher that succeeds when the actual expression evaluates to an
/// error of the specified type
public func matchError<T: Error>(_ errorType: T.Type) -> Matcher<Error> {
    return Matcher.define { actualExpression in
        let actualError = try actualExpression.evaluate()

        let message = messageForError(
            postfixMessageVerb: "match",
            actualError: actualError,
            errorType: errorType
        )

        var matches = false
        if actualError as? T != nil {
            matches = true
        }

        return MatcherResult(bool: matches, message: message)
    }
}
