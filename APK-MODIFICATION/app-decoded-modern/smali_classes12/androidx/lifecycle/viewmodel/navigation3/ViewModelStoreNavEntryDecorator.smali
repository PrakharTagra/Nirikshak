.class public final Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;
.super Landroidx/navigation3/runtime/NavEntryDecorator;
.source "ViewModelStoreNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/navigation3/runtime/NavEntryDecorator<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nViewModelStoreNavEntryDecorator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator\n+ 2 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,173:1\n75#2:174\n1282#3,6:175\n*S KotlinDebug\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator\n*L\n103#1:174\n104#1:175,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\u001d\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;",
        "T",
        "",
        "Landroidx/navigation3/runtime/NavEntryDecorator;",
        "viewModelStore",
        "Landroidx/lifecycle/ViewModelStore;",
        "removeViewModelStoreOnPop",
        "Lkotlin/Function0;",
        "",
        "<init>",
        "(Landroidx/lifecycle/ViewModelStore;Lkotlin/jvm/functions/Function0;)V",
        "lifecycle-viewmodel-navigation3"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# direct methods
.method public static synthetic $r8$lambda$13u-eMW1iH632z1iKFQx72NlgA0(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;->_init_$lambda$1$1(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$AMaWoWRX9_BOzRHEr1hLxyIehRY(Landroidx/lifecycle/ViewModelStore;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;->_init_$lambda$1(Landroidx/lifecycle/ViewModelStore;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$sPB8gBFMkhyukbwD7m86iDXWpnA(Lkotlin/jvm/functions/Function0;Landroidx/lifecycle/ViewModelStore;Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;->_init_$lambda$0(Lkotlin/jvm/functions/Function0;Landroidx/lifecycle/ViewModelStore;Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/lifecycle/ViewModelStore;Lkotlin/jvm/functions/Function0;)V
    .locals 4
    .param p1, "viewModelStore"    # Landroidx/lifecycle/ViewModelStore;
    .param p2, "removeViewModelStoreOnPop"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/ViewModelStore;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 89
    nop

    .line 94
    new-instance v0, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2, p1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;Landroidx/lifecycle/ViewModelStore;)V

    .line 99
    new-instance v1, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda1;-><init>(Landroidx/lifecycle/ViewModelStore;)V

    const v2, -0x584a2e43

    const/4 v3, 0x1

    invoke-static {v2, v3, v1}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function3;

    .line 89
    invoke-direct {p0, v0, v1}, Landroidx/navigation3/runtime/NavEntryDecorator;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method private static final _init_$lambda$0(Lkotlin/jvm/functions/Function0;Landroidx/lifecycle/ViewModelStore;Ljava/lang/Object;)Lkotlin/Unit;
    .locals 1
    .param p0, "$removeViewModelStoreOnPop"    # Lkotlin/jvm/functions/Function0;
    .param p1, "$viewModelStore"    # Landroidx/lifecycle/ViewModelStore;
    .param p2, "key"    # Ljava/lang/Object;

    .line 95
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-static {p1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt;->access$getEntryViewModel(Landroidx/lifecycle/ViewModelStore;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->clearViewModelStoreOwnerForKey(Ljava/lang/Object;)V

    .line 98
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final _init_$lambda$1(Landroidx/lifecycle/ViewModelStore;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11
    .param p0, "$viewModelStore"    # Landroidx/lifecycle/ViewModelStore;
    .param p1, "entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "CN(entry)102@4587L7,103@4638L1385,132@6121L47,132@6036L132:ViewModelStoreNavEntryDecorator.kt#lkp6b8"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move v0, p3

    .local v0, "$dirty":I
    and-int/lit8 v1, p3, 0x6

    if-nez v1, :cond_1

    invoke-interface {p2, p1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v0, v1

    :cond_1
    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x1

    if-eq v1, v2, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    and-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v2, "androidx.lifecycle.viewmodel.navigation3.ViewModelStoreNavEntryDecorator.<init>.<anonymous> (ViewModelStoreNavEntryDecorator.kt:99)"

    const v4, -0x584a2e43

    invoke-static {v4, v0, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 101
    :cond_3
    invoke-static {p0}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt;->access$getEntryViewModel(Landroidx/lifecycle/ViewModelStore;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->viewModelStoreForKey(Ljava/lang/Object;)Landroidx/lifecycle/ViewModelStore;

    move-result-object v1

    .line 100
    nop

    .line 103
    .local v1, "viewModelStore":Landroidx/lifecycle/ViewModelStore;
    invoke-static {}, Landroidx/savedstate/compose/LocalSavedStateRegistryOwnerKt;->getLocalSavedStateRegistryOwner()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v2

    check-cast v2, Landroidx/compose/runtime/CompositionLocal;

    .local v2, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v4, 0x0

    .local v4, "$changed$iv":I
    move-object v5, p2

    .local v5, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 174
    .local v6, "$i$f$getCurrent":I
    const v7, 0x789c5f52

    const-string v8, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v5, v7, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 103
    .end local v2    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v4    # "$changed$iv":I
    .end local v5    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$getCurrent":I
    move-object v2, v7

    check-cast v2, Landroidx/savedstate/SavedStateRegistryOwner;

    .line 104
    .local v2, "savedStateRegistryOwner":Landroidx/savedstate/SavedStateRegistryOwner;
    const v4, -0x6e7783fa

    const-string v5, "CC(remember):ViewModelStoreNavEntryDecorator.kt#9igjgp"

    invoke-static {p2, v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v4, 0x0

    .local v4, "invalid$iv":Z
    move-object v5, p2

    .local v5, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 175
    .local v6, "$i$f$cache":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it$iv":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 176
    .local v8, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_4

    .line 177
    const/4 v9, 0x0

    .line 105
    .local v9, "$i$a$-cache-ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1":I
    new-instance v10, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1$1;

    invoke-direct {v10, v2, v1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1$1;-><init>(Landroidx/savedstate/SavedStateRegistryOwner;Landroidx/lifecycle/ViewModelStore;)V

    .line 131
    nop

    .line 177
    .end local v9    # "$i$a$-cache-ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1":I
    nop

    .line 178
    .local v10, "value$iv":Ljava/lang/Object;
    invoke-interface {v5, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 179
    move-object v7, v10

    .end local v10    # "value$iv":Ljava/lang/Object;
    goto :goto_2

    .line 180
    :cond_4
    nop

    .line 175
    .end local v7    # "it$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_2
    nop

    .line 104
    .end local v4    # "invalid$iv":Z
    .end local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$cache":I
    move-object v4, v7

    check-cast v4, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1$1;

    .local v4, "childViewModelStoreOwner":Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1$1;
    invoke-static {p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 133
    sget-object v5, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    move-object v6, v4

    check-cast v6, Landroidx/lifecycle/ViewModelStoreOwner;

    invoke-virtual {v5, v6}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->provides(Landroidx/lifecycle/ViewModelStoreOwner;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v5

    new-instance v6, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda2;

    invoke-direct {v6, p1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda2;-><init>(Landroidx/navigation3/runtime/NavEntry;)V

    const/16 v7, 0x36

    const v8, 0x4217f4fd

    invoke-static {v8, v3, v6, p2, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    check-cast v3, Lkotlin/jvm/functions/Function2;

    sget v6, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v6, v6, 0x30

    invoke-static {v5, v3, p2, v6}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v1    # "viewModelStore":Landroidx/lifecycle/ViewModelStore;
    .end local v2    # "savedStateRegistryOwner":Landroidx/savedstate/SavedStateRegistryOwner;
    .end local v4    # "childViewModelStoreOwner":Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$2$childViewModelStoreOwner$1$1;
    goto :goto_3

    .line 99
    :cond_5
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 136
    :cond_6
    :goto_3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final _init_$lambda$1$1(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C133@6145L9:ViewModelStoreNavEntryDecorator.kt#lkp6b8"

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

    const-string v1, "androidx.lifecycle.viewmodel.navigation3.ViewModelStoreNavEntryDecorator.<init>.<anonymous>.<anonymous> (ViewModelStoreNavEntryDecorator.kt:133)"

    const v3, 0x4217f4fd

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 134
    :cond_1
    invoke-virtual {p0, p1, v2}, Landroidx/navigation3/runtime/NavEntry;->Content(Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 133
    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 135
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
