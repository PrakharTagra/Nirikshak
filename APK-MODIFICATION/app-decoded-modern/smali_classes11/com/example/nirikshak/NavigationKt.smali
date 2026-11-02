.class public final Lcom/example/nirikshak/NavigationKt;
.super Ljava/lang/Object;
.source "Navigation.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/nirikshak/NavigationKt$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNavigation.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Navigation.kt\ncom/example/nirikshak/NavigationKt\n+ 2 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n*L\n1#1,60:1\n75#2:61\n1128#3,6:62\n1128#3,6:68\n1128#3,6:74\n1128#3,6:80\n1128#3,6:86\n1128#3,6:92\n85#4:98\n117#4,2:99\n*S KotlinDebug\n*F\n+ 1 Navigation.kt\ncom/example/nirikshak/NavigationKt\n*L\n24#1:61\n27#1:62,6\n31#1:68,6\n38#1:74,6\n44#1:80,6\n45#1:86,6\n51#1:92,6\n31#1:98\n31#1:99,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\u001a\r\u0010\u0000\u001a\u00020\u0001H\u0007\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0003\u00b2\u0006\n\u0010\u0004\u001a\u00020\u0005X\u008a\u008e\u0002"
    }
    d2 = {
        "MainNavigation",
        "",
        "(Landroidx/compose/runtime/Composer;I)V",
        "app_debug",
        "currentScreen",
        "Lcom/example/nirikshak/ScreenState;"
    }
    k = 0x2
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$H_XLGZcwobfTtiS8R0_mM8ohKIo(ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$8(ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$_-iWoxFZqVFIYuu8urSxZBhaWCk(Landroid/content/Context;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$7$0(Landroid/content/Context;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$fbBj_DQuSG9uq8Sx-5LGwdGG0V0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$5$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$vrBOQtvnxnpRS7MGKOsgLBsGs2E(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$4$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$y-fQWmzE4t9yqWN542GcM_QV0N4(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$6$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final MainNavigation(Landroidx/compose/runtime/Composer;I)V
    .locals 12
    .param p0, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p1, "$changed"    # I

    .line 23
    const v0, -0x4272ebd6

    invoke-interface {p0, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p0    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string p0, "C(MainNavigation)23@711L7,26@765L47,30@837L107:Navigation.kt#e2ep2x"

    invoke-static {v4, p0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    const/4 p0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, p0

    :goto_0
    and-int/lit8 v2, p1, 0x1

    invoke-interface {v4, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    const-string v2, "com.example.nirikshak.MainNavigation (Navigation.kt:22)"

    invoke-static {v0, p1, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 24
    :cond_1
    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalContext()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    check-cast v0, Landroidx/compose/runtime/CompositionLocal;

    .local v0, "this_\\1":Landroidx/compose/runtime/CompositionLocal;
    const/4 v1, 0x0

    .local v1, "$changed\\1":I
    move-object v2, v4

    .local v2, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 61
    .local v3, "$i$f$getCurrent\\1\\24":I
    const v5, 0x789c5f52

    const-string v6, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v2, v5, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 24
    .end local v0    # "this_\\1":Landroidx/compose/runtime/CompositionLocal;
    .end local v1    # "$changed\\1":I
    .end local v2    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$getCurrent\\1\\24":I
    move-object v0, v5

    check-cast v0, Landroid/content/Context;

    .line 27
    .local v0, "context":Landroid/content/Context;
    const v1, -0x716740e7

    const-string v2, "CC(remember):Navigation.kt#9igjgp"

    invoke-static {v4, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v1, 0x0

    .local v1, "invalid\\2":Z
    move-object v3, v4

    .local v3, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 62
    .local v5, "$i$f$cache\\2\\27":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it\\2":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 63
    .local v7, "$i$a$-let-ComposerKt$cache$1\\3\\62\\2":I
    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v6, v8, :cond_2

    .line 64
    const/4 v8, 0x0

    .line 28
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$1\\4\\64\\0":I
    sget-object v9, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v9, v0}, Lcom/example/nirikshak/network/OfficerSession;->init(Landroid/content/Context;)V

    .line 29
    nop

    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$1\\4\\64\\0":I
    sget-object v8, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 64
    nop

    .line 65
    .local v8, "value\\3":Ljava/lang/Object;
    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 66
    nop

    .end local v8    # "value\\3":Ljava/lang/Object;
    goto :goto_1

    .line 67
    :cond_2
    nop

    .line 62
    .end local v6    # "it\\2":Ljava/lang/Object;
    .end local v7    # "$i$a$-let-ComposerKt$cache$1\\3\\62\\2":I
    :goto_1
    nop

    .line 27
    .end local v1    # "invalid\\2":Z
    .end local v3    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache\\2\\27":I
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 31
    const v1, -0x716737ab

    invoke-static {v4, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v1, 0x0

    .local v1, "invalid\\5":Z
    move-object v3, v4

    .local v3, "$this$cache\\5":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 68
    .local v5, "$i$f$cache\\5\\31":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it\\5":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 69
    .local v7, "$i$a$-let-ComposerKt$cache$1\\6\\68\\5":I
    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v6, v8, :cond_4

    .line 70
    const/4 v8, 0x0

    .line 32
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$currentScreen$2\\7\\70\\0":I
    sget-object v9, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v9}, Lcom/example/nirikshak/network/OfficerSession;->isLoggedIn()Z

    move-result v9

    if-eqz v9, :cond_3

    sget-object v9, Lcom/example/nirikshak/ScreenState;->HOME:Lcom/example/nirikshak/ScreenState;

    goto :goto_2

    :cond_3
    sget-object v9, Lcom/example/nirikshak/ScreenState;->LANDING:Lcom/example/nirikshak/ScreenState;

    :goto_2
    const/4 v10, 0x2

    const/4 v11, 0x0

    invoke-static {v9, v11, v10, v11}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v8

    .line 70
    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$currentScreen$2\\7\\70\\0":I
    nop

    .line 71
    .local v8, "value\\6":Ljava/lang/Object;
    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 72
    move-object v6, v8

    .end local v8    # "value\\6":Ljava/lang/Object;
    goto :goto_3

    .line 73
    :cond_4
    nop

    .line 68
    .end local v6    # "it\\5":Ljava/lang/Object;
    .end local v7    # "$i$a$-let-ComposerKt$cache$1\\6\\68\\5":I
    :goto_3
    nop

    .line 31
    .end local v1    # "invalid\\5":Z
    .end local v3    # "$this$cache\\5":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache\\5\\31":I
    move-object v7, v6

    check-cast v7, Landroidx/compose/runtime/MutableState;

    .local v7, "currentScreen$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 35
    invoke-static {v7}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$2(Landroidx/compose/runtime/MutableState;)Lcom/example/nirikshak/ScreenState;

    move-result-object v1

    sget-object v3, Lcom/example/nirikshak/NavigationKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Lcom/example/nirikshak/ScreenState;->ordinal()I

    move-result v1

    aget v1, v3, v1

    packed-switch v1, :pswitch_data_0

    const p0, -0x7167279b

    invoke-interface {v4, p0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    .line 58
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 35
    new-instance p0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0

    .line 49
    :pswitch_0
    const v1, 0x4488fa0f

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "50@1450L97,49@1418L187"

    invoke-static {v4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 51
    const v1, -0x7166eb15

    invoke-static {v4, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v1

    .local v1, "invalid\\17":Z
    move-object v2, v4

    .local v2, "$this$cache\\17":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 92
    .local v3, "$i$f$cache\\17\\51":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\17":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 93
    .local v6, "$i$a$-let-ComposerKt$cache$1\\18\\92\\17":I
    if-nez v1, :cond_6

    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v5, v8, :cond_5

    goto :goto_4

    .line 97
    :cond_5
    goto :goto_5

    .line 94
    :cond_6
    :goto_4
    const/4 v8, 0x0

    .line 51
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$5\\19\\94\\0":I
    new-instance v9, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda3;

    invoke-direct {v9, v0, v7}, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda3;-><init>(Landroid/content/Context;Landroidx/compose/runtime/MutableState;)V

    .line 94
    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$5\\19\\94\\0":I
    nop

    .line 95
    .local v9, "value\\18":Ljava/lang/Object;
    invoke-interface {v2, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 96
    move-object v5, v9

    .line 92
    .end local v5    # "it\\17":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1\\18\\92\\17":I
    .end local v9    # "value\\18":Ljava/lang/Object;
    :goto_5
    nop

    .line 51
    .end local v1    # "invalid\\17":Z
    .end local v2    # "$this$cache\\17":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache\\17\\51":I
    check-cast v5, Lkotlin/jvm/functions/Function0;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 55
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    invoke-static {v1}, Landroidx/compose/foundation/layout/WindowInsetsPadding_androidKt;->safeDrawingPadding(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 50
    invoke-static {v5, v1, v4, p0, p0}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->HomeScreen(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V

    .line 49
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto/16 :goto_9

    .line 42
    :pswitch_1
    const p0, 0x448568c5

    invoke-interface {v4, p0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string p0, "43@1220L39,44@1285L36,42@1182L197"

    invoke-static {v4, p0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 44
    const p0, -0x7167080f

    invoke-static {v4, p0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 p0, 0x0

    .local p0, "invalid\\11":Z
    move-object v1, v4

    .local v1, "$this$cache\\11":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 80
    .local v3, "$i$f$cache\\11\\44":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\11":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 81
    .local v6, "$i$a$-let-ComposerKt$cache$1\\12\\80\\11":I
    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v5, v8, :cond_7

    .line 82
    const/4 v8, 0x0

    .line 44
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$3\\13\\82\\0":I
    new-instance v9, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda1;

    invoke-direct {v9, v7}, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 82
    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$3\\13\\82\\0":I
    nop

    .line 83
    .local v9, "value\\12":Ljava/lang/Object;
    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 84
    move-object v5, v9

    .end local v9    # "value\\12":Ljava/lang/Object;
    goto :goto_6

    .line 85
    :cond_7
    nop

    .line 80
    .end local v5    # "it\\11":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1\\12\\80\\11":I
    :goto_6
    nop

    .line 44
    .end local v1    # "$this$cache\\11":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache\\11\\44":I
    .end local p0    # "invalid\\11":Z
    move-object v1, v5

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 45
    const p0, -0x7166fff2

    invoke-static {v4, p0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 p0, 0x0

    .local p0, "invalid\\14":Z
    move-object v2, v4

    .local v2, "$this$cache\\14":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 86
    .local v3, "$i$f$cache\\14\\45":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\14":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 87
    .local v6, "$i$a$-let-ComposerKt$cache$1\\15\\86\\14":I
    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v5, v8, :cond_8

    .line 88
    const/4 v8, 0x0

    .line 45
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$4\\16\\88\\0":I
    new-instance v9, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda2;

    invoke-direct {v9, v7}, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 88
    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$4\\16\\88\\0":I
    nop

    .line 89
    .local v9, "value\\15":Ljava/lang/Object;
    invoke-interface {v2, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 90
    move-object v5, v9

    .end local v9    # "value\\15":Ljava/lang/Object;
    goto :goto_7

    .line 91
    :cond_8
    nop

    .line 86
    .end local v5    # "it\\14":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1\\15\\86\\14":I
    :goto_7
    nop

    .line 45
    .end local v2    # "$this$cache\\14":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache\\14\\45":I
    .end local p0    # "invalid\\14":Z
    move-object v2, v5

    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 46
    sget-object p0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast p0, Landroidx/compose/ui/Modifier;

    invoke-static {p0}, Landroidx/compose/foundation/layout/WindowInsetsPadding_androidKt;->safeDrawingPadding(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 43
    const/16 v5, 0x36

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->AuthScreen(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V

    .line 42
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto :goto_9

    .line 36
    :pswitch_2
    const v1, 0x4482b781

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "37@1049L36,36@1006L137"

    invoke-static {v4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 38
    const v1, -0x71671d72

    invoke-static {v4, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v1, 0x0

    .local v1, "invalid\\8":Z
    move-object v2, v4

    .local v2, "$this$cache\\8":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 74
    .local v3, "$i$f$cache\\8\\38":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\8":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 75
    .local v6, "$i$a$-let-ComposerKt$cache$1\\9\\74\\8":I
    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v5, v8, :cond_9

    .line 76
    const/4 v8, 0x0

    .line 38
    .local v8, "$i$a$-cache-NavigationKt$MainNavigation$2\\10\\76\\0":I
    new-instance v9, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda0;

    invoke-direct {v9, v7}, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 76
    .end local v8    # "$i$a$-cache-NavigationKt$MainNavigation$2\\10\\76\\0":I
    nop

    .line 77
    .local v9, "value\\9":Ljava/lang/Object;
    invoke-interface {v2, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 78
    move-object v5, v9

    .end local v9    # "value\\9":Ljava/lang/Object;
    goto :goto_8

    .line 79
    :cond_9
    nop

    .line 74
    .end local v5    # "it\\8":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1\\9\\74\\8":I
    :goto_8
    nop

    .line 38
    .end local v1    # "invalid\\8":Z
    .end local v2    # "$this$cache\\8":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache\\8\\38":I
    check-cast v5, Lkotlin/jvm/functions/Function0;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 39
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    invoke-static {v1}, Landroidx/compose/foundation/layout/WindowInsetsPadding_androidKt;->safeDrawingPadding(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 37
    const/4 v2, 0x6

    invoke-static {v5, v1, v4, v2, p0}, Lcom/example/nirikshak/ui/landing/LandingScreenKt;->LandingScreen(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V

    .line 36
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 35
    :goto_9
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_b

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v0    # "context":Landroid/content/Context;
    .end local v7    # "currentScreen$delegate":Landroidx/compose/runtime/MutableState;
    goto :goto_a

    .line 23
    :cond_a
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 59
    :cond_b
    :goto_a
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object p0

    if-eqz p0, :cond_c

    new-instance v0, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda4;

    invoke-direct {v0, p1}, Lcom/example/nirikshak/NavigationKt$$ExternalSyntheticLambda4;-><init>(I)V

    invoke-interface {p0, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_c
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static final MainNavigation$lambda$2(Landroidx/compose/runtime/MutableState;)Lcom/example/nirikshak/ScreenState;
    .locals 4
    .param p0, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/example/nirikshak/ScreenState;",
            ">;)",
            "Lcom/example/nirikshak/ScreenState;"
        }
    .end annotation

    .line 31
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 98
    .local v3, "$i$f$getValue\\1\\31":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\31":I
    check-cast v0, Lcom/example/nirikshak/ScreenState;

    .line 31
    return-object v0
.end method

.method private static final MainNavigation$lambda$3(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/ScreenState;)V
    .locals 5
    .param p0, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Lcom/example/nirikshak/ScreenState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/example/nirikshak/ScreenState;",
            ">;",
            "Lcom/example/nirikshak/ScreenState;",
            ")V"
        }
    .end annotation

    .line 31
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 99
    .local v4, "$i$f$setValue\\1\\31":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 100
    nop

    .line 31
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\31":I
    return-void
.end method

.method private static final MainNavigation$lambda$4$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 38
    sget-object v0, Lcom/example/nirikshak/ScreenState;->AUTH:Lcom/example/nirikshak/ScreenState;

    invoke-static {p0, v0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$3(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/ScreenState;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final MainNavigation$lambda$5$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 44
    sget-object v0, Lcom/example/nirikshak/ScreenState;->LANDING:Lcom/example/nirikshak/ScreenState;

    invoke-static {p0, v0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$3(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/ScreenState;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final MainNavigation$lambda$6$0(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 45
    sget-object v0, Lcom/example/nirikshak/ScreenState;->HOME:Lcom/example/nirikshak/ScreenState;

    invoke-static {p0, v0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$3(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/ScreenState;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final MainNavigation$lambda$7$0(Landroid/content/Context;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$context"    # Landroid/content/Context;
    .param p1, "$currentScreen$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 52
    sget-object v0, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v0, p0}, Lcom/example/nirikshak/network/OfficerSession;->clear(Landroid/content/Context;)V

    .line 53
    sget-object v0, Lcom/example/nirikshak/ScreenState;->LANDING:Lcom/example/nirikshak/ScreenState;

    invoke-static {p1, v0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation$lambda$3(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/ScreenState;)V

    .line 54
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final MainNavigation$lambda$8(ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p0, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/example/nirikshak/NavigationKt;->MainNavigation(Landroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
