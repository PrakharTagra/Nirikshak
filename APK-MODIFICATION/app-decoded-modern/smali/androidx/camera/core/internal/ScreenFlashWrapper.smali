.class public final Landroidx/camera/core/internal/ScreenFlashWrapper;
.super Ljava/lang/Object;
.source "ScreenFlashWrapper.kt"

# interfaces
.implements Landroidx/camera/core/ImageCapture$ScreenFlash;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0008\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u0011\u0008\u0002\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0002\u0010\u0003J\u0018\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\tH\u0016J\u0008\u0010\u000f\u001a\u00020\u000bH\u0016J\u0008\u0010\u0010\u001a\u00020\u000bH\u0002J\u0008\u0010\u0011\u001a\u00020\u000bH\u0002J\u0006\u0010\u0012\u001a\u00020\u000bJ\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0001R\u0012\u0010\u0004\u001a\u00020\u00058\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Landroidx/camera/core/internal/ScreenFlashWrapper;",
        "Landroidx/camera/core/ImageCapture$ScreenFlash;",
        "screenFlash",
        "(Landroidx/camera/core/ImageCapture$ScreenFlash;)V",
        "isClearScreenFlashPending",
        "",
        "lock",
        "Ljava/lang/Object;",
        "pendingListener",
        "Landroidx/camera/core/ImageCapture$ScreenFlashListener;",
        "apply",
        "",
        "expirationTimeMillis",
        "",
        "screenFlashListener",
        "clear",
        "completePendingScreenFlashClear",
        "completePendingScreenFlashListener",
        "completePendingTasks",
        "getBaseScreenFlash",
        "Companion",
        "camera-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;

.field private static final TAG:Ljava/lang/String; = "ScreenFlashWrapper"


# instance fields
.field private isClearScreenFlashPending:Z

.field private final lock:Ljava/lang/Object;

.field private pendingListener:Landroidx/camera/core/ImageCapture$ScreenFlashListener;

.field private final screenFlash:Landroidx/camera/core/ImageCapture$ScreenFlash;


# direct methods
.method public static synthetic $r8$lambda$t_o_lKGGIvRKmzNXRdv2XQWSBSA(Landroidx/camera/core/internal/ScreenFlashWrapper;)V
    .locals 0

    invoke-static {p0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->apply$lambda$2(Landroidx/camera/core/internal/ScreenFlashWrapper;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/core/internal/ScreenFlashWrapper;->Companion:Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;

    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/ImageCapture$ScreenFlash;)V
    .locals 1
    .param p1, "screenFlash"    # Landroidx/camera/core/ImageCapture$ScreenFlash;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->screenFlash:Landroidx/camera/core/ImageCapture$ScreenFlash;

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->lock:Ljava/lang/Object;

    .line 30
    return-void
.end method

.method public synthetic constructor <init>(Landroidx/camera/core/ImageCapture$ScreenFlash;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1}, Landroidx/camera/core/internal/ScreenFlashWrapper;-><init>(Landroidx/camera/core/ImageCapture$ScreenFlash;)V

    return-void
.end method

.method private static final apply$lambda$2(Landroidx/camera/core/internal/ScreenFlashWrapper;)V
    .locals 4
    .param p0, "this$0"    # Landroidx/camera/core/internal/ScreenFlashWrapper;

    const-string/jumbo v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 50
    .local v1, "$i$a$-synchronized-ScreenFlashWrapper$apply$2$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->pendingListener:Landroidx/camera/core/ImageCapture$ScreenFlashListener;

    if-nez v2, :cond_0

    .line 51
    const-string v2, "ScreenFlashWrapper"

    const-string v3, "apply: pendingListener is null!"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->completePendingScreenFlashListener()V

    .line 54
    nop

    .end local v1    # "$i$a$-synchronized-ScreenFlashWrapper$apply$2$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit v0

    .line 55
    return-void

    .line 49
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private final completePendingScreenFlashClear()V
    .locals 6

    .line 80
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 81
    .local v1, "$i$a$-synchronized-ScreenFlashWrapper$completePendingScreenFlashClear$1":I
    :try_start_0
    iget-boolean v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->isClearScreenFlashPending:Z

    if-eqz v2, :cond_1

    .line 82
    iget-object v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->screenFlash:Landroidx/camera/core/ImageCapture$ScreenFlash;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Landroidx/camera/core/ImageCapture$ScreenFlash;->clear()V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_2

    .line 83
    move-object v2, p0

    check-cast v2, Landroidx/camera/core/internal/ScreenFlashWrapper;

    .local v2, "$this$completePendingScreenFlashClear_u24lambda_u246_u24lambda_u245":Landroidx/camera/core/internal/ScreenFlashWrapper;
    const/4 v3, 0x0

    .line 84
    .local v3, "$i$a$-run-ScreenFlashWrapper$completePendingScreenFlashClear$1$1":I
    const-string v4, "ScreenFlashWrapper"

    const-string v5, "completePendingScreenFlashClear: screenFlash is null!"

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    nop

    .line 83
    .end local v2    # "$this$completePendingScreenFlashClear_u24lambda_u246_u24lambda_u245":Landroidx/camera/core/internal/ScreenFlashWrapper;
    .end local v3    # "$i$a$-run-ScreenFlashWrapper$completePendingScreenFlashClear$1$1":I
    goto :goto_1

    .line 87
    :cond_1
    const-string v2, "ScreenFlashWrapper"

    const-string v3, "completePendingScreenFlashClear: none pending!"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_2
    :goto_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->isClearScreenFlashPending:Z

    .line 90
    nop

    .end local v1    # "$i$a$-synchronized-ScreenFlashWrapper$completePendingScreenFlashClear$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    monitor-exit v0

    .line 91
    return-void

    .line 80
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private final completePendingScreenFlashListener()V
    .locals 3

    .line 72
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 73
    .local v1, "$i$a$-synchronized-ScreenFlashWrapper$completePendingScreenFlashListener$1":I
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->pendingListener:Landroidx/camera/core/ImageCapture$ScreenFlashListener;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Landroidx/camera/core/ImageCapture$ScreenFlashListener;->onCompleted()V

    .line 74
    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->pendingListener:Landroidx/camera/core/ImageCapture$ScreenFlashListener;

    .line 75
    nop

    .end local v1    # "$i$a$-synchronized-ScreenFlashWrapper$completePendingScreenFlashListener$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit v0

    .line 76
    return-void

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static final from(Landroidx/camera/core/ImageCapture$ScreenFlash;)Landroidx/camera/core/internal/ScreenFlashWrapper;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/internal/ScreenFlashWrapper;->Companion:Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;

    invoke-virtual {v0, p0}, Landroidx/camera/core/internal/ScreenFlashWrapper$Companion;->from(Landroidx/camera/core/ImageCapture$ScreenFlash;)Landroidx/camera/core/internal/ScreenFlashWrapper;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public apply(JLandroidx/camera/core/ImageCapture$ScreenFlashListener;)V
    .locals 4
    .param p1, "expirationTimeMillis"    # J
    .param p3, "screenFlashListener"    # Landroidx/camera/core/ImageCapture$ScreenFlashListener;

    const-string/jumbo v0, "screenFlashListener"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->lock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 44
    .local v1, "$i$a$-synchronized-ScreenFlashWrapper$apply$1":I
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->isClearScreenFlashPending:Z

    .line 45
    iput-object p3, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->pendingListener:Landroidx/camera/core/ImageCapture$ScreenFlashListener;

    .line 46
    nop

    .end local v1    # "$i$a$-synchronized-ScreenFlashWrapper$apply$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit v0

    .line 48
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->screenFlash:Landroidx/camera/core/ImageCapture$ScreenFlash;

    if-eqz v0, :cond_0

    new-instance v1, Landroidx/camera/core/internal/ScreenFlashWrapper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/core/internal/ScreenFlashWrapper$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/internal/ScreenFlashWrapper;)V

    invoke-interface {v0, p1, p2, v1}, Landroidx/camera/core/ImageCapture$ScreenFlash;->apply(JLandroidx/camera/core/ImageCapture$ScreenFlashListener;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 56
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/internal/ScreenFlashWrapper;

    .local v0, "$this$apply_u24lambda_u243":Landroidx/camera/core/internal/ScreenFlashWrapper;
    const/4 v1, 0x0

    .line 57
    .local v1, "$i$a$-run-ScreenFlashWrapper$apply$3":I
    const-string v2, "ScreenFlashWrapper"

    const-string v3, "apply: screenFlash is null!"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-direct {v0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->completePendingScreenFlashListener()V

    .line 60
    nop

    .line 56
    .end local v0    # "$this$apply_u24lambda_u243":Landroidx/camera/core/internal/ScreenFlashWrapper;
    .end local v1    # "$i$a$-run-ScreenFlashWrapper$apply$3":I
    nop

    .line 61
    :cond_1
    return-void

    .line 43
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public clear()V
    .locals 0

    .line 64
    invoke-direct {p0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->completePendingScreenFlashClear()V

    .line 65
    return-void
.end method

.method public final completePendingTasks()V
    .locals 0

    .line 95
    invoke-direct {p0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->completePendingScreenFlashListener()V

    .line 96
    invoke-direct {p0}, Landroidx/camera/core/internal/ScreenFlashWrapper;->completePendingScreenFlashClear()V

    .line 97
    return-void
.end method

.method public final getBaseScreenFlash()Landroidx/camera/core/ImageCapture$ScreenFlash;
    .locals 1

    .line 68
    iget-object v0, p0, Landroidx/camera/core/internal/ScreenFlashWrapper;->screenFlash:Landroidx/camera/core/ImageCapture$ScreenFlash;

    return-object v0
.end method
