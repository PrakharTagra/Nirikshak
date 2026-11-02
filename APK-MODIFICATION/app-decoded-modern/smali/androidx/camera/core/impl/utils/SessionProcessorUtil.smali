.class public final Landroidx/camera/core/impl/utils/SessionProcessorUtil;
.super Ljava/lang/Object;
.source "SessionProcessorUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getModifiedFocusMeteringAction(Landroidx/camera/core/impl/SessionProcessor;Landroidx/camera/core/FocusMeteringAction;)Landroidx/camera/core/FocusMeteringAction;
    .locals 5
    .param p0, "sessionProcessor"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;

    .line 64
    if-nez p0, :cond_0

    .line 65
    return-object p1

    .line 67
    :cond_0
    const/4 v0, 0x0

    .line 68
    .local v0, "shouldModify":Z
    new-instance v1, Landroidx/camera/core/FocusMeteringAction$Builder;

    invoke-direct {v1, p1}, Landroidx/camera/core/FocusMeteringAction$Builder;-><init>(Landroidx/camera/core/FocusMeteringAction;)V

    .line 69
    .local v1, "builder":Landroidx/camera/core/FocusMeteringAction$Builder;
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    filled-new-array {v2, v3}, [I

    move-result-object v4

    .line 70
    invoke-static {p0, v4}, Landroidx/camera/core/impl/utils/SessionProcessorUtil;->isOperationSupported(Landroidx/camera/core/impl/SessionProcessor;[I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 73
    const/4 v0, 0x1

    .line 74
    invoke-virtual {v1, v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 77
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x3

    filled-new-array {v2}, [I

    move-result-object v2

    .line 78
    invoke-static {p0, v2}, Landroidx/camera/core/impl/utils/SessionProcessorUtil;->isOperationSupported(Landroidx/camera/core/impl/SessionProcessor;[I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 80
    const/4 v0, 0x1

    .line 81
    invoke-virtual {v1, v3}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 84
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v2, 0x4

    filled-new-array {v2}, [I

    move-result-object v3

    .line 85
    invoke-static {p0, v3}, Landroidx/camera/core/impl/utils/SessionProcessorUtil;->isOperationSupported(Landroidx/camera/core/impl/SessionProcessor;[I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 87
    const/4 v0, 0x1

    .line 88
    invoke-virtual {v1, v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 92
    :cond_3
    if-nez v0, :cond_4

    .line 93
    return-object p1

    .line 96
    :cond_4
    invoke-virtual {v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v2

    .line 97
    .local v2, "modifyAction":Landroidx/camera/core/FocusMeteringAction;
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 98
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 99
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 101
    const/4 v3, 0x0

    return-object v3

    .line 103
    :cond_5
    invoke-virtual {v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v3

    return-object v3
.end method

.method public static varargs isOperationSupported(Landroidx/camera/core/impl/SessionProcessor;[I)Z
    .locals 5
    .param p0, "sessionProcessor"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p1, "operations"    # [I

    .line 44
    if-nez p0, :cond_0

    .line 45
    const/4 v0, 0x1

    return v0

    .line 48
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 49
    .local v0, "operationList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p1, v2

    .line 50
    .local v3, "operation":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .end local v3    # "operation":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    :cond_1
    invoke-interface {p0}, Landroidx/camera/core/impl/SessionProcessor;->getSupportedCameraOperations()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    return v1
.end method
