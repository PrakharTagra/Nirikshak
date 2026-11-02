.class public final Landroidx/compose/material/CheckboxKt;
.super Ljava/lang/Object;
.source "Checkbox.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/compose/material/CheckboxKt$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCheckbox.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Checkbox.kt\nandroidx/compose/material/CheckboxKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 Transition.kt\nandroidx/compose/animation/core/TransitionKt\n+ 4 Size.kt\nandroidx/compose/ui/geometry/Size\n+ 5 InlineClassHelper.kt\nandroidx/compose/ui/util/InlineClassHelperKt\n+ 6 InlineClassHelper.jvm.kt\nandroidx/compose/ui/util/InlineClassHelper_jvmKt\n+ 7 Size.kt\nandroidx/compose/ui/geometry/SizeKt\n+ 8 CornerRadius.kt\nandroidx/compose/ui/geometry/CornerRadiusKt\n+ 9 Offset.kt\nandroidx/compose/ui/geometry/OffsetKt\n+ 10 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 11 Dp.kt\nandroidx/compose/ui/unit/DpKt\n*L\n1#1,482:1\n1128#2,6:483\n1128#2,6:507\n1128#2,6:513\n1925#3:489\n1923#3:490\n1832#3,7:491\n1925#3:498\n1923#3:499\n1832#3,7:500\n57#4:519\n57#4:554\n60#5:520\n53#5,3:523\n53#5,3:527\n53#5,3:531\n53#5,3:535\n53#5,3:539\n53#5,3:543\n53#5,3:547\n53#5,3:551\n60#5:555\n22#6:521\n22#6:556\n33#7:522\n33#7:534\n33#7:546\n33#8:526\n33#8:538\n33#8:550\n30#9:530\n30#9:542\n85#10:557\n85#10:558\n85#10:559\n85#10:560\n85#10:561\n113#11:562\n113#11:563\n113#11:564\n113#11:565\n113#11:566\n*S KotlinDebug\n*F\n+ 1 Checkbox.kt\nandroidx/compose/material/CheckboxKt\n*L\n96#1:483,6\n292#1:507,6\n296#1:513,6\n260#1:489\n260#1:490\n260#1:491,7\n277#1:498\n277#1:499\n277#1:500,7\n322#1:519\n356#1:554\n322#1:520\n326#1:523,3\n327#1:527,3\n333#1:531,3\n334#1:535,3\n335#1:539,3\n340#1:543,3\n341#1:547,3\n342#1:551,3\n356#1:555\n322#1:521\n356#1:556\n326#1:522\n334#1:534\n341#1:546\n327#1:526\n335#1:538\n342#1:550\n333#1:530\n340#1:542\n260#1:557\n277#1:558\n293#1:559\n294#1:560\n295#1:561\n477#1:562\n478#1:563\n479#1:564\n480#1:565\n481#1:566\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u001aU\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0014\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000cH\u0007\u00a2\u0006\u0002\u0010\r\u001aO\u0010\u000e\u001a\u00020\u00012\u0006\u0010\u000f\u001a\u00020\u00102\u000e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u00122\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000cH\u0007\u00a2\u0006\u0002\u0010\u0013\u001a-\u0010\u0014\u001a\u00020\u00012\u0006\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u000cH\u0003\u00a2\u0006\u0002\u0010\u0016\u001a3\u0010\u0017\u001a\u00020\u0001*\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001dH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010 \u001a;\u0010!\u001a\u00020\u0001*\u00020\u00182\u0006\u0010\"\u001a\u00020\u001a2\u0006\u0010#\u001a\u00020\u001d2\u0006\u0010$\u001a\u00020\u001d2\u0006\u0010%\u001a\u00020\u001d2\u0006\u0010&\u001a\u00020\'H\u0002\u00a2\u0006\u0004\u0008(\u0010)\"\u000e\u0010*\u001a\u00020+X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010,\u001a\u00020+X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010-\u001a\u00020+X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0010\u0010.\u001a\u00020/X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00100\"\u0010\u00101\u001a\u00020/X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00100\"\u0010\u00102\u001a\u00020/X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00100\"\u0010\u00103\u001a\u00020/X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00100\"\u0010\u00104\u001a\u00020/X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00100\u00a8\u00065\u00b2\u0006\n\u00106\u001a\u00020\u001dX\u008a\u0084\u0002\u00b2\u0006\n\u00107\u001a\u00020\u001dX\u008a\u0084\u0002\u00b2\u0006\n\u0010\"\u001a\u00020\u001aX\u008a\u0084\u0002\u00b2\u0006\n\u0010\u0019\u001a\u00020\u001aX\u008a\u0084\u0002\u00b2\u0006\n\u0010\u001b\u001a\u00020\u001aX\u008a\u0084\u0002"
    }
    d2 = {
        "Checkbox",
        "",
        "checked",
        "",
        "onCheckedChange",
        "Lkotlin/Function1;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "enabled",
        "interactionSource",
        "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
        "colors",
        "Landroidx/compose/material/CheckboxColors;",
        "(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V",
        "TriStateCheckbox",
        "state",
        "Landroidx/compose/ui/state/ToggleableState;",
        "onClick",
        "Lkotlin/Function0;",
        "(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V",
        "CheckboxImpl",
        "value",
        "(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;I)V",
        "drawBox",
        "Landroidx/compose/ui/graphics/drawscope/DrawScope;",
        "boxColor",
        "Landroidx/compose/ui/graphics/Color;",
        "borderColor",
        "radius",
        "",
        "strokeWidth",
        "drawBox-1wkBAMs",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJFF)V",
        "drawCheck",
        "checkColor",
        "checkFraction",
        "crossCenterGravitation",
        "strokeWidthPx",
        "drawingCache",
        "Landroidx/compose/material/CheckDrawingCache;",
        "drawCheck-3IgeMak",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFFFLandroidx/compose/material/CheckDrawingCache;)V",
        "BoxInDuration",
        "",
        "BoxOutDuration",
        "CheckAnimationDuration",
        "CheckboxRippleRadius",
        "Landroidx/compose/ui/unit/Dp;",
        "F",
        "CheckboxDefaultPadding",
        "CheckboxSize",
        "StrokeWidth",
        "RadiusSize",
        "material",
        "checkDrawFraction",
        "checkCenterGravitationShiftFraction"
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
.field private static final BoxInDuration:I = 0x32

.field private static final BoxOutDuration:I = 0x64

.field private static final CheckAnimationDuration:I = 0x64

.field private static final CheckboxDefaultPadding:F

.field private static final CheckboxRippleRadius:F

.field private static final CheckboxSize:F

.field private static final RadiusSize:F

.field private static final StrokeWidth:F


# direct methods
.method public static synthetic $r8$lambda$4Mk9-71OHHSRDfdCf-tAfalAD-c(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$3(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$66xME2OIvNcS6k7IHriPwzZ97FE(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/CheckboxKt;->Checkbox$lambda$0$0(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$6o_1lKFUQfhCrGx63rlc-Mzh2wU(Landroidx/compose/material/CheckDrawingCache;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$10$0(Landroidx/compose/material/CheckDrawingCache;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$HjJO2d9Uw6OM3wjoatMXYKYa3GU(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$0(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$MkSOvgZyXOU8RpS5s6GMDAy6eBQ(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/CheckboxKt;->TriStateCheckbox$lambda$0(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$R8iTkX3mzM_7SdwsFcTdtClR4cM(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$11(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zkRMLdz0BKBfKuJtj8xsNmx0Gq0(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/CheckboxKt;->Checkbox$lambda$1(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 477
    const/16 v0, 0x18

    .local v0, "$this$dp$iv":I
    const/4 v1, 0x0

    .line 562
    .local v1, "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 477
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/CheckboxKt;->CheckboxRippleRadius:F

    .line 478
    const/4 v0, 0x2

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 563
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 478
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/CheckboxKt;->CheckboxDefaultPadding:F

    .line 479
    const/16 v0, 0x14

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 564
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 479
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/CheckboxKt;->CheckboxSize:F

    .line 480
    const/4 v0, 0x2

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 565
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 480
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/CheckboxKt;->StrokeWidth:F

    .line 481
    const/4 v0, 0x2

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 566
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 481
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/CheckboxKt;->RadiusSize:F

    return-void
.end method

.method public static final Checkbox(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V
    .locals 26
    .param p0, "checked"    # Z
    .param p1, "onCheckedChange"    # Lkotlin/jvm/functions/Function1;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "enabled"    # Z
    .param p4, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p5, "colors"    # Landroidx/compose/material/CheckboxColors;
    .param p6, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p7, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/material/CheckboxColors;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 91
    move/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v7, p7

    const v0, -0x7e483386

    move-object/from16 v3, p6

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v14

    .end local p6    # "$composer":Landroidx/compose/runtime/Composer;
    .local v14, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(Checkbox)N(checked,onCheckedChange,modifier,enabled,interactionSource,colors)91@4126L325:Checkbox.kt#jmzs0o"

    invoke-static {v14, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p7

    .local v3, "$dirty":I
    and-int/lit8 v4, v7, 0x6

    if-nez v4, :cond_1

    invoke-interface {v14, v1}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v3, v4

    :cond_1
    and-int/lit8 v4, v7, 0x30

    const/16 v6, 0x20

    if-nez v4, :cond_3

    invoke-interface {v14, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v6

    goto :goto_1

    :cond_2
    const/16 v4, 0x10

    :goto_1
    or-int/2addr v3, v4

    :cond_3
    and-int/lit8 v4, p8, 0x4

    if-eqz v4, :cond_4

    or-int/lit16 v3, v3, 0x180

    move-object/from16 v8, p2

    goto :goto_3

    :cond_4
    and-int/lit16 v8, v7, 0x180

    if-nez v8, :cond_6

    move-object/from16 v8, p2

    invoke-interface {v14, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    const/16 v9, 0x100

    goto :goto_2

    :cond_5
    const/16 v9, 0x80

    :goto_2
    or-int/2addr v3, v9

    goto :goto_3

    :cond_6
    move-object/from16 v8, p2

    :goto_3
    and-int/lit8 v9, p8, 0x8

    if-eqz v9, :cond_7

    or-int/lit16 v3, v3, 0xc00

    move/from16 v10, p3

    goto :goto_5

    :cond_7
    and-int/lit16 v10, v7, 0xc00

    if-nez v10, :cond_9

    move/from16 v10, p3

    invoke-interface {v14, v10}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v11

    if-eqz v11, :cond_8

    const/16 v11, 0x800

    goto :goto_4

    :cond_8
    const/16 v11, 0x400

    :goto_4
    or-int/2addr v3, v11

    goto :goto_5

    :cond_9
    move/from16 v10, p3

    :goto_5
    and-int/lit8 v11, p8, 0x10

    if-eqz v11, :cond_a

    or-int/lit16 v3, v3, 0x6000

    move-object/from16 v12, p4

    goto :goto_7

    :cond_a
    and-int/lit16 v12, v7, 0x6000

    if-nez v12, :cond_c

    move-object/from16 v12, p4

    invoke-interface {v14, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b

    const/16 v13, 0x4000

    goto :goto_6

    :cond_b
    const/16 v13, 0x2000

    :goto_6
    or-int/2addr v3, v13

    goto :goto_7

    :cond_c
    move-object/from16 v12, p4

    :goto_7
    const/high16 v13, 0x30000

    and-int/2addr v13, v7

    if-nez v13, :cond_f

    and-int/lit8 v13, p8, 0x20

    if-nez v13, :cond_d

    move-object/from16 v13, p5

    invoke-interface {v14, v13}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_e

    const/high16 v15, 0x20000

    goto :goto_8

    :cond_d
    move-object/from16 v13, p5

    :cond_e
    const/high16 v15, 0x10000

    :goto_8
    or-int/2addr v3, v15

    goto :goto_9

    :cond_f
    move-object/from16 v13, p5

    :goto_9
    const v15, 0x12493

    and-int/2addr v15, v3

    const v5, 0x12492

    const/16 v22, 0x0

    const/16 v23, 0x1

    if-eq v15, v5, :cond_10

    move/from16 v5, v23

    goto :goto_a

    :cond_10
    move/from16 v5, v22

    :goto_a
    and-int/lit8 v15, v3, 0x1

    invoke-interface {v14, v5, v15}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_1f

    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v5, "89@4108L8"

    invoke-static {v14, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v5, v7, 0x1

    const v24, -0x70001

    if-eqz v5, :cond_13

    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v5

    if-eqz v5, :cond_11

    goto :goto_b

    .line 84
    :cond_11
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v4, p8, 0x20

    if-eqz v4, :cond_12

    and-int v3, v3, v24

    :cond_12
    move v11, v10

    move-object v10, v8

    goto :goto_f

    .line 91
    :cond_13
    :goto_b
    if-eqz v4, :cond_14

    .line 87
    sget-object v4, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v4, Landroidx/compose/ui/Modifier;

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_c

    .line 91
    .end local v4    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_14
    move-object v4, v8

    .line 87
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v4    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_c
    if-eqz v9, :cond_15

    .line 88
    const/4 v5, 0x1

    .end local p3    # "enabled":Z
    .local v5, "enabled":Z
    goto :goto_d

    .line 87
    .end local v5    # "enabled":Z
    .restart local p3    # "enabled":Z
    :cond_15
    move v5, v10

    .line 88
    .end local p3    # "enabled":Z
    .restart local v5    # "enabled":Z
    :goto_d
    if-eqz v11, :cond_16

    .line 89
    const/4 v8, 0x0

    move-object/from16 v25, v8

    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v8, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_e

    .line 88
    .end local v8    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_16
    move-object/from16 v25, v12

    .line 89
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v25, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_e
    and-int/lit8 v8, p8, 0x20

    if-eqz v8, :cond_17

    .line 90
    sget-object v8, Landroidx/compose/material/CheckboxDefaults;->INSTANCE:Landroidx/compose/material/CheckboxDefaults;

    const/high16 v20, 0x30000

    const/16 v21, 0x1f

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    move-object/from16 v19, v14

    .end local v14    # "$composer":Landroidx/compose/runtime/Composer;
    .local v19, "$composer":Landroidx/compose/runtime/Composer;
    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const-wide/16 v17, 0x0

    invoke-virtual/range {v8 .. v21}, Landroidx/compose/material/CheckboxDefaults;->colors-zjMxDiM(JJJJJLandroidx/compose/runtime/Composer;II)Landroidx/compose/material/CheckboxColors;

    move-result-object v8

    move-object/from16 v14, v19

    .end local v19    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .local v8, "colors":Landroidx/compose/material/CheckboxColors;
    .restart local v14    # "$composer":Landroidx/compose/runtime/Composer;
    and-int v3, v3, v24

    move-object v10, v4

    move v11, v5

    move-object v13, v8

    move-object/from16 v12, v25

    goto :goto_f

    .line 89
    .end local v8    # "colors":Landroidx/compose/material/CheckboxColors;
    .restart local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    :cond_17
    move-object/from16 v13, p5

    move-object v10, v4

    move v11, v5

    move-object/from16 v12, v25

    .line 84
    .end local v4    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v5    # "enabled":Z
    .end local v25    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .local v10, "modifier":Landroidx/compose/ui/Modifier;
    .local v11, "enabled":Z
    .local v12, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v13, "colors":Landroidx/compose/material/CheckboxColors;
    :goto_f
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_18

    const/4 v4, -0x1

    const-string v5, "androidx.compose.material.Checkbox (Checkbox.kt:90)"

    invoke-static {v0, v3, v4, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 93
    :cond_18
    invoke-static {v1}, Landroidx/compose/ui/state/ToggleableStateKt;->ToggleableState(Z)Landroidx/compose/ui/state/ToggleableState;

    move-result-object v8

    .line 95
    if-eqz v2, :cond_1d

    const v0, 0x6be1fccb

    invoke-interface {v14, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "95@4263L29"

    invoke-static {v14, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 96
    const v0, -0xd0937c9

    const-string v4, "CC(remember):Checkbox.kt#9igjgp"

    invoke-static {v14, v0, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v0, v3, 0x70

    if-ne v0, v6, :cond_19

    move/from16 v0, v23

    goto :goto_10

    :cond_19
    move/from16 v0, v22

    :goto_10
    and-int/lit8 v4, v3, 0xe

    const/4 v5, 0x4

    if-ne v4, v5, :cond_1a

    move/from16 v22, v23

    :cond_1a
    or-int v0, v0, v22

    .local v0, "invalid$iv":Z
    move-object v4, v14

    .local v4, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 483
    .local v5, "$i$f$cache":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it$iv":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 484
    .local v9, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_1c

    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v6, v15, :cond_1b

    goto :goto_11

    .line 488
    :cond_1b
    move/from16 p2, v0

    goto :goto_12

    .line 485
    :cond_1c
    :goto_11
    const/4 v15, 0x0

    .line 96
    .local v15, "$i$a$-cache-CheckboxKt$Checkbox$1":I
    move/from16 p2, v0

    .end local v0    # "invalid$iv":Z
    .local p2, "invalid$iv":Z
    new-instance v0, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda5;

    invoke-direct {v0, v2, v1}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda5;-><init>(Lkotlin/jvm/functions/Function1;Z)V

    .line 485
    .end local v15    # "$i$a$-cache-CheckboxKt$Checkbox$1":I
    nop

    .line 486
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 487
    move-object v6, v0

    .line 483
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v6    # "it$iv":Ljava/lang/Object;
    .end local v9    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_12
    nop

    .line 96
    .end local v4    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache":I
    .end local p2    # "invalid$iv":Z
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-static {v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 95
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object v9, v6

    goto :goto_13

    .line 97
    :cond_1d
    const v0, 0x6be2f983

    invoke-interface {v14, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    const/4 v6, 0x0

    move-object v9, v6

    .line 95
    :goto_13
    nop

    .line 93
    nop

    .line 95
    nop

    .line 101
    nop

    .line 99
    nop

    .line 98
    nop

    .line 100
    and-int/lit16 v0, v3, 0x380

    and-int/lit16 v4, v3, 0x1c00

    or-int/2addr v0, v4

    const v4, 0xe000

    and-int/2addr v4, v3

    or-int/2addr v0, v4

    const/high16 v4, 0x70000

    and-int/2addr v4, v3

    or-int v15, v0, v4

    .line 92
    const/16 v16, 0x0

    invoke-static/range {v8 .. v16}, Landroidx/compose/material/CheckboxKt;->TriStateCheckbox(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 103
    :cond_1e
    move v9, v3

    move-object v3, v10

    move v4, v11

    move-object v6, v13

    move-object v5, v12

    goto :goto_14

    .line 84
    .end local v10    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v11    # "enabled":Z
    .end local v12    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v13    # "colors":Landroidx/compose/material/CheckboxColors;
    .local p2, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "enabled":Z
    .restart local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    :cond_1f
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object/from16 v6, p5

    move v9, v3

    move-object v3, v8

    move v4, v10

    move-object v5, v12

    .line 103
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "enabled":Z
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "enabled":Z
    .local v5, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v6, "colors":Landroidx/compose/material/CheckboxColors;
    .local v9, "$dirty":I
    :goto_14
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v10

    if-eqz v10, :cond_20

    new-instance v0, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda6;

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda6;-><init>(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;II)V

    invoke-interface {v10, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_20
    return-void
.end method

.method private static final Checkbox$lambda$0$0(Lkotlin/jvm/functions/Function1;Z)Lkotlin/Unit;
    .locals 1
    .param p0, "$onCheckedChange"    # Lkotlin/jvm/functions/Function1;
    .param p1, "$checked"    # Z

    .line 96
    xor-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final Checkbox$lambda$1(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10

    or-int/lit8 v0, p6, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v8

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move/from16 v9, p7

    move-object/from16 v7, p8

    invoke-static/range {v1 .. v9}, Landroidx/compose/material/CheckboxKt;->Checkbox(ZLkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CheckboxImpl(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;I)V
    .locals 39
    .param p0, "enabled"    # Z
    .param p1, "value"    # Landroidx/compose/ui/state/ToggleableState;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "colors"    # Landroidx/compose/material/CheckboxColors;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    .line 257
    move/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p5

    const v0, -0x7e4bc86f

    move-object/from16 v6, p4

    invoke-interface {v6, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v6

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    const-string v7, "C(CheckboxImpl)N(enabled,value,modifier,colors)257@10849L23,259@10921L499,276@11488L514,291@12024L32,292@12086L21,293@12135L24,294@12190L27,295@12300L510,295@12222L588:Checkbox.kt#jmzs0o"

    invoke-static {v6, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v7, p5

    .local v7, "$dirty":I
    and-int/lit8 v8, v5, 0x6

    const/4 v9, 0x2

    if-nez v8, :cond_1

    invoke-interface {v6, v1}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v8, 0x4

    goto :goto_0

    :cond_0
    move v8, v9

    :goto_0
    or-int/2addr v7, v8

    :cond_1
    and-int/lit8 v8, v5, 0x30

    if-nez v8, :cond_3

    move-object v8, v2

    check-cast v8, Ljava/lang/Enum;

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    invoke-interface {v6, v8}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v8

    if-eqz v8, :cond_2

    const/16 v8, 0x20

    goto :goto_1

    :cond_2
    const/16 v8, 0x10

    :goto_1
    or-int/2addr v7, v8

    :cond_3
    and-int/lit16 v8, v5, 0x180

    if-nez v8, :cond_5

    invoke-interface {v6, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/16 v8, 0x100

    goto :goto_2

    :cond_4
    const/16 v8, 0x80

    :goto_2
    or-int/2addr v7, v8

    :cond_5
    and-int/lit16 v8, v5, 0xc00

    if-nez v8, :cond_7

    invoke-interface {v6, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x800

    goto :goto_3

    :cond_6
    const/16 v8, 0x400

    :goto_3
    or-int/2addr v7, v8

    :cond_7
    and-int/lit16 v8, v7, 0x493

    const/16 v10, 0x492

    if-eq v8, v10, :cond_8

    const/4 v8, 0x1

    goto :goto_4

    :cond_8
    const/4 v8, 0x0

    :goto_4
    and-int/lit8 v10, v7, 0x1

    invoke-interface {v6, v8, v10}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v8

    if-eqz v8, :cond_15

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v8

    const/4 v10, -0x1

    if-eqz v8, :cond_9

    const-string v8, "androidx.compose.material.CheckboxImpl (Checkbox.kt:256)"

    invoke-static {v0, v7, v10, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 258
    :cond_9
    shr-int/lit8 v0, v7, 0x3

    and-int/lit8 v0, v0, 0xe

    const/4 v8, 0x0

    invoke-static {v2, v8, v6, v0, v9}, Landroidx/compose/animation/core/TransitionKt;->updateTransition(Ljava/lang/Object;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/animation/core/Transition;

    move-result-object v0

    .line 260
    .local v0, "transition":Landroidx/compose/animation/core/Transition;
    new-instance v12, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda0;

    invoke-direct {v12}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda0;-><init>()V

    const/4 v13, 0x0

    .local v13, "$changed$iv":I
    move-object v14, v6

    .local v14, "$composer$iv":Landroidx/compose/runtime/Composer;
    move-object/from16 v22, v0

    .local v12, "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .local v22, "$this$animateFloat$iv":Landroidx/compose/animation/core/Transition;
    const/16 v23, 0x0

    .line 489
    .local v23, "$i$f$animateFloat":I
    const v15, -0x4fcbfb15

    const-string v8, "CC(animateFloat)P(2)1924@81822L78:Transition.kt#pdpnli"

    invoke-static {v14, v15, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 490
    const-string v24, "FloatAnimation"

    .line 489
    .local v24, "label$iv":Ljava/lang/String;
    sget-object v16, Lkotlin/jvm/internal/FloatCompanionObject;->INSTANCE:Lkotlin/jvm/internal/FloatCompanionObject;

    invoke-static/range {v16 .. v16}, Landroidx/compose/animation/core/VectorConvertersKt;->getVectorConverter(Lkotlin/jvm/internal/FloatCompanionObject;)Landroidx/compose/animation/core/TwoWayConverter;

    move-result-object v18

    .local v18, "typeConverter$iv$iv":Landroidx/compose/animation/core/TwoWayConverter;
    and-int/lit8 v16, v13, 0xe

    shl-int/lit8 v15, v13, 0x3

    and-int/lit16 v15, v15, 0x380

    or-int v15, v16, v15

    shl-int/lit8 v9, v13, 0x3

    and-int/lit16 v9, v9, 0x1c00

    or-int/2addr v9, v15

    shl-int/lit8 v15, v13, 0x3

    const v25, 0xe000

    and-int v15, v15, v25

    or-int/2addr v9, v15

    .local v9, "$changed$iv$iv":I
    move-object/from16 v15, v22

    .local v15, "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    move-object/from16 v26, v12

    .local v26, "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    move-object/from16 v19, v24

    .local v19, "label$iv$iv":Ljava/lang/String;
    const/16 v27, 0x0

    .line 491
    .local v27, "$i$f$animateValue":I
    const v11, -0x880d1ef

    const-string v10, "CC(animateValue)P(3,2)1833@77788L32,1834@77843L31,1835@77899L23,1837@77935L89:Transition.kt#pdpnli"

    invoke-static {v14, v11, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 493
    invoke-virtual {v15}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v10

    shr-int/lit8 v16, v9, 0x9

    and-int/lit8 v11, v16, 0x70

    .local v11, "$changed":I
    check-cast v10, Landroidx/compose/ui/state/ToggleableState;

    .local v10, "it":Landroidx/compose/ui/state/ToggleableState;
    move-object/from16 v16, v14

    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    move-object/from16 v28, v0

    .end local v0    # "transition":Landroidx/compose/animation/core/Transition;
    .local v20, "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkDrawFraction$3":I
    .local v28, "transition":Landroidx/compose/animation/core/Transition;
    const v0, -0x6b309374

    move-object/from16 v5, v16

    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "CN(it):Checkbox.kt#jmzs0o"

    invoke-static {v5, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v21

    if-eqz v21, :cond_a

    move-object/from16 v21, v5

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v21, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:268)"

    move/from16 v29, v7

    move/from16 v30, v9

    const v7, -0x6b309374

    const/4 v9, -0x1

    .end local v7    # "$dirty":I
    .end local v9    # "$changed$iv$iv":I
    .local v29, "$dirty":I
    .local v30, "$changed$iv$iv":I
    invoke-static {v7, v11, v9, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_5

    .end local v21    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v29    # "$dirty":I
    .end local v30    # "$changed$iv$iv":I
    .restart local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v7    # "$dirty":I
    .restart local v9    # "$changed$iv$iv":I
    :cond_a
    move-object/from16 v21, v5

    move/from16 v29, v7

    move/from16 v30, v9

    .line 269
    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v7    # "$dirty":I
    .end local v9    # "$changed$iv$iv":I
    .restart local v21    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v29    # "$dirty":I
    .restart local v30    # "$changed$iv$iv":I
    :goto_5
    sget-object v5, Landroidx/compose/material/CheckboxKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v10}, Landroidx/compose/ui/state/ToggleableState;->ordinal()I

    move-result v7

    aget v5, v5, v7

    packed-switch v5, :pswitch_data_0

    new-instance v5, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v5}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v5

    .line 272
    :pswitch_0
    const/high16 v5, 0x3f800000    # 1.0f

    goto :goto_6

    .line 271
    :pswitch_1
    const/4 v5, 0x0

    goto :goto_6

    .line 270
    :pswitch_2
    const/high16 v5, 0x3f800000    # 1.0f

    .line 269
    :goto_6
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v31

    if-eqz v31, :cond_b

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_b
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .end local v10    # "it":Landroidx/compose/ui/state/ToggleableState;
    .end local v11    # "$changed":I
    .end local v20    # "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkDrawFraction$3":I
    .end local v21    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    .line 493
    nop

    .line 494
    .local v5, "initialValue$iv$iv":Ljava/lang/Object;
    invoke-virtual {v15}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v10

    shr-int/lit8 v11, v30, 0x9

    and-int/lit8 v11, v11, 0x70

    .restart local v11    # "$changed":I
    check-cast v10, Landroidx/compose/ui/state/ToggleableState;

    .restart local v10    # "it":Landroidx/compose/ui/state/ToggleableState;
    move-object/from16 v20, v14

    .local v20, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    move-object/from16 v7, v20

    const v9, -0x6b309374

    .end local v20    # "$composer":Landroidx/compose/runtime/Composer;
    .local v7, "$composer":Landroidx/compose/runtime/Composer;
    .local v21, "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkDrawFraction$3":I
    invoke-interface {v7, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v7, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v16

    if-eqz v16, :cond_c

    move-object/from16 v16, v5

    .end local v5    # "initialValue$iv$iv":Ljava/lang/Object;
    .local v16, "initialValue$iv$iv":Ljava/lang/Object;
    const-string v5, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:268)"

    move-object/from16 v20, v7

    const/4 v7, -0x1

    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v20    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {v9, v11, v7, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_7

    .end local v16    # "initialValue$iv$iv":Ljava/lang/Object;
    .end local v20    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v5    # "initialValue$iv$iv":Ljava/lang/Object;
    .restart local v7    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_c
    move-object/from16 v16, v5

    move-object/from16 v20, v7

    .line 269
    .end local v5    # "initialValue$iv$iv":Ljava/lang/Object;
    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v16    # "initialValue$iv$iv":Ljava/lang/Object;
    .restart local v20    # "$composer":Landroidx/compose/runtime/Composer;
    :goto_7
    sget-object v5, Landroidx/compose/material/CheckboxKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v10}, Landroidx/compose/ui/state/ToggleableState;->ordinal()I

    move-result v7

    aget v5, v5, v7

    packed-switch v5, :pswitch_data_1

    new-instance v5, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v5}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v5

    .line 272
    :pswitch_3
    const/high16 v5, 0x3f800000    # 1.0f

    goto :goto_8

    .line 271
    :pswitch_4
    const/4 v5, 0x0

    goto :goto_8

    .line 270
    :pswitch_5
    const/high16 v5, 0x3f800000    # 1.0f

    .line 269
    :goto_8
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_d
    invoke-interface/range {v20 .. v20}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .end local v10    # "it":Landroidx/compose/ui/state/ToggleableState;
    .end local v11    # "$changed":I
    .end local v20    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v21    # "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkDrawFraction$3":I
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    .line 494
    nop

    .line 495
    .local v5, "targetValue$iv$iv":Ljava/lang/Object;
    invoke-virtual {v15}, Landroidx/compose/animation/core/Transition;->getSegment()Landroidx/compose/animation/core/Transition$Segment;

    move-result-object v7

    shr-int/lit8 v9, v30, 0x3

    and-int/lit8 v9, v9, 0x70

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v10, v26

    .end local v26    # "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    .local v10, "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    invoke-interface {v10, v7, v14, v9}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/compose/animation/core/FiniteAnimationSpec;

    .line 497
    .local v7, "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    and-int/lit8 v9, v30, 0xe

    shl-int/lit8 v11, v30, 0x9

    and-int v11, v11, v25

    or-int/2addr v9, v11

    shl-int/lit8 v11, v30, 0x6

    const/high16 v20, 0x70000

    and-int v11, v11, v20

    or-int v21, v9, v11

    move-object/from16 v17, v7

    move-object/from16 v20, v14

    move-object v14, v15

    move-object/from16 v15, v16

    move-object/from16 v16, v5

    const v5, -0x4fcbfb15

    .end local v5    # "targetValue$iv$iv":Ljava/lang/Object;
    .end local v7    # "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    .local v14, "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    .local v15, "initialValue$iv$iv":Ljava/lang/Object;
    .local v16, "targetValue$iv$iv":Ljava/lang/Object;
    .local v17, "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    .local v20, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static/range {v14 .. v21}, Landroidx/compose/animation/core/TransitionKt;->createTransitionAnimation(Landroidx/compose/animation/core/Transition;Ljava/lang/Object;Ljava/lang/Object;Landroidx/compose/animation/core/FiniteAnimationSpec;Landroidx/compose/animation/core/TwoWayConverter;Ljava/lang/String;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v7

    .line 491
    move-object/from16 v9, v20

    .end local v20    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v9, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 497
    nop

    .line 489
    .end local v10    # "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    .end local v14    # "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    .end local v15    # "initialValue$iv$iv":Ljava/lang/Object;
    .end local v16    # "targetValue$iv$iv":Ljava/lang/Object;
    .end local v17    # "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    .end local v18    # "typeConverter$iv$iv":Landroidx/compose/animation/core/TwoWayConverter;
    .end local v19    # "label$iv$iv":Ljava/lang/String;
    .end local v27    # "$i$f$animateValue":I
    .end local v30    # "$changed$iv$iv":I
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 260
    .end local v9    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v12    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .end local v13    # "$changed$iv":I
    .end local v22    # "$this$animateFloat$iv":Landroidx/compose/animation/core/Transition;
    .end local v23    # "$i$f$animateFloat":I
    .end local v24    # "label$iv":Ljava/lang/String;
    nop

    .line 259
    nop

    .line 277
    .local v7, "checkDrawFraction$delegate":Landroidx/compose/runtime/State;
    new-instance v9, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda1;

    invoke-direct {v9}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda1;-><init>()V

    const/4 v10, 0x0

    .local v10, "$changed$iv":I
    move-object v11, v6

    .local v9, "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .local v11, "$composer$iv":Landroidx/compose/runtime/Composer;
    move-object/from16 v19, v28

    .local v19, "$this$animateFloat$iv":Landroidx/compose/animation/core/Transition;
    const/16 v20, 0x0

    .line 498
    .local v20, "$i$f$animateFloat":I
    invoke-static {v11, v5, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 499
    const-string v5, "FloatAnimation"

    .line 498
    .local v5, "label$iv":Ljava/lang/String;
    sget-object v8, Lkotlin/jvm/internal/FloatCompanionObject;->INSTANCE:Lkotlin/jvm/internal/FloatCompanionObject;

    invoke-static {v8}, Landroidx/compose/animation/core/VectorConvertersKt;->getVectorConverter(Lkotlin/jvm/internal/FloatCompanionObject;)Landroidx/compose/animation/core/TwoWayConverter;

    move-result-object v15

    .local v15, "typeConverter$iv$iv":Landroidx/compose/animation/core/TwoWayConverter;
    and-int/lit8 v8, v10, 0xe

    shl-int/lit8 v12, v10, 0x3

    and-int/lit16 v12, v12, 0x380

    or-int/2addr v8, v12

    shl-int/lit8 v12, v10, 0x3

    and-int/lit16 v12, v12, 0x1c00

    or-int/2addr v8, v12

    shl-int/lit8 v12, v10, 0x3

    and-int v12, v12, v25

    or-int/2addr v8, v12

    .local v8, "$changed$iv$iv":I
    move-object/from16 v12, v19

    .local v12, "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    move-object/from16 v16, v5

    .local v16, "label$iv$iv":Ljava/lang/String;
    move-object v13, v9

    .local v13, "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    const/16 v21, 0x0

    .line 500
    .local v21, "$i$f$animateValue":I
    const-string v14, "CC(animateValue)P(3,2)1833@77788L32,1834@77843L31,1835@77899L23,1837@77935L89:Transition.kt#pdpnli"

    move-object/from16 v22, v5

    const v5, -0x880d1ef

    .end local v5    # "label$iv":Ljava/lang/String;
    .local v22, "label$iv":Ljava/lang/String;
    invoke-static {v11, v5, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 502
    invoke-virtual {v12}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v5

    shr-int/lit8 v14, v8, 0x9

    and-int/lit8 v14, v14, 0x70

    .local v14, "$changed":I
    check-cast v5, Landroidx/compose/ui/state/ToggleableState;

    .local v5, "it":Landroidx/compose/ui/state/ToggleableState;
    move-object/from16 v17, v11

    .local v17, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    move-object/from16 v23, v5

    .end local v5    # "it":Landroidx/compose/ui/state/ToggleableState;
    .local v18, "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkCenterGravitationShiftFraction$3":I
    .local v23, "it":Landroidx/compose/ui/state/ToggleableState;
    const v5, -0x7d1b526b

    move/from16 v24, v8

    move-object/from16 v8, v17

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "$changed$iv$iv":I
    invoke-interface {v8, v5}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v8, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v17

    if-eqz v17, :cond_e

    move-object/from16 v17, v8

    .end local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    const-string v8, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:285)"

    move-object/from16 v26, v9

    const/4 v9, -0x1

    .end local v9    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .local v26, "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    invoke-static {v5, v14, v9, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_9

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v26    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .restart local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v9    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    :cond_e
    move-object/from16 v17, v8

    move-object/from16 v26, v9

    .line 286
    .end local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v9    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v26    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    :goto_9
    sget-object v8, Landroidx/compose/material/CheckboxKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual/range {v23 .. v23}, Landroidx/compose/ui/state/ToggleableState;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_2

    new-instance v5, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v5}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v5

    .line 289
    :pswitch_6
    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_a

    .line 288
    :pswitch_7
    const/4 v8, 0x0

    goto :goto_a

    .line 287
    :pswitch_8
    const/4 v8, 0x0

    .line 286
    :goto_a
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v9

    if-eqz v9, :cond_f

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_f
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .end local v14    # "$changed":I
    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkCenterGravitationShiftFraction$3":I
    .end local v23    # "it":Landroidx/compose/ui/state/ToggleableState;
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    .line 502
    nop

    .line 503
    .local v8, "initialValue$iv$iv":Ljava/lang/Object;
    invoke-virtual {v12}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v9

    shr-int/lit8 v14, v24, 0x9

    and-int/lit8 v14, v14, 0x70

    .restart local v14    # "$changed":I
    check-cast v9, Landroidx/compose/ui/state/ToggleableState;

    .local v9, "it":Landroidx/compose/ui/state/ToggleableState;
    move-object/from16 v17, v11

    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    move-object/from16 v23, v8

    move-object/from16 v8, v17

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    .restart local v18    # "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkCenterGravitationShiftFraction$3":I
    .local v23, "initialValue$iv$iv":Ljava/lang/Object;
    invoke-interface {v8, v5}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {v8, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:285)"

    move-object/from16 v17, v8

    const/4 v8, -0x1

    .end local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {v5, v14, v8, v0}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    goto :goto_b

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v8    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_10
    move-object/from16 v17, v8

    .line 286
    .end local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    :goto_b
    sget-object v0, Landroidx/compose/material/CheckboxKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v9}, Landroidx/compose/ui/state/ToggleableState;->ordinal()I

    move-result v5

    aget v0, v0, v5

    packed-switch v0, :pswitch_data_3

    new-instance v5, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v5}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v5

    .line 289
    :pswitch_9
    const/high16 v31, 0x3f800000    # 1.0f

    goto :goto_c

    .line 288
    :pswitch_a
    const/16 v31, 0x0

    goto :goto_c

    .line 287
    :pswitch_b
    const/16 v31, 0x0

    .line 286
    :goto_c
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_11
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .end local v9    # "it":Landroidx/compose/ui/state/ToggleableState;
    .end local v14    # "$changed":I
    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$a$-animateFloat-CheckboxKt$CheckboxImpl$checkCenterGravitationShiftFraction$3":I
    invoke-static/range {v31 .. v31}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 503
    nop

    .line 504
    .local v0, "targetValue$iv$iv":Ljava/lang/Object;
    invoke-virtual {v12}, Landroidx/compose/animation/core/Transition;->getSegment()Landroidx/compose/animation/core/Transition$Segment;

    move-result-object v5

    shr-int/lit8 v8, v24, 0x3

    and-int/lit8 v8, v8, 0x70

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v13, v5, v11, v8}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Landroidx/compose/animation/core/FiniteAnimationSpec;

    .line 506
    .local v14, "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    and-int/lit8 v5, v24, 0xe

    shl-int/lit8 v8, v24, 0x9

    and-int v8, v8, v25

    or-int/2addr v5, v8

    shl-int/lit8 v8, v24, 0x6

    const/high16 v9, 0x70000

    and-int/2addr v8, v9

    or-int v18, v5, v8

    move-object/from16 v17, v13

    move-object v13, v0

    move-object/from16 v0, v17

    move-object/from16 v17, v11

    move-object v11, v12

    move-object/from16 v12, v23

    .end local v23    # "initialValue$iv$iv":Ljava/lang/Object;
    .local v0, "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    .local v11, "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    .local v12, "initialValue$iv$iv":Ljava/lang/Object;
    .local v13, "targetValue$iv$iv":Ljava/lang/Object;
    .local v17, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static/range {v11 .. v18}, Landroidx/compose/animation/core/TransitionKt;->createTransitionAnimation(Landroidx/compose/animation/core/Transition;Ljava/lang/Object;Ljava/lang/Object;Landroidx/compose/animation/core/FiniteAnimationSpec;Landroidx/compose/animation/core/TwoWayConverter;Ljava/lang/String;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v38

    .line 500
    move-object/from16 v8, v17

    .end local v17    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v8, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 506
    nop

    .line 498
    .end local v0    # "transitionSpec$iv$iv":Lkotlin/jvm/functions/Function3;
    .end local v11    # "$this$animateValue$iv$iv":Landroidx/compose/animation/core/Transition;
    .end local v12    # "initialValue$iv$iv":Ljava/lang/Object;
    .end local v13    # "targetValue$iv$iv":Ljava/lang/Object;
    .end local v14    # "animationSpec$iv$iv":Landroidx/compose/animation/core/FiniteAnimationSpec;
    .end local v15    # "typeConverter$iv$iv":Landroidx/compose/animation/core/TwoWayConverter;
    .end local v16    # "label$iv$iv":Ljava/lang/String;
    .end local v21    # "$i$f$animateValue":I
    .end local v24    # "$changed$iv$iv":I
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 277
    .end local v8    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v10    # "$changed$iv":I
    .end local v19    # "$this$animateFloat$iv":Landroidx/compose/animation/core/Transition;
    .end local v20    # "$i$f$animateFloat":I
    .end local v22    # "label$iv":Ljava/lang/String;
    .end local v26    # "transitionSpec$iv":Lkotlin/jvm/functions/Function3;
    nop

    .line 276
    move-object/from16 v0, v38

    .line 292
    .local v0, "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    const v5, -0x1a7ac38f

    const-string v8, "CC(remember):Checkbox.kt#9igjgp"

    invoke-static {v6, v5, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v5, 0x0

    .local v5, "invalid$iv":Z
    move-object v8, v6

    .local v8, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 507
    .local v9, "$i$f$cache":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it$iv":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 508
    .local v11, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_12

    .line 509
    const/4 v12, 0x0

    .line 292
    .local v12, "$i$a$-cache-CheckboxKt$CheckboxImpl$checkCache$1":I
    new-instance v13, Landroidx/compose/material/CheckDrawingCache;

    const/16 v17, 0x7

    const/16 v18, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v13 .. v18}, Landroidx/compose/material/CheckDrawingCache;-><init>(Landroidx/compose/ui/graphics/Path;Landroidx/compose/ui/graphics/PathMeasure;Landroidx/compose/ui/graphics/Path;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 509
    .end local v12    # "$i$a$-cache-CheckboxKt$CheckboxImpl$checkCache$1":I
    nop

    .line 510
    .local v13, "value$iv":Ljava/lang/Object;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 511
    move-object v10, v13

    .end local v13    # "value$iv":Ljava/lang/Object;
    goto :goto_d

    .line 512
    :cond_12
    nop

    .line 507
    .end local v10    # "it$iv":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_d
    nop

    .line 292
    .end local v5    # "invalid$iv":Z
    .end local v8    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache":I
    move-object/from16 v33, v10

    check-cast v33, Landroidx/compose/material/CheckDrawingCache;

    .local v33, "checkCache":Landroidx/compose/material/CheckDrawingCache;
    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 293
    shr-int/lit8 v5, v29, 0x3

    and-int/lit8 v5, v5, 0xe

    shr-int/lit8 v8, v29, 0x6

    and-int/lit8 v8, v8, 0x70

    or-int/2addr v5, v8

    invoke-interface {v4, v2, v6, v5}, Landroidx/compose/material/CheckboxColors;->checkmarkColor(Landroidx/compose/ui/state/ToggleableState;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v5

    .line 294
    .local v5, "checkColor$delegate":Landroidx/compose/runtime/State;
    and-int/lit8 v8, v29, 0xe

    and-int/lit8 v9, v29, 0x70

    or-int/2addr v8, v9

    shr-int/lit8 v9, v29, 0x3

    and-int/lit16 v9, v9, 0x380

    or-int/2addr v8, v9

    invoke-interface {v4, v1, v2, v6, v8}, Landroidx/compose/material/CheckboxColors;->boxColor(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v8

    .line 295
    .local v8, "boxColor$delegate":Landroidx/compose/runtime/State;
    and-int/lit8 v9, v29, 0xe

    and-int/lit8 v10, v29, 0x70

    or-int/2addr v9, v10

    shr-int/lit8 v10, v29, 0x3

    and-int/lit16 v10, v10, 0x380

    or-int/2addr v9, v10

    invoke-interface {v4, v1, v2, v6, v9}, Landroidx/compose/material/CheckboxColors;->borderColor(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v9

    .line 296
    .local v9, "borderColor$delegate":Landroidx/compose/runtime/State;
    sget-object v10, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x2

    invoke-static {v3, v10, v12, v13, v11}, Landroidx/compose/foundation/layout/SizeKt;->wrapContentSize$default(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;ZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    sget v11, Landroidx/compose/material/CheckboxKt;->CheckboxSize:F

    invoke-static {v10, v11}, Landroidx/compose/foundation/layout/SizeKt;->requiredSize-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v10

    const v11, -0x1a7a9f31

    const-string v12, "CC(remember):Checkbox.kt#9igjgp"

    invoke-static {v6, v11, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v6, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    invoke-interface {v6, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v11, v12

    invoke-interface {v6, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v11, v12

    invoke-interface {v6, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v11, v12

    invoke-interface {v6, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v11, v12

    .local v11, "invalid$iv":Z
    move-object v12, v6

    .local v12, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 513
    .local v13, "$i$f$cache":I
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 514
    .local v15, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v11, :cond_14

    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v38, v0

    .end local v0    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    .local v38, "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v14, v0, :cond_13

    goto :goto_e

    .line 518
    :cond_13
    move-object/from16 v36, v5

    move-object/from16 v37, v7

    move-object/from16 v34, v8

    move-object/from16 v35, v9

    goto :goto_f

    .line 514
    .end local v38    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    .restart local v0    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    :cond_14
    move-object/from16 v38, v0

    .line 515
    .end local v0    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    .restart local v38    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    :goto_e
    const/4 v0, 0x0

    .line 296
    .local v0, "$i$a$-cache-CheckboxKt$CheckboxImpl$1":I
    new-instance v32, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda2;

    move-object/from16 v36, v5

    move-object/from16 v37, v7

    move-object/from16 v34, v8

    move-object/from16 v35, v9

    .end local v5    # "checkColor$delegate":Landroidx/compose/runtime/State;
    .end local v7    # "checkDrawFraction$delegate":Landroidx/compose/runtime/State;
    .end local v8    # "boxColor$delegate":Landroidx/compose/runtime/State;
    .end local v9    # "borderColor$delegate":Landroidx/compose/runtime/State;
    .local v34, "boxColor$delegate":Landroidx/compose/runtime/State;
    .local v35, "borderColor$delegate":Landroidx/compose/runtime/State;
    .local v36, "checkColor$delegate":Landroidx/compose/runtime/State;
    .local v37, "checkDrawFraction$delegate":Landroidx/compose/runtime/State;
    invoke-direct/range {v32 .. v38}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/material/CheckDrawingCache;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    .line 515
    .end local v0    # "$i$a$-cache-CheckboxKt$CheckboxImpl$1":I
    move-object/from16 v0, v32

    .line 516
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v12, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 517
    move-object v14, v0

    .line 513
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v14    # "it$iv":Ljava/lang/Object;
    .end local v15    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_f
    nop

    .line 296
    .end local v11    # "invalid$iv":Z
    .end local v12    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    check-cast v14, Lkotlin/jvm/functions/Function1;

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v12, 0x0

    invoke-static {v10, v14, v6, v12}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v28    # "transition":Landroidx/compose/animation/core/Transition;
    .end local v33    # "checkCache":Landroidx/compose/material/CheckDrawingCache;
    .end local v34    # "boxColor$delegate":Landroidx/compose/runtime/State;
    .end local v35    # "borderColor$delegate":Landroidx/compose/runtime/State;
    .end local v36    # "checkColor$delegate":Landroidx/compose/runtime/State;
    .end local v37    # "checkDrawFraction$delegate":Landroidx/compose/runtime/State;
    .end local v38    # "checkCenterGravitationShiftFraction$delegate":Landroidx/compose/runtime/State;
    goto :goto_10

    .line 252
    .end local v29    # "$dirty":I
    .local v7, "$dirty":I
    :cond_15
    move/from16 v29, v7

    .end local v7    # "$dirty":I
    .restart local v29    # "$dirty":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 312
    :cond_16
    :goto_10
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v7

    if-eqz v7, :cond_17

    new-instance v0, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda3;

    move/from16 v5, p5

    invoke-direct/range {v0 .. v5}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda3;-><init>(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;I)V

    invoke-interface {v7, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_17
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method private static final CheckboxImpl$lambda$0(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;
    .locals 4
    .param p0, "$this$animateFloat"    # Landroidx/compose/animation/core/Transition$Segment;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const v0, -0x65c97a74

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:261)"

    invoke-static {v0, p2, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 262
    :cond_0
    nop

    .line 263
    invoke-interface {p0}, Landroidx/compose/animation/core/Transition$Segment;->getInitialState()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/state/ToggleableState;->Off:Landroidx/compose/ui/state/ToggleableState;

    const/16 v2, 0x64

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-static {v2, v0, v3, v1, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    goto :goto_0

    .line 264
    :cond_1
    invoke-interface {p0}, Landroidx/compose/animation/core/Transition$Segment;->getTargetState()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/state/ToggleableState;->Off:Landroidx/compose/ui/state/ToggleableState;

    if-ne v0, v1, :cond_2

    invoke-static {v2}, Landroidx/compose/animation/core/AnimationSpecKt;->snap(I)Landroidx/compose/animation/core/SnapSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    goto :goto_0

    .line 265
    :cond_2
    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-static {v1, v1, v3, v0, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->spring$default(FFLjava/lang/Object;ILjava/lang/Object;)Landroidx/compose/animation/core/SpringSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    .line 262
    :goto_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_3
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    return-object v0
.end method

.method private static final CheckboxImpl$lambda$10$0(Landroidx/compose/material/CheckDrawingCache;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 9
    .param p0, "$checkCache"    # Landroidx/compose/material/CheckDrawingCache;
    .param p1, "$boxColor$delegate"    # Landroidx/compose/runtime/State;
    .param p2, "$borderColor$delegate"    # Landroidx/compose/runtime/State;
    .param p3, "$checkColor$delegate"    # Landroidx/compose/runtime/State;
    .param p4, "$checkDrawFraction$delegate"    # Landroidx/compose/runtime/State;
    .param p5, "$checkCenterGravitationShiftFraction$delegate"    # Landroidx/compose/runtime/State;
    .param p6, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    .line 297
    sget v0, Landroidx/compose/material/CheckboxKt;->StrokeWidth:F

    invoke-interface {p6, v0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->toPx-0680j_4(F)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-float v7, v0

    .line 298
    .local v7, "strokeWidthPx":F
    nop

    .line 299
    invoke-static {p1}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$8(Landroidx/compose/runtime/State;)J

    move-result-wide v3

    .line 300
    invoke-static {p2}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$9(Landroidx/compose/runtime/State;)J

    move-result-wide v5

    .line 301
    sget v0, Landroidx/compose/material/CheckboxKt;->RadiusSize:F

    invoke-interface {p6, v0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->toPx-0680j_4(F)F

    move-result v0

    .line 302
    nop

    .line 298
    move-object v2, p6

    move v8, v7

    move v7, v0

    .end local v7    # "strokeWidthPx":F
    .end local p6    # "$this$Canvas":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v2, "$this$Canvas":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v8, "strokeWidthPx":F
    invoke-static/range {v2 .. v8}, Landroidx/compose/material/CheckboxKt;->drawBox-1wkBAMs(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJFF)V

    .line 304
    move v7, v8

    .line 305
    .end local v8    # "strokeWidthPx":F
    .restart local v7    # "strokeWidthPx":F
    invoke-static {p3}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$7(Landroidx/compose/runtime/State;)J

    move-result-wide v3

    .line 306
    invoke-static {p4}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$2(Landroidx/compose/runtime/State;)F

    move-result v5

    .line 307
    invoke-static {p5}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl$lambda$5(Landroidx/compose/runtime/State;)F

    move-result v6

    .line 308
    nop

    .line 309
    nop

    .line 304
    move-object v8, p0

    .end local p0    # "$checkCache":Landroidx/compose/material/CheckDrawingCache;
    .local v8, "$checkCache":Landroidx/compose/material/CheckDrawingCache;
    invoke-static/range {v2 .. v8}, Landroidx/compose/material/CheckboxKt;->drawCheck-3IgeMak(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFFFLandroidx/compose/material/CheckDrawingCache;)V

    .line 311
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final CheckboxImpl$lambda$11(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7

    or-int/lit8 v0, p4, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v6

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p5

    invoke-static/range {v1 .. v6}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;I)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final CheckboxImpl$lambda$2(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$checkDrawFraction$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 260
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 557
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 260
    return v0
.end method

.method private static final CheckboxImpl$lambda$3(Landroidx/compose/animation/core/Transition$Segment;Landroidx/compose/runtime/Composer;I)Landroidx/compose/animation/core/FiniteAnimationSpec;
    .locals 5
    .param p0, "$this$animateFloat"    # Landroidx/compose/animation/core/Transition$Segment;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const v0, 0x40178695

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.compose.material.CheckboxImpl.<anonymous> (Checkbox.kt:278)"

    invoke-static {v0, p2, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 279
    :cond_0
    nop

    .line 280
    invoke-interface {p0}, Landroidx/compose/animation/core/Transition$Segment;->getInitialState()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/state/ToggleableState;->Off:Landroidx/compose/ui/state/ToggleableState;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    invoke-static {v2, v0, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->snap$default(IILjava/lang/Object;)Landroidx/compose/animation/core/SnapSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    goto :goto_0

    .line 281
    :cond_1
    invoke-interface {p0}, Landroidx/compose/animation/core/Transition$Segment;->getTargetState()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroidx/compose/ui/state/ToggleableState;->Off:Landroidx/compose/ui/state/ToggleableState;

    const/16 v4, 0x64

    if-ne v0, v1, :cond_2

    invoke-static {v4}, Landroidx/compose/animation/core/AnimationSpecKt;->snap(I)Landroidx/compose/animation/core/SnapSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    goto :goto_0

    .line 282
    :cond_2
    const/4 v0, 0x6

    invoke-static {v4, v2, v3, v0, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/FiniteAnimationSpec;

    .line 279
    :goto_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_3
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    return-object v0
.end method

.method private static final CheckboxImpl$lambda$5(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$checkCenterGravitationShiftFraction$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 277
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 558
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 277
    return v0
.end method

.method private static final CheckboxImpl$lambda$7(Landroidx/compose/runtime/State;)J
    .locals 4
    .param p0, "$checkColor$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/compose/ui/graphics/Color;",
            ">;)J"
        }
    .end annotation

    .line 293
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 559
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v0

    .line 293
    return-wide v0
.end method

.method private static final CheckboxImpl$lambda$8(Landroidx/compose/runtime/State;)J
    .locals 4
    .param p0, "$boxColor$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/compose/ui/graphics/Color;",
            ">;)J"
        }
    .end annotation

    .line 294
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 560
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v0

    .line 294
    return-wide v0
.end method

.method private static final CheckboxImpl$lambda$9(Landroidx/compose/runtime/State;)J
    .locals 4
    .param p0, "$borderColor$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/compose/ui/graphics/Color;",
            ">;)J"
        }
    .end annotation

    .line 295
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 561
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v0

    .line 295
    return-wide v0
.end method

.method public static final TriStateCheckbox(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V
    .locals 23
    .param p0, "state"    # Landroidx/compose/ui/state/ToggleableState;
    .param p1, "onClick"    # Lkotlin/jvm/functions/Function0;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "enabled"    # Z
    .param p4, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p5, "colors"    # Landroidx/compose/material/CheckboxColors;
    .param p6, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p7, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/state/ToggleableState;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/material/CheckboxColors;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 139
    move-object/from16 v2, p1

    move/from16 v7, p7

    const v0, 0x79127e9a

    move-object/from16 v1, p6

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v5

    .end local p6    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(TriStateCheckbox)N(state,onClick,modifier,enabled,interactionSource,colors)152@6815L461:Checkbox.kt#jmzs0o"

    invoke-static {v5, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p7

    .local v1, "$dirty":I
    and-int/lit8 v3, v7, 0x6

    if-nez v3, :cond_1

    move-object/from16 v3, p0

    check-cast v3, Ljava/lang/Enum;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v1, v3

    :cond_1
    and-int/lit8 v3, v7, 0x30

    if-nez v3, :cond_3

    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x20

    goto :goto_1

    :cond_2
    const/16 v3, 0x10

    :goto_1
    or-int/2addr v1, v3

    :cond_3
    and-int/lit8 v3, p8, 0x4

    if-eqz v3, :cond_4

    or-int/lit16 v1, v1, 0x180

    move-object/from16 v4, p2

    goto :goto_3

    :cond_4
    and-int/lit16 v4, v7, 0x180

    if-nez v4, :cond_6

    move-object/from16 v4, p2

    invoke-interface {v5, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    const/16 v6, 0x100

    goto :goto_2

    :cond_5
    const/16 v6, 0x80

    :goto_2
    or-int/2addr v1, v6

    goto :goto_3

    :cond_6
    move-object/from16 v4, p2

    :goto_3
    and-int/lit8 v6, p8, 0x8

    if-eqz v6, :cond_7

    or-int/lit16 v1, v1, 0xc00

    move/from16 v8, p3

    goto :goto_5

    :cond_7
    and-int/lit16 v8, v7, 0xc00

    if-nez v8, :cond_9

    move/from16 v8, p3

    invoke-interface {v5, v8}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v9

    if-eqz v9, :cond_8

    const/16 v9, 0x800

    goto :goto_4

    :cond_8
    const/16 v9, 0x400

    :goto_4
    or-int/2addr v1, v9

    goto :goto_5

    :cond_9
    move/from16 v8, p3

    :goto_5
    and-int/lit8 v9, p8, 0x10

    if-eqz v9, :cond_a

    or-int/lit16 v1, v1, 0x6000

    move-object/from16 v10, p4

    goto :goto_7

    :cond_a
    and-int/lit16 v10, v7, 0x6000

    if-nez v10, :cond_c

    move-object/from16 v10, p4

    invoke-interface {v5, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    const/16 v11, 0x4000

    goto :goto_6

    :cond_b
    const/16 v11, 0x2000

    :goto_6
    or-int/2addr v1, v11

    goto :goto_7

    :cond_c
    move-object/from16 v10, p4

    :goto_7
    const/high16 v11, 0x30000

    and-int/2addr v11, v7

    if-nez v11, :cond_f

    and-int/lit8 v11, p8, 0x20

    if-nez v11, :cond_d

    move-object/from16 v11, p5

    invoke-interface {v5, v11}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    const/high16 v12, 0x20000

    goto :goto_8

    :cond_d
    move-object/from16 v11, p5

    :cond_e
    const/high16 v12, 0x10000

    :goto_8
    or-int/2addr v1, v12

    goto :goto_9

    :cond_f
    move-object/from16 v11, p5

    :goto_9
    const v12, 0x12493

    and-int/2addr v12, v1

    const v13, 0x12492

    if-eq v12, v13, :cond_10

    const/4 v12, 0x1

    goto :goto_a

    :cond_10
    const/4 v12, 0x0

    :goto_a
    and-int/lit8 v13, v1, 0x1

    invoke-interface {v5, v12, v13}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v12

    if-eqz v12, :cond_1c

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v12, "137@6355L8"

    invoke-static {v5, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v12, v7, 0x1

    const v22, -0x70001

    if-eqz v12, :cond_13

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v12

    if-eqz v12, :cond_11

    goto :goto_b

    .line 132
    :cond_11
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v3, p8, 0x20

    if-eqz v3, :cond_12

    and-int v1, v1, v22

    :cond_12
    move v9, v1

    move-object/from16 v19, v5

    move v1, v8

    move-object v2, v10

    move-object v8, v4

    goto :goto_f

    .line 139
    :cond_13
    :goto_b
    if-eqz v3, :cond_14

    .line 135
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_c

    .line 139
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_14
    move-object v3, v4

    .line 135
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_c
    if-eqz v6, :cond_15

    .line 136
    const/4 v4, 0x1

    .end local p3    # "enabled":Z
    .local v4, "enabled":Z
    goto :goto_d

    .line 135
    .end local v4    # "enabled":Z
    .restart local p3    # "enabled":Z
    :cond_15
    move v4, v8

    .line 136
    .end local p3    # "enabled":Z
    .restart local v4    # "enabled":Z
    :goto_d
    if-eqz v9, :cond_16

    .line 137
    const/4 v6, 0x0

    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v6, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_e

    .line 136
    .end local v6    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_16
    move-object v6, v10

    .line 137
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v6    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_e
    and-int/lit8 v8, p8, 0x20

    if-eqz v8, :cond_17

    .line 138
    sget-object v8, Landroidx/compose/material/CheckboxDefaults;->INSTANCE:Landroidx/compose/material/CheckboxDefaults;

    const/high16 v20, 0x30000

    const/16 v21, 0x1f

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const-wide/16 v17, 0x0

    move-object/from16 v19, v5

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v19, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v8 .. v21}, Landroidx/compose/material/CheckboxDefaults;->colors-zjMxDiM(JJJJJLandroidx/compose/runtime/Composer;II)Landroidx/compose/material/CheckboxColors;

    move-result-object v5

    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .local v5, "colors":Landroidx/compose/material/CheckboxColors;
    and-int v1, v1, v22

    move v9, v1

    move-object v8, v3

    move v1, v4

    move-object v11, v5

    move-object v2, v6

    goto :goto_f

    .line 137
    .end local v19    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$composer":Landroidx/compose/runtime/Composer;
    .restart local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    :cond_17
    move-object/from16 v19, v5

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v19    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v11, p5

    move v9, v1

    move-object v8, v3

    move v1, v4

    move-object v2, v6

    .line 132
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v4    # "enabled":Z
    .end local v6    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .local v1, "enabled":Z
    .local v2, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v8, "modifier":Landroidx/compose/ui/Modifier;
    .local v9, "$dirty":I
    .local v11, "colors":Landroidx/compose/material/CheckboxColors;
    :goto_f
    invoke-interface/range {v19 .. v19}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_18

    const/4 v3, -0x1

    const-string v4, "androidx.compose.material.TriStateCheckbox (Checkbox.kt:138)"

    invoke-static {v0, v9, v3, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 141
    :cond_18
    if-eqz p1, :cond_19

    .line 142
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    .line 144
    nop

    .line 146
    sget-object v3, Landroidx/compose/ui/semantics/Role;->Companion:Landroidx/compose/ui/semantics/Role$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/semantics/Role$Companion;->getCheckbox-o7Vup1c()I

    move-result v3

    .line 148
    sget v13, Landroidx/compose/material/CheckboxKt;->CheckboxRippleRadius:F

    const/16 v16, 0x4

    const/16 v17, 0x0

    const/4 v12, 0x0

    const-wide/16 v14, 0x0

    invoke-static/range {v12 .. v17}, Landroidx/compose/material/RippleKt;->ripple-H2RKhps$default(ZFJILjava/lang/Object;)Landroidx/compose/foundation/IndicationNodeFactory;

    move-result-object v4

    .line 142
    check-cast v0, Landroidx/compose/ui/Modifier;

    .line 143
    nop

    .line 147
    nop

    .line 148
    check-cast v4, Landroidx/compose/foundation/Indication;

    .line 145
    nop

    .line 146
    invoke-static {v3}, Landroidx/compose/ui/semantics/Role;->box-impl(I)Landroidx/compose/ui/semantics/Role;

    move-result-object v5

    .line 144
    nop

    .line 142
    move-object/from16 v6, p1

    move-object v3, v4

    move v4, v1

    move-object/from16 v1, p0

    .end local v1    # "enabled":Z
    .restart local v4    # "enabled":Z
    invoke-static/range {v0 .. v6}, Landroidx/compose/foundation/selection/ToggleableKt;->triStateToggleable-O2vRcR0(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/state/ToggleableState;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/foundation/Indication;ZLandroidx/compose/ui/semantics/Role;Lkotlin/jvm/functions/Function0;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    move-object v10, v2

    move v1, v4

    .end local v2    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v4    # "enabled":Z
    .restart local v1    # "enabled":Z
    .local v10, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_10

    .line 151
    .end local v10    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v2    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_19
    move-object v10, v2

    .end local v2    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v10    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .line 141
    :goto_10
    nop

    .line 140
    nop

    .line 154
    .local v0, "toggleableModifier":Landroidx/compose/ui/Modifier;
    nop

    .line 155
    nop

    .line 157
    nop

    .line 159
    if-eqz p1, :cond_1a

    .line 160
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    invoke-static {v2}, Landroidx/compose/material/InteractiveComponentSizeKt;->minimumInteractiveComponentSize(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    goto :goto_11

    .line 162
    :cond_1a
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .line 158
    :goto_11
    invoke-interface {v8, v2}, Landroidx/compose/ui/Modifier;->then(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 165
    invoke-interface {v2, v0}, Landroidx/compose/ui/Modifier;->then(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 166
    sget v3, Landroidx/compose/material/CheckboxKt;->CheckboxDefaultPadding:F

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 167
    shr-int/lit8 v2, v9, 0x9

    and-int/lit8 v2, v2, 0xe

    shl-int/lit8 v4, v9, 0x3

    and-int/lit8 v4, v4, 0x70

    or-int/2addr v2, v4

    shr-int/lit8 v4, v9, 0x6

    and-int/lit16 v4, v4, 0x1c00

    or-int v6, v2, v4

    .line 153
    move-object/from16 v2, p0

    move-object v4, v11

    move-object/from16 v5, v19

    .end local v11    # "colors":Landroidx/compose/material/CheckboxColors;
    .end local v19    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "colors":Landroidx/compose/material/CheckboxColors;
    .restart local v5    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v6}, Landroidx/compose/material/CheckboxKt;->CheckboxImpl(ZLandroidx/compose/ui/state/ToggleableState;Landroidx/compose/ui/Modifier;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;I)V

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v19    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 169
    .end local v0    # "toggleableModifier":Landroidx/compose/ui/Modifier;
    :cond_1b
    move-object v6, v4

    move-object v3, v8

    move v4, v1

    move-object v5, v10

    goto :goto_12

    .line 132
    .end local v4    # "colors":Landroidx/compose/material/CheckboxColors;
    .end local v8    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v9    # "$dirty":I
    .end local v10    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v19    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$dirty":I
    .restart local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "enabled":Z
    .restart local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    :cond_1c
    move-object/from16 v19, v5

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v19    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v19 .. v19}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object/from16 v6, p5

    move v9, v1

    move-object v3, v4

    move v4, v8

    move-object v5, v10

    .line 169
    .end local v1    # "$dirty":I
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "enabled":Z
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "colors":Landroidx/compose/material/CheckboxColors;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "enabled":Z
    .local v5, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v6, "colors":Landroidx/compose/material/CheckboxColors;
    .restart local v9    # "$dirty":I
    :goto_12
    invoke-interface/range {v19 .. v19}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v10

    if-eqz v10, :cond_1d

    new-instance v0, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda4;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Landroidx/compose/material/CheckboxKt$$ExternalSyntheticLambda4;-><init>(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;II)V

    invoke-interface {v10, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_1d
    return-void
.end method

.method private static final TriStateCheckbox$lambda$0(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10

    or-int/lit8 v0, p6, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move/from16 v9, p7

    move-object/from16 v7, p8

    invoke-static/range {v1 .. v9}, Landroidx/compose/material/CheckboxKt;->TriStateCheckbox(Landroidx/compose/ui/state/ToggleableState;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/material/CheckboxColors;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final drawBox-1wkBAMs(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJFF)V
    .locals 42
    .param p0, "$this$drawBox_u2d1wkBAMs"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-boxColor$0"    # J
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-borderColor$0"    # J
    .param p5, "radius"    # F
    .param p6, "strokeWidth"    # F

    .line 320
    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, p6, v0

    .line 321
    .local v0, "halfStrokeWidth":F
    new-instance v1, Landroidx/compose/ui/graphics/drawscope/Stroke;

    const/16 v7, 0x1e

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move/from16 v2, p6

    invoke-direct/range {v1 .. v8}, Landroidx/compose/ui/graphics/drawscope/Stroke;-><init>(FFIILandroidx/compose/ui/graphics/PathEffect;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 322
    .local v1, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v2

    .local v2, "arg0$iv":J
    const/4 v4, 0x0

    .line 519
    .local v4, "$i$f$getWidth-impl":I
    move-wide v5, v2

    .local v5, "value$iv$iv":J
    const/4 v7, 0x0

    .line 520
    .local v7, "$i$f$unpackFloat1":I
    const/16 v8, 0x20

    shr-long v9, v5, v8

    long-to-int v9, v9

    .local v9, "bits$iv$iv$iv":I
    const/4 v10, 0x0

    .line 521
    .local v10, "$i$f$floatFromBits":I
    invoke-static {v9}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v9

    .line 520
    .end local v9    # "bits$iv$iv$iv":I
    .end local v10    # "$i$f$floatFromBits":I
    nop

    .line 519
    .end local v5    # "value$iv$iv":J
    .end local v7    # "$i$f$unpackFloat1":I
    nop

    .line 322
    .end local v2    # "arg0$iv":J
    .end local v4    # "$i$f$getWidth-impl":I
    nop

    .line 323
    .local v9, "checkboxSize":F
    invoke-static/range {p1 .. p4}, Landroidx/compose/ui/graphics/Color;->equals-impl0(JJ)Z

    move-result v2

    const-wide v3, 0xffffffffL

    if-eqz v2, :cond_0

    .line 324
    nop

    .line 325
    nop

    .line 324
    nop

    .line 326
    move v2, v9

    .local v2, "height$iv":F
    move v5, v9

    .local v5, "width$iv":F
    const/4 v6, 0x0

    .line 522
    .local v6, "$i$f$Size":I
    const/4 v7, 0x0

    .line 523
    .local v7, "$i$f$packFloats":I
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 524
    .local v10, "v1$iv$iv":J
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 525
    .local v12, "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 522
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/Size;->constructor-impl(J)J

    move-result-wide v17

    .line 327
    .end local v2    # "height$iv":F
    .end local v5    # "width$iv":F
    .end local v6    # "$i$f$Size":I
    move/from16 v2, p5

    .line 526
    .local v2, "x$iv":F
    move v5, v2

    .local v5, "y$iv":F
    const/4 v6, 0x0

    .local v6, "$i$f$CornerRadius":I
    const/4 v7, 0x0

    .line 527
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 528
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 529
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long/2addr v3, v12

    or-long/2addr v3, v14

    .line 526
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v3, v4}, Landroidx/compose/ui/geometry/CornerRadius;->constructor-impl(J)J

    move-result-wide v19

    .line 328
    .end local v2    # "x$iv":F
    .end local v5    # "y$iv":F
    .end local v6    # "$i$f$CornerRadius":I
    sget-object v2, Landroidx/compose/ui/graphics/drawscope/Fill;->INSTANCE:Landroidx/compose/ui/graphics/drawscope/Fill;

    move-object/from16 v21, v2

    check-cast v21, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    .line 324
    const/16 v25, 0xe2

    const/16 v26, 0x0

    const-wide/16 v15, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v12, p0

    move-wide/from16 v13, p1

    invoke-static/range {v12 .. v26}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawRoundRect-u-Aw5IA$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJJLandroidx/compose/ui/graphics/drawscope/DrawStyle;FLandroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    goto/16 :goto_0

    .line 331
    :cond_0
    nop

    .line 332
    nop

    .line 333
    move/from16 v2, p6

    .local v2, "y$iv":F
    move/from16 v5, p6

    .local v5, "x$iv":F
    const/4 v6, 0x0

    .line 530
    .local v6, "$i$f$Offset":I
    const/4 v7, 0x0

    .line 531
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 532
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 533
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 530
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v30

    .line 334
    .end local v2    # "y$iv":F
    .end local v5    # "x$iv":F
    .end local v6    # "$i$f$Offset":I
    const/4 v2, 0x2

    int-to-float v2, v2

    mul-float v5, p6, v2

    sub-float v5, v9, v5

    .local v5, "width$iv":F
    mul-float v2, v2, p6

    sub-float v2, v9, v2

    .local v2, "height$iv":F
    const/4 v6, 0x0

    .line 534
    .local v6, "$i$f$Size":I
    const/4 v7, 0x0

    .line 535
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 536
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 537
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 534
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/Size;->constructor-impl(J)J

    move-result-wide v32

    .line 335
    .end local v2    # "height$iv":F
    .end local v5    # "width$iv":F
    .end local v6    # "$i$f$Size":I
    const/4 v2, 0x0

    sub-float v5, p5, p6

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 538
    .local v2, "x$iv":F
    move v5, v2

    .local v5, "y$iv":F
    const/4 v6, 0x0

    .local v6, "$i$f$CornerRadius":I
    const/4 v7, 0x0

    .line 539
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 540
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 541
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 538
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/CornerRadius;->constructor-impl(J)J

    move-result-wide v34

    .line 336
    .end local v2    # "x$iv":F
    .end local v5    # "y$iv":F
    .end local v6    # "$i$f$CornerRadius":I
    sget-object v2, Landroidx/compose/ui/graphics/drawscope/Fill;->INSTANCE:Landroidx/compose/ui/graphics/drawscope/Fill;

    move-object/from16 v36, v2

    check-cast v36, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    .line 331
    const/16 v40, 0xe0

    const/16 v41, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    move-object/from16 v27, p0

    move-wide/from16 v28, p1

    invoke-static/range {v27 .. v41}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawRoundRect-u-Aw5IA$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJJLandroidx/compose/ui/graphics/drawscope/DrawStyle;FLandroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 338
    nop

    .line 339
    nop

    .line 340
    move v2, v0

    .local v2, "y$iv":F
    move v5, v0

    .local v5, "x$iv":F
    const/4 v6, 0x0

    .line 542
    .local v6, "$i$f$Offset":I
    const/4 v7, 0x0

    .line 543
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 544
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 545
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 542
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v30

    .line 341
    .end local v2    # "y$iv":F
    .end local v5    # "x$iv":F
    .end local v6    # "$i$f$Offset":I
    sub-float v2, v9, p6

    .local v2, "width$iv":F
    sub-float v5, v9, p6

    .local v5, "height$iv":F
    const/4 v6, 0x0

    .line 546
    .local v6, "$i$f$Size":I
    const/4 v7, 0x0

    .line 547
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 548
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 549
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long v16, v12, v3

    or-long v10, v14, v16

    .line 546
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v10, v11}, Landroidx/compose/ui/geometry/Size;->constructor-impl(J)J

    move-result-wide v32

    .line 342
    .end local v2    # "width$iv":F
    .end local v5    # "height$iv":F
    .end local v6    # "$i$f$Size":I
    sub-float v2, p5, v0

    .line 550
    .local v2, "x$iv":F
    move v5, v2

    .local v5, "y$iv":F
    const/4 v6, 0x0

    .local v6, "$i$f$CornerRadius":I
    const/4 v7, 0x0

    .line 551
    .restart local v7    # "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v10, v10

    .line 552
    .restart local v10    # "v1$iv$iv":J
    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v12

    int-to-long v12, v12

    .line 553
    .restart local v12    # "v2$iv$iv":J
    shl-long v14, v10, v8

    and-long/2addr v3, v12

    or-long/2addr v3, v14

    .line 550
    .end local v7    # "$i$f$packFloats":I
    .end local v10    # "v1$iv$iv":J
    .end local v12    # "v2$iv$iv":J
    invoke-static {v3, v4}, Landroidx/compose/ui/geometry/CornerRadius;->constructor-impl(J)J

    move-result-wide v34

    .line 343
    .end local v2    # "x$iv":F
    .end local v5    # "y$iv":F
    .end local v6    # "$i$f$CornerRadius":I
    move-object/from16 v36, v1

    check-cast v36, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    .line 338
    move-wide/from16 v28, p3

    invoke-static/range {v27 .. v41}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawRoundRect-u-Aw5IA$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJJLandroidx/compose/ui/graphics/drawscope/DrawStyle;FLandroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 346
    :goto_0
    return-void
.end method

.method private static final drawCheck-3IgeMak(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFFFLandroidx/compose/material/CheckDrawingCache;)V
    .locals 29
    .param p0, "$this$drawCheck_u2d3IgeMak"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-checkColor$0"    # J
    .param p3, "checkFraction"    # F
    .param p4, "crossCenterGravitation"    # F
    .param p5, "strokeWidthPx"    # F
    .param p6, "drawingCache"    # Landroidx/compose/material/CheckDrawingCache;

    .line 355
    move/from16 v0, p4

    new-instance v1, Landroidx/compose/ui/graphics/drawscope/Stroke;

    sget-object v2, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getSquare-KaPHkGw()I

    move-result v4

    const/16 v7, 0x1a

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move/from16 v2, p5

    invoke-direct/range {v1 .. v8}, Landroidx/compose/ui/graphics/drawscope/Stroke;-><init>(FFIILandroidx/compose/ui/graphics/PathEffect;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 356
    .local v1, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v2

    .local v2, "arg0$iv":J
    const/4 v4, 0x0

    .line 554
    .local v4, "$i$f$getWidth-impl":I
    move-wide v5, v2

    .local v5, "value$iv$iv":J
    const/4 v7, 0x0

    .line 555
    .local v7, "$i$f$unpackFloat1":I
    const/16 v8, 0x20

    shr-long v8, v5, v8

    long-to-int v8, v8

    .local v8, "bits$iv$iv$iv":I
    const/4 v9, 0x0

    .line 556
    .local v9, "$i$f$floatFromBits":I
    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    .line 555
    .end local v8    # "bits$iv$iv$iv":I
    .end local v9    # "$i$f$floatFromBits":I
    nop

    .line 554
    .end local v5    # "value$iv$iv":J
    .end local v7    # "$i$f$unpackFloat1":I
    nop

    .line 356
    .end local v2    # "arg0$iv":J
    .end local v4    # "$i$f$getWidth-impl":I
    nop

    .line 357
    .local v8, "width":F
    const v2, 0x3ecccccd    # 0.4f

    .line 358
    .local v2, "checkCrossX":F
    const v3, 0x3f333333    # 0.7f

    .line 359
    .local v3, "checkCrossY":F
    const v4, 0x3e4ccccd    # 0.2f

    .line 360
    .local v4, "leftX":F
    const/high16 v5, 0x3f000000    # 0.5f

    .line 361
    .local v5, "leftY":F
    const v6, 0x3f4ccccd    # 0.8f

    .line 362
    .local v6, "rightX":F
    const v7, 0x3e99999a    # 0.3f

    .line 364
    .local v7, "rightY":F
    const/high16 v9, 0x3f000000    # 0.5f

    invoke-static {v2, v9, v0}, Landroidx/compose/ui/util/MathHelpersKt;->lerp(FFF)F

    move-result v10

    .line 365
    .local v10, "gravitatedCrossX":F
    invoke-static {v3, v9, v0}, Landroidx/compose/ui/util/MathHelpersKt;->lerp(FFF)F

    move-result v11

    .line 367
    .local v11, "gravitatedCrossY":F
    invoke-static {v5, v9, v0}, Landroidx/compose/ui/util/MathHelpersKt;->lerp(FFF)F

    move-result v12

    .line 368
    .local v12, "gravitatedLeftY":F
    invoke-static {v7, v9, v0}, Landroidx/compose/ui/util/MathHelpersKt;->lerp(FFF)F

    move-result v9

    .line 370
    .local v9, "gravitatedRightY":F
    move-object/from16 v13, p6

    .local v13, "$this$drawCheck_3IgeMak_u24lambda_u240":Landroidx/compose/material/CheckDrawingCache;
    const/4 v14, 0x0

    .line 371
    .local v14, "$i$a$-with-CheckboxKt$drawCheck$1":I
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getCheckPath()Landroidx/compose/ui/graphics/Path;

    move-result-object v15

    invoke-interface {v15}, Landroidx/compose/ui/graphics/Path;->reset()V

    .line 372
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getCheckPath()Landroidx/compose/ui/graphics/Path;

    move-result-object v15

    mul-float v0, v8, v4

    move-object/from16 v16, v1

    .end local v1    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local v16, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    mul-float v1, v8, v12

    invoke-interface {v15, v0, v1}, Landroidx/compose/ui/graphics/Path;->moveTo(FF)V

    .line 373
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getCheckPath()Landroidx/compose/ui/graphics/Path;

    move-result-object v0

    mul-float v1, v8, v10

    mul-float v15, v8, v11

    invoke-interface {v0, v1, v15}, Landroidx/compose/ui/graphics/Path;->lineTo(FF)V

    .line 374
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getCheckPath()Landroidx/compose/ui/graphics/Path;

    move-result-object v0

    mul-float v1, v8, v6

    mul-float v15, v8, v9

    invoke-interface {v0, v1, v15}, Landroidx/compose/ui/graphics/Path;->lineTo(FF)V

    .line 376
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getPathMeasure()Landroidx/compose/ui/graphics/PathMeasure;

    move-result-object v0

    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getCheckPath()Landroidx/compose/ui/graphics/Path;

    move-result-object v1

    const/4 v15, 0x0

    invoke-interface {v0, v1, v15}, Landroidx/compose/ui/graphics/PathMeasure;->setPath(Landroidx/compose/ui/graphics/Path;Z)V

    .line 377
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getPathToDraw()Landroidx/compose/ui/graphics/Path;

    move-result-object v0

    invoke-interface {v0}, Landroidx/compose/ui/graphics/Path;->reset()V

    .line 378
    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getPathMeasure()Landroidx/compose/ui/graphics/PathMeasure;

    move-result-object v0

    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getPathMeasure()Landroidx/compose/ui/graphics/PathMeasure;

    move-result-object v1

    invoke-interface {v1}, Landroidx/compose/ui/graphics/PathMeasure;->getLength()F

    move-result v1

    mul-float v1, v1, p3

    invoke-virtual {v13}, Landroidx/compose/material/CheckDrawingCache;->getPathToDraw()Landroidx/compose/ui/graphics/Path;

    move-result-object v15

    move/from16 v17, v2

    .end local v2    # "checkCrossX":F
    .local v17, "checkCrossX":F
    const/4 v2, 0x1

    move/from16 v18, v3

    .end local v3    # "checkCrossY":F
    .local v18, "checkCrossY":F
    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v15, v2}, Landroidx/compose/ui/graphics/PathMeasure;->getSegment(FFLandroidx/compose/ui/graphics/Path;Z)Z

    .line 370
    .end local v13    # "$this$drawCheck_3IgeMak_u24lambda_u240":Landroidx/compose/material/CheckDrawingCache;
    .end local v14    # "$i$a$-with-CheckboxKt$drawCheck$1":I
    nop

    .line 380
    invoke-virtual/range {p6 .. p6}, Landroidx/compose/material/CheckDrawingCache;->getPathToDraw()Landroidx/compose/ui/graphics/Path;

    move-result-object v20

    move-object/from16 v24, v16

    check-cast v24, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    const/16 v27, 0x34

    const/16 v28, 0x0

    const/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v19, p0

    move-wide/from16 v21, p1

    invoke-static/range {v19 .. v28}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawPath-LG529CI$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;Landroidx/compose/ui/graphics/Path;JFLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 381
    return-void
.end method
