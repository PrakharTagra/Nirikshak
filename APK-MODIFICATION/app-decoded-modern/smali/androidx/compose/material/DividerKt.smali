.class public final Landroidx/compose/material/DividerKt;
.super Ljava/lang/Object;
.source "Divider.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDivider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Divider.kt\nandroidx/compose/material/DividerKt\n+ 2 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 3 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n*L\n1#1,68:1\n113#2:69\n113#2:70\n123#2:72\n75#3:71\n*S KotlinDebug\n*F\n+ 1 Divider.kt\nandroidx/compose/material/DividerKt\n*L\n49#1:69\n50#1:70\n60#1:72\n60#1:71\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0000\u001a7\u0010\u0000\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\t\u0010\n\"\u000e\u0010\u000b\u001a\u00020\u000cX\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Divider",
        "",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "color",
        "Landroidx/compose/ui/graphics/Color;",
        "thickness",
        "Landroidx/compose/ui/unit/Dp;",
        "startIndent",
        "Divider-oMI9zvI",
        "(Landroidx/compose/ui/Modifier;JFFLandroidx/compose/runtime/Composer;II)V",
        "DividerAlpha",
        "",
        "material"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DividerAlpha:F = 0.12f


# direct methods
.method public static synthetic $r8$lambda$qn2ooAJgQtJWAynbiuQ_EgZT3Lw(Landroidx/compose/ui/Modifier;JFFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p8}, Landroidx/compose/material/DividerKt;->Divider_oMI9zvI$lambda$0(Landroidx/compose/ui/Modifier;JFFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final Divider-oMI9zvI(Landroidx/compose/ui/Modifier;JFFLandroidx/compose/runtime/Composer;II)V
    .locals 25
    .param p0, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "$v$c$androidx-compose-ui-unit-Dp$-thickness$0"    # F
    .param p4, "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0"    # F
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I

    .line 51
    move/from16 v6, p6

    const v0, -0x4a783646

    move-object/from16 v1, p5

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v8

    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(Divider)N(modifier,color:c#ui.graphics.Color,thickness:c#ui.unit.Dp,startIndent:c#ui.unit.Dp)63@2271L94:Divider.kt#jmzs0o"

    invoke-static {v8, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p6

    .local v1, "$dirty":I
    and-int/lit8 v2, p7, 0x1

    if-eqz v2, :cond_0

    or-int/lit8 v1, v1, 0x6

    move-object/from16 v3, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v3, v6, 0x6

    if-nez v3, :cond_2

    move-object/from16 v3, p0

    invoke-interface {v8, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x4

    goto :goto_0

    :cond_1
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v1, v4

    goto :goto_1

    :cond_2
    move-object/from16 v3, p0

    :goto_1
    and-int/lit8 v4, v6, 0x30

    if-nez v4, :cond_5

    and-int/lit8 v4, p7, 0x2

    if-nez v4, :cond_3

    move-wide/from16 v4, p1

    invoke-interface {v8, v4, v5}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v7

    if-eqz v7, :cond_4

    const/16 v7, 0x20

    goto :goto_2

    :cond_3
    move-wide/from16 v4, p1

    :cond_4
    const/16 v7, 0x10

    :goto_2
    or-int/2addr v1, v7

    goto :goto_3

    :cond_5
    move-wide/from16 v4, p1

    :goto_3
    and-int/lit8 v7, p7, 0x4

    if-eqz v7, :cond_6

    or-int/lit16 v1, v1, 0x180

    move/from16 v9, p3

    goto :goto_5

    :cond_6
    and-int/lit16 v9, v6, 0x180

    if-nez v9, :cond_8

    move/from16 v9, p3

    invoke-interface {v8, v9}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v10

    if-eqz v10, :cond_7

    const/16 v10, 0x100

    goto :goto_4

    :cond_7
    const/16 v10, 0x80

    :goto_4
    or-int/2addr v1, v10

    goto :goto_5

    :cond_8
    move/from16 v9, p3

    :goto_5
    and-int/lit8 v10, p7, 0x8

    if-eqz v10, :cond_9

    or-int/lit16 v1, v1, 0xc00

    move/from16 v11, p4

    goto :goto_7

    :cond_9
    and-int/lit16 v11, v6, 0xc00

    if-nez v11, :cond_b

    move/from16 v11, p4

    invoke-interface {v8, v11}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v12

    if-eqz v12, :cond_a

    const/16 v12, 0x800

    goto :goto_6

    :cond_a
    const/16 v12, 0x400

    :goto_6
    or-int/2addr v1, v12

    goto :goto_7

    :cond_b
    move/from16 v11, p4

    :goto_7
    and-int/lit16 v12, v1, 0x493

    const/16 v13, 0x492

    const/4 v15, 0x1

    if-eq v12, v13, :cond_c

    move v12, v15

    goto :goto_8

    :cond_c
    const/4 v12, 0x0

    :goto_8
    and-int/lit8 v13, v1, 0x1

    invoke-interface {v8, v12, v13}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v12

    if-eqz v12, :cond_19

    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v12, "47@1841L6"

    invoke-static {v8, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v12, v6, 0x1

    if-eqz v12, :cond_f

    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v12

    if-eqz v12, :cond_d

    goto :goto_9

    .line 46
    :cond_d
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p7, 0x2

    if-eqz v2, :cond_e

    and-int/lit8 v1, v1, -0x71

    :cond_e
    move-object v2, v3

    move-wide v3, v4

    move/from16 v17, v11

    goto :goto_c

    .line 51
    :cond_f
    :goto_9
    if-eqz v2, :cond_10

    .line 47
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_a

    .line 51
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_10
    move-object v2, v3

    .line 47
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_a
    and-int/lit8 v3, p7, 0x2

    if-eqz v3, :cond_11

    .line 48
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v12, 0x6

    invoke-virtual {v3, v8, v12}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getOnSurface-0d7_KjU()J

    move-result-wide v16

    const/16 v22, 0xe

    const/16 v23, 0x0

    const v18, 0x3df5c28f    # 0.12f

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-static/range {v16 .. v23}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v3

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit8 v1, v1, -0x71

    goto :goto_b

    .line 47
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_11
    move-wide v3, v4

    .line 48
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_b
    if-eqz v7, :cond_12

    .line 49
    const/4 v5, 0x1

    .local v5, "$this$dp$iv":I
    const/4 v7, 0x0

    .line 69
    .local v7, "$i$f$getDp":I
    int-to-float v12, v5

    invoke-static {v12}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    move v9, v5

    .end local v5    # "$this$dp$iv":I
    .end local v7    # "$i$f$getDp":I
    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    .local v9, "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    :cond_12
    if-eqz v10, :cond_13

    .line 50
    const/4 v5, 0x0

    .restart local v5    # "$this$dp$iv":I
    const/4 v7, 0x0

    .line 70
    .restart local v7    # "$i$f$getDp":I
    int-to-float v10, v5

    invoke-static {v10}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    move/from16 v17, v5

    .end local v7    # "$i$f$getDp":I
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .local v5, "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    goto :goto_c

    .line 69
    .end local v5    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .restart local p4    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    :cond_13
    move/from16 v17, v11

    .line 46
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .local v17, "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    :goto_c
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_14

    const/4 v5, -0x1

    const-string v7, "androidx.compose.material.Divider (Divider.kt:50)"

    invoke-static {v0, v1, v5, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 53
    :cond_14
    const/4 v0, 0x0

    cmpg-float v5, v17, v0

    if-nez v5, :cond_15

    move v5, v15

    goto :goto_d

    :cond_15
    const/4 v5, 0x0

    :goto_d
    if-nez v5, :cond_16

    .line 54
    sget-object v5, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v16, v5

    check-cast v16, Landroidx/compose/ui/Modifier;

    const/16 v21, 0xe

    const/16 v22, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v16 .. v22}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    goto :goto_e

    .line 56
    :cond_16
    sget-object v5, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v5, Landroidx/compose/ui/Modifier;

    .line 53
    :goto_e
    nop

    .line 52
    nop

    .line 59
    .local v5, "indentMod":Landroidx/compose/ui/Modifier;
    sget-object v7, Landroidx/compose/ui/unit/Dp;->Companion:Landroidx/compose/ui/unit/Dp$Companion;

    invoke-virtual {v7}, Landroidx/compose/ui/unit/Dp$Companion;->getHairline-D9Ej5fM()F

    move-result v7

    invoke-static {v9, v7}, Landroidx/compose/ui/unit/Dp;->equals-impl0(FF)Z

    move-result v7

    if-eqz v7, :cond_17

    const v7, -0x1b2db316

    invoke-interface {v8, v7}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v7, "59@2198L7"

    invoke-static {v8, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 60
    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v7

    check-cast v7, Landroidx/compose/runtime/CompositionLocal;

    .local v7, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v10, 0x0

    .local v10, "$changed$iv":I
    move-object v11, v8

    .local v11, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v12, 0x0

    .line 71
    .local v12, "$i$f$getCurrent":I
    const v13, 0x789c5f52

    const-string v14, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v11, v13, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v7}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .end local v7    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v10    # "$changed$iv":I
    .end local v11    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v12    # "$i$f$getCurrent":I
    check-cast v13, Landroidx/compose/ui/unit/Density;

    .line 60
    invoke-interface {v13}, Landroidx/compose/ui/unit/Density;->getDensity()F

    move-result v7

    const/high16 v10, 0x3f800000    # 1.0f

    div-float/2addr v10, v7

    .local v10, "$this$dp$iv":F
    const/4 v7, 0x0

    .line 72
    .local v7, "$i$f$getDp":I
    invoke-static {v10}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v7

    .line 59
    .end local v7    # "$i$f$getDp":I
    .end local v10    # "$this$dp$iv":F
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto :goto_f

    .line 61
    :cond_17
    const v7, -0x1b2caf19

    invoke-interface {v8, v7}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 62
    move v7, v9

    .line 59
    :goto_f
    nop

    .line 58
    nop

    .line 64
    .local v7, "targetThickness":F
    invoke-interface {v2, v5}, Landroidx/compose/ui/Modifier;->then(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v0, v15, v11}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    invoke-static {v0, v7}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/4 v10, 0x2

    const/4 v12, 0x0

    move-object/from16 p0, v0

    move-wide/from16 p1, v3

    move/from16 p4, v10

    move-object/from16 p5, v11

    move-object/from16 p3, v12

    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-static/range {p0 .. p5}, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU$default(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/4 v10, 0x0

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-static {v0, v8, v10}, Landroidx/compose/foundation/layout/BoxKt;->Box(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 65
    .end local v5    # "indentMod":Landroidx/compose/ui/Modifier;
    .end local v7    # "targetThickness":F
    :cond_18
    move v5, v9

    move v9, v1

    move-object v1, v2

    move-wide v2, v3

    move v4, v5

    move/from16 v5, v17

    goto :goto_10

    .line 46
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v9    # "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    .end local v17    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    .restart local p4    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    :cond_19
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v24, v9

    move v9, v1

    move-object v1, v3

    move-wide v2, v4

    move/from16 v4, v24

    move v5, v11

    .line 65
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v4, "$v$c$androidx-compose-ui-unit-Dp$-thickness$0":F
    .local v5, "$v$c$androidx-compose-ui-unit-Dp$-startIndent$0":F
    .local v9, "$dirty":I
    :goto_10
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v10

    if-eqz v10, :cond_1a

    new-instance v0, Landroidx/compose/material/DividerKt$$ExternalSyntheticLambda0;

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Landroidx/compose/material/DividerKt$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/ui/Modifier;JFFII)V

    invoke-interface {v10, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_1a
    return-void
.end method

.method private static final Divider_oMI9zvI$lambda$0(Landroidx/compose/ui/Modifier;JFFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 9

    or-int/lit8 v0, p5, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move v5, p4

    move v8, p6

    move-object/from16 v6, p7

    invoke-static/range {v1 .. v8}, Landroidx/compose/material/DividerKt;->Divider-oMI9zvI(Landroidx/compose/ui/Modifier;JFFLandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
