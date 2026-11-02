.class final synthetic Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt;
.super Ljava/lang/Object;
.source "ViewModelStoreNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nViewModelStoreNavEntryDecorator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 InitializerViewModelFactory.kt\nandroidx/lifecycle/viewmodel/InitializerViewModelFactoryKt\n*L\n1#1,173:1\n1282#2,6:174\n32#3:180\n69#3,2:181\n*S KotlinDebug\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt\n*L\n67#1:174,6\n169#1:180\n169#1:181,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a7\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007H\u0007\u00a2\u0006\u0002\u0010\t\u001a\u0011\u0010\n\u001a\u00020\u000b*\u00020\u000cH\u0002\u00a2\u0006\u0002\u0008\r\u00a8\u0006\u000e"
    }
    d2 = {
        "rememberViewModelStoreNavEntryDecorator",
        "Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;",
        "T",
        "",
        "viewModelStoreOwner",
        "Landroidx/lifecycle/ViewModelStoreOwner;",
        "removeViewModelStoreOnPop",
        "Lkotlin/Function0;",
        "",
        "(Landroidx/lifecycle/ViewModelStoreOwner;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;",
        "getEntryViewModel",
        "Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;",
        "Landroidx/lifecycle/ViewModelStore;",
        "getEntryViewModel$ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt",
        "lifecycle-viewmodel-navigation3"
    }
    k = 0x5
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
    xs = "androidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt"
.end annotation


# direct methods
.method public static synthetic $r8$lambda$G0imjEs9Ls1BjDShEeMY0IgQJbA(Landroidx/lifecycle/viewmodel/CreationExtras;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;
    .locals 0

    invoke-static {p0}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt;->getEntryViewModel$lambda$0$0$ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt(Landroidx/lifecycle/viewmodel/CreationExtras;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getEntryViewModel(Landroidx/lifecycle/ViewModelStore;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;
    .locals 1
    .param p0, "$receiver"    # Landroidx/lifecycle/ViewModelStore;

    .line 1
    invoke-static {p0}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt;->getEntryViewModel$ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt(Landroidx/lifecycle/ViewModelStore;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    move-result-object v0

    return-object v0
.end method

.method private static final getEntryViewModel$ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt(Landroidx/lifecycle/ViewModelStore;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;
    .locals 9
    .param p0, "$this$getEntryViewModel"    # Landroidx/lifecycle/ViewModelStore;

    .line 167
    sget-object v0, Landroidx/lifecycle/ViewModelProvider;->Companion:Landroidx/lifecycle/ViewModelProvider$Companion;

    .line 168
    nop

    .line 169
    const/4 v1, 0x0

    .line 180
    .local v1, "$i$f$viewModelFactory":I
    new-instance v2, Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;

    invoke-direct {v2}, Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;-><init>()V

    move-object v3, v2

    .local v3, "$this$getEntryViewModel_u24lambda_u240":Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;
    const/4 v4, 0x0

    .line 169
    .local v4, "$i$a$-viewModelFactory-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$getEntryViewModel$provider$1":I
    new-instance v5, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$$ExternalSyntheticLambda0;-><init>()V

    .local v5, "initializer$iv":Lkotlin/jvm/functions/Function1;
    move-object v6, v3

    .local v6, "$this$initializer$iv":Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;
    const/4 v7, 0x0

    .line 181
    .local v7, "$i$f$initializer":I
    const-class v8, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    invoke-static {v8}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v8

    invoke-virtual {v6, v8, v5}, Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;->addInitializer(Lkotlin/reflect/KClass;Lkotlin/jvm/functions/Function1;)V

    .line 182
    nop

    .line 169
    .end local v5    # "initializer$iv":Lkotlin/jvm/functions/Function1;
    .end local v6    # "$this$initializer$iv":Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;
    .end local v7    # "$i$f$initializer":I
    nop

    .end local v3    # "$this$getEntryViewModel_u24lambda_u240":Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;
    .end local v4    # "$i$a$-viewModelFactory-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$getEntryViewModel$provider$1":I
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 180
    invoke-virtual {v2}, Landroidx/lifecycle/viewmodel/InitializerViewModelFactoryBuilder;->build()Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v2

    .line 167
    .end local v1    # "$i$f$viewModelFactory":I
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v1, p0

    .end local p0    # "$this$getEntryViewModel":Landroidx/lifecycle/ViewModelStore;
    .local v1, "$this$getEntryViewModel":Landroidx/lifecycle/ViewModelStore;
    invoke-static/range {v0 .. v5}, Landroidx/lifecycle/ViewModelProvider$Companion;->create$default(Landroidx/lifecycle/ViewModelProvider$Companion;Landroidx/lifecycle/ViewModelStore;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;ILjava/lang/Object;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object p0

    .line 166
    nop

    .line 171
    .local p0, "provider":Landroidx/lifecycle/ViewModelProvider;
    const-class v0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Lkotlin/reflect/KClass;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    return-object v0
.end method

.method private static final getEntryViewModel$lambda$0$0$ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt(Landroidx/lifecycle/viewmodel/CreationExtras;)Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;
    .locals 1
    .param p0, "$this$initializer"    # Landroidx/lifecycle/viewmodel/CreationExtras;

    .line 169
    new-instance v0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;

    invoke-direct {v0}, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;-><init>()V

    return-object v0
.end method

.method public static final rememberViewModelStoreNavEntryDecorator(Landroidx/lifecycle/ViewModelStoreOwner;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;
    .locals 8
    .param p0, "viewModelStoreOwner"    # Landroidx/lifecycle/ViewModelStoreOwner;
    .param p1, "removeViewModelStoreOnPop"    # Lkotlin/jvm/functions/Function0;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/lifecycle/ViewModelStoreOwner;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)",
            "Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator<",
            "TT;>;"
        }
    .end annotation

    .line 65
    const v0, 0x768b96d2

    const-string v1, "C(rememberViewModelStoreNavEntryDecorator)N(viewModelStoreOwner,removeViewModelStoreOnPop)59@2589L7,63@2785L27,65@2897L47,66@2956L209:ViewModelStoreNavEntryDecorator.kt#lkp6b8"

    invoke-static {p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v1, p4, 0x1

    if-eqz v1, :cond_1

    .line 60
    sget-object v1, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v2, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v1, p2, v2}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v1

    if-eqz v1, :cond_0

    move-object p0, v1

    goto :goto_0

    :cond_0
    const/4 p4, 0x0

    .line 61
    .local p4, "$i$a$-checkNotNull-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$rememberViewModelStoreNavEntryDecorator$1":I
    nop

    .line 60
    .end local p4    # "$i$a$-checkNotNull-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$rememberViewModelStoreNavEntryDecorator$1":I
    new-instance p4, Ljava/lang/IllegalStateException;

    const-string v0, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p4

    :cond_1
    :goto_0
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_2

    .line 64
    sget-object p4, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorDefaults;->INSTANCE:Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorDefaults;

    const/4 v1, 0x6

    invoke-virtual {p4, p2, v1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecoratorDefaults;->removeViewModelStoreOnPop(Landroidx/compose/runtime/Composer;I)Lkotlin/jvm/functions/Function0;

    move-result-object p1

    :cond_2
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p4

    if-eqz p4, :cond_3

    const/4 p4, -0x1

    const-string v1, "androidx.lifecycle.viewmodel.navigation3.rememberViewModelStoreNavEntryDecorator (ViewModelStoreNavEntryDecorator.kt:64)"

    invoke-static {v0, p3, p4, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 66
    :cond_3
    shr-int/lit8 p4, p3, 0x3

    and-int/lit8 p4, p4, 0xe

    invoke-static {p1, p2, p4}, Landroidx/compose/runtime/SnapshotStateKt;->rememberUpdatedState(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object p4

    .line 67
    .local p4, "currentRemoveViewModelStoreOnPop":Landroidx/compose/runtime/State;
    const v0, 0x2016b83

    const-string v1, "CC(remember):ViewModelStoreNavEntryDecorator.kt#9igjgp"

    invoke-static {p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p2, p0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v0

    invoke-interface {p2, p4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .local v0, "invalid$iv":Z
    move-object v1, p2

    .local v1, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 174
    .local v2, "$i$f$cache":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it$iv":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 175
    .local v4, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_5

    sget-object v5, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v5}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v5

    if-ne v3, v5, :cond_4

    goto :goto_1

    .line 179
    :cond_4
    goto :goto_2

    .line 176
    :cond_5
    :goto_1
    const/4 v5, 0x0

    .line 68
    .local v5, "$i$a$-cache-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$rememberViewModelStoreNavEntryDecorator$2":I
    new-instance v6, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;

    .line 69
    invoke-interface {p0}, Landroidx/lifecycle/ViewModelStoreOwner;->getViewModelStore()Landroidx/lifecycle/ViewModelStore;

    move-result-object v7

    .line 70
    nop

    .line 68
    invoke-direct {v6, v7, p1}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;-><init>(Landroidx/lifecycle/ViewModelStore;Lkotlin/jvm/functions/Function0;)V

    .line 71
    nop

    .line 176
    .end local v5    # "$i$a$-cache-ViewModelStoreNavEntryDecoratorKt__ViewModelStoreNavEntryDecoratorKt$rememberViewModelStoreNavEntryDecorator$2":I
    nop

    .line 177
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 178
    move-object v3, v6

    .line 174
    .end local v3    # "it$iv":Ljava/lang/Object;
    .end local v4    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v6    # "value$iv":Ljava/lang/Object;
    :goto_2
    nop

    .line 67
    .end local v0    # "invalid$iv":Z
    .end local v1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$f$cache":I
    check-cast v3, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;

    invoke-static {p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 65
    :cond_6
    invoke-static {p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 67
    return-object v3
.end method
