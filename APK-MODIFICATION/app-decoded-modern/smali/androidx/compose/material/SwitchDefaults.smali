.class public final Landroidx/compose/material/SwitchDefaults;
.super Ljava/lang/Object;
.source "Switch.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\n\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003Js\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u00072\u0008\u0008\u0002\u0010\r\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0007H\u0007\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Landroidx/compose/material/SwitchDefaults;",
        "",
        "<init>",
        "()V",
        "colors",
        "Landroidx/compose/material/SwitchColors;",
        "checkedThumbColor",
        "Landroidx/compose/ui/graphics/Color;",
        "checkedTrackColor",
        "checkedTrackAlpha",
        "",
        "uncheckedThumbColor",
        "uncheckedTrackColor",
        "uncheckedTrackAlpha",
        "disabledCheckedThumbColor",
        "disabledCheckedTrackColor",
        "disabledUncheckedThumbColor",
        "disabledUncheckedTrackColor",
        "colors-SQMK_m0",
        "(JJFJJFJJJJLandroidx/compose/runtime/Composer;III)Landroidx/compose/material/SwitchColors;",
        "material"
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

.field public static final INSTANCE:Landroidx/compose/material/SwitchDefaults;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/compose/material/SwitchDefaults;

    invoke-direct {v0}, Landroidx/compose/material/SwitchDefaults;-><init>()V

    sput-object v0, Landroidx/compose/material/SwitchDefaults;->INSTANCE:Landroidx/compose/material/SwitchDefaults;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final colors-SQMK_m0(JJFJJFJJJJLandroidx/compose/runtime/Composer;III)Landroidx/compose/material/SwitchColors;
    .locals 28
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0"    # J
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0"    # J
    .param p5, "checkedTrackAlpha"    # F
    .param p6, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0"    # J
    .param p8, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0"    # J
    .param p10, "uncheckedTrackAlpha"    # F
    .param p11, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0"    # J
    .param p13, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0"    # J
    .param p15, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0"    # J
    .param p17, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0"    # J
    .param p19, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p20, "$changed"    # I
    .param p21, "$changed1"    # I

    .line 342
    move-object/from16 v0, p19

    move/from16 v1, p22

    const v2, -0x3d85042e

    const-string v3, "C(colors)N(checkedThumbColor:c#ui.graphics.Color,checkedTrackColor:c#ui.graphics.Color,checkedTrackAlpha,uncheckedThumbColor:c#ui.graphics.Color,uncheckedTrackColor:c#ui.graphics.Color,uncheckedTrackAlpha,disabledCheckedThumbColor:c#ui.graphics.Color,disabledCheckedTrackColor:c#ui.graphics.Color,disabledUncheckedThumbColor:c#ui.graphics.Color,disabledUncheckedTrackColor:c#ui.graphics.Color)318@13166L6,321@13338L6,322@13405L6,326@13583L8,327@13638L6,330@13771L8,331@13826L6,334@13963L8,335@14018L6,338@14155L8,339@14210L6:Switch.kt#jmzs0o"

    invoke-static {v0, v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v3, v1, 0x1

    const/4 v4, 0x6

    if-eqz v3, :cond_0

    .line 319
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v3, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getSecondaryVariant-0d7_KjU()J

    move-result-wide v5

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    goto :goto_0

    .line 342
    .end local v5    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    :cond_0
    move-wide/from16 v5, p1

    .line 319
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local v5    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    :goto_0
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_1

    .line 320
    move-wide v7, v5

    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .local v7, "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    goto :goto_1

    .line 319
    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    :cond_1
    move-wide/from16 v7, p3

    .line 320
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .restart local v7    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    :goto_1
    and-int/lit8 v3, v1, 0x4

    if-eqz v3, :cond_2

    .line 321
    const v3, 0x3f0a3d71    # 0.54f

    .end local p5    # "checkedTrackAlpha":F
    .local v3, "checkedTrackAlpha":F
    goto :goto_2

    .line 320
    .end local v3    # "checkedTrackAlpha":F
    .restart local p5    # "checkedTrackAlpha":F
    :cond_2
    move/from16 v3, p5

    .line 321
    .end local p5    # "checkedTrackAlpha":F
    .restart local v3    # "checkedTrackAlpha":F
    :goto_2
    and-int/lit8 v9, v1, 0x8

    if-eqz v9, :cond_3

    .line 322
    sget-object v9, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v9, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material/Colors;->getSurface-0d7_KjU()J

    move-result-wide v9

    .end local p6    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .local v9, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    goto :goto_3

    .line 321
    .end local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    :cond_3
    move-wide/from16 v9, p6

    .line 322
    .end local p6    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .restart local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    :goto_3
    and-int/lit8 v11, v1, 0x10

    if-eqz v11, :cond_4

    .line 323
    sget-object v11, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v11, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v11

    invoke-virtual {v11}, Landroidx/compose/material/Colors;->getOnSurface-0d7_KjU()J

    move-result-wide v11

    .end local p8    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .local v11, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    goto :goto_4

    .line 322
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .restart local p8    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    :cond_4
    move-wide/from16 v11, p8

    .line 323
    .end local p8    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .restart local v11    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    :goto_4
    and-int/lit8 v13, v1, 0x20

    if-eqz v13, :cond_5

    .line 324
    const v13, 0x3ec28f5c    # 0.38f

    .end local p10    # "uncheckedTrackAlpha":F
    .local v13, "uncheckedTrackAlpha":F
    goto :goto_5

    .line 323
    .end local v13    # "uncheckedTrackAlpha":F
    .restart local p10    # "uncheckedTrackAlpha":F
    :cond_5
    move/from16 v13, p10

    .line 324
    .end local p10    # "uncheckedTrackAlpha":F
    .restart local v13    # "uncheckedTrackAlpha":F
    :goto_5
    and-int/lit8 v14, v1, 0x40

    if-eqz v14, :cond_6

    .line 328
    nop

    .line 326
    nop

    .line 327
    sget-object v14, Landroidx/compose/material/ContentAlpha;->INSTANCE:Landroidx/compose/material/ContentAlpha;

    invoke-virtual {v14, v0, v4}, Landroidx/compose/material/ContentAlpha;->getDisabled(Landroidx/compose/runtime/Composer;I)F

    move-result v14

    const/16 v15, 0xe

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-wide/from16 p1, v5

    move/from16 p3, v14

    move/from16 p7, v15

    move-object/from16 p8, v16

    move/from16 p4, v17

    move/from16 p5, v18

    move/from16 p6, v19

    .end local v5    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v5

    .line 328
    move-wide/from16 v14, p1

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .local v14, "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    sget-object v2, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v2, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v2

    move/from16 v17, v3

    .end local v3    # "checkedTrackAlpha":F
    .local v17, "checkedTrackAlpha":F
    invoke-virtual {v2}, Landroidx/compose/material/Colors;->getSurface-0d7_KjU()J

    move-result-wide v2

    invoke-static {v5, v6, v2, v3}, Landroidx/compose/ui/graphics/ColorKt;->compositeOver--OWjLjI(JJ)J

    move-result-wide v2

    .end local p11    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    goto :goto_6

    .line 324
    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .end local v17    # "checkedTrackAlpha":F
    .restart local v3    # "checkedTrackAlpha":F
    .restart local v5    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local p11    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    :cond_6
    move/from16 v17, v3

    move-wide v14, v5

    .end local v3    # "checkedTrackAlpha":F
    .end local v5    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local v14    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local v17    # "checkedTrackAlpha":F
    move-wide/from16 v2, p11

    .line 328
    .end local p11    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .restart local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    :goto_6
    and-int/lit16 v5, v1, 0x80

    if-eqz v5, :cond_7

    .line 332
    nop

    .line 330
    nop

    .line 331
    sget-object v5, Landroidx/compose/material/ContentAlpha;->INSTANCE:Landroidx/compose/material/ContentAlpha;

    invoke-virtual {v5, v0, v4}, Landroidx/compose/material/ContentAlpha;->getDisabled(Landroidx/compose/runtime/Composer;I)F

    move-result v5

    const/16 v6, 0xe

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 p3, v5

    move/from16 p7, v6

    move-wide/from16 p1, v7

    move-object/from16 p8, v18

    move/from16 p4, v19

    move/from16 p5, v20

    move/from16 p6, v21

    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v5

    .line 332
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .restart local v7    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    move-wide/from16 p10, v2

    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .local p10, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    sget-object v2, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v2, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material/Colors;->getSurface-0d7_KjU()J

    move-result-wide v2

    invoke-static {v5, v6, v2, v3}, Landroidx/compose/ui/graphics/ColorKt;->compositeOver--OWjLjI(JJ)J

    move-result-wide v2

    .end local p13    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    goto :goto_7

    .line 328
    .end local p10    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .restart local p13    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    :cond_7
    move-wide/from16 p10, v2

    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .restart local p10    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    move-wide/from16 v2, p13

    .line 332
    .end local p13    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    :goto_7
    and-int/lit16 v5, v1, 0x100

    if-eqz v5, :cond_8

    .line 336
    nop

    .line 334
    nop

    .line 335
    sget-object v5, Landroidx/compose/material/ContentAlpha;->INSTANCE:Landroidx/compose/material/ContentAlpha;

    invoke-virtual {v5, v0, v4}, Landroidx/compose/material/ContentAlpha;->getDisabled(Landroidx/compose/runtime/Composer;I)F

    move-result v5

    const/16 v6, 0xe

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 p3, v5

    move/from16 p7, v6

    move-wide/from16 p1, v9

    move-object/from16 p8, v18

    move/from16 p4, v19

    move/from16 p5, v20

    move/from16 p6, v21

    .end local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v5

    .line 336
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .restart local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    move-wide/from16 p12, v2

    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local p12, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    sget-object v2, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v2, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material/Colors;->getSurface-0d7_KjU()J

    move-result-wide v2

    invoke-static {v5, v6, v2, v3}, Landroidx/compose/ui/graphics/ColorKt;->compositeOver--OWjLjI(JJ)J

    move-result-wide v2

    .end local p15    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    goto :goto_8

    .line 332
    .end local p12    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .restart local p15    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    :cond_8
    move-wide/from16 p12, v2

    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .restart local p12    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    move-wide/from16 v2, p15

    .line 336
    .end local p15    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    :goto_8
    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_9

    .line 340
    nop

    .line 338
    nop

    .line 339
    sget-object v1, Landroidx/compose/material/ContentAlpha;->INSTANCE:Landroidx/compose/material/ContentAlpha;

    invoke-virtual {v1, v0, v4}, Landroidx/compose/material/ContentAlpha;->getDisabled(Landroidx/compose/runtime/Composer;I)F

    move-result v1

    const/16 v5, 0xe

    const/4 v6, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 p3, v1

    move/from16 p7, v5

    move-object/from16 p8, v6

    move-wide/from16 p1, v11

    move/from16 p4, v18

    move/from16 p5, v19

    move/from16 p6, v20

    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v5

    .line 340
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .restart local v11    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    sget-object v1, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    invoke-virtual {v1, v0, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/compose/material/Colors;->getSurface-0d7_KjU()J

    move-result-wide v0

    invoke-static {v5, v6, v0, v1}, Landroidx/compose/ui/graphics/ColorKt;->compositeOver--OWjLjI(JJ)J

    move-result-wide v0

    .end local p17    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .local v0, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    goto :goto_9

    .line 336
    .end local v0    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .restart local p17    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    :cond_9
    move-wide/from16 v0, p17

    .line 340
    .end local p17    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .restart local v0    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    :goto_9
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_a

    const-string v4, "androidx.compose.material.SwitchDefaults.colors (Switch.kt:341)"

    move/from16 v5, p20

    move/from16 v6, p21

    move-wide/from16 p14, v0

    const v0, -0x3d85042e

    .end local v0    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .local p14, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    invoke-static {v0, v5, v6, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_a

    .end local p14    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .restart local v0    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    :cond_a
    move/from16 v5, p20

    move/from16 v6, p21

    move-wide/from16 p14, v0

    .line 342
    .end local v0    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .restart local p14    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    :goto_a
    new-instance v0, Landroidx/compose/material/DefaultSwitchColors;

    .line 343
    nop

    .line 344
    const/16 v1, 0xe

    const/4 v4, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 p7, v1

    move-object/from16 p8, v4

    move-wide/from16 p1, v7

    move/from16 p4, v16

    move/from16 p3, v17

    move/from16 p5, v18

    move/from16 p6, v19

    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .end local v17    # "checkedTrackAlpha":F
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .local p3, "checkedTrackAlpha":F
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v7

    .line 345
    move-wide/from16 v16, p1

    move/from16 v1, p3

    .line 346
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    .end local p3    # "checkedTrackAlpha":F
    .local v1, "checkedTrackAlpha":F
    .local v16, "$v$c$androidx-compose-ui-graphics-Color$-checkedTrackColor$0":J
    const/16 v4, 0xe

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move/from16 p7, v4

    move-wide/from16 p1, v11

    move/from16 p3, v13

    move-object/from16 p8, v18

    move/from16 p4, v19

    move/from16 p5, v20

    move/from16 p6, v21

    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .end local v13    # "uncheckedTrackAlpha":F
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .local p3, "uncheckedTrackAlpha":F
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v11

    .line 347
    move-wide/from16 v18, p1

    .line 348
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    .end local p3    # "uncheckedTrackAlpha":F
    .restart local v13    # "uncheckedTrackAlpha":F
    .local v18, "$v$c$androidx-compose-ui-graphics-Color$-uncheckedTrackColor$0":J
    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-wide/from16 p1, p12

    move/from16 p3, v1

    move-object/from16 p8, v20

    move/from16 p4, v21

    move/from16 p5, v22

    move/from16 p6, v23

    .end local v1    # "checkedTrackAlpha":F
    .end local p12    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .local p3, "checkedTrackAlpha":F
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v20

    .line 349
    move-wide/from16 v22, p1

    .line 351
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    .end local p3    # "checkedTrackAlpha":F
    .restart local v1    # "checkedTrackAlpha":F
    .local v22, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedTrackColor$0":J
    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-wide/from16 p1, p14

    move/from16 p3, v13

    move-object/from16 p8, v24

    move/from16 p4, v25

    move/from16 p5, v26

    move/from16 p6, v27

    .end local v13    # "uncheckedTrackAlpha":F
    .end local p14    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .local p1, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .local p3, "uncheckedTrackAlpha":F
    invoke-static/range {p1 .. p8}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v24

    .line 342
    move-wide/from16 v26, p1

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    .end local p3    # "uncheckedTrackAlpha":F
    .restart local v13    # "uncheckedTrackAlpha":F
    .local v26, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedTrackColor$0":J
    const/4 v4, 0x0

    move-object/from16 p1, v0

    move-wide/from16 p14, v2

    move-object/from16 p18, v4

    move-wide/from16 p4, v7

    move-wide/from16 p6, v9

    move-wide/from16 p8, v11

    move-wide/from16 p2, v14

    move-wide/from16 p12, v20

    move-wide/from16 p16, v24

    .end local v2    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    .end local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .local p2, "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .local p14, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    invoke-direct/range {p1 .. p18}, Landroidx/compose/material/DefaultSwitchColors;-><init>(JJJJJJJJLkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-wide/from16 v2, p10

    move-wide/from16 v7, p14

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    .end local p6    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .end local p10    # "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .end local p14    # "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-disabledCheckedThumbColor$0":J
    .local v7, "$v$c$androidx-compose-ui-graphics-Color$-disabledUncheckedThumbColor$0":J
    .restart local v9    # "$v$c$androidx-compose-ui-graphics-Color$-uncheckedThumbColor$0":J
    .restart local v14    # "$v$c$androidx-compose-ui-graphics-Color$-checkedThumbColor$0":J
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_b
    invoke-static/range {p19 .. p19}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    check-cast v0, Landroidx/compose/material/SwitchColors;

    return-object v0
.end method
