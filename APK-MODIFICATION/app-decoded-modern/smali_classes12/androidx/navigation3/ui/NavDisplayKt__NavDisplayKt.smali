.class final synthetic Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;
.super Ljava/lang/Object;
.source "NavDisplay.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNavDisplay.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NavDisplay.kt\nandroidx/navigation3/ui/NavDisplayKt__NavDisplayKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 5 ObjectFloatMap.kt\nandroidx/collection/MutableObjectFloatMap\n+ 6 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n*L\n1#1,645:1\n1277#2,6:646\n1277#2,6:657\n1277#2,6:663\n1277#2,6:669\n1277#2,6:683\n1277#2,6:689\n1277#2,3:702\n1280#2,3:723\n1277#2,6:726\n1277#2,6:732\n1277#2,6:738\n1277#2,6:744\n1277#2,6:750\n1277#2,6:756\n1#3:652\n1557#4:653\n1628#4,3:654\n1557#4:675\n1628#4,3:676\n1557#4:679\n1628#4,3:680\n1062#4:705\n1557#4:706\n1628#4,3:707\n1863#4,2:710\n1557#4:715\n1628#4,3:716\n827#4:719\n855#4,2:720\n295#4,2:767\n744#5,7:695\n35#6,3:712\n39#6:722\n53#6,5:762\n*S KotlinDebug\n*F\n+ 1 NavDisplay.kt\nandroidx/navigation3/ui/NavDisplayKt__NavDisplayKt\n*L\n179#1:646,6\n299#1:657,6\n363#1:663,6\n375#1:669,6\n403#1:683,6\n404#1:689,6\n423#1:702,3\n423#1:723,3\n475#1:726,6\n481#1:732,6\n524#1:738,6\n545#1:744,6\n542#1:750,6\n574#1:756,6\n292#1:653\n292#1:654,3\n398#1:675\n398#1:676,3\n399#1:679\n399#1:680,3\n428#1:705\n429#1:706\n429#1:707,3\n430#1:710,2\n454#1:715\n454#1:716,3\n455#1:719\n455#1:720,2\n609#1:767,2\n407#1:695,7\n451#1:712,3\n451#1:722\n592#1:762,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u001a\u009f\u0002\u0010\u0000\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u000e\u0008\u0002\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u000b2\u0014\u0008\u0002\u0010\u000c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\r0\u00052\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u000f2\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112%\u0008\u0002\u0010\u0012\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172%\u0008\u0002\u0010\u0018\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172+\u0008\u0002\u0010\u0019\u001a%\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u00160\u001a\u00a2\u0006\u0002\u0008\u00172\'\u0010\u001c\u001a#\u0012\u0013\u0012\u0011H\u0002\u00a2\u0006\u000c\u0008\u001d\u0012\u0008\u0008\u001e\u0012\u0004\u0008\u0008(\u001f\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020 0\u0013H\u0007\u00a2\u0006\u0002\u0010!\u001a\u00e4\u0001\u0010\u0000\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u0012\u0010\"\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020 0\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u000e\u0008\u0002\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u000f2\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112%\u0008\u0002\u0010\u0012\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172%\u0008\u0002\u0010\u0018\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172+\u0008\u0002\u0010\u0019\u001a%\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u00160\u001a\u00a2\u0006\u0002\u0008\u00172\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u000bH\u0007\u00a2\u0006\u0002\u0010#\u001a\u00d4\u0001\u0010\u0000\u001a\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u0002H\u00020%2\u0012\u0010&\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020(0\'2\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112%\u0008\u0002\u0010\u0012\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172%\u0008\u0002\u0010\u0018\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00160\u0013\u00a2\u0006\u0002\u0008\u00172+\u0008\u0002\u0010\u0019\u001a%\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u00160\u001a\u00a2\u0006\u0002\u0008\u0017H\u0007\u00a2\u0006\u0002\u0010)\u001a3\u0010*\u001a\u00020+\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u000c\u0010,\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u00052\u000c\u0010-\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0005H\u0002\u00a2\u0006\u0002\u0008.\u001aH\u0010/\u001a!\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u0013\u00a2\u0006\u0002\u0008\u0017\"\u0008\u0008\u0000\u0010\u0002*\u00020\u0003*\u0008\u0012\u0004\u0012\u0002H\u00020\u00152\u0006\u0010\u001f\u001a\u000200H\u0002\u00a2\u0006\u0002\u00081\u001aF\u00102\u001a\'\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u001a\u00a2\u0006\u0002\u0008\u0017\"\u0008\u0008\u0000\u0010\u0002*\u00020\u0003*\u0008\u0012\u0004\u0012\u0002H\u00020\u0015H\u0002\u00a2\u0006\u0002\u00083\u00a8\u00064"
    }
    d2 = {
        "NavDisplay",
        "",
        "T",
        "",
        "backStack",
        "",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "contentAlignment",
        "Landroidx/compose/ui/Alignment;",
        "onBack",
        "Lkotlin/Function0;",
        "entryDecorators",
        "Landroidx/navigation3/runtime/NavEntryDecorator;",
        "sceneStrategy",
        "Landroidx/navigation3/scene/SceneStrategy;",
        "sizeTransform",
        "Landroidx/compose/animation/SizeTransform;",
        "transitionSpec",
        "Lkotlin/Function1;",
        "Landroidx/compose/animation/AnimatedContentTransitionScope;",
        "Landroidx/navigation3/scene/Scene;",
        "Landroidx/compose/animation/ContentTransform;",
        "Lkotlin/ExtensionFunctionType;",
        "popTransitionSpec",
        "predictivePopTransitionSpec",
        "Lkotlin/Function2;",
        "",
        "entryProvider",
        "Lkotlin/ParameterName;",
        "name",
        "key",
        "Landroidx/navigation3/runtime/NavEntry;",
        "(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V",
        "entries",
        "(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V",
        "sceneState",
        "Landroidx/navigation3/scene/SceneState;",
        "navigationEventState",
        "Landroidx/navigationevent/compose/NavigationEventState;",
        "Landroidx/navigation3/scene/SceneInfo;",
        "(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V",
        "isPop",
        "",
        "oldBackStack",
        "newBackStack",
        "isPop$NavDisplayKt__NavDisplayKt",
        "contentTransform",
        "",
        "contentTransform$NavDisplayKt__NavDisplayKt",
        "predictivePopSpec",
        "predictivePopSpec$NavDisplayKt__NavDisplayKt",
        "navigation3-ui"
    }
    k = 0x5
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
    xs = "androidx/navigation3/ui/NavDisplayKt"
.end annotation


# direct methods
.method public static synthetic $r8$lambda$6O81jaRNQCKKnwBMCC1FWER57TE(Landroidx/compose/animation/core/Transition;Ljava/util/Map;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p5}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$20$NavDisplayKt__NavDisplayKt(Landroidx/compose/animation/core/Transition;Ljava/util/Map;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$B7IIsE9vcmdiuZK8oV9IAYMgIlI(ZLandroidx/navigation3/scene/Scene;ILkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 0

    invoke-static/range {p0 .. p7}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$17$0$NavDisplayKt__NavDisplayKt(ZLandroidx/navigation3/scene/Scene;ILkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$FtamQq0kBQcghfOVmrqo1s735fg(Ljava/util/List;Landroidx/navigation3/scene/Scene;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$5$0$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/navigation3/scene/Scene;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$IqxnKnNKGJ3S7yicEwTY5rtZvYw(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$18$0$NavDisplayKt__NavDisplayKt(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$QDmJQJGm0ECuF27r5__JEwOooFw(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p11}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$23$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$YI-sW_qz2b3neRnUf3RGQVbhQ8Q(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p12}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$6$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$fDy6QDLQqdsMxTNzhwAWPxpq-_M(Landroidx/navigation3/scene/Scene;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$19$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$kUL8fjaK_8Bv93jg2jn8gAzis90(Ljava/util/List;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$0$0$NavDisplayKt__NavDisplayKt(Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rYLZZDSYMdJAXsuD47z6osqj6mI(Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$20$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$u-anhkDun216Ne9lq5Vp5JBAEYY(Landroidx/navigation3/scene/OverlayScene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$22$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/OverlayScene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$vHGgVQed9cyotPcwpd-pKKWiBXE(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p15}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay$lambda$2$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
    .locals 54
    .param p0, "sceneState"    # Landroidx/navigation3/scene/SceneState;
    .param p1, "navigationEventState"    # Landroidx/navigationevent/compose/NavigationEventState;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p4, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p5, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p6, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p7, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/scene/SceneState<",
            "TT;>;",
            "Landroidx/navigationevent/compose/NavigationEventState<",
            "Landroidx/navigation3/scene/SceneInfo<",
            "TT;>;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 360
    move/from16 v9, p9

    move/from16 v10, p10

    const v0, -0x121c2265

    move-object/from16 v1, p8

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v1

    .end local p8    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    const-string v2, "C(NavDisplay)N(sceneState,navigationEventState,modifier,contentAlignment,sizeTransform,transitionSpec,popTransitionSpec,predictivePopTransitionSpec)362@17582L319,369@17924L52,374@18135L65,402@19204L64,403@19288L60,422@20212L2037,523@25089L547,544@25830L393,541@25691L38,553@26231L876,540@25653L1454,573@27207L654,573@27180L681,*595@28177L53,592@27992L238:NavDisplay.kt#fa4uso"

    invoke-static {v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v2, p9

    .local v2, "$dirty":I
    and-int/lit8 v3, v9, 0x6

    if-nez v3, :cond_1

    move-object/from16 v3, p0

    invoke-interface {v1, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v2, v5

    goto :goto_1

    :cond_1
    move-object/from16 v3, p0

    :goto_1
    and-int/lit8 v5, v9, 0x30

    if-nez v5, :cond_3

    move-object/from16 v5, p1

    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_2

    :cond_2
    const/16 v6, 0x10

    :goto_2
    or-int/2addr v2, v6

    goto :goto_3

    :cond_3
    move-object/from16 v5, p1

    :goto_3
    and-int/lit8 v6, v10, 0x4

    if-eqz v6, :cond_4

    or-int/lit16 v2, v2, 0x180

    move-object/from16 v7, p2

    goto :goto_5

    :cond_4
    and-int/lit16 v7, v9, 0x180

    if-nez v7, :cond_6

    move-object/from16 v7, p2

    invoke-interface {v1, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/16 v8, 0x100

    goto :goto_4

    :cond_5
    const/16 v8, 0x80

    :goto_4
    or-int/2addr v2, v8

    goto :goto_5

    :cond_6
    move-object/from16 v7, p2

    :goto_5
    and-int/lit8 v8, v10, 0x8

    if-eqz v8, :cond_7

    or-int/lit16 v2, v2, 0xc00

    move-object/from16 v11, p3

    goto :goto_7

    :cond_7
    and-int/lit16 v11, v9, 0xc00

    if-nez v11, :cond_9

    move-object/from16 v11, p3

    invoke-interface {v1, v11}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    const/16 v12, 0x800

    goto :goto_6

    :cond_8
    const/16 v12, 0x400

    :goto_6
    or-int/2addr v2, v12

    goto :goto_7

    :cond_9
    move-object/from16 v11, p3

    :goto_7
    and-int/lit8 v12, v10, 0x10

    if-eqz v12, :cond_a

    or-int/lit16 v2, v2, 0x6000

    move-object/from16 v13, p4

    goto :goto_9

    :cond_a
    and-int/lit16 v13, v9, 0x6000

    if-nez v13, :cond_c

    move-object/from16 v13, p4

    invoke-interface {v1, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    const/16 v14, 0x4000

    goto :goto_8

    :cond_b
    const/16 v14, 0x2000

    :goto_8
    or-int/2addr v2, v14

    goto :goto_9

    :cond_c
    move-object/from16 v13, p4

    :goto_9
    const/high16 v14, 0x30000

    and-int v15, v9, v14

    if-nez v15, :cond_f

    and-int/lit8 v15, v10, 0x20

    if-nez v15, :cond_d

    move-object/from16 v15, p5

    invoke-interface {v1, v15}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_e

    const/high16 v16, 0x20000

    goto :goto_a

    :cond_d
    move-object/from16 v15, p5

    :cond_e
    const/high16 v16, 0x10000

    :goto_a
    or-int v2, v2, v16

    goto :goto_b

    :cond_f
    move-object/from16 v15, p5

    :goto_b
    const/high16 v16, 0x180000

    and-int v17, v9, v16

    move/from16 v18, v14

    if-nez v17, :cond_12

    and-int/lit8 v17, v10, 0x40

    if-nez v17, :cond_10

    move-object/from16 v4, p6

    invoke-interface {v1, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_11

    const/high16 v19, 0x100000

    goto :goto_c

    :cond_10
    move-object/from16 v4, p6

    :cond_11
    const/high16 v19, 0x80000

    :goto_c
    or-int v2, v2, v19

    goto :goto_d

    :cond_12
    move-object/from16 v4, p6

    :goto_d
    const/high16 v19, 0xc00000

    and-int v20, v9, v19

    if-nez v20, :cond_15

    and-int/lit16 v14, v10, 0x80

    if-nez v14, :cond_13

    move-object/from16 v14, p7

    invoke-interface {v1, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_14

    const/high16 v21, 0x800000

    goto :goto_e

    :cond_13
    move-object/from16 v14, p7

    :cond_14
    const/high16 v21, 0x400000

    :goto_e
    or-int v2, v2, v21

    goto :goto_f

    :cond_15
    move-object/from16 v14, p7

    :goto_f
    const v21, 0x492493

    and-int v0, v2, v21

    move/from16 v21, v2

    .end local v2    # "$dirty":I
    .local v21, "$dirty":I
    const v2, 0x492492

    if-eq v0, v2, :cond_16

    const/4 v0, 0x1

    goto :goto_10

    :cond_16
    const/4 v0, 0x0

    :goto_10
    and-int/lit8 v2, v21, 0x1

    invoke-interface {v1, v0, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->startDefaults()V

    and-int/lit8 v0, v9, 0x1

    if-eqz v0, :cond_1b

    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_17

    goto :goto_12

    .line 345
    :cond_17
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v10, 0x20

    if-eqz v0, :cond_18

    const v0, -0x70001

    and-int v2, v21, v0

    .end local v21    # "$dirty":I
    .restart local v2    # "$dirty":I
    goto :goto_11

    .end local v2    # "$dirty":I
    .restart local v21    # "$dirty":I
    :cond_18
    move/from16 v2, v21

    .end local v21    # "$dirty":I
    .restart local v2    # "$dirty":I
    :goto_11
    and-int/lit8 v0, v10, 0x40

    if-eqz v0, :cond_19

    const v0, -0x380001

    and-int/2addr v2, v0

    :cond_19
    and-int/lit16 v0, v10, 0x80

    if-eqz v0, :cond_1a

    const v0, -0x1c00001

    and-int/2addr v0, v2

    move v6, v0

    move-object v12, v7

    move-object v0, v13

    move-object v2, v14

    move-object v14, v11

    .end local v2    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_15

    .end local v0    # "$dirty":I
    .restart local v2    # "$dirty":I
    :cond_1a
    move v6, v2

    move-object v12, v7

    move-object v0, v13

    move-object v2, v14

    move-object v14, v11

    goto :goto_15

    .line 360
    .end local v2    # "$dirty":I
    .restart local v21    # "$dirty":I
    :cond_1b
    :goto_12
    if-eqz v6, :cond_1c

    .line 348
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object v7, v0

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v7, "modifier":Landroidx/compose/ui/Modifier;
    :cond_1c
    if-eqz v8, :cond_1d

    .line 349
    sget-object v0, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/Alignment$Companion;->getTopStart()Landroidx/compose/ui/Alignment;

    move-result-object v0

    move-object v11, v0

    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v11, "contentAlignment":Landroidx/compose/ui/Alignment;
    :cond_1d
    if-eqz v12, :cond_1e

    .line 350
    const/4 v0, 0x0

    move-object v13, v0

    .end local p4    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v13, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    :cond_1e
    and-int/lit8 v0, v10, 0x20

    if-eqz v0, :cond_1f

    .line 352
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    .end local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v0, "transitionSpec":Lkotlin/jvm/functions/Function1;
    const v2, -0x70001

    and-int v2, v21, v2

    move-object v15, v0

    .end local v21    # "$dirty":I
    .restart local v2    # "$dirty":I
    goto :goto_13

    .line 350
    .end local v0    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v2    # "$dirty":I
    .restart local v21    # "$dirty":I
    .restart local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_1f
    move/from16 v2, v21

    .line 352
    .end local v21    # "$dirty":I
    .end local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v2    # "$dirty":I
    .local v15, "transitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_13
    and-int/lit8 v0, v10, 0x40

    if-eqz v0, :cond_20

    .line 354
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPopTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    .end local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v0, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    const v4, -0x380001

    and-int/2addr v2, v4

    goto :goto_14

    .line 352
    .end local v0    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_20
    move-object v0, v4

    .line 354
    .end local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v0    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_14
    and-int/lit16 v4, v10, 0x80

    if-eqz v4, :cond_21

    .line 359
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPredictivePopTransitionSpec()Lkotlin/jvm/functions/Function2;

    move-result-object v4

    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v4, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    const v6, -0x1c00001

    and-int/2addr v2, v6

    move v6, v2

    move-object v2, v4

    move-object v12, v7

    move-object v14, v11

    move-object v4, v0

    move-object v0, v13

    goto :goto_15

    .line 354
    .end local v4    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_21
    move-object v4, v0

    move v6, v2

    move-object v12, v7

    move-object v0, v13

    move-object v2, v14

    move-object v14, v11

    .line 345
    .end local v7    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v11    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v13    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v0, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v2, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v4, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v6, "$dirty":I
    .local v12, "modifier":Landroidx/compose/ui/Modifier;
    .local v14, "contentAlignment":Landroidx/compose/ui/Alignment;
    :goto_15
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    const/4 v8, -0x1

    if-eqz v7, :cond_22

    const-string v7, "androidx.navigation3.ui.NavDisplay (NavDisplay.kt:359)"

    const v11, -0x121c2265

    invoke-static {v11, v6, v8, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 362
    :cond_22
    invoke-virtual/range {p0 .. p0}, Landroidx/navigation3/scene/SceneState;->getCurrentScene()Landroidx/navigation3/scene/Scene;

    move-result-object v7

    .line 363
    .local v7, "scene":Landroidx/navigation3/scene/Scene;
    const v11, 0x4634afa

    const-string v13, "CC(remember):NavDisplay.kt#9igjgp"

    invoke-static {v1, v11, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v11, 0x0

    .local v11, "invalid$iv":Z
    move-object/from16 p2, v1

    .local p2, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 663
    .local v21, "$i$f$cache":I
    move/from16 p3, v8

    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v8

    .local v8, "it$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 664
    .local v22, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v8, v3, :cond_23

    .line 665
    const/4 v3, 0x0

    .line 367
    .local v3, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionState$1":I
    move/from16 p4, v3

    .end local v3    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionState$1":I
    .local p4, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionState$1":I
    new-instance v3, Landroidx/compose/animation/core/SeekableTransitionState;

    invoke-direct {v3, v7}, Landroidx/compose/animation/core/SeekableTransitionState;-><init>(Ljava/lang/Object;)V

    .line 665
    .end local p4    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionState$1":I
    nop

    .line 666
    .local v3, "value$iv":Ljava/lang/Object;
    move-object/from16 v5, p2

    .end local p2    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .local v5, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 667
    move-object v8, v3

    .end local v3    # "value$iv":Ljava/lang/Object;
    goto :goto_16

    .line 668
    .end local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .restart local p2    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    :cond_23
    move-object/from16 v5, p2

    .line 663
    .end local v8    # "it$iv":Ljava/lang/Object;
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p2    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .restart local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    :goto_16
    nop

    .line 363
    .end local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v11    # "invalid$iv":Z
    .end local v21    # "$i$f$cache":I
    move-object v3, v8

    check-cast v3, Landroidx/compose/animation/core/SeekableTransitionState;

    .local v3, "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 370
    move-object v5, v3

    check-cast v5, Landroidx/compose/animation/core/TransitionState;

    sget v8, Landroidx/compose/animation/core/SeekableTransitionState;->$stable:I

    or-int/lit8 v8, v8, 0x30

    const-string/jumbo v11, "scene"

    const/4 v9, 0x0

    invoke-static {v5, v11, v1, v8, v9}, Landroidx/compose/animation/core/TransitionKt;->rememberTransition(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/animation/core/Transition;

    move-result-object v11

    .line 375
    .local v11, "transition":Landroidx/compose/animation/core/Transition;
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/navigation3/scene/Scene;

    const v8, 0x4638f1c

    invoke-static {v1, v8, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    .local v5, "invalid$iv":Z
    move-object v8, v1

    .local v8, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 669
    .local v9, "$i$f$cache":I
    move/from16 p2, v5

    .end local v5    # "invalid$iv":Z
    .local p2, "invalid$iv":Z
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 670
    .local v21, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p2, :cond_25

    sget-object v22, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p4, v9

    .end local v9    # "$i$f$cache":I
    .local p4, "$i$f$cache":I
    invoke-virtual/range {v22 .. v22}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v5, v9, :cond_24

    goto :goto_17

    .line 674
    :cond_24
    goto :goto_18

    .line 670
    .end local p4    # "$i$f$cache":I
    .restart local v9    # "$i$f$cache":I
    :cond_25
    move/from16 p4, v9

    .line 671
    .end local v9    # "$i$f$cache":I
    .restart local p4    # "$i$f$cache":I
    :goto_17
    const/4 v9, 0x0

    .line 375
    .local v9, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionCurrentStateEntries$1":I
    invoke-virtual/range {p0 .. p0}, Landroidx/navigation3/scene/SceneState;->getEntries()Ljava/util/List;

    move-result-object v22

    check-cast v22, Ljava/lang/Iterable;

    invoke-static/range {v22 .. v22}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v9

    .line 671
    .end local v9    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$transitionCurrentStateEntries$1":I
    nop

    .line 672
    .local v9, "value$iv":Ljava/lang/Object;
    invoke-interface {v8, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 673
    move-object v5, v9

    .line 669
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v9    # "value$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_18
    nop

    .line 375
    .end local v8    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local p2    # "invalid$iv":Z
    .end local p4    # "$i$f$cache":I
    check-cast v5, Ljava/util/List;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 374
    nop

    .line 378
    .local v5, "transitionCurrentStateEntries":Ljava/util/List;
    invoke-virtual/range {p0 .. p0}, Landroidx/navigation3/scene/SceneState;->getPreviousScenes()Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->lastOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/navigation3/scene/Scene;

    .line 379
    .local v8, "previousScene":Landroidx/navigation3/scene/Scene;
    invoke-virtual/range {p1 .. p1}, Landroidx/navigationevent/compose/NavigationEventState;->getTransitionState()Landroidx/navigationevent/NavigationEventTransitionState;

    move-result-object v9

    .line 381
    .local v9, "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    move-object/from16 p2, v5

    .end local v5    # "transitionCurrentStateEntries":Ljava/util/List;
    .local p2, "transitionCurrentStateEntries":Ljava/util/List;
    instance-of v5, v9, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;

    if-eqz v5, :cond_26

    if-eqz v8, :cond_26

    const/16 v24, 0x1

    goto :goto_19

    :cond_26
    const/16 v24, 0x0

    :goto_19
    move/from16 v5, v24

    .line 383
    .local v5, "inPredictiveBack":Z
    nop

    .line 384
    instance-of v10, v9, Landroidx/navigationevent/NavigationEventTransitionState$Idle;

    if-eqz v10, :cond_27

    const/4 v10, 0x0

    goto :goto_1a

    .line 385
    :cond_27
    instance-of v10, v9, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;

    if-eqz v10, :cond_55

    move-object v10, v9

    check-cast v10, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;

    invoke-virtual {v10}, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;->getLatestEvent()Landroidx/navigationevent/NavigationEvent;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/navigationevent/NavigationEvent;->getProgress()F

    move-result v10

    .line 382
    :goto_1a
    nop

    .line 388
    .local v10, "progress":F
    nop

    .line 389
    move-object/from16 p4, v12

    .end local v12    # "modifier":Landroidx/compose/ui/Modifier;
    .local p4, "modifier":Landroidx/compose/ui/Modifier;
    instance-of v12, v9, Landroidx/navigationevent/NavigationEventTransitionState$Idle;

    if-eqz v12, :cond_28

    const/16 v26, 0x2

    goto :goto_1b

    .line 390
    :cond_28
    instance-of v12, v9, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;

    if-eqz v12, :cond_54

    move-object v12, v9

    check-cast v12, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;

    invoke-virtual {v12}, Landroidx/navigationevent/NavigationEventTransitionState$InProgress;->getLatestEvent()Landroidx/navigationevent/NavigationEvent;

    move-result-object v12

    invoke-virtual {v12}, Landroidx/navigationevent/NavigationEvent;->getSwipeEdge()I

    move-result v12

    move/from16 v26, v12

    .line 387
    :goto_1b
    move/from16 v12, v26

    .line 398
    .local v12, "swipeEdge":I
    move-object/from16 p5, v9

    .end local v9    # "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    .local p5, "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    move-object/from16 v9, p2

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$map$iv":Ljava/lang/Iterable;
    const/16 v21, 0x0

    .line 675
    .local v21, "$i$f$map":I
    move-object/from16 p6, v14

    .end local v14    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local p6, "contentAlignment":Landroidx/compose/ui/Alignment;
    new-instance v14, Ljava/util/ArrayList;

    move/from16 v22, v6

    .end local v6    # "$dirty":I
    .local v22, "$dirty":I
    const/16 v6, 0xa

    move-object/from16 p7, v0

    .end local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local p7, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    invoke-static {v9, v6}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {v14, v0}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v14

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v14, v9

    .local v14, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/16 v23, 0x0

    .line 676
    .local v23, "$i$f$mapTo":I
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_1c
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_29

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    .line 677
    .local v25, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v26, v25

    check-cast v26, Landroidx/navigation3/runtime/NavEntry;

    .local v26, "it":Landroidx/navigation3/runtime/NavEntry;
    const/16 v27, 0x0

    .line 398
    .local v27, "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$isPop$1":I
    invoke-virtual/range {v26 .. v26}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v6

    .line 677
    .end local v26    # "it":Landroidx/navigation3/runtime/NavEntry;
    .end local v27    # "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$isPop$1":I
    invoke-interface {v0, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v6, 0xa

    goto :goto_1c

    .line 678
    .end local v25    # "item$iv$iv":Ljava/lang/Object;
    :cond_29
    nop

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .end local v14    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v23    # "$i$f$mapTo":I
    check-cast v0, Ljava/util/List;

    .line 675
    nop

    .line 399
    .end local v9    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$map":I
    invoke-virtual/range {p0 .. p0}, Landroidx/navigation3/scene/SceneState;->getEntries()Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 679
    .local v9, "$i$f$map":I
    new-instance v14, Ljava/util/ArrayList;

    move/from16 v21, v9

    move-object/from16 v30, v15

    const/16 v9, 0xa

    .end local v9    # "$i$f$map":I
    .end local v15    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v21    # "$i$f$map":I
    .local v30, "transitionSpec":Lkotlin/jvm/functions/Function1;
    invoke-static {v6, v9}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    move-object v9, v14

    check-cast v9, Ljava/util/Collection;

    .local v9, "destination$iv$iv":Ljava/util/Collection;
    move-object v14, v6

    .restart local v14    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 680
    .local v15, "$i$f$mapTo":I
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_1d
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_2a

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    .line 681
    .local v24, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v25, v24

    check-cast v25, Landroidx/navigation3/runtime/NavEntry;

    .local v25, "it":Landroidx/navigation3/runtime/NavEntry;
    const/16 v26, 0x0

    .line 399
    .local v26, "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$isPop$2":I
    move-object/from16 v27, v6

    .end local v6    # "$this$map$iv":Ljava/lang/Iterable;
    .local v27, "$this$map$iv":Ljava/lang/Iterable;
    invoke-virtual/range {v25 .. v25}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v6

    .line 681
    .end local v25    # "it":Landroidx/navigation3/runtime/NavEntry;
    .end local v26    # "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$isPop$2":I
    invoke-interface {v9, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v6, v27

    goto :goto_1d

    .line 682
    .end local v24    # "item$iv$iv":Ljava/lang/Object;
    .end local v27    # "$this$map$iv":Ljava/lang/Iterable;
    .restart local v6    # "$this$map$iv":Ljava/lang/Iterable;
    :cond_2a
    move-object/from16 v27, v6

    .end local v6    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v9    # "destination$iv$iv":Ljava/util/Collection;
    .end local v14    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$mapTo":I
    .restart local v27    # "$this$map$iv":Ljava/lang/Iterable;
    move-object v6, v9

    check-cast v6, Ljava/util/List;

    .line 679
    nop

    .line 394
    .end local v21    # "$i$f$map":I
    .end local v27    # "$this$map$iv":Ljava/lang/Iterable;
    invoke-static {v0, v6}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->isPop$NavDisplayKt__NavDisplayKt(Ljava/util/List;Ljava/util/List;)Z

    move-result v28

    .line 393
    move/from16 v0, v28

    .line 403
    .local v0, "isPop":Z
    const v6, 0x46414bb

    invoke-static {v1, v6, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v6, 0x0

    .local v6, "invalid$iv":Z
    move-object v9, v1

    .local v9, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 683
    .local v14, "$i$f$cache":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 684
    .local v21, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v24, v6

    .end local v6    # "invalid$iv":Z
    .local v24, "invalid$iv":Z
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v15, v6, :cond_2b

    .line 685
    const/4 v6, 0x0

    .line 403
    .local v6, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneMap$1":I
    invoke-static {}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateMapOf()Landroidx/compose/runtime/snapshots/SnapshotStateMap;

    move-result-object v6

    .line 685
    .end local v6    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneMap$1":I
    nop

    .line 686
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v9, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 687
    move-object v15, v6

    .end local v6    # "value$iv":Ljava/lang/Object;
    goto :goto_1e

    .line 688
    :cond_2b
    nop

    .line 683
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v21    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_1e
    nop

    .line 403
    .end local v9    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local v24    # "invalid$iv":Z
    move-object v6, v15

    check-cast v6, Landroidx/compose/runtime/snapshots/SnapshotStateMap;

    .local v6, "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 404
    const v9, 0x4641f37

    invoke-static {v1, v9, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid$iv":Z
    move-object v14, v1

    .local v14, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 689
    .local v15, "$i$f$cache":I
    move/from16 v21, v9

    .end local v9    # "invalid$iv":Z
    .local v21, "invalid$iv":Z
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    .local v9, "it$iv":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 690
    .local v23, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v24, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v25, v15

    .end local v15    # "$i$f$cache":I
    .local v25, "$i$f$cache":I
    invoke-virtual/range {v24 .. v24}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v9, v15, :cond_2c

    .line 691
    const/4 v15, 0x0

    .line 404
    .local v15, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$zIndices$1":I
    invoke-static {}, Landroidx/collection/ObjectFloatMapKt;->mutableObjectFloatMapOf()Landroidx/collection/MutableObjectFloatMap;

    move-result-object v15

    .line 691
    .end local v15    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$zIndices$1":I
    nop

    .line 692
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 693
    move-object v9, v15

    .end local v15    # "value$iv":Ljava/lang/Object;
    goto :goto_1f

    .line 694
    :cond_2c
    nop

    .line 689
    .end local v9    # "it$iv":Ljava/lang/Object;
    .end local v23    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_1f
    nop

    .line 404
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v21    # "invalid$iv":Z
    .end local v25    # "$i$f$cache":I
    check-cast v9, Landroidx/collection/MutableObjectFloatMap;

    .local v9, "zIndices":Landroidx/collection/MutableObjectFloatMap;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 405
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    invoke-static {v14}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v14

    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/navigation3/scene/Scene;

    invoke-interface {v15}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v14

    .line 406
    .local v14, "initialKey":Lkotlin/Pair;
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-static {v15}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v15

    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Landroidx/navigation3/scene/Scene;

    move-object/from16 v31, v6

    .end local v6    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .local v31, "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    invoke-interface/range {v21 .. v21}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v15, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v6

    .line 407
    .local v6, "targetKey":Lkotlin/Pair;
    move-object v15, v14

    .local v15, "key$iv":Ljava/lang/Object;
    move-object/from16 v21, v9

    .local v21, "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    const/16 v23, 0x0

    .line 695
    .local v23, "$i$f$getOrPut":I
    move-object/from16 v29, v4

    move-object/from16 v4, v21

    .end local v21    # "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    .local v4, "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    .local v29, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    invoke-virtual {v4, v15}, Landroidx/collection/MutableObjectFloatMap;->findKeyIndex(Ljava/lang/Object;)I

    move-result v21

    .line 696
    .local v21, "index$iv":I
    if-ltz v21, :cond_2d

    .line 697
    move/from16 v28, v0

    .end local v0    # "isPop":Z
    .local v28, "isPop":Z
    iget-object v0, v4, Landroidx/collection/MutableObjectFloatMap;->values:[F

    aget v0, v0, v21

    goto :goto_20

    .line 699
    .end local v28    # "isPop":Z
    .restart local v0    # "isPop":Z
    :cond_2d
    move/from16 v28, v0

    .end local v0    # "isPop":Z
    .restart local v28    # "isPop":Z
    const/4 v0, 0x0

    .line 407
    .local v0, "$i$a$-getOrPut-NavDisplayKt__NavDisplayKt$NavDisplay$initialZIndex$1":I
    nop

    .line 699
    .end local v0    # "$i$a$-getOrPut-NavDisplayKt__NavDisplayKt$NavDisplay$initialZIndex$1":I
    const/4 v0, 0x0

    .line 700
    .local v0, "value$iv":F
    invoke-virtual {v4, v15, v0}, Landroidx/collection/MutableObjectFloatMap;->set(Ljava/lang/Object;F)V

    .line 701
    nop

    .line 407
    .end local v0    # "value$iv":F
    .end local v4    # "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    .end local v15    # "key$iv":Ljava/lang/Object;
    .end local v21    # "index$iv":I
    .end local v23    # "$i$f$getOrPut":I
    :goto_20
    nop

    .line 409
    .local v0, "initialZIndex":F
    nop

    .line 410
    invoke-static {v14, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    move v4, v0

    goto :goto_22

    .line 411
    :cond_2e
    if-nez v28, :cond_30

    if-eqz v5, :cond_2f

    goto :goto_21

    .line 412
    :cond_2f
    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v4, v0

    goto :goto_22

    .line 411
    :cond_30
    :goto_21
    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v4, v0, v4

    .line 409
    :goto_22
    nop

    .line 408
    nop

    .line 414
    .local v4, "targetZIndex":F
    move-object/from16 v15, v31

    check-cast v15, Ljava/util/Map;

    move/from16 v21, v0

    .end local v0    # "initialZIndex":F
    .local v21, "initialZIndex":F
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v15, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    invoke-virtual {v9, v6, v4}, Landroidx/collection/MutableObjectFloatMap;->set(Ljava/lang/Object;F)V

    .line 417
    invoke-virtual/range {p0 .. p0}, Landroidx/navigation3/scene/SceneState;->getOverlayScenes()Ljava/util/List;

    move-result-object v0

    .line 423
    .local v0, "overlayScenes":Ljava/util/List;
    invoke-virtual/range {v31 .. v31}, Landroidx/compose/runtime/snapshots/SnapshotStateMap;->entrySet()Ljava/util/Set;

    move-result-object v15

    check-cast v15, Ljava/lang/Iterable;

    invoke-static {v15}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v15

    move-object/from16 v23, v0

    check-cast v23, Ljava/lang/Iterable;

    move-object/from16 v32, v0

    .end local v0    # "overlayScenes":Ljava/util/List;
    .local v32, "overlayScenes":Ljava/util/List;
    invoke-static/range {v23 .. v23}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    move-object/from16 v33, v6

    .end local v6    # "targetKey":Lkotlin/Pair;
    .local v33, "targetKey":Lkotlin/Pair;
    invoke-virtual {v9}, Landroidx/collection/MutableObjectFloatMap;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v34, v14

    .end local v14    # "initialKey":Lkotlin/Pair;
    .local v34, "initialKey":Lkotlin/Pair;
    const v14, 0x4649a70

    invoke-static {v1, v14, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v15}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v0

    or-int/2addr v0, v14

    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v0, v6

    .local v0, "invalid$iv":Z
    move-object v6, v1

    .local v6, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 702
    .local v14, "$i$f$cache":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 703
    .local v23, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_32

    sget-object v24, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v25, v0

    .end local v0    # "invalid$iv":Z
    .local v25, "invalid$iv":Z
    invoke-virtual/range {v24 .. v24}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v15, v0, :cond_31

    goto :goto_23

    .line 725
    :cond_31
    move/from16 v40, v4

    move-object/from16 v37, v9

    move/from16 v38, v14

    goto/16 :goto_29

    .line 703
    .end local v25    # "invalid$iv":Z
    .restart local v0    # "invalid$iv":Z
    :cond_32
    move/from16 v25, v0

    .line 704
    .end local v0    # "invalid$iv":Z
    .restart local v25    # "invalid$iv":Z
    :goto_23
    const/4 v0, 0x0

    .line 424
    .local v0, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1":I
    invoke-static {}, Lkotlin/collections/MapsKt;->createMapBuilder()Ljava/util/Map;

    move-result-object v24

    move-object/from16 v26, v24

    .local v26, "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    const/16 v27, 0x0

    .line 425
    .local v27, "$i$a$-buildMap-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1":I
    new-instance v35, Ljava/util/ArrayList;

    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    move/from16 v36, v0

    .end local v0    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1":I
    .local v36, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1":I
    move-object/from16 v0, v35

    check-cast v0, Ljava/util/List;

    .line 427
    .local v0, "scenes":Ljava/util/List;
    invoke-virtual/range {v31 .. v31}, Landroidx/compose/runtime/snapshots/SnapshotStateMap;->entrySet()Ljava/util/Set;

    move-result-object v35

    check-cast v35, Ljava/lang/Iterable;

    .line 428
    move-object/from16 v37, v35

    .local v37, "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    const/16 v35, 0x0

    .line 705
    .local v35, "$i$f$sortedByDescending":I
    move/from16 v38, v14

    .end local v14    # "$i$f$cache":I
    .local v38, "$i$f$cache":I
    new-instance v14, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;

    invoke-direct {v14, v9}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;-><init>(Landroidx/collection/MutableObjectFloatMap;)V

    check-cast v14, Ljava/util/Comparator;

    move-object/from16 v39, v15

    move-object/from16 v15, v37

    .end local v37    # "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .local v15, "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .local v39, "it$iv":Ljava/lang/Object;
    invoke-static {v15, v14}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v14

    .end local v15    # "$this$sortedByDescending$iv":Ljava/lang/Iterable;
    .end local v35    # "$i$f$sortedByDescending":I
    check-cast v14, Ljava/lang/Iterable;

    .line 429
    nop

    .local v14, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 706
    .local v15, "$i$f$map":I
    move/from16 v35, v15

    .end local v15    # "$i$f$map":I
    .local v35, "$i$f$map":I
    new-instance v15, Ljava/util/ArrayList;

    move/from16 v40, v4

    move-object/from16 v37, v9

    const/16 v9, 0xa

    .end local v4    # "targetZIndex":F
    .end local v9    # "zIndices":Landroidx/collection/MutableObjectFloatMap;
    .local v37, "zIndices":Landroidx/collection/MutableObjectFloatMap;
    .local v40, "targetZIndex":F
    invoke-static {v14, v9}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v15, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v15

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination$iv$iv":Ljava/util/Collection;
    move-object v9, v14

    .local v9, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 707
    .local v15, "$i$f$mapTo":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v41

    :goto_24
    invoke-interface/range {v41 .. v41}, Ljava/util/Iterator;->hasNext()Z

    move-result v42

    if-eqz v42, :cond_33

    invoke-interface/range {v41 .. v41}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v42

    .line 708
    .local v42, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v43, v42

    check-cast v43, Ljava/util/Map$Entry;

    .local v43, "it":Ljava/util/Map$Entry;
    const/16 v44, 0x0

    .line 429
    .local v44, "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$2":I
    invoke-interface/range {v43 .. v43}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v45

    move-object/from16 v46, v9

    .end local v9    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .local v46, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    move-object/from16 v9, v45

    check-cast v9, Landroidx/navigation3/scene/Scene;

    .line 708
    .end local v43    # "it":Ljava/util/Map$Entry;
    .end local v44    # "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$2":I
    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v9, v46

    goto :goto_24

    .line 709
    .end local v42    # "item$iv$iv":Ljava/lang/Object;
    .end local v46    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .restart local v9    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    :cond_33
    move-object/from16 v46, v9

    .end local v4    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v15    # "$i$f$mapTo":I
    check-cast v4, Ljava/util/List;

    .line 706
    nop

    .end local v14    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v35    # "$i$f$map":I
    check-cast v4, Ljava/lang/Iterable;

    .line 430
    nop

    .local v4, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 710
    .local v9, "$i$f$forEach":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_25
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_35

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v35, v4

    .end local v4    # "$this$forEach$iv":Ljava/lang/Iterable;
    .local v15, "element$iv":Ljava/lang/Object;
    .local v35, "$this$forEach$iv":Ljava/lang/Iterable;
    move-object v4, v15

    check-cast v4, Landroidx/navigation3/scene/Scene;

    .local v4, "it":Landroidx/navigation3/scene/Scene;
    const/16 v41, 0x0

    .line 430
    .local v41, "$i$a$-forEach-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$3":I
    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v42

    if-nez v42, :cond_34

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 710
    .end local v4    # "it":Landroidx/navigation3/scene/Scene;
    .end local v41    # "$i$a$-forEach-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$3":I
    :cond_34
    move-object/from16 v4, v35

    .end local v15    # "element$iv":Ljava/lang/Object;
    goto :goto_25

    .line 711
    .end local v35    # "$this$forEach$iv":Ljava/lang/Iterable;
    .local v4, "$this$forEach$iv":Ljava/lang/Iterable;
    :cond_35
    move-object/from16 v35, v4

    .line 439
    .end local v4    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$forEach":I
    move-object/from16 v4, v32

    check-cast v4, Ljava/util/Collection;

    move-object v9, v0

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v4, v9}, Lkotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    .line 445
    .local v4, "scenesInZOrder":Ljava/util/List;
    new-instance v9, Ljava/util/LinkedHashSet;

    invoke-direct {v9}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v9, Ljava/util/Set;

    .line 451
    .local v9, "coveredEntryKeys":Ljava/util/Set;
    move-object v14, v4

    .local v14, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v15, 0x0

    .line 712
    .local v15, "$i$f$fastForEach":I
    const/16 v35, 0x0

    .local v35, "index$iv":I
    move-object/from16 v41, v14

    check-cast v41, Ljava/util/Collection;

    move-object/from16 v42, v0

    .end local v0    # "scenes":Ljava/util/List;
    .local v42, "scenes":Ljava/util/List;
    invoke-interface/range {v41 .. v41}, Ljava/util/Collection;->size()I

    move-result v0

    move-object/from16 v41, v4

    move/from16 v4, v35

    .end local v35    # "index$iv":I
    .local v4, "index$iv":I
    .local v41, "scenesInZOrder":Ljava/util/List;
    :goto_26
    if-ge v4, v0, :cond_39

    .line 713
    invoke-interface {v14, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v35

    .line 714
    .local v35, "item$iv":Ljava/lang/Object;
    move-object/from16 v43, v35

    check-cast v43, Landroidx/navigation3/scene/Scene;

    .local v43, "scene":Landroidx/navigation3/scene/Scene;
    const/16 v44, 0x0

    .line 453
    .local v44, "$i$a$-fastForEach-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4":I
    invoke-interface/range {v43 .. v43}, Landroidx/navigation3/scene/Scene;->getEntries()Ljava/util/List;

    move-result-object v45

    check-cast v45, Ljava/lang/Iterable;

    .line 454
    move-object/from16 v46, v45

    .local v46, "$this$map$iv":Ljava/lang/Iterable;
    const/16 v45, 0x0

    .line 715
    .local v45, "$i$f$map":I
    move/from16 v47, v0

    new-instance v0, Ljava/util/ArrayList;

    move/from16 v48, v4

    move-object/from16 p8, v14

    move-object/from16 v4, v46

    const/16 v14, 0xa

    move/from16 v46, v15

    .end local v14    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v15    # "$i$f$fastForEach":I
    .local v4, "$this$map$iv":Ljava/lang/Iterable;
    .local v46, "$i$f$fastForEach":I
    .local v48, "index$iv":I
    .local p8, "$this$fastForEach$iv":Ljava/util/List;
    invoke-static {v4, v14}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v0, v15}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v15, v4

    .local v15, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/16 v49, 0x0

    .line 716
    .local v49, "$i$f$mapTo":I
    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v50

    :goto_27
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v51

    if-eqz v51, :cond_36

    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v51

    .line 717
    .local v51, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v52, v51

    check-cast v52, Landroidx/navigation3/runtime/NavEntry;

    .local v52, "it":Landroidx/navigation3/runtime/NavEntry;
    const/16 v53, 0x0

    .line 454
    .local v53, "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4$newlyCoveredEntryKeys$1":I
    invoke-virtual/range {v52 .. v52}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v14

    .line 717
    .end local v52    # "it":Landroidx/navigation3/runtime/NavEntry;
    .end local v53    # "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4$newlyCoveredEntryKeys$1":I
    invoke-interface {v0, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v14, 0xa

    goto :goto_27

    .line 718
    .end local v51    # "item$iv$iv":Ljava/lang/Object;
    :cond_36
    nop

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .end local v15    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v49    # "$i$f$mapTo":I
    check-cast v0, Ljava/util/List;

    .line 715
    nop

    .end local v4    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v45    # "$i$f$map":I
    check-cast v0, Ljava/lang/Iterable;

    .line 455
    nop

    .local v0, "$this$filterNot$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 719
    .local v4, "$i$f$filterNot":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    check-cast v14, Ljava/util/Collection;

    .local v14, "destination$iv$iv":Ljava/util/Collection;
    move-object v15, v0

    .local v15, "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    const/16 v45, 0x0

    .line 720
    .local v45, "$i$f$filterNotTo":I
    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :goto_28
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_38

    move-object/from16 v50, v0

    .end local v0    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .local v50, "$this$filterNot$iv":Ljava/lang/Iterable;
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .local v0, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v51, v0

    .local v51, "p0":Ljava/lang/Object;
    const/16 v52, 0x0

    .line 455
    .local v52, "$i$a$-filterNot-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4$newlyCoveredEntryKeys$2":I
    move/from16 v53, v4

    move-object/from16 v4, v51

    .end local v51    # "p0":Ljava/lang/Object;
    .local v4, "p0":Ljava/lang/Object;
    .local v53, "$i$f$filterNot":I
    invoke-interface {v9, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 720
    .end local v4    # "p0":Ljava/lang/Object;
    .end local v52    # "$i$a$-filterNot-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4$newlyCoveredEntryKeys$2":I
    if-nez v4, :cond_37

    invoke-interface {v14, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_37
    move-object/from16 v0, v50

    move/from16 v4, v53

    goto :goto_28

    .line 721
    .end local v50    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v53    # "$i$f$filterNot":I
    .local v0, "$this$filterNot$iv":Ljava/lang/Iterable;
    .local v4, "$i$f$filterNot":I
    :cond_38
    move-object/from16 v50, v0

    move/from16 v53, v4

    .end local v0    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$filterNot":I
    .end local v14    # "destination$iv$iv":Ljava/util/Collection;
    .end local v15    # "$this$filterNotTo$iv$iv":Ljava/lang/Iterable;
    .end local v45    # "$i$f$filterNotTo":I
    .restart local v50    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .restart local v53    # "$i$f$filterNot":I
    move-object v0, v14

    check-cast v0, Ljava/util/List;

    .line 719
    nop

    .end local v50    # "$this$filterNot$iv":Ljava/lang/Iterable;
    .end local v53    # "$i$f$filterNot":I
    check-cast v0, Ljava/lang/Iterable;

    .line 456
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    .line 452
    nop

    .line 457
    .local v0, "newlyCoveredEntryKeys":Ljava/util/Set;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    invoke-interface/range {v43 .. v43}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v14

    invoke-static {v4, v14}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    move-object v14, v9

    check-cast v14, Ljava/lang/Iterable;

    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->toMutableSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v14

    move-object/from16 v15, v26

    .end local v26    # "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    .local v15, "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    invoke-interface {v15, v4, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    move-object v4, v0

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v9, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 459
    nop

    .line 714
    .end local v0    # "newlyCoveredEntryKeys":Ljava/util/Set;
    .end local v43    # "scene":Landroidx/navigation3/scene/Scene;
    .end local v44    # "$i$a$-fastForEach-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$4":I
    nop

    .line 712
    .end local v35    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v48, 0x1

    move-object/from16 v14, p8

    move/from16 v15, v46

    move/from16 v0, v47

    .end local v48    # "index$iv":I
    .local v4, "index$iv":I
    goto/16 :goto_26

    .end local v46    # "$i$f$fastForEach":I
    .end local p8    # "$this$fastForEach$iv":Ljava/util/List;
    .local v14, "$this$fastForEach$iv":Ljava/util/List;
    .local v15, "$i$f$fastForEach":I
    .restart local v26    # "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    :cond_39
    move/from16 v48, v4

    move-object/from16 p8, v14

    move/from16 v46, v15

    move-object/from16 v15, v26

    .line 722
    .end local v4    # "index$iv":I
    .end local v14    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v26    # "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    .local v15, "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    .restart local v46    # "$i$f$fastForEach":I
    .restart local p8    # "$this$fastForEach$iv":Ljava/util/List;
    nop

    .line 460
    .end local v46    # "$i$f$fastForEach":I
    .end local p8    # "$this$fastForEach$iv":Ljava/util/List;
    nop

    .line 424
    .end local v9    # "coveredEntryKeys":Ljava/util/Set;
    .end local v15    # "$this$NavDisplay_u24lambda_u2414_u240":Ljava/util/Map;
    .end local v27    # "$i$a$-buildMap-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1":I
    .end local v41    # "scenesInZOrder":Ljava/util/List;
    .end local v42    # "scenes":Ljava/util/List;
    invoke-static/range {v24 .. v24}, Lkotlin/collections/MapsKt;->build(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 460
    nop

    .line 704
    .end local v36    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1":I
    nop

    .line 723
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 724
    move-object v15, v0

    .line 702
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v23    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v39    # "it$iv":Ljava/lang/Object;
    :goto_29
    nop

    .line 423
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v25    # "invalid$iv":Z
    .end local v38    # "$i$f$cache":I
    check-cast v15, Ljava/util/Map;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 422
    move-object v0, v15

    .line 466
    .local v0, "sceneToExcludedEntryMap":Ljava/util/Map;
    cmpl-float v4, v21, v40

    if-ltz v4, :cond_3a

    .line 467
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/navigation3/scene/Scene;

    move-object/from16 v25, v4

    goto :goto_2a

    .line 469
    :cond_3a
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/navigation3/scene/Scene;

    move-object/from16 v25, v4

    .line 466
    :goto_2a
    nop

    .line 465
    move-object/from16 v4, v25

    .line 473
    .local v4, "transitionScene":Landroidx/navigation3/scene/Scene;
    if-eqz v5, :cond_3e

    const v9, -0x77ae2aeb

    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v9, ""

    invoke-static {v1, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 474
    invoke-virtual {v11}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3d

    const v9, -0x77ad596d

    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v9, "474@22698L148,474@22658L188"

    invoke-static {v1, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 475
    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const v14, 0x465c9cf

    invoke-static {v1, v14, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    invoke-interface {v1, v10}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v15

    or-int/2addr v14, v15

    invoke-interface {v1, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v14, v15

    .local v14, "invalid$iv":Z
    move-object v15, v1

    .local v15, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v23, 0x0

    .line 726
    .local v23, "$i$f$cache":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it$iv":Ljava/lang/Object;
    const/16 v24, 0x0

    .line 727
    .local v24, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v14, :cond_3c

    sget-object v25, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v26, v14

    .end local v14    # "invalid$iv":Z
    .local v26, "invalid$iv":Z
    invoke-virtual/range {v25 .. v25}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v6, v14, :cond_3b

    goto :goto_2b

    .line 731
    :cond_3b
    goto :goto_2c

    .line 727
    .end local v26    # "invalid$iv":Z
    .restart local v14    # "invalid$iv":Z
    :cond_3c
    move/from16 v26, v14

    .line 728
    .end local v14    # "invalid$iv":Z
    .restart local v26    # "invalid$iv":Z
    :goto_2b
    const/4 v14, 0x0

    .line 475
    .local v14, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$7":I
    move-object/from16 v25, v6

    .end local v6    # "it$iv":Ljava/lang/Object;
    .local v25, "it$iv":Ljava/lang/Object;
    new-instance v6, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$7$1;

    move/from16 v27, v14

    const/4 v14, 0x0

    .end local v14    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$7":I
    .local v27, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$7":I
    invoke-direct {v6, v3, v10, v8, v14}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$7$1;-><init>(Landroidx/compose/animation/core/SeekableTransitionState;FLandroidx/navigation3/scene/Scene;Lkotlin/coroutines/Continuation;)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    .line 728
    .end local v27    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$7":I
    nop

    .line 729
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v15, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 730
    nop

    .line 726
    .end local v6    # "value$iv":Ljava/lang/Object;
    .end local v24    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v25    # "it$iv":Ljava/lang/Object;
    :goto_2c
    nop

    .line 475
    .end local v15    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v23    # "$i$f$cache":I
    .end local v26    # "invalid$iv":Z
    check-cast v6, Lkotlin/jvm/functions/Function2;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v14, 0x0

    invoke-static {v8, v9, v6, v1, v14}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 474
    goto :goto_2d

    :cond_3d
    const v6, -0x79043879

    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_2d
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 473
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object/from16 v35, v8

    goto :goto_30

    .line 480
    :cond_3e
    const v6, -0x77a90d88

    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v6, "480@22900L2089,480@22878L2111"

    invoke-static {v1, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 481
    const v6, 0x465eaa4

    invoke-static {v1, v6, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v1, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    invoke-interface {v1, v11}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    .local v6, "invalid$iv":Z
    move-object v9, v1

    .local v9, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 732
    .local v14, "$i$f$cache":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 733
    .local v23, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v6, :cond_40

    sget-object v24, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v25, v6

    .end local v6    # "invalid$iv":Z
    .local v25, "invalid$iv":Z
    invoke-virtual/range {v24 .. v24}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v15, v6, :cond_3f

    goto :goto_2e

    .line 737
    :cond_3f
    move-object/from16 v35, v8

    goto :goto_2f

    .line 733
    .end local v25    # "invalid$iv":Z
    .restart local v6    # "invalid$iv":Z
    :cond_40
    move/from16 v25, v6

    .line 734
    .end local v6    # "invalid$iv":Z
    .restart local v25    # "invalid$iv":Z
    :goto_2e
    const/4 v6, 0x0

    .line 481
    .local v6, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$8":I
    move/from16 v24, v6

    .end local v6    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$8":I
    .local v24, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$8":I
    new-instance v6, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$8$1;

    move-object/from16 v35, v8

    const/4 v8, 0x0

    .end local v8    # "previousScene":Landroidx/navigation3/scene/Scene;
    .local v35, "previousScene":Landroidx/navigation3/scene/Scene;
    invoke-direct {v6, v3, v7, v11, v8}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$8$1;-><init>(Landroidx/compose/animation/core/SeekableTransitionState;Landroidx/navigation3/scene/Scene;Landroidx/compose/animation/core/Transition;Lkotlin/coroutines/Continuation;)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    .line 734
    .end local v24    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$8":I
    nop

    .line 735
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v9, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 736
    move-object v15, v6

    .line 732
    .end local v6    # "value$iv":Ljava/lang/Object;
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v23    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_2f
    nop

    .line 481
    .end local v9    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local v25    # "invalid$iv":Z
    check-cast v15, Lkotlin/jvm/functions/Function2;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v9, 0x0

    invoke-static {v7, v15, v1, v9}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 480
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    :goto_30
    nop

    .line 524
    const v6, 0x466f63e

    invoke-static {v1, v6, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v6

    invoke-interface {v1, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v6, v8

    invoke-interface {v1, v12}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v8

    or-int/2addr v6, v8

    const/high16 v8, 0x1c00000

    and-int v8, v22, v8

    xor-int v8, v8, v19

    const/high16 v9, 0x800000

    if-le v8, v9, :cond_41

    invoke-interface {v1, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_42

    :cond_41
    and-int v8, v22, v19

    const/high16 v9, 0x800000

    if-ne v8, v9, :cond_43

    :cond_42
    const/4 v8, 0x1

    goto :goto_31

    :cond_43
    const/4 v8, 0x0

    :goto_31
    or-int/2addr v6, v8

    move/from16 v8, v28

    .end local v28    # "isPop":Z
    .local v8, "isPop":Z
    invoke-interface {v1, v8}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v9

    or-int/2addr v6, v9

    const/high16 v9, 0x380000

    and-int v9, v22, v9

    xor-int v9, v9, v16

    const/high16 v14, 0x100000

    if-le v9, v14, :cond_44

    move-object/from16 v9, v29

    .end local v29    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v9, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_45

    goto :goto_32

    .end local v9    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v29    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_44
    move-object/from16 v9, v29

    .end local v29    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v9    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_32
    and-int v14, v22, v16

    const/high16 v15, 0x100000

    if-ne v14, v15, :cond_46

    :cond_45
    const/4 v14, 0x1

    goto :goto_33

    :cond_46
    const/4 v14, 0x0

    :goto_33
    or-int/2addr v6, v14

    const/high16 v14, 0x70000

    and-int v14, v22, v14

    xor-int v14, v14, v18

    const/high16 v15, 0x20000

    if-le v14, v15, :cond_48

    move-object/from16 v15, v30

    .end local v30    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v15, "transitionSpec":Lkotlin/jvm/functions/Function1;
    invoke-interface {v1, v15}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_47

    goto :goto_34

    :cond_47
    move-object/from16 v27, v2

    goto :goto_35

    .end local v15    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v30    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_48
    move-object/from16 v15, v30

    .end local v30    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_34
    and-int v14, v22, v18

    move-object/from16 v27, v2

    const/high16 v2, 0x20000

    .end local v2    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v27, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    if-ne v14, v2, :cond_49

    :goto_35
    const/4 v2, 0x1

    goto :goto_36

    :cond_49
    const/4 v2, 0x0

    :goto_36
    or-int/2addr v2, v6

    .local v2, "invalid$iv":Z
    move-object v6, v1

    .local v6, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 738
    .restart local v14    # "$i$f$cache":I
    move/from16 v16, v2

    .end local v2    # "invalid$iv":Z
    .local v16, "invalid$iv":Z
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    .local v2, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 739
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v16, :cond_4b

    sget-object v18, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v20, v3

    .end local v3    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .local v20, "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v2, v3, :cond_4a

    goto :goto_37

    .line 743
    :cond_4a
    move-object/from16 v25, v4

    move/from16 v24, v5

    move/from16 v28, v8

    move-object/from16 v29, v9

    move/from16 v26, v12

    move-object/from16 v30, v15

    goto :goto_38

    .line 739
    .end local v20    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .restart local v3    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    :cond_4b
    move-object/from16 v20, v3

    .line 740
    .end local v3    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .restart local v20    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    :goto_37
    const/4 v3, 0x0

    .line 524
    .local v3, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$contentTransform$1":I
    new-instance v23, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda4;

    move-object/from16 v25, v4

    move/from16 v24, v5

    move/from16 v28, v8

    move-object/from16 v29, v9

    move/from16 v26, v12

    move-object/from16 v30, v15

    .end local v4    # "transitionScene":Landroidx/navigation3/scene/Scene;
    .end local v5    # "inPredictiveBack":Z
    .end local v8    # "isPop":Z
    .end local v9    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v12    # "swipeEdge":I
    .end local v15    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v24, "inPredictiveBack":Z
    .local v25, "transitionScene":Landroidx/navigation3/scene/Scene;
    .local v26, "swipeEdge":I
    .restart local v28    # "isPop":Z
    .restart local v29    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v30    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    invoke-direct/range {v23 .. v30}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda4;-><init>(ZLandroidx/navigation3/scene/Scene;ILkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 740
    .end local v3    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$contentTransform$1":I
    move-object/from16 v3, v23

    .line 741
    .local v3, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 742
    move-object v2, v3

    .line 738
    .end local v2    # "it$iv":Ljava/lang/Object;
    .end local v3    # "value$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_38
    nop

    .line 524
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    .end local v16    # "invalid$iv":Z
    check-cast v2, Lkotlin/jvm/functions/Function1;

    .local v2, "contentTransform":Lkotlin/jvm/functions/Function1;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 541
    nop

    .line 544
    nop

    .line 545
    const v3, 0x4675244

    invoke-static {v1, v3, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    move/from16 v4, v40

    .end local v40    # "targetZIndex":F
    .local v4, "targetZIndex":F
    invoke-interface {v1, v4}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v5

    or-int/2addr v3, v5

    move-object/from16 v5, p7

    .end local p7    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v5, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v3, v6

    .local v3, "invalid$iv":Z
    move-object v6, v1

    .restart local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .line 744
    .local v8, "$i$f$cache":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    .local v9, "it$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 745
    .local v12, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v3, :cond_4d

    sget-object v14, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v14}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v9, v14, :cond_4c

    goto :goto_39

    .line 749
    :cond_4c
    goto :goto_3a

    .line 746
    :cond_4d
    :goto_39
    const/4 v14, 0x0

    .line 545
    .local v14, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$9":I
    new-instance v15, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;

    invoke-direct {v15, v2, v4, v5}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;-><init>(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;)V

    .line 746
    .end local v14    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$9":I
    nop

    .line 747
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 748
    move-object v9, v15

    .line 744
    .end local v9    # "it$iv":Ljava/lang/Object;
    .end local v12    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v15    # "value$iv":Ljava/lang/Object;
    :goto_3a
    nop

    .line 545
    .end local v3    # "invalid$iv":Z
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v8    # "$i$f$cache":I
    check-cast v9, Lkotlin/jvm/functions/Function1;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 543
    nop

    .line 542
    const v3, 0x4673f81

    invoke-static {v1, v3, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v3, 0x0

    .restart local v3    # "invalid$iv":Z
    move-object v6, v1

    .restart local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .line 750
    .restart local v8    # "$i$f$cache":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 751
    .local v14, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_4e

    .line 752
    const/4 v15, 0x0

    .local v15, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$10":I
    new-instance v16, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda6;

    invoke-direct/range {v16 .. v16}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda6;-><init>()V

    .end local v15    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$10":I
    move-object/from16 v15, v16

    .line 753
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 754
    move-object v12, v15

    .end local v15    # "value$iv":Ljava/lang/Object;
    goto :goto_3b

    .line 755
    :cond_4e
    nop

    .line 750
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_3b
    nop

    .line 542
    .end local v3    # "invalid$iv":Z
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v8    # "$i$f$cache":I
    move-object v15, v12

    check-cast v15, Lkotlin/jvm/functions/Function1;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 554
    new-instance v3, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda7;

    invoke-direct {v3, v11, v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda7;-><init>(Landroidx/compose/animation/core/Transition;Ljava/util/Map;)V

    const/16 v6, 0x36

    const v8, -0x45956e3c

    const/4 v12, 0x1

    invoke-static {v8, v12, v3, v1, v6}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Lkotlin/jvm/functions/Function4;

    shr-int/lit8 v3, v22, 0x3

    and-int/lit8 v3, v3, 0x70

    const v6, 0x36000

    or-int/2addr v3, v6

    move/from16 v6, v22

    .end local v22    # "$dirty":I
    .local v6, "$dirty":I
    and-int/lit16 v8, v6, 0x1c00

    or-int v18, v3, v8

    .line 541
    const/16 v19, 0x0

    move-object/from16 v12, p4

    move-object/from16 v14, p6

    move-object/from16 v17, v1

    move-object v1, v13

    move-object v13, v9

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p4    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p6    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v12, "modifier":Landroidx/compose/ui/Modifier;
    .local v14, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v17, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v11 .. v19}, Landroidx/compose/animation/AnimatedContentKt;->AnimatedContent(Landroidx/compose/animation/core/Transition;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)V

    .line 574
    move-object v3, v12

    move-object/from16 v12, v17

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v12, "$composer":Landroidx/compose/runtime/Composer;
    const v8, 0x467ff69

    invoke-static {v12, v8, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v12, v11}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    move-object/from16 v8, v37

    .end local v37    # "zIndices":Landroidx/collection/MutableObjectFloatMap;
    .local v8, "zIndices":Landroidx/collection/MutableObjectFloatMap;
    invoke-interface {v12, v8}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v1, v9

    .local v1, "invalid$iv":Z
    move-object v9, v12

    .local v9, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 756
    .local v13, "$i$f$cache":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 757
    .local v16, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v1, :cond_50

    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p4, v1

    .end local v1    # "invalid$iv":Z
    .local p4, "invalid$iv":Z
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v15, v1, :cond_4f

    goto :goto_3c

    .line 761
    :cond_4f
    move-object/from16 p7, v2

    move-object/from16 p8, v3

    move-object/from16 v2, v31

    goto :goto_3d

    .line 757
    .end local p4    # "invalid$iv":Z
    .restart local v1    # "invalid$iv":Z
    :cond_50
    move/from16 p4, v1

    .line 758
    .end local v1    # "invalid$iv":Z
    .restart local p4    # "invalid$iv":Z
    :goto_3c
    const/4 v1, 0x0

    .line 574
    .local v1, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$12":I
    move/from16 p6, v1

    .end local v1    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$12":I
    .local p6, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$12":I
    new-instance v1, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1;

    move-object/from16 p7, v2

    move-object/from16 p8, v3

    move-object/from16 v2, v31

    const/4 v3, 0x0

    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v31    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .local v2, "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .local p7, "contentTransform":Lkotlin/jvm/functions/Function1;
    .local p8, "modifier":Landroidx/compose/ui/Modifier;
    invoke-direct {v1, v11, v2, v8, v3}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1;-><init>(Landroidx/compose/animation/core/Transition;Landroidx/compose/runtime/snapshots/SnapshotStateMap;Landroidx/collection/MutableObjectFloatMap;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    .line 758
    .end local p6    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$12":I
    nop

    .line 759
    .local v1, "value$iv":Ljava/lang/Object;
    invoke-interface {v9, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 760
    move-object v15, v1

    .line 756
    .end local v1    # "value$iv":Ljava/lang/Object;
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_3d
    nop

    .line 574
    .end local v9    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    .end local p4    # "invalid$iv":Z
    check-cast v15, Lkotlin/jvm/functions/Function2;

    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v9, 0x0

    invoke-static {v11, v15, v12, v9}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 592
    move-object/from16 v1, v32

    .local v1, "$this$fastForEachReversed$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 762
    .local v3, "$i$f$fastForEachReversed":I
    move-object v9, v1

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-ltz v9, :cond_52

    :goto_3e
    move v13, v9

    .local v13, "index$iv":I
    add-int/lit8 v9, v9, -0x1

    .line 763
    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 764
    .local v15, "item$iv":Ljava/lang/Object;
    move-object/from16 p4, v1

    .end local v1    # "$this$fastForEachReversed$iv":Ljava/util/List;
    .local p4, "$this$fastForEachReversed$iv":Ljava/util/List;
    move-object v1, v15

    check-cast v1, Landroidx/navigation3/scene/OverlayScene;

    .local v1, "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    const/16 v16, 0x0

    .line 594
    .local v16, "$i$a$-fastForEachReversed-NavDisplayKt__NavDisplayKt$NavDisplay$13":I
    move-object/from16 v31, v2

    .end local v2    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .restart local v31    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    invoke-static {}, Landroidx/navigation3/scene/SceneSetupNavEntryDecoratorKt;->getLocalEntriesToExcludeFromCurrentScene()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v2

    .line 595
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    move/from16 p6, v3

    .end local v3    # "$i$f$fastForEachReversed":I
    .local p6, "$i$f$fastForEachReversed":I
    invoke-static/range {v17 .. v17}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v3

    move/from16 v40, v4

    .end local v4    # "targetZIndex":F
    .restart local v40    # "targetZIndex":F
    invoke-interface {v1}, Landroidx/navigation3/scene/OverlayScene;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    invoke-static {v0, v3}, Lkotlin/collections/MapsKt;->getValue(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 594
    invoke-virtual {v2, v3}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v2

    .line 596
    new-instance v3, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda8;

    invoke-direct {v3, v1}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda8;-><init>(Landroidx/navigation3/scene/OverlayScene;)V

    const/16 v4, 0x36

    move-object/from16 v17, v0

    .end local v0    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .local v17, "sceneToExcludedEntryMap":Ljava/util/Map;
    const v0, 0x1ce9119c

    move-object/from16 v18, v1

    const/4 v1, 0x1

    .end local v1    # "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    .local v18, "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    invoke-static {v0, v1, v3, v12, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function2;

    sget v3, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v3, v3, 0x30

    .line 593
    invoke-static {v2, v0, v12, v3}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider(Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 599
    nop

    .line 764
    .end local v16    # "$i$a$-fastForEachReversed-NavDisplayKt__NavDisplayKt$NavDisplay$13":I
    .end local v18    # "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    nop

    .line 762
    .end local v15    # "item$iv":Ljava/lang/Object;
    if-gez v9, :cond_51

    goto :goto_3f

    :cond_51
    move-object/from16 v1, p4

    move/from16 v3, p6

    move-object/from16 v0, v17

    move-object/from16 v2, v31

    move/from16 v4, v40

    goto :goto_3e

    .end local v13    # "index$iv":I
    .end local v17    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .end local v31    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .end local v40    # "targetZIndex":F
    .end local p4    # "$this$fastForEachReversed$iv":Ljava/util/List;
    .end local p6    # "$i$f$fastForEachReversed":I
    .restart local v0    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .local v1, "$this$fastForEachReversed$iv":Ljava/util/List;
    .restart local v2    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .restart local v3    # "$i$f$fastForEachReversed":I
    .restart local v4    # "targetZIndex":F
    :cond_52
    move-object/from16 v17, v0

    move-object/from16 p4, v1

    move-object/from16 v31, v2

    move/from16 p6, v3

    move/from16 v40, v4

    .line 766
    .end local v0    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .end local v1    # "$this$fastForEachReversed$iv":Ljava/util/List;
    .end local v2    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .end local v3    # "$i$f$fastForEachReversed":I
    .end local v4    # "targetZIndex":F
    .restart local v17    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .restart local v31    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .restart local v40    # "targetZIndex":F
    .restart local p4    # "$this$fastForEachReversed$iv":Ljava/util/List;
    .restart local p6    # "$i$f$fastForEachReversed":I
    :goto_3f
    nop

    .end local p4    # "$this$fastForEachReversed$iv":Ljava/util/List;
    .end local p6    # "$i$f$fastForEachReversed":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_53

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 600
    .end local v7    # "scene":Landroidx/navigation3/scene/Scene;
    .end local v8    # "zIndices":Landroidx/collection/MutableObjectFloatMap;
    .end local v10    # "progress":F
    .end local v11    # "transition":Landroidx/compose/animation/core/Transition;
    .end local v17    # "sceneToExcludedEntryMap":Ljava/util/Map;
    .end local v20    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .end local v21    # "initialZIndex":F
    .end local v24    # "inPredictiveBack":Z
    .end local v25    # "transitionScene":Landroidx/navigation3/scene/Scene;
    .end local v26    # "swipeEdge":I
    .end local v28    # "isPop":Z
    .end local v31    # "sceneMap":Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .end local v32    # "overlayScenes":Ljava/util/List;
    .end local v33    # "targetKey":Lkotlin/Pair;
    .end local v34    # "initialKey":Lkotlin/Pair;
    .end local v35    # "previousScene":Landroidx/navigation3/scene/Scene;
    .end local v40    # "targetZIndex":F
    .end local p2    # "transitionCurrentStateEntries":Ljava/util/List;
    .end local p5    # "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    .end local p7    # "contentTransform":Lkotlin/jvm/functions/Function1;
    :cond_53
    move-object/from16 v3, p8

    move/from16 v21, v6

    move-object v4, v14

    move-object/from16 v8, v27

    move-object/from16 v7, v29

    move-object/from16 v6, v30

    goto :goto_40

    .line 388
    .end local v12    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v27    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .end local v29    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v30    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p8    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v3, "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .local v4, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v5, "inPredictiveBack":Z
    .restart local v7    # "scene":Landroidx/navigation3/scene/Scene;
    .local v8, "previousScene":Landroidx/navigation3/scene/Scene;
    .local v9, "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    .restart local v10    # "progress":F
    .restart local v11    # "transition":Landroidx/compose/animation/core/Transition;
    .local v15, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p2    # "transitionCurrentStateEntries":Ljava/util/List;
    .local p4, "modifier":Landroidx/compose/ui/Modifier;
    :cond_54
    move/from16 v24, v5

    move-object v5, v0

    .end local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v5, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .restart local v24    # "inPredictiveBack":Z
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 383
    .end local v10    # "progress":F
    .end local v24    # "inPredictiveBack":Z
    .end local p4    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v5, "inPredictiveBack":Z
    .local v12, "modifier":Landroidx/compose/ui/Modifier;
    :cond_55
    move/from16 v24, v5

    move-object v5, v0

    .end local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v5, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .restart local v24    # "inPredictiveBack":Z
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 345
    .end local v2    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .end local v3    # "transitionState":Landroidx/compose/animation/core/SeekableTransitionState;
    .end local v4    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v5    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local v6    # "$dirty":I
    .end local v7    # "scene":Landroidx/navigation3/scene/Scene;
    .end local v8    # "previousScene":Landroidx/navigation3/scene/Scene;
    .end local v9    # "gestureTransition":Landroidx/navigationevent/NavigationEventTransitionState;
    .end local v11    # "transition":Landroidx/compose/animation/core/Transition;
    .end local v12    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v14    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v15    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v24    # "inPredictiveBack":Z
    .local v21, "$dirty":I
    .local p2, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local p4, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local p5, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local p6, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local p7, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_56
    move-object v12, v1

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v12, "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v3, v7

    move-object v5, v13

    move-object v8, v14

    move-object v6, v15

    move-object v7, v4

    move-object v4, v11

    .line 600
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local p4    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local v5    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v6, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v7, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v8, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :goto_40
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v11

    if-eqz v11, :cond_57

    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda9;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-direct/range {v0 .. v10}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda9;-><init>(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;II)V

    invoke-interface {v11, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_57
    return-void
.end method

.method public static final NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V
    .locals 27
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p3, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p4, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p5, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p6, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p7, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p8, "onBack"    # Lkotlin/jvm/functions/Function0;
    .param p9, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p10, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 284
    move-object/from16 v1, p0

    move-object/from16 v9, p8

    move/from16 v10, p10

    move/from16 v11, p11

    const v0, -0x5873aba8

    move-object/from16 v2, p9

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .end local p9    # "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(NavDisplay)N(entries,modifier,contentAlignment,sceneStrategy,sizeTransform,transitionSpec,popTransitionSpec,predictivePopTransitionSpec,onBack)286@14333L50,293@14604L86,298@14835L426,295@14696L572,307@15274L214:NavDisplay.kt#fa4uso"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p10

    .local v3, "$dirty":I
    and-int/lit8 v4, v10, 0x6

    if-nez v4, :cond_1

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v3, v4

    :cond_1
    and-int/lit8 v4, v11, 0x2

    if-eqz v4, :cond_2

    or-int/lit8 v3, v3, 0x30

    move-object/from16 v5, p1

    goto :goto_2

    :cond_2
    and-int/lit8 v5, v10, 0x30

    if-nez v5, :cond_4

    move-object/from16 v5, p1

    invoke-interface {v2, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x20

    goto :goto_1

    :cond_3
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v3, v6

    goto :goto_2

    :cond_4
    move-object/from16 v5, p1

    :goto_2
    and-int/lit8 v6, v11, 0x4

    if-eqz v6, :cond_5

    or-int/lit16 v3, v3, 0x180

    move-object/from16 v7, p2

    goto :goto_4

    :cond_5
    and-int/lit16 v7, v10, 0x180

    if-nez v7, :cond_7

    move-object/from16 v7, p2

    invoke-interface {v2, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x100

    goto :goto_3

    :cond_6
    const/16 v8, 0x80

    :goto_3
    or-int/2addr v3, v8

    goto :goto_4

    :cond_7
    move-object/from16 v7, p2

    :goto_4
    and-int/lit16 v8, v10, 0xc00

    if-nez v8, :cond_a

    and-int/lit8 v8, v11, 0x8

    if-nez v8, :cond_8

    move-object/from16 v8, p3

    invoke-interface {v2, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    const/16 v12, 0x800

    goto :goto_5

    :cond_8
    move-object/from16 v8, p3

    :cond_9
    const/16 v12, 0x400

    :goto_5
    or-int/2addr v3, v12

    goto :goto_6

    :cond_a
    move-object/from16 v8, p3

    :goto_6
    and-int/lit8 v12, v11, 0x10

    if-eqz v12, :cond_b

    or-int/lit16 v3, v3, 0x6000

    move-object/from16 v13, p4

    goto :goto_8

    :cond_b
    and-int/lit16 v13, v10, 0x6000

    if-nez v13, :cond_d

    move-object/from16 v13, p4

    invoke-interface {v2, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    const/16 v14, 0x4000

    goto :goto_7

    :cond_c
    const/16 v14, 0x2000

    :goto_7
    or-int/2addr v3, v14

    goto :goto_8

    :cond_d
    move-object/from16 v13, p4

    :goto_8
    const/high16 v14, 0x30000

    and-int/2addr v14, v10

    if-nez v14, :cond_10

    and-int/lit8 v14, v11, 0x20

    if-nez v14, :cond_e

    move-object/from16 v14, p5

    invoke-interface {v2, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f

    const/high16 v15, 0x20000

    goto :goto_9

    :cond_e
    move-object/from16 v14, p5

    :cond_f
    const/high16 v15, 0x10000

    :goto_9
    or-int/2addr v3, v15

    goto :goto_a

    :cond_10
    move-object/from16 v14, p5

    :goto_a
    const/high16 v15, 0x180000

    and-int/2addr v15, v10

    if-nez v15, :cond_13

    and-int/lit8 v15, v11, 0x40

    if-nez v15, :cond_11

    move-object/from16 v15, p6

    invoke-interface {v2, v15}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_12

    const/high16 v16, 0x100000

    goto :goto_b

    :cond_11
    move-object/from16 v15, p6

    :cond_12
    const/high16 v16, 0x80000

    :goto_b
    or-int v3, v3, v16

    goto :goto_c

    :cond_13
    move-object/from16 v15, p6

    :goto_c
    const/high16 v16, 0xc00000

    and-int v16, v10, v16

    if-nez v16, :cond_16

    and-int/lit16 v0, v11, 0x80

    if-nez v0, :cond_14

    move-object/from16 v0, p7

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_15

    const/high16 v17, 0x800000

    goto :goto_d

    :cond_14
    move-object/from16 v0, p7

    :cond_15
    const/high16 v17, 0x400000

    :goto_d
    or-int v3, v3, v17

    goto :goto_e

    :cond_16
    move-object/from16 v0, p7

    :goto_e
    const/high16 v17, 0x6000000

    and-int v17, v10, v17

    if-nez v17, :cond_18

    invoke-interface {v2, v9}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_17

    const/high16 v17, 0x4000000

    goto :goto_f

    :cond_17
    const/high16 v17, 0x2000000

    :goto_f
    or-int v3, v3, v17

    :cond_18
    const v17, 0x2492493

    and-int v0, v3, v17

    move/from16 v17, v4

    const v4, 0x2492492

    const/16 v18, 0x0

    const/16 v19, 0x1

    if-eq v0, v4, :cond_19

    move/from16 v0, v19

    goto :goto_10

    :cond_19
    move/from16 v0, v18

    :goto_10
    and-int/lit8 v4, v3, 0x1

    invoke-interface {v2, v0, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->startDefaults()V

    and-int/lit8 v0, v10, 0x1

    const v4, -0x1c00001

    const v20, -0x380001

    const v21, -0x70001

    if-eqz v0, :cond_1f

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_1a

    goto :goto_11

    .line 268
    :cond_1a
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v11, 0x8

    if-eqz v0, :cond_1b

    and-int/lit16 v3, v3, -0x1c01

    :cond_1b
    and-int/lit8 v0, v11, 0x20

    if-eqz v0, :cond_1c

    and-int v3, v3, v21

    :cond_1c
    and-int/lit8 v0, v11, 0x40

    if-eqz v0, :cond_1d

    and-int v3, v3, v20

    :cond_1d
    and-int/lit16 v0, v11, 0x80

    if-eqz v0, :cond_1e

    and-int v0, v3, v4

    move v3, v0

    move-object/from16 v16, v13

    move-object/from16 v17, v14

    move/from16 v0, v18

    move/from16 v4, v19

    move-object/from16 v19, p7

    move-object v14, v5

    move-object/from16 v18, v15

    const v5, -0x5873aba8

    move-object v15, v7

    .end local v3    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_12

    .end local v0    # "$dirty":I
    .restart local v3    # "$dirty":I
    :cond_1e
    move-object/from16 v16, v13

    move-object/from16 v17, v14

    move/from16 v0, v18

    move/from16 v4, v19

    move-object/from16 v19, p7

    move-object v14, v5

    move-object/from16 v18, v15

    const v5, -0x5873aba8

    move-object v15, v7

    goto/16 :goto_12

    .line 284
    :cond_1f
    :goto_11
    if-eqz v17, :cond_20

    .line 270
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object v5, v0

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v5, "modifier":Landroidx/compose/ui/Modifier;
    :cond_20
    if-eqz v6, :cond_21

    .line 271
    sget-object v0, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/Alignment$Companion;->getTopStart()Landroidx/compose/ui/Alignment;

    move-result-object v0

    move-object v7, v0

    .end local p2    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v7, "contentAlignment":Landroidx/compose/ui/Alignment;
    :cond_21
    and-int/lit8 v0, v11, 0x8

    if-eqz v0, :cond_22

    .line 272
    new-instance v0, Landroidx/navigation3/scene/SinglePaneSceneStrategy;

    invoke-direct {v0}, Landroidx/navigation3/scene/SinglePaneSceneStrategy;-><init>()V

    check-cast v0, Landroidx/navigation3/scene/SceneStrategy;

    .end local p3    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v0, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    and-int/lit16 v3, v3, -0x1c01

    move-object v8, v0

    .end local v0    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v8, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    :cond_22
    if-eqz v12, :cond_23

    .line 273
    const/4 v0, 0x0

    move-object v13, v0

    .end local p4    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v13, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    :cond_23
    and-int/lit8 v0, v11, 0x20

    if-eqz v0, :cond_24

    .line 275
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    .end local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v0, "transitionSpec":Lkotlin/jvm/functions/Function1;
    and-int v3, v3, v21

    move-object v14, v0

    .end local v0    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v14, "transitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_24
    and-int/lit8 v0, v11, 0x40

    if-eqz v0, :cond_25

    .line 277
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPopTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    .end local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v0, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    and-int v3, v3, v20

    move-object v15, v0

    .end local v0    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v15, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_25
    and-int/lit16 v0, v11, 0x80

    if-eqz v0, :cond_26

    .line 282
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPredictivePopTransitionSpec()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v0, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    and-int/2addr v3, v4

    move-object/from16 v16, v13

    move-object/from16 v17, v14

    move/from16 v4, v19

    move-object/from16 v19, v0

    move-object v14, v5

    move/from16 v0, v18

    const v5, -0x5873aba8

    move-object/from16 v18, v15

    move-object v15, v7

    goto :goto_12

    .line 277
    .end local v0    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_26
    move-object/from16 v16, v13

    move-object/from16 v17, v14

    move/from16 v0, v18

    move/from16 v4, v19

    move-object/from16 v19, p7

    move-object v14, v5

    move-object/from16 v18, v15

    const v5, -0x5873aba8

    move-object v15, v7

    .line 268
    .end local v5    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v7    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v13    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v14, "modifier":Landroidx/compose/ui/Modifier;
    .local v15, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v16, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v17, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v18, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v19, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :goto_12
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v6

    if-eqz v6, :cond_27

    const/4 v6, -0x1

    const-string v7, "androidx.navigation3.ui.NavDisplay (NavDisplay.kt:283)"

    invoke-static {v5, v3, v6, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 285
    :cond_27
    move-object v5, v1

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2d

    .line 287
    and-int/lit8 v5, v3, 0xe

    shr-int/lit8 v6, v3, 0x6

    and-int/lit8 v6, v6, 0x70

    or-int/2addr v5, v6

    shr-int/lit8 v6, v3, 0x12

    and-int/lit16 v6, v6, 0x380

    or-int/2addr v5, v6

    invoke-static {v1, v8, v9, v2, v5}, Landroidx/navigation3/scene/SceneStateKt;->rememberSceneState(Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/scene/SceneState;

    move-result-object v12

    .line 288
    .local v12, "sceneState":Landroidx/navigation3/scene/SceneState;
    invoke-virtual {v12}, Landroidx/navigation3/scene/SceneState;->getCurrentScene()Landroidx/navigation3/scene/Scene;

    move-result-object v5

    .line 291
    .local v5, "scene":Landroidx/navigation3/scene/Scene;
    new-instance v6, Landroidx/navigation3/scene/SceneInfo;

    invoke-direct {v6, v5}, Landroidx/navigation3/scene/SceneInfo;-><init>(Landroidx/navigation3/scene/Scene;)V

    .line 292
    .local v6, "currentInfo":Landroidx/navigation3/scene/SceneInfo;
    invoke-virtual {v12}, Landroidx/navigation3/scene/SceneState;->getPreviousScenes()Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 653
    .local v13, "$i$f$map":I
    new-instance v0, Ljava/util/ArrayList;

    move/from16 v20, v4

    const/16 v4, 0xa

    invoke-static {v7, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v4, v7

    .local v4, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/16 v21, 0x0

    .line 654
    .local v21, "$i$f$mapTo":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_13
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_28

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    .line 655
    .local v23, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v24, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v2, v23

    check-cast v2, Landroidx/navigation3/scene/Scene;

    .local v2, "it":Landroidx/navigation3/scene/Scene;
    const/16 v25, 0x0

    .line 292
    .local v25, "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$previousSceneInfos$1":I
    move/from16 v26, v3

    .end local v3    # "$dirty":I
    .local v26, "$dirty":I
    new-instance v3, Landroidx/navigation3/scene/SceneInfo;

    invoke-direct {v3, v2}, Landroidx/navigation3/scene/SceneInfo;-><init>(Landroidx/navigation3/scene/Scene;)V

    .line 655
    .end local v2    # "it":Landroidx/navigation3/scene/Scene;
    .end local v25    # "$i$a$-map-NavDisplayKt__NavDisplayKt$NavDisplay$previousSceneInfos$1":I
    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, v24

    move/from16 v3, v26

    goto :goto_13

    .line 656
    .end local v23    # "item$iv$iv":Ljava/lang/Object;
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v26    # "$dirty":I
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$dirty":I
    :cond_28
    move-object/from16 v24, v2

    move/from16 v26, v3

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v3    # "$dirty":I
    .end local v4    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v21    # "$i$f$mapTo":I
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v26    # "$dirty":I
    check-cast v0, Ljava/util/List;

    .line 653
    nop

    .line 292
    .end local v7    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v13    # "$i$f$map":I
    nop

    .line 294
    .local v0, "previousSceneInfos":Ljava/util/List;
    move-object v2, v6

    check-cast v2, Landroidx/navigationevent/NavigationEventInfo;

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v7, 0x0

    move-object/from16 p2, v0

    move-object/from16 p1, v2

    move/from16 p5, v3

    move/from16 p6, v4

    move-object/from16 p3, v7

    move-object/from16 p4, v24

    .end local v0    # "previousSceneInfos":Ljava/util/List;
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .local p2, "previousSceneInfos":Ljava/util/List;
    .local p4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p1 .. p6}, Landroidx/navigationevent/compose/RememberNavigationEventStateKt;->rememberNavigationEventState(Landroidx/navigationevent/NavigationEventInfo;Ljava/util/List;Ljava/util/List;Landroidx/compose/runtime/Composer;II)Landroidx/navigationevent/compose/NavigationEventState;

    move-result-object v13

    .line 293
    move-object/from16 v2, p2

    move-object/from16 v0, p4

    .line 297
    .end local p2    # "previousSceneInfos":Ljava/util/List;
    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v0, "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "previousSceneInfos":Ljava/util/List;
    .local v13, "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    nop

    .line 298
    invoke-interface {v5}, Landroidx/navigation3/scene/Scene;->getPreviousEntries()Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    .line 299
    const v4, -0xa36b9be

    const-string v7, "CC(remember):NavDisplay.kt#9igjgp"

    invoke-static {v0, v4, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v0, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v4

    invoke-interface {v0, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v4, v7

    const/high16 v7, 0xe000000

    and-int v7, v26, v7

    move-object/from16 v24, v0

    const/high16 v0, 0x4000000

    .end local v0    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    if-ne v7, v0, :cond_29

    goto :goto_14

    :cond_29
    const/16 v20, 0x0

    :goto_14
    or-int v0, v4, v20

    .local v0, "invalid$iv":Z
    move-object/from16 v4, v24

    .local v4, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 657
    .local v7, "$i$f$cache":I
    move/from16 p1, v0

    .end local v0    # "invalid$iv":Z
    .local p1, "invalid$iv":Z
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v20, 0x0

    .line 658
    .local v20, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p1, :cond_2b

    sget-object v21, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p9, v2

    .end local v2    # "previousSceneInfos":Ljava/util/List;
    .local p9, "previousSceneInfos":Ljava/util/List;
    invoke-virtual/range {v21 .. v21}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v0, v2, :cond_2a

    goto :goto_15

    .line 662
    :cond_2a
    goto :goto_16

    .line 658
    .end local p9    # "previousSceneInfos":Ljava/util/List;
    .restart local v2    # "previousSceneInfos":Ljava/util/List;
    :cond_2b
    move-object/from16 p9, v2

    .line 659
    .end local v2    # "previousSceneInfos":Ljava/util/List;
    .restart local p9    # "previousSceneInfos":Ljava/util/List;
    :goto_15
    const/4 v2, 0x0

    .line 299
    .local v2, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$5":I
    move-object/from16 p2, v0

    .end local v0    # "it$iv":Ljava/lang/Object;
    .local p2, "it$iv":Ljava/lang/Object;
    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda10;

    invoke-direct {v0, v1, v5, v9}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda10;-><init>(Ljava/util/List;Landroidx/navigation3/scene/Scene;Lkotlin/jvm/functions/Function0;)V

    .line 659
    .end local v2    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$5":I
    nop

    .line 660
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 661
    nop

    .line 657
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v20    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local p2    # "it$iv":Ljava/lang/Object;
    :goto_16
    nop

    .line 299
    .end local v4    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v7    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-static/range {v24 .. v24}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 296
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x4

    move-object/from16 p4, v0

    move-object/from16 p3, v2

    move/from16 p2, v3

    move/from16 p6, v4

    move/from16 p7, v7

    move-object/from16 p1, v13

    move-object/from16 p5, v24

    .end local v13    # "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .local p1, "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    .local p5, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p1 .. p7}, Landroidx/navigationevent/compose/NavigationEventHandlerKt;->NavigationBackHandler(Landroidx/navigationevent/compose/NavigationEventState;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    .line 309
    .end local p1    # "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v13    # "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    nop

    .line 310
    nop

    .line 311
    nop

    .line 312
    nop

    .line 313
    nop

    .line 314
    nop

    .line 315
    nop

    .line 316
    shl-int/lit8 v0, v26, 0x3

    and-int/lit16 v0, v0, 0x380

    shl-int/lit8 v2, v26, 0x3

    and-int/lit16 v2, v2, 0x1c00

    or-int/2addr v0, v2

    const v2, 0xe000

    and-int v2, v26, v2

    or-int/2addr v0, v2

    const/high16 v2, 0x70000

    and-int v2, v26, v2

    or-int/2addr v0, v2

    const/high16 v2, 0x380000

    and-int v2, v26, v2

    or-int/2addr v0, v2

    const/high16 v2, 0x1c00000

    and-int v2, v26, v2

    or-int v21, v0, v2

    .line 308
    const/16 v22, 0x0

    move-object/from16 v20, v24

    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .local v20, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v12 .. v22}, Landroidx/navigation3/ui/NavDisplayKt;->NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    .end local v20    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 318
    .end local v5    # "scene":Landroidx/navigation3/scene/Scene;
    .end local v6    # "currentInfo":Landroidx/navigation3/scene/SceneInfo;
    .end local v12    # "sceneState":Landroidx/navigation3/scene/SceneState;
    .end local v13    # "gestureState":Landroidx/navigationevent/compose/NavigationEventState;
    .end local p9    # "previousSceneInfos":Ljava/util/List;
    :cond_2c
    move-object v4, v8

    move-object v2, v14

    move-object v3, v15

    move-object/from16 v5, v16

    move-object/from16 v6, v17

    move-object/from16 v7, v18

    move-object/from16 v8, v19

    goto :goto_17

    .line 652
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v26    # "$dirty":I
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$dirty":I
    :cond_2d
    move-object/from16 v24, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    const/4 v0, 0x0

    .line 285
    .local v0, "$i$a$-require-NavDisplayKt__NavDisplayKt$NavDisplay$4":I
    nop

    .end local v0    # "$i$a$-require-NavDisplayKt__NavDisplayKt$NavDisplay$4":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "NavDisplay entries cannot be empty"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    .end local v8    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .end local v14    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v15    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v16    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local v17    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v18    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v19    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .local p1, "modifier":Landroidx/compose/ui/Modifier;
    .local p2, "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local p3    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local p4, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local p5, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_2e
    move-object/from16 v24, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v26, v3

    move-object v2, v5

    move-object v3, v7

    move-object v4, v8

    move-object v5, v13

    move-object v6, v14

    move-object v7, v15

    move-object/from16 v8, p7

    .line 318
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local p3    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .end local p4    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local p5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v4, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v5, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v6, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v7, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v8, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .restart local v26    # "$dirty":I
    :goto_17
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v12

    if-eqz v12, :cond_2f

    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda1;

    invoke-direct/range {v0 .. v11}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda1;-><init>(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;II)V

    invoke-interface {v12, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_2f
    return-void
.end method

.method public static final NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V
    .locals 27
    .param p0, "backStack"    # Ljava/util/List;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p3, "onBack"    # Lkotlin/jvm/functions/Function0;
    .param p4, "entryDecorators"    # Ljava/util/List;
    .param p5, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p6, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p7, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p8, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p9, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p10, "entryProvider"    # Lkotlin/jvm/functions/Function1;
    .param p11, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p12, "$changed"    # I
    .param p13, "$changed1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/runtime/Composer;",
            "III)V"
        }
    .end annotation

    .line 198
    move-object/from16 v1, p0

    move/from16 v12, p12

    move/from16 v14, p14

    const v0, 0x301b2955

    move-object/from16 v2, p11

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .end local p11    # "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(NavDisplay)N(backStack,modifier,contentAlignment,onBack,entryDecorators,sceneStrategy,sizeTransform,transitionSpec,popTransitionSpec,predictivePopTransitionSpec,entryProvider)201@10231L163,207@10400L376:NavDisplay.kt#fa4uso"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p12

    .local v3, "$dirty":I
    move/from16 v4, p13

    .local v4, "$dirty1":I
    and-int/lit8 v5, v12, 0x6

    if-nez v5, :cond_1

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v3, v5

    :cond_1
    and-int/lit8 v5, v14, 0x2

    if-eqz v5, :cond_2

    or-int/lit8 v3, v3, 0x30

    move-object/from16 v8, p1

    goto :goto_2

    :cond_2
    and-int/lit8 v8, v12, 0x30

    if-nez v8, :cond_4

    move-object/from16 v8, p1

    invoke-interface {v2, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    const/16 v9, 0x20

    goto :goto_1

    :cond_3
    const/16 v9, 0x10

    :goto_1
    or-int/2addr v3, v9

    goto :goto_2

    :cond_4
    move-object/from16 v8, p1

    :goto_2
    and-int/lit8 v9, v14, 0x4

    if-eqz v9, :cond_5

    or-int/lit16 v3, v3, 0x180

    move-object/from16 v10, p2

    goto :goto_4

    :cond_5
    and-int/lit16 v10, v12, 0x180

    if-nez v10, :cond_7

    move-object/from16 v10, p2

    invoke-interface {v2, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    const/16 v11, 0x100

    goto :goto_3

    :cond_6
    const/16 v11, 0x80

    :goto_3
    or-int/2addr v3, v11

    goto :goto_4

    :cond_7
    move-object/from16 v10, p2

    :goto_4
    and-int/lit16 v11, v12, 0xc00

    if-nez v11, :cond_a

    and-int/lit8 v11, v14, 0x8

    if-nez v11, :cond_8

    move-object/from16 v11, p3

    invoke-interface {v2, v11}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    const/16 v13, 0x800

    goto :goto_5

    :cond_8
    move-object/from16 v11, p3

    :cond_9
    const/16 v13, 0x400

    :goto_5
    or-int/2addr v3, v13

    goto :goto_6

    :cond_a
    move-object/from16 v11, p3

    :goto_6
    and-int/lit16 v13, v12, 0x6000

    if-nez v13, :cond_d

    and-int/lit8 v13, v14, 0x10

    if-nez v13, :cond_b

    move-object/from16 v13, p4

    invoke-interface {v2, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c

    const/16 v15, 0x4000

    goto :goto_7

    :cond_b
    move-object/from16 v13, p4

    :cond_c
    const/16 v15, 0x2000

    :goto_7
    or-int/2addr v3, v15

    goto :goto_8

    :cond_d
    move-object/from16 v13, p4

    :goto_8
    const/high16 v15, 0x30000

    and-int/2addr v15, v12

    if-nez v15, :cond_10

    and-int/lit8 v15, v14, 0x20

    if-nez v15, :cond_e

    move-object/from16 v15, p5

    invoke-interface {v2, v15}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_f

    const/high16 v16, 0x20000

    goto :goto_9

    :cond_e
    move-object/from16 v15, p5

    :cond_f
    const/high16 v16, 0x10000

    :goto_9
    or-int v3, v3, v16

    goto :goto_a

    :cond_10
    move-object/from16 v15, p5

    :goto_a
    and-int/lit8 v16, v14, 0x40

    const/high16 v17, 0x180000

    if-eqz v16, :cond_11

    or-int v3, v3, v17

    move-object/from16 v6, p6

    goto :goto_c

    :cond_11
    and-int v17, v12, v17

    if-nez v17, :cond_13

    move-object/from16 v6, p6

    invoke-interface {v2, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_12

    const/high16 v17, 0x100000

    goto :goto_b

    :cond_12
    const/high16 v17, 0x80000

    :goto_b
    or-int v3, v3, v17

    goto :goto_c

    :cond_13
    move-object/from16 v6, p6

    :goto_c
    const/high16 v17, 0xc00000

    and-int v17, v12, v17

    if-nez v17, :cond_16

    and-int/lit16 v0, v14, 0x80

    if-nez v0, :cond_14

    move-object/from16 v0, p7

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_15

    const/high16 v18, 0x800000

    goto :goto_d

    :cond_14
    move-object/from16 v0, p7

    :cond_15
    const/high16 v18, 0x400000

    :goto_d
    or-int v3, v3, v18

    goto :goto_e

    :cond_16
    move-object/from16 v0, p7

    :goto_e
    const/high16 v18, 0x6000000

    and-int v18, v12, v18

    if-nez v18, :cond_19

    and-int/lit16 v7, v14, 0x100

    if-nez v7, :cond_17

    move-object/from16 v7, p8

    invoke-interface {v2, v7}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_18

    const/high16 v19, 0x4000000

    goto :goto_f

    :cond_17
    move-object/from16 v7, p8

    :cond_18
    const/high16 v19, 0x2000000

    :goto_f
    or-int v3, v3, v19

    goto :goto_10

    :cond_19
    move-object/from16 v7, p8

    :goto_10
    const/high16 v19, 0x30000000

    and-int v19, v12, v19

    if-nez v19, :cond_1c

    and-int/lit16 v0, v14, 0x200

    if-nez v0, :cond_1a

    move-object/from16 v0, p9

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1b

    const/high16 v19, 0x20000000

    goto :goto_11

    :cond_1a
    move-object/from16 v0, p9

    :cond_1b
    const/high16 v19, 0x10000000

    :goto_11
    or-int v3, v3, v19

    goto :goto_12

    :cond_1c
    move-object/from16 v0, p9

    :goto_12
    and-int/lit8 v19, p13, 0x6

    if-nez v19, :cond_1e

    move-object/from16 v0, p10

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1d

    const/16 v19, 0x4

    goto :goto_13

    :cond_1d
    const/16 v19, 0x2

    :goto_13
    or-int v4, v4, v19

    goto :goto_14

    :cond_1e
    move-object/from16 v0, p10

    :goto_14
    const v19, 0x12492493

    and-int v0, v3, v19

    move/from16 p11, v5

    const v5, 0x12492492

    if-ne v0, v5, :cond_20

    and-int/lit8 v0, v4, 0x3

    const/4 v5, 0x2

    if-eq v0, v5, :cond_1f

    goto :goto_15

    :cond_1f
    const/4 v0, 0x0

    goto :goto_16

    :cond_20
    :goto_15
    const/4 v0, 0x1

    :goto_16
    and-int/lit8 v5, v3, 0x1

    invoke-interface {v2, v0, v5}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "178@9304L101,184@9472L46"

    invoke-static {v2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v12, 0x1

    const v5, -0x70000001

    const v18, -0xe000001

    const v20, -0x1c00001

    const v21, -0x70001

    const v22, -0xe001

    if-eqz v0, :cond_28

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_21

    goto :goto_17

    .line 175
    :cond_21
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v14, 0x8

    if-eqz v0, :cond_22

    and-int/lit16 v3, v3, -0x1c01

    :cond_22
    and-int/lit8 v0, v14, 0x10

    if-eqz v0, :cond_23

    and-int v3, v3, v22

    :cond_23
    and-int/lit8 v0, v14, 0x20

    if-eqz v0, :cond_24

    and-int v3, v3, v21

    :cond_24
    and-int/lit16 v0, v14, 0x80

    if-eqz v0, :cond_25

    and-int v3, v3, v20

    :cond_25
    and-int/lit16 v0, v14, 0x100

    if-eqz v0, :cond_26

    and-int v3, v3, v18

    :cond_26
    and-int/lit16 v0, v14, 0x200

    if-eqz v0, :cond_27

    and-int v0, v3, v5

    move-object/from16 v19, p6

    move-object/from16 v20, p7

    move-object/from16 v22, p9

    move v3, v0

    move-object/from16 v21, v7

    move-object/from16 v16, v8

    move-object/from16 v17, v10

    move-object/from16 v23, v11

    move-object/from16 v18, v15

    const v0, 0x301b2955

    .end local v3    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_1e

    .end local v0    # "$dirty":I
    .restart local v3    # "$dirty":I
    :cond_27
    move-object/from16 v19, p6

    move-object/from16 v20, p7

    move-object/from16 v22, p9

    move-object/from16 v21, v7

    move-object/from16 v16, v8

    move-object/from16 v17, v10

    move-object/from16 v23, v11

    move-object/from16 v18, v15

    const v0, 0x301b2955

    goto/16 :goto_1e

    .line 198
    :cond_28
    :goto_17
    if-eqz p11, :cond_29

    .line 177
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object v8, v0

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v8, "modifier":Landroidx/compose/ui/Modifier;
    :cond_29
    if-eqz v9, :cond_2a

    .line 178
    sget-object v0, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/Alignment$Companion;->getTopStart()Landroidx/compose/ui/Alignment;

    move-result-object v0

    move-object v10, v0

    .end local p2    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v10, "contentAlignment":Landroidx/compose/ui/Alignment;
    :cond_2a
    and-int/lit8 v0, v14, 0x8

    if-eqz v0, :cond_2d

    .line 179
    const v0, -0x6a09c306

    const-string v9, "CC(remember):NavDisplay.kt#9igjgp"

    invoke-static {v2, v0, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid$iv":Z
    move-object v9, v2

    .local v9, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v23, 0x0

    .line 646
    .local v23, "$i$f$cache":I
    move/from16 p11, v5

    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/16 v24, 0x0

    .line 647
    .local v24, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_2c

    sget-object v25, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v25 .. v25}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v5, v6, :cond_2b

    goto :goto_18

    .line 651
    :cond_2b
    move/from16 p1, v0

    goto :goto_19

    .line 648
    :cond_2c
    :goto_18
    const/4 v6, 0x0

    .line 179
    .local v6, "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$1":I
    move/from16 p1, v0

    .end local v0    # "invalid$iv":Z
    .local p1, "invalid$iv":Z
    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;)V

    .line 648
    .end local v6    # "$i$a$-cache-NavDisplayKt__NavDisplayKt$NavDisplay$1":I
    nop

    .line 649
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v9, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 650
    move-object v5, v0

    .line 646
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v24    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_19
    nop

    .line 179
    .end local v9    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v23    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    move-object v0, v5

    check-cast v0, Lkotlin/jvm/functions/Function0;

    .end local p3    # "onBack":Lkotlin/jvm/functions/Function0;
    .local v0, "onBack":Lkotlin/jvm/functions/Function0;
    invoke-static {v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    and-int/lit16 v3, v3, -0x1c01

    move-object v11, v0

    goto :goto_1a

    .line 178
    .end local v0    # "onBack":Lkotlin/jvm/functions/Function0;
    .restart local p3    # "onBack":Lkotlin/jvm/functions/Function0;
    :cond_2d
    move/from16 p11, v5

    .line 179
    .end local p3    # "onBack":Lkotlin/jvm/functions/Function0;
    .local v11, "onBack":Lkotlin/jvm/functions/Function0;
    :goto_1a
    and-int/lit8 v0, v14, 0x10

    if-eqz v0, :cond_2e

    .line 185
    const/4 v0, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v0, v2, v5, v6}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecoratorKt;->rememberSaveableStateHolderNavEntryDecorator(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/compose/runtime/Composer;II)Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .end local p4    # "entryDecorators":Ljava/util/List;
    .local v0, "entryDecorators":Ljava/util/List;
    and-int v3, v3, v22

    move-object v13, v0

    .end local v0    # "entryDecorators":Ljava/util/List;
    .local v13, "entryDecorators":Ljava/util/List;
    :cond_2e
    and-int/lit8 v0, v14, 0x20

    if-eqz v0, :cond_2f

    .line 186
    new-instance v0, Landroidx/navigation3/scene/SinglePaneSceneStrategy;

    invoke-direct {v0}, Landroidx/navigation3/scene/SinglePaneSceneStrategy;-><init>()V

    check-cast v0, Landroidx/navigation3/scene/SceneStrategy;

    .end local p5    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v0, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    and-int v3, v3, v21

    move-object v15, v0

    .end local v0    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v15, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    :cond_2f
    if-eqz v16, :cond_30

    .line 187
    const/4 v0, 0x0

    .end local p6    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v0, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    goto :goto_1b

    .line 186
    .end local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .restart local p6    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    :cond_30
    move-object/from16 v0, p6

    .line 187
    .end local p6    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .restart local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    :goto_1b
    and-int/lit16 v5, v14, 0x80

    if-eqz v5, :cond_31

    .line 189
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v5

    .end local p7    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v5, "transitionSpec":Lkotlin/jvm/functions/Function1;
    and-int v3, v3, v20

    goto :goto_1c

    .line 187
    .end local v5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p7    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_31
    move-object/from16 v5, p7

    .line 189
    .end local p7    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_1c
    and-int/lit16 v6, v14, 0x100

    if-eqz v6, :cond_32

    .line 191
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPopTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v6

    .end local p8    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v6, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    and-int v3, v3, v18

    goto :goto_1d

    .line 189
    .end local v6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p8    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :cond_32
    move-object v6, v7

    .line 191
    .end local p8    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local v6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    :goto_1d
    and-int/lit16 v7, v14, 0x200

    if-eqz v7, :cond_33

    .line 196
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt;->defaultPredictivePopTransitionSpec()Lkotlin/jvm/functions/Function2;

    move-result-object v7

    .end local p9    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v7, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    and-int v3, v3, p11

    move-object/from16 v19, v0

    move-object/from16 v20, v5

    move-object/from16 v21, v6

    move-object/from16 v22, v7

    move-object/from16 v16, v8

    move-object/from16 v17, v10

    move-object/from16 v23, v11

    move-object/from16 v18, v15

    const v0, 0x301b2955

    goto :goto_1e

    .line 191
    .end local v7    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .restart local p9    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_33
    move-object/from16 v22, p9

    move-object/from16 v19, v0

    move-object/from16 v20, v5

    move-object/from16 v21, v6

    move-object/from16 v16, v8

    move-object/from16 v17, v10

    move-object/from16 v23, v11

    move-object/from16 v18, v15

    const v0, 0x301b2955

    .line 175
    .end local v0    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local v5    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v6    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v8    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v10    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v11    # "onBack":Lkotlin/jvm/functions/Function0;
    .end local v15    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .end local p9    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v16, "modifier":Landroidx/compose/ui/Modifier;
    .local v17, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v18, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v19, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v20, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v21, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v22, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v23, "onBack":Lkotlin/jvm/functions/Function0;
    :goto_1e
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_34

    const-string v5, "androidx.navigation3.ui.NavDisplay (NavDisplay.kt:197)"

    invoke-static {v0, v3, v4, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 199
    :cond_34
    move-object v0, v1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_36

    .line 203
    nop

    .line 204
    nop

    .line 205
    and-int/lit8 v0, v3, 0xe

    shr-int/lit8 v5, v3, 0x9

    and-int/lit8 v5, v5, 0x70

    or-int/2addr v0, v5

    shl-int/lit8 v5, v4, 0x6

    and-int/lit16 v5, v5, 0x380

    or-int/2addr v0, v5

    .line 202
    const/4 v5, 0x0

    move-object/from16 p3, p10

    move/from16 p5, v0

    move-object/from16 p1, v1

    move-object/from16 p4, v2

    move/from16 p6, v5

    move-object/from16 p2, v13

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v13    # "entryDecorators":Ljava/util/List;
    .local p2, "entryDecorators":Ljava/util/List;
    .local p4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p1 .. p6}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->rememberDecoratedNavEntries(Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Ljava/util/List;

    move-result-object v15

    .line 201
    move-object/from16 v24, p4

    .line 209
    .end local p2    # "entryDecorators":Ljava/util/List;
    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v13    # "entryDecorators":Ljava/util/List;
    .local v15, "entries":Ljava/util/List;
    .local v24, "$composer":Landroidx/compose/runtime/Composer;
    nop

    .line 211
    nop

    .line 212
    nop

    .line 210
    nop

    .line 213
    nop

    .line 214
    nop

    .line 215
    nop

    .line 216
    nop

    .line 217
    and-int/lit8 v0, v3, 0x70

    and-int/lit16 v1, v3, 0x380

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x6

    and-int/lit16 v1, v1, 0x1c00

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x6

    const v2, 0xe000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x6

    const/high16 v2, 0x70000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x6

    const/high16 v2, 0x380000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    const/high16 v1, 0x1c00000

    shr-int/lit8 v2, v3, 0x6

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    shl-int/lit8 v1, v3, 0xf

    const/high16 v2, 0xe000000

    and-int/2addr v1, v2

    or-int v25, v0, v1

    .line 208
    const/16 v26, 0x0

    invoke-static/range {v15 .. v26}, Landroidx/navigation3/ui/NavDisplayKt;->NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 219
    .end local v15    # "entries":Ljava/util/List;
    :cond_35
    move v15, v3

    move v0, v4

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    move-object/from16 v6, v18

    move-object/from16 v7, v19

    move-object/from16 v8, v20

    move-object/from16 v9, v21

    move-object/from16 v10, v22

    move-object/from16 v4, v23

    move-object v5, v13

    goto :goto_1f

    .line 652
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_36
    const/4 v0, 0x0

    .line 199
    .local v0, "$i$a$-require-NavDisplayKt__NavDisplayKt$NavDisplay$2":I
    nop

    .end local v0    # "$i$a$-require-NavDisplayKt__NavDisplayKt$NavDisplay$2":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NavDisplay backstack cannot be empty"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    .end local v13    # "entryDecorators":Ljava/util/List;
    .end local v16    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v17    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v18    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .end local v19    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local v20    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v21    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local v22    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .end local v23    # "onBack":Lkotlin/jvm/functions/Function0;
    .local p1, "modifier":Landroidx/compose/ui/Modifier;
    .local p2, "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local p3    # "onBack":Lkotlin/jvm/functions/Function0;
    .local p4, "entryDecorators":Ljava/util/List;
    .restart local p5    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .restart local p6    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .restart local p7    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p8    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .restart local p9    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    :cond_37
    move-object/from16 v24, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move v0, v4

    move-object v9, v7

    move-object v2, v8

    move-object v4, v11

    move-object v6, v15

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move v15, v3

    move-object v3, v10

    move-object/from16 v10, p9

    move-object v5, v13

    .line 219
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local p3    # "onBack":Lkotlin/jvm/functions/Function0;
    .end local p4    # "entryDecorators":Ljava/util/List;
    .end local p5    # "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .end local p6    # "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .end local p7    # "transitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p8    # "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .end local p9    # "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v0, "$dirty1":I
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v4, "onBack":Lkotlin/jvm/functions/Function0;
    .local v5, "entryDecorators":Ljava/util/List;
    .local v6, "sceneStrategy":Landroidx/navigation3/scene/SceneStrategy;
    .local v7, "sizeTransform":Landroidx/compose/animation/SizeTransform;
    .local v8, "transitionSpec":Lkotlin/jvm/functions/Function1;
    .local v9, "popTransitionSpec":Lkotlin/jvm/functions/Function1;
    .local v10, "predictivePopTransitionSpec":Lkotlin/jvm/functions/Function2;
    .local v15, "$dirty":I
    :goto_1f
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v1

    if-eqz v1, :cond_38

    move v11, v0

    .end local v0    # "$dirty1":I
    .local v11, "$dirty1":I
    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda2;

    move/from16 v13, p13

    move/from16 v16, v11

    move/from16 p1, v15

    move-object/from16 v11, p10

    move-object v15, v1

    move-object/from16 v1, p0

    .end local v11    # "$dirty1":I
    .end local v15    # "$dirty":I
    .local v16, "$dirty1":I
    .local p1, "$dirty":I
    invoke-direct/range {v0 .. v14}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda2;-><init>(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;III)V

    invoke-interface {v15, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    goto :goto_20

    .end local v16    # "$dirty1":I
    .end local p1    # "$dirty":I
    .restart local v0    # "$dirty1":I
    .restart local v15    # "$dirty":I
    :cond_38
    move/from16 v16, v0

    move/from16 p1, v15

    .end local v0    # "$dirty1":I
    .end local v15    # "$dirty":I
    .restart local v16    # "$dirty1":I
    .restart local p1    # "$dirty":I
    :goto_20
    return-void
.end method

.method private static final NavDisplay$lambda$0$0$NavDisplayKt__NavDisplayKt(Ljava/util/List;)Lkotlin/Unit;
    .locals 1
    .param p0, "$backStack"    # Ljava/util/List;

    .line 180
    invoke-static {p0}, Lkotlin/jvm/internal/TypeIntrinsics;->isMutableList(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->removeLastOrNull(Ljava/util/List;)Ljava/lang/Object;

    .line 183
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$17$0$NavDisplayKt__NavDisplayKt(ZLandroidx/navigation3/scene/Scene;ILkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 2
    .param p0, "$inPredictiveBack"    # Z
    .param p1, "$transitionScene"    # Landroidx/navigation3/scene/Scene;
    .param p2, "$swipeEdge"    # I
    .param p3, "$predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p4, "$isPop"    # Z
    .param p5, "$popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p6, "$transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p7, "<this>"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 525
    nop

    .line 526
    if-eqz p0, :cond_1

    .line 527
    invoke-static {p1}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->predictivePopSpec$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;)Lkotlin/jvm/functions/Function2;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p7, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    if-nez v0, :cond_5

    .line 528
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, p7, v0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    goto :goto_0

    .line 530
    :cond_1
    if-eqz p4, :cond_3

    .line 531
    const-string/jumbo v0, "popTransitionSpec"

    invoke-static {p1, v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->contentTransform$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;Ljava/lang/String;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    if-nez v0, :cond_5

    .line 532
    :cond_2
    invoke-interface {p5, p7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    goto :goto_0

    .line 535
    :cond_3
    const-string/jumbo v0, "transitionSpec"

    invoke-static {p1, v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->contentTransform$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;Ljava/lang/String;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {v0, p7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    if-nez v0, :cond_5

    .line 536
    :cond_4
    invoke-interface {p6, p7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/ContentTransform;

    .line 538
    :cond_5
    :goto_0
    return-object v0
.end method

.method private static final NavDisplay$lambda$18$0$NavDisplayKt__NavDisplayKt(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 3
    .param p0, "$contentTransform"    # Lkotlin/jvm/functions/Function1;
    .param p1, "$targetZIndex"    # F
    .param p2, "$sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p3, "$this$AnimatedContent"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 546
    new-instance v0, Landroidx/compose/animation/ContentTransform;

    .line 547
    invoke-interface {p0, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/ContentTransform;

    invoke-virtual {v1}, Landroidx/compose/animation/ContentTransform;->getTargetContentEnter()Landroidx/compose/animation/EnterTransition;

    move-result-object v1

    .line 548
    invoke-interface {p0, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/compose/animation/ContentTransform;

    invoke-virtual {v2}, Landroidx/compose/animation/ContentTransform;->getInitialContentExit()Landroidx/compose/animation/ExitTransition;

    move-result-object v2

    .line 550
    nop

    .line 551
    nop

    .line 546
    invoke-direct {v0, v1, v2, p1, p2}, Landroidx/compose/animation/ContentTransform;-><init>(Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;FLandroidx/compose/animation/SizeTransform;)V

    .line 552
    return-object v0
.end method

.method private static final NavDisplay$lambda$19$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;)Ljava/lang/Object;
    .locals 2
    .param p0, "scene"    # Landroidx/navigation3/scene/Scene;

    .line 542
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-interface {p0}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    return-object v0
.end method

.method private static final NavDisplay$lambda$2$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 16

    or-int/lit8 v0, p11, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v13

    invoke-static/range {p12 .. p12}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v14

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move/from16 v15, p13

    move-object/from16 v12, p14

    invoke-static/range {v1 .. v15}, Landroidx/navigation3/ui/NavDisplayKt;->NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$20$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$targetScene"    # Landroidx/navigation3/scene/Scene;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C568@27082L9:NavDisplay.kt#fa4uso"

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

    const-string v1, "androidx.navigation3.ui.NavDisplay.<anonymous>.<anonymous> (NavDisplay.kt:568)"

    const v3, -0x67691afc

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 569
    :cond_1
    invoke-interface {p0}, Landroidx/navigation3/scene/Scene;->getContent()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 568
    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 570
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$20$NavDisplayKt__NavDisplayKt(Landroidx/compose/animation/core/Transition;Ljava/util/Map;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation3/scene/Scene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 8
    .param p0, "$transition"    # Landroidx/compose/animation/core/Transition;
    .param p1, "$sceneToExcludedEntryMap"    # Ljava/util/Map;
    .param p2, "$this$AnimatedContent"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p3, "targetScene"    # Landroidx/navigation3/scene/Scene;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    const-string v0, "CN(targetScene)559@26609L136,567@27056L45,562@26754L347:NavDisplay.kt#fa4uso"

    invoke-static {p4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "androidx.navigation3.ui.NavDisplay.<anonymous> (NavDisplay.kt:557)"

    const v2, -0x45956e3c

    invoke-static {v2, p5, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 558
    :cond_0
    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 561
    .local v0, "isSettled":Z
    if-eqz v0, :cond_1

    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    goto :goto_0

    :cond_1
    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->STARTED:Landroidx/lifecycle/Lifecycle$State;

    .line 560
    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v1, v2, p4, v3, v4}, Landroidx/lifecycle/compose/RememberLifecycleOwnerKt;->rememberLifecycleOwner(Landroidx/lifecycle/Lifecycle$State;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    .line 559
    nop

    .line 564
    .local v1, "sceneLifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    const/4 v2, 0x3

    new-array v2, v2, [Landroidx/compose/runtime/ProvidedValue;

    invoke-static {}, Landroidx/lifecycle/compose/LocalLifecycleOwnerKt;->getLocalLifecycleOwner()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v5

    aput-object v5, v2, v3

    .line 565
    invoke-static {}, Landroidx/navigation3/ui/LocalNavAnimatedContentScopeKt;->getLocalNavAnimatedContentScope()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    invoke-virtual {v3, p2}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    .line 564
    nop

    .line 566
    invoke-static {}, Landroidx/navigation3/scene/SceneSetupNavEntryDecoratorKt;->getLocalEntriesToExcludeFromCurrentScene()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    .line 567
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v6

    invoke-interface {p3}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v6

    invoke-static {p1, v6}, Lkotlin/collections/MapsKt;->getValue(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 566
    invoke-virtual {v3, v6}, Landroidx/compose/runtime/ProvidableCompositionLocal;->provides(Ljava/lang/Object;)Landroidx/compose/runtime/ProvidedValue;

    move-result-object v3

    aput-object v3, v2, v4

    .line 564
    nop

    .line 568
    new-instance v3, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda3;

    invoke-direct {v3, p3}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda3;-><init>(Landroidx/navigation3/scene/Scene;)V

    const/16 v4, 0x36

    const v6, -0x67691afc

    invoke-static {v6, v5, v3, p4, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    check-cast v3, Lkotlin/jvm/functions/Function2;

    sget v4, Landroidx/compose/runtime/ProvidedValue;->$stable:I

    or-int/lit8 v4, v4, 0x30

    .line 563
    invoke-static {v2, v3, p4, v4}, Landroidx/compose/runtime/CompositionLocalKt;->CompositionLocalProvider([Landroidx/compose/runtime/ProvidedValue;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 571
    :cond_2
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2
.end method

.method private static final NavDisplay$lambda$22$0$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/OverlayScene;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$overlayScene"    # Landroidx/navigation3/scene/OverlayScene;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C596@28212L8:NavDisplay.kt#fa4uso"

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

    const-string v1, "androidx.navigation3.ui.NavDisplay.<anonymous>.<anonymous> (NavDisplay.kt:596)"

    const v3, 0x1ce9119c

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 597
    :cond_1
    invoke-interface {p0}, Landroidx/navigation3/scene/OverlayScene;->getContent()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 596
    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 598
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$23$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 12

    or-int/lit8 v0, p8, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v10

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v11, p9

    move-object/from16 v9, p10

    invoke-static/range {v1 .. v11}, Landroidx/navigation3/ui/NavDisplayKt;->NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$5$0$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/navigation3/scene/Scene;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 4
    .param p0, "$entries"    # Ljava/util/List;
    .param p1, "$scene"    # Landroidx/navigation3/scene/Scene;
    .param p2, "$onBack"    # Lkotlin/jvm/functions/Function0;

    .line 304
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Landroidx/navigation3/scene/Scene;->getPreviousEntries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    move v2, v1

    .line 652
    .local v2, "it":I
    const/4 v3, 0x0

    .line 304
    .local v3, "$i$a$-repeat-NavDisplayKt__NavDisplayKt$NavDisplay$5$1$1":I
    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .end local v2    # "it":I
    .end local v3    # "$i$a$-repeat-NavDisplayKt__NavDisplayKt$NavDisplay$5$1$1":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 305
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final NavDisplay$lambda$6$NavDisplayKt__NavDisplayKt(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13

    or-int/lit8 v0, p9, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v11

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v12, p10

    move-object/from16 v10, p11

    invoke-static/range {v1 .. v12}, Landroidx/navigation3/ui/NavDisplayKt;->NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final contentTransform$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;Ljava/lang/String;)Lkotlin/jvm/functions/Function1;
    .locals 2
    .param p0, "$this$contentTransform"    # Landroidx/navigation3/scene/Scene;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;"
        }
    .end annotation

    .line 619
    invoke-interface {p0}, Landroidx/navigation3/scene/Scene;->getMetadata()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/TypeIntrinsics;->isFunctionOfArity(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Lkotlin/jvm/functions/Function1;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final isPop$NavDisplayKt__NavDisplayKt(Ljava/util/List;Ljava/util/List;)Z
    .locals 9
    .param p0, "oldBackStack"    # Ljava/util/List;
    .param p1, "newBackStack"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Ljava/util/List<",
            "+TT;>;)Z"
        }
    .end annotation

    .line 604
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 606
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-le v0, v2, :cond_1

    return v1

    .line 609
    :cond_1
    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->getIndices(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$firstOrNull$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 767
    .local v2, "$i$f$firstOrNull":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v5, v4

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .local v5, "index":I
    const/4 v6, 0x0

    .line 609
    .local v6, "$i$a$-firstOrNull-NavDisplayKt__NavDisplayKt$isPop$divergingIndex$1":I
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    .line 767
    .end local v5    # "index":I
    .end local v6    # "$i$a$-firstOrNull-NavDisplayKt__NavDisplayKt$isPop$divergingIndex$1":I
    if-nez v7, :cond_2

    goto :goto_0

    .line 768
    .end local v4    # "element$iv":Ljava/lang/Object;
    :cond_3
    const/4 v4, 0x0

    .line 609
    .end local v0    # "$this$firstOrNull$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$firstOrNull":I
    :goto_0
    check-cast v4, Ljava/lang/Integer;

    .line 608
    nop

    .line 612
    .local v4, "divergingIndex":Ljava/lang/Integer;
    if-nez v4, :cond_4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_4

    const/4 v1, 0x1

    :cond_4
    return v1
.end method

.method private static final predictivePopSpec$NavDisplayKt__NavDisplayKt(Landroidx/navigation3/scene/Scene;)Lkotlin/jvm/functions/Function2;
    .locals 2
    .param p0, "$this$predictivePopSpec"    # Landroidx/navigation3/scene/Scene;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;)",
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;"
        }
    .end annotation

    .line 627
    invoke-interface {p0}, Landroidx/navigation3/scene/Scene;->getMetadata()Ljava/util/Map;

    move-result-object v0

    const-string/jumbo v1, "predictivePopTransitionSpec"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lkotlin/jvm/internal/TypeIntrinsics;->isFunctionOfArity(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Lkotlin/jvm/functions/Function2;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
