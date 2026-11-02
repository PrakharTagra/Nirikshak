.class public final Landroidx/camera/view/impl/ZoomGestureDetector;
.super Ljava/lang/Object;
.source "ZoomGestureDetector.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/impl/ZoomGestureDetector$Companion;,
        Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;,
        Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 -2\u00020\u0001:\u0003-./B+\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0003\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0003\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\tJ\u0008\u0010(\u001a\u00020\u000cH\u0002J\u0008\u0010)\u001a\u00020\u0012H\u0002J\u0010\u0010*\u001a\u00020\u00122\u0006\u0010+\u001a\u00020,H\u0007R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0015\u001a\u00020\u00058\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0016\u001a\u00020\u00058\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001b\u001a\u00020\u0012X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u001a\u0010\u001f\u001a\u00020\u0012X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001f\u0010\u001c\"\u0004\u0008 \u0010\u001eR\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010%\u001a\u00020\u00148F\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010\'\u00a8\u00060"
    }
    d2 = {
        "Landroidx/camera/view/impl/ZoomGestureDetector;",
        "",
        "context",
        "Landroid/content/Context;",
        "spanSlop",
        "",
        "minSpan",
        "listener",
        "Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;",
        "(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V",
        "anchoredZoomMode",
        "anchoredZoomStartX",
        "",
        "anchoredZoomStartY",
        "currentSpan",
        "currentSpanX",
        "currentSpanY",
        "eventBeforeOrAboveStartingGestureEvent",
        "",
        "eventTime",
        "",
        "focusX",
        "focusY",
        "gestureDetector",
        "Landroid/view/GestureDetector;",
        "initialSpan",
        "isInProgress",
        "isQuickZoomEnabled",
        "()Z",
        "setQuickZoomEnabled",
        "(Z)V",
        "isStylusZoomEnabled",
        "setStylusZoomEnabled",
        "prevTime",
        "previousSpan",
        "previousSpanX",
        "previousSpanY",
        "timeDelta",
        "getTimeDelta",
        "()J",
        "getIncrementalScaleFactor",
        "inAnchoredZoomMode",
        "onTouchEvent",
        "event",
        "Landroid/view/MotionEvent;",
        "Companion",
        "OnZoomGestureListener",
        "ZoomEvent",
        "camera-view_release"
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
.field private static final ANCHORED_ZOOM_MODE_DOUBLE_TAP:I = 0x1

.field private static final ANCHORED_ZOOM_MODE_NONE:I = 0x0

.field private static final ANCHORED_ZOOM_MODE_STYLUS:I = 0x2

.field public static final Companion:Landroidx/camera/view/impl/ZoomGestureDetector$Companion;

.field private static final DEFAULT_MIN_SPAN:I = 0x0

.field private static final SCALE_FACTOR:F = 0.5f


# instance fields
.field private anchoredZoomMode:I

.field private anchoredZoomStartX:F

.field private anchoredZoomStartY:F

.field private final context:Landroid/content/Context;

.field private currentSpan:F

.field private currentSpanX:F

.field private currentSpanY:F

.field private eventBeforeOrAboveStartingGestureEvent:Z

.field private eventTime:J

.field private focusX:I

.field private focusY:I

.field private gestureDetector:Landroid/view/GestureDetector;

.field private initialSpan:F

.field private isInProgress:Z

.field private isQuickZoomEnabled:Z

.field private isStylusZoomEnabled:Z

.field private final listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

.field private final minSpan:I

.field private prevTime:J

.field private previousSpan:F

.field private previousSpanX:F

.field private previousSpanY:F

.field private final spanSlop:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/view/impl/ZoomGestureDetector$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/view/impl/ZoomGestureDetector$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/view/impl/ZoomGestureDetector;->Companion:Landroidx/camera/view/impl/ZoomGestureDetector$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanSlop"    # I
    .param p3, "minSpan"    # I
    .param p4, "listener"    # Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "listener"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->context:Landroid/content/Context;

    .line 61
    iput p2, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->spanSlop:I

    .line 62
    iput p3, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->minSpan:I

    .line 63
    iput-object p4, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isQuickZoomEnabled:Z

    .line 192
    iput-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isStylusZoomEnabled:Z

    .line 242
    new-instance v0, Landroid/view/GestureDetector;

    .line 243
    iget-object v1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->context:Landroid/content/Context;

    .line 244
    new-instance v2, Landroidx/camera/view/impl/ZoomGestureDetector$gestureDetector$1;

    invoke-direct {v2, p0}, Landroidx/camera/view/impl/ZoomGestureDetector$gestureDetector$1;-><init>(Landroidx/camera/view/impl/ZoomGestureDetector;)V

    check-cast v2, Landroid/view/GestureDetector$OnGestureListener;

    .line 242
    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->gestureDetector:Landroid/view/GestureDetector;

    .line 59
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 59
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 61
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    mul-int/lit8 p2, p2, 0x2

    .line 59
    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    .line 62
    const/4 p3, 0x0

    .line 59
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/impl/ZoomGestureDetector;-><init>(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V

    .line 487
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V
    .locals 8

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "listener"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v6, 0x4

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v7}, Landroidx/camera/view/impl/ZoomGestureDetector;-><init>(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;)V
    .locals 8

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v6, 0x6

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v7}, Landroidx/camera/view/impl/ZoomGestureDetector;-><init>(Landroid/content/Context;IILandroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public static final synthetic access$setAnchoredZoomMode$p(Landroidx/camera/view/impl/ZoomGestureDetector;I)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/view/impl/ZoomGestureDetector;
    .param p1, "<set-?>"    # I

    .line 56
    iput p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    return-void
.end method

.method public static final synthetic access$setAnchoredZoomStartX$p(Landroidx/camera/view/impl/ZoomGestureDetector;F)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/view/impl/ZoomGestureDetector;
    .param p1, "<set-?>"    # F

    .line 56
    iput p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartX:F

    return-void
.end method

.method public static final synthetic access$setAnchoredZoomStartY$p(Landroidx/camera/view/impl/ZoomGestureDetector;F)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/view/impl/ZoomGestureDetector;
    .param p1, "<set-?>"    # F

    .line 56
    iput p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartY:F

    return-void
.end method

.method private final getIncrementalScaleFactor()F
    .locals 5

    .line 455
    invoke-direct {p0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_5

    .line 459
    iget-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventBeforeOrAboveStartingGestureEvent:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iget v3, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_1

    .line 460
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventBeforeOrAboveStartingGestureEvent:Z

    if-nez v0, :cond_2

    iget v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iget v3, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_2

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 458
    :goto_0
    nop

    .line 461
    .local v0, "scaleUp":Z
    int-to-float v2, v2

    iget v3, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iget v4, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v2, v3

    .line 462
    .local v2, "spanDiff":F
    iget v3, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    iget v4, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->spanSlop:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_3

    goto :goto_1

    .line 463
    :cond_3
    if-eqz v0, :cond_4

    add-float/2addr v1, v2

    goto :goto_1

    :cond_4
    sub-float/2addr v1, v2

    .line 462
    :goto_1
    return v1

    .line 465
    .end local v0    # "scaleUp":Z
    .end local v2    # "spanDiff":F
    :cond_5
    iget v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_6

    iget v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iget v1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    div-float v1, v0, v1

    :cond_6
    return v1
.end method

.method private final inAnchoredZoomMode()Z
    .locals 1

    .line 451
    iget v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final getTimeDelta()J
    .locals 4

    .line 475
    iget-wide v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    iget-wide v2, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->prevTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public final isQuickZoomEnabled()Z
    .locals 1

    .line 184
    iget-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isQuickZoomEnabled:Z

    return v0
.end method

.method public final isStylusZoomEnabled()Z
    .locals 1

    .line 192
    iget-boolean v0, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isStylusZoomEnabled:Z

    return v0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 41
    .param p1, "event"    # Landroid/view/MotionEvent;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "event"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    .line 274
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 277
    .local v2, "action":I
    iget-boolean v3, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isQuickZoomEnabled:Z

    if-eqz v3, :cond_0

    .line 278
    iget-object v3, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 281
    :cond_0
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    .line 282
    .local v3, "count":I
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v4

    and-int/lit8 v4, v4, 0x20

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_1

    move v4, v6

    goto :goto_0

    :cond_1
    move v4, v5

    .line 285
    .local v4, "isStylusButtonDown":Z
    :goto_0
    iget v7, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_2

    if-nez v4, :cond_2

    move v7, v6

    goto :goto_1

    :cond_2
    move v7, v5

    .line 284
    :goto_1
    nop

    .line 287
    .local v7, "anchoredZoomCancelled":Z
    if-eq v2, v6, :cond_4

    .line 288
    const/4 v9, 0x3

    if-eq v2, v9, :cond_4

    .line 289
    if-eqz v7, :cond_3

    goto :goto_2

    :cond_3
    move v9, v5

    goto :goto_3

    :cond_4
    :goto_2
    move v9, v6

    .line 286
    :goto_3
    nop

    .line 291
    .local v9, "streamComplete":Z
    const/4 v10, 0x0

    if-eqz v2, :cond_6

    if-eqz v9, :cond_5

    goto :goto_4

    :cond_5
    move/from16 v18, v6

    goto :goto_6

    .line 295
    :cond_6
    :goto_4
    iget-boolean v11, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    if-eqz v11, :cond_7

    .line 296
    iget-object v11, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    .line 297
    new-instance v12, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$End;

    iget-wide v13, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    iget v15, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusX:I

    move/from16 v18, v6

    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusY:I

    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->getIncrementalScaleFactor()F

    move-result v17

    move/from16 v16, v6

    invoke-direct/range {v12 .. v17}, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$End;-><init>(JIIF)V

    check-cast v12, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;

    .line 296
    invoke-interface {v11, v12}, Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;->onZoomEvent(Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;)Z

    .line 299
    iput-boolean v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    .line 300
    iput v10, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    .line 301
    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    goto :goto_5

    .line 302
    :cond_7
    move/from16 v18, v6

    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v6

    if-eqz v6, :cond_8

    if-eqz v9, :cond_8

    .line 303
    iput-boolean v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    .line 304
    iput v10, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    .line 305
    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    .line 307
    :cond_8
    :goto_5
    if-eqz v9, :cond_9

    .line 308
    return v18

    .line 312
    :cond_9
    :goto_6
    nop

    .line 313
    iget-boolean v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    if-nez v6, :cond_a

    .line 314
    iget-boolean v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isStylusZoomEnabled:Z

    if-eqz v6, :cond_a

    .line 315
    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v6

    if-nez v6, :cond_a

    .line 316
    if-nez v9, :cond_a

    .line 317
    if-eqz v4, :cond_a

    .line 320
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartX:F

    .line 321
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartY:F

    .line 322
    iput v8, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomMode:I

    .line 323
    iput v10, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    .line 327
    :cond_a
    const/4 v6, 0x6

    if-eqz v2, :cond_c

    .line 328
    if-eq v2, v6, :cond_c

    .line 329
    const/4 v10, 0x5

    if-eq v2, v10, :cond_c

    .line 330
    if-eqz v7, :cond_b

    goto :goto_7

    :cond_b
    move v10, v5

    goto :goto_8

    :cond_c
    :goto_7
    move/from16 v10, v18

    .line 326
    :goto_8
    nop

    .line 332
    .local v10, "configChanged":Z
    if-ne v2, v6, :cond_d

    move/from16 v6, v18

    goto :goto_9

    :cond_d
    move v6, v5

    .line 333
    .local v6, "pointerUp":Z
    :goto_9
    if-eqz v6, :cond_e

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v11

    goto :goto_a

    :cond_e
    const/4 v11, -0x1

    .line 336
    .local v11, "skipIndex":I
    :goto_a
    const/4 v12, 0x0

    .line 337
    .local v12, "sumX":F
    const/4 v13, 0x0

    .line 338
    .local v13, "sumY":F
    if-eqz v6, :cond_f

    add-int/lit8 v14, v3, -0x1

    goto :goto_b

    :cond_f
    move v14, v3

    .line 339
    .local v14, "div":I
    :goto_b
    const/4 v15, 0x0

    .line 340
    .local v15, "focusXFloat":F
    const/16 v16, 0x0

    .line 341
    .local v16, "focusYFloat":F
    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v17

    if-eqz v17, :cond_11

    .line 344
    iget v15, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartX:F

    .line 345
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->anchoredZoomStartY:F

    .line 346
    .end local v16    # "focusYFloat":F
    .local v5, "focusYFloat":F
    nop

    .line 347
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    move-result v16

    cmpg-float v16, v16, v5

    if-gez v16, :cond_10

    .line 348
    move/from16 v8, v18

    goto :goto_c

    .line 350
    :cond_10
    const/4 v8, 0x0

    .line 346
    :goto_c
    iput-boolean v8, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventBeforeOrAboveStartingGestureEvent:Z

    goto :goto_e

    .line 353
    .end local v5    # "focusYFloat":F
    .restart local v16    # "focusYFloat":F
    :cond_11
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_d
    if-ge v5, v3, :cond_13

    .line 354
    if-eq v11, v5, :cond_12

    .line 355
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    add-float/2addr v12, v8

    .line 356
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    add-float/2addr v13, v8

    .line 353
    :cond_12
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 358
    .end local v5    # "i":I
    :cond_13
    int-to-float v5, v14

    div-float v15, v12, v5

    .line 359
    int-to-float v5, v14

    div-float v5, v13, v5

    .line 363
    .end local v16    # "focusYFloat":F
    .local v5, "focusYFloat":F
    :goto_e
    const/4 v8, 0x0

    .line 364
    .local v8, "devSumX":F
    const/16 v16, 0x0

    .line 365
    .local v16, "devSumY":F
    const/16 v19, 0x0

    move/from16 v40, v19

    move/from16 v19, v4

    move/from16 v4, v40

    .local v4, "i":I
    .local v19, "isStylusButtonDown":Z
    :goto_f
    if-ge v4, v3, :cond_15

    .line 366
    if-eq v11, v4, :cond_14

    .line 369
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v20

    sub-float v20, v20, v15

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v8, v8, v20

    .line 370
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    sub-float v20, v20, v5

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v16, v16, v20

    .line 365
    :cond_14
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    .line 372
    .end local v4    # "i":I
    :cond_15
    int-to-float v4, v14

    div-float v4, v8, v4

    .line 373
    .local v4, "devX":F
    int-to-float v1, v14

    div-float v1, v16, v1

    .line 378
    .local v1, "devY":F
    move/from16 v20, v1

    move/from16 v21, v3

    const/4 v1, 0x2

    .end local v1    # "devY":F
    .end local v3    # "count":I
    .local v20, "devY":F
    .local v21, "count":I
    int-to-float v3, v1

    mul-float v1, v4, v3

    .line 379
    .local v1, "spanX":F
    mul-float v3, v3, v20

    .line 381
    .local v3, "spanY":F
    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v22

    if-eqz v22, :cond_16

    .line 382
    move/from16 v23, v4

    move/from16 v22, v5

    move/from16 v25, v6

    move/from16 v24, v7

    move v4, v3

    goto :goto_10

    .line 384
    :cond_16
    move/from16 v23, v4

    move/from16 v22, v5

    .end local v4    # "devX":F
    .end local v5    # "focusYFloat":F
    .local v22, "focusYFloat":F
    .local v23, "devX":F
    float-to-double v4, v1

    move/from16 v25, v6

    move/from16 v24, v7

    .end local v6    # "pointerUp":Z
    .end local v7    # "anchoredZoomCancelled":Z
    .local v24, "anchoredZoomCancelled":Z
    .local v25, "pointerUp":Z
    float-to-double v6, v3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    double-to-float v4, v4

    .line 381
    :goto_10
    nop

    .line 380
    nop

    .line 390
    .local v4, "span":F
    iget-boolean v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    .line 391
    .local v5, "wasInProgress":Z
    invoke-static {v15}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v6

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusX:I

    .line 392
    invoke-static/range {v22 .. v22}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v6

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusY:I

    .line 393
    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v6

    if-nez v6, :cond_19

    iget-boolean v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    if-eqz v6, :cond_19

    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->minSpan:I

    int-to-float v6, v6

    cmpg-float v6, v4, v6

    if-ltz v6, :cond_18

    if-eqz v10, :cond_17

    goto :goto_11

    :cond_17
    move/from16 v33, v5

    move/from16 v32, v8

    goto :goto_12

    .line 394
    :cond_18
    :goto_11
    iget-object v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    .line 395
    new-instance v26, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$End;

    move/from16 v32, v8

    .end local v8    # "devSumX":F
    .local v32, "devSumX":F
    iget-wide v7, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    move/from16 v33, v5

    .end local v5    # "wasInProgress":Z
    .local v33, "wasInProgress":Z
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusX:I

    move/from16 v29, v5

    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusY:I

    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->getIncrementalScaleFactor()F

    move-result v31

    move/from16 v30, v5

    move-wide/from16 v27, v7

    invoke-direct/range {v26 .. v31}, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$End;-><init>(JIIF)V

    move-object/from16 v5, v26

    check-cast v5, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;

    .line 394
    invoke-interface {v6, v5}, Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;->onZoomEvent(Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;)Z

    .line 397
    const/4 v5, 0x0

    iput-boolean v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    .line 398
    iput v4, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    goto :goto_12

    .line 393
    .end local v32    # "devSumX":F
    .end local v33    # "wasInProgress":Z
    .restart local v5    # "wasInProgress":Z
    .restart local v8    # "devSumX":F
    :cond_19
    move/from16 v33, v5

    move/from16 v32, v8

    .line 400
    .end local v5    # "wasInProgress":Z
    .end local v8    # "devSumX":F
    .restart local v32    # "devSumX":F
    .restart local v33    # "wasInProgress":Z
    :goto_12
    if-eqz v10, :cond_1a

    .line 401
    iput v1, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    .line 402
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanX:F

    .line 403
    iput v3, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    .line 404
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanY:F

    .line 405
    iput v4, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    .line 406
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    .line 407
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    iput v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    .line 409
    :cond_1a
    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->inAnchoredZoomMode()Z

    move-result v5

    if-eqz v5, :cond_1b

    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->spanSlop:I

    goto :goto_13

    :cond_1b
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->minSpan:I

    .line 410
    .local v5, "minSpan":I
    :goto_13
    nop

    .line 411
    iget-boolean v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    if-nez v6, :cond_1f

    .line 412
    int-to-float v6, v5

    cmpl-float v6, v4, v6

    if-ltz v6, :cond_1e

    .line 413
    if-nez v33, :cond_1d

    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->initialSpan:F

    sub-float v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->spanSlop:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_1c

    goto :goto_14

    :cond_1c
    move/from16 v26, v5

    move/from16 v17, v9

    move/from16 v27, v10

    goto :goto_15

    .line 415
    :cond_1d
    :goto_14
    iput v1, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    .line 416
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanX:F

    .line 417
    iput v3, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    .line 418
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanY:F

    .line 419
    iput v4, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    .line 420
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    .line 421
    iget-wide v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    iput-wide v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->prevTime:J

    .line 422
    iget-object v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    new-instance v7, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Begin;

    move/from16 v17, v9

    .end local v9    # "streamComplete":Z
    .local v17, "streamComplete":Z
    iget-wide v8, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    move/from16 v26, v5

    .end local v5    # "minSpan":I
    .local v26, "minSpan":I
    iget v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusX:I

    move/from16 v27, v10

    .end local v10    # "configChanged":Z
    .local v27, "configChanged":Z
    iget v10, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusY:I

    invoke-direct {v7, v8, v9, v5, v10}, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Begin;-><init>(JII)V

    check-cast v7, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;

    invoke-interface {v6, v7}, Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;->onZoomEvent(Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;)Z

    move-result v5

    iput-boolean v5, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    goto :goto_15

    .line 412
    .end local v17    # "streamComplete":Z
    .end local v26    # "minSpan":I
    .end local v27    # "configChanged":Z
    .restart local v5    # "minSpan":I
    .restart local v9    # "streamComplete":Z
    .restart local v10    # "configChanged":Z
    :cond_1e
    move/from16 v26, v5

    move/from16 v17, v9

    move/from16 v27, v10

    .end local v5    # "minSpan":I
    .end local v9    # "streamComplete":Z
    .end local v10    # "configChanged":Z
    .restart local v17    # "streamComplete":Z
    .restart local v26    # "minSpan":I
    .restart local v27    # "configChanged":Z
    goto :goto_15

    .line 411
    .end local v17    # "streamComplete":Z
    .end local v26    # "minSpan":I
    .end local v27    # "configChanged":Z
    .restart local v5    # "minSpan":I
    .restart local v9    # "streamComplete":Z
    .restart local v10    # "configChanged":Z
    :cond_1f
    move/from16 v26, v5

    move/from16 v17, v9

    move/from16 v27, v10

    .line 426
    .end local v5    # "minSpan":I
    .end local v9    # "streamComplete":Z
    .end local v10    # "configChanged":Z
    .restart local v17    # "streamComplete":Z
    .restart local v26    # "minSpan":I
    .restart local v27    # "configChanged":Z
    :goto_15
    const/4 v5, 0x2

    if-ne v2, v5, :cond_21

    .line 427
    iput v1, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    .line 428
    iput v3, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    .line 429
    iput v4, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    .line 431
    const/4 v5, 0x1

    .line 433
    .local v5, "updatePrev":Z
    iget-boolean v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->isInProgress:Z

    if-eqz v6, :cond_20

    .line 435
    iget-object v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->listener:Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;

    .line 436
    new-instance v34, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Move;

    iget-wide v7, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    iget v9, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusX:I

    iget v10, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->focusY:I

    invoke-direct {v0}, Landroidx/camera/view/impl/ZoomGestureDetector;->getIncrementalScaleFactor()F

    move-result v39

    move-wide/from16 v35, v7

    move/from16 v37, v9

    move/from16 v38, v10

    invoke-direct/range {v34 .. v39}, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent$Move;-><init>(JIIF)V

    move-object/from16 v7, v34

    check-cast v7, Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;

    .line 435
    invoke-interface {v6, v7}, Landroidx/camera/view/impl/ZoomGestureDetector$OnZoomGestureListener;->onZoomEvent(Landroidx/camera/view/impl/ZoomGestureDetector$ZoomEvent;)Z

    move-result v6

    .line 434
    move v5, v6

    .line 440
    :cond_20
    if-eqz v5, :cond_21

    .line 441
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanX:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanX:F

    .line 442
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpanY:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpanY:F

    .line 443
    iget v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->currentSpan:F

    iput v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->previousSpan:F

    .line 444
    iget-wide v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->eventTime:J

    iput-wide v6, v0, Landroidx/camera/view/impl/ZoomGestureDetector;->prevTime:J

    .line 447
    .end local v5    # "updatePrev":Z
    :cond_21
    return v18
.end method

.method public final setQuickZoomEnabled(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 184
    iput-boolean p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isQuickZoomEnabled:Z

    return-void
.end method

.method public final setStylusZoomEnabled(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 192
    iput-boolean p1, p0, Landroidx/camera/view/impl/ZoomGestureDetector;->isStylusZoomEnabled:Z

    return-void
.end method
