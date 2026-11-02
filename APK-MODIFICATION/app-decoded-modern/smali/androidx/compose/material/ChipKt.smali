.class public final Landroidx/compose/material/ChipKt;
.super Ljava/lang/Object;
.source "Chip.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nChip.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Chip.kt\nandroidx/compose/material/ChipKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 4 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 5 Row.kt\nandroidx/compose/foundation/layout/RowKt\n+ 6 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 7 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 8 Composer.kt\nandroidx/compose/runtime/Updater\n+ 9 Box.kt\nandroidx/compose/foundation/layout/BoxKt\n*L\n1#1,728:1\n1128#2,6:729\n1128#2,6:735\n85#3:741\n85#3:780\n113#4:742\n113#4:781\n113#4:782\n113#4:939\n113#4:940\n113#4:941\n113#4:942\n113#4:943\n99#5,6:743\n106#5:779\n99#5,6:783\n99#5,6:898\n106#5:934\n106#5:938\n79#6,6:749\n86#6,3:764\n89#6,2:773\n93#6:778\n79#6,6:789\n86#6,3:804\n89#6,2:813\n79#6,6:827\n86#6,3:842\n89#6,2:851\n79#6,6:863\n86#6,3:878\n89#6,2:887\n93#6:892\n93#6:896\n79#6,6:904\n86#6,3:919\n89#6,2:928\n93#6:933\n93#6:937\n347#7,9:755\n356#7,3:775\n347#7,9:795\n356#7:815\n347#7,9:833\n356#7:853\n347#7,9:869\n356#7,3:889\n357#7,2:894\n347#7,9:910\n356#7,3:930\n357#7,2:935\n4206#8,6:767\n4206#8,6:807\n4206#8,6:845\n4206#8,6:881\n4206#8,6:922\n70#9:816\n66#9,10:817\n70#9:854\n68#9,8:855\n77#9:893\n77#9:897\n*S KotlinDebug\n*F\n+ 1 Chip.kt\nandroidx/compose/material/ChipKt\n*L\n104#1:729,6\n201#1:735,6\n101#1:741\n128#1:780\n120#1:742\n217#1:781\n225#1:782\n707#1:939\n710#1:940\n713#1:941\n716#1:942\n727#1:943\n114#1:743,6\n114#1:779\n211#1:783,6\n269#1:898,6\n269#1:934\n211#1:938\n114#1:749,6\n114#1:764,3\n114#1:773,2\n114#1:778\n211#1:789,6\n211#1:804,3\n211#1:813,2\n233#1:827,6\n233#1:842,3\n233#1:851,2\n256#1:863,6\n256#1:878,3\n256#1:887,2\n256#1:892\n233#1:896\n269#1:904,6\n269#1:919,3\n269#1:928,2\n269#1:933\n211#1:937\n114#1:755,9\n114#1:775,3\n211#1:795,9\n211#1:815\n233#1:833,9\n233#1:853\n256#1:869,9\n256#1:889,3\n233#1:894,2\n269#1:910,9\n269#1:930,3\n211#1:935,2\n114#1:767,6\n211#1:807,6\n233#1:845,6\n256#1:881,6\n269#1:922,6\n233#1:816\n233#1:817,10\n256#1:854\n256#1:855,8\n256#1:893\n233#1:897\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0007\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u001a\u0090\u0001\u0010\u0000\u001a\u00020\u00012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\r2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f2\u0015\u0008\u0002\u0010\u0010\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0003\u00a2\u0006\u0002\u0008\u00112\u001c\u0010\u0012\u001a\u0018\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0011\u00a2\u0006\u0002\u0008\u0015H\u0007\u00a2\u0006\u0002\u0010\u0016\u001a\u00c6\u0001\u0010\u0017\u001a\u00020\u00012\u0006\u0010\u0018\u001a\u00020\u00072\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b2\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\r2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u00192\u0015\u0008\u0002\u0010\u0010\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0003\u00a2\u0006\u0002\u0008\u00112\u0015\u0008\u0002\u0010\u001a\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0003\u00a2\u0006\u0002\u0008\u00112\u0015\u0008\u0002\u0010\u001b\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0003\u00a2\u0006\u0002\u0008\u00112\u001c\u0010\u0012\u001a\u0018\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0011\u00a2\u0006\u0002\u0008\u0015H\u0007\u00a2\u0006\u0002\u0010\u001c\"\u0010\u0010\u001d\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001f\"\u0010\u0010 \u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001f\"\u0010\u0010!\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001f\"\u0010\u0010\"\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001f\"\u000e\u0010#\u001a\u00020$X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010%\u001a\u00020$X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0010\u0010&\u001a\u00020\u001eX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001f\u00a8\u0006\'\u00b2\u0006\n\u0010(\u001a\u00020)X\u008a\u0084\u0002\u00b2\u0006\n\u0010*\u001a\u00020)X\u008a\u0084\u0002"
    }
    d2 = {
        "Chip",
        "",
        "onClick",
        "Lkotlin/Function0;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "enabled",
        "",
        "interactionSource",
        "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
        "shape",
        "Landroidx/compose/ui/graphics/Shape;",
        "border",
        "Landroidx/compose/foundation/BorderStroke;",
        "colors",
        "Landroidx/compose/material/ChipColors;",
        "leadingIcon",
        "Landroidx/compose/runtime/Composable;",
        "content",
        "Lkotlin/Function1;",
        "Landroidx/compose/foundation/layout/RowScope;",
        "Lkotlin/ExtensionFunctionType;",
        "(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V",
        "FilterChip",
        "selected",
        "Landroidx/compose/material/SelectableChipColors;",
        "selectedIcon",
        "trailingIcon",
        "(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V",
        "HorizontalPadding",
        "Landroidx/compose/ui/unit/Dp;",
        "F",
        "LeadingIconStartSpacing",
        "LeadingIconEndSpacing",
        "TrailingIconSpacing",
        "SurfaceOverlayOpacity",
        "",
        "SelectedOverlayOpacity",
        "SelectedIconContainerSize",
        "material",
        "contentColor",
        "Landroidx/compose/ui/graphics/Color;",
        "leadingIconContentColor"
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
.field private static final HorizontalPadding:F

.field private static final LeadingIconEndSpacing:F

.field private static final LeadingIconStartSpacing:F

.field private static final SelectedIconContainerSize:F

.field private static final SelectedOverlayOpacity:F = 0.16f

.field private static final SurfaceOverlayOpacity:F = 0.12f

.field private static final TrailingIconSpacing:F


# direct methods
.method public static synthetic $r8$lambda$5H5gtSjSQk1tUUhsvabgzfLxUFs(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ChipKt;->FilterChip$lambda$1$0$0(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$D4wpLib1jxuWr6ESjGjK6nz-5k4(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p5}, Landroidx/compose/material/ChipKt;->Chip$lambda$2$0(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$JoMdg7WWik86TyYazWhkoFFOOA0(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p12}, Landroidx/compose/material/ChipKt;->Chip$lambda$3(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$KG29w8uJ-mCcuztBs47wFJGbWJE(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p16}, Landroidx/compose/material/ChipKt;->FilterChip$lambda$2(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$LsrZv-A55Jb3CGRNPTU75t2Gh6g(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ChipKt;->FilterChip$lambda$1$0(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$RRVgHhiScnZNpoH-X--dA05dNGI(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ChipKt;->FilterChip$lambda$0$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$kVGuFsn38d2C6NSDI9y0JPTCLyg(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/ChipKt;->Chip$lambda$2(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$llsRP0Hj9QvIORq6_-4kzOrcmZo(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p5}, Landroidx/compose/material/ChipKt;->Chip$lambda$2$0$0(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$po9-6MmGMc68FtOQBpXxxG4SGZA(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ChipKt;->FilterChip$lambda$1(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rCHIC3JoG2djAsI_iQ0zXM1fLN0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ChipKt;->Chip$lambda$1$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 707
    const/16 v0, 0xc

    .local v0, "$this$dp$iv":I
    const/4 v1, 0x0

    .line 939
    .local v1, "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 707
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ChipKt;->HorizontalPadding:F

    .line 710
    const/4 v0, 0x4

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 940
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 710
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ChipKt;->LeadingIconStartSpacing:F

    .line 713
    const/16 v0, 0x8

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 941
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 713
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ChipKt;->LeadingIconEndSpacing:F

    .line 716
    const/16 v0, 0x8

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 942
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 716
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ChipKt;->TrailingIconSpacing:F

    .line 727
    const/16 v0, 0x18

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 943
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 727
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ChipKt;->SelectedIconContainerSize:F

    return-void
.end method

.method public static final Chip(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V
    .locals 32
    .param p0, "onClick"    # Lkotlin/jvm/functions/Function0;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "enabled"    # Z
    .param p3, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p4, "shape"    # Landroidx/compose/ui/graphics/Shape;
    .param p5, "border"    # Landroidx/compose/foundation/BorderStroke;
    .param p6, "colors"    # Landroidx/compose/material/ChipColors;
    .param p7, "leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p8, "content"    # Lkotlin/jvm/functions/Function3;
    .param p9, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p10, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/ui/graphics/Shape;",
            "Landroidx/compose/foundation/BorderStroke;",
            "Landroidx/compose/material/ChipColors;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Landroidx/compose/foundation/layout/RowScope;",
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

    .line 100
    move/from16 v10, p10

    move/from16 v11, p11

    const v0, -0x4970bd92

    move-object/from16 v1, p9

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v1

    .end local p9    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    const-string v2, "C(Chip)N(onClick,modifier,enabled,interactionSource,shape,border,colors,leadingIcon,content)100@4561L21,103@4661L22,106@4758L24,110@4916L1391,101@4587L1720:Chip.kt#jmzs0o"

    invoke-static {v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v2, p10

    .local v2, "$dirty":I
    and-int/lit8 v3, v10, 0x6

    if-nez v3, :cond_1

    move-object/from16 v3, p0

    invoke-interface {v1, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v2, v4

    goto :goto_1

    :cond_1
    move-object/from16 v3, p0

    :goto_1
    and-int/lit8 v4, v11, 0x2

    if-eqz v4, :cond_2

    or-int/lit8 v2, v2, 0x30

    move-object/from16 v5, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v5, v10, 0x30

    if-nez v5, :cond_4

    move-object/from16 v5, p1

    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x20

    goto :goto_2

    :cond_3
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v2, v6

    goto :goto_3

    :cond_4
    move-object/from16 v5, p1

    :goto_3
    and-int/lit8 v6, v11, 0x4

    if-eqz v6, :cond_5

    or-int/lit16 v2, v2, 0x180

    move/from16 v7, p2

    goto :goto_5

    :cond_5
    and-int/lit16 v7, v10, 0x180

    if-nez v7, :cond_7

    move/from16 v7, p2

    invoke-interface {v1, v7}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x100

    goto :goto_4

    :cond_6
    const/16 v8, 0x80

    :goto_4
    or-int/2addr v2, v8

    goto :goto_5

    :cond_7
    move/from16 v7, p2

    :goto_5
    and-int/lit8 v8, v11, 0x8

    if-eqz v8, :cond_8

    or-int/lit16 v2, v2, 0xc00

    move-object/from16 v9, p3

    goto :goto_7

    :cond_8
    and-int/lit16 v9, v10, 0xc00

    if-nez v9, :cond_a

    move-object/from16 v9, p3

    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    const/16 v12, 0x800

    goto :goto_6

    :cond_9
    const/16 v12, 0x400

    :goto_6
    or-int/2addr v2, v12

    goto :goto_7

    :cond_a
    move-object/from16 v9, p3

    :goto_7
    and-int/lit16 v12, v10, 0x6000

    if-nez v12, :cond_d

    and-int/lit8 v12, v11, 0x10

    if-nez v12, :cond_b

    move-object/from16 v12, p4

    invoke-interface {v1, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    const/16 v13, 0x4000

    goto :goto_8

    :cond_b
    move-object/from16 v12, p4

    :cond_c
    const/16 v13, 0x2000

    :goto_8
    or-int/2addr v2, v13

    goto :goto_9

    :cond_d
    move-object/from16 v12, p4

    :goto_9
    and-int/lit8 v13, v11, 0x20

    const/high16 v14, 0x30000

    if-eqz v13, :cond_e

    or-int/2addr v2, v14

    move-object/from16 v14, p5

    goto :goto_b

    :cond_e
    and-int/2addr v14, v10

    if-nez v14, :cond_10

    move-object/from16 v14, p5

    invoke-interface {v1, v14}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f

    const/high16 v15, 0x20000

    goto :goto_a

    :cond_f
    const/high16 v15, 0x10000

    :goto_a
    or-int/2addr v2, v15

    goto :goto_b

    :cond_10
    move-object/from16 v14, p5

    :goto_b
    const/high16 v15, 0x180000

    and-int/2addr v15, v10

    if-nez v15, :cond_13

    and-int/lit8 v15, v11, 0x40

    if-nez v15, :cond_11

    move-object/from16 v15, p6

    invoke-interface {v1, v15}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_12

    const/high16 v16, 0x100000

    goto :goto_c

    :cond_11
    move-object/from16 v15, p6

    :cond_12
    const/high16 v16, 0x80000

    :goto_c
    or-int v2, v2, v16

    goto :goto_d

    :cond_13
    move-object/from16 v15, p6

    :goto_d
    and-int/lit16 v0, v11, 0x80

    const/high16 v16, 0xc00000

    if-eqz v0, :cond_14

    or-int v2, v2, v16

    move/from16 p9, v13

    move-object/from16 v13, p7

    goto :goto_f

    :cond_14
    and-int v16, v10, v16

    if-nez v16, :cond_16

    move/from16 p9, v13

    move-object/from16 v13, p7

    invoke-interface {v1, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_15

    const/high16 v16, 0x800000

    goto :goto_e

    :cond_15
    const/high16 v16, 0x400000

    :goto_e
    or-int v2, v2, v16

    goto :goto_f

    :cond_16
    move/from16 p9, v13

    move-object/from16 v13, p7

    :goto_f
    const/high16 v16, 0x6000000

    and-int v16, v10, v16

    if-nez v16, :cond_18

    move-object/from16 v13, p8

    invoke-interface {v1, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_17

    const/high16 v16, 0x4000000

    goto :goto_10

    :cond_17
    const/high16 v16, 0x2000000

    :goto_10
    or-int v2, v2, v16

    goto :goto_11

    :cond_18
    move-object/from16 v13, p8

    :goto_11
    const v16, 0x2492493

    move/from16 v29, v0

    and-int v0, v2, v16

    move/from16 v16, v2

    .end local v2    # "$dirty":I
    .local v16, "$dirty":I
    const v2, 0x2492492

    const/4 v13, 0x1

    if-eq v0, v2, :cond_19

    move v0, v13

    goto :goto_12

    :cond_19
    const/4 v0, 0x0

    :goto_12
    and-int/lit8 v2, v16, 0x1

    invoke-interface {v1, v0, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "94@4298L6,96@4415L12"

    invoke-static {v1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v10, 0x1

    const v2, -0x380001

    const v18, -0xe001

    if-eqz v0, :cond_1d

    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_1a

    goto :goto_13

    .line 90
    :cond_1a
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v11, 0x10

    if-eqz v0, :cond_1b

    and-int v0, v16, v18

    move/from16 v16, v0

    :cond_1b
    and-int/lit8 v0, v11, 0x40

    if-eqz v0, :cond_1c

    and-int v0, v16, v2

    move-object v2, v15

    move-object v15, v12

    move-object v12, v2

    move-object/from16 v2, p7

    move v4, v0

    move-object/from16 v22, v9

    move v8, v13

    move-object/from16 v20, v14

    move-object v13, v1

    move v14, v7

    const/4 v1, 0x0

    .end local v16    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_17

    .end local v0    # "$dirty":I
    .restart local v16    # "$dirty":I
    :cond_1c
    move-object v2, v15

    move-object v15, v12

    move-object v12, v2

    move-object/from16 v2, p7

    move-object/from16 v22, v9

    move v8, v13

    move-object/from16 v20, v14

    move/from16 v4, v16

    move-object v13, v1

    move v14, v7

    const/4 v1, 0x0

    goto/16 :goto_17

    .line 100
    :cond_1d
    :goto_13
    if-eqz v4, :cond_1e

    .line 92
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object v5, v0

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v5, "modifier":Landroidx/compose/ui/Modifier;
    :cond_1e
    if-eqz v6, :cond_1f

    .line 93
    const/4 v0, 0x1

    move v7, v0

    .end local p2    # "enabled":Z
    .local v7, "enabled":Z
    :cond_1f
    if-eqz v8, :cond_20

    .line 94
    const/4 v0, 0x0

    move-object v9, v0

    .end local p3    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v9, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_20
    and-int/lit8 v0, v11, 0x10

    if-eqz v0, :cond_21

    .line 95
    sget-object v0, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v4, 0x6

    invoke-virtual {v0, v1, v4}, Landroidx/compose/material/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Shapes;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material/Shapes;->getSmall()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v0

    const/16 v4, 0x32

    invoke-static {v4}, Landroidx/compose/foundation/shape/CornerSizeKt;->CornerSize(I)Landroidx/compose/foundation/shape/CornerSize;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroidx/compose/foundation/shape/CornerBasedShape;->copy(Landroidx/compose/foundation/shape/CornerSize;)Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/graphics/Shape;

    .end local p4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v0, "shape":Landroidx/compose/ui/graphics/Shape;
    and-int v4, v16, v18

    .end local v16    # "$dirty":I
    .local v4, "$dirty":I
    goto :goto_14

    .line 94
    .end local v0    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v4    # "$dirty":I
    .restart local v16    # "$dirty":I
    .restart local p4    # "shape":Landroidx/compose/ui/graphics/Shape;
    :cond_21
    move-object v0, v12

    move/from16 v4, v16

    .line 95
    .end local v16    # "$dirty":I
    .end local p4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local v0    # "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local v4    # "$dirty":I
    :goto_14
    if-eqz p9, :cond_22

    .line 96
    const/4 v6, 0x0

    .end local p5    # "border":Landroidx/compose/foundation/BorderStroke;
    .local v6, "border":Landroidx/compose/foundation/BorderStroke;
    goto :goto_15

    .line 95
    .end local v6    # "border":Landroidx/compose/foundation/BorderStroke;
    .restart local p5    # "border":Landroidx/compose/foundation/BorderStroke;
    :cond_22
    move-object v6, v14

    .line 96
    .end local p5    # "border":Landroidx/compose/foundation/BorderStroke;
    .restart local v6    # "border":Landroidx/compose/foundation/BorderStroke;
    :goto_15
    and-int/lit8 v8, v11, 0x40

    if-eqz v8, :cond_23

    .line 97
    sget-object v12, Landroidx/compose/material/ChipDefaults;->INSTANCE:Landroidx/compose/material/ChipDefaults;

    const/high16 v26, 0x180000

    const/16 v27, 0x3f

    move v8, v13

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const/16 v19, 0x0

    const-wide/16 v17, 0x0

    move/from16 v21, v19

    const-wide/16 v19, 0x0

    move/from16 v23, v21

    const-wide/16 v21, 0x0

    move/from16 v25, v23

    const-wide/16 v23, 0x0

    move/from16 v31, v25

    move-object/from16 v25, v1

    move/from16 v1, v31

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v25, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v12 .. v27}, Landroidx/compose/material/ChipDefaults;->chipColors-5tl4gsc(JJJJJJLandroidx/compose/runtime/Composer;II)Landroidx/compose/material/ChipColors;

    move-result-object v12

    move-object/from16 v13, v25

    .end local v25    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p6    # "colors":Landroidx/compose/material/ChipColors;
    .local v12, "colors":Landroidx/compose/material/ChipColors;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    and-int/2addr v4, v2

    goto :goto_16

    .line 96
    .end local v12    # "colors":Landroidx/compose/material/ChipColors;
    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p6    # "colors":Landroidx/compose/material/ChipColors;
    :cond_23
    move v8, v13

    move-object v13, v1

    const/4 v1, 0x0

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v13    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v12, p6

    .line 97
    .end local p6    # "colors":Landroidx/compose/material/ChipColors;
    .restart local v12    # "colors":Landroidx/compose/material/ChipColors;
    :goto_16
    if-eqz v29, :cond_24

    .line 98
    const/4 v2, 0x0

    move-object v15, v0

    move-object/from16 v20, v6

    move v14, v7

    move-object/from16 v22, v9

    .end local p7    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v2, "leadingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_17

    .line 97
    .end local v2    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :cond_24
    move-object/from16 v2, p7

    move-object v15, v0

    move-object/from16 v20, v6

    move v14, v7

    move-object/from16 v22, v9

    .line 90
    .end local v0    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v6    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local v7    # "enabled":Z
    .end local v9    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p7    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v2    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v14, "enabled":Z
    .local v15, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v20, "border":Landroidx/compose/foundation/BorderStroke;
    .local v22, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_17
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_25

    const/4 v0, -0x1

    const-string v6, "androidx.compose.material.Chip (Chip.kt:99)"

    const v7, -0x4970bd92

    invoke-static {v7, v4, v0, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 101
    :cond_25
    shr-int/lit8 v0, v4, 0x6

    and-int/lit8 v0, v0, 0xe

    shr-int/lit8 v6, v4, 0xf

    and-int/lit8 v6, v6, 0x70

    or-int/2addr v0, v6

    invoke-interface {v12, v14, v13, v0}, Landroidx/compose/material/ChipColors;->contentColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v0

    .line 103
    .local v0, "contentColor$delegate":Landroidx/compose/runtime/State;
    nop

    .line 104
    const v6, 0x4fc8a404

    const-string v7, "CC(remember):Chip.kt#9igjgp"

    invoke-static {v13, v6, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v6, 0x0

    .local v6, "invalid$iv":Z
    move-object v7, v13

    .local v7, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 729
    .local v9, "$i$f$cache":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 730
    .local v16, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v18, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v18 .. v18}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v1, v8, :cond_26

    .line 731
    const/4 v8, 0x0

    .local v8, "$i$a$-cache-ChipKt$Chip$1":I
    new-instance v18, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda7;

    invoke-direct/range {v18 .. v18}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda7;-><init>()V

    .end local v8    # "$i$a$-cache-ChipKt$Chip$1":I
    move-object/from16 v8, v18

    .line 732
    .local v8, "value$iv":Ljava/lang/Object;
    invoke-interface {v7, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 733
    move-object v1, v8

    .end local v8    # "value$iv":Ljava/lang/Object;
    goto :goto_18

    .line 734
    :cond_26
    nop

    .line 729
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_18
    nop

    .line 104
    .end local v6    # "invalid$iv":Z
    .end local v7    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache":I
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v5, v7, v1, v8, v6}, Landroidx/compose/ui/semantics/SemanticsModifierKt;->semantics$default(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 105
    nop

    .line 106
    nop

    .line 107
    shr-int/lit8 v6, v4, 0x6

    and-int/lit8 v6, v6, 0xe

    shr-int/lit8 v7, v4, 0xf

    and-int/lit8 v7, v7, 0x70

    or-int/2addr v6, v7

    invoke-interface {v12, v14, v13, v6}, Landroidx/compose/material/ChipColors;->backgroundColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v6

    invoke-interface {v6}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v6}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v16

    .line 108
    invoke-static {v0}, Landroidx/compose/material/ChipKt;->Chip$lambda$0(Landroidx/compose/runtime/State;)J

    move-result-wide v23

    const/16 v29, 0xe

    const/16 v30, 0x0

    const/high16 v25, 0x3f800000    # 1.0f

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-static/range {v23 .. v30}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v6

    .line 109
    nop

    .line 110
    nop

    .line 111
    new-instance v8, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda8;

    move-object/from16 p6, p8

    move-object/from16 p2, v0

    move-object/from16 p3, v2

    move-object/from16 p1, v8

    move-object/from16 p4, v12

    move/from16 p5, v14

    .end local v0    # "contentColor$delegate":Landroidx/compose/runtime/State;
    .end local v2    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v12    # "colors":Landroidx/compose/material/ChipColors;
    .end local v14    # "enabled":Z
    .local p2, "contentColor$delegate":Landroidx/compose/runtime/State;
    .local p3, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p4, "colors":Landroidx/compose/material/ChipColors;
    .local p5, "enabled":Z
    invoke-direct/range {p1 .. p6}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda8;-><init>(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;)V

    move-object/from16 v9, p1

    move-object/from16 v8, p3

    move-object/from16 v2, p4

    .end local p2    # "contentColor$delegate":Landroidx/compose/runtime/State;
    .end local p3    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p4    # "colors":Landroidx/compose/material/ChipColors;
    .end local p5    # "enabled":Z
    .restart local v0    # "contentColor$delegate":Landroidx/compose/runtime/State;
    .local v2, "colors":Landroidx/compose/material/ChipColors;
    .local v8, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v14    # "enabled":Z
    const/16 v12, 0x36

    .end local v0    # "contentColor$delegate":Landroidx/compose/runtime/State;
    .restart local p2    # "contentColor$delegate":Landroidx/compose/runtime/State;
    const v0, -0x6e387a4b

    move-object/from16 p1, v1

    const/4 v1, 0x1

    invoke-static {v0, v1, v9, v13, v12}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object/from16 v23, v0

    check-cast v23, Lkotlin/jvm/functions/Function2;

    and-int/lit8 v0, v4, 0xe

    const/high16 v1, 0x30000000

    or-int/2addr v0, v1

    and-int/lit16 v1, v4, 0x380

    or-int/2addr v0, v1

    shr-int/lit8 v1, v4, 0x3

    and-int/lit16 v1, v1, 0x1c00

    or-int/2addr v0, v1

    const/high16 v1, 0x380000

    shl-int/lit8 v9, v4, 0x3

    and-int/2addr v1, v9

    or-int/2addr v0, v1

    const/high16 v1, 0xe000000

    shl-int/lit8 v9, v4, 0xf

    and-int/2addr v1, v9

    or-int v25, v0, v1

    .line 102
    const/16 v21, 0x0

    const/16 v26, 0x80

    move-object v12, v3

    move-wide/from16 v18, v6

    move-object/from16 v24, v13

    move-object/from16 v13, p1

    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v12 .. v26}, Landroidx/compose/material/SurfaceKt;->Surface-LPr_se0(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;JJLandroidx/compose/foundation/BorderStroke;FLandroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 141
    .end local p2    # "contentColor$delegate":Landroidx/compose/runtime/State;
    :cond_27
    move-object v7, v2

    move/from16 v16, v4

    move-object v2, v5

    move v3, v14

    move-object v5, v15

    move-object/from16 v6, v20

    move-object/from16 v4, v22

    goto :goto_19

    .line 90
    .end local v2    # "colors":Landroidx/compose/material/ChipColors;
    .end local v4    # "$dirty":I
    .end local v5    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v14    # "enabled":Z
    .end local v15    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v20    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local v22    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "$dirty":I
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local p2, "enabled":Z
    .local p3, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local p4, "shape":Landroidx/compose/ui/graphics/Shape;
    .local p5, "border":Landroidx/compose/foundation/BorderStroke;
    .restart local p6    # "colors":Landroidx/compose/material/ChipColors;
    .restart local p7    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :cond_28
    move-object/from16 v24, v1

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object/from16 v8, p7

    move-object v2, v5

    move v3, v7

    move-object v4, v9

    move-object v5, v12

    move-object v6, v14

    move-object/from16 v7, p6

    .line 141
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "enabled":Z
    .end local p3    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p5    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local p6    # "colors":Landroidx/compose/material/ChipColors;
    .end local p7    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "enabled":Z
    .local v4, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v5, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v6, "border":Landroidx/compose/foundation/BorderStroke;
    .local v7, "colors":Landroidx/compose/material/ChipColors;
    .restart local v8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :goto_19
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v12

    if-eqz v12, :cond_29

    new-instance v0, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda9;

    move-object/from16 v1, p0

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v11}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda9;-><init>(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;II)V

    invoke-interface {v12, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_29
    return-void
.end method

.method private static final Chip$lambda$0(Landroidx/compose/runtime/State;)J
    .locals 4
    .param p0, "$contentColor$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/compose/ui/graphics/Color;",
            ">;)J"
        }
    .end annotation

    .line 101
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 741
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

    .line 101
    return-wide v0
.end method

.method private static final Chip$lambda$1$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 1
    .param p0, "$this$semantics"    # Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;

    .line 104
    sget-object v0, Landroidx/compose/ui/semantics/Role;->Companion:Landroidx/compose/ui/semantics/Role$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/semantics/Role$Companion;->getButton-o7Vup1c()I

    move-result v0

    invoke-static {p0, v0}, Landroidx/compose/ui/semantics/SemanticsPropertiesKt;->setRole-kuIjeqM(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final Chip$lambda$2(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 5
    .param p0, "$contentColor$delegate"    # Landroidx/compose/runtime/State;
    .param p1, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$colors"    # Landroidx/compose/material/ChipColors;
    .param p3, "$enabled"    # Z
    .param p4, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I

    const-string v0, "C111@4998L1303,111@4926L1375:Chip.kt#jmzs0o"

    invoke-static {p5, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p6, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p6, 0x1

    invoke-interface {p5, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.Chip.<anonymous> (Chip.kt:111)"

    const v3, -0x6e387a4b

    invoke-static {v3, p6, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 112
    :cond_1
    invoke-static {}, Landroidx/compose/material/ContentAlphaKt;->getLocalContentAlpha()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-static {p0}, Landroidx/compose/material/ChipKt;->Chip$lambda$0(Landroidx/compose/runtime/State;)J

    move-result-wide v3

    invoke-static {v3, v4}, Landroidx/compose/ui/graphics/Color;->getAlpha-impl(J)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v0

    new-instance v1, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1, p2, p3, p4}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda5;-><init>(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;)V

    const/16 v3, 0x36

    const v4, 0x6bc54a75    # 4.7702E26f

    invoke-static {v4, v2, v1, p5, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function2;

    sget v2, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v2, v2, 0x30

    invoke-static {v0, v1, p5, v2}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 111
    :cond_2
    invoke-interface {p5}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 140
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final Chip$lambda$2$0(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 5
    .param p0, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$colors"    # Landroidx/compose/material/ChipColors;
    .param p2, "$enabled"    # Z
    .param p3, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    const-string v0, "C112@5051L10,112@5069L1222,112@5012L1279:Chip.kt#jmzs0o"

    invoke-static {p4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p5, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p5, 0x1

    invoke-interface {p4, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.Chip.<anonymous>.<anonymous> (Chip.kt:112)"

    const v3, 0x6bc54a75    # 4.7702E26f

    invoke-static {v3, p5, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 113
    :cond_1
    sget-object v0, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v1, 0x6

    invoke-virtual {v0, p4, v1}, Landroidx/compose/material/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Typography;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material/Typography;->getBody2()Landroidx/compose/ui/text/TextStyle;

    move-result-object v0

    new-instance v1, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda4;-><init>(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;)V

    const/16 v3, 0x36

    const v4, 0x59d36b66

    invoke-static {v4, v2, v1, p4, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function2;

    const/16 v2, 0x30

    invoke-static {v0, v1, p4, v2}, Landroidx/compose/material/TextKt;->ProvideTextStyle(Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 112
    :cond_2
    invoke-interface {p4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 139
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final Chip$lambda$2$0$0(Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ChipColors;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 33
    .param p0, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$colors"    # Landroidx/compose/material/ChipColors;
    .param p2, "$enabled"    # Z
    .param p3, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p5

    const-string v3, "C113@5087L1190:Chip.kt#jmzs0o"

    invoke-static {v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v3, v2, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eq v3, v6, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    and-int/lit8 v7, v2, 0x1

    invoke-interface {v1, v3, v7}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, -0x1

    const-string v7, "androidx.compose.material.Chip.<anonymous>.<anonymous>.<anonymous> (Chip.kt:113)"

    const v8, 0x59d36b66

    invoke-static {v8, v2, v3, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 115
    :cond_1
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    sget-object v7, Landroidx/compose/material/ChipDefaults;->INSTANCE:Landroidx/compose/material/ChipDefaults;

    invoke-virtual {v7}, Landroidx/compose/material/ChipDefaults;->getMinHeight-D9Ej5fM()F

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v3, v9, v7, v4, v8}, Landroidx/compose/foundation/layout/SizeKt;->defaultMinSize-VpY3zN4$default(Landroidx/compose/ui/Modifier;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 118
    if-nez v0, :cond_2

    .line 119
    sget v3, Landroidx/compose/material/ChipKt;->HorizontalPadding:F

    move v11, v3

    goto :goto_1

    .line 120
    :cond_2
    const/4 v3, 0x0

    .local v3, "$this$dp$iv":I
    const/4 v7, 0x0

    .line 742
    .local v7, "$i$f$getDp":I
    int-to-float v8, v3

    invoke-static {v8}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v8

    move v11, v8

    .line 116
    .end local v3    # "$this$dp$iv":I
    .end local v7    # "$i$f$getDp":I
    :goto_1
    nop

    .line 121
    sget v13, Landroidx/compose/material/ChipKt;->HorizontalPadding:F

    .line 116
    const/16 v15, 0xa

    const/16 v16, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-static/range {v10 .. v16}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 123
    sget-object v7, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v7}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v7

    .line 124
    sget-object v8, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v8}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v8

    .line 114
    nop

    .local v3, "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v8, "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    move-object/from16 v9, p4

    .local v9, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/16 v10, 0x1b0

    .local v7, "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v10, "$changed$iv":I
    const/4 v11, 0x0

    .line 743
    .local v11, "$i$f$Row":I
    const v12, 0x2952b718

    const-string v13, "CC(Row)P(2,1,3)99@5124L58,100@5187L130:Row.kt#2w3rfo"

    invoke-static {v9, v12, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 744
    shr-int/lit8 v12, v10, 0x3

    and-int/lit8 v12, v12, 0xe

    shr-int/lit8 v13, v10, 0x3

    and-int/lit8 v13, v13, 0x70

    or-int/2addr v12, v13

    invoke-static {v7, v8, v9, v12}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v12

    .line 748
    .local v12, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v13, v10, 0x3

    and-int/lit8 v13, v13, 0x70

    .line 745
    nop

    .local v13, "$changed$iv$iv":I
    move-object v14, v3

    .local v14, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/4 v15, 0x0

    .line 749
    .local v15, "$i$f$Layout":I
    move/from16 v16, v4

    const v4, -0x4ee9b9da

    const-string v6, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v9, v4, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 750
    invoke-static {v9, v5}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v4

    .line 751
    .local v4, "compositeKeyHash$iv$iv":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v6

    .line 752
    .local v6, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v9, v14}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 754
    .local v5, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v18, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v18 .. v18}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v18

    shl-int/lit8 v1, v13, 0x6

    and-int/lit16 v1, v1, 0x380

    move/from16 v19, v1

    const/4 v1, 0x6

    or-int/lit8 v19, v19, 0x6

    .line 753
    move-object/from16 v20, v18

    .local v19, "$changed$iv$iv$iv":I
    .local v20, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v18, 0x0

    .line 755
    .local v18, "$i$f$ReusableComposeNode":I
    move/from16 v21, v1

    const v1, -0x2942ffcf

    const-string v2, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v9, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 756
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v1

    instance-of v1, v1, Landroidx/compose/runtime/Applier;

    if-nez v1, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 757
    :cond_3
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 758
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 759
    move-object/from16 v1, v20

    .end local v20    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v1, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v9, v1}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_2

    .line 761
    .end local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v20    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_4
    move-object/from16 v1, v20

    .end local v20    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 763
    :goto_2
    invoke-static {v9}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .local v2, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .line 764
    .local v20, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v22, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v23, v1

    .end local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v23, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v12, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 765
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v6, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 766
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    .local v1, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v22, 0x0

    .line 767
    .local v22, "$i$f$set-impl":I
    move-object/from16 v24, v2

    .local v24, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v25, 0x0

    .line 768
    .local v25, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v26

    if-nez v26, :cond_6

    move-object/from16 v26, v3

    .end local v3    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v26, "modifier$iv":Landroidx/compose/ui/Modifier;
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    move/from16 v27, v4

    .end local v4    # "compositeKeyHash$iv$iv":I
    .local v27, "compositeKeyHash$iv$iv":I
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_3

    :cond_5
    move-object/from16 v4, v24

    goto :goto_4

    .end local v26    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v27    # "compositeKeyHash$iv$iv":I
    .restart local v3    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .restart local v4    # "compositeKeyHash$iv$iv":I
    :cond_6
    move-object/from16 v26, v3

    move/from16 v27, v4

    .line 769
    .end local v3    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v4    # "compositeKeyHash$iv$iv":I
    .restart local v26    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .restart local v27    # "compositeKeyHash$iv$iv":I
    :goto_3
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v4, v24

    .end local v24    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v4, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 770
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 772
    :goto_4
    nop

    .line 767
    .end local v4    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v25    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 772
    nop

    .line 773
    .end local v1    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v22    # "$i$f$set-impl":I
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v5, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 774
    nop

    .line 763
    .end local v2    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 775
    shr-int/lit8 v1, v19, 0x6

    and-int/lit8 v1, v1, 0xe

    .local v1, "$changed$iv":I
    move-object v2, v9

    .local v2, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 746
    .local v3, "$i$a$-Layout-RowKt$Row$1$iv":I
    const v4, -0x184d8b46

    move/from16 v20, v1

    .end local v1    # "$changed$iv":I
    .local v20, "$changed$iv":I
    const-string v1, "C101@5232L9:Row.kt#2w3rfo"

    invoke-static {v2, v4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v1, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v4, v10, 0x6

    and-int/lit8 v4, v4, 0x70

    or-int/lit8 v4, v4, 0x6

    .local v4, "$changed":I
    check-cast v1, Landroidx/compose/foundation/layout/RowScope;

    .local v1, "$this$Chip_u24lambda_u242_u240_u240_u240":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v22, v2

    .local v22, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 126
    .local v24, "$i$a$-Row-ChipKt$Chip$2$1$1$1":I
    move-object/from16 v25, v2

    .end local v2    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v25, "$composer$iv":Landroidx/compose/runtime/Composer;
    const v2, 0x6eaeedd9

    move/from16 v28, v3

    .end local v3    # "$i$a$-Layout-RowKt$Row$1$iv":I
    .local v28, "$i$a$-Layout-RowKt$Row$1$iv":I
    const-string v3, "C135@6250L9:Chip.kt#jmzs0o"

    move/from16 v29, v4

    move-object/from16 v4, v22

    .end local v22    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    .local v29, "$changed":I
    invoke-static {v4, v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    if-eqz v0, :cond_7

    const v2, 0x6eaf480f

    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "126@5702L47,127@5812L32,128@5869L268,133@6162L45"

    invoke-static {v4, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 127
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    sget v3, Landroidx/compose/material/ChipKt;->LeadingIconStartSpacing:F

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    move/from16 v3, v21

    invoke-static {v2, v4, v3}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 128
    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v17, v5

    const/4 v5, 0x0

    .end local v5    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .local v17, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    invoke-interface {v2, v3, v4, v5}, Landroidx/compose/material/ChipColors;->leadingIconContentColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v22

    .line 130
    .local v22, "leadingIconContentColor$delegate":Landroidx/compose/runtime/State;
    move/from16 v30, v5

    const/4 v5, 0x2

    new-array v5, v5, [Landroidx/compose/runtime/ProvidedValue;

    invoke-static {}, Landroidx/compose/material/ContentColorKt;->getLocalContentColor()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v2

    invoke-static/range {v22 .. v22}, Landroidx/compose/material/ChipKt;->Chip$lambda$2$0$0$0$0(Landroidx/compose/runtime/State;)J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Landroidx/compose/ui/graphics/Color;->box-impl(J)Landroidx/compose/ui/graphics/Color;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v2

    aput-object v2, v5, v30

    .line 131
    invoke-static {}, Landroidx/compose/material/ContentAlphaKt;->getLocalContentAlpha()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v2

    invoke-static/range {v22 .. v22}, Landroidx/compose/material/ChipKt;->Chip$lambda$2$0$0$0$0(Landroidx/compose/runtime/State;)J

    move-result-wide v30

    invoke-static/range {v30 .. v31}, Landroidx/compose/ui/graphics/Color;->getAlpha-impl(J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v2

    aput-object v2, v5, v16

    .line 130
    nop

    .line 132
    sget v2, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    .line 129
    invoke-static {v5, v0, v4, v2}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider([Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 134
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    sget v3, Landroidx/compose/material/ChipKt;->LeadingIconEndSpacing:F

    invoke-static {v2, v3}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    const/4 v3, 0x6

    invoke-static {v2, v4, v3}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 126
    .end local v22    # "leadingIconContentColor$delegate":Landroidx/compose/runtime/State;
    goto :goto_5

    .end local v17    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .restart local v5    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    :cond_7
    move-object/from16 v17, v5

    .end local v5    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .restart local v17    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    const v2, 0x6e5916b8

    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_5
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 136
    and-int/lit8 v2, v29, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, p3

    invoke-interface {v3, v1, v4, v2}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 137
    nop

    .line 746
    .end local v1    # "$this$Chip_u24lambda_u242_u240_u240_u240":Landroidx/compose/foundation/layout/RowScope;
    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$a$-Row-ChipKt$Chip$2$1$1$1":I
    .end local v29    # "$changed":I
    invoke-static/range {v25 .. v25}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 775
    .end local v20    # "$changed$iv":I
    .end local v25    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v28    # "$i$a$-Layout-RowKt$Row$1$iv":I
    nop

    .line 776
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 755
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 777
    nop

    .line 749
    .end local v18    # "$i$f$ReusableComposeNode":I
    .end local v19    # "$changed$iv$iv$iv":I
    .end local v23    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 778
    nop

    .line 743
    .end local v6    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v13    # "$changed$iv$iv":I
    .end local v14    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v15    # "$i$f$Layout":I
    .end local v17    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v27    # "compositeKeyHash$iv$iv":I
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 779
    nop

    .end local v7    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v8    # "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .end local v9    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v10    # "$changed$iv":I
    .end local v11    # "$i$f$Row":I
    .end local v12    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v26    # "modifier$iv":Landroidx/compose/ui/Modifier;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_6

    .line 113
    :cond_8
    move-object/from16 v3, p3

    invoke-interface/range {p4 .. p4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 138
    :cond_9
    :goto_6
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final Chip$lambda$2$0$0$0$0(Landroidx/compose/runtime/State;)J
    .locals 4
    .param p0, "$leadingIconContentColor$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/compose/ui/graphics/Color;",
            ">;)J"
        }
    .end annotation

    .line 128
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 780
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

    .line 128
    return-wide v0
.end method

.method private static final Chip$lambda$3(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13

    or-int/lit8 v0, p9, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v11

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v12, p10

    move-object/from16 v10, p11

    invoke-static/range {v1 .. v12}, Landroidx/compose/material/ChipKt;->Chip(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/ChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final FilterChip(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V
    .locals 36
    .param p0, "selected"    # Z
    .param p1, "onClick"    # Lkotlin/jvm/functions/Function0;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "enabled"    # Z
    .param p4, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p5, "shape"    # Landroidx/compose/ui/graphics/Shape;
    .param p6, "border"    # Landroidx/compose/foundation/BorderStroke;
    .param p7, "colors"    # Landroidx/compose/material/SelectableChipColors;
    .param p8, "leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p9, "selectedIcon"    # Lkotlin/jvm/functions/Function2;
    .param p10, "trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p11, "content"    # Lkotlin/jvm/functions/Function3;
    .param p12, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p13, "$changed"    # I
    .param p14, "$changed1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/ui/graphics/Shape;",
            "Landroidx/compose/foundation/BorderStroke;",
            "Landroidx/compose/material/SelectableChipColors;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Landroidx/compose/foundation/layout/RowScope;",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "III)V"
        }
    .end annotation

    .line 195
    move/from16 v0, p0

    move-object/from16 v1, p7

    move/from16 v2, p13

    move/from16 v3, p15

    const v4, 0x4260b96

    move-object/from16 v5, p12

    invoke-interface {v5, v4}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .end local p12    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(FilterChip)N(selected,onClick,modifier,enabled,interactionSource,shape,border,colors,leadingIcon,selectedIcon,trailingIcon,content)196@9190L31,200@9329L24,203@9428L34,207@9602L3857,197@9226L4233:Chip.kt#jmzs0o"

    invoke-static {v13, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p13

    .local v5, "$dirty":I
    move/from16 v6, p14

    .local v6, "$dirty1":I
    and-int/lit8 v7, v2, 0x6

    if-nez v7, :cond_1

    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v7, 0x4

    goto :goto_0

    :cond_0
    const/4 v7, 0x2

    :goto_0
    or-int/2addr v5, v7

    :cond_1
    and-int/lit8 v7, v2, 0x30

    if-nez v7, :cond_3

    move-object/from16 v7, p1

    invoke-interface {v13, v7}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    const/16 v12, 0x20

    goto :goto_1

    :cond_2
    const/16 v12, 0x10

    :goto_1
    or-int/2addr v5, v12

    goto :goto_2

    :cond_3
    move-object/from16 v7, p1

    :goto_2
    and-int/lit8 v12, v3, 0x4

    if-eqz v12, :cond_4

    or-int/lit16 v5, v5, 0x180

    move-object/from16 v14, p2

    goto :goto_4

    :cond_4
    and-int/lit16 v14, v2, 0x180

    if-nez v14, :cond_6

    move-object/from16 v14, p2

    invoke-interface {v13, v14}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    const/16 v15, 0x100

    goto :goto_3

    :cond_5
    const/16 v15, 0x80

    :goto_3
    or-int/2addr v5, v15

    goto :goto_4

    :cond_6
    move-object/from16 v14, p2

    :goto_4
    and-int/lit8 v15, v3, 0x8

    if-eqz v15, :cond_7

    or-int/lit16 v5, v5, 0xc00

    move/from16 v8, p3

    goto :goto_6

    :cond_7
    and-int/lit16 v8, v2, 0xc00

    if-nez v8, :cond_9

    move/from16 v8, p3

    invoke-interface {v13, v8}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v16

    if-eqz v16, :cond_8

    const/16 v16, 0x800

    goto :goto_5

    :cond_8
    const/16 v16, 0x400

    :goto_5
    or-int v5, v5, v16

    goto :goto_6

    :cond_9
    move/from16 v8, p3

    :goto_6
    and-int/lit8 v16, v3, 0x10

    if-eqz v16, :cond_a

    or-int/lit16 v5, v5, 0x6000

    move-object/from16 v9, p4

    goto :goto_8

    :cond_a
    and-int/lit16 v9, v2, 0x6000

    if-nez v9, :cond_c

    move-object/from16 v9, p4

    invoke-interface {v13, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    const/16 v18, 0x4000

    goto :goto_7

    :cond_b
    const/16 v18, 0x2000

    :goto_7
    or-int v5, v5, v18

    goto :goto_8

    :cond_c
    move-object/from16 v9, p4

    :goto_8
    const/high16 v18, 0x30000

    and-int v18, v2, v18

    if-nez v18, :cond_f

    and-int/lit8 v18, v3, 0x20

    if-nez v18, :cond_d

    move-object/from16 v10, p5

    invoke-interface {v13, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_e

    const/high16 v19, 0x20000

    goto :goto_9

    :cond_d
    move-object/from16 v10, p5

    :cond_e
    const/high16 v19, 0x10000

    :goto_9
    or-int v5, v5, v19

    goto :goto_a

    :cond_f
    move-object/from16 v10, p5

    :goto_a
    and-int/lit8 v19, v3, 0x40

    const/high16 v20, 0x180000

    if-eqz v19, :cond_10

    or-int v5, v5, v20

    move-object/from16 v11, p6

    goto :goto_c

    :cond_10
    and-int v20, v2, v20

    if-nez v20, :cond_12

    move-object/from16 v11, p6

    invoke-interface {v13, v11}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_11

    const/high16 v21, 0x100000

    goto :goto_b

    :cond_11
    const/high16 v21, 0x80000

    :goto_b
    or-int v5, v5, v21

    goto :goto_c

    :cond_12
    move-object/from16 v11, p6

    :goto_c
    const/high16 v21, 0xc00000

    and-int v21, v2, v21

    if-nez v21, :cond_15

    and-int/lit16 v4, v3, 0x80

    if-nez v4, :cond_14

    const/high16 v4, 0x1000000

    and-int/2addr v4, v2

    if-nez v4, :cond_13

    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    goto :goto_d

    :cond_13
    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    :goto_d
    if-eqz v4, :cond_14

    const/high16 v4, 0x800000

    goto :goto_e

    :cond_14
    const/high16 v4, 0x400000

    :goto_e
    or-int/2addr v5, v4

    :cond_15
    and-int/lit16 v4, v3, 0x100

    const/high16 v21, 0x6000000

    if-eqz v4, :cond_16

    or-int v5, v5, v21

    move/from16 v21, v6

    move-object/from16 v6, p8

    goto :goto_10

    :cond_16
    and-int v21, v2, v21

    if-nez v21, :cond_18

    move/from16 v21, v6

    move-object/from16 v6, p8

    .end local v6    # "$dirty1":I
    .local v21, "$dirty1":I
    invoke-interface {v13, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_17

    const/high16 v22, 0x4000000

    goto :goto_f

    :cond_17
    const/high16 v22, 0x2000000

    :goto_f
    or-int v5, v5, v22

    goto :goto_10

    .end local v21    # "$dirty1":I
    .restart local v6    # "$dirty1":I
    :cond_18
    move/from16 v21, v6

    move-object/from16 v6, p8

    .end local v6    # "$dirty1":I
    .restart local v21    # "$dirty1":I
    :goto_10
    and-int/lit16 v6, v3, 0x200

    const/high16 v22, 0x30000000

    if-eqz v6, :cond_19

    or-int v5, v5, v22

    move/from16 v22, v6

    move-object/from16 v6, p9

    goto :goto_12

    :cond_19
    and-int v22, v2, v22

    if-nez v22, :cond_1b

    move/from16 v22, v6

    move-object/from16 v6, p9

    invoke-interface {v13, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1a

    const/high16 v23, 0x20000000

    goto :goto_11

    :cond_1a
    const/high16 v23, 0x10000000

    :goto_11
    or-int v5, v5, v23

    goto :goto_12

    :cond_1b
    move/from16 v22, v6

    move-object/from16 v6, p9

    :goto_12
    and-int/lit16 v6, v3, 0x400

    if-eqz v6, :cond_1c

    or-int/lit8 v17, v21, 0x6

    move/from16 v23, v6

    move-object/from16 v6, p10

    .end local v21    # "$dirty1":I
    .local v17, "$dirty1":I
    :goto_13
    goto :goto_15

    .end local v17    # "$dirty1":I
    .restart local v21    # "$dirty1":I
    :cond_1c
    and-int/lit8 v23, p14, 0x6

    if-nez v23, :cond_1e

    move/from16 v23, v6

    move-object/from16 v6, p10

    invoke-interface {v13, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1d

    const/16 v17, 0x4

    goto :goto_14

    :cond_1d
    const/16 v17, 0x2

    :goto_14
    or-int v17, v21, v17

    goto :goto_13

    :cond_1e
    move/from16 v23, v6

    move-object/from16 v6, p10

    move/from16 v17, v21

    .end local v21    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    :goto_15
    and-int/lit8 v21, p14, 0x30

    if-nez v21, :cond_20

    move-object/from16 v6, p11

    invoke-interface {v13, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1f

    const/16 v18, 0x20

    goto :goto_16

    :cond_1f
    const/16 v18, 0x10

    :goto_16
    or-int v17, v17, v18

    goto :goto_17

    :cond_20
    move-object/from16 v6, p11

    :goto_17
    move/from16 v6, v17

    .end local v17    # "$dirty1":I
    .restart local v6    # "$dirty1":I
    const v17, 0x12492493

    and-int v1, v5, v17

    const v2, 0x12492492

    move/from16 p12, v6

    .end local v6    # "$dirty1":I
    .local p12, "$dirty1":I
    const/4 v6, 0x1

    if-ne v1, v2, :cond_22

    and-int/lit8 v1, p12, 0x13

    const/16 v2, 0x12

    if-eq v1, v2, :cond_21

    goto :goto_18

    :cond_21
    const/4 v1, 0x0

    goto :goto_19

    :cond_22
    :goto_18
    move v1, v6

    :goto_19
    and-int/lit8 v2, v5, 0x1

    invoke-interface {v13, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v1, "187@8731L6,189@8858L18"

    invoke-static {v13, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v1, p13, 0x1

    if-eqz v1, :cond_26

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v1

    if-eqz v1, :cond_23

    goto :goto_1a

    .line 182
    :cond_23
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v1, v3, 0x20

    if-eqz v1, :cond_24

    const v1, -0x70001

    and-int/2addr v5, v1

    :cond_24
    and-int/lit16 v1, v3, 0x80

    if-eqz v1, :cond_25

    const v1, -0x1c00001

    and-int/2addr v1, v5

    move-object v2, v11

    move-object v11, v9

    move-object v9, v2

    move-object/from16 v5, p7

    move-object/from16 v7, p9

    move-object/from16 v12, p10

    move v3, v6

    move-object v4, v14

    const/4 v2, 0x0

    move-object/from16 v6, p8

    move v14, v1

    move/from16 v1, p12

    .end local v5    # "$dirty":I
    .local v1, "$dirty":I
    goto/16 :goto_23

    .end local v1    # "$dirty":I
    .restart local v5    # "$dirty":I
    :cond_25
    move-object v1, v11

    move-object v11, v9

    move-object v9, v1

    move-object/from16 v7, p9

    move-object/from16 v12, p10

    move/from16 v1, p12

    move v3, v6

    move-object v4, v14

    const/4 v2, 0x0

    move-object/from16 v6, p8

    move v14, v5

    move-object/from16 v5, p7

    goto/16 :goto_23

    .line 195
    :cond_26
    :goto_1a
    if-eqz v12, :cond_27

    .line 185
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_1b

    .line 195
    .end local v1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_27
    move-object v1, v14

    .line 185
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v1    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_1b
    if-eqz v15, :cond_28

    .line 186
    const/4 v2, 0x1

    .end local p3    # "enabled":Z
    .local v2, "enabled":Z
    goto :goto_1c

    .line 185
    .end local v2    # "enabled":Z
    .restart local p3    # "enabled":Z
    :cond_28
    move v2, v8

    .line 186
    .end local p3    # "enabled":Z
    .restart local v2    # "enabled":Z
    :goto_1c
    if-eqz v16, :cond_29

    .line 187
    const/4 v8, 0x0

    move-object/from16 v27, v8

    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v8, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_1d

    .line 186
    .end local v8    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_29
    move-object/from16 v27, v9

    .line 187
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v27, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_1d
    and-int/lit8 v8, v3, 0x20

    if-eqz v8, :cond_2a

    .line 188
    sget-object v8, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v9, 0x6

    invoke-virtual {v8, v13, v9}, Landroidx/compose/material/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Shapes;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/compose/material/Shapes;->getSmall()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v8

    const/16 v9, 0x32

    invoke-static {v9}, Landroidx/compose/foundation/shape/CornerSizeKt;->CornerSize(I)Landroidx/compose/foundation/shape/CornerSize;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroidx/compose/foundation/shape/CornerBasedShape;->copy(Landroidx/compose/foundation/shape/CornerSize;)Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v8

    check-cast v8, Landroidx/compose/ui/graphics/Shape;

    .end local p5    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v8, "shape":Landroidx/compose/ui/graphics/Shape;
    const v9, -0x70001

    and-int/2addr v5, v9

    move-object/from16 v28, v8

    move/from16 v29, v5

    goto :goto_1e

    .line 187
    .end local v8    # "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local p5    # "shape":Landroidx/compose/ui/graphics/Shape;
    :cond_2a
    move-object/from16 v28, v10

    move/from16 v29, v5

    .line 188
    .end local v5    # "$dirty":I
    .end local p5    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v28, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v29, "$dirty":I
    :goto_1e
    if-eqz v19, :cond_2b

    .line 189
    const/4 v5, 0x0

    move-object/from16 v30, v5

    .end local p6    # "border":Landroidx/compose/foundation/BorderStroke;
    .local v5, "border":Landroidx/compose/foundation/BorderStroke;
    goto :goto_1f

    .line 188
    .end local v5    # "border":Landroidx/compose/foundation/BorderStroke;
    .restart local p6    # "border":Landroidx/compose/foundation/BorderStroke;
    :cond_2b
    move-object/from16 v30, v11

    .line 189
    .end local p6    # "border":Landroidx/compose/foundation/BorderStroke;
    .local v30, "border":Landroidx/compose/foundation/BorderStroke;
    :goto_1f
    and-int/lit16 v5, v3, 0x80

    if-eqz v5, :cond_2c

    .line 190
    sget-object v5, Landroidx/compose/material/ChipDefaults;->INSTANCE:Landroidx/compose/material/ChipDefaults;

    const/high16 v25, 0x30000000

    const/16 v26, 0x1ff

    move v8, v6

    const-wide/16 v6, 0x0

    move v10, v8

    const-wide/16 v8, 0x0

    move v12, v10

    const-wide/16 v10, 0x0

    move v14, v12

    move-object/from16 v24, v13

    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "$composer":Landroidx/compose/runtime/Composer;
    const-wide/16 v12, 0x0

    move/from16 v16, v14

    const-wide/16 v14, 0x0

    move/from16 v19, v16

    const/16 v18, 0x0

    const-wide/16 v16, 0x0

    move/from16 v20, v18

    move/from16 v21, v19

    const-wide/16 v18, 0x0

    move/from16 v31, v20

    move/from16 v32, v21

    const-wide/16 v20, 0x0

    move/from16 v33, v22

    move/from16 v34, v23

    const-wide/16 v22, 0x0

    move-object/from16 p2, v1

    move/from16 p3, v2

    move/from16 v2, v31

    move/from16 v3, v32

    move/from16 v1, p12

    .end local v2    # "enabled":Z
    .end local p12    # "$dirty1":I
    .local v1, "$dirty1":I
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "enabled":Z
    invoke-virtual/range {v5 .. v26}, Landroidx/compose/material/ChipDefaults;->filterChipColors-J08w3-E(JJJJJJJJJLandroidx/compose/runtime/Composer;II)Landroidx/compose/material/SelectableChipColors;

    move-result-object v5

    move-object/from16 v13, v24

    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p7    # "colors":Landroidx/compose/material/SelectableChipColors;
    .local v5, "colors":Landroidx/compose/material/SelectableChipColors;
    .restart local v13    # "$composer":Landroidx/compose/runtime/Composer;
    const v6, -0x1c00001

    and-int v29, v29, v6

    goto :goto_20

    .line 189
    .end local v5    # "colors":Landroidx/compose/material/SelectableChipColors;
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "enabled":Z
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "enabled":Z
    .restart local p7    # "colors":Landroidx/compose/material/SelectableChipColors;
    .restart local p12    # "$dirty1":I
    :cond_2c
    move-object/from16 p2, v1

    move/from16 p3, v2

    move v3, v6

    move/from16 v33, v22

    move/from16 v34, v23

    const/4 v2, 0x0

    move/from16 v1, p12

    .end local v2    # "enabled":Z
    .end local p12    # "$dirty1":I
    .local v1, "$dirty1":I
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "enabled":Z
    move-object/from16 v5, p7

    .line 190
    .end local p7    # "colors":Landroidx/compose/material/SelectableChipColors;
    .restart local v5    # "colors":Landroidx/compose/material/SelectableChipColors;
    :goto_20
    if-eqz v4, :cond_2d

    .line 191
    const/4 v4, 0x0

    .end local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "leadingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_21

    .line 190
    .end local v4    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :cond_2d
    move-object/from16 v4, p8

    .line 191
    .end local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v4    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :goto_21
    if-eqz v33, :cond_2e

    .line 192
    const/4 v6, 0x0

    .end local p9    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local v6, "selectedIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_22

    .line 191
    .end local v6    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .restart local p9    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    :cond_2e
    move-object/from16 v6, p9

    .line 192
    .end local p9    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .restart local v6    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    :goto_22
    if-eqz v34, :cond_2f

    .line 193
    const/4 v7, 0x0

    move/from16 v8, p3

    move-object v12, v7

    move-object/from16 v11, v27

    move-object/from16 v10, v28

    move/from16 v14, v29

    move-object/from16 v9, v30

    move-object v7, v6

    move-object v6, v4

    move-object/from16 v4, p2

    .end local p10    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v7, "trailingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_23

    .line 192
    .end local v7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p10    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    :cond_2f
    move/from16 v8, p3

    move-object/from16 v12, p10

    move-object v7, v6

    move-object/from16 v11, v27

    move-object/from16 v10, v28

    move/from16 v14, v29

    move-object/from16 v9, v30

    move-object v6, v4

    move-object/from16 v4, p2

    .line 182
    .end local v27    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v28    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v29    # "$dirty":I
    .end local v30    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "enabled":Z
    .end local p10    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "modifier":Landroidx/compose/ui/Modifier;
    .local v6, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v7, "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local v8, "enabled":Z
    .local v9, "border":Landroidx/compose/foundation/BorderStroke;
    .local v10, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v11, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v12, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v14, "$dirty":I
    :goto_23
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v15

    if-eqz v15, :cond_30

    const-string v15, "androidx.compose.material.FilterChip (Chip.kt:194)"

    const v2, 0x4260b96

    invoke-static {v2, v14, v1, v15}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 197
    :cond_30
    shr-int/lit8 v2, v14, 0x9

    and-int/lit8 v2, v2, 0xe

    shl-int/lit8 v15, v14, 0x3

    and-int/lit8 v15, v15, 0x70

    or-int/2addr v2, v15

    shr-int/lit8 v15, v14, 0xf

    and-int/lit16 v15, v15, 0x380

    or-int/2addr v2, v15

    invoke-interface {v5, v8, v0, v13, v2}, Landroidx/compose/material/SelectableChipColors;->contentColor(ZZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v2

    .line 201
    .local v2, "contentColor":Landroidx/compose/runtime/State;
    const v15, -0x6d2e1bd2

    const-string v3, "CC(remember):Chip.kt#9igjgp"

    invoke-static {v13, v15, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v3, 0x0

    .local v3, "invalid$iv":Z
    move-object v15, v13

    .local v15, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 735
    .local v18, "$i$f$cache":I
    move/from16 p12, v1

    .end local v1    # "$dirty1":I
    .restart local p12    # "$dirty1":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv":Ljava/lang/Object;
    const/16 v19, 0x0

    .line 736
    .local v19, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v20, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p3, v2

    .end local v2    # "contentColor":Landroidx/compose/runtime/State;
    .local p3, "contentColor":Landroidx/compose/runtime/State;
    invoke-virtual/range {v20 .. v20}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_31

    .line 737
    const/4 v2, 0x0

    .local v2, "$i$a$-cache-ChipKt$FilterChip$1":I
    new-instance v20, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda0;

    invoke-direct/range {v20 .. v20}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda0;-><init>()V

    .end local v2    # "$i$a$-cache-ChipKt$FilterChip$1":I
    move-object/from16 v2, v20

    .line 738
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v15, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 739
    move-object v1, v2

    .end local v2    # "value$iv":Ljava/lang/Object;
    goto :goto_24

    .line 740
    :cond_31
    nop

    .line 735
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v19    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_24
    nop

    .line 201
    .end local v3    # "invalid$iv":Z
    .end local v15    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$f$cache":I
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v15, 0x1

    invoke-static {v4, v3, v1, v15, v2}, Landroidx/compose/ui/semantics/SemanticsModifierKt;->semantics$default(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 204
    shr-int/lit8 v1, v14, 0x9

    and-int/lit8 v1, v1, 0xe

    shl-int/lit8 v3, v14, 0x3

    and-int/lit8 v3, v3, 0x70

    or-int/2addr v1, v3

    shr-int/lit8 v3, v14, 0xf

    and-int/lit16 v3, v3, 0x380

    or-int/2addr v1, v3

    invoke-interface {v5, v8, v0, v13, v1}, Landroidx/compose/material/SelectableChipColors;->backgroundColor(ZZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v1

    invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v1}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v17

    .line 205
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v1}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v19

    const/16 v25, 0xe

    const/16 v26, 0x0

    const/high16 v21, 0x3f800000    # 1.0f

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-static/range {v19 .. v26}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v19

    .line 199
    nop

    .line 200
    nop

    .line 201
    nop

    .line 202
    nop

    .line 203
    nop

    .line 204
    nop

    .line 205
    nop

    .line 207
    nop

    .line 206
    nop

    .line 208
    new-instance v1, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda1;

    move-object/from16 p8, p11

    move/from16 p5, v0

    move-object/from16 p2, v1

    move-object/from16 p9, v5

    move-object/from16 p4, v6

    move-object/from16 p6, v7

    move/from16 p10, v8

    move-object/from16 p7, v12

    .end local v5    # "colors":Landroidx/compose/material/SelectableChipColors;
    .end local v6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v7    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .end local v8    # "enabled":Z
    .end local v12    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p4, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p6, "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local p7, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p9, "colors":Landroidx/compose/material/SelectableChipColors;
    .local p10, "enabled":Z
    invoke-direct/range {p2 .. p10}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;Z)V

    move-object/from16 v0, p2

    move-object/from16 v21, p3

    move-object/from16 v23, p4

    move-object/from16 v24, p6

    move-object/from16 v25, p7

    move-object/from16 v22, p9

    move/from16 v3, p10

    .end local p3    # "contentColor":Landroidx/compose/runtime/State;
    .end local p4    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p6    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local p9    # "colors":Landroidx/compose/material/SelectableChipColors;
    .end local p10    # "enabled":Z
    .local v3, "enabled":Z
    .local v21, "contentColor":Landroidx/compose/runtime/State;
    .local v22, "colors":Landroidx/compose/material/SelectableChipColors;
    .local v23, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v24, "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local v25, "trailingIcon":Lkotlin/jvm/functions/Function2;
    const/16 v1, 0x36

    const v5, -0x39c28d5

    const/4 v8, 0x1

    invoke-static {v5, v8, v0, v13, v1}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lkotlin/jvm/functions/Function2;

    and-int/lit8 v0, v14, 0xe

    and-int/lit8 v1, v14, 0x70

    or-int/2addr v0, v1

    and-int/lit16 v1, v14, 0x1c00

    or-int/2addr v0, v1

    shr-int/lit8 v1, v14, 0x3

    const v5, 0xe000

    and-int/2addr v1, v5

    or-int/2addr v0, v1

    const/high16 v1, 0x1c00000

    shl-int/lit8 v5, v14, 0x3

    and-int/2addr v1, v5

    or-int/2addr v0, v1

    const/high16 v1, 0x70000000

    shl-int/lit8 v5, v14, 0xf

    and-int/2addr v1, v5

    or-int/2addr v0, v1

    .line 198
    move-object v1, v4

    move-object v4, v10

    .end local v10    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "shape":Landroidx/compose/ui/graphics/Shape;
    const/4 v10, 0x0

    const/4 v15, 0x6

    const/16 v16, 0x100

    move/from16 v29, v14

    move-wide/from16 v5, v17

    move-wide/from16 v7, v19

    move/from16 v17, p12

    move v14, v0

    move-object/from16 v18, v1

    move/from16 v0, p0

    move-object/from16 v1, p1

    .end local v1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v14    # "$dirty":I
    .end local p12    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    .local v18, "modifier":Landroidx/compose/ui/Modifier;
    .restart local v29    # "$dirty":I
    invoke-static/range {v0 .. v16}, Landroidx/compose/material/SurfaceKt;->Surface-Ny5ogXk(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;JJLandroidx/compose/foundation/BorderStroke;FLandroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;III)V

    move-object/from16 v16, v13

    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 284
    .end local v21    # "contentColor":Landroidx/compose/runtime/State;
    :cond_32
    move-object v6, v4

    move-object v7, v9

    move-object v5, v11

    move-object/from16 v8, v22

    move-object/from16 v9, v23

    move-object/from16 v10, v24

    move-object/from16 v11, v25

    move v4, v3

    move-object/from16 v3, v18

    goto :goto_25

    .line 182
    .end local v3    # "enabled":Z
    .end local v4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v9    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local v11    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v17    # "$dirty1":I
    .end local v18    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v22    # "colors":Landroidx/compose/material/SelectableChipColors;
    .end local v23    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v24    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .end local v25    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local v29    # "$dirty":I
    .local v5, "$dirty":I
    .restart local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local p3, "enabled":Z
    .local p4, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p5    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local p6, "border":Landroidx/compose/foundation/BorderStroke;
    .local p7, "colors":Landroidx/compose/material/SelectableChipColors;
    .restart local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p9, "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local p10, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p12    # "$dirty1":I
    :cond_33
    move/from16 v17, p12

    move-object/from16 v16, v13

    .end local v13    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p12    # "$dirty1":I
    .restart local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$dirty1":I
    invoke-interface/range {v16 .. v16}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v29, v5

    move v4, v8

    move-object v5, v9

    move-object v6, v10

    move-object v7, v11

    move-object v3, v14

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    .line 284
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "enabled":Z
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p6    # "border":Landroidx/compose/foundation/BorderStroke;
    .end local p7    # "colors":Landroidx/compose/material/SelectableChipColors;
    .end local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p9    # "selectedIcon":Lkotlin/jvm/functions/Function2;
    .end local p10    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "enabled":Z
    .local v5, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v6, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v7, "border":Landroidx/compose/foundation/BorderStroke;
    .local v8, "colors":Landroidx/compose/material/SelectableChipColors;
    .local v9, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v10, "selectedIcon":Lkotlin/jvm/functions/Function2;
    .local v11, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v29    # "$dirty":I
    :goto_25
    invoke-interface/range {v16 .. v16}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-eqz v0, :cond_34

    move-object v1, v0

    new-instance v0, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda2;

    move-object/from16 v2, p1

    move-object/from16 v12, p11

    move/from16 v13, p13

    move/from16 v14, p14

    move/from16 v15, p15

    move-object/from16 v35, v1

    move/from16 v1, p0

    invoke-direct/range {v0 .. v15}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda2;-><init>(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;III)V

    move-object/from16 v1, v35

    invoke-interface {v1, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_34
    return-void
.end method

.method private static final FilterChip$lambda$0$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 1
    .param p0, "$this$semantics"    # Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;

    .line 201
    sget-object v0, Landroidx/compose/ui/semantics/Role;->Companion:Landroidx/compose/ui/semantics/Role$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/semantics/Role$Companion;->getCheckbox-o7Vup1c()I

    move-result v0

    invoke-static {p0, v0}, Landroidx/compose/ui/semantics/SemanticsPropertiesKt;->setRole-kuIjeqM(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final FilterChip$lambda$1(Landroidx/compose/runtime/State;Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 14
    .param p0, "$contentColor"    # Landroidx/compose/runtime/State;
    .param p1, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$selected"    # Z
    .param p3, "$selectedIcon"    # Lkotlin/jvm/functions/Function2;
    .param p4, "$trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p5, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p6, "$colors"    # Landroidx/compose/material/SelectableChipColors;
    .param p7, "$enabled"    # Z
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I

    move-object/from16 v0, p8

    move/from16 v1, p9

    const-string v2, "C208@9690L3763,208@9612L3841:Chip.kt#jmzs0o"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v2, v3, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v0, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.FilterChip.<anonymous> (Chip.kt:208)"

    const v5, -0x39c28d5

    invoke-static {v5, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 209
    :cond_1
    invoke-static {}, Landroidx/compose/material/ContentAlphaKt;->getLocalContentAlpha()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v2

    invoke-interface {p0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v5

    invoke-static {v5, v6}, Landroidx/compose/ui/graphics/Color;->getAlpha-impl(J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v2

    new-instance v5, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda3;

    move-object v13, p0

    move-object v6, p1

    move/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move/from16 v12, p7

    invoke-direct/range {v5 .. v13}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda3;-><init>(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;)V

    const/16 v3, 0x36

    const v6, -0x2e1b5595

    invoke-static {v6, v4, v5, v0, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    check-cast v3, Lkotlin/jvm/functions/Function2;

    sget v4, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v4, v4, 0x30

    invoke-static {v2, v3, v0, v4}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 208
    :cond_2
    invoke-interface {v0}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 283
    :cond_3
    :goto_1
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2
.end method

.method private static final FilterChip$lambda$1$0(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 14
    .param p0, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$selected"    # Z
    .param p2, "$selectedIcon"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p4, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p5, "$colors"    # Landroidx/compose/material/SelectableChipColors;
    .param p6, "$enabled"    # Z
    .param p7, "$contentColor"    # Landroidx/compose/runtime/State;
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I

    move-object/from16 v0, p8

    move/from16 v1, p9

    const-string v2, "C209@9743L10,209@9761L3682,209@9704L3739:Chip.kt#jmzs0o"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v2, v3, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v0, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.FilterChip.<anonymous>.<anonymous> (Chip.kt:209)"

    const v5, -0x2e1b5595

    invoke-static {v5, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 210
    :cond_1
    sget-object v2, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v3, 0x6

    invoke-virtual {v2, v0, v3}, Landroidx/compose/material/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material/Typography;->getBody2()Landroidx/compose/ui/text/TextStyle;

    move-result-object v2

    new-instance v5, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda6;

    move-object v6, p0

    move v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move/from16 v12, p6

    move-object/from16 v13, p7

    invoke-direct/range {v5 .. v13}, Landroidx/compose/material/ChipKt$$ExternalSyntheticLambda6;-><init>(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;)V

    const/16 v3, 0x36

    const v6, -0x2a65066

    invoke-static {v6, v4, v5, v0, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/16 v4, 0x30

    invoke-static {v2, v3, v0, v4}, Landroidx/compose/material/TextKt;->ProvideTextStyle(Landroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 209
    :cond_2
    invoke-interface {v0}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 282
    :cond_3
    :goto_1
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2
.end method

.method private static final FilterChip$lambda$1$0$0(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/material/SelectableChipColors;ZLandroidx/compose/runtime/State;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 87
    .param p0, "$leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$selected"    # Z
    .param p2, "$selectedIcon"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p4, "$content"    # Lkotlin/jvm/functions/Function3;
    .param p5, "$colors"    # Landroidx/compose/material/SelectableChipColors;
    .param p6, "$enabled"    # Z
    .param p7, "$contentColor"    # Landroidx/compose/runtime/State;
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p5

    move/from16 v5, p6

    move-object/from16 v6, p8

    move/from16 v7, p9

    const-string v8, "C210@9779L3650:Chip.kt#jmzs0o"

    invoke-static {v6, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v8, v7, 0x3

    const/4 v9, 0x1

    const/4 v11, 0x2

    if-eq v8, v11, :cond_0

    move v8, v9

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    and-int/lit8 v12, v7, 0x1

    invoke-interface {v6, v8, v12}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v8

    if-eqz v8, :cond_1b

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, -0x1

    const-string v12, "androidx.compose.material.FilterChip.<anonymous>.<anonymous>.<anonymous> (Chip.kt:210)"

    const v13, -0x2a65066

    invoke-static {v13, v7, v8, v12}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 212
    :cond_1
    sget-object v8, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v8, Landroidx/compose/ui/Modifier;

    sget-object v12, Landroidx/compose/foundation/layout/IntrinsicSize;->Max:Landroidx/compose/foundation/layout/IntrinsicSize;

    invoke-static {v8, v12}, Landroidx/compose/foundation/layout/IntrinsicKt;->width(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/IntrinsicSize;)Landroidx/compose/ui/Modifier;

    move-result-object v8

    .line 213
    sget-object v12, Landroidx/compose/material/ChipDefaults;->INSTANCE:Landroidx/compose/material/ChipDefaults;

    invoke-virtual {v12}, Landroidx/compose/material/ChipDefaults;->getMinHeight-D9Ej5fM()F

    move-result v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static {v8, v14, v12, v9, v13}, Landroidx/compose/foundation/layout/SizeKt;->defaultMinSize-VpY3zN4$default(Landroidx/compose/ui/Modifier;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v15

    .line 216
    if-nez v0, :cond_3

    if-eqz v1, :cond_2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 219
    :cond_2
    sget v8, Landroidx/compose/material/ChipKt;->HorizontalPadding:F

    move/from16 v16, v8

    goto :goto_2

    .line 217
    :cond_3
    :goto_1
    const/4 v8, 0x0

    .local v8, "$this$dp$iv":I
    const/4 v12, 0x0

    .line 781
    .local v12, "$i$f$getDp":I
    int-to-float v13, v8

    invoke-static {v13}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v8

    move/from16 v16, v8

    .line 214
    .end local v8    # "$this$dp$iv":I
    .end local v12    # "$i$f$getDp":I
    :goto_2
    nop

    .line 222
    if-nez p3, :cond_4

    .line 223
    sget v8, Landroidx/compose/material/ChipKt;->HorizontalPadding:F

    move/from16 v18, v8

    goto :goto_3

    .line 225
    :cond_4
    const/4 v8, 0x0

    .restart local v8    # "$this$dp$iv":I
    const/4 v12, 0x0

    .line 782
    .restart local v12    # "$i$f$getDp":I
    int-to-float v13, v8

    invoke-static {v13}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v13

    move/from16 v18, v13

    .line 214
    .end local v8    # "$this$dp$iv":I
    .end local v12    # "$i$f$getDp":I
    :goto_3
    const/16 v20, 0xa

    const/16 v21, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    invoke-static/range {v15 .. v21}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v8

    .line 228
    sget-object v12, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v12}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v12

    .line 229
    sget-object v13, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v13}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v13

    .line 211
    const/16 v14, 0x1b0

    move v15, v14

    .local v13, "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .local v15, "$changed$iv":I
    move-object/from16 v16, p8

    .local v8, "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v12, "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v16, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/16 v17, 0x0

    .line 783
    .local v17, "$i$f$Row":I
    move/from16 v18, v9

    const v9, 0x2952b718

    move/from16 v19, v14

    const-string v14, "CC(Row)P(2,1,3)99@5124L58,100@5187L130:Row.kt#2w3rfo"

    move-object/from16 v11, v16

    .end local v16    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v11, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static {v11, v9, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 784
    shr-int/lit8 v16, v15, 0x3

    and-int/lit8 v16, v16, 0xe

    shr-int/lit8 v21, v15, 0x3

    and-int/lit8 v21, v21, 0x70

    or-int v9, v16, v21

    invoke-static {v12, v13, v11, v9}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v9

    .line 788
    .local v9, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v16, v15, 0x3

    and-int/lit8 v16, v16, 0x70

    .line 785
    move-object/from16 v21, v8

    .local v16, "$changed$iv$iv":I
    .local v21, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/16 v23, 0x0

    .line 789
    .local v23, "$i$f$Layout":I
    const v10, -0x4ee9b9da

    const-string v6, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v11, v10, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 790
    const/4 v10, 0x0

    invoke-static {v11, v10}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v26

    .line 791
    .local v26, "compositeKeyHash$iv$iv":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v10

    .line 792
    .local v10, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v7, v21

    .end local v8    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v7, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v21, "modifier$iv":Landroidx/compose/ui/Modifier;
    invoke-static {v11, v7}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v8

    .line 794
    .local v8, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v27, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v27 .. v27}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v27

    move-object/from16 v28, v7

    .end local v7    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v28, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v7, v16, 0x6

    and-int/lit16 v7, v7, 0x380

    move/from16 v29, v7

    const/4 v7, 0x6

    or-int/lit8 v29, v29, 0x6

    .line 793
    nop

    .local v29, "$changed$iv$iv$iv":I
    move-object/from16 v30, v27

    .local v30, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v27, 0x0

    .line 795
    .local v27, "$i$f$ReusableComposeNode":I
    move/from16 v31, v7

    const v7, -0x2942ffcf

    move-object/from16 v32, v12

    .end local v12    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v32, "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    const-string v12, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v11, v7, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 796
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v7

    instance-of v7, v7, Landroidx/compose/runtime/Applier;

    if-nez v7, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 797
    :cond_5
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 798
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 799
    move-object/from16 v7, v30

    .end local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v7, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v11, v7}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_4

    .line 801
    .end local v7    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_6
    move-object/from16 v7, v30

    .end local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v7    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 803
    :goto_4
    move-object/from16 v30, v7

    .end local v7    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static {v11}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v7

    .local v7, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v34, 0x0

    .line 804
    .local v34, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v35, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v36, v11

    .end local v11    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v36, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v11

    invoke-static {v7, v9, v11}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 805
    sget-object v11, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v11}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v11

    invoke-static {v7, v10, v11}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 806
    sget-object v11, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v11}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v11

    .local v11, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v35, 0x0

    .line 807
    .local v35, "$i$f$set-impl":I
    move-object/from16 v37, v7

    .local v37, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v38, 0x0

    .line 808
    .local v38, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v37 .. v37}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v39

    if-nez v39, :cond_8

    move-object/from16 v39, v9

    .end local v9    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v39, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-interface/range {v37 .. v37}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v40, v10

    .end local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .local v40, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    goto :goto_5

    :cond_7
    move-object/from16 v10, v37

    goto :goto_6

    .end local v39    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v40    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v9    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    :cond_8
    move-object/from16 v39, v9

    move-object/from16 v40, v10

    .line 809
    .end local v9    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v39    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v40    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    :goto_5
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v10, v37

    .end local v37    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v10, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v10, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 810
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v9, v11}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 812
    :goto_6
    nop

    .line 807
    .end local v10    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v38    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 812
    nop

    .line 813
    .end local v11    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v35    # "$i$f$set-impl":I
    sget-object v9, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v9}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v9

    invoke-static {v7, v8, v9}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 814
    nop

    .line 803
    .end local v7    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v34    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 815
    shr-int/lit8 v7, v29, 0x6

    and-int/lit8 v7, v7, 0xe

    .local v7, "$changed$iv":I
    move-object/from16 v9, v36

    .local v9, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 786
    .local v10, "$i$a$-Layout-RowKt$Row$1$iv":I
    const v11, -0x184d8b46

    move/from16 v34, v7

    .end local v7    # "$changed$iv":I
    .local v34, "$changed$iv":I
    const-string v7, "C101@5232L9:Row.kt#2w3rfo"

    invoke-static {v9, v11, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v35, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v37, v15, 0x6

    and-int/lit8 v37, v37, 0x70

    or-int/lit8 v37, v37, 0x6

    .local v37, "$changed":I
    move-object/from16 v41, v35

    check-cast v41, Landroidx/compose/foundation/layout/RowScope;

    .local v41, "$this$FilterChip_u24lambda_u241_u240_u240_u240":Landroidx/compose/foundation/layout/RowScope;
    move-object/from16 v35, v9

    .local v35, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v38, 0x0

    .line 231
    .local v38, "$i$a$-Row-ChipKt$FilterChip$2$1$1$1":I
    const v11, -0x59b94abb

    move-object/from16 v47, v8

    .end local v8    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .local v47, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    const-string v8, "C268@12902L264:Chip.kt#jmzs0o"

    move-object/from16 v48, v9

    .end local v35    # "$composer":Landroidx/compose/runtime/Composer;
    .local v9, "$composer":Landroidx/compose/runtime/Composer;
    .local v48, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static {v9, v11, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const v8, -0x5a5cc5b4

    if-nez v0, :cond_a

    if-eqz v1, :cond_9

    if-eqz v2, :cond_9

    goto :goto_7

    :cond_9
    invoke-interface {v9, v8}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move/from16 v49, v10

    move-object/from16 v50, v13

    move-object/from16 v18, v14

    move/from16 v51, v15

    goto/16 :goto_11

    :cond_a
    :goto_7
    const v11, -0x59b89e6b

    invoke-interface {v9, v11}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v11, "231@10804L47,232@10876L1913,266@12814L45"

    invoke-static {v9, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 232
    sget-object v11, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v11, Landroidx/compose/ui/Modifier;

    sget v8, Landroidx/compose/material/ChipKt;->LeadingIconStartSpacing:F

    invoke-static {v11, v8}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v8

    move/from16 v11, v31

    invoke-static {v8, v9, v11}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 233
    move-object v8, v9

    const/16 v24, 0x0

    .local v8, "$composer$iv":Landroidx/compose/runtime/Composer;
    move/from16 v11, v24

    .local v11, "$changed$iv":I
    const/16 v42, 0x0

    .line 816
    .local v42, "$i$f$Box":I
    move/from16 v49, v10

    .end local v10    # "$i$a$-Layout-RowKt$Row$1$iv":I
    .local v49, "$i$a$-Layout-RowKt$Row$1$iv":I
    const v10, 0x2bb5b5d7

    move/from16 v43, v11

    .end local v11    # "$changed$iv":I
    .local v43, "$changed$iv":I
    const-string v11, "CC(Box)P(2,1,3)71@3423L130:Box.kt#2w3rfo"

    invoke-static {v8, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 817
    sget-object v44, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v44, Landroidx/compose/ui/Modifier;

    .line 818
    .local v44, "modifier$iv":Landroidx/compose/ui/Modifier;
    sget-object v45, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual/range {v45 .. v45}, Landroidx/compose/ui/Alignment$Companion;->getTopStart()Landroidx/compose/ui/Alignment;

    move-result-object v10

    .line 819
    .local v10, "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    move-object/from16 v50, v13

    .end local v13    # "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .local v50, "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    const/4 v13, 0x0

    .line 822
    .local v13, "propagateMinConstraints$iv":Z
    move/from16 v51, v15

    .end local v15    # "$changed$iv":I
    .local v51, "$changed$iv":I
    invoke-static {v10, v13}, Landroidx/compose/foundation/layout/BoxKt;->maybeCachedBoxMeasurePolicy(Landroidx/compose/ui/Alignment;Z)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v15

    .line 826
    .local v15, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v45, v43, 0x3

    and-int/lit8 v45, v45, 0x70

    .line 823
    nop

    .local v45, "$changed$iv$iv":I
    move-object/from16 v52, v44

    .local v52, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/16 v53, 0x0

    .line 827
    .local v53, "$i$f$Layout":I
    move-object/from16 v54, v10

    const v10, -0x4ee9b9da

    .end local v10    # "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .local v54, "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    invoke-static {v8, v10, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 828
    const/4 v10, 0x0

    invoke-static {v8, v10}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v55

    .line 829
    .local v55, "compositeKeyHash$iv$iv":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v10

    .line 830
    .local v10, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    move/from16 v56, v13

    move-object/from16 v13, v52

    .end local v52    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v13, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v56, "propagateMinConstraints$iv":Z
    invoke-static {v8, v13}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 832
    .local v3, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v52, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v52 .. v52}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v52

    move-object/from16 v57, v13

    .end local v13    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v57, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v13, v45, 0x6

    and-int/lit16 v13, v13, 0x380

    const/16 v31, 0x6

    or-int/lit8 v13, v13, 0x6

    .line 831
    nop

    .local v13, "$changed$iv$iv$iv":I
    move-object/from16 v58, v52

    .local v58, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v52, 0x0

    .line 833
    .local v52, "$i$f$ReusableComposeNode":I
    move/from16 v59, v13

    const v13, -0x2942ffcf

    .end local v13    # "$changed$iv$iv$iv":I
    .local v59, "$changed$iv$iv$iv":I
    invoke-static {v8, v13, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 834
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v13

    instance-of v13, v13, Landroidx/compose/runtime/Applier;

    if-nez v13, :cond_b

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 835
    :cond_b
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 836
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v13

    if-eqz v13, :cond_c

    .line 837
    move-object/from16 v13, v58

    .end local v58    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v13, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_8

    .line 839
    .end local v13    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v58    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_c
    move-object/from16 v13, v58

    .end local v58    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v13    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 841
    :goto_8
    move-object/from16 v58, v8

    .end local v8    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v58, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v8

    .local v8, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v60, 0x0

    .line 842
    .local v60, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v61, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v62, v13

    .end local v13    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v62, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v61 .. v61}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v13

    invoke-static {v8, v15, v13}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 843
    sget-object v13, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v13}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v13

    invoke-static {v8, v10, v13}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 844
    sget-object v13, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v13}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v13

    .local v13, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v61, 0x0

    .line 845
    .local v61, "$i$f$set-impl":I
    move-object/from16 v63, v8

    .local v63, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v64, 0x0

    .line 846
    .local v64, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v63 .. v63}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v65

    if-nez v65, :cond_e

    move-object/from16 v65, v10

    .end local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .local v65, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v63 .. v63}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    move-object/from16 v66, v15

    .end local v15    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v66, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v10, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d

    goto :goto_9

    :cond_d
    move-object/from16 v15, v63

    goto :goto_a

    .end local v65    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v66    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v15    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_e
    move-object/from16 v65, v10

    move-object/from16 v66, v15

    .line 847
    .end local v10    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v15    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v65    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v66    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_9
    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object/from16 v15, v63

    .end local v63    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v15, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 848
    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v8, v10, v13}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 850
    :goto_a
    nop

    .line 845
    .end local v15    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v64    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 850
    nop

    .line 851
    .end local v13    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v61    # "$i$f$set-impl":I
    sget-object v10, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v10

    invoke-static {v8, v3, v10}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 852
    nop

    .line 841
    .end local v8    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v60    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 853
    shr-int/lit8 v8, v59, 0x6

    and-int/lit8 v8, v8, 0xe

    .local v8, "$changed$iv":I
    move-object/from16 v10, v58

    .local v10, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 824
    .local v13, "$i$a$-Layout-BoxKt$Box$1$iv":I
    const v15, -0x7ff482d7

    move-object/from16 v60, v3

    .end local v3    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .local v60, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    const-string v3, "C72@3468L9:Box.kt#2w3rfo"

    invoke-static {v10, v15, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v3, Landroidx/compose/foundation/layout/BoxScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/BoxScopeInstance;

    shr-int/lit8 v61, v43, 0x6

    and-int/lit8 v61, v61, 0x70

    const/16 v31, 0x6

    or-int/lit8 v61, v61, 0x6

    .local v61, "$changed":I
    check-cast v3, Landroidx/compose/foundation/layout/BoxScope;

    .local v3, "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    move-object/from16 v63, v10

    .local v63, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v64, 0x0

    .line 234
    .local v64, "$i$a$-Box-ChipKt$FilterChip$2$1$1$1$1":I
    const v15, -0x7bd1696f

    move-object/from16 v68, v3

    .end local v3    # "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    .local v68, "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    const-string v3, "C:Chip.kt#jmzs0o"

    move/from16 v69, v8

    move-object/from16 v8, v63

    .end local v63    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    .local v69, "$changed$iv":I
    invoke-static {v8, v15, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    if-eqz v0, :cond_f

    const v15, -0x7bd1b13f

    invoke-interface {v8, v15}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v15, "234@10999L35,235@11067L298"

    invoke-static {v8, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 235
    const/4 v15, 0x0

    invoke-interface {v4, v5, v1, v8, v15}, Landroidx/compose/material/SelectableChipColors;->leadingIconColor(ZZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v63

    .line 237
    .local v63, "leadingIconColor":Landroidx/compose/runtime/State;
    move/from16 v24, v15

    const/4 v15, 0x2

    new-array v15, v15, [Landroidx/compose/runtime/ProvidedValue;

    invoke-static {}, Landroidx/compose/material/ContentColorKt;->getLocalContentColor()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    move-object/from16 v70, v10

    .end local v10    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v70, "$composer$iv":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v63 .. v63}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v3

    aput-object v3, v15, v24

    .line 238
    invoke-static {}, Landroidx/compose/material/ContentAlphaKt;->getLocalContentAlpha()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    invoke-interface/range {v63 .. v63}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v10}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v71

    invoke-static/range {v71 .. v72}, Landroidx/compose/ui/graphics/Color;->getAlpha-impl(J)F

    move-result v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v3

    aput-object v3, v15, v18

    .line 237
    nop

    .line 239
    sget v3, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    .line 236
    invoke-static {v15, v0, v8, v3}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider([Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 234
    .end local v63    # "leadingIconColor":Landroidx/compose/runtime/State;
    goto :goto_b

    .end local v70    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer$iv":Landroidx/compose/runtime/Composer;
    :cond_f
    move-object/from16 v70, v10

    .end local v10    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .restart local v70    # "$composer$iv":Landroidx/compose/runtime/Composer;
    const v3, -0x7c7771f3

    invoke-interface {v8, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_b
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 242
    if-eqz v1, :cond_15

    if-eqz v2, :cond_15

    const v3, -0x7bc95148

    invoke-interface {v8, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v3, "255@12280L453"

    invoke-static {v8, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 243
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    .line 244
    .local v3, "overlayModifier":Landroidx/compose/ui/Modifier;
    const-wide/16 v71, 0x0

    .local v71, "iconColor":J
    invoke-interface/range {p7 .. p7}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v10}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v71

    .line 245
    if-eqz v0, :cond_10

    const v10, -0x7bc6a4bd

    invoke-interface {v8, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v10, "253@12173L34"

    invoke-static {v8, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 252
    nop

    .line 247
    sget-object v10, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v10, Landroidx/compose/ui/Modifier;

    sget v15, Landroidx/compose/material/ChipKt;->SelectedIconContainerSize:F

    invoke-static {v10, v15}, Landroidx/compose/foundation/layout/SizeKt;->requiredSize-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 249
    invoke-interface/range {p7 .. p7}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/compose/ui/graphics/Color;

    move/from16 v63, v13

    move-object/from16 v18, v14

    .end local v13    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .local v63, "$i$a$-Layout-BoxKt$Box$1$iv":I
    invoke-virtual {v15}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v13

    .line 250
    invoke-static {}, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->getCircleShape()Landroidx/compose/foundation/shape/RoundedCornerShape;

    move-result-object v15

    check-cast v15, Landroidx/compose/ui/graphics/Shape;

    .line 248
    invoke-static {v10, v13, v14, v15}, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 252
    invoke-static {}, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->getCircleShape()Landroidx/compose/foundation/shape/RoundedCornerShape;

    move-result-object v13

    check-cast v13, Landroidx/compose/ui/graphics/Shape;

    invoke-static {v10, v13}, Landroidx/compose/ui/draw/ClipKt;->clip(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 246
    move-object v3, v10

    .line 254
    const/4 v10, 0x0

    invoke-interface {v4, v5, v1, v8, v10}, Landroidx/compose/material/SelectableChipColors;->backgroundColor(ZZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v13

    invoke-interface {v13}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v10}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v71

    .line 245
    goto :goto_c

    .end local v63    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .restart local v13    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    :cond_10
    move/from16 v63, v13

    move-object/from16 v18, v14

    .end local v13    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .restart local v63    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    const v10, -0x7c7771f3

    invoke-interface {v8, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_c
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 257
    nop

    .line 258
    sget-object v10, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v10

    .line 256
    move-object v13, v3

    .local v10, "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .local v13, "modifier$iv":Landroidx/compose/ui/Modifier;
    const/16 v14, 0x30

    .local v14, "$changed$iv":I
    move-object v15, v8

    .local v15, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .line 854
    .local v20, "$i$f$Box":I
    const v0, 0x2bb5b5d7

    invoke-static {v15, v0, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 855
    const/4 v0, 0x0

    .line 858
    .local v0, "propagateMinConstraints$iv":Z
    invoke-static {v10, v0}, Landroidx/compose/foundation/layout/BoxKt;->maybeCachedBoxMeasurePolicy(Landroidx/compose/ui/Alignment;Z)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v11

    .line 862
    .local v11, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v46, v14, 0x3

    and-int/lit8 v46, v46, 0x70

    .line 859
    nop

    .local v46, "$changed$iv$iv":I
    move-object/from16 v73, v13

    .local v73, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/16 v74, 0x0

    .line 863
    .local v74, "$i$f$Layout":I
    move/from16 v75, v0

    const v0, -0x4ee9b9da

    .end local v0    # "propagateMinConstraints$iv":Z
    .local v75, "propagateMinConstraints$iv":Z
    invoke-static {v15, v0, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 864
    const/4 v0, 0x0

    invoke-static {v15, v0}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v76

    .line 865
    .local v76, "compositeKeyHash$iv$iv":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v0

    .line 866
    .local v0, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v1, v73

    move-object/from16 v73, v3

    .end local v3    # "overlayModifier":Landroidx/compose/ui/Modifier;
    .local v1, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v73, "overlayModifier":Landroidx/compose/ui/Modifier;
    invoke-static {v15, v1}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 868
    .local v3, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v77, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v77 .. v77}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v77

    move-object/from16 v78, v1

    .end local v1    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .local v78, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v1, v46, 0x6

    and-int/lit16 v1, v1, 0x380

    const/16 v31, 0x6

    or-int/lit8 v1, v1, 0x6

    .line 867
    nop

    .local v1, "$changed$iv$iv$iv":I
    move-object/from16 v79, v77

    .local v79, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v77, 0x0

    .line 869
    .local v77, "$i$f$ReusableComposeNode":I
    move/from16 v80, v1

    const v1, -0x2942ffcf

    .end local v1    # "$changed$iv$iv$iv":I
    .local v80, "$changed$iv$iv$iv":I
    invoke-static {v15, v1, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 870
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v1

    instance-of v1, v1, Landroidx/compose/runtime/Applier;

    if-nez v1, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 871
    :cond_11
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 872
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 873
    move-object/from16 v1, v79

    .end local v79    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v1, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v15, v1}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_d

    .line 875
    .end local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v79    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_12
    move-object/from16 v1, v79

    .end local v79    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 877
    :goto_d
    move-object/from16 v79, v1

    .end local v1    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v79    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static {v15}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v1

    .local v1, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v81, 0x0

    .line 878
    .local v81, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v82, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v82 .. v82}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v4

    invoke-static {v1, v11, v4}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 879
    sget-object v4, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v4

    invoke-static {v1, v0, v4}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 880
    sget-object v4, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v4

    .local v4, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v82, 0x0

    .line 881
    .local v82, "$i$f$set-impl":I
    move-object/from16 v83, v1

    .local v83, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v84, 0x0

    .line 882
    .local v84, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v83 .. v83}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v85

    if-nez v85, :cond_14

    move-object/from16 v85, v0

    .end local v0    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .local v85, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v83 .. v83}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static/range {v76 .. v76}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto :goto_e

    :cond_13
    move-object/from16 v5, v83

    goto :goto_f

    .end local v85    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v0    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    :cond_14
    move-object/from16 v85, v0

    .line 883
    .end local v0    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v85    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    :goto_e
    invoke-static/range {v76 .. v76}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v5, v83

    .end local v83    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v5, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 884
    invoke-static/range {v76 .. v76}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0, v4}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 886
    :goto_f
    nop

    .line 881
    .end local v5    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v84    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 886
    nop

    .line 887
    .end local v4    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v82    # "$i$f$set-impl":I
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v1, v3, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 888
    nop

    .line 877
    .end local v1    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v81    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 889
    shr-int/lit8 v0, v80, 0x6

    and-int/lit8 v0, v0, 0xe

    .local v0, "$changed$iv":I
    move-object v1, v15

    .local v1, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 860
    .local v4, "$i$a$-Layout-BoxKt$Box$1$iv":I
    const-string v5, "C72@3468L9:Box.kt#2w3rfo"

    move/from16 v81, v0

    const v0, -0x7ff482d7

    .end local v0    # "$changed$iv":I
    .local v81, "$changed$iv":I
    invoke-static {v1, v0, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v0, Landroidx/compose/foundation/layout/BoxScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/BoxScopeInstance;

    shr-int/lit8 v5, v14, 0x6

    and-int/lit8 v5, v5, 0x70

    const/16 v31, 0x6

    or-int/lit8 v5, v5, 0x6

    .local v5, "$changed":I
    check-cast v0, Landroidx/compose/foundation/layout/BoxScope;

    .local v0, "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    move-object/from16 v67, v1

    .local v67, "$composer":Landroidx/compose/runtime/Composer;
    const/16 v82, 0x0

    .line 260
    .local v82, "$i$a$-Box-ChipKt$FilterChip$2$1$1$1$1$1":I
    move-object/from16 v83, v0

    .end local v0    # "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    .local v83, "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    const v0, 0x643af6d9

    move-object/from16 v84, v1

    .end local v1    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v84, "$composer$iv":Landroidx/compose/runtime/Composer;
    const-string v1, "C259@12494L205:Chip.kt#jmzs0o"

    move-object/from16 v86, v3

    move-object/from16 v3, v67

    .end local v67    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    .local v86, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    invoke-static {v3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 261
    invoke-static {}, Landroidx/compose/material/ContentColorKt;->getLocalContentColor()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-static/range {v71 .. v72}, Landroidx/compose/ui/graphics/Color;->box-impl(J)Landroidx/compose/ui/graphics/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v0

    .line 262
    sget v1, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    .line 260
    invoke-static {v0, v2, v3, v1}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 264
    nop

    .line 860
    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v5    # "$changed":I
    .end local v82    # "$i$a$-Box-ChipKt$FilterChip$2$1$1$1$1$1":I
    .end local v83    # "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    invoke-static/range {v84 .. v84}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 889
    .end local v4    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .end local v81    # "$changed$iv":I
    .end local v84    # "$composer$iv":Landroidx/compose/runtime/Composer;
    nop

    .line 890
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 869
    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 891
    nop

    .line 863
    .end local v77    # "$i$f$ReusableComposeNode":I
    .end local v79    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .end local v80    # "$changed$iv$iv$iv":I
    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 892
    nop

    .line 854
    .end local v46    # "$changed$iv$iv":I
    .end local v74    # "$i$f$Layout":I
    .end local v76    # "compositeKeyHash$iv$iv":I
    .end local v78    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v85    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v86    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 893
    nop

    .line 242
    .end local v10    # "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .end local v11    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v13    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v14    # "$changed$iv":I
    .end local v15    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$Box":I
    .end local v71    # "iconColor":J
    .end local v73    # "overlayModifier":Landroidx/compose/ui/Modifier;
    .end local v75    # "propagateMinConstraints$iv":Z
    goto :goto_10

    .end local v63    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .local v13, "$i$a$-Layout-BoxKt$Box$1$iv":I
    :cond_15
    move/from16 v63, v13

    move-object/from16 v18, v14

    .end local v13    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .restart local v63    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    const v10, -0x7c7771f3

    invoke-interface {v8, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_10
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 234
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 266
    nop

    .line 824
    .end local v8    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v61    # "$changed":I
    .end local v64    # "$i$a$-Box-ChipKt$FilterChip$2$1$1$1$1":I
    .end local v68    # "$this$FilterChip_u24lambda_u241_u240_u240_u240_u240":Landroidx/compose/foundation/layout/BoxScope;
    invoke-static/range {v70 .. v70}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 853
    .end local v63    # "$i$a$-Layout-BoxKt$Box$1$iv":I
    .end local v69    # "$changed$iv":I
    .end local v70    # "$composer$iv":Landroidx/compose/runtime/Composer;
    nop

    .line 894
    invoke-interface/range {v58 .. v58}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 833
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 895
    nop

    .line 827
    .end local v52    # "$i$f$ReusableComposeNode":I
    .end local v59    # "$changed$iv$iv$iv":I
    .end local v62    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 896
    nop

    .line 816
    .end local v45    # "$changed$iv$iv":I
    .end local v53    # "$i$f$Layout":I
    .end local v55    # "compositeKeyHash$iv$iv":I
    .end local v57    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v60    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v65    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v58 .. v58}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 897
    nop

    .line 267
    .end local v42    # "$i$f$Box":I
    .end local v43    # "$changed$iv":I
    .end local v44    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v54    # "contentAlignment$iv":Landroidx/compose/ui/Alignment;
    .end local v56    # "propagateMinConstraints$iv":Z
    .end local v58    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v66    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    sget v1, Landroidx/compose/material/ChipKt;->LeadingIconEndSpacing:F

    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/4 v11, 0x6

    invoke-static {v0, v9, v11}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 231
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 270
    :goto_11
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v42, v0

    check-cast v42, Landroidx/compose/ui/Modifier;

    const/16 v45, 0x2

    const/16 v46, 0x0

    const/high16 v43, 0x3f800000    # 1.0f

    const/16 v44, 0x0

    invoke-static/range {v41 .. v46}, Landroidx/compose/foundation/layout/RowScope;->weight$default(Landroidx/compose/foundation/layout/RowScope;Landroidx/compose/ui/Modifier;FZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 271
    sget-object v1, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v1}, Landroidx/compose/foundation/layout/Arrangement;->getStart()Landroidx/compose/foundation/layout/Arrangement$Horizontal;

    move-result-object v1

    .line 272
    sget-object v3, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/Alignment$Companion;->getCenterVertically()Landroidx/compose/ui/Alignment$Vertical;

    move-result-object v3

    .line 269
    move-object v4, v9

    .local v0, "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v1, "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v3, "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .local v4, "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v19, "$changed$iv":I
    const/4 v5, 0x0

    .line 898
    .local v5, "$i$f$Row":I
    move-object/from16 v8, v18

    const v10, 0x2952b718

    invoke-static {v4, v10, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 899
    shr-int/lit8 v8, v19, 0x3

    and-int/lit8 v8, v8, 0xe

    shr-int/lit8 v10, v19, 0x3

    and-int/lit8 v10, v10, 0x70

    or-int/2addr v8, v10

    invoke-static {v1, v3, v4, v8}, Landroidx/compose/foundation/layout/RowKt;->rowMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v8

    .line 903
    .local v8, "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v10, v19, 0x3

    and-int/lit8 v10, v10, 0x70

    .line 900
    nop

    .local v10, "$changed$iv$iv":I
    move-object v11, v0

    .local v11, "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    const/4 v13, 0x0

    .line 904
    .local v13, "$i$f$Layout":I
    const v14, -0x4ee9b9da

    invoke-static {v4, v14, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 905
    const/4 v15, 0x0

    invoke-static {v4, v15}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v6

    .line 906
    .local v6, "compositeKeyHash$iv$iv":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v14

    .line 907
    .local v14, "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v4, v11}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v15

    .line 909
    .local v15, "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    sget-object v18, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v18 .. v18}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v18

    move-object/from16 v20, v0

    .end local v0    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .local v20, "modifier$iv":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v0, v10, 0x6

    and-int/lit16 v0, v0, 0x380

    const/16 v31, 0x6

    or-int/lit8 v0, v0, 0x6

    .line 908
    nop

    .local v0, "$changed$iv$iv$iv":I
    move-object/from16 v22, v18

    .local v22, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    const/16 v18, 0x0

    .line 910
    .local v18, "$i$f$ReusableComposeNode":I
    move/from16 v25, v0

    const v0, -0x2942ffcf

    .end local v0    # "$changed$iv$iv$iv":I
    .local v25, "$changed$iv$iv$iv":I
    invoke-static {v4, v0, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 911
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v0

    instance-of v0, v0, Landroidx/compose/runtime/Applier;

    if-nez v0, :cond_16

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 912
    :cond_16
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 913
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 914
    move-object/from16 v0, v22

    .end local v22    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v0, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_12

    .line 916
    .end local v0    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v22    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    :cond_17
    move-object/from16 v0, v22

    .end local v22    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .restart local v0    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 918
    :goto_12
    invoke-static {v4}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v12

    .local v12, "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v22, 0x0

    .line 919
    .local v22, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    sget-object v33, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v42, v0

    .end local v0    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    .local v42, "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v33 .. v33}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v12, v8, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 920
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v12, v14, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 921
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    .local v0, "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    const/16 v33, 0x0

    .line 922
    .local v33, "$i$f$set-impl":I
    move-object/from16 v43, v12

    .local v43, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v44, 0x0

    .line 923
    .local v44, "$i$a$-with-Updater$set$1$iv$iv$iv":I
    invoke-interface/range {v43 .. v43}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v45

    if-nez v45, :cond_19

    move-object/from16 v45, v1

    .end local v1    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .local v45, "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    invoke-interface/range {v43 .. v43}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    goto :goto_13

    :cond_18
    move-object/from16 v2, v43

    goto :goto_14

    .end local v45    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .restart local v1    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    :cond_19
    move-object/from16 v45, v1

    .line 924
    .end local v1    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .restart local v45    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    :goto_13
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v2, v43

    .end local v43    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .local v2, "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 925
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v12, v1, v0}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 927
    :goto_14
    nop

    .line 922
    .end local v2    # "$this$set_impl_u24lambda_u240$iv$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v44    # "$i$a$-with-Updater$set$1$iv$iv$iv":I
    nop

    .line 927
    nop

    .line 928
    .end local v0    # "block$iv$iv$iv":Lkotlin/jvm/functions/Function2;
    .end local v33    # "$i$f$set-impl":I
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v12, v15, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 929
    nop

    .line 918
    .end local v12    # "$this$Layout_u24lambda_u240$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v22    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1$iv$iv":I
    nop

    .line 930
    shr-int/lit8 v0, v25, 0x6

    and-int/lit8 v0, v0, 0xe

    .local v0, "$changed$iv":I
    move-object v1, v4

    .local v1, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 901
    .local v2, "$i$a$-Layout-RowKt$Row$1$iv":I
    const v12, -0x184d8b46

    invoke-static {v1, v12, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v7, Landroidx/compose/foundation/layout/RowScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/RowScopeInstance;

    shr-int/lit8 v12, v19, 0x6

    and-int/lit8 v12, v12, 0x70

    const/16 v31, 0x6

    or-int/lit8 v12, v12, 0x6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move/from16 v22, v0

    move-object/from16 v0, p4

    .end local v0    # "$changed$iv":I
    .local v22, "$changed$iv":I
    invoke-interface {v0, v7, v1, v12}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 930
    .end local v1    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$a$-Layout-RowKt$Row$1$iv":I
    .end local v22    # "$changed$iv":I
    nop

    .line 931
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 910
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 932
    nop

    .line 904
    .end local v18    # "$i$f$ReusableComposeNode":I
    .end local v25    # "$changed$iv$iv$iv":I
    .end local v42    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 933
    nop

    .line 898
    .end local v6    # "compositeKeyHash$iv$iv":I
    .end local v10    # "$changed$iv$iv":I
    .end local v11    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v13    # "$i$f$Layout":I
    .end local v14    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v15    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 934
    nop

    .line 275
    .end local v3    # "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .end local v4    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$Row":I
    .end local v8    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v19    # "$changed$iv":I
    .end local v20    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v45    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    if-eqz p3, :cond_1a

    const v1, -0x5994a97a

    invoke-interface {v9, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "275@13239L43,276@13307L14,277@13346L43"

    invoke-static {v9, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 276
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    sget v2, Landroidx/compose/material/ChipKt;->TrailingIconSpacing:F

    invoke-static {v1, v2}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v1

    const/4 v11, 0x6

    invoke-static {v1, v9, v11}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 277
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v3, p3

    invoke-interface {v3, v9, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    sget v2, Landroidx/compose/material/ChipKt;->TrailingIconSpacing:F

    invoke-static {v1, v2}, Landroidx/compose/foundation/layout/SizeKt;->width-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v1

    invoke-static {v1, v9, v11}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 275
    goto :goto_15

    :cond_1a
    move-object/from16 v3, p3

    const v1, -0x5a5cc5b4

    invoke-interface {v9, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_15
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 231
    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 280
    nop

    .line 786
    .end local v9    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v37    # "$changed":I
    .end local v38    # "$i$a$-Row-ChipKt$FilterChip$2$1$1$1":I
    .end local v41    # "$this$FilterChip_u24lambda_u241_u240_u240_u240":Landroidx/compose/foundation/layout/RowScope;
    invoke-static/range {v48 .. v48}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 815
    .end local v34    # "$changed$iv":I
    .end local v48    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v49    # "$i$a$-Layout-RowKt$Row$1$iv":I
    nop

    .line 935
    invoke-interface/range {v36 .. v36}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 795
    invoke-static/range {v36 .. v36}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 936
    nop

    .line 789
    .end local v27    # "$i$f$ReusableComposeNode":I
    .end local v29    # "$changed$iv$iv$iv":I
    .end local v30    # "factory$iv$iv$iv":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v36 .. v36}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 937
    nop

    .line 783
    .end local v16    # "$changed$iv$iv":I
    .end local v23    # "$i$f$Layout":I
    .end local v26    # "compositeKeyHash$iv$iv":I
    .end local v28    # "modifier$iv$iv":Landroidx/compose/ui/Modifier;
    .end local v40    # "localMap$iv$iv":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v47    # "materialized$iv$iv":Landroidx/compose/ui/Modifier;
    invoke-static/range {v36 .. v36}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 938
    nop

    .end local v17    # "$i$f$Row":I
    .end local v21    # "modifier$iv":Landroidx/compose/ui/Modifier;
    .end local v32    # "horizontalArrangement$iv":Landroidx/compose/foundation/layout/Arrangement$Horizontal;
    .end local v36    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v39    # "measurePolicy$iv":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v50    # "verticalAlignment$iv":Landroidx/compose/ui/Alignment$Vertical;
    .end local v51    # "$changed$iv":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_16

    .line 210
    :cond_1b
    move-object/from16 v3, p3

    move-object/from16 v0, p4

    invoke-interface/range {p8 .. p8}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 281
    :cond_1c
    :goto_16
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final FilterChip$lambda$2(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 17

    or-int/lit8 v0, p12, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v14

    invoke-static/range {p13 .. p13}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v15

    move/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move/from16 v16, p14

    move-object/from16 v13, p15

    invoke-static/range {v1 .. v16}, Landroidx/compose/material/ChipKt;->FilterChip(ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/material/SelectableChipColors;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
