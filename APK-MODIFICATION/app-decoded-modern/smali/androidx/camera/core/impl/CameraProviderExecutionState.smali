.class public final Landroidx/camera/core/impl/CameraProviderExecutionState;
.super Ljava/lang/Object;
.source "CameraProviderExecutionState.java"

# interfaces
.implements Landroidx/camera/core/RetryPolicy$ExecutionState;


# instance fields
.field private final mAttemptCount:I

.field private final mCause:Ljava/lang/Throwable;

.field private final mStatus:I

.field private final mTaskExecutedTimeInMillis:J


# direct methods
.method public constructor <init>(JILjava/lang/Throwable;)V
    .locals 4
    .param p1, "taskStartTimeInMillis"    # J
    .param p3, "attemptCount"    # I
    .param p4, "throwable"    # Ljava/lang/Throwable;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long/2addr v0, p1

    iput-wide v0, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mTaskExecutedTimeInMillis:J

    .line 53
    iput p3, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mAttemptCount:I

    .line 54
    instance-of v0, p4, Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 55
    iput v1, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    .line 56
    iput-object p4, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    goto :goto_2

    .line 57
    :cond_0
    instance-of v0, p4, Landroidx/camera/core/InitializationException;

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 58
    invoke-virtual {p4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 59
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    move-object v3, v0

    goto :goto_0

    :cond_1
    move-object v3, p4

    :goto_0
    iput-object v3, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    .line 60
    iget-object v3, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    instance-of v3, v3, Landroidx/camera/core/CameraUnavailableException;

    if-eqz v3, :cond_2

    .line 61
    iput v1, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    goto :goto_1

    .line 62
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    instance-of v1, v1, Ljava/lang/IllegalArgumentException;

    if-eqz v1, :cond_3

    .line 63
    const/4 v1, 0x1

    iput v1, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    goto :goto_1

    .line 65
    :cond_3
    iput v2, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    .line 67
    .end local v0    # "cause":Ljava/lang/Throwable;
    :goto_1
    goto :goto_2

    .line 68
    :cond_4
    iput v2, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    .line 69
    iput-object p4, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    .line 71
    :goto_2
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .locals 1

    .line 88
    iget-object v0, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mCause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getExecutedTimeInMillis()J
    .locals 2

    .line 96
    iget-wide v0, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mTaskExecutedTimeInMillis:J

    return-wide v0
.end method

.method public getNumOfAttempts()I
    .locals 1

    .line 104
    iget v0, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mAttemptCount:I

    return v0
.end method

.method public getStatus()I
    .locals 1

    .line 79
    iget v0, p0, Landroidx/camera/core/impl/CameraProviderExecutionState;->mStatus:I

    return v0
.end method
