.class public Landroidx/camera/core/internal/SupportedOutputSizesSorter;
.super Ljava/lang/Object;
.source "SupportedOutputSizesSorter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SupportedOutputSizesCollector"


# instance fields
.field private final mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

.field private final mFullFovRatio:Landroid/util/Rational;

.field private final mLensFacing:I

.field private final mSensorOrientation:I

.field private final mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Size;)V
    .locals 2
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "activeArraySize"    # Landroid/util/Size;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 78
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSensorOrientation:I

    .line 79
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getLensFacing()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mLensFacing:I

    .line 80
    if-eqz p2, :cond_0

    invoke-direct {p0, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->calculateFullFovRatioFromActiveArraySize(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    goto :goto_0

    .line 81
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-direct {p0, v0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->calculateFullFovRatioFromSupportedOutputSizes(Landroidx/camera/core/impl/CameraInfoInternal;)Landroid/util/Rational;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    .line 83
    new-instance v0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    iget-object v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    invoke-direct {v0, p1, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Rational;)V

    iput-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    .line 85
    return-void
.end method

.method private static applyAspectRatioStrategy(Ljava/util/List;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;Landroid/util/Rational;)Ljava/util/LinkedHashMap;
    .locals 2
    .param p1, "aspectRatioStrategy"    # Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    .param p2, "fullFovRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/AspectRatioStrategy;",
            "Landroid/util/Rational;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 323
    .local p0, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 324
    invoke-static {p0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 327
    .local v0, "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-static {v0, p1, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyAspectRatioStrategyFallbackRule(Ljava/util/Map;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;Landroid/util/Rational;)Ljava/util/LinkedHashMap;

    move-result-object v1

    return-object v1
.end method

.method private static applyAspectRatioStrategyFallbackRule(Ljava/util/Map;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;Landroid/util/Rational;)Ljava/util/LinkedHashMap;
    .locals 7
    .param p1, "aspectRatioStrategy"    # Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    .param p2, "fullFovRatio"    # Landroid/util/Rational;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/core/resolutionselector/AspectRatioStrategy;",
            "Landroid/util/Rational;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 345
    .local p0, "sizeGroupsMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    const/4 v0, 0x1

    if-eqz p2, :cond_1

    .line 346
    nop

    .line 345
    invoke-virtual {p2}, Landroid/util/Rational;->getNumerator()I

    move-result v1

    .line 346
    invoke-virtual {p2}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    if-lt v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    nop

    .line 347
    .local v0, "isSensorLandscapeResolution":Z
    :goto_1
    nop

    .line 348
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getPreferredAspectRatio()I

    move-result v1

    .line 347
    invoke-static {v1, v0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;

    move-result-object v1

    .line 352
    .local v1, "aspectRatio":Landroid/util/Rational;
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getFallbackRule()I

    move-result v2

    if-nez v2, :cond_3

    .line 353
    nop

    .line 354
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getPreferredAspectRatio()I

    move-result v2

    .line 353
    invoke-static {v2, v0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;

    move-result-object v2

    .line 355
    .local v2, "preferredAspectRatio":Landroid/util/Rational;
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Rational;

    .line 356
    .local v4, "ratio":Landroid/util/Rational;
    invoke-virtual {v4, v2}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 357
    invoke-interface {p0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .end local v4    # "ratio":Landroid/util/Rational;
    :cond_2
    goto :goto_2

    .line 363
    .end local v2    # "preferredAspectRatio":Landroid/util/Rational;
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 364
    .local v2, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    new-instance v3, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;

    invoke-direct {v3, v1, p2}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 369
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 370
    .local v3, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Rational;

    .line 371
    .local v5, "ratio":Landroid/util/Rational;
    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-virtual {v3, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    .end local v5    # "ratio":Landroid/util/Rational;
    goto :goto_3

    .line 374
    :cond_4
    return-object v3
.end method

.method private applyHighResolutionSettings(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionSelector;I)Ljava/util/List;
    .locals 3
    .param p2, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .param p3, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionSelector;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 296
    .local p1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {p2}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 298
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 299
    .local v0, "allSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 300
    iget-object v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v2, p3}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedHighResolutions(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 301
    new-instance v2, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v2, v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 302
    return-object v0

    .line 305
    .end local v0    # "allSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_0
    return-object p1
.end method

.method private static applyMaxResolutionRestriction(Ljava/util/LinkedHashMap;Landroid/util/Size;)V
    .locals 8
    .param p1, "maxResolution"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    .line 460
    .local p0, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-static {p1}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v0

    .line 461
    .local v0, "maxResolutionAreaSize":I
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    .line 462
    .local v2, "key":Landroid/util/Rational;
    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 463
    .local v3, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 464
    .local v4, "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Size;

    .line 465
    .local v6, "size":Landroid/util/Size;
    invoke-static {v6}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v7

    if-gt v7, v0, :cond_0

    .line 466
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    .end local v6    # "size":Landroid/util/Size;
    :cond_0
    goto :goto_1

    .line 469
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 470
    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 471
    .end local v2    # "key":Landroid/util/Rational;
    .end local v3    # "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v4    # "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 472
    :cond_2
    return-void
.end method

.method private static applyResolutionFilter(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionFilter;III)Ljava/util/List;
    .locals 5
    .param p1, "resolutionFilter"    # Landroidx/camera/core/resolutionselector/ResolutionFilter;
    .param p2, "targetRotation"    # I
    .param p3, "sensorOrientation"    # I
    .param p4, "lensFacing"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionFilter;",
            "III)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 491
    .local p0, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez p1, :cond_0

    .line 492
    return-object p0

    .line 497
    :cond_0
    invoke-static {p2}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v0

    .line 499
    .local v0, "destRotationDegrees":I
    const/4 v1, 0x1

    if-ne p4, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 500
    :goto_0
    invoke-static {v0, p3, v1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result v1

    .line 503
    .local v1, "rotationDegrees":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p1, v2, v1}, Landroidx/camera/core/resolutionselector/ResolutionFilter;->filter(Ljava/util/List;I)Ljava/util/List;

    move-result-object v2

    .line 505
    .local v2, "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0, v2}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 506
    return-object v2

    .line 508
    :cond_2
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The returned sizes list of the resolution filter must be a subset of the provided sizes list."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static applyResolutionStrategy(Ljava/util/LinkedHashMap;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V
    .locals 3
    .param p1, "resolutionStrategy"    # Landroidx/camera/core/resolutionselector/ResolutionStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/core/resolutionselector/ResolutionStrategy;",
            ")V"
        }
    .end annotation

    .line 391
    .local p0, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    if-nez p1, :cond_0

    .line 392
    return-void

    .line 396
    :cond_0
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Rational;

    .line 397
    .local v1, "key":Landroid/util/Rational;
    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-static {v2, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionStrategyFallbackRule(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V

    .line 399
    .end local v1    # "key":Landroid/util/Rational;
    goto :goto_0

    .line 400
    :cond_1
    return-void
.end method

.method private static applyResolutionStrategyFallbackRule(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V
    .locals 5
    .param p1, "resolutionStrategy"    # Landroidx/camera/core/resolutionselector/ResolutionStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionStrategy;",
            ")V"
        }
    .end annotation

    .line 411
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 412
    return-void

    .line 414
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->getFallbackRule()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 416
    .local v0, "fallbackRule":Ljava/lang/Integer;
    sget-object v1, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->HIGHEST_AVAILABLE_STRATEGY:Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 418
    return-void

    .line 421
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->getBoundSize()Landroid/util/Size;

    move-result-object v1

    .line 423
    .local v1, "boundSize":Landroid/util/Size;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 440
    :pswitch_0
    invoke-static {p0, v1, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V

    .line 442
    goto :goto_0

    .line 436
    :pswitch_1
    invoke-static {p0, v1, v4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V

    .line 438
    goto :goto_0

    .line 432
    :pswitch_2
    invoke-static {p0, v1, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 434
    goto :goto_0

    .line 428
    :pswitch_3
    invoke-static {p0, v1, v4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 430
    goto :goto_0

    .line 425
    :pswitch_4
    invoke-static {p0, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleNone(Ljava/util/List;Landroid/util/Size;)V

    .line 426
    nop

    .line 446
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private calculateFullFovRatioFromActiveArraySize(Landroid/util/Size;)Landroid/util/Rational;
    .locals 3
    .param p1, "activeArraySize"    # Landroid/util/Size;

    .line 92
    new-instance v0, Landroid/util/Rational;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    return-object v0
.end method

.method private calculateFullFovRatioFromSupportedOutputSizes(Landroidx/camera/core/impl/CameraInfoInternal;)Landroid/util/Rational;
    .locals 5
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 105
    const/16 v0, 0x100

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v0

    .line 106
    .local v0, "jpegOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    const/4 v1, 0x0

    return-object v1

    .line 109
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 110
    .local v1, "maxSize":Landroid/util/Size;
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Rational;-><init>(II)V

    return-object v2
.end method

.method private getResolutionCandidateList(Ljava/util/List;I)Ljava/util/List;
    .locals 3
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;>;I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 257
    .local p1, "customResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getSizeListByFormat(Ljava/util/List;I)Ljava/util/List;

    move-result-object v0

    .line 261
    .local v0, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez v0, :cond_0

    .line 262
    iget-object v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v1, p2}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v0

    .line 267
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 269
    .end local v0    # "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 271
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 272
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The retrieved supported resolutions from camera info internal is empty. Format is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SupportedOutputSizesCollector"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    :cond_1
    return-object v1
.end method

.method static getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Rational;",
            ">;"
        }
    .end annotation

    .line 635
    .local p0, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 639
    .local v0, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 640
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 643
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 644
    .local v2, "size":Landroid/util/Size;
    new-instance v3, Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V

    .line 645
    .local v3, "newRatio":Landroid/util/Rational;
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 649
    .local v4, "aspectRatioFound":Z
    if-nez v4, :cond_2

    .line 650
    const/4 v5, 0x0

    .line 651
    .local v5, "hasMatchingAspectRatio":Z
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/util/Rational;

    .line 652
    .local v7, "aspectRatio":Landroid/util/Rational;
    invoke-static {v2, v7}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 653
    const/4 v5, 0x1

    .line 654
    goto :goto_2

    .line 656
    .end local v7    # "aspectRatio":Landroid/util/Rational;
    :cond_0
    goto :goto_1

    .line 657
    :cond_1
    :goto_2
    if-nez v5, :cond_2

    .line 658
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 661
    .end local v2    # "size":Landroid/util/Size;
    .end local v3    # "newRatio":Landroid/util/Rational;
    .end local v4    # "aspectRatioFound":Z
    .end local v5    # "hasMatchingAspectRatio":Z
    :cond_2
    goto :goto_0

    .line 663
    :cond_3
    return-object v0
.end method

.method private getSizeListByFormat(Ljava/util/List;I)Ljava/util/List;
    .locals 4
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;>;I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 162
    .local p1, "resolutionsPairList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    const/4 v0, 0x0

    .line 164
    .local v0, "outputSizes":[Landroid/util/Size;
    if-eqz p1, :cond_1

    .line 165
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 166
    .local v2, "formatResolutionPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p2, :cond_0

    .line 167
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Landroid/util/Size;

    .line 168
    goto :goto_1

    .line 170
    .end local v2    # "formatResolutionPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    :cond_0
    goto :goto_0

    .line 172
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_2
    return-object v1
.end method

.method static getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;
    .locals 3
    .param p0, "aspectRatio"    # I
    .param p1, "isSensorLandscapeResolution"    # Z

    .line 606
    const/4 v0, 0x0

    .line 608
    .local v0, "outputRatio":Landroid/util/Rational;
    packed-switch p0, :pswitch_data_0

    .line 620
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Undefined target aspect ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SupportedOutputSizesCollector"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 614
    :pswitch_0
    if-eqz p1, :cond_0

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    goto :goto_0

    .line 615
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_9_16:Landroid/util/Rational;

    :goto_0
    move-object v0, v1

    .line 616
    goto :goto_2

    .line 610
    :pswitch_1
    if-eqz p1, :cond_1

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    goto :goto_1

    .line 611
    :cond_1
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_3_4:Landroid/util/Rational;

    :goto_1
    move-object v0, v1

    .line 612
    goto :goto_2

    .line 618
    :pswitch_2
    nop

    .line 623
    :goto_2
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;
    .locals 7
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

    .line 670
    .local p0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 672
    .local v0, "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-static {p0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 674
    .local v1, "aspectRatioKeys":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Rational;

    .line 675
    .local v3, "aspectRatio":Landroid/util/Rational;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    .end local v3    # "aspectRatio":Landroid/util/Rational;
    goto :goto_0

    .line 678
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 679
    .local v3, "outputSize":Landroid/util/Size;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Rational;

    .line 682
    .local v5, "key":Landroid/util/Rational;
    invoke-static {v3, v5}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 683
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 685
    .end local v5    # "key":Landroid/util/Rational;
    :cond_1
    goto :goto_2

    .line 686
    .end local v3    # "outputSize":Landroid/util/Size;
    :cond_2
    goto :goto_1

    .line 688
    :cond_3
    return-object v0
.end method

.method public static sortSupportedOutputSizesByResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;Ljava/util/List;Landroid/util/Size;ILandroid/util/Rational;II)Ljava/util/List;
    .locals 7
    .param p0, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .param p2, "maxResolution"    # Landroid/util/Size;
    .param p3, "targetRotation"    # I
    .param p4, "fullFovRatio"    # Landroid/util/Rational;
    .param p5, "sensorOrientation"    # I
    .param p6, "lensFacing"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/resolutionselector/ResolutionSelector;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "I",
            "Landroid/util/Rational;",
            "II)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 216
    .local p1, "candidateSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 218
    invoke-virtual {p0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAspectRatioStrategy()Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v0

    .line 217
    invoke-static {p1, v0, p4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyAspectRatioStrategy(Ljava/util/List;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;Landroid/util/Rational;)Ljava/util/LinkedHashMap;

    move-result-object v0

    .line 221
    .local v0, "aspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    if-eqz p2, :cond_0

    .line 222
    invoke-static {v0, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyMaxResolutionRestriction(Ljava/util/LinkedHashMap;Landroid/util/Size;)V

    .line 226
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionStrategy(Ljava/util/LinkedHashMap;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V

    .line 229
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .local v1, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 231
    .local v3, "sortedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    .line 234
    .local v5, "size":Landroid/util/Size;
    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 235
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    .end local v5    # "size":Landroid/util/Size;
    :cond_1
    goto :goto_1

    .line 238
    .end local v3    # "sortedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_2
    goto :goto_0

    .line 241
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionFilter()Landroidx/camera/core/resolutionselector/ResolutionFilter;

    move-result-object v2

    invoke-static {v1, v2, p3, p5, p6}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionFilter(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionFilter;III)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method static sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V
    .locals 5
    .param p1, "boundSize"    # Landroid/util/Size;
    .param p2, "keepLowerSizes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "Z)V"
        }
    .end annotation

    .line 540
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 542
    .local v0, "lowerSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 543
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 544
    .local v2, "outputSize":Landroid/util/Size;
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_0

    .line 545
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 549
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 542
    .end local v2    # "outputSize":Landroid/util/Size;
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 555
    .end local v1    # "i":I
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 558
    invoke-static {p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 559
    if-eqz p2, :cond_2

    .line 561
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 563
    :cond_2
    return-void
.end method

.method private static sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V
    .locals 5
    .param p1, "boundSize"    # Landroid/util/Size;
    .param p2, "keepHigherSizes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "Z)V"
        }
    .end annotation

    .line 577
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 579
    .local v0, "higherSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 580
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 581
    .local v2, "outputSize":Landroid/util/Size;
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-gt v3, v4, :cond_0

    .line 582
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 586
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 579
    .end local v2    # "outputSize":Landroid/util/Size;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 593
    .end local v1    # "i":I
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 594
    if-eqz p2, :cond_2

    .line 596
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 598
    :cond_2
    return-void
.end method

.method private static sortSupportedSizesByFallbackRuleNone(Ljava/util/List;Landroid/util/Size;)V
    .locals 1
    .param p1, "boundSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    .line 521
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 522
    .local v0, "containsBoundSize":Z
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 523
    if-eqz v0, :cond_0

    .line 524
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 526
    :cond_0
    return-void
.end method


# virtual methods
.method public getSortedSupportedOutputSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 14
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

    .line 122
    .local p1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object v0, p1

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 123
    .local v0, "imageOutputConfig":Landroidx/camera/core/impl/ImageOutputConfig;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getCustomOrderedResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 126
    .local v2, "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v2, :cond_0

    .line 127
    return-object v2

    .line 130
    :cond_0
    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v3

    .line 131
    .local v3, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    nop

    .line 132
    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getSupportedResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 133
    .local v4, "customResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    nop

    .line 134
    invoke-interface {p1}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v5

    .line 133
    invoke-direct {p0, v4, v5}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionCandidateList(Ljava/util/List;I)Ljava/util/List;

    move-result-object v5

    .line 136
    .local v5, "candidateSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez v3, :cond_1

    .line 137
    iget-object v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    invoke-virtual {v1, v5, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->sortSupportedOutputSizes(Ljava/util/List;Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 140
    :cond_1
    move-object v6, p1

    check-cast v6, Landroidx/camera/core/impl/ImageOutputConfig;

    invoke-interface {v6, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getMaxResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v9

    .line 141
    .local v9, "maxResolution":Landroid/util/Size;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v10

    .line 143
    .local v10, "targetRotation":I
    invoke-interface {p1, v1}, Landroidx/camera/core/impl/UseCaseConfig;->isHighResolutionDisabled(Z)Z

    move-result v1

    if-nez v1, :cond_2

    .line 144
    nop

    .line 145
    invoke-interface {p1}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v1

    .line 144
    invoke-direct {p0, v5, v3, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyHighResolutionSettings(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionSelector;I)Ljava/util/List;

    move-result-object v5

    move-object v8, v5

    goto :goto_0

    .line 143
    :cond_2
    move-object v8, v5

    .line 147
    .end local v5    # "candidateSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v8, "candidateSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_0
    nop

    .line 148
    invoke-interface {v0}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v7

    iget-object v11, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    iget v12, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSensorOrientation:I

    iget v13, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mLensFacing:I

    .line 147
    invoke-static/range {v7 .. v13}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedOutputSizesByResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;Ljava/util/List;Landroid/util/Size;ILandroid/util/Rational;II)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method
