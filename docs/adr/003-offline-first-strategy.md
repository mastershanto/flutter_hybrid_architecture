# ADR 003: Offline-First Data Strategy

## Status
**Accepted** - November 2025

## Context
Users expect the app to work seamlessly regardless of network connectivity. We need a strategy that:
- Works without internet connection
- Syncs data when online
- Handles conflicts gracefully
- Provides instant user feedback

## Decision
We will implement an **Offline-First** architecture with the following principles:

### Core Strategy

#### 1. Local Database as Source of Truth
- All data operations target local database first
- UI always reads from local database
- Provides instant feedback to users
- Works 100% offline

#### 2. Background Synchronization
- Remote sync happens in background
- Never blocks user operations
- Graceful handling of sync failures
- Network-aware sync strategy

#### 3. Conflict Resolution
- Last-write-wins for updates
- Remote data takes precedence for conflicts
- Clear user communication for failures

## Implementation

### Technology Stack

#### Drift (SQLite)
**Why?**
- ✅ Type-safe database operations
- ✅ Code generation reduces errors
- ✅ Reactive streams for real-time updates
- ✅ CRUD operations with compiler checks
- ✅ Migration support

#### Connectivity Plus
**Why?**
- ✅ Network state monitoring
- ✅ Cross-platform support
- ✅ Real-time connectivity changes

### Data Flow

#### Read Operations
```dart
1. Check local database (always)
2. If online → fetch from remote (background)
3. Update local cache
4. UI automatically updates via streams
```

#### Write Operations
```dart
1. Write to local database (always succeeds)
2. Return success immediately
3. If online → sync to remote (background)
4. If offline → queue for later sync
5. Retry failed syncs when connection restored
```

## Example Implementation

```dart
@override
Future<Either<Failure, void>> add(Todo todo) async {
  try {
    // 1. Always save locally first
    await localDataSource.insertTodo(todo.toCompanion());

    // 2. Try remote sync if connected
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.createTodo(TodoModel.fromEntity(todo));
      } on ServerException catch (e) {
        logger.e('Remote sync failed: ${e.message}');
        // Don't fail - already saved locally
      }
    }
    
    return const Right(null);
  } on CacheException catch (e) {
    return Left(CacheFailure(e.message));
  }
}
```

## Consequences

### Positive
✅ **Works Offline**: Full functionality without internet  
✅ **Instant Feedback**: No waiting for network requests  
✅ **Better UX**: Smooth experience regardless of connectivity  
✅ **Data Persistence**: Never lose user data  
✅ **Performance**: Local reads are much faster  
✅ **Resilience**: Network failures don't break app  

### Negative
⚠️ **Complexity**: More complex than online-only  
⚠️ **Storage**: Requires local database  
⚠️ **Sync Logic**: Need to handle sync conflicts  
⚠️ **Testing**: Must test both online and offline scenarios  

### Mitigations
- Comprehensive testing of sync logic
- Clear error messages to users
- Monitoring and logging of sync failures
- Periodic cleanup of old data

## Sync Strategy Details

### When to Sync
1. **On App Launch**: Sync all data
2. **On Network Restored**: Sync queued changes
3. **Periodic Background**: Every 15 minutes (configurable)
4. **Manual Refresh**: User-initiated

### What to Sync
1. **Always**: User-created data (todos, tasks)
2. **Conditionally**: Large files, images
3. **Never**: Temporary UI state

### Conflict Resolution
1. **No Conflicts**: Use timestamps, last-write-wins
2. **Has Conflicts**: Remote data takes precedence
3. **User Data**: Never silently discard user changes

## Performance Considerations

### Database Optimization
- Indexes on frequently queried fields
- Batch operations for multiple items
- Lazy loading for large datasets
- Periodic cleanup of old data

### Network Optimization
- Batch sync requests
- Compress data when possible
- Delta sync (only changed data)
- Retry with exponential backoff

## Monitoring

### Metrics to Track
- Sync success/failure rate
- Time to sync
- Offline usage duration
- Conflict occurrence rate
- Database size growth

## Alternatives Considered

### 1. Online-Only (No Offline Support)
- ❌ Rejected: Poor UX without internet
- ❌ Requires constant connectivity
- ❌ Network failures break app

### 2. Remote as Source of Truth
- ❌ Rejected: Slow user experience
- ❌ Requires internet for all operations
- ❌ No offline functionality

### 3. Two-Way Sync with CRDTs
- ❌ Rejected: Too complex for MVP
- ✅ Consider for future if conflicts become common

## References
- [Offline First Design Pattern](https://offlinefirst.org/)
- [Drift Documentation](https://drift.simonbinder.eu/)
- [Firebase Offline Capabilities](https://firebase.google.com/docs/database/flutter/offline-capabilities)
