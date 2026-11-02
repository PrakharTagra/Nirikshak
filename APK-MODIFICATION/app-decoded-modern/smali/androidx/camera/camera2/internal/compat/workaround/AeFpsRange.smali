.class public Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;
.super Ljava/lang/Object;
.source "AeFpsRange.java"


# instance fields
.field private final mAeTargetFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 2
    .param p1, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/AeFpsRangeLegacyQuirk;

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/AeFpsRangeLegacyQuirk;

    .line 44
    .local v0, "quirk":Landroidx/camera/camera2/internal/compat/quirk/AeFpsRangeLegacyQuirk;
    if-nez v0, :cond_0

    .line 45
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;->mAeTargetFpsRange:Landroid/util/Range;

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/quirk/AeFpsRangeLegacyQuirk;->getRange()Landroid/util/Range;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;->mAeTargetFpsRange:Landroid/util/Range;

    .line 49
    :goto_0
    return-void
.end method


# virtual methods
.method public addAeFpsRangeOptions(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V
    .locals 3
    .param p1, "configBuilder"    # Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 57
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;->mAeTargetFpsRange:Landroid/util/Range;

    if-eqz v0, :cond_0

    .line 58
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;->mAeTargetFpsRange:Landroid/util/Range;

    sget-object v2, Landroidx/camera/core/impl/Config$OptionPriority;->REQUIRED:Landroidx/camera/core/impl/Config$OptionPriority;

    invoke-virtual {p1, v0, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOptionWithPriority(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;Landroidx/camera/core/impl/Config$OptionPriority;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 62
    :cond_0
    return-void
.end method
