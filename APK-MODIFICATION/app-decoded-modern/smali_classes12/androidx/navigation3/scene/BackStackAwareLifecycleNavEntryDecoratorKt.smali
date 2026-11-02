.class public final Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;
.super Ljava/lang/Object;
.source "BackStackAwareLifecycleNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBackStackAwareLifecycleNavEntryDecorator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BackStackAwareLifecycleNavEntryDecorator.kt\nandroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt\n+ 2 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,50:1\n85#2:51\n1277#3,6:52\n*S KotlinDebug\n*F\n+ 1 BackStackAwareLifecycleNavEntryDecorator.kt\nandroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt\n*L\n42#1:51\n44#1:52,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a1\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00060\u0005H\u0001\u00a2\u0006\u0002\u0010\u0007\u00a8\u0006\u0008\u00b2\u0006 \u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00060\u0005\"\u0008\u0008\u0000\u0010\u0002*\u00020\u0003X\u008a\u0084\u0002"
    }
    d2 = {
        "rememberBackStackAwareLifecycleNavEntryDecorator",
        "Landroidx/navigation3/runtime/NavEntryDecorator;",
        "T",
        "",
        "entries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
        "(Ljava/util/List;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntryDecorator;",
        "navigation3-ui",
        "updatedEntries"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$8HEtEGU_Sn5Nq8OaIG_TmqfMcL4(Landroidx/navigation3/runtime/NavEntry;Landroidx/navigation3/runtime/NavEntry;)Z
    .locals 0

    invoke-static {p0, p1}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1$0$0(Landroidx/navigation3/runtime/NavEntry;Landroidx/navigation3/runtime/NavEntry;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$G3gG5AhsJNiIeb3eOfK33EpryN0(Landroidx/compose/runtime/State;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1(Landroidx/compose/runtime/State;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$vI4ZnmsdoV1XTWHdr3sldRncpkc(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1$1(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final rememberBackStackAwareLifecycleNavEntryDecorator(Ljava/util/List;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntryDecorator;
    .locals 6
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/runtime/Composer;",
            "I)",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;"
        }
    .end annotation

    .line 41
    const v0, -0x68f9cca3

    const-string v1, "C(rememberBackStackAwareLifecycleNavEntryDecorator)N(entries)41@1677L29,42@1736L370:BackStackAwareLifecycleNavEntryDecorator.kt#erzv7c"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.navigation3.scene.rememberBackStackAwareLifecycleNavEntryDecorator (BackStackAwareLifecycleNavEntryDecorator.kt:40)"

    invoke-static {v0, p2, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 42
    :cond_0
    and-int/lit8 v0, p2, 0xe

    invoke-static {p0, p1, v0}, Landroidx/compose/runtime/SnapshotStateKt;->rememberUpdatedState(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v0

    .line 43
    .local v0, "updatedEntries$delegate":Landroidx/compose/runtime/State;
    new-instance v1, Landroidx/navigation3/runtime/NavEntryDecorator;

    new-instance v2, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/runtime/State;)V

    const/16 v3, 0x36

    const v4, 0x403bfc2c

    const/4 v5, 0x1

    invoke-static {v4, v5, v2, p1, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function3;

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2, v5, v3}, Landroidx/navigation3/runtime/NavEntryDecorator;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function3;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 41
    :cond_1
    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 43
    return-object v1
.end method

.method private static final rememberBackStackAwareLifecycleNavEntryDecorator$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$updatedEntries$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;"
        }
    .end annotation

    .line 42
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 51
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 42
    return-object v0
.end method

.method private static final rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1(Landroidx/compose/runtime/State;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 12
    .param p0, "$updatedEntries$delegate"    # Landroidx/compose/runtime/State;
    .param p1, "entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "CN(entry)43@1803L37,45@1960L51,46@2081L19,46@2020L80:BackStackAwareLifecycleNavEntryDecorator.kt#erzv7c"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move v0, p3

    .local v0, "$dirty":I
    and-int/lit8 v1, p3, 0x6

    const/4 v2, 0x4

    const/4 v3, 0x2

    if-nez v1, :cond_1

    invoke-interface {p2, p1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    or-int/2addr v0, v1

    :cond_1
    and-int/lit8 v1, v0, 0x13

    const/16 v4, 0x12

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v1, v4, :cond_2

    move v1, v6

    goto :goto_1

    :cond_2
    move v1, v5

    :goto_1
    and-int/lit8 v4, v0, 0x1

    invoke-interface {p2, v1, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v4, "androidx.navigation3.scene.rememberBackStackAwareLifecycleNavEntryDecorator.<anonymous> (BackStackAwareLifecycleNavEntryDecorator.kt:43)"

    const v7, 0x403bfc2c

    invoke-static {v7, v0, v1, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 44
    :cond_3
    invoke-static {p0}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->rememberBackStackAwareLifecycleNavEntryDecorator$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v1

    const v4, 0x212da9b1

    const-string v7, "CC(remember):BackStackAwareLifecycleNavEntryDecorator.kt#9igjgp"

    invoke-static {p2, v4, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v4, v0, 0xe

    if-ne v4, v2, :cond_4

    move v2, v6

    goto :goto_2

    :cond_4
    move v2, v5

    .local v2, "invalid$iv":Z
    :goto_2
    move-object v4, p2

    .local v4, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 52
    .local v7, "$i$f$cache":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v8

    .local v8, "it$iv":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 53
    .local v9, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v2, :cond_6

    sget-object v10, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v10}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v8, v10, :cond_5

    goto :goto_3

    .line 57
    :cond_5
    goto :goto_4

    .line 54
    :cond_6
    :goto_3
    const/4 v10, 0x0

    .line 44
    .local v10, "$i$a$-cache-BackStackAwareLifecycleNavEntryDecoratorKt$rememberBackStackAwareLifecycleNavEntryDecorator$1$isInBackStack$1":I
    new-instance v11, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda0;

    invoke-direct {v11, p1}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation3/runtime/NavEntry;)V

    .line 54
    .end local v10    # "$i$a$-cache-BackStackAwareLifecycleNavEntryDecoratorKt$rememberBackStackAwareLifecycleNavEntryDecorator$1$isInBackStack$1":I
    nop

    .line 55
    .local v11, "value$iv":Ljava/lang/Object;
    invoke-interface {v4, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 56
    move-object v8, v11

    .line 52
    .end local v8    # "it$iv":Ljava/lang/Object;
    .end local v9    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v11    # "value$iv":Ljava/lang/Object;
    :goto_4
    nop

    .line 44
    .end local v2    # "invalid$iv":Z
    .end local v4    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v7    # "$i$f$cache":I
    check-cast v8, Lkotlin/jvm/functions/Function1;

    invoke-static {p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v1, v8}, Landroidx/navigation3/ListUtilsKt;->fastAnyOrAny(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Z

    move-result v1

    .line 45
    .local v1, "isInBackStack":Z
    if-eqz v1, :cond_7

    sget-object v2, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    goto :goto_5

    :cond_7
    sget-object v2, Landroidx/lifecycle/Lifecycle$State;->CREATED:Landroidx/lifecycle/Lifecycle$State;

    .line 46
    .local v2, "maxLifecycle":Landroidx/lifecycle/Lifecycle$State;
    :goto_5
    const/4 v4, 0x0

    invoke-static {v2, v4, p2, v5, v3}, Landroidx/lifecycle/compose/RememberLifecycleOwnerKt;->rememberLifecycleOwner(Landroidx/lifecycle/Lifecycle$State;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/LifecycleOwner;

    move-result-object v3

    .line 47
    .local v3, "owner":Landroidx/lifecycle/LifecycleOwner;
    invoke-static {}, Landroidx/lifecycle/compose/LocalLifecycleOwnerKt;->getLocalLifecycleOwner()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v4

    new-instance v5, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda1;

    invoke-direct {v5, p1}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda1;-><init>(Landroidx/navigation3/runtime/NavEntry;)V

    const/16 v7, 0x36

    const v8, -0x6624bf14

    invoke-static {v8, v6, v5, p2, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v5

    check-cast v5, Lkotlin/jvm/functions/Function2;

    sget v6, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v6, v6, 0x30

    invoke-static {v4, v5, p2, v6}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v1    # "isInBackStack":Z
    .end local v2    # "maxLifecycle":Landroidx/lifecycle/Lifecycle$State;
    .end local v3    # "owner":Landroidx/lifecycle/LifecycleOwner;
    goto :goto_6

    .line 43
    :cond_8
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 48
    :cond_9
    :goto_6
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1$0$0(Landroidx/navigation3/runtime/NavEntry;Landroidx/navigation3/runtime/NavEntry;)Z
    .locals 2
    .param p0, "$entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p1, "it"    # Landroidx/navigation3/runtime/NavEntry;

    .line 44
    invoke-virtual {p1}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static final rememberBackStackAwareLifecycleNavEntryDecorator$lambda$1$1(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C46@2089L9:BackStackAwareLifecycleNavEntryDecorator.kt#erzv7c"

    invoke-static {p1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p2, 0x1

    invoke-interface {p1, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.navigation3.scene.rememberBackStackAwareLifecycleNavEntryDecorator.<anonymous>.<anonymous> (BackStackAwareLifecycleNavEntryDecorator.kt:46)"

    const v3, -0x6624bf14

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 47
    :cond_1
    invoke-virtual {p0, p1, v2}, Landroidx/navigation3/runtime/NavEntry;->Content(Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
