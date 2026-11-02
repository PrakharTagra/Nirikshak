.class public final Landroidx/compose/material/ExposedDropdownMenu_androidKt;
.super Ljava/lang/Object;
.source "ExposedDropdownMenu.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nExposedDropdownMenu.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ExposedDropdownMenu.kt\nandroidx/compose/material/ExposedDropdownMenu_androidKt\n+ 2 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 5 Box.kt\nandroidx/compose/foundation/layout/BoxKt\n+ 6 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 7 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 8 Composer.kt\nandroidx/compose/runtime/Updater\n+ 9 SnapshotIntState.kt\nandroidx/compose/runtime/SnapshotIntStateKt__SnapshotIntStateKt\n+ 10 IntSize.kt\nandroidx/compose/ui/unit/IntSize\n+ 11 InlineClassHelper.kt\nandroidx/compose/ui/util/InlineClassHelperKt\n*L\n1#1,671:1\n75#2:672\n1128#3,6:673\n1128#3,6:679\n1128#3,6:686\n1128#3,6:692\n1128#3,6:698\n1128#3,6:704\n1128#3,6:710\n1128#3,6:757\n1128#3,6:763\n1#4:685\n70#5:716\n67#5,9:717\n77#5:756\n79#6,6:726\n86#6,3:741\n89#6,2:750\n93#6:755\n347#7,9:732\n356#7,3:752\n4206#8,6:744\n78#9:769\n111#9,2:770\n78#9:772\n111#9,2:773\n54#10:775\n85#11:776\n*S KotlinDebug\n*F\n+ 1 ExposedDropdownMenu.kt\nandroidx/compose/material/ExposedDropdownMenu_androidKt\n*L\n96#1:672\n98#1:673,6\n99#1:679,6\n101#1:686,6\n104#1:692,6\n117#1:698,6\n121#1:704,6\n133#1:710,6\n141#1:757,6\n143#1:763,6\n119#1:716\n119#1:717,9\n119#1:756\n119#1:726,6\n119#1:741,3\n119#1:750,2\n119#1:755\n119#1:732,9\n119#1:752,3\n119#1:744,6\n98#1:769\n98#1:770,2\n99#1:772\n99#1:773,2\n122#1:775\n122#1:776\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u001aQ\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u001c\u0010\u0008\u001a\u0018\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00010\u0005\u00a2\u0006\u0002\u0008\n\u00a2\u0006\u0002\u0008\u000bH\u0007\u00a2\u0006\u0002\u0010\u000c\u001a\"\u0010\r\u001a\u00020\u0007*\u00020\u00072\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0002\u001a6\u0010\u0011\u001a\u00020\u00012\u0006\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\u00010\u0005H\u0002\u00a8\u0006\u0019\u00b2\u0006\n\u0010\u001a\u001a\u00020\u0017X\u008a\u008e\u0002\u00b2\u0006\n\u0010\u001b\u001a\u00020\u0017X\u008a\u008e\u0002"
    }
    d2 = {
        "ExposedDropdownMenuBox",
        "",
        "expanded",
        "",
        "onExpandedChange",
        "Lkotlin/Function1;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "content",
        "Landroidx/compose/material/ExposedDropdownMenuBoxScope;",
        "Landroidx/compose/runtime/Composable;",
        "Lkotlin/ExtensionFunctionType;",
        "(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V",
        "expandable",
        "Lkotlin/Function0;",
        "menuLabel",
        "",
        "updateHeight",
        "windowBounds",
        "Landroidx/compose/ui/unit/IntRect;",
        "coordinates",
        "Landroidx/compose/ui/layout/LayoutCoordinates;",
        "verticalMarginInPx",
        "",
        "onHeightUpdate",
        "material",
        "width",
        "menuHeight"
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
.method public static synthetic $r8$lambda$79j-eKXxLuHWWxIrnDXI3QVyonk(ZLandroidx/compose/ui/focus/FocusRequester;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$13$0(ZLandroidx/compose/ui/focus/FocusRequester;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$8dr8uDTFuzGKo5faKLOZNq5i_Kk(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p7}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$15(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$9fe_f27WOn7M87Qh4Ulfja1UxwA(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$10$0$0(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Hb_YomFYKbil77cMwfcErXws4MI(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->expandable$lambda$0(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$XIVQW7IirIeQnZMBdrOV0cuKIDE(Landroidx/compose/ui/node/Ref;Landroidx/compose/material/WindowBoundsCalculator;ILandroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/ui/layout/LayoutCoordinates;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p5}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$10$0(Landroidx/compose/ui/node/Ref;Landroidx/compose/material/WindowBoundsCalculator;ILandroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/ui/layout/LayoutCoordinates;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$hVVJIMwOdEC5ksOVXxWbLoXkYoc(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$14$0$0(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$pZYd5J__lwovavX2QdRr5vSB5Wg(Lkotlin/jvm/functions/Function0;)Z
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->expandable$lambda$0$0(Lkotlin/jvm/functions/Function0;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$rg3hfKaQe_sq19wNTll5Az3ACtw(Landroidx/compose/material/WindowBoundsCalculator;Landroidx/compose/ui/node/Ref;ILandroidx/compose/runtime/MutableIntState;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$14$0(Landroidx/compose/material/WindowBoundsCalculator;Landroidx/compose/ui/node/Ref;ILandroidx/compose/runtime/MutableIntState;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$tYqmhURPftCjwp5zQBh2jwMISmc(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$11$0(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final ExposedDropdownMenuBox(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V
    .locals 40
    .param p0, "expanded"    # Z
    .param p1, "onExpandedChange"    # Lkotlin/jvm/functions/Function1;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "content"    # Lkotlin/jvm/functions/Function3;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/ui/Modifier;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Landroidx/compose/material/ExposedDropdownMenuBoxScope;",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 95
    move/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, p3

    move/from16 v5, p5

    const v0, -0x4fbbaf9f

    move-object/from16 v3, p4

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v7

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v7, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(ExposedDropdownMenuBox)N(expanded,onExpandedChange,modifier,content)95@4064L7,96@4105L32,97@4155L33,98@4211L33,100@4345L37,103@4408L536,116@4970L29,120@5061L414,132@5536L31,133@5597L38,118@5005L727,140@5749L47,140@5738L58,142@5831L273,142@5802L302:ExposedDropdownMenu.kt#jmzs0o"

    invoke-static {v7, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p5

    .local v3, "$dirty":I
    and-int/lit8 v6, v5, 0x6

    if-nez v6, :cond_1

    invoke-interface {v7, v1}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int/2addr v3, v6

    :cond_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_3

    invoke-interface {v7, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_1

    :cond_2
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v3, v6

    :cond_3
    and-int/lit8 v6, p6, 0x4

    if-eqz v6, :cond_4

    or-int/lit16 v3, v3, 0x180

    move-object/from16 v10, p2

    goto :goto_3

    :cond_4
    and-int/lit16 v10, v5, 0x180

    if-nez v10, :cond_6

    move-object/from16 v10, p2

    invoke-interface {v7, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    const/16 v11, 0x100

    goto :goto_2

    :cond_5
    const/16 v11, 0x80

    :goto_2
    or-int/2addr v3, v11

    goto :goto_3

    :cond_6
    move-object/from16 v10, p2

    :goto_3
    and-int/lit16 v11, v5, 0xc00

    if-nez v11, :cond_8

    invoke-interface {v7, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    const/16 v11, 0x800

    goto :goto_4

    :cond_7
    const/16 v11, 0x400

    :goto_4
    or-int/2addr v3, v11

    :cond_8
    move v11, v3

    .end local v3    # "$dirty":I
    .local v11, "$dirty":I
    and-int/lit16 v3, v11, 0x493

    const/16 v12, 0x492

    const/4 v14, 0x0

    if-eq v3, v12, :cond_9

    const/4 v3, 0x1

    goto :goto_5

    :cond_9
    move v3, v14

    :goto_5
    and-int/lit8 v12, v11, 0x1

    invoke-interface {v7, v3, v12}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_22

    if-eqz v6, :cond_a

    .line 93
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    move-object v10, v3

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v10, "modifier":Landroidx/compose/ui/Modifier;
    :cond_a
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_b

    const/4 v3, -0x1

    const-string v6, "androidx.compose.material.ExposedDropdownMenuBox (ExposedDropdownMenu.kt:94)"

    invoke-static {v0, v11, v3, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 96
    :cond_b
    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    check-cast v0, Landroidx/compose/runtime/CompositionLocal;

    .local v0, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v3, 0x0

    .local v3, "$changed$iv":I
    move-object v6, v7

    .local v6, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v12, 0x0

    .line 672
    .local v12, "$i$f$getCurrent":I
    const v15, 0x789c5f52

    const-string v13, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v6, v15, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v6, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 96
    .end local v0    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v3    # "$changed$iv":I
    .end local v6    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v12    # "$i$f$getCurrent":I
    move-object v0, v13

    check-cast v0, Landroidx/compose/ui/unit/Density;

    .line 97
    .local v0, "density":Landroidx/compose/ui/unit/Density;
    invoke-static {v7, v14}, Landroidx/compose/material/ExposedDropdownMenu_android;->platformWindowBoundsCalculator(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/WindowBoundsCalculator;

    move-result-object v3

    .line 98
    .local v3, "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    const v6, -0x4f8e1bfe    # -8.799931E-10f

    const-string v12, "CC(remember):ExposedDropdownMenu.kt#9igjgp"

    invoke-static {v7, v6, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v6, 0x0

    .local v6, "invalid$iv":Z
    move-object v13, v7

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 673
    .local v15, "$i$f$cache":I
    move/from16 v21, v14

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 674
    .local v16, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v14, v8, :cond_c

    .line 675
    const/4 v8, 0x0

    .line 98
    .local v8, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$width$2":I
    invoke-static/range {v21 .. v21}, Landroidx/compose/runtime/SnapshotIntStateKt;->mutableIntStateOf(I)Landroidx/compose/runtime/MutableIntState;

    move-result-object v8

    .line 675
    .end local v8    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$width$2":I
    nop

    .line 676
    .local v8, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 677
    move-object v14, v8

    .end local v8    # "value$iv":Ljava/lang/Object;
    goto :goto_6

    .line 678
    :cond_c
    nop

    .line 673
    .end local v14    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_6
    nop

    .line 98
    .end local v6    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    move-object v6, v14

    check-cast v6, Landroidx/compose/runtime/MutableIntState;

    .local v6, "width$delegate":Landroidx/compose/runtime/MutableIntState;
    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 99
    const v8, -0x4f8e14fe

    invoke-static {v7, v8, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v8, 0x0

    .local v8, "invalid$iv":Z
    move-object v13, v7

    .restart local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 679
    .local v14, "$i$f$cache":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 680
    .restart local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v15, v9, :cond_d

    .line 681
    const/4 v9, 0x0

    .line 99
    .local v9, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$menuHeight$2":I
    invoke-static/range {v21 .. v21}, Landroidx/compose/runtime/SnapshotIntStateKt;->mutableIntStateOf(I)Landroidx/compose/runtime/MutableIntState;

    move-result-object v9

    .line 681
    .end local v9    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$menuHeight$2":I
    nop

    .line 682
    .local v9, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 683
    move-object v15, v9

    .end local v9    # "value$iv":Ljava/lang/Object;
    goto :goto_7

    .line 684
    :cond_d
    nop

    .line 679
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_7
    nop

    .line 99
    .end local v8    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    move-object v8, v15

    check-cast v8, Landroidx/compose/runtime/MutableIntState;

    .local v8, "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 100
    move-object v9, v0

    .line 685
    .local v9, "$this$ExposedDropdownMenuBox_u24lambda_u246":Landroidx/compose/ui/unit/Density;
    const/4 v13, 0x0

    .line 100
    .local v13, "$i$a$-with-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$verticalMarginInPx$1":I
    invoke-static {}, Landroidx/compose/material/MenuKt;->getMenuVerticalMargin()F

    move-result v14

    invoke-interface {v9, v14}, Landroidx/compose/ui/unit/Density;->roundToPx-0680j_4(F)I

    move-result v9

    .line 101
    .end local v13    # "$i$a$-with-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$verticalMarginInPx$1":I
    .local v9, "verticalMarginInPx":I
    const v13, -0x4f8e043a

    invoke-static {v7, v13, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v13, 0x0

    .local v13, "invalid$iv":Z
    move-object v14, v7

    .local v14, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 686
    .local v15, "$i$f$cache":I
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 687
    .restart local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v23, v11

    .end local v11    # "$dirty":I
    .local v23, "$dirty":I
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v11

    if-ne v5, v11, :cond_e

    .line 688
    const/4 v11, 0x0

    .line 101
    .local v11, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$coordinates$1":I
    new-instance v17, Landroidx/compose/ui/node/Ref;

    invoke-direct/range {v17 .. v17}, Landroidx/compose/ui/node/Ref;-><init>()V

    .line 688
    .end local v11    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$coordinates$1":I
    move-object/from16 v11, v17

    .line 689
    .local v11, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 690
    move-object v5, v11

    .end local v11    # "value$iv":Ljava/lang/Object;
    goto :goto_8

    .line 691
    :cond_e
    nop

    .line 686
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_8
    nop

    .line 101
    .end local v13    # "invalid$iv":Z
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    check-cast v5, Landroidx/compose/ui/node/Ref;

    .local v5, "coordinates":Landroidx/compose/ui/node/Ref;
    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 104
    invoke-static {v8}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$4(Landroidx/compose/runtime/MutableIntState;)I

    move-result v11

    invoke-static {v6}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$1(Landroidx/compose/runtime/MutableIntState;)I

    move-result v13

    const v14, -0x4f8dfa67

    invoke-static {v7, v14, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    invoke-interface {v7, v11}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v11

    or-int/2addr v11, v14

    invoke-interface {v7, v13}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v13

    or-int/2addr v11, v13

    .local v11, "invalid$iv":Z
    move-object v13, v7

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 692
    .local v14, "$i$f$cache":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 693
    .restart local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v11, :cond_10

    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p2, v11

    .end local v11    # "invalid$iv":Z
    .local p2, "invalid$iv":Z
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v11

    if-ne v15, v11, :cond_f

    goto :goto_9

    .line 697
    :cond_f
    goto :goto_a

    .line 693
    .end local p2    # "invalid$iv":Z
    .restart local v11    # "invalid$iv":Z
    :cond_10
    move/from16 p2, v11

    .line 694
    .end local v11    # "invalid$iv":Z
    .restart local p2    # "invalid$iv":Z
    :goto_9
    const/4 v11, 0x0

    .line 105
    .local v11, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1":I
    move/from16 v17, v11

    .end local v11    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1":I
    .local v17, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1":I
    new-instance v11, Landroidx/compose/material/ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1$1;

    invoke-direct {v11, v0, v8, v6}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1$1;-><init>(Landroidx/compose/ui/unit/Density;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;)V

    .line 115
    nop

    .line 694
    .end local v17    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1":I
    nop

    .line 695
    .local v11, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 696
    move-object v15, v11

    .line 692
    .end local v11    # "value$iv":Ljava/lang/Object;
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_a
    nop

    .line 104
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local p2    # "invalid$iv":Z
    check-cast v15, Landroidx/compose/material/ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1$1;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 103
    move-object v11, v15

    .line 117
    .local v11, "scope":Landroidx/compose/material/ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1$1;
    const v13, -0x4f8db622

    invoke-static {v7, v13, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v13, 0x0

    .local v13, "invalid$iv":Z
    move-object v14, v7

    .local v14, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 698
    .local v15, "$i$f$cache":I
    move-object/from16 p2, v0

    .end local v0    # "density":Landroidx/compose/ui/unit/Density;
    .local p2, "density":Landroidx/compose/ui/unit/Density;
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 699
    .restart local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v19, v6

    .end local v6    # "width$delegate":Landroidx/compose/runtime/MutableIntState;
    .local v19, "width$delegate":Landroidx/compose/runtime/MutableIntState;
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v0, v6, :cond_11

    .line 700
    const/4 v6, 0x0

    .line 117
    .local v6, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$focusRequester$1":I
    new-instance v17, Landroidx/compose/ui/focus/FocusRequester;

    invoke-direct/range {v17 .. v17}, Landroidx/compose/ui/focus/FocusRequester;-><init>()V

    .line 700
    .end local v6    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$focusRequester$1":I
    move-object/from16 v6, v17

    .line 701
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 702
    move-object v0, v6

    .end local v6    # "value$iv":Ljava/lang/Object;
    goto :goto_b

    .line 703
    :cond_11
    nop

    .line 698
    .end local v0    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_b
    nop

    .line 117
    .end local v13    # "invalid$iv":Z
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    check-cast v0, Landroidx/compose/ui/focus/FocusRequester;

    .local v0, "focusRequester":Landroidx/compose/ui/focus/FocusRequester;
    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 120
    nop

    .line 121
    const v6, -0x4f8da941

    invoke-static {v7, v6, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v7, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v6, v13

    invoke-interface {v7, v9}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v13

    or-int/2addr v6, v13

    .local v6, "invalid$iv":Z
    move-object v13, v7

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 704
    .local v14, "$i$f$cache":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v24, 0x0

    .line 705
    .local v24, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v6, :cond_13

    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v17, v3

    .end local v3    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .local v17, "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v15, v3, :cond_12

    goto :goto_c

    .line 709
    :cond_12
    move-object v3, v15

    move-object v15, v5

    move-object v5, v3

    move-object/from16 v3, v17

    goto :goto_d

    .line 705
    .end local v17    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .restart local v3    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    :cond_13
    move-object/from16 v17, v3

    .line 706
    .end local v3    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .restart local v17    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    :goto_c
    const/4 v3, 0x0

    .line 121
    .local v3, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$1":I
    move-object/from16 v16, v15

    .end local v15    # "it$iv":Ljava/lang/Object;
    .local v16, "it$iv":Ljava/lang/Object;
    new-instance v15, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda3;

    move-object/from16 v18, v16

    move-object/from16 v16, v5

    move-object/from16 v5, v18

    move-object/from16 v20, v8

    move/from16 v18, v9

    .end local v8    # "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    .end local v9    # "verticalMarginInPx":I
    .local v5, "it$iv":Ljava/lang/Object;
    .local v16, "coordinates":Landroidx/compose/ui/node/Ref;
    .local v18, "verticalMarginInPx":I
    .local v20, "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    invoke-direct/range {v15 .. v20}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda3;-><init>(Landroidx/compose/ui/node/Ref;Landroidx/compose/material/WindowBoundsCalculator;ILandroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;)V

    .line 706
    move-object/from16 v3, v16

    move-object/from16 v16, v15

    move-object v15, v3

    move-object/from16 v3, v17

    .end local v16    # "coordinates":Landroidx/compose/ui/node/Ref;
    .end local v17    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .end local v18    # "verticalMarginInPx":I
    .end local v20    # "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    .local v3, "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .restart local v8    # "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    .restart local v9    # "verticalMarginInPx":I
    .local v15, "coordinates":Landroidx/compose/ui/node/Ref;
    move-object/from16 v17, v16

    .line 707
    .local v17, "value$iv":Ljava/lang/Object;
    move-object/from16 v16, v5

    move-object/from16 v5, v17

    .end local v17    # "value$iv":Ljava/lang/Object;
    .local v5, "value$iv":Ljava/lang/Object;
    .local v16, "it$iv":Ljava/lang/Object;
    invoke-interface {v13, v5}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 708
    nop

    .line 704
    .end local v5    # "value$iv":Ljava/lang/Object;
    .end local v16    # "it$iv":Ljava/lang/Object;
    .end local v24    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_d
    nop

    .line 121
    .end local v6    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    check-cast v5, Lkotlin/jvm/functions/Function1;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v10, v5}, Landroidx/compose/ui/layout/OnGloballyPositionedModifierKt;->onGloballyPositioned(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 133
    const v6, -0x4f8d6f60

    invoke-static {v7, v6, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v6, v23, 0x70

    const/16 v13, 0x20

    if-ne v6, v13, :cond_14

    const/4 v6, 0x1

    goto :goto_e

    :cond_14
    move/from16 v6, v21

    :goto_e
    and-int/lit8 v13, v23, 0xe

    const/4 v14, 0x4

    if-ne v13, v14, :cond_15

    const/4 v13, 0x1

    goto :goto_f

    :cond_15
    move/from16 v13, v21

    :goto_f
    or-int/2addr v6, v13

    .restart local v6    # "invalid$iv":Z
    move-object v13, v7

    .restart local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 710
    .restart local v14    # "$i$f$cache":I
    move/from16 v16, v6

    .end local v6    # "invalid$iv":Z
    .local v16, "invalid$iv":Z
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 711
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v16, :cond_17

    sget-object v18, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v20, v10

    .end local v10    # "modifier":Landroidx/compose/ui/Modifier;
    .local v20, "modifier":Landroidx/compose/ui/Modifier;
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v10

    if-ne v6, v10, :cond_16

    goto :goto_10

    .line 715
    :cond_16
    goto :goto_11

    .line 711
    .end local v20    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v10    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_17
    move-object/from16 v20, v10

    .line 712
    .end local v10    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v20    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_10
    const/4 v10, 0x0

    .line 133
    .local v10, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$2":I
    move-object/from16 v18, v6

    .end local v6    # "it$iv":Ljava/lang/Object;
    .local v18, "it$iv":Ljava/lang/Object;
    new-instance v6, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda4;

    invoke-direct {v6, v2, v1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda4;-><init>(Lkotlin/jvm/functions/Function1;Z)V

    .line 712
    .end local v10    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$2":I
    nop

    .line 713
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 714
    nop

    .line 710
    .end local v6    # "value$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v18    # "it$iv":Ljava/lang/Object;
    :goto_11
    nop

    .line 133
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local v16    # "invalid$iv":Z
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 134
    sget-object v10, Landroidx/compose/material/Strings;->Companion:Landroidx/compose/material/Strings$Companion;

    invoke-virtual {v10}, Landroidx/compose/material/Strings$Companion;->getExposedDropdownMenu-UdPEhr4()I

    move-result v10

    const/4 v13, 0x6

    invoke-static {v10, v7, v13}, Landroidx/compose/material/Strings_androidKt;->getString-4foXLRw(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;

    move-result-object v10

    .line 132
    invoke-static {v5, v6, v10}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->expandable(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 136
    invoke-static {v5, v0}, Landroidx/compose/ui/focus/FocusRequesterModifierKt;->focusRequester(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/focus/FocusRequester;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 119
    nop

    .local v5, "modifier$iv":Landroidx/compose/ui/Modifier;
    move-object v6, v7

    .local v6, "$composer$iv":Landroidx/compose/runtime/Composer;
    move/from16 v10, v21

    .local v10, "$changed$iv":I
    const/4 v14, 0x0

    .line 716
    .local v14, "$i$f$Box":I
    move/from16 v16, v13

    const v13, 0x2bb5b5d7

    const-string v2, "CC(Box)P(2,1,3)71@3423L130:Box.kt#2w3rfo"

    invoke-static {v6, v13, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 717
    sget-object v2, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/Alignment$Companion;->getTopStart()Landroidx/compose/ui/Alignment;

    move-result-object v2

    .line 718
    .local v2, "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    const/4 v13, 0x0

    .line 721
    .local v13, "propagateMinConstraints$iv":Z
    move-object/from16 v17, v5

    .end local v5    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v17, "modifier$iv":Landroidx/compose/ui/Modifier;
    invoke-static {v2, v13}, Landroidx/compose/foundation/layout/BoxKt;->maybeCachedBoxMeasurePolicy(Landroidx/compose/ui/Alignment;Z)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v5

    .line 725
    .local v5, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v18, v10, 0x3

    and-int/lit8 v18, v18, 0x70

    .line 722
    nop

    .local v18, "$changed$iv$iv":I
    move-object/from16 v22, v17

    .local v22, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/16 v24, 0x0

    .line 726
    .local v24, "$i$f$Layout":I
    move-object/from16 v25, v2

    .end local v2    # "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .local v25, "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    const v2, -0x4ee9b9da

    move/from16 v26, v10

    .end local v10    # "$changed$iv":I
    .local v26, "$changed$iv":I
    const-string v10, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v6, v2, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 727
    move/from16 v2, v21

    invoke-static {v6, v2}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v10

    .line 728
    .local v10, "compositeKeyHash$iv$iv":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v2

    .line 729
    .local v2, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    move/from16 v27, v10

    move-object/from16 v10, v22

    move/from16 v22, v13

    .end local v13    # "propagateMinConstraints$iv":Z
    .local v10, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v22, "propagateMinConstraints$iv":Z
    .local v27, "compositeKeyHash$iv$iv":I
    invoke-static {v6, v10}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v13

    .line 731
    .local v13, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v28, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v28 .. v28}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v28

    move-object/from16 v29, v10

    .end local v10    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v29, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v10, v18, 0x6

    and-int/lit16 v10, v10, 0x380

    or-int/lit8 v10, v10, 0x6

    .line 730
    move-object/from16 v30, v28

    .local v10, "$changed$iv$iv$iv":I
    .local v30, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v28, 0x0

    .line 732
    .local v28, "$i$f$ReusableComposeNode":I
    move/from16 v31, v10

    .end local v10    # "$changed$iv$iv$iv":I
    .local v31, "$changed$iv$iv$iv":I
    const v10, -0x2942ffcf

    move/from16 v32, v14

    .end local v14    # "$i$f$Box":I
    .local v32, "$i$f$Box":I
    const-string v14, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v6, v10, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 733
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v10

    instance-of v10, v10, Landroidx/compose/runtime/Applier;

    if-nez v10, :cond_18

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 734
    :cond_18
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 735
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v10

    if-eqz v10, :cond_19

    .line 736
    move-object/from16 v10, v30

    .end local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v10, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v6, v10}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_12

    .line 738
    .end local v10    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_19
    move-object/from16 v10, v30

    .end local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v10    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 740
    :goto_12
    invoke-static {v6}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v14

    .local v14, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v30, 0x0

    .line 741
    .local v30, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v33, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v34, v6

    .end local v6    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v34, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v33 .. v33}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v6

    invoke-static {v14, v5, v6}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 742
    sget-object v6, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v6

    invoke-static {v14, v2, v6}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 743
    sget-object v6, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v6

    .local v6, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v33, 0x0

    .line 744
    .local v33, "$i$f$set-impl":I
    move-object/from16 v35, v14

    .local v35, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v36, 0x0

    .line 745
    .local v36, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v35 .. v35}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v37

    if-nez v37, :cond_1b

    move-object/from16 v37, v2

    .end local v2    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .local v37, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v35 .. v35}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v38, v5

    .end local v5    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v38, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    goto :goto_13

    :cond_1a
    move-object/from16 v5, v35

    goto :goto_14

    .end local v37    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v38    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v2    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v5    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_1b
    move-object/from16 v37, v2

    move-object/from16 v38, v5

    .line 746
    .end local v2    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v5    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v37    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v38    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_13
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v5, v35

    .end local v35    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v5, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 747
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v14, v2, v6}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 749
    :goto_14
    nop

    .line 744
    .end local v5    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v36    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 749
    nop

    .line 750
    .end local v6    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v33    # "$i$f$set-impl":I
    sget-object v2, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v2

    invoke-static {v14, v13, v2}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 751
    nop

    .line 740
    .end local v14    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v30    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 752
    shr-int/lit8 v2, v31, 0x6

    and-int/lit8 v2, v2, 0xe

    .local v2, "$changed$iv":I
    move-object/from16 v5, v34

    .local v5, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 723
    .local v6, "$i$a$-Layout-BoxKt$Box$1$iv":I
    const v14, -0x7ff482d7

    move/from16 v30, v2

    .end local v2    # "$changed$iv":I
    .local v30, "$changed$iv":I
    const-string v2, "C72@3468L9:Box.kt#2w3rfo"

    invoke-static {v5, v14, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v2, Landroidx/compose/foundation/layout/BoxScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/BoxScopeInstance;

    shr-int/lit8 v14, v26, 0x6

    and-int/lit8 v14, v14, 0x70

    or-int/lit8 v14, v14, 0x6

    .local v14, "$changed":I
    check-cast v2, Landroidx/compose/foundation/layout/BoxScope;

    .local v2, "$this$ExposedDropdownMenuBox_u24lambda_u2412":Landroidx/compose/foundation/layout/BoxScope;
    move-object/from16 v16, v5

    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v33, 0x0

    .line 138
    .local v33, "$i$a$-Box-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$3":I
    move-object/from16 v35, v2

    .end local v2    # "$this$ExposedDropdownMenuBox_u24lambda_u2412":Landroidx/compose/foundation/layout/BoxScope;
    .local v35, "$this$ExposedDropdownMenuBox_u24lambda_u2412":Landroidx/compose/foundation/layout/BoxScope;
    const v2, 0x1f6de019

    move-object/from16 v36, v5

    .end local v5    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v36, "$composer$iv":Landroidx/compose/runtime/Composer;
    const-string v5, "C137@5717L9:ExposedDropdownMenu.kt#jmzs0o"

    move/from16 v39, v6

    move-object/from16 v6, v16

    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    .local v39, "$i$a$-Layout-BoxKt$Box$1$iv":I
    invoke-static {v6, v2, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    shr-int/lit8 v2, v23, 0x6

    and-int/lit8 v2, v2, 0x70

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v4, v11, v6, v2}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 139
    nop

    .line 723
    .end local v6    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v14    # "$changed":I
    .end local v33    # "$i$a$-Box-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$3":I
    .end local v35    # "$this$ExposedDropdownMenuBox_u24lambda_u2412":Landroidx/compose/foundation/layout/BoxScope;
    invoke-static/range {v36 .. v36}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 752
    .end local v30    # "$changed$iv":I
    .end local v36    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v39    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    nop

    .line 753
    invoke-interface/range {v34 .. v34}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 732
    invoke-static/range {v34 .. v34}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 754
    nop

    .line 726
    .end local v10    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .end local v28    # "$i$f$ReusableComposeNode":I
    .end local v31    # "$changed$iv$iv$iv":I
    invoke-static/range {v34 .. v34}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 755
    nop

    .line 716
    .end local v13    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v18    # "$changed$iv$iv":I
    .end local v24    # "$i$f$Layout":I
    .end local v27    # "compositeKeyHash$iv$iv":I
    .end local v29    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v37    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v34 .. v34}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 756
    nop

    .line 141
    .end local v17    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v22    # "propagateMinConstraints$iv":Z
    .end local v25    # "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .end local v26    # "$changed$iv":I
    .end local v32    # "$i$f$Box":I
    .end local v34    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v38    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    const v2, -0x4f8d54b0

    invoke-static {v7, v2, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v2, v23, 0xe

    const/4 v14, 0x4

    if-ne v2, v14, :cond_1c

    const/4 v13, 0x1

    goto :goto_15

    :cond_1c
    const/4 v13, 0x0

    .local v13, "invalid$iv":Z
    :goto_15
    move-object v2, v7

    .local v2, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 757
    .local v5, "$i$f$cache":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 758
    .local v10, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v13, :cond_1e

    sget-object v14, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v14}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v6, v14, :cond_1d

    goto :goto_16

    .line 762
    :cond_1d
    goto :goto_17

    .line 759
    :cond_1e
    :goto_16
    const/4 v14, 0x0

    .line 141
    .local v14, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$4":I
    new-instance v4, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda5;

    invoke-direct {v4, v1, v0}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda5;-><init>(ZLandroidx/compose/ui/focus/FocusRequester;)V

    .line 759
    .end local v14    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$4":I
    nop

    .line 760
    .local v4, "value$iv":Ljava/lang/Object;
    invoke-interface {v2, v4}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 761
    move-object v6, v4

    .line 757
    .end local v4    # "value$iv":Ljava/lang/Object;
    .end local v6    # "it$iv":Ljava/lang/Object;
    .end local v10    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_17
    nop

    .line 141
    .end local v2    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache":I
    .end local v13    # "invalid$iv":Z
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v2, 0x0

    invoke-static {v6, v7, v2}, Landroidx/compose/runtime/EffectsKt;->SideEffect(Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V

    .line 143
    const v2, -0x4f8d498e

    invoke-static {v7, v2, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v2

    invoke-interface {v7, v15}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v2, v4

    invoke-interface {v7, v9}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v4

    or-int/2addr v2, v4

    .local v2, "invalid$iv":Z
    move-object v4, v7

    .local v4, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 763
    .restart local v5    # "$i$f$cache":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "it$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 764
    .restart local v10    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v2, :cond_20

    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v6, v12, :cond_1f

    goto :goto_18

    .line 768
    :cond_1f
    goto :goto_19

    .line 765
    :cond_20
    :goto_18
    const/4 v12, 0x0

    .line 143
    .local v12, "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$5":I
    new-instance v13, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda6;

    invoke-direct {v13, v3, v15, v9, v8}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda6;-><init>(Landroidx/compose/material/WindowBoundsCalculator;Landroidx/compose/ui/node/Ref;ILandroidx/compose/runtime/MutableIntState;)V

    .line 765
    .end local v12    # "$i$a$-cache-ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$5":I
    nop

    .line 766
    .local v13, "value$iv":Ljava/lang/Object;
    invoke-interface {v4, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 767
    move-object v6, v13

    .line 763
    .end local v6    # "it$iv":Ljava/lang/Object;
    .end local v10    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v13    # "value$iv":Ljava/lang/Object;
    :goto_19
    nop

    .line 143
    .end local v2    # "invalid$iv":Z
    .end local v4    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache":I
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v2, 0x0

    invoke-static {v6, v7, v2}, Landroidx/compose/material/ExposedDropdownMenu_android;->OnPlatformWindowBoundsChange(Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 152
    .end local v0    # "focusRequester":Landroidx/compose/ui/focus/FocusRequester;
    .end local v3    # "windowBoundsCalculator":Landroidx/compose/material/WindowBoundsCalculator;
    .end local v8    # "menuHeight$delegate":Landroidx/compose/runtime/MutableIntState;
    .end local v9    # "verticalMarginInPx":I
    .end local v11    # "scope":Landroidx/compose/material/ExposedDropdownMenu_androidKt$ExposedDropdownMenuBox$scope$1$1;
    .end local v15    # "coordinates":Landroidx/compose/ui/node/Ref;
    .end local v19    # "width$delegate":Landroidx/compose/runtime/MutableIntState;
    .end local p2    # "density":Landroidx/compose/ui/unit/Density;
    :cond_21
    move-object/from16 v3, v20

    goto :goto_1a

    .line 90
    .end local v20    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v23    # "$dirty":I
    .local v11, "$dirty":I
    .local p2, "modifier":Landroidx/compose/ui/Modifier;
    :cond_22
    move/from16 v23, v11

    .end local v11    # "$dirty":I
    .restart local v23    # "$dirty":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v3, v10

    .line 152
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    :goto_1a
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v8

    if-eqz v8, :cond_23

    new-instance v0, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda7;

    move-object/from16 v2, p1

    move-object/from16 v4, p3

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda7;-><init>(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;II)V

    invoke-interface {v8, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_23
    return-void
.end method

.method private static final ExposedDropdownMenuBox$lambda$1(Landroidx/compose/runtime/MutableIntState;)I
    .locals 4
    .param p0, "$width$delegate"    # Landroidx/compose/runtime/MutableIntState;

    .line 98
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/IntState;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/IntState;
    const/4 v1, 0x0

    .local v1, "thisObj$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 769
    .local v3, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/IntState;->getIntValue()I

    move-result v0

    .line 98
    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/IntState;
    .end local v1    # "thisObj$iv":Ljava/lang/Object;
    .end local v2    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue":I
    return v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$10$0(Landroidx/compose/ui/node/Ref;Landroidx/compose/material/WindowBoundsCalculator;ILandroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/ui/layout/LayoutCoordinates;)Lkotlin/Unit;
    .locals 8
    .param p0, "$coordinates"    # Landroidx/compose/ui/node/Ref;
    .param p1, "$windowBoundsCalculator"    # Landroidx/compose/material/WindowBoundsCalculator;
    .param p2, "$verticalMarginInPx"    # I
    .param p3, "$width$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p4, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p5, "it"    # Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 122
    invoke-interface {p5}, Landroidx/compose/ui/layout/LayoutCoordinates;->getSize-YbymL2g()J

    move-result-wide v0

    .local v0, "arg0$iv":J
    const/4 v2, 0x0

    .line 775
    .local v2, "$i$f$getWidth-impl":I
    move-wide v3, v0

    .local v3, "value$iv$iv":J
    const/4 v5, 0x0

    .line 776
    .local v5, "$i$f$unpackInt1":I
    const/16 v6, 0x20

    shr-long v6, v3, v6

    long-to-int v3, v6

    .line 775
    .end local v3    # "value$iv$iv":J
    .end local v5    # "$i$f$unpackInt1":I
    nop

    .line 122
    .end local v0    # "arg0$iv":J
    .end local v2    # "$i$f$getWidth-impl":I
    invoke-static {p3, v3}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$2(Landroidx/compose/runtime/MutableIntState;I)V

    .line 123
    invoke-virtual {p0, p5}, Landroidx/compose/ui/node/Ref;->setValue(Ljava/lang/Object;)V

    .line 125
    invoke-virtual {p1}, Landroidx/compose/material/WindowBoundsCalculator;->getVisibleWindowBounds()Landroidx/compose/ui/unit/IntRect;

    move-result-object v0

    .line 126
    invoke-virtual {p0}, Landroidx/compose/ui/node/Ref;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 127
    nop

    .line 124
    new-instance v2, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda2;

    invoke-direct {v2, p4}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/runtime/MutableIntState;)V

    invoke-static {v0, v1, p2, v2}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->updateHeight(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/layout/LayoutCoordinates;ILkotlin/jvm/functions/Function1;)V

    .line 131
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$10$0$0(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;
    .locals 1
    .param p0, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p1, "newHeight"    # I

    .line 129
    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$5(Landroidx/compose/runtime/MutableIntState;I)V

    .line 130
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$11$0(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;
    .locals 1
    .param p0, "$onExpandedChange"    # Lkotlin/jvm/functions/Function1;
    .param p1, "$expanded"    # Z

    .line 133
    xor-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$13$0(ZLandroidx/compose/ui/focus/FocusRequester;)Lkotlin/Unit;
    .locals 3
    .param p0, "$expanded"    # Z
    .param p1, "$focusRequester"    # Landroidx/compose/ui/focus/FocusRequester;

    .line 141
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v1}, Landroidx/compose/ui/focus/FocusRequester;->requestFocus-3ESFkO8$default(Landroidx/compose/ui/focus/FocusRequester;IILjava/lang/Object;)Z

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$14$0(Landroidx/compose/material/WindowBoundsCalculator;Landroidx/compose/ui/node/Ref;ILandroidx/compose/runtime/MutableIntState;)Lkotlin/Unit;
    .locals 3
    .param p0, "$windowBoundsCalculator"    # Landroidx/compose/material/WindowBoundsCalculator;
    .param p1, "$coordinates"    # Landroidx/compose/ui/node/Ref;
    .param p2, "$verticalMarginInPx"    # I
    .param p3, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;

    .line 145
    invoke-virtual {p0}, Landroidx/compose/material/WindowBoundsCalculator;->getVisibleWindowBounds()Landroidx/compose/ui/unit/IntRect;

    move-result-object v0

    .line 146
    invoke-virtual {p1}, Landroidx/compose/ui/node/Ref;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/ui/layout/LayoutCoordinates;

    .line 147
    nop

    .line 144
    new-instance v2, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda1;

    invoke-direct {v2, p3}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/MutableIntState;)V

    invoke-static {v0, v1, p2, v2}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->updateHeight(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/layout/LayoutCoordinates;ILkotlin/jvm/functions/Function1;)V

    .line 151
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$14$0$0(Landroidx/compose/runtime/MutableIntState;I)Lkotlin/Unit;
    .locals 1
    .param p0, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p1, "newHeight"    # I

    .line 149
    invoke-static {p0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$5(Landroidx/compose/runtime/MutableIntState;I)V

    .line 150
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$15(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 8

    or-int/lit8 v0, p4, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v6

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v7, p5

    move-object v5, p6

    invoke-static/range {v1 .. v7}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final ExposedDropdownMenuBox$lambda$2(Landroidx/compose/runtime/MutableIntState;I)V
    .locals 5
    .param p0, "$width$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p1, "<set-?>"    # I

    .line 98
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move v2, p1

    .local v2, "value$iv":I
    move-object v3, p0

    .local v3, "$this$setValue$iv":Landroidx/compose/runtime/MutableIntState;
    const/4 v4, 0x0

    .line 770
    .local v4, "$i$f$setValue":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableIntState;->setIntValue(I)V

    .line 771
    nop

    .line 98
    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "value$iv":I
    .end local v3    # "$this$setValue$iv":Landroidx/compose/runtime/MutableIntState;
    .end local v4    # "$i$f$setValue":I
    return-void
.end method

.method private static final ExposedDropdownMenuBox$lambda$4(Landroidx/compose/runtime/MutableIntState;)I
    .locals 4
    .param p0, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;

    .line 99
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/IntState;

    .local v0, "$this$getValue$iv":Landroidx/compose/runtime/IntState;
    const/4 v1, 0x0

    .local v1, "thisObj$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property$iv":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 772
    .local v3, "$i$f$getValue":I
    invoke-interface {v0}, Landroidx/compose/runtime/IntState;->getIntValue()I

    move-result v0

    .line 99
    .end local v0    # "$this$getValue$iv":Landroidx/compose/runtime/IntState;
    .end local v1    # "thisObj$iv":Ljava/lang/Object;
    .end local v2    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue":I
    return v0
.end method

.method private static final ExposedDropdownMenuBox$lambda$5(Landroidx/compose/runtime/MutableIntState;I)V
    .locals 5
    .param p0, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;
    .param p1, "<set-?>"    # I

    .line 99
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move v2, p1

    .local v2, "value$iv":I
    move-object v3, p0

    .local v3, "$this$setValue$iv":Landroidx/compose/runtime/MutableIntState;
    const/4 v4, 0x0

    .line 773
    .local v4, "$i$f$setValue":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableIntState;->setIntValue(I)V

    .line 774
    nop

    .line 99
    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "value$iv":I
    .end local v3    # "$this$setValue$iv":Landroidx/compose/runtime/MutableIntState;
    .end local v4    # "$i$f$setValue":I
    return-void
.end method

.method public static final synthetic access$ExposedDropdownMenuBox$lambda$1(Landroidx/compose/runtime/MutableIntState;)I
    .locals 1
    .param p0, "$width$delegate"    # Landroidx/compose/runtime/MutableIntState;

    .line 1
    invoke-static {p0}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$1(Landroidx/compose/runtime/MutableIntState;)I

    move-result v0

    return v0
.end method

.method public static final synthetic access$ExposedDropdownMenuBox$lambda$4(Landroidx/compose/runtime/MutableIntState;)I
    .locals 1
    .param p0, "$menuHeight$delegate"    # Landroidx/compose/runtime/MutableIntState;

    .line 1
    invoke-static {p0}, Landroidx/compose/material/ExposedDropdownMenu_androidKt;->ExposedDropdownMenuBox$lambda$4(Landroidx/compose/runtime/MutableIntState;)I

    move-result v0

    return v0
.end method

.method private static final expandable(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)Landroidx/compose/ui/Modifier;
    .locals 5
    .param p0, "$this$expandable"    # Landroidx/compose/ui/Modifier;
    .param p1, "onExpandedChange"    # Lkotlin/jvm/functions/Function0;
    .param p2, "menuLabel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/Modifier;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/compose/ui/Modifier;"
        }
    .end annotation

    .line 445
    new-instance v0, Landroidx/compose/material/ExposedDropdownMenu_androidKt$expandable$1;

    invoke-direct {v0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$expandable$1;-><init>(Lkotlin/jvm/functions/Function0;)V

    check-cast v0, Landroidx/compose/ui/input/pointer/PointerInputEventHandler;

    invoke-static {p0, p1, v0}, Landroidx/compose/ui/input/pointer/SuspendingPointerInputFilterKt;->pointerInput(Landroidx/compose/ui/Modifier;Ljava/lang/Object;Landroidx/compose/ui/input/pointer/PointerInputEventHandler;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 457
    new-instance v1, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda8;

    invoke-direct {v1, p2, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Landroidx/compose/ui/semantics/SemanticsModifierKt;->semantics$default(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 463
    return-object v0
.end method

.method private static final expandable$lambda$0(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 3
    .param p0, "$menuLabel"    # Ljava/lang/String;
    .param p1, "$onExpandedChange"    # Lkotlin/jvm/functions/Function0;
    .param p2, "$this$semantics"    # Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;

    .line 458
    invoke-static {p2, p0}, Landroidx/compose/ui/semantics/SemanticsPropertiesKt;->setContentDescription(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;Ljava/lang/String;)V

    .line 459
    new-instance v0, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Landroidx/compose/material/ExposedDropdownMenu_androidKt$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p2, v2, v0, v1, v2}, Landroidx/compose/ui/semantics/SemanticsPropertiesKt;->onClick$default(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;Ljava/lang/String;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 463
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final expandable$lambda$0$0(Lkotlin/jvm/functions/Function0;)Z
    .locals 1
    .param p0, "$onExpandedChange"    # Lkotlin/jvm/functions/Function0;

    .line 460
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 461
    const/4 v0, 0x1

    return v0
.end method

.method private static final updateHeight(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/layout/LayoutCoordinates;ILkotlin/jvm/functions/Function1;)V
    .locals 3
    .param p0, "windowBounds"    # Landroidx/compose/ui/unit/IntRect;
    .param p1, "coordinates"    # Landroidx/compose/ui/layout/LayoutCoordinates;
    .param p2, "verticalMarginInPx"    # I
    .param p3, "onHeightUpdate"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/unit/IntRect;",
            "Landroidx/compose/ui/layout/LayoutCoordinates;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 471
    if-nez p1, :cond_0

    return-void

    .line 472
    :cond_0
    invoke-static {p1}, Landroidx/compose/ui/layout/LayoutCoordinatesKt;->boundsInWindow(Landroidx/compose/ui/layout/LayoutCoordinates;)Landroidx/compose/ui/geometry/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/ui/geometry/Rect;->getTop()F

    move-result v0

    invoke-virtual {p0}, Landroidx/compose/ui/unit/IntRect;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v0, v1

    .line 473
    .local v0, "heightAbove":F
    invoke-virtual {p0}, Landroidx/compose/ui/unit/IntRect;->getBottom()I

    move-result v1

    invoke-virtual {p0}, Landroidx/compose/ui/unit/IntRect;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-static {p1}, Landroidx/compose/ui/layout/LayoutCoordinatesKt;->boundsInWindow(Landroidx/compose/ui/layout/LayoutCoordinates;)Landroidx/compose/ui/geometry/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/ui/geometry/Rect;->getBottom()F

    move-result v2

    sub-float/2addr v1, v2

    .line 474
    .local v1, "heightBelow":F
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    sub-int/2addr v2, p2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    return-void
.end method
