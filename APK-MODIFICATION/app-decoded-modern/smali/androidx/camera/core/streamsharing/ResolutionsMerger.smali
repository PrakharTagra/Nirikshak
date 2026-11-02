.class public Landroidx/camera/core/streamsharing/ResolutionsMerger;
.super Ljava/lang/Object;
.source "ResolutionsMerger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;
    }
.end annotation


# static fields
.field private static final SAME_AREA_WIDTH_HEIGHT_RATIO:D

.field private static final TAG:Ljava/lang/String; = "ResolutionsMerger"


# instance fields
.field private final mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

.field private final mChildSizesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mChildrenConfigs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mFallbackAspectRatio:Landroid/util/Rational;

.field private final mSensorAspectRatio:Landroid/util/Rational;

.field private final mSensorSize:Landroid/util/Size;

.field private final mSizeSorter:Landroidx/camera/core/internal/SupportedOutputSizesSorter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 71
    const-wide v0, 0x4002f684bda12f68L    # 2.3703703703703702

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    sput-wide v0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->SAME_AREA_WIDTH_HEIGHT_RATIO:D

    return-void
.end method

.method private constructor <init>(Landroid/util/Size;Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Set;)V
    .locals 1
    .param p1, "sensorSize"    # Landroid/util/Size;
    .param p2, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)V"
        }
    .end annotation

    .line 96
    .local p3, "childrenConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;

    invoke-direct {v0, p2, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Size;)V

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;-><init>(Landroid/util/Size;Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Set;Landroidx/camera/core/internal/SupportedOutputSizesSorter;)V

    .line 98
    return-void
.end method

.method constructor <init>(Landroid/util/Size;Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Set;Landroidx/camera/core/internal/SupportedOutputSizesSorter;)V
    .locals 1
    .param p1, "sensorSize"    # Landroid/util/Size;
    .param p2, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p4, "supportedOutputSizesSorter"    # Landroidx/camera/core/internal/SupportedOutputSizesSorter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Landroidx/camera/core/internal/SupportedOutputSizesSorter;",
            ")V"
        }
    .end annotation

    .line 103
    .local p3, "childrenConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildSizesCache:Ljava/util/Map;

    .line 104
    iput-object p1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorSize:Landroid/util/Size;

    .line 105
    invoke-static {p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSensorAspectRatio(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorAspectRatio:Landroid/util/Rational;

    .line 106
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorAspectRatio:Landroid/util/Rational;

    invoke-static {v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getFallbackAspectRatio(Landroid/util/Rational;)Landroid/util/Rational;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mFallbackAspectRatio:Landroid/util/Rational;

    .line 107
    iput-object p2, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 108
    iput-object p3, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildrenConfigs:Ljava/util/Set;

    .line 109
    iput-object p4, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSizeSorter:Landroidx/camera/core/internal/SupportedOutputSizesSorter;

    .line 110
    return-void
.end method

.method constructor <init>(Landroidx/camera/core/impl/CameraInternal;Ljava/util/Set;)V
    .locals 2
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)V"
        }
    .end annotation

    .line 90
    .local p2, "childrenConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->getSensorRect()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v0

    .line 91
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v1

    .line 90
    invoke-direct {p0, v0, v1, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;-><init>(Landroid/util/Size;Landroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Set;)V

    .line 92
    return-void
.end method

.method static synthetic access$000(Landroid/util/Rational;Landroid/util/Rational;)F
    .locals 1
    .param p0, "x0"    # Landroid/util/Rational;
    .param p1, "x1"    # Landroid/util/Rational;

    .line 67
    invoke-static {p0, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->computeAreaOverlapping(Landroid/util/Rational;Landroid/util/Rational;)F

    move-result v0

    return v0
.end method

.method private areCroppingInDifferentDirection(FFF)Z
    .locals 3
    .param p1, "sensorRatioValue"    # F
    .param p2, "parentRatioValue"    # F
    .param p3, "childRatioValue"    # F

    .line 535
    cmpl-float v0, p1, p2

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    cmpl-float v0, p2, p3

    if-nez v0, :cond_0

    goto :goto_0

    .line 541
    :cond_0
    cmpl-float v0, p1, p2

    const/4 v2, 0x1

    if-lez v0, :cond_2

    .line 542
    cmpg-float v0, p2, p3

    if-gez v0, :cond_1

    move v1, v2

    :cond_1
    return v1

    .line 544
    :cond_2
    cmpl-float v0, p2, p3

    if-lez v0, :cond_3

    move v1, v2

    :cond_3
    return v1

    .line 536
    :cond_4
    :goto_0
    return v1
.end method

.method private static computeAreaOverlapping(Landroid/util/Rational;Landroid/util/Rational;)F
    .locals 3
    .param p0, "croppingRatio"    # Landroid/util/Rational;
    .param p1, "baseRatio"    # Landroid/util/Rational;

    .line 849
    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    .line 850
    .local v0, "croppingRatioValue":F
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v1

    .line 852
    .local v1, "baseRatioValue":F
    cmpl-float v2, v0, v1

    if-lez v2, :cond_0

    div-float v2, v1, v0

    goto :goto_0

    .line 853
    :cond_0
    div-float v2, v0, v1

    .line 852
    :goto_0
    return v2
.end method

.method private filterOutChildSizesCausingDoubleCropping(Landroid/util/Rational;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .param p1, "parentAspectRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 499
    .local p2, "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 500
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 501
    .local v2, "childSize":Landroid/util/Size;
    invoke-direct {p0, p1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->isDoubleCropping(Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 502
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    .end local v2    # "childSize":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 506
    :cond_1
    return-object v0
.end method

.method private static filterOutChildSizesThatWillNeverBeSelected(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 728
    .local p0, "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 729
    .local v0, "smallestSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Landroid/util/Size;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 730
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 732
    .local v3, "size":Landroid/util/Size;
    const/4 v4, 0x0

    .line 733
    .local v4, "keyRatio":Landroid/util/Rational;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Rational;

    .line 734
    .local v6, "seenRatio":Landroid/util/Rational;
    invoke-static {v3, v6}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 735
    move-object v4, v6

    .line 736
    goto :goto_2

    .line 738
    .end local v6    # "seenRatio":Landroid/util/Rational;
    :cond_1
    goto :goto_1

    .line 740
    :cond_2
    :goto_2
    if-eqz v4, :cond_4

    .line 742
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    .line 743
    .local v5, "smallestSize":Landroid/util/Size;
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v6

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v7

    if-gt v6, v7, :cond_0

    .line 744
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v6

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-gt v6, v7, :cond_0

    .line 745
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v6

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-ne v6, v7, :cond_3

    .line 746
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v6

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v7

    if-ne v6, v7, :cond_3

    .line 747
    goto :goto_0

    .line 749
    .end local v5    # "smallestSize":Landroid/util/Size;
    :cond_3
    goto :goto_3

    .line 750
    :cond_4
    invoke-static {v3}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v4

    .line 753
    :goto_3
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 754
    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 755
    .end local v3    # "size":Landroid/util/Size;
    .end local v4    # "keyRatio":Landroid/util/Rational;
    goto :goto_0

    .line 757
    :cond_5
    return-object v1
.end method

.method static filterOutParentSizeThatIsTooSmall(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 706
    .local p0, "childSizes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/util/Size;>;"
    .local p1, "parentSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 710
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 711
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 712
    .local v2, "parentSize":Landroid/util/Size;
    invoke-static {p0, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->isAnyChildSizeCanBeCroppedOutWithoutUpscalingParent(Ljava/util/Collection;Landroid/util/Size;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 713
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 715
    .end local v2    # "parentSize":Landroid/util/Size;
    :cond_1
    goto :goto_0

    .line 717
    :cond_2
    return-object v0

    .line 707
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_3
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method static filterResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .param p0, "aspectRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 684
    .local p1, "resolutionsToFilter":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 685
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 686
    .local v2, "resolution":Landroid/util/Size;
    invoke-static {v2, p0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 687
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 689
    .end local v2    # "resolution":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 691
    :cond_1
    return-object v0
.end method

.method private static findCloserAspectRatio(Landroid/util/Size;)Landroid/util/Rational;
    .locals 4
    .param p0, "size"    # Landroid/util/Size;

    .line 598
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-double v0, v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v0, v2

    .line 600
    .local v0, "widthHeightRatio":D
    sget-wide v2, Landroidx/camera/core/streamsharing/ResolutionsMerger;->SAME_AREA_WIDTH_HEIGHT_RATIO:D

    cmpl-double v2, v0, v2

    if-lez v2, :cond_0

    .line 601
    sget-object v2, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    return-object v2

    .line 603
    :cond_0
    sget-object v2, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    return-object v2
.end method

.method private getCameraSupportedHighResolutions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 277
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

    const/16 v1, 0x22

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedHighResolutions(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private getCameraSupportedResolutions()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 272
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

    const/16 v1, 0x22

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static getCenterCroppedRectangle(Landroid/util/Rational;Landroid/util/Size;)Landroid/graphics/Rect;
    .locals 9
    .param p0, "cropRatio"    # Landroid/util/Rational;
    .param p1, "baseSize"    # Landroid/util/Size;

    .line 617
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 618
    .local v0, "width":I
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 619
    .local v1, "height":I
    invoke-static {p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v2

    .line 622
    .local v2, "referenceRatio":Landroid/util/Rational;
    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v3

    invoke-virtual {v2}, Landroid/util/Rational;->floatValue()F

    move-result v4

    cmpl-float v3, v3, v4

    const/4 v4, 0x0

    if-nez v3, :cond_0

    .line 623
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v5, v0

    int-to-float v6, v1

    invoke-direct {v3, v4, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .local v3, "cropRectInFloat":Landroid/graphics/RectF;
    goto :goto_0

    .line 624
    .end local v3    # "cropRectInFloat":Landroid/graphics/RectF;
    :cond_0
    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v3

    invoke-virtual {v2}, Landroid/util/Rational;->floatValue()F

    move-result v5

    cmpl-float v3, v3, v5

    const/high16 v5, 0x40000000    # 2.0f

    if-lez v3, :cond_1

    .line 625
    int-to-float v3, v0

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v6

    div-float/2addr v3, v6

    .line 626
    .local v3, "cropHeight":F
    int-to-float v6, v1

    sub-float/2addr v6, v3

    div-float/2addr v6, v5

    .line 627
    .local v6, "yOffset":F
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v7, v0

    add-float v8, v6, v3

    invoke-direct {v5, v4, v6, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object v3, v5

    .line 628
    .end local v6    # "yOffset":F
    .local v3, "cropRectInFloat":Landroid/graphics/RectF;
    goto :goto_0

    .line 629
    .end local v3    # "cropRectInFloat":Landroid/graphics/RectF;
    :cond_1
    int-to-float v3, v1

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v6

    mul-float/2addr v3, v6

    .line 630
    .local v3, "cropWidth":F
    int-to-float v6, v0

    sub-float/2addr v6, v3

    div-float/2addr v6, v5

    .line 631
    .local v6, "xOffset":F
    new-instance v5, Landroid/graphics/RectF;

    add-float v7, v6, v3

    int-to-float v8, v1

    invoke-direct {v5, v6, v4, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object v3, v5

    .line 635
    .end local v6    # "xOffset":F
    .local v3, "cropRectInFloat":Landroid/graphics/RectF;
    :goto_0
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 636
    .local v4, "result":Landroid/graphics/Rect;
    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 638
    return-object v4
.end method

.method private getChildrenRequiredResolutions()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 487
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 488
    .local v0, "result":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    iget-object v1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildrenConfigs:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 489
    .local v2, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSortedChildSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v3

    .line 490
    .local v3, "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 491
    .end local v2    # "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v3    # "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 493
    :cond_0
    return-object v0
.end method

.method static getCropRectOfReferenceAspectRatio(Landroid/util/Size;Landroid/util/Size;)Landroid/graphics/Rect;
    .locals 2
    .param p0, "targetSize"    # Landroid/util/Size;
    .param p1, "referenceSize"    # Landroid/util/Size;

    .line 564
    invoke-static {p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    .line 565
    .local v0, "referenceRatio":Landroid/util/Rational;
    invoke-static {v0, p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getCenterCroppedRectangle(Landroid/util/Rational;Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v1

    return-object v1
.end method

.method private static getFallbackAspectRatio(Landroid/util/Rational;)Landroid/util/Rational;
    .locals 3
    .param p0, "sensorAspectRatio"    # Landroid/util/Rational;

    .line 649
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-virtual {p0, v0}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 650
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    return-object v0

    .line 651
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-virtual {p0, v0}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 652
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    return-object v0

    .line 654
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid sensor aspect-ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static getParentSizesThatAreTooLarge(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 783
    .local p0, "childSizes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/util/Size;>;"
    .local p1, "parentSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 789
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->removeDuplicates(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 791
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 792
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 793
    .local v2, "parentSize":Landroid/util/Size;
    invoke-static {p0, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->isAllChildSizesCanBeCroppedOutWithoutUpscalingParent(Ljava/util/Collection;Landroid/util/Size;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 794
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 796
    .end local v2    # "parentSize":Landroid/util/Size;
    :cond_1
    goto :goto_0

    .line 800
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 801
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 804
    :cond_3
    return-object v0

    .line 784
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_4
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method private getPreferredChildSizePairInternal(Landroid/graphics/Rect;Landroidx/camera/core/impl/UseCaseConfig;Z)Landroid/util/Pair;
    .locals 3
    .param p1, "parentCropRect"    # Landroid/graphics/Rect;
    .param p3, "isViewportSet"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;Z)",
            "Landroid/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 187
    .local p2, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    if-eqz p3, :cond_0

    .line 188
    move-object v0, p1

    .line 192
    .local v0, "cropRectBeforeScaling":Landroid/graphics/Rect;
    invoke-static {p1}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v1

    .line 193
    .local v1, "viewPortSize":Landroid/util/Size;
    invoke-virtual {p0, v1, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getPreferredChildSizeForViewport(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;)Landroid/util/Size;

    move-result-object v1

    .line 194
    .local v1, "childSizeToScale":Landroid/util/Size;
    goto :goto_0

    .line 195
    .end local v0    # "cropRectBeforeScaling":Landroid/graphics/Rect;
    .end local v1    # "childSizeToScale":Landroid/util/Size;
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v0

    .line 196
    .local v0, "parentSize":Landroid/util/Size;
    invoke-virtual {p0, v0, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getPreferredChildSize(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;)Landroid/util/Size;

    move-result-object v1

    .line 197
    .restart local v1    # "childSizeToScale":Landroid/util/Size;
    invoke-static {v0, v1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getCropRectOfReferenceAspectRatio(Landroid/util/Size;Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v2

    move-object v0, v2

    .line 200
    .local v0, "cropRectBeforeScaling":Landroid/graphics/Rect;
    :goto_0
    new-instance v2, Landroid/util/Pair;

    invoke-direct {v2, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static getSensorAspectRatio(Landroid/util/Size;)Landroid/util/Rational;
    .locals 3
    .param p0, "sensorSize"    # Landroid/util/Size;

    .line 589
    invoke-static {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->findCloserAspectRatio(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    .line 590
    .local v0, "result":Landroid/util/Rational;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The closer aspect ratio to the sensor size ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ResolutionsMerger"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    return-object v0
.end method

.method private getSortedChildSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 458
    .local p1, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildrenConfigs:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 464
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildSizesCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildSizesCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 468
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSizeSorter:Landroidx/camera/core/internal/SupportedOutputSizesSorter;

    invoke-virtual {v0, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getSortedSupportedOutputSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v0

    .line 469
    .local v0, "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-static {v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->filterOutChildSizesThatWillNeverBeSelected(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 470
    iget-object v1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildSizesCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    return-object v0

    .line 459
    .end local v0    # "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid child config: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getSupportedPrivResolutions(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 571
    .local p0, "supportedResolutionsMap":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 572
    .local v1, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    const/16 v3, 0x22

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 573
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, [Landroid/util/Size;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 575
    .end local v1    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    :cond_0
    goto :goto_0

    .line 577
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method private groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/Map<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 410
    .local p1, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 413
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 418
    .local v1, "ratios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    sget-object v2, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    sget-object v2, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 422
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 423
    .local v3, "size":Landroid/util/Size;
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-gtz v4, :cond_0

    .line 424
    goto :goto_0

    .line 428
    :cond_0
    const/4 v4, 0x0

    .line 429
    .local v4, "group":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Rational;

    .line 430
    .local v6, "ratio":Landroid/util/Rational;
    invoke-static {v3, v6}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 431
    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v4, v5

    check-cast v4, Ljava/util/List;

    .line 432
    goto :goto_2

    .line 434
    .end local v6    # "ratio":Landroid/util/Rational;
    :cond_1
    goto :goto_1

    .line 437
    :cond_2
    :goto_2
    if-nez v4, :cond_3

    .line 438
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v5

    .line 439
    invoke-static {v3}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v5

    .line 440
    .local v5, "newRatio":Landroid/util/Rational;
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    .end local v5    # "newRatio":Landroid/util/Rational;
    :cond_3
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 445
    .end local v3    # "size":Landroid/util/Size;
    .end local v4    # "group":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 447
    :cond_4
    return-object v0
.end method

.method static hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z
    .locals 2
    .param p0, "childSize"    # Landroid/util/Size;
    .param p1, "parentSize"    # Landroid/util/Size;

    .line 824
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 825
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 824
    :goto_1
    return v0
.end method

.method private static isAllChildSizesCanBeCroppedOutWithoutUpscalingParent(Ljava/util/Collection;Landroid/util/Size;)Z
    .locals 3
    .param p1, "parentSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            ")Z"
        }
    .end annotation

    .line 809
    .local p0, "childSizes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 810
    .local v1, "childSize":Landroid/util/Size;
    invoke-static {v1, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 811
    const/4 v0, 0x0

    return v0

    .line 813
    .end local v1    # "childSize":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 815
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static isAnyChildSizeCanBeCroppedOutWithoutUpscalingParent(Ljava/util/Collection;Landroid/util/Size;)Z
    .locals 3
    .param p1, "parentSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            ")Z"
        }
    .end annotation

    .line 762
    .local p0, "childSizes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 763
    .local v1, "childSize":Landroid/util/Size;
    invoke-static {v1, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 764
    const/4 v0, 0x1

    return v0

    .line 766
    .end local v1    # "childSize":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 768
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private isDoubleCropping(Landroid/util/Rational;Landroid/util/Size;)Z
    .locals 3
    .param p1, "parentRatio"    # Landroid/util/Rational;
    .param p2, "childSize"    # Landroid/util/Size;

    .line 512
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorAspectRatio:Landroid/util/Rational;

    invoke-virtual {v0, p1}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2, p1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 519
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorAspectRatio:Landroid/util/Rational;

    .line 520
    invoke-virtual {v0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    .line 521
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v1

    .line 522
    invoke-static {p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRationalWithMod16Considered(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Rational;->floatValue()F

    move-result v2

    .line 519
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->areCroppingInDifferentDirection(FFF)Z

    move-result v0

    return v0

    .line 514
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private isDoubleCropping(Landroid/util/Size;Landroid/util/Size;)Z
    .locals 2
    .param p1, "parentSize"    # Landroid/util/Size;
    .param p2, "childSize"    # Landroid/util/Size;

    .line 527
    invoke-static {p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRationalWithMod16Considered(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    .line 528
    .local v0, "parentRatio":Landroid/util/Rational;
    invoke-direct {p0, v0, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->isDoubleCropping(Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v1

    return v1
.end method

.method private needToAddSensorResolutions()Z
    .locals 3

    .line 477
    invoke-direct {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getChildrenRequiredResolutions()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 478
    .local v1, "size":Landroid/util/Size;
    iget-object v2, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mFallbackAspectRatio:Landroid/util/Rational;

    invoke-static {v1, v2}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 479
    const/4 v0, 0x1

    return v0

    .line 481
    .end local v1    # "size":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 482
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static removeDuplicates(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 669
    .local p0, "resolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 670
    return-object p0

    .line 672
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1, p0}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method static reverseRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 5
    .param p0, "rect"    # Landroid/graphics/Rect;

    .line 611
    new-instance v0, Landroid/graphics/Rect;

    iget v1, p0, Landroid/graphics/Rect;->top:I

    iget v2, p0, Landroid/graphics/Rect;->left:I

    iget v3, p0, Landroid/graphics/Rect;->bottom:I

    iget v4, p0, Landroid/graphics/Rect;->right:I

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method

.method private selectOtherAspectRatioParentResolutionsWithFovPriority(Ljava/util/List;Z)Ljava/util/List;
    .locals 7
    .param p2, "allowDoubleCropping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;Z)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 386
    .local p1, "candidates":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 390
    .local v0, "ratioToSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 391
    .local v1, "ratios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    invoke-direct {p0, v1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->sortByFov(Ljava/util/List;)V

    .line 395
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 396
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Rational;

    .line 397
    .local v4, "ratio":Landroid/util/Rational;
    sget-object v5, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-virtual {v4, v5}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-virtual {v4, v5}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 398
    goto :goto_0

    .line 401
    :cond_1
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 402
    .local v5, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0, v4, v5, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectParentResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 403
    .end local v4    # "ratio":Landroid/util/Rational;
    .end local v5    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 405
    :cond_2
    return-object v2
.end method

.method private selectParentResolutions(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 316
    .local p1, "candidateParentResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 319
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->needToAddSensorResolutions()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 320
    iget-object v1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorAspectRatio:Landroid/util/Rational;

    invoke-direct {p0, v1, p1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectParentResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 325
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mFallbackAspectRatio:Landroid/util/Rational;

    invoke-direct {p0, v1, p1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectParentResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 329
    invoke-direct {p0, p1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectOtherAspectRatioParentResolutionsWithFovPriority(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 332
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const-string v2, "ResolutionsMerger"

    if-eqz v1, :cond_1

    .line 337
    const-string v1, "Failed to find a parent resolution that does not result in double-cropping, this might due to camera not supporting 4:3 and 16:9resolutions or a strict ResolutionSelector settings. Starting resolution selection process with resolutions that might have a smaller FOV."

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectOtherAspectRatioParentResolutionsWithFovPriority(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 345
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parent resolutions: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    return-object v0
.end method

.method private selectParentResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;Z)Ljava/util/List;
    .locals 6
    .param p1, "aspectRatio"    # Landroid/util/Rational;
    .param p3, "allowDoubleCropping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;Z)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 352
    .local p2, "candidateParentResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-static {p1, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->filterResolutionsByAspectRatio(Landroid/util/Rational;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 354
    .local v0, "candidates":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-static {v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->sortInDescendingOrder(Ljava/util/List;)V

    .line 357
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 358
    .local v1, "sizesTooLarge":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    iget-object v2, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildrenConfigs:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 359
    .local v3, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, v3}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSortedChildSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v4

    .line 360
    .local v4, "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez p3, :cond_0

    .line 361
    invoke-direct {p0, p1, v4}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->filterOutChildSizesCausingDoubleCropping(Landroid/util/Rational;Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 363
    :cond_0
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 366
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    return-object v2

    .line 369
    :cond_1
    invoke-static {v4, v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->filterOutParentSizeThatIsTooSmall(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 370
    invoke-static {v4, v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getParentSizesThatAreTooLarge(Ljava/util/Collection;Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 371
    .end local v3    # "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "childSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 374
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 375
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Size;

    .line 376
    .local v4, "candidate":Landroid/util/Size;
    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 377
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    .end local v4    # "candidate":Landroid/util/Size;
    :cond_3
    goto :goto_1

    .line 380
    :cond_4
    return-object v2
.end method

.method private shouldIncludeHighResolutions()Z
    .locals 5

    .line 283
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mChildrenConfigs:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 284
    .local v1, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->isHighResolutionDisabled(Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 285
    goto :goto_0

    .line 288
    :cond_0
    instance-of v2, v1, Landroidx/camera/core/impl/ImageOutputConfig;

    if-eqz v2, :cond_1

    .line 289
    move-object v2, v1

    check-cast v2, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 290
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v2

    .line 291
    .local v2, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 293
    return v4

    .line 296
    .end local v1    # "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v2    # "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    :cond_1
    goto :goto_0

    .line 298
    :cond_2
    return v2
.end method

.method private sortByFov(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Rational;",
            ">;)V"
        }
    .end annotation

    .line 552
    .local p1, "ratios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger;->mSensorSize:Landroid/util/Size;

    invoke-static {v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    .line 553
    .local v0, "actualSensorAspectRatio":Landroid/util/Rational;
    new-instance v1, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;-><init>(Landroid/util/Rational;Z)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 555
    return-void
.end method

.method static sortInDescendingOrder(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)V"
        }
    .end annotation

    .line 663
    .local p0, "resolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 664
    return-void
.end method

.method private static toRational(Landroid/util/Size;)Landroid/util/Rational;
    .locals 3
    .param p0, "size"    # Landroid/util/Size;

    .line 844
    new-instance v0, Landroid/util/Rational;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    return-object v0
.end method

.method private static toRationalWithMod16Considered(Landroid/util/Size;)Landroid/util/Rational;
    .locals 1
    .param p0, "size"    # Landroid/util/Size;

    .line 833
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-static {p0, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 834
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    return-object v0

    .line 835
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-static {p0, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 836
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    return-object v0

    .line 838
    :cond_1
    invoke-static {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->toRational(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method getMergedResolutions(Landroidx/camera/core/impl/MutableConfig;)Ljava/util/List;
    .locals 3
    .param p1, "parentConfig"    # Landroidx/camera/core/impl/MutableConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/MutableConfig;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 120
    invoke-direct {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getCameraSupportedResolutions()Ljava/util/List;

    move-result-object v0

    .line 123
    .local v0, "candidateSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->shouldIncludeHighResolutions()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 124
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v0, v1

    .line 125
    invoke-direct {p0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getCameraSupportedHighResolutions()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 130
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_SUPPORTED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    .line 131
    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 132
    .local v1, "parentSupportedSizesMap":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    if-eqz v1, :cond_1

    .line 133
    invoke-static {v1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSupportedPrivResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 136
    :cond_1
    invoke-direct {p0, v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->selectParentResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method getPreferredChildSize(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;)Landroid/util/Size;
    .locals 4
    .param p1, "parentSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 218
    .local p2, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSortedChildSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v0

    .line 219
    .local v0, "candidateChildSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 220
    .local v2, "childSize":Landroid/util/Size;
    invoke-direct {p0, p1, v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->isDoubleCropping(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 221
    goto :goto_0

    .line 224
    :cond_0
    invoke-static {v2, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 225
    return-object v2

    .line 227
    .end local v2    # "childSize":Landroid/util/Size;
    :cond_1
    goto :goto_0

    .line 233
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 234
    .restart local v2    # "childSize":Landroid/util/Size;
    invoke-static {v2, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 235
    return-object v2

    .line 237
    .end local v2    # "childSize":Landroid/util/Size;
    :cond_3
    goto :goto_1

    .line 239
    :cond_4
    return-object p1
.end method

.method getPreferredChildSizeForViewport(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;)Landroid/util/Size;
    .locals 5
    .param p1, "parentSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 256
    .local p2, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getSortedChildSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v0

    .line 258
    .local v0, "candidateChildSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 259
    .local v2, "childSize":Landroid/util/Size;
    nop

    .line 260
    invoke-static {v2, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getCropRectOfReferenceAspectRatio(Landroid/util/Size;Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v3

    .line 259
    invoke-static {v3}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v3

    .line 262
    .local v3, "childSizeToCrop":Landroid/util/Size;
    invoke-static {v3, p1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->hasUpscaling(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 263
    return-object v3

    .line 265
    .end local v2    # "childSize":Landroid/util/Size;
    .end local v3    # "childSizeToCrop":Landroid/util/Size;
    :cond_0
    goto :goto_0

    .line 267
    :cond_1
    return-object p1
.end method

.method getPreferredChildSizePair(Landroidx/camera/core/impl/UseCaseConfig;Landroid/graphics/Rect;IZ)Landroid/util/Pair;
    .locals 5
    .param p2, "parentCropRect"    # Landroid/graphics/Rect;
    .param p3, "sensorToBufferRotationDegrees"    # I
    .param p4, "isViewportSet"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroid/graphics/Rect;",
            "IZ)",
            "Landroid/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 159
    .local p1, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    const/4 v0, 0x0

    .line 160
    .local v0, "isWidthHeightRevertedForComputation":Z
    invoke-static {p3}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    invoke-static {p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->reverseRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p2

    .line 162
    const/4 v0, 0x1

    .line 166
    :cond_0
    invoke-direct {p0, p2, p1, p4}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->getPreferredChildSizePairInternal(Landroid/graphics/Rect;Landroidx/camera/core/impl/UseCaseConfig;Z)Landroid/util/Pair;

    move-result-object v1

    .line 168
    .local v1, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/graphics/Rect;Landroid/util/Size;>;"
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Rect;

    .line 169
    .local v2, "cropRectBeforeScaling":Landroid/graphics/Rect;
    iget-object v3, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Landroid/util/Size;

    .line 172
    .local v3, "childSizeToScale":Landroid/util/Size;
    if-eqz v0, :cond_1

    .line 173
    invoke-static {v3}, Landroidx/camera/core/impl/utils/TransformUtils;->reverseSize(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v3

    .line 174
    invoke-static {v2}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->reverseRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v2

    .line 177
    :cond_1
    new-instance v4, Landroid/util/Pair;

    invoke-direct {v4, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v4
.end method
