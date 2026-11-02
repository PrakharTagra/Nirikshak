.class public final Landroidx/camera/core/impl/utils/Threads;
.super Ljava/lang/Object;
.source "Threads.java"


# static fields
.field private static final TIMEOUT_RUN_ON_MAIN_MS:J = 0x7530L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static checkBackgroundThread()V
    .locals 2

    .line 64
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isBackgroundThread()Z

    move-result v0

    const-string v1, "In application\'s main thread"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 65
    return-void
.end method

.method public static checkMainThread()V
    .locals 2

    .line 55
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    const-string v1, "Not in application\'s main thread"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 56
    return-void
.end method

.method private static getMainHandler()Landroid/os/Handler;
    .locals 2

    .line 122
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object v0
.end method

.method public static isBackgroundThread()Z
    .locals 1

    .line 46
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isMainThread()Z
    .locals 2

    .line 41
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$runOnMainSync$0(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "latch"    # Ljava/util/concurrent/CountDownLatch;

    .line 105
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 108
    nop

    .line 109
    return-void

    .line 107
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 108
    throw v0
.end method

.method public static runOnMain(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .line 73
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 75
    return-void

    .line 77
    :cond_0
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->getMainHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    const-string v1, "Unable to post to main thread"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 78
    return-void
.end method

.method public static runOnMainSync(Ljava/lang/Runnable;)V
    .locals 5
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .line 97
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 99
    return-void

    .line 102
    :cond_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 103
    .local v0, "latch":Ljava/util/concurrent/CountDownLatch;
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->getMainHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Landroidx/camera/core/impl/utils/Threads$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Landroidx/camera/core/impl/utils/Threads$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v1

    .line 110
    .local v1, "postResult":Z
    const-string v2, "Unable to post to main thread"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 112
    :try_start_0
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x7530

    invoke-virtual {v0, v3, v4, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 117
    nop

    .line 118
    return-void

    .line 113
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Timeout to wait main thread execution"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v1    # "postResult":Z
    .end local p0    # "runnable":Ljava/lang/Runnable;
    throw v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .restart local v0    # "latch":Ljava/util/concurrent/CountDownLatch;
    .restart local v1    # "postResult":Z
    .restart local p0    # "runnable":Ljava/lang/Runnable;
    :catch_0
    move-exception v2

    .line 116
    .local v2, "e":Ljava/lang/InterruptedException;
    new-instance v3, Landroidx/camera/core/impl/utils/InterruptedRuntimeException;

    invoke-direct {v3, v2}, Landroidx/camera/core/impl/utils/InterruptedRuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
