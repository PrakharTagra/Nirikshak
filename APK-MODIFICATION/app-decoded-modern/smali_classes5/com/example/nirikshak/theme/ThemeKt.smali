.class public final Lcom/example/nirikshak/theme/ThemeKt;
.super Ljava/lang/Object;
.source "Theme.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a4\u0010\u0003\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0011\u0010\u0008\u001a\r\u0012\u0004\u0012\u00020\u00040\t\u00a2\u0006\u0002\u0008\nH\u0007\u00a2\u0006\u0002\u0010\u000b\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "DarkColorScheme",
        "Landroidx/compose/material3/ColorScheme;",
        "LightColorScheme",
        "NirikshakTheme",
        "",
        "darkTheme",
        "",
        "dynamicColor",
        "content",
        "Lkotlin/Function0;",
        "Landroidx/compose/runtime/Composable;",
        "(ZZLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V",
        "app_debug"
    }
    k = 0x2
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DarkColorScheme:Landroidx/compose/material3/ColorScheme;

.field private static final LightColorScheme:Landroidx/compose/material3/ColorScheme;


# direct methods
.method public static synthetic $r8$lambda$VaOKSbPkoNgENq7QaHdV-8Cw63Q(ZZLkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Lcom/example/nirikshak/theme/ThemeKt;->NirikshakTheme$lambda$0(ZZLkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 100

    .line 14
    nop

    .line 15
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmPrimaryBlue()J

    move-result-wide v1

    .line 14
    nop

    .line 16
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmAccentGreen()J

    move-result-wide v11

    .line 14
    nop

    .line 17
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmAccentGold()J

    move-result-wide v19

    .line 14
    nop

    .line 18
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmPrimaryDark()J

    move-result-wide v27

    .line 14
    nop

    .line 19
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmHeaderBg()J

    move-result-wide v31

    .line 14
    const v98, 0xffff

    const/16 v99, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v21, 0x0

    const-wide/16 v23, 0x0

    const-wide/16 v25, 0x0

    const-wide/16 v29, 0x0

    const-wide/16 v33, 0x0

    const-wide/16 v35, 0x0

    const-wide/16 v37, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const-wide/16 v43, 0x0

    const-wide/16 v45, 0x0

    const-wide/16 v47, 0x0

    const-wide/16 v49, 0x0

    const-wide/16 v51, 0x0

    const-wide/16 v53, 0x0

    const-wide/16 v55, 0x0

    const-wide/16 v57, 0x0

    const-wide/16 v59, 0x0

    const-wide/16 v61, 0x0

    const-wide/16 v63, 0x0

    const-wide/16 v65, 0x0

    const-wide/16 v67, 0x0

    const-wide/16 v69, 0x0

    const-wide/16 v71, 0x0

    const-wide/16 v73, 0x0

    const-wide/16 v75, 0x0

    const-wide/16 v77, 0x0

    const-wide/16 v79, 0x0

    const-wide/16 v81, 0x0

    const-wide/16 v83, 0x0

    const-wide/16 v85, 0x0

    const-wide/16 v87, 0x0

    const-wide/16 v89, 0x0

    const-wide/16 v91, 0x0

    const-wide/16 v93, 0x0

    const-wide/16 v95, 0x0

    const v97, -0xa222

    invoke-static/range {v1 .. v99}, Landroidx/compose/material3/ColorSchemeKt;->darkColorScheme-_VG5OTI$default(JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJIILjava/lang/Object;)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    sput-object v0, Lcom/example/nirikshak/theme/ThemeKt;->DarkColorScheme:Landroidx/compose/material3/ColorScheme;

    .line 23
    nop

    .line 24
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmHeaderBg()J

    move-result-wide v1

    .line 25
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmAccentGreen()J

    move-result-wide v11

    .line 26
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmAccentGold()J

    move-result-wide v19

    .line 27
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmBackground()J

    move-result-wide v27

    .line 28
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmCardSurface()J

    move-result-wide v31

    .line 29
    sget-object v0, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color$Companion;->getWhite-0d7_KjU()J

    move-result-wide v3

    .line 30
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmTextPrimary()J

    move-result-wide v29

    .line 31
    invoke-static {}, Lcom/example/nirikshak/theme/ColorKt;->getLmTextPrimary()J

    move-result-wide v33

    .line 24
    nop

    .line 29
    nop

    .line 23
    nop

    .line 25
    nop

    .line 23
    nop

    .line 26
    nop

    .line 23
    nop

    .line 27
    nop

    .line 30
    nop

    .line 28
    nop

    .line 31
    nop

    .line 23
    const v97, -0x1e224

    invoke-static/range {v1 .. v99}, Landroidx/compose/material3/ColorSchemeKt;->lightColorScheme-_VG5OTI$default(JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJIILjava/lang/Object;)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    sput-object v0, Lcom/example/nirikshak/theme/ThemeKt;->LightColorScheme:Landroidx/compose/material3/ColorScheme;

    return-void
.end method

.method public static final NirikshakTheme(ZZLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
    .locals 10
    .param p0, "darkTheme"    # Z
    .param p1, "dynamicColor"    # Z
    .param p2, "content"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lkotlin/jvm/functions/Function2<",
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

    const-string v0, "content"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    const v0, -0x6ec3254b

    invoke-interface {p3, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(NirikshakTheme)N(darkTheme,dynamicColor,content)41@1225L84:Theme.kt#amrbfm"

    invoke-static {v4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move v1, p4

    .local v1, "$dirty":I
    and-int/lit8 v2, p4, 0x6

    if-nez v2, :cond_1

    and-int/lit8 v2, p5, 0x1

    if-nez v2, :cond_0

    invoke-interface {v4, p0}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v1, v5

    :cond_1
    and-int/lit16 v5, p4, 0x180

    if-nez v5, :cond_3

    invoke-interface {v4, p2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x100

    goto :goto_1

    :cond_2
    const/16 v5, 0x80

    :goto_1
    or-int/2addr v1, v5

    :cond_3
    and-int/lit16 v5, v1, 0x83

    const/16 v6, 0x82

    const/4 v7, 0x0

    if-eq v5, v6, :cond_4

    const/4 v5, 0x1

    goto :goto_2

    :cond_4
    move v5, v7

    :goto_2
    and-int/lit8 v6, v1, 0x1

    invoke-interface {v4, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v5, "35@1054L21"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v5, p4, 0x1

    if-eqz v5, :cond_7

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v5

    if-eqz v5, :cond_5

    goto :goto_3

    .line 35
    :cond_5
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v5, p5, 0x1

    if-eqz v5, :cond_6

    and-int/lit8 v1, v1, -0xf

    :cond_6
    move v7, p0

    move v8, p1

    move v9, v1

    goto :goto_5

    .line 39
    :cond_7
    :goto_3
    and-int/lit8 v5, p5, 0x1

    if-eqz v5, :cond_8

    .line 36
    invoke-static {v4, v7}, Landroidx/compose/foundation/DarkThemeKt;->isSystemInDarkTheme(Landroidx/compose/runtime/Composer;I)Z

    move-result v2

    .end local p0    # "darkTheme":Z
    .local v2, "darkTheme":Z
    and-int/lit8 v1, v1, -0xf

    goto :goto_4

    .line 39
    .end local v2    # "darkTheme":Z
    .restart local p0    # "darkTheme":Z
    :cond_8
    move v2, p0

    .line 36
    .end local p0    # "darkTheme":Z
    .restart local v2    # "darkTheme":Z
    :goto_4
    and-int/lit8 v5, p5, 0x2

    if-eqz v5, :cond_9

    .line 37
    const/4 v5, 0x0

    move v9, v1

    move v7, v2

    move v8, v5

    .end local p1    # "dynamicColor":Z
    .local v5, "dynamicColor":Z
    goto :goto_5

    .line 36
    .end local v5    # "dynamicColor":Z
    .restart local p1    # "dynamicColor":Z
    :cond_9
    move v8, p1

    move v9, v1

    move v7, v2

    .line 35
    .end local v1    # "$dirty":I
    .end local v2    # "darkTheme":Z
    .end local p1    # "dynamicColor":Z
    .local v7, "darkTheme":Z
    .local v8, "dynamicColor":Z
    .local v9, "$dirty":I
    :goto_5
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, -0x1

    const-string v2, "com.example.nirikshak.theme.NirikshakTheme (Theme.kt:38)"

    invoke-static {v0, v9, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 40
    :cond_a
    if-eqz v7, :cond_b

    sget-object v0, Lcom/example/nirikshak/theme/ThemeKt;->DarkColorScheme:Landroidx/compose/material3/ColorScheme;

    goto :goto_6

    :cond_b
    sget-object v0, Lcom/example/nirikshak/theme/ThemeKt;->LightColorScheme:Landroidx/compose/material3/ColorScheme;

    .line 42
    .local v0, "colorScheme":Landroidx/compose/material3/ColorScheme;
    :goto_6
    invoke-static {}, Lcom/example/nirikshak/theme/TypeKt;->getTypography()Landroidx/compose/material3/Typography;

    move-result-object v2

    shl-int/lit8 v1, v9, 0x3

    and-int/lit16 v1, v1, 0x1c00

    or-int/lit16 v5, v1, 0x180

    const/4 v6, 0x2

    const/4 v1, 0x0

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Landroidx/compose/material3/MaterialThemeKt;->MaterialTheme(Landroidx/compose/material3/ColorScheme;Landroidx/compose/material3/Shapes;Landroidx/compose/material3/Typography;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    move-object v6, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 43
    .end local v0    # "colorScheme":Landroidx/compose/material3/ColorScheme;
    :cond_c
    move v1, v7

    move v2, v8

    goto :goto_7

    .line 35
    .end local v6    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v7    # "darkTheme":Z
    .end local v8    # "dynamicColor":Z
    .end local v9    # "$dirty":I
    .restart local v1    # "$dirty":I
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p0    # "darkTheme":Z
    .restart local p1    # "dynamicColor":Z
    :cond_d
    move-object v6, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move v2, p1

    move v9, v1

    move v1, p0

    .line 43
    .end local p0    # "darkTheme":Z
    .end local p1    # "dynamicColor":Z
    .local v1, "darkTheme":Z
    .local v2, "dynamicColor":Z
    .restart local v9    # "$dirty":I
    :goto_7
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v7

    if-eqz v7, :cond_e

    new-instance v0, Lcom/example/nirikshak/theme/ThemeKt$$ExternalSyntheticLambda0;

    move-object v3, p2

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/example/nirikshak/theme/ThemeKt$$ExternalSyntheticLambda0;-><init>(ZZLkotlin/jvm/functions/Function2;II)V

    invoke-interface {v7, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_e
    return-void
.end method

.method private static final NirikshakTheme$lambda$0(ZZLkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7

    or-int/lit8 v0, p3, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v5

    move v1, p0

    move v2, p1

    move-object v3, p2

    move v6, p4

    move-object v4, p5

    invoke-static/range {v1 .. v6}, Lcom/example/nirikshak/theme/ThemeKt;->NirikshakTheme(ZZLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
