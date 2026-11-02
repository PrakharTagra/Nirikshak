.class public final Landroidx/compose/material/ProgressIndicatorKt;
.super Ljava/lang/Object;
.source "ProgressIndicator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nProgressIndicator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ProgressIndicator.kt\nandroidx/compose/material/ProgressIndicatorKt\n+ 2 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 3 MathHelpers.kt\nandroidx/compose/ui/util/MathHelpersKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 5 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 6 Size.kt\nandroidx/compose/ui/geometry/Size\n+ 7 InlineClassHelper.kt\nandroidx/compose/ui/util/InlineClassHelperKt\n+ 8 InlineClassHelper.jvm.kt\nandroidx/compose/ui/util/InlineClassHelper_jvmKt\n+ 9 Offset.kt\nandroidx/compose/ui/geometry/OffsetKt\n+ 10 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 11 Size.kt\nandroidx/compose/ui/geometry/SizeKt\n+ 12 Dp.kt\nandroidx/compose/ui/unit/Dp\n+ 13 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n*L\n1#1,608:1\n113#2:609\n113#2:740\n113#2:741\n65#3,10:610\n65#3,10:675\n1#4:620\n1128#5,6:621\n1128#5,6:627\n1128#5,6:633\n1128#5,6:639\n1128#5,6:645\n1128#5,6:651\n1128#5,6:686\n1128#5,6:693\n1128#5,6:699\n1128#5,6:705\n57#6:657\n61#6:660\n57#6:711\n61#6:726\n61#6:733\n60#7:658\n70#7:661\n53#7,3:664\n53#7,3:668\n53#7,3:672\n60#7:712\n53#7,3:715\n53#7,3:719\n70#7:727\n70#7:734\n22#8:659\n22#8:662\n22#8:713\n22#8:728\n22#8:735\n30#9:663\n30#9:667\n30#9:671\n30#9:714\n75#10:685\n75#10:692\n33#11:718\n60#12,4:722\n85#13:729\n85#13:730\n85#13:731\n85#13:732\n85#13:736\n85#13:737\n85#13:738\n85#13:739\n*S KotlinDebug\n*F\n+ 1 ProgressIndicator.kt\nandroidx/compose/material/ProgressIndicatorKt\n*L\n58#1:609\n551#1:740\n555#1:741\n110#1:610,10\n315#1:675,10\n116#1:621,6\n156#1:627,6\n169#1:633,6\n182#1:639,6\n195#1:645,6\n207#1:651,6\n321#1:686,6\n388#1:693,6\n402#1:699,6\n409#1:705,6\n243#1:657\n244#1:660\n464#1:711\n117#1:726\n208#1:733\n243#1:658\n244#1:661\n255#1:664,3\n267#1:668,3\n268#1:672,3\n464#1:712\n470#1:715,3\n471#1:719,3\n117#1:727\n208#1:734\n243#1:659\n244#1:662\n464#1:713\n117#1:728\n208#1:735\n255#1:663\n267#1:667\n268#1:671\n470#1:714\n316#1:685\n355#1:692\n471#1:718\n533#1:722,4\n151#1:729\n164#1:730\n177#1:731\n190#1:732\n360#1:736\n374#1:737\n383#1:738\n397#1:739\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0014\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0001H\u0000\u001aA\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\r\u001a7\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u001a5\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u001a-\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u001a;\u0010\u0014\u001a\u00020\u0003*\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u001a+\u0010\u001b\u001a\u00020\u0003*\u00020\u00152\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001d\u001aK\u0010\u001e\u001a\u00020\u00032\u0008\u0008\u0001\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u001f2\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u0007\u00a2\u0006\u0004\u0008 \u0010!\u001aA\u0010\u001e\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u001f2\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u0007\u00a2\u0006\u0004\u0008\"\u0010#\u001a5\u0010\u001e\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u001fH\u0007\u00a2\u0006\u0004\u0008$\u0010%\u001a-\u0010\u001e\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u001fH\u0007\u00a2\u0006\u0004\u0008&\u0010\'\u001a3\u0010(\u001a\u00020\u0003*\u00020\u00152\u0006\u0010)\u001a\u00020\u00052\u0006\u0010*\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010+\u001a\u00020,H\u0002\u00a2\u0006\u0004\u0008-\u0010.\u001a#\u0010/\u001a\u00020\u0003*\u00020\u00152\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010+\u001a\u00020,H\u0002\u00a2\u0006\u0004\u00080\u00101\u001a3\u00102\u001a\u00020\u0003*\u00020\u00152\u0006\u0010)\u001a\u00020\u00052\u0006\u0010*\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010+\u001a\u00020,H\u0002\u00a2\u0006\u0004\u00083\u0010.\u001a;\u00104\u001a\u00020\u0003*\u00020\u00152\u0006\u0010)\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u001f2\u0006\u0010*\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010+\u001a\u00020,H\u0002\u00a2\u0006\u0004\u00085\u00106\"\u0010\u00107\u001a\u00020\u001fX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00108\"\u0010\u00109\u001a\u00020\u001fX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00108\"\u0010\u0010:\u001a\u00020\u001fX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u00108\"\u000e\u0010;\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010=\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010>\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010?\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010@\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010A\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010B\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010C\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010D\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010E\u001a\u00020FX\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010G\u001a\u00020FX\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010H\u001a\u00020FX\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010I\u001a\u00020FX\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010J\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010K\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010L\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010M\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010N\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010O\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010P\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010Q\u001a\u00020<X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010R\u001a\u00020FX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006S\u00b2\u0006\n\u0010T\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010U\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010V\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010W\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010X\u001a\u00020<X\u008a\u0084\u0002\u00b2\u0006\n\u0010Y\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010Z\u001a\u00020\u0005X\u008a\u0084\u0002\u00b2\u0006\n\u0010)\u001a\u00020\u0005X\u008a\u0084\u0002"
    }
    d2 = {
        "increaseSemanticsBounds",
        "Landroidx/compose/ui/Modifier;",
        "LinearProgressIndicator",
        "",
        "progress",
        "",
        "modifier",
        "color",
        "Landroidx/compose/ui/graphics/Color;",
        "backgroundColor",
        "strokeCap",
        "Landroidx/compose/ui/graphics/StrokeCap;",
        "LinearProgressIndicator-_5eSR-E",
        "(FLandroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V",
        "LinearProgressIndicator-2cYBFYY",
        "(Landroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V",
        "LinearProgressIndicator-eaDK9VM",
        "(FLandroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V",
        "LinearProgressIndicator-RIQooxk",
        "(Landroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V",
        "drawLinearIndicator",
        "Landroidx/compose/ui/graphics/drawscope/DrawScope;",
        "startFraction",
        "endFraction",
        "strokeWidth",
        "drawLinearIndicator-qYKTg0g",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V",
        "drawLinearIndicatorBackground",
        "drawLinearIndicatorBackground-AZGd3zU",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFI)V",
        "CircularProgressIndicator",
        "Landroidx/compose/ui/unit/Dp;",
        "CircularProgressIndicator-DUhRLBM",
        "(FLandroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V",
        "CircularProgressIndicator-LxG7B9w",
        "(Landroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V",
        "CircularProgressIndicator-MBs18nI",
        "(FLandroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V",
        "CircularProgressIndicator-aM-cp0Q",
        "(Landroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V",
        "drawCircularIndicator",
        "startAngle",
        "sweep",
        "stroke",
        "Landroidx/compose/ui/graphics/drawscope/Stroke;",
        "drawCircularIndicator-42QJj7c",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V",
        "drawCircularIndicatorBackground",
        "drawCircularIndicatorBackground-bw27NRU",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;JLandroidx/compose/ui/graphics/drawscope/Stroke;)V",
        "drawDeterminateCircularIndicator",
        "drawDeterminateCircularIndicator-42QJj7c",
        "drawIndeterminateCircularIndicator",
        "drawIndeterminateCircularIndicator-hrjfTZI",
        "(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V",
        "LinearIndicatorHeight",
        "F",
        "LinearIndicatorWidth",
        "CircularIndicatorDiameter",
        "LinearAnimationDuration",
        "",
        "FirstLineHeadDuration",
        "FirstLineTailDuration",
        "SecondLineHeadDuration",
        "SecondLineTailDuration",
        "FirstLineHeadDelay",
        "FirstLineTailDelay",
        "SecondLineHeadDelay",
        "SecondLineTailDelay",
        "FirstLineHeadEasing",
        "Landroidx/compose/animation/core/CubicBezierEasing;",
        "FirstLineTailEasing",
        "SecondLineHeadEasing",
        "SecondLineTailEasing",
        "RotationsPerCycle",
        "RotationDuration",
        "StartAngleOffset",
        "BaseRotationAngle",
        "JumpRotationAngle",
        "RotationAngleOffset",
        "HeadAndTailAnimationDuration",
        "HeadAndTailDelayDuration",
        "CircularEasing",
        "material",
        "firstLineHead",
        "firstLineTail",
        "secondLineHead",
        "secondLineTail",
        "currentRotation",
        "baseRotation",
        "endAngle"
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
.field private static final BaseRotationAngle:F = 286.0f

.field private static final CircularEasing:Landroidx/compose/animation/core/CubicBezierEasing;

.field private static final CircularIndicatorDiameter:F

.field private static final FirstLineHeadDelay:I = 0x0

.field private static final FirstLineHeadDuration:I = 0x2ee

.field private static final FirstLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

.field private static final FirstLineTailDelay:I = 0x14d

.field private static final FirstLineTailDuration:I = 0x352

.field private static final FirstLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

.field private static final HeadAndTailAnimationDuration:I = 0x29a

.field private static final HeadAndTailDelayDuration:I = 0x29a

.field private static final JumpRotationAngle:F = 290.0f

.field private static final LinearAnimationDuration:I = 0x708

.field private static final LinearIndicatorHeight:F

.field private static final LinearIndicatorWidth:F

.field private static final RotationAngleOffset:F = 216.0f

.field private static final RotationDuration:I = 0x534

.field private static final RotationsPerCycle:I = 0x5

.field private static final SecondLineHeadDelay:I = 0x3e8

.field private static final SecondLineHeadDuration:I = 0x237

.field private static final SecondLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

.field private static final SecondLineTailDelay:I = 0x4f3

.field private static final SecondLineTailDuration:I = 0x215

.field private static final SecondLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

.field private static final StartAngleOffset:F = -90.0f


# direct methods
.method public static synthetic $r8$lambda$-_U43yhcOd77LuhqkhxQACZ6bic(FLandroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/ProgressIndicatorKt;->increaseSemanticsBounds$lambda$0(FLandroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$3zTGsOmROEqxvUfwj7Txi3dI9Qs(FLandroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_eaDK9VM$lambda$0(FLandroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$5-N8kkfX5nu2ZXiXL6ygrIxuW1o(FLandroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p11}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_DUhRLBM$lambda$3(FLandroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$8QGJDs1Pdo9lgd2NCBkrB1Ca5Gs(FLandroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_MBs18nI$lambda$0(FLandroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Ilf8kUF1UDq5GHjnUA2tWpsl7uc(Landroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$9(Landroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$L0tBVC9hCqj-A9HwyURt9ClKy9M(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$4$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$LH3t4HBF3gfuXBfVe9Lmdmd5RNA(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->increaseSemanticsBounds$lambda$1(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$OxZZh9FhVnwrQmDf8o3Ih5nAoe0(FLandroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p10}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator__5eSR_E$lambda$2(FLandroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$anOYr5Pbvgwz6ENie6yXqSPKLiQ(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$3$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$e9cXGNG5ZbLTGPgzguPKuyE7GIo(JLandroidx/compose/ui/graphics/drawscope/Stroke;FJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p10}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$7$0(JLandroidx/compose/ui/graphics/drawscope/Stroke;FJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$fOThqK6eTP4kNNNyDdmh5zfFaOQ(Landroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p10}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$8(Landroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$iX0USfiZdxtECTJK3o69V5L-EoU(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$6$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$jXnHUZ8LWobrgPeI0WKEZFh-yAo(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$5$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$nY1js3DFE40mU-udomztAnZtVks(JIJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$8$0(JIJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$o4inupnNyl-sCVzFTQo60qkZymo(Landroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_RIQooxk$lambda$0(Landroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$qx3iF7P6bh4CrorjoBHMEa8zo4E(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$0$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rtyGbV1qGENbSHs9dTTrfUF1Ry8(Landroidx/compose/ui/layout/Placeable;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/compose/material/ProgressIndicatorKt;->increaseSemanticsBounds$lambda$0$0(Landroidx/compose/ui/layout/Placeable;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$tGTwMKq2QmvS6B2quRevDq2yCzE(JIFJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator__5eSR_E$lambda$1$0(JIFJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$uJITyE7qpy9vh4gllL8Erazw7ZY(Landroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p7}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_aM_cp0Q$lambda$0(Landroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$yKqykvCP2jPSyAmRF3_xGJQ-VLo(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$2$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zQ2afV78KfGQnsNzLt0GfPCmods(FJLandroidx/compose/ui/graphics/drawscope/Stroke;JLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_DUhRLBM$lambda$2$0(FJLandroidx/compose/ui/graphics/drawscope/Stroke;JLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 7

    .line 550
    sget-object v0, Landroidx/compose/material/ProgressIndicatorDefaults;->INSTANCE:Landroidx/compose/material/ProgressIndicatorDefaults;

    invoke-virtual {v0}, Landroidx/compose/material/ProgressIndicatorDefaults;->getStrokeWidth-D9Ej5fM()F

    move-result v0

    sput v0, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorHeight:F

    .line 551
    const/16 v0, 0xf0

    .local v0, "$this$dp$iv":I
    const/4 v1, 0x0

    .line 740
    .local v1, "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 551
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorWidth:F

    .line 555
    const/16 v0, 0x28

    .restart local v0    # "$this$dp$iv":I
    const/4 v1, 0x0

    .line 741
    .restart local v1    # "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 555
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/ProgressIndicatorKt;->CircularIndicatorDiameter:F

    .line 573
    new-instance v0, Landroidx/compose/animation/core/CubicBezierEasing;

    const v1, 0x3e4ccccd    # 0.2f

    const/4 v2, 0x0

    const v3, 0x3f4ccccd    # 0.8f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/compose/animation/core/CubicBezierEasing;-><init>(FFFF)V

    sput-object v0, Landroidx/compose/material/ProgressIndicatorKt;->FirstLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    .line 574
    new-instance v0, Landroidx/compose/animation/core/CubicBezierEasing;

    const v3, 0x3ecccccd    # 0.4f

    invoke-direct {v0, v3, v2, v4, v4}, Landroidx/compose/animation/core/CubicBezierEasing;-><init>(FFFF)V

    sput-object v0, Landroidx/compose/material/ProgressIndicatorKt;->FirstLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    .line 575
    new-instance v0, Landroidx/compose/animation/core/CubicBezierEasing;

    const v5, 0x3f266666    # 0.65f

    invoke-direct {v0, v2, v2, v5, v4}, Landroidx/compose/animation/core/CubicBezierEasing;-><init>(FFFF)V

    sput-object v0, Landroidx/compose/material/ProgressIndicatorKt;->SecondLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    .line 576
    new-instance v0, Landroidx/compose/animation/core/CubicBezierEasing;

    const v5, 0x3dcccccd    # 0.1f

    const v6, 0x3ee66666    # 0.45f

    invoke-direct {v0, v5, v2, v6, v4}, Landroidx/compose/animation/core/CubicBezierEasing;-><init>(FFFF)V

    sput-object v0, Landroidx/compose/material/ProgressIndicatorKt;->SecondLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    .line 607
    new-instance v0, Landroidx/compose/animation/core/CubicBezierEasing;

    invoke-direct {v0, v3, v2, v1, v4}, Landroidx/compose/animation/core/CubicBezierEasing;-><init>(FFFF)V

    sput-object v0, Landroidx/compose/material/ProgressIndicatorKt;->CircularEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    return-void
.end method

.method public static final CircularProgressIndicator-DUhRLBM(FLandroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V
    .locals 27
    .param p0, "progress"    # F
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p4, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p7, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I

    .line 314
    move/from16 v9, p9

    const v0, 0x681b4850

    move-object/from16 v1, p8

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v11

    .end local p8    # "$composer":Landroidx/compose/runtime/Composer;
    .local v11, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(CircularProgressIndicator)N(progress,modifier,color:c#ui.graphics.Color,strokeWidth:c#ui.unit.Dp,backgroundColor:c#ui.graphics.Color,strokeCap:c#ui.graphics.StrokeCap)315@13540L7,320@13765L251,316@13609L407:ProgressIndicator.kt#jmzs0o"

    invoke-static {v11, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p9

    .local v1, "$dirty":I
    and-int/lit8 v2, v9, 0x6

    if-nez v2, :cond_1

    move/from16 v2, p0

    invoke-interface {v11, v2}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v1, v3

    goto :goto_1

    :cond_1
    move/from16 v2, p0

    :goto_1
    and-int/lit8 v3, p10, 0x2

    if-eqz v3, :cond_2

    or-int/lit8 v1, v1, 0x30

    move-object/from16 v4, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v4, v9, 0x30

    if-nez v4, :cond_4

    move-object/from16 v4, p1

    invoke-interface {v11, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/16 v5, 0x20

    goto :goto_2

    :cond_3
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v1, v5

    goto :goto_3

    :cond_4
    move-object/from16 v4, p1

    :goto_3
    and-int/lit16 v5, v9, 0x180

    if-nez v5, :cond_7

    and-int/lit8 v5, p10, 0x4

    if-nez v5, :cond_5

    move-wide/from16 v7, p2

    invoke-interface {v11, v7, v8}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x100

    goto :goto_4

    :cond_5
    move-wide/from16 v7, p2

    :cond_6
    const/16 v5, 0x80

    :goto_4
    or-int/2addr v1, v5

    goto :goto_5

    :cond_7
    move-wide/from16 v7, p2

    :goto_5
    and-int/lit8 v5, p10, 0x8

    if-eqz v5, :cond_8

    or-int/lit16 v1, v1, 0xc00

    move/from16 v10, p4

    goto :goto_7

    :cond_8
    and-int/lit16 v10, v9, 0xc00

    if-nez v10, :cond_a

    move/from16 v10, p4

    invoke-interface {v11, v10}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v12

    if-eqz v12, :cond_9

    const/16 v12, 0x800

    goto :goto_6

    :cond_9
    const/16 v12, 0x400

    :goto_6
    or-int/2addr v1, v12

    goto :goto_7

    :cond_a
    move/from16 v10, p4

    :goto_7
    and-int/lit8 v12, p10, 0x10

    if-eqz v12, :cond_b

    or-int/lit16 v1, v1, 0x6000

    move-wide/from16 v14, p5

    goto :goto_9

    :cond_b
    and-int/lit16 v14, v9, 0x6000

    if-nez v14, :cond_d

    move-wide/from16 v14, p5

    invoke-interface {v11, v14, v15}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v16

    if-eqz v16, :cond_c

    const/16 v16, 0x4000

    goto :goto_8

    :cond_c
    const/16 v16, 0x2000

    :goto_8
    or-int v1, v1, v16

    goto :goto_9

    :cond_d
    move-wide/from16 v14, p5

    :goto_9
    const/high16 v16, 0x30000

    and-int v16, v9, v16

    if-nez v16, :cond_10

    and-int/lit8 v16, p10, 0x20

    if-nez v16, :cond_e

    move/from16 v6, p7

    invoke-interface {v11, v6}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v16

    if-eqz v16, :cond_f

    const/high16 v16, 0x20000

    goto :goto_a

    :cond_e
    move/from16 v6, p7

    :cond_f
    const/high16 v16, 0x10000

    :goto_a
    or-int v1, v1, v16

    goto :goto_b

    :cond_10
    move/from16 v6, p7

    :goto_b
    const v16, 0x12493

    and-int v13, v1, v16

    const v0, 0x12492

    const/16 v18, 0x1

    if-eq v13, v0, :cond_11

    move/from16 v0, v18

    goto :goto_c

    :cond_11
    const/4 v0, 0x0

    :goto_c
    and-int/lit8 v13, v1, 0x1

    invoke-interface {v11, v0, v13}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "309@13277L6"

    invoke-static {v11, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v9, 0x1

    const v13, -0x70001

    if-eqz v0, :cond_15

    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_d

    .line 307
    :cond_12
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, p10, 0x4

    if-eqz v0, :cond_13

    and-int/lit16 v1, v1, -0x381

    :cond_13
    and-int/lit8 v0, p10, 0x20

    if-eqz v0, :cond_14

    and-int v0, v1, v13

    move v1, v0

    move-object v0, v4

    move/from16 v22, v6

    .end local v1    # "$dirty":I
    .local v0, "$dirty":I
    goto :goto_f

    .end local v0    # "$dirty":I
    .restart local v1    # "$dirty":I
    :cond_14
    move-object v0, v4

    move/from16 v22, v6

    goto :goto_f

    .line 314
    :cond_15
    :goto_d
    if-eqz v3, :cond_16

    .line 309
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_e

    .line 314
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_16
    move-object v0, v4

    .line 309
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_e
    and-int/lit8 v3, p10, 0x4

    if-eqz v3, :cond_17

    .line 310
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v4, 0x6

    invoke-virtual {v3, v11, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v3

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit16 v1, v1, -0x381

    move-wide v7, v3

    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v7, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_17
    if-eqz v5, :cond_18

    .line 311
    sget-object v3, Landroidx/compose/material/ProgressIndicatorDefaults;->INSTANCE:Landroidx/compose/material/ProgressIndicatorDefaults;

    invoke-virtual {v3}, Landroidx/compose/material/ProgressIndicatorDefaults;->getStrokeWidth-D9Ej5fM()F

    move-result v3

    move v10, v3

    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v10, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_18
    if-eqz v12, :cond_19

    .line 312
    sget-object v3, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/Color$Companion;->getTransparent-0d7_KjU()J

    move-result-wide v3

    move-wide v14, v3

    .end local p5    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v14, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_19
    and-int/lit8 v3, p10, 0x20

    if-eqz v3, :cond_1a

    .line 313
    sget-object v3, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v3

    .end local p7    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v3, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    and-int/2addr v1, v13

    move/from16 v22, v3

    goto :goto_f

    .line 312
    .end local v3    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local p7    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_1a
    move/from16 v22, v6

    .line 307
    .end local p7    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v22, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :goto_f
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1b

    const/4 v3, -0x1

    const-string v4, "androidx.compose.material.CircularProgressIndicator (ProgressIndicator.kt:313)"

    const v5, 0x681b4850

    invoke-static {v5, v1, v3, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 315
    :cond_1b
    const/4 v3, 0x0

    .local v3, "minimumValue$iv":F
    const/high16 v4, 0x3f800000    # 1.0f

    .local v4, "maximumValue$iv":F
    move/from16 v5, p0

    .local v5, "$this$fastCoerceIn$iv":F
    const/4 v6, 0x0

    .line 675
    .local v6, "$i$f$fastCoerceIn":I
    move v12, v5

    .local v12, "$this$fastCoerceAtLeast$iv$iv":F
    const/4 v13, 0x0

    .line 679
    .local v13, "$i$f$fastCoerceAtLeast":I
    cmpg-float v16, v12, v3

    if-gez v16, :cond_1c

    move v12, v3

    .line 675
    .end local v12    # "$this$fastCoerceAtLeast$iv$iv":F
    .end local v13    # "$i$f$fastCoerceAtLeast":I
    :cond_1c
    nop

    .local v12, "$this$fastCoerceAtMost$iv$iv":F
    const/4 v13, 0x0

    .line 684
    .local v13, "$i$f$fastCoerceAtMost":I
    cmpl-float v16, v12, v4

    if-lez v16, :cond_1d

    move v12, v4

    .line 675
    .end local v12    # "$this$fastCoerceAtMost$iv$iv":F
    .end local v13    # "$i$f$fastCoerceAtMost":I
    :cond_1d
    nop

    .line 315
    .end local v3    # "minimumValue$iv":F
    .end local v4    # "maximumValue$iv":F
    .end local v5    # "$this$fastCoerceIn$iv":F
    .end local v6    # "$i$f$fastCoerceIn":I
    nop

    .line 316
    .local v12, "coercedProgress":F
    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    check-cast v3, Landroidx/compose/runtime/CompositionLocal;

    .local v3, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v4, 0x0

    .local v4, "$changed$iv":I
    move-object v5, v11

    .local v5, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 685
    .local v6, "$i$f$getCurrent":I
    const v13, 0x789c5f52

    const-string v2, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v5, v13, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 316
    .end local v3    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v4    # "$changed$iv":I
    .end local v5    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$getCurrent":I
    check-cast v2, Landroidx/compose/ui/unit/Density;

    .line 620
    .local v2, "$this$CircularProgressIndicator_DUhRLBM_u24lambda_u240":Landroidx/compose/ui/unit/Density;
    const/4 v3, 0x0

    .line 316
    .local v3, "$i$a$-with-ProgressIndicatorKt$CircularProgressIndicator$stroke$1":I
    new-instance v19, Landroidx/compose/ui/graphics/drawscope/Stroke;

    invoke-interface {v2, v10}, Landroidx/compose/ui/unit/Density;->toPx-0680j_4(F)F

    move-result v20

    const/16 v25, 0x1a

    const/16 v26, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v19 .. v26}, Landroidx/compose/ui/graphics/drawscope/Stroke;-><init>(FFIILandroidx/compose/ui/graphics/PathEffect;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .end local v2    # "$this$CircularProgressIndicator_DUhRLBM_u24lambda_u240":Landroidx/compose/ui/unit/Density;
    .end local v3    # "$i$a$-with-ProgressIndicatorKt$CircularProgressIndicator$stroke$1":I
    move-object/from16 v2, v19

    .line 318
    .local v2, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    nop

    .line 319
    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    .line 620
    nop

    .local v4, "it":F
    const/4 v5, 0x0

    .line 319
    .local v5, "$i$a$-takeUnless-ProgressIndicatorKt$CircularProgressIndicator$1":I
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    .end local v4    # "it":F
    .end local v5    # "$i$a$-takeUnless-ProgressIndicatorKt$CircularProgressIndicator$1":I
    if-nez v6, :cond_1e

    goto :goto_10

    :cond_1e
    const/4 v3, 0x0

    :goto_10
    if-eqz v3, :cond_1f

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_11

    :cond_1f
    const/4 v3, 0x0

    :goto_11
    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v13, 0x0

    move-object/from16 p1, v0

    move/from16 p2, v3

    move/from16 p5, v4

    move-object/from16 p6, v5

    move-object/from16 p3, v6

    move/from16 p4, v13

    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    invoke-static/range {p1 .. p6}, Landroidx/compose/foundation/ProgressSemanticsKt;->progressSemantics$default(Landroidx/compose/ui/Modifier;FLkotlin/ranges/ClosedFloatingPointRange;IILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 320
    move-object/from16 v4, p1

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "modifier":Landroidx/compose/ui/Modifier;
    sget v3, Landroidx/compose/material/ProgressIndicatorKt;->CircularIndicatorDiameter:F

    invoke-static {v0, v3}, Landroidx/compose/foundation/layout/SizeKt;->size-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 321
    const v3, -0x31953a75    # -9.8470368E8f

    const-string v5, "CC(remember):ProgressIndicator.kt#9igjgp"

    invoke-static {v11, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v12}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v3

    const v5, 0xe000

    and-int/2addr v5, v1

    const/16 v6, 0x4000

    if-ne v5, v6, :cond_20

    move/from16 v5, v18

    goto :goto_12

    :cond_20
    const/4 v5, 0x0

    :goto_12
    or-int/2addr v3, v5

    invoke-interface {v11, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    or-int/2addr v3, v5

    and-int/lit16 v5, v1, 0x380

    xor-int/lit16 v5, v5, 0x180

    const/16 v6, 0x100

    if-le v5, v6, :cond_21

    invoke-interface {v11, v7, v8}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v5

    if-nez v5, :cond_22

    :cond_21
    and-int/lit16 v5, v1, 0x180

    const/16 v6, 0x100

    if-ne v5, v6, :cond_23

    :cond_22
    goto :goto_13

    :cond_23
    const/16 v18, 0x0

    :goto_13
    or-int v3, v3, v18

    .local v3, "invalid$iv":Z
    move-object v5, v11

    .local v5, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 686
    .local v6, "$i$f$cache":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 687
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v3, :cond_25

    sget-object v18, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v19, v1

    .end local v1    # "$dirty":I
    .local v19, "$dirty":I
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v13, v1, :cond_24

    goto :goto_14

    .line 691
    :cond_24
    move-object v1, v2

    goto :goto_15

    .line 687
    .end local v19    # "$dirty":I
    .restart local v1    # "$dirty":I
    :cond_25
    move/from16 v19, v1

    .line 688
    .end local v1    # "$dirty":I
    .restart local v19    # "$dirty":I
    :goto_14
    const/4 v1, 0x0

    .line 321
    .local v1, "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$2":I
    new-instance v18, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda18;

    move-object/from16 p5, v2

    move-wide/from16 p6, v7

    move/from16 p2, v12

    move-wide/from16 p3, v14

    move-object/from16 p1, v18

    .end local v2    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v12    # "coercedProgress":F
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local p2, "coercedProgress":F
    .local p3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local p5, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local p6, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-direct/range {p1 .. p7}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda18;-><init>(FJLandroidx/compose/ui/graphics/drawscope/Stroke;J)V

    .line 688
    move-object/from16 v2, p1

    move-object/from16 v1, p5

    .line 689
    .end local p2    # "coercedProgress":F
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p5    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .end local p6    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v1, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local v2, "value$iv":Ljava/lang/Object;
    .restart local v7    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v12    # "coercedProgress":F
    .restart local v14    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 690
    move-object v13, v2

    .line 686
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v13    # "it$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_15
    nop

    .line 321
    .end local v3    # "invalid$iv":Z
    .end local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$cache":I
    check-cast v13, Lkotlin/jvm/functions/Function1;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 317
    const/4 v2, 0x0

    invoke-static {v0, v13, v11, v2}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 328
    .end local v1    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .end local v12    # "coercedProgress":F
    :cond_26
    move-object v2, v4

    move-wide v3, v7

    move/from16 v8, v22

    move v5, v10

    move-wide v6, v14

    goto :goto_16

    .line 307
    .end local v4    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v10    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v19    # "$dirty":I
    .end local v22    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "$dirty":I
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local p2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local p5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p7    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_27
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v19, v1

    move-object v2, v4

    move-wide v3, v7

    move v8, v6

    move v5, v10

    move-wide v6, v14

    .line 328
    .end local v1    # "$dirty":I
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .end local p5    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p7    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v6, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v8, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local v19    # "$dirty":I
    :goto_16
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v12

    if-eqz v12, :cond_28

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda19;

    move/from16 v1, p0

    move/from16 v10, p10

    invoke-direct/range {v0 .. v10}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda19;-><init>(FLandroidx/compose/ui/Modifier;JFJIII)V

    invoke-interface {v12, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_28
    return-void
.end method

.method public static final CircularProgressIndicator-LxG7B9w(Landroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V
    .locals 32
    .param p0, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p7, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p8, "$changed"    # I

    .line 354
    move/from16 v8, p8

    const v0, -0x42b466e0

    move-object/from16 v1, p7

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v15

    .end local p7    # "$composer":Landroidx/compose/runtime/Composer;
    .local v15, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(CircularProgressIndicator)N(modifier,color:c#ui.graphics.Color,strokeWidth:c#ui.unit.Dp,backgroundColor:c#ui.graphics.Color,strokeCap:c#ui.graphics.StrokeCap)354@15229L7,356@15316L28,359@15482L352,373@15957L209,387@16443L247,382@16292L423,401@16909L256,396@16758L432,408@17264L538,408@17195L607:ProgressIndicator.kt#jmzs0o"

    invoke-static {v15, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p8

    .local v1, "$dirty":I
    and-int/lit8 v2, p9, 0x1

    if-eqz v2, :cond_0

    or-int/lit8 v1, v1, 0x6

    move-object/from16 v4, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v4, v8, 0x6

    if-nez v4, :cond_2

    move-object/from16 v4, p0

    invoke-interface {v15, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x4

    goto :goto_0

    :cond_1
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v1, v5

    goto :goto_1

    :cond_2
    move-object/from16 v4, p0

    :goto_1
    and-int/lit8 v5, v8, 0x30

    if-nez v5, :cond_5

    and-int/lit8 v5, p9, 0x2

    if-nez v5, :cond_3

    move-wide/from16 v9, p1

    invoke-interface {v15, v9, v10}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x20

    goto :goto_2

    :cond_3
    move-wide/from16 v9, p1

    :cond_4
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v1, v5

    goto :goto_3

    :cond_5
    move-wide/from16 v9, p1

    :goto_3
    and-int/lit8 v5, p9, 0x4

    if-eqz v5, :cond_6

    or-int/lit16 v1, v1, 0x180

    move/from16 v11, p3

    goto :goto_5

    :cond_6
    and-int/lit16 v11, v8, 0x180

    if-nez v11, :cond_8

    move/from16 v11, p3

    invoke-interface {v15, v11}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v12

    if-eqz v12, :cond_7

    const/16 v12, 0x100

    goto :goto_4

    :cond_7
    const/16 v12, 0x80

    :goto_4
    or-int/2addr v1, v12

    goto :goto_5

    :cond_8
    move/from16 v11, p3

    :goto_5
    and-int/lit8 v12, p9, 0x8

    if-eqz v12, :cond_9

    or-int/lit16 v1, v1, 0xc00

    move-wide/from16 v13, p4

    goto :goto_7

    :cond_9
    and-int/lit16 v14, v8, 0xc00

    if-nez v14, :cond_b

    move-wide/from16 v13, p4

    invoke-interface {v15, v13, v14}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v16

    if-eqz v16, :cond_a

    const/16 v16, 0x800

    goto :goto_6

    :cond_a
    const/16 v16, 0x400

    :goto_6
    or-int v1, v1, v16

    goto :goto_7

    :cond_b
    move-wide/from16 v13, p4

    :goto_7
    and-int/lit16 v6, v8, 0x6000

    if-nez v6, :cond_e

    and-int/lit8 v6, p9, 0x10

    if-nez v6, :cond_c

    move/from16 v6, p6

    invoke-interface {v15, v6}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v16

    if-eqz v16, :cond_d

    const/16 v16, 0x4000

    goto :goto_8

    :cond_c
    move/from16 v6, p6

    :cond_d
    const/16 v16, 0x2000

    :goto_8
    or-int v1, v1, v16

    goto :goto_9

    :cond_e
    move/from16 v6, p6

    :goto_9
    and-int/lit16 v7, v1, 0x2493

    const/16 v3, 0x2492

    const/4 v14, 0x0

    const/4 v13, 0x1

    if-eq v7, v3, :cond_f

    move v3, v13

    goto :goto_a

    :cond_f
    move v3, v14

    :goto_a
    and-int/lit8 v7, v1, 0x1

    invoke-interface {v15, v3, v7}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v3, "349@15020L6"

    invoke-static {v15, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v3, v8, 0x1

    const v7, -0xe001

    if-eqz v3, :cond_13

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v3

    if-eqz v3, :cond_10

    goto :goto_b

    .line 348
    :cond_10
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p9, 0x2

    if-eqz v2, :cond_11

    and-int/lit8 v1, v1, -0x71

    :cond_11
    and-int/lit8 v2, p9, 0x10

    if-eqz v2, :cond_12

    and-int/2addr v1, v7

    :cond_12
    move-wide/from16 v21, p4

    move v5, v1

    move-object v2, v4

    move/from16 v26, v6

    move-wide v3, v9

    move v1, v11

    goto :goto_e

    .line 354
    :cond_13
    :goto_b
    if-eqz v2, :cond_14

    .line 349
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_c

    .line 354
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_14
    move-object v2, v4

    .line 349
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_c
    and-int/lit8 v3, p9, 0x2

    if-eqz v3, :cond_15

    .line 350
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v4, 0x6

    invoke-virtual {v3, v15, v4}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v3

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit8 v1, v1, -0x71

    move-wide v9, v3

    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v9, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_15
    if-eqz v5, :cond_16

    .line 351
    sget-object v3, Landroidx/compose/material/ProgressIndicatorDefaults;->INSTANCE:Landroidx/compose/material/ProgressIndicatorDefaults;

    invoke-virtual {v3}, Landroidx/compose/material/ProgressIndicatorDefaults;->getStrokeWidth-D9Ej5fM()F

    move-result v3

    move v11, v3

    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v11, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_16
    if-eqz v12, :cond_17

    .line 352
    sget-object v3, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/Color$Companion;->getTransparent-0d7_KjU()J

    move-result-wide v3

    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    goto :goto_d

    .line 351
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_17
    move-wide/from16 v3, p4

    .line 352
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_d
    and-int/lit8 v5, p9, 0x10

    if-eqz v5, :cond_18

    .line 353
    sget-object v5, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getSquare-KaPHkGw()I

    move-result v5

    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v5, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    and-int/2addr v1, v7

    move-wide/from16 v21, v3

    move/from16 v26, v5

    move-wide v3, v9

    move v5, v1

    move v1, v11

    goto :goto_e

    .line 352
    .end local v5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_18
    move v5, v1

    move-wide/from16 v21, v3

    move/from16 v26, v6

    move-wide v3, v9

    move v1, v11

    .line 348
    .end local v9    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v11    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "$dirty":I
    .local v21, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v26, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :goto_e
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v6

    if-eqz v6, :cond_19

    const/4 v6, -0x1

    const-string v7, "androidx.compose.material.CircularProgressIndicator (ProgressIndicator.kt:353)"

    invoke-static {v0, v5, v6, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 355
    :cond_19
    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    check-cast v0, Landroidx/compose/runtime/CompositionLocal;

    .local v0, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v6, 0x0

    .local v6, "$changed$iv":I
    move-object v7, v15

    .local v7, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 692
    .local v9, "$i$f$getCurrent":I
    const v10, 0x789c5f52

    const-string v11, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v7, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 355
    .end local v0    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v6    # "$changed$iv":I
    .end local v7    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$getCurrent":I
    move-object v0, v10

    check-cast v0, Landroidx/compose/ui/unit/Density;

    .line 620
    .local v0, "$this$CircularProgressIndicator_LxG7B9w_u24lambda_u240":Landroidx/compose/ui/unit/Density;
    const/4 v6, 0x0

    .line 355
    .local v6, "$i$a$-with-ProgressIndicatorKt$CircularProgressIndicator$stroke$2":I
    new-instance v23, Landroidx/compose/ui/graphics/drawscope/Stroke;

    invoke-interface {v0, v1}, Landroidx/compose/ui/unit/Density;->toPx-0680j_4(F)F

    move-result v24

    const/16 v29, 0x1a

    const/16 v30, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v23 .. v30}, Landroidx/compose/ui/graphics/drawscope/Stroke;-><init>(FFIILandroidx/compose/ui/graphics/PathEffect;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move/from16 v6, v26

    .end local v0    # "$this$CircularProgressIndicator_LxG7B9w_u24lambda_u240":Landroidx/compose/ui/unit/Density;
    .end local v26    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    move-object/from16 v0, v23

    .line 357
    .local v0, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    const/4 v7, 0x0

    invoke-static {v7, v15, v14, v13}, Landroidx/compose/animation/core/InfiniteTransitionKt;->rememberInfiniteTransition(Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/animation/core/InfiniteTransition;

    move-result-object v9

    .line 360
    .local v9, "transition":Landroidx/compose/animation/core/InfiniteTransition;
    nop

    .line 361
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 362
    const/4 v11, 0x5

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 363
    sget-object v12, Lkotlin/jvm/internal/IntCompanionObject;->INSTANCE:Lkotlin/jvm/internal/IntCompanionObject;

    invoke-static {v12}, Landroidx/compose/animation/core/VectorConvertersKt;->getVectorConverter(Lkotlin/jvm/internal/IntCompanionObject;)Landroidx/compose/animation/core/TwoWayConverter;

    move-result-object v12

    .line 367
    nop

    .line 366
    nop

    .line 368
    invoke-static {}, Landroidx/compose/animation/core/EasingKt;->getLinearEasing()Landroidx/compose/animation/core/Easing;

    move-result-object v13

    .line 366
    move/from16 v24, v1

    .end local v1    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v24, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    const/16 v1, 0x1a04

    move-object/from16 v31, v2

    const/4 v2, 0x2

    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v31, "modifier":Landroidx/compose/ui/Modifier;
    invoke-static {v1, v14, v13, v2, v7}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 364
    const/4 v2, 0x6

    const/4 v13, 0x0

    const/16 v17, 0x0

    const-wide/16 v25, 0x0

    move-object/from16 p0, v1

    move/from16 p4, v2

    move-object/from16 p5, v13

    move-object/from16 p1, v17

    move-wide/from16 p2, v25

    invoke-static/range {p0 .. p5}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v13

    sget v1, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v1, v1, 0x1b0

    sget v2, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    .line 360
    move v2, v14

    const/4 v14, 0x0

    const/16 v17, 0x10

    move/from16 v16, v1

    const/16 v1, 0x800

    const/16 v20, 0x1

    invoke-static/range {v9 .. v17}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateValue(Landroidx/compose/animation/core/InfiniteTransition;Ljava/lang/Object;Ljava/lang/Object;Landroidx/compose/animation/core/TwoWayConverter;Landroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v27

    .line 359
    move-object/from16 v10, v27

    .line 374
    .local v10, "currentRotation$delegate":Landroidx/compose/runtime/State;
    nop

    .line 375
    nop

    .line 376
    nop

    .line 378
    const/16 v11, 0x534

    invoke-static {}, Landroidx/compose/animation/core/EasingKt;->getLinearEasing()Landroidx/compose/animation/core/Easing;

    move-result-object v12

    const/4 v13, 0x2

    invoke-static {v11, v2, v12, v13, v7}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v7

    check-cast v7, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 377
    const/4 v11, 0x6

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v16, 0x0

    move-object/from16 p0, v7

    move/from16 p4, v11

    move-object/from16 p5, v12

    move-object/from16 p1, v13

    move-wide/from16 p2, v16

    invoke-static/range {p0 .. p5}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v7

    sget v11, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v11, v11, 0x1b0

    sget v12, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v12, v12, 0x9

    or-int/2addr v11, v12

    .line 374
    const/4 v12, 0x0

    const/high16 v13, 0x438f0000    # 286.0f

    const/16 v16, 0x8

    move-object/from16 p3, v7

    move-object/from16 p0, v9

    move/from16 p6, v11

    move/from16 p1, v12

    move/from16 p2, v13

    move-object/from16 p4, v14

    move-object/from16 p5, v15

    move/from16 p7, v16

    .end local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .local p0, "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .local p5, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p0 .. p7}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v30

    .line 373
    .end local p0    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local v15    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v7, v30

    .line 383
    .local v7, "baseRotation$delegate":Landroidx/compose/runtime/State;
    nop

    .line 384
    nop

    .line 385
    nop

    .line 388
    const v11, -0x67356fa9

    const-string v12, "CC(remember):ProgressIndicator.kt#9igjgp"

    invoke-static {v15, v11, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v11, 0x0

    .local v11, "invalid$iv":Z
    move-object v13, v15

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 693
    .local v14, "$i$f$cache":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    .local v2, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 694
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v2, v1, :cond_1a

    .line 695
    const/4 v1, 0x0

    .local v1, "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$endAngle$2":I
    new-instance v19, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda11;

    invoke-direct/range {v19 .. v19}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda11;-><init>()V

    .end local v1    # "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$endAngle$2":I
    move-object/from16 v1, v19

    .line 696
    .local v1, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 697
    move-object v2, v1

    .end local v1    # "value$iv":Ljava/lang/Object;
    goto :goto_f

    .line 698
    :cond_1a
    nop

    .line 693
    .end local v2    # "it$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_f
    nop

    .line 388
    .end local v11    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v2}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 386
    const/4 v2, 0x6

    const/4 v11, 0x0

    const/4 v13, 0x0

    const-wide/16 v25, 0x0

    move-object/from16 p0, v1

    move/from16 p4, v2

    move-object/from16 p5, v11

    move-object/from16 p1, v13

    move-wide/from16 p2, v25

    invoke-static/range {p0 .. p5}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v1

    sget v2, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v2, v2, 0x1b0

    sget v11, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v11, v11, 0x9

    or-int/2addr v2, v11

    .line 383
    const/4 v11, 0x0

    const/high16 v13, 0x43910000    # 290.0f

    const/4 v14, 0x0

    const/16 v17, 0x8

    move-object/from16 p3, v1

    move/from16 p6, v2

    move-object/from16 p0, v9

    move/from16 p1, v11

    move/from16 p2, v13

    move-object/from16 p4, v14

    move-object/from16 p5, v15

    move/from16 p7, v17

    .end local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p0    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local p5    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p0 .. p7}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v28

    .line 382
    .end local p0    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local v15    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v1, v28

    .line 397
    .local v1, "endAngle$delegate":Landroidx/compose/runtime/State;
    nop

    .line 398
    nop

    .line 399
    nop

    .line 402
    const v2, -0x67353560

    invoke-static {v15, v2, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v2, 0x0

    .local v2, "invalid$iv":Z
    move-object v11, v15

    .local v11, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 699
    .local v13, "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 700
    .restart local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p0, v2

    .end local v2    # "invalid$iv":Z
    .local p0, "invalid$iv":Z
    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v14, v2, :cond_1b

    .line 701
    const/4 v2, 0x0

    .local v2, "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$startAngle$2":I
    new-instance v19, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda13;

    invoke-direct/range {v19 .. v19}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda13;-><init>()V

    .end local v2    # "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$startAngle$2":I
    move-object/from16 v2, v19

    .line 702
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v11, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 703
    move-object v14, v2

    .end local v2    # "value$iv":Ljava/lang/Object;
    goto :goto_10

    .line 704
    :cond_1b
    nop

    .line 699
    .end local v14    # "it$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_10
    nop

    .line 402
    .end local v11    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    .end local p0    # "invalid$iv":Z
    check-cast v14, Lkotlin/jvm/functions/Function1;

    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v14}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v2

    check-cast v2, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 400
    const/4 v11, 0x6

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-wide/16 v25, 0x0

    move-object/from16 p0, v2

    move/from16 p4, v11

    move-object/from16 p5, v13

    move-object/from16 p1, v14

    move-wide/from16 p2, v25

    invoke-static/range {p0 .. p5}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v2

    sget v11, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v11, v11, 0x1b0

    sget v13, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v13, v13, 0x9

    or-int/2addr v11, v13

    .line 397
    const/4 v13, 0x0

    const/high16 v14, 0x43910000    # 290.0f

    const/16 v17, 0x0

    const/16 v19, 0x8

    move-object/from16 p3, v2

    move-object/from16 p0, v9

    move/from16 p6, v11

    move/from16 p1, v13

    move/from16 p2, v14

    move-object/from16 p5, v15

    move-object/from16 p4, v17

    move/from16 p7, v19

    .end local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .local p0, "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local p5    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {p0 .. p7}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v29

    .line 396
    .end local p0    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local v15    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v2, v29

    .line 409
    .local v2, "startAngle$delegate":Landroidx/compose/runtime/State;
    invoke-static/range {v31 .. v31}, Landroidx/compose/foundation/ProgressSemanticsKt;->progressSemantics(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v11

    sget v13, Landroidx/compose/material/ProgressIndicatorKt;->CircularIndicatorDiameter:F

    invoke-static {v11, v13}, Landroidx/compose/foundation/layout/SizeKt;->size-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v11

    const v13, -0x673507e6

    invoke-static {v15, v13, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit16 v12, v5, 0x1c00

    const/16 v13, 0x800

    if-ne v12, v13, :cond_1c

    move/from16 v14, v20

    goto :goto_11

    :cond_1c
    const/4 v14, 0x0

    :goto_11
    invoke-interface {v15, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v12

    or-int/2addr v12, v14

    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v12, v13

    invoke-interface {v15, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v12, v13

    invoke-interface {v15, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v12, v13

    invoke-interface {v15, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v12, v13

    and-int/lit16 v13, v5, 0x380

    const/16 v14, 0x100

    if-ne v13, v14, :cond_1d

    move/from16 v14, v20

    goto :goto_12

    :cond_1d
    const/4 v14, 0x0

    :goto_12
    or-int/2addr v12, v14

    and-int/lit8 v13, v5, 0x70

    xor-int/lit8 v13, v13, 0x30

    const/16 v14, 0x20

    if-le v13, v14, :cond_1e

    invoke-interface {v15, v3, v4}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v13

    if-nez v13, :cond_1f

    :cond_1e
    and-int/lit8 v13, v5, 0x30

    const/16 v14, 0x20

    if-ne v13, v14, :cond_20

    :cond_1f
    move/from16 v14, v20

    goto :goto_13

    :cond_20
    const/4 v14, 0x0

    :goto_13
    or-int/2addr v12, v14

    .local v12, "invalid$iv":Z
    move-object v13, v15

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 705
    .local v14, "$i$f$cache":I
    move-object/from16 v23, v0

    .end local v0    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local v23, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 706
    .restart local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v12, :cond_22

    sget-object v18, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v28, v1

    .end local v1    # "endAngle$delegate":Landroidx/compose/runtime/State;
    .local v28, "endAngle$delegate":Landroidx/compose/runtime/State;
    invoke-virtual/range {v18 .. v18}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_21

    goto :goto_14

    .line 710
    :cond_21
    move-object/from16 v29, v2

    move-wide/from16 v25, v3

    move-object/from16 v30, v7

    move-object/from16 v27, v10

    goto :goto_15

    .line 706
    .end local v28    # "endAngle$delegate":Landroidx/compose/runtime/State;
    .restart local v1    # "endAngle$delegate":Landroidx/compose/runtime/State;
    :cond_22
    move-object/from16 v28, v1

    .line 707
    .end local v1    # "endAngle$delegate":Landroidx/compose/runtime/State;
    .restart local v28    # "endAngle$delegate":Landroidx/compose/runtime/State;
    :goto_14
    const/4 v1, 0x0

    .line 409
    .local v1, "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$4":I
    new-instance v20, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda14;

    move-object/from16 v29, v2

    move-wide/from16 v25, v3

    move-object/from16 v30, v7

    move-object/from16 v27, v10

    .end local v2    # "startAngle$delegate":Landroidx/compose/runtime/State;
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v7    # "baseRotation$delegate":Landroidx/compose/runtime/State;
    .end local v10    # "currentRotation$delegate":Landroidx/compose/runtime/State;
    .local v25, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v27, "currentRotation$delegate":Landroidx/compose/runtime/State;
    .local v29, "startAngle$delegate":Landroidx/compose/runtime/State;
    .local v30, "baseRotation$delegate":Landroidx/compose/runtime/State;
    invoke-direct/range {v20 .. v30}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda14;-><init>(JLandroidx/compose/ui/graphics/drawscope/Stroke;FJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    .line 707
    .end local v1    # "$i$a$-cache-ProgressIndicatorKt$CircularProgressIndicator$4":I
    move-object/from16 v1, v20

    .line 708
    .local v1, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 709
    move-object v0, v1

    .line 705
    .end local v0    # "it$iv":Ljava/lang/Object;
    .end local v1    # "value$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_15
    nop

    .line 409
    .end local v12    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v2, 0x0

    invoke-static {v11, v0, v15, v2}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 421
    .end local v9    # "transition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local v23    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .end local v27    # "currentRotation$delegate":Landroidx/compose/runtime/State;
    .end local v28    # "endAngle$delegate":Landroidx/compose/runtime/State;
    .end local v29    # "startAngle$delegate":Landroidx/compose/runtime/State;
    .end local v30    # "baseRotation$delegate":Landroidx/compose/runtime/State;
    :cond_23
    move v10, v5

    move v7, v6

    move-wide/from16 v5, v21

    move/from16 v4, v24

    move-wide/from16 v2, v25

    move-object/from16 v1, v31

    goto :goto_16

    .line 348
    .end local v5    # "$dirty":I
    .end local v6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .end local v21    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v24    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .end local v25    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v31    # "modifier":Landroidx/compose/ui/Modifier;
    .local v1, "$dirty":I
    .local p0, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_24
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move v7, v6

    move-wide v2, v9

    move-wide/from16 v5, p4

    move v10, v1

    move-object v1, v4

    move v4, v11

    .line 421
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v4, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v7, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v10, "$dirty":I
    :goto_16
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v11

    if-eqz v11, :cond_25

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda15;

    move/from16 v9, p9

    invoke-direct/range {v0 .. v9}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda15;-><init>(Landroidx/compose/ui/Modifier;JFJIII)V

    invoke-interface {v11, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_25
    return-void
.end method

.method public static final synthetic CircularProgressIndicator-MBs18nI(FLandroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V
    .locals 18
    .param p0, "progress"    # F
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p4, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Maintained for binary compatibility"
    .end annotation

    .line 431
    move/from16 v6, p6

    const v0, -0x186ac24b

    move-object/from16 v1, p5

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v15

    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v15, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(CircularProgressIndicator)N(progress,modifier,color:c#ui.graphics.Color,strokeWidth:c#ui.unit.Dp)430@18107L185:ProgressIndicator.kt#jmzs0o"

    invoke-static {v15, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p6

    .local v1, "$dirty":I
    and-int/lit8 v2, v6, 0x6

    if-nez v2, :cond_1

    move/from16 v7, p0

    invoke-interface {v15, v7}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int/2addr v1, v2

    goto :goto_1

    :cond_1
    move/from16 v7, p0

    :goto_1
    and-int/lit8 v2, p7, 0x2

    if-eqz v2, :cond_2

    or-int/lit8 v1, v1, 0x30

    move-object/from16 v3, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v3, v6, 0x30

    if-nez v3, :cond_4

    move-object/from16 v3, p1

    invoke-interface {v15, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x20

    goto :goto_2

    :cond_3
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v1, v4

    goto :goto_3

    :cond_4
    move-object/from16 v3, p1

    :goto_3
    and-int/lit16 v4, v6, 0x180

    if-nez v4, :cond_7

    and-int/lit8 v4, p7, 0x4

    if-nez v4, :cond_5

    move-wide/from16 v4, p2

    invoke-interface {v15, v4, v5}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x100

    goto :goto_4

    :cond_5
    move-wide/from16 v4, p2

    :cond_6
    const/16 v8, 0x80

    :goto_4
    or-int/2addr v1, v8

    goto :goto_5

    :cond_7
    move-wide/from16 v4, p2

    :goto_5
    and-int/lit8 v8, p7, 0x8

    if-eqz v8, :cond_8

    or-int/lit16 v1, v1, 0xc00

    move/from16 v9, p4

    goto :goto_7

    :cond_8
    and-int/lit16 v9, v6, 0xc00

    if-nez v9, :cond_a

    move/from16 v9, p4

    invoke-interface {v15, v9}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v10

    if-eqz v10, :cond_9

    const/16 v10, 0x800

    goto :goto_6

    :cond_9
    const/16 v10, 0x400

    :goto_6
    or-int/2addr v1, v10

    goto :goto_7

    :cond_a
    move/from16 v9, p4

    :goto_7
    and-int/lit16 v10, v1, 0x493

    const/16 v11, 0x492

    if-eq v10, v11, :cond_b

    const/4 v10, 0x1

    goto :goto_8

    :cond_b
    const/4 v10, 0x0

    :goto_8
    and-int/lit8 v11, v1, 0x1

    invoke-interface {v15, v10, v11}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v10

    if-eqz v10, :cond_14

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v10, "427@18022L6"

    invoke-static {v15, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v10, v6, 0x1

    if-eqz v10, :cond_e

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v10

    if-eqz v10, :cond_c

    goto :goto_9

    .line 425
    :cond_c
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p7, 0x4

    if-eqz v2, :cond_d

    and-int/lit16 v1, v1, -0x381

    :cond_d
    move-object v8, v3

    move v11, v9

    move-wide v9, v4

    goto :goto_c

    .line 431
    :cond_e
    :goto_9
    if-eqz v2, :cond_f

    .line 427
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_a

    .line 431
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_f
    move-object v2, v3

    .line 427
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_a
    and-int/lit8 v3, p7, 0x4

    if-eqz v3, :cond_10

    .line 428
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v10, 0x6

    invoke-virtual {v3, v15, v10}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v3

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit16 v1, v1, -0x381

    goto :goto_b

    .line 427
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_10
    move-wide v3, v4

    .line 428
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_b
    if-eqz v8, :cond_11

    .line 429
    sget-object v5, Landroidx/compose/material/ProgressIndicatorDefaults;->INSTANCE:Landroidx/compose/material/ProgressIndicatorDefaults;

    invoke-virtual {v5}, Landroidx/compose/material/ProgressIndicatorDefaults;->getStrokeWidth-D9Ej5fM()F

    move-result v5

    move-object v8, v2

    move-wide v9, v3

    move v11, v5

    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v5, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    goto :goto_c

    .line 428
    .end local v5    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_11
    move-object v8, v2

    move v11, v9

    move-wide v9, v3

    .line 425
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v8, "modifier":Landroidx/compose/ui/Modifier;
    .local v9, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v11, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :goto_c
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_12

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.CircularProgressIndicator (ProgressIndicator.kt:430)"

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 432
    :cond_12
    nop

    .line 433
    nop

    .line 434
    nop

    .line 435
    nop

    .line 436
    sget-object v0, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color$Companion;->getTransparent-0d7_KjU()J

    move-result-wide v12

    .line 437
    sget-object v0, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v14

    and-int/lit8 v0, v1, 0xe

    or-int/lit16 v0, v0, 0x6000

    and-int/lit8 v2, v1, 0x70

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x380

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x1c00

    or-int v16, v0, v2

    .line 431
    const/16 v17, 0x0

    invoke-static/range {v7 .. v17}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-DUhRLBM(FLandroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 438
    :cond_13
    move-object v2, v8

    move-wide v3, v9

    move v5, v11

    move v8, v1

    goto :goto_d

    .line 425
    .end local v8    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v9    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v11    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_14
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v2, v3

    move-wide v3, v4

    move v5, v9

    move v8, v1

    .line 438
    .end local v1    # "$dirty":I
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v5    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v8, "$dirty":I
    :goto_d
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v9

    if-eqz v9, :cond_15

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda9;

    move/from16 v1, p0

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda9;-><init>(FLandroidx/compose/ui/Modifier;JFII)V

    invoke-interface {v9, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_15
    return-void
.end method

.method public static final synthetic CircularProgressIndicator-aM-cp0Q(Landroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V
    .locals 18
    .param p0, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Maintained for binary compatibility"
    .end annotation

    .line 447
    move/from16 v5, p5

    const v0, -0x175ed17b

    move-object/from16 v1, p4

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(CircularProgressIndicator)N(modifier,color:c#ui.graphics.Color,strokeWidth:c#ui.unit.Dp)446@18574L169:ProgressIndicator.kt#jmzs0o"

    invoke-static {v13, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p5

    .local v1, "$dirty":I
    and-int/lit8 v2, p6, 0x1

    if-eqz v2, :cond_0

    or-int/lit8 v1, v1, 0x6

    move-object/from16 v3, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v3, v5, 0x6

    if-nez v3, :cond_2

    move-object/from16 v3, p0

    invoke-interface {v13, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

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
    and-int/lit8 v4, v5, 0x30

    if-nez v4, :cond_5

    and-int/lit8 v4, p6, 0x2

    if-nez v4, :cond_3

    move-wide/from16 v6, p1

    invoke-interface {v13, v6, v7}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x20

    goto :goto_2

    :cond_3
    move-wide/from16 v6, p1

    :cond_4
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v1, v4

    goto :goto_3

    :cond_5
    move-wide/from16 v6, p1

    :goto_3
    and-int/lit8 v4, p6, 0x4

    if-eqz v4, :cond_6

    or-int/lit16 v1, v1, 0x180

    move/from16 v8, p3

    goto :goto_5

    :cond_6
    and-int/lit16 v8, v5, 0x180

    if-nez v8, :cond_8

    move/from16 v8, p3

    invoke-interface {v13, v8}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v9

    if-eqz v9, :cond_7

    const/16 v9, 0x100

    goto :goto_4

    :cond_7
    const/16 v9, 0x80

    :goto_4
    or-int/2addr v1, v9

    goto :goto_5

    :cond_8
    move/from16 v8, p3

    :goto_5
    and-int/lit16 v9, v1, 0x93

    const/16 v10, 0x92

    if-eq v9, v10, :cond_9

    const/4 v9, 0x1

    goto :goto_6

    :cond_9
    const/4 v9, 0x0

    :goto_6
    and-int/lit8 v10, v1, 0x1

    invoke-interface {v13, v9, v10}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v9

    if-eqz v9, :cond_12

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v9, "443@18489L6"

    invoke-static {v13, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v9, v5, 0x1

    if-eqz v9, :cond_c

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_7

    .line 442
    :cond_a
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p6, 0x2

    if-eqz v2, :cond_b

    and-int/lit8 v1, v1, -0x71

    :cond_b
    move v9, v8

    move-wide v7, v6

    move-object v6, v3

    goto :goto_9

    .line 447
    :cond_c
    :goto_7
    if-eqz v2, :cond_d

    .line 443
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_8

    .line 447
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_d
    move-object v2, v3

    .line 443
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_8
    and-int/lit8 v3, p6, 0x2

    if-eqz v3, :cond_e

    .line 444
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v9, 0x6

    invoke-virtual {v3, v13, v9}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v6

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v6, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit8 v1, v1, -0x71

    :cond_e
    if-eqz v4, :cond_f

    .line 445
    sget-object v3, Landroidx/compose/material/ProgressIndicatorDefaults;->INSTANCE:Landroidx/compose/material/ProgressIndicatorDefaults;

    invoke-virtual {v3}, Landroidx/compose/material/ProgressIndicatorDefaults;->getStrokeWidth-D9Ej5fM()F

    move-result v3

    move v9, v3

    move-wide v7, v6

    move-object v6, v2

    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v3, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    goto :goto_9

    .line 444
    .end local v3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_f
    move v9, v8

    move-wide v7, v6

    move-object v6, v2

    .line 442
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v6, "modifier":Landroidx/compose/ui/Modifier;
    .local v7, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v9, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :goto_9
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_10

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.CircularProgressIndicator (ProgressIndicator.kt:446)"

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 448
    :cond_10
    nop

    .line 449
    nop

    .line 450
    nop

    .line 451
    sget-object v0, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/Color$Companion;->getTransparent-0d7_KjU()J

    move-result-wide v10

    .line 452
    sget-object v0, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getSquare-KaPHkGw()I

    move-result v12

    and-int/lit8 v0, v1, 0xe

    or-int/lit16 v0, v0, 0xc00

    and-int/lit8 v2, v1, 0x70

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x380

    or-int v14, v0, v2

    .line 447
    const/4 v15, 0x0

    invoke-static/range {v6 .. v15}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-LxG7B9w(Landroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 453
    :cond_11
    move-wide v2, v7

    move v4, v9

    move v7, v1

    move-object v1, v6

    goto :goto_a

    .line 442
    .end local v6    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v7    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v9    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    :cond_12
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-wide/from16 v16, v6

    move v7, v1

    move-object v1, v3

    move-wide/from16 v2, v16

    move v4, v8

    .line 453
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v4, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0":F
    .local v7, "$dirty":I
    :goto_a
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v8

    if-eqz v8, :cond_13

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda1;

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/ui/Modifier;JFII)V

    invoke-interface {v8, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_13
    return-void
.end method

.method private static final CircularProgressIndicator_DUhRLBM$lambda$2$0(FJLandroidx/compose/ui/graphics/drawscope/Stroke;JLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 6
    .param p0, "$coercedProgress"    # F
    .param p1, "$$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p3, "$stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;
    .param p4, "$$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p6, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    .line 323
    const/high16 v1, 0x43870000    # 270.0f

    .line 324
    .local v1, "startAngle":F
    const/high16 v0, 0x43b40000    # 360.0f

    mul-float v2, p0, v0

    .line 325
    .local v2, "sweep":F
    invoke-static {p6, p1, p2, p3}, Landroidx/compose/material/ProgressIndicatorKt;->drawCircularIndicatorBackground-bw27NRU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    .line 326
    move-object v5, p3

    move-wide v3, p4

    move-object v0, p6

    .end local p3    # "$stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .end local p4    # "$$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p6    # "$this$Canvas":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v0, "$this$Canvas":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v3, "$$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "$stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-static/range {v0 .. v5}, Landroidx/compose/material/ProgressIndicatorKt;->drawDeterminateCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    .line 327
    sget-object p3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p3
.end method

.method private static final CircularProgressIndicator_DUhRLBM$lambda$3(FLandroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 12

    or-int/lit8 v0, p8, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v10

    move v1, p0

    move-object v2, p1

    move-wide v3, p2

    move/from16 v5, p4

    move-wide/from16 v6, p5

    move/from16 v8, p7

    move/from16 v11, p9

    move-object/from16 v9, p10

    invoke-static/range {v1 .. v11}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-DUhRLBM(FLandroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$1(Landroidx/compose/runtime/State;)I
    .locals 4
    .param p0, "$currentRotation$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 360
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 736
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 360
    return v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$2(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$baseRotation$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 374
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 737
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

    .line 374
    return v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$3$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 389
    const/16 v0, 0x534

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 390
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v1, Landroidx/compose/material/ProgressIndicatorKt;->CircularEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v1, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 391
    const/high16 v0, 0x43910000    # 290.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x29a

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 392
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$4(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$endAngle$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 383
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 738
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

    .line 383
    return v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$5$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 403
    const/16 v0, 0x534

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 404
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x29a

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v1, Landroidx/compose/material/ProgressIndicatorKt;->CircularEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v1, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 405
    const/high16 v0, 0x43910000    # 290.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->getDurationMillis()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 406
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$6(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$startAngle$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 397
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 739
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

    .line 397
    return v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$7$0(JLandroidx/compose/ui/graphics/drawscope/Stroke;FJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 9
    .param p0, "$$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p2, "$stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;
    .param p3, "$$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p4, "$$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p6, "$currentRotation$delegate"    # Landroidx/compose/runtime/State;
    .param p7, "$endAngle$delegate"    # Landroidx/compose/runtime/State;
    .param p8, "$startAngle$delegate"    # Landroidx/compose/runtime/State;
    .param p9, "$baseRotation$delegate"    # Landroidx/compose/runtime/State;
    .param p10, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    .line 410
    move-object/from16 v0, p10

    invoke-static {v0, p0, p1, p2}, Landroidx/compose/material/ProgressIndicatorKt;->drawCircularIndicatorBackground-bw27NRU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    .line 412
    invoke-static {p6}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$1(Landroidx/compose/runtime/State;)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x43580000    # 216.0f

    mul-float/2addr v1, v2

    const/high16 v2, 0x43b40000    # 360.0f

    rem-float v7, v1, v2

    .line 415
    .local v7, "currentRotationAngleOffset":F
    invoke-static/range {p7 .. p7}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$4(Landroidx/compose/runtime/State;)F

    move-result v1

    invoke-static/range {p8 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$6(Landroidx/compose/runtime/State;)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 418
    .local v3, "sweep":F
    const/high16 v1, -0x3d4c0000    # -90.0f

    add-float/2addr v1, v7

    invoke-static/range {p9 .. p9}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$2(Landroidx/compose/runtime/State;)F

    move-result v2

    add-float v8, v1, v2

    .line 419
    .local v8, "offset":F
    invoke-static/range {p8 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator_LxG7B9w$lambda$6(Landroidx/compose/runtime/State;)F

    move-result v1

    add-float/2addr v1, v8

    move-object v6, p2

    move v2, p3

    move-wide v4, p4

    invoke-static/range {v0 .. v6}, Landroidx/compose/material/ProgressIndicatorKt;->drawIndeterminateCircularIndicator-hrjfTZI(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    .line 420
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_LxG7B9w$lambda$8(Landroidx/compose/ui/Modifier;JFJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11

    or-int/lit8 v0, p7, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v9

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move-wide v5, p4

    move/from16 v7, p6

    move/from16 v10, p8

    move-object/from16 v8, p9

    invoke-static/range {v1 .. v10}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-LxG7B9w(Landroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_MBs18nI$lambda$0(FLandroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 9

    or-int/lit8 v0, p5, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v7

    move v1, p0

    move-object v2, p1

    move-wide v3, p2

    move v5, p4

    move v8, p6

    move-object/from16 v6, p7

    invoke-static/range {v1 .. v8}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-MBs18nI(FLandroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final CircularProgressIndicator_aM_cp0Q$lambda$0(Landroidx/compose/ui/Modifier;JFIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 8

    or-int/lit8 v0, p4, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v6

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move v7, p5

    move-object v5, p6

    invoke-static/range {v1 .. v7}, Landroidx/compose/material/ProgressIndicatorKt;->CircularProgressIndicator-aM-cp0Q(Landroidx/compose/ui/Modifier;JFLandroidx/compose/runtime/Composer;II)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static final LinearProgressIndicator-2cYBFYY(Landroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V
    .locals 35
    .param p0, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p5, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p6, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p7, "$changed"    # I

    .line 145
    move/from16 v7, p7

    const v0, 0x598122d0

    move-object/from16 v1, p6

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .end local p6    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(LinearProgressIndicator)N(modifier,color:c#ui.graphics.Color,backgroundColor:c#ui.graphics.Color,strokeCap:c#ui.graphics.StrokeCap)145@6690L28,155@7116L236,150@6980L397,168@7566L236,163@7430L397,181@8017L240,176@7881L401,194@8472L240,189@8336L401,206@8908L434,201@8742L600:ProgressIndicator.kt#jmzs0o"

    invoke-static {v13, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p7

    .local v1, "$dirty":I
    and-int/lit8 v2, p8, 0x1

    if-eqz v2, :cond_0

    or-int/lit8 v1, v1, 0x6

    move-object/from16 v3, p0

    goto :goto_1

    :cond_0
    and-int/lit8 v3, v7, 0x6

    if-nez v3, :cond_2

    move-object/from16 v3, p0

    invoke-interface {v13, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

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
    and-int/lit8 v4, v7, 0x30

    if-nez v4, :cond_5

    and-int/lit8 v4, p8, 0x2

    if-nez v4, :cond_3

    move-wide/from16 v8, p1

    invoke-interface {v13, v8, v9}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v4

    if-eqz v4, :cond_4

    const/16 v4, 0x20

    goto :goto_2

    :cond_3
    move-wide/from16 v8, p1

    :cond_4
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v1, v4

    goto :goto_3

    :cond_5
    move-wide/from16 v8, p1

    :goto_3
    and-int/lit16 v4, v7, 0x180

    if-nez v4, :cond_8

    and-int/lit8 v4, p8, 0x4

    if-nez v4, :cond_6

    move-wide/from16 v10, p3

    invoke-interface {v13, v10, v11}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v4

    if-eqz v4, :cond_7

    const/16 v4, 0x100

    goto :goto_4

    :cond_6
    move-wide/from16 v10, p3

    :cond_7
    const/16 v4, 0x80

    :goto_4
    or-int/2addr v1, v4

    goto :goto_5

    :cond_8
    move-wide/from16 v10, p3

    :goto_5
    and-int/lit16 v4, v7, 0xc00

    const/16 v12, 0x800

    if-nez v4, :cond_b

    and-int/lit8 v4, p8, 0x8

    if-nez v4, :cond_9

    move/from16 v4, p5

    invoke-interface {v13, v4}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v14

    if-eqz v14, :cond_a

    move v14, v12

    goto :goto_6

    :cond_9
    move/from16 v4, p5

    :cond_a
    const/16 v14, 0x400

    :goto_6
    or-int/2addr v1, v14

    goto :goto_7

    :cond_b
    move/from16 v4, p5

    :goto_7
    and-int/lit16 v14, v1, 0x493

    const/16 v15, 0x492

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v14, v15, :cond_c

    move v14, v6

    goto :goto_8

    :cond_c
    move v14, v5

    :goto_8
    and-int/lit8 v15, v1, 0x1

    invoke-interface {v13, v14, v15}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v14

    if-eqz v14, :cond_27

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v14, "141@6521L6"

    invoke-static {v13, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v14, v7, 0x1

    if-eqz v14, :cond_11

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v14

    if-eqz v14, :cond_d

    goto :goto_9

    .line 140
    :cond_d
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p8, 0x2

    if-eqz v2, :cond_e

    and-int/lit8 v1, v1, -0x71

    :cond_e
    and-int/lit8 v2, p8, 0x4

    if-eqz v2, :cond_f

    and-int/lit16 v1, v1, -0x381

    :cond_f
    and-int/lit8 v2, p8, 0x8

    if-eqz v2, :cond_10

    and-int/lit16 v1, v1, -0x1c01

    :cond_10
    move-object v2, v3

    move-wide/from16 v18, v10

    move-wide/from16 v33, v8

    move v8, v1

    move v1, v4

    move-wide/from16 v3, v33

    goto :goto_d

    .line 145
    :cond_11
    :goto_9
    if-eqz v2, :cond_12

    .line 141
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_a

    .line 145
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_12
    move-object v2, v3

    .line 141
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_a
    and-int/lit8 v3, p8, 0x2

    if-eqz v3, :cond_13

    .line 142
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v14, 0x6

    invoke-virtual {v3, v13, v14}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v8

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v8, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit8 v1, v1, -0x71

    move-wide/from16 v17, v8

    goto :goto_b

    .line 141
    .end local v8    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_13
    move-wide/from16 v17, v8

    .line 142
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v17, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_b
    and-int/lit8 v3, p8, 0x4

    if-eqz v3, :cond_14

    .line 143
    const/16 v23, 0xe

    const/16 v24, 0x0

    const v19, 0x3e75c28f    # 0.24f

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-static/range {v17 .. v24}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v8

    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v8, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v1, v1, -0x381

    goto :goto_c

    .line 142
    .end local v8    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_14
    move-wide v8, v10

    .line 143
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v8    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_c
    and-int/lit8 v3, p8, 0x8

    if-eqz v3, :cond_15

    .line 144
    sget-object v3, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v3

    .end local p5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v3, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    and-int/lit16 v1, v1, -0x1c01

    move-wide/from16 v33, v8

    move v8, v1

    move v1, v3

    move-wide/from16 v3, v17

    move-wide/from16 v18, v33

    goto :goto_d

    .line 143
    .end local v3    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local p5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_15
    move-wide/from16 v33, v8

    move v8, v1

    move v1, v4

    move-wide/from16 v3, v17

    move-wide/from16 v18, v33

    .line 140
    .end local v17    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v8, "$dirty":I
    .local v18, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_d
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v9

    if-eqz v9, :cond_16

    const/4 v9, -0x1

    const-string v10, "androidx.compose.material.LinearProgressIndicator (ProgressIndicator.kt:144)"

    invoke-static {v0, v8, v9, v10}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 146
    :cond_16
    const/4 v0, 0x0

    invoke-static {v0, v13, v5, v6}, Landroidx/compose/animation/core/InfiniteTransitionKt;->rememberInfiniteTransition(Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/animation/core/InfiniteTransition;

    move-result-object v0

    .line 151
    .local v0, "infiniteTransition":Landroidx/compose/animation/core/InfiniteTransition;
    nop

    .line 152
    nop

    .line 153
    nop

    .line 156
    const v9, -0x23bf9c4

    const-string v10, "CC(remember):ProgressIndicator.kt#9igjgp"

    invoke-static {v13, v9, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid$iv":Z
    move-object v11, v13

    .local v11, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v14, 0x0

    .line 627
    .local v14, "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v15

    .local v15, "it$iv":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 628
    .local v17, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v20, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v20 .. v20}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v15, v6, :cond_17

    .line 629
    const/4 v6, 0x0

    .local v6, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$firstLineHead$2":I
    new-instance v20, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda3;

    invoke-direct/range {v20 .. v20}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda3;-><init>()V

    .end local v6    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$firstLineHead$2":I
    move-object/from16 v6, v20

    .line 630
    .local v6, "value$iv":Ljava/lang/Object;
    invoke-interface {v11, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 631
    move-object v15, v6

    .end local v6    # "value$iv":Ljava/lang/Object;
    goto :goto_e

    .line 632
    :cond_17
    nop

    .line 627
    .end local v15    # "it$iv":Ljava/lang/Object;
    .end local v17    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_e
    nop

    .line 156
    .end local v9    # "invalid$iv":Z
    .end local v11    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v14    # "$i$f$cache":I
    check-cast v15, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v15}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v6

    check-cast v6, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 154
    const/4 v9, 0x6

    const/4 v11, 0x0

    const/4 v14, 0x0

    const-wide/16 v22, 0x0

    move-object/from16 p0, v6

    move/from16 p4, v9

    move-object/from16 p5, v11

    move-object/from16 p1, v14

    move-wide/from16 p2, v22

    invoke-static/range {p0 .. p5}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v11

    sget v6, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v6, v6, 0x1b0

    sget v9, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v9, v9, 0x9

    or-int v14, v6, v9

    .line 151
    const/4 v9, 0x0

    move-object v6, v10

    const/high16 v10, 0x3f800000    # 1.0f

    move v15, v12

    const/4 v12, 0x0

    move/from16 v17, v15

    const/16 v15, 0x8

    move/from16 p0, v8

    move-object v8, v0

    move/from16 v0, p0

    move-object/from16 p0, v2

    move-object v2, v6

    move-wide/from16 v5, v18

    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v18    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v0, "$dirty":I
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v8, "infiniteTransition":Landroidx/compose/animation/core/InfiniteTransition;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    invoke-static/range {v8 .. v15}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v23

    .line 150
    nop

    .line 164
    .local v23, "firstLineHead$delegate":Landroidx/compose/runtime/State;
    nop

    .line 165
    nop

    .line 166
    nop

    .line 169
    const v9, -0x23bc184

    invoke-static {v13, v9, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .restart local v9    # "invalid$iv":Z
    move-object v10, v13

    .local v10, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 633
    .local v11, "$i$f$cache":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 634
    .local v14, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_18

    .line 635
    const/4 v15, 0x0

    .local v15, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$firstLineTail$2":I
    new-instance v18, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda4;

    invoke-direct/range {v18 .. v18}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda4;-><init>()V

    .end local v15    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$firstLineTail$2":I
    move-object/from16 v15, v18

    .line 636
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v10, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 637
    move-object v12, v15

    .end local v15    # "value$iv":Ljava/lang/Object;
    goto :goto_f

    .line 638
    :cond_18
    nop

    .line 633
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_f
    nop

    .line 169
    .end local v9    # "invalid$iv":Z
    .end local v10    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache":I
    check-cast v12, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v12}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v9

    move-object/from16 v27, v9

    check-cast v27, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 167
    const/16 v31, 0x6

    const/16 v32, 0x0

    const/16 v28, 0x0

    const-wide/16 v29, 0x0

    invoke-static/range {v27 .. v32}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v11

    sget v9, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v9, v9, 0x1b0

    sget v10, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v10, v10, 0x9

    or-int v14, v9, v10

    .line 164
    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v15, 0x8

    move-object/from16 v7, v23

    .end local v23    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .local v7, "firstLineHead$delegate":Landroidx/compose/runtime/State;
    invoke-static/range {v8 .. v15}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v24

    .line 163
    nop

    .line 177
    .local v24, "firstLineTail$delegate":Landroidx/compose/runtime/State;
    nop

    .line 178
    nop

    .line 179
    nop

    .line 182
    const v9, -0x23b8920

    invoke-static {v13, v9, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .restart local v9    # "invalid$iv":Z
    move-object v10, v13

    .restart local v10    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 639
    .restart local v11    # "$i$f$cache":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .restart local v12    # "it$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 640
    .restart local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_19

    .line 641
    const/4 v15, 0x0

    .local v15, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$secondLineHead$2":I
    new-instance v18, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda5;

    invoke-direct/range {v18 .. v18}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda5;-><init>()V

    .end local v15    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$secondLineHead$2":I
    move-object/from16 v15, v18

    .line 642
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v10, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 643
    move-object v12, v15

    .end local v15    # "value$iv":Ljava/lang/Object;
    goto :goto_10

    .line 644
    :cond_19
    nop

    .line 639
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_10
    nop

    .line 182
    .end local v9    # "invalid$iv":Z
    .end local v10    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache":I
    check-cast v12, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v12}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v9

    move-object/from16 v27, v9

    check-cast v27, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 180
    const/16 v31, 0x6

    const/16 v32, 0x0

    const/16 v28, 0x0

    const-wide/16 v29, 0x0

    invoke-static/range {v27 .. v32}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v11

    sget v9, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v9, v9, 0x1b0

    sget v10, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v10, v10, 0x9

    or-int v14, v9, v10

    .line 177
    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v15, 0x8

    move-wide/from16 v18, v3

    move-object/from16 v3, v24

    .end local v24    # "firstLineTail$delegate":Landroidx/compose/runtime/State;
    .local v3, "firstLineTail$delegate":Landroidx/compose/runtime/State;
    .local v18, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-static/range {v8 .. v15}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v25

    .line 176
    move-object/from16 v4, v25

    .line 190
    .local v4, "secondLineHead$delegate":Landroidx/compose/runtime/State;
    nop

    .line 191
    nop

    .line 192
    nop

    .line 195
    const v9, -0x23b5040

    invoke-static {v13, v9, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .restart local v9    # "invalid$iv":Z
    move-object v10, v13

    .restart local v10    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 645
    .restart local v11    # "$i$f$cache":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .restart local v12    # "it$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 646
    .restart local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v12, v15, :cond_1a

    .line 647
    const/4 v15, 0x0

    .local v15, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$secondLineTail$2":I
    new-instance v20, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda6;

    invoke-direct/range {v20 .. v20}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda6;-><init>()V

    .end local v15    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$secondLineTail$2":I
    move-object/from16 v15, v20

    .line 648
    .local v15, "value$iv":Ljava/lang/Object;
    invoke-interface {v10, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 649
    move-object v12, v15

    .end local v15    # "value$iv":Ljava/lang/Object;
    goto :goto_11

    .line 650
    :cond_1a
    nop

    .line 645
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_11
    nop

    .line 195
    .end local v9    # "invalid$iv":Z
    .end local v10    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache":I
    check-cast v12, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v12}, Landroidx/compose/animation/core/AnimationSpecKt;->keyframes(Lkotlin/jvm/functions/Function1;)Landroidx/compose/animation/core/KeyframesSpec;

    move-result-object v9

    move-object/from16 v27, v9

    check-cast v27, Landroidx/compose/animation/core/DurationBasedAnimationSpec;

    .line 193
    const/16 v31, 0x6

    const/16 v32, 0x0

    const/16 v28, 0x0

    const-wide/16 v29, 0x0

    invoke-static/range {v27 .. v32}, Landroidx/compose/animation/core/AnimationSpecKt;->infiniteRepeatable-9IiC70o$default(Landroidx/compose/animation/core/DurationBasedAnimationSpec;Landroidx/compose/animation/core/RepeatMode;JILjava/lang/Object;)Landroidx/compose/animation/core/InfiniteRepeatableSpec;

    move-result-object v11

    sget v9, Landroidx/compose/animation/core/InfiniteTransition;->$stable:I

    or-int/lit16 v9, v9, 0x1b0

    sget v10, Landroidx/compose/animation/core/InfiniteRepeatableSpec;->$stable:I

    shl-int/lit8 v10, v10, 0x9

    or-int v14, v9, v10

    .line 190
    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v15, 0x8

    invoke-static/range {v8 .. v15}, Landroidx/compose/animation/core/InfiniteTransitionKt;->animateFloat(Landroidx/compose/animation/core/InfiniteTransition;FFLandroidx/compose/animation/core/InfiniteRepeatableSpec;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v26

    .line 189
    move-object/from16 v9, v26

    .line 203
    .local v9, "secondLineTail$delegate":Landroidx/compose/runtime/State;
    nop

    .line 204
    invoke-static/range {p0 .. p0}, Landroidx/compose/material/ProgressIndicatorKt;->increaseSemanticsBounds(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 205
    invoke-static {v10}, Landroidx/compose/foundation/ProgressSemanticsKt;->progressSemantics(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 206
    sget v11, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorWidth:F

    sget v12, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorHeight:F

    invoke-static {v10, v11, v12}, Landroidx/compose/foundation/layout/SizeKt;->size-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object v10

    .line 207
    const v11, -0x23b18fe

    invoke-static {v13, v11, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit16 v2, v0, 0x380

    xor-int/lit16 v2, v2, 0x180

    const/16 v11, 0x100

    if-le v2, v11, :cond_1b

    invoke-interface {v13, v5, v6}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v2

    if-nez v2, :cond_1c

    :cond_1b
    and-int/lit16 v2, v0, 0x180

    const/16 v11, 0x100

    if-ne v2, v11, :cond_1d

    :cond_1c
    const/4 v2, 0x1

    goto :goto_12

    :cond_1d
    const/4 v2, 0x0

    :goto_12
    and-int/lit16 v11, v0, 0x1c00

    xor-int/lit16 v11, v11, 0xc00

    const/16 v15, 0x800

    if-le v11, v15, :cond_1e

    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v11

    if-nez v11, :cond_1f

    :cond_1e
    and-int/lit16 v11, v0, 0xc00

    const/16 v15, 0x800

    if-ne v11, v15, :cond_20

    :cond_1f
    const/4 v11, 0x1

    goto :goto_13

    :cond_20
    const/4 v11, 0x0

    :goto_13
    or-int/2addr v2, v11

    invoke-interface {v13, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v2, v11

    invoke-interface {v13, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v2, v11

    and-int/lit8 v11, v0, 0x70

    xor-int/lit8 v11, v11, 0x30

    const/16 v12, 0x20

    if-le v11, v12, :cond_21

    move-wide/from16 v11, v18

    .end local v18    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v11, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-interface {v13, v11, v12}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v14

    if-nez v14, :cond_22

    goto :goto_14

    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v18    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_21
    move-wide/from16 v11, v18

    .end local v18    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_14
    and-int/lit8 v14, v0, 0x30

    const/16 v15, 0x20

    if-ne v14, v15, :cond_23

    :cond_22
    const/16 v21, 0x1

    goto :goto_15

    :cond_23
    const/16 v21, 0x0

    :goto_15
    or-int v2, v2, v21

    invoke-interface {v13, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v2, v14

    invoke-interface {v13, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v2, v14

    .local v2, "invalid$iv":Z
    move-object v14, v13

    .local v14, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 651
    .local v15, "$i$f$cache":I
    move/from16 v16, v0

    .end local v0    # "$dirty":I
    .local v16, "$dirty":I
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv":Ljava/lang/Object;
    const/16 v27, 0x0

    .line 652
    .local v27, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v2, :cond_25

    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v20, v1

    .end local v1    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v20, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_24

    goto :goto_16

    .line 656
    :cond_24
    move-object/from16 v24, v3

    move-object/from16 v25, v4

    move-wide/from16 v18, v5

    move-object/from16 v26, v9

    goto :goto_17

    .line 652
    .end local v20    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local v1    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_25
    move/from16 v20, v1

    .line 653
    .end local v1    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local v20    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :goto_16
    const/4 v1, 0x0

    .line 207
    .local v1, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$4":I
    new-instance v17, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda7;

    move-object/from16 v24, v3

    move-object/from16 v25, v4

    move-wide/from16 v18, v5

    move-object/from16 v23, v7

    move-object/from16 v26, v9

    move-wide/from16 v21, v11

    .end local v3    # "firstLineTail$delegate":Landroidx/compose/runtime/State;
    .end local v4    # "secondLineHead$delegate":Landroidx/compose/runtime/State;
    .end local v5    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v7    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .end local v9    # "secondLineTail$delegate":Landroidx/compose/runtime/State;
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v18, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v21, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v23    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .restart local v24    # "firstLineTail$delegate":Landroidx/compose/runtime/State;
    .local v25, "secondLineHead$delegate":Landroidx/compose/runtime/State;
    .local v26, "secondLineTail$delegate":Landroidx/compose/runtime/State;
    invoke-direct/range {v17 .. v26}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda7;-><init>(JIJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    .line 653
    .end local v1    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$4":I
    .end local v21    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v23    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .restart local v7    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .restart local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    move-object/from16 v1, v17

    .line 654
    .local v1, "value$iv":Ljava/lang/Object;
    invoke-interface {v14, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 655
    move-object v0, v1

    .line 651
    .end local v0    # "it$iv":Ljava/lang/Object;
    .end local v1    # "value$iv":Ljava/lang/Object;
    .end local v27    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_17
    nop

    .line 207
    .end local v2    # "invalid$iv":Z
    .end local v14    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 202
    const/4 v1, 0x0

    invoke-static {v10, v0, v13, v1}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 217
    .end local v7    # "firstLineHead$delegate":Landroidx/compose/runtime/State;
    .end local v8    # "infiniteTransition":Landroidx/compose/animation/core/InfiniteTransition;
    .end local v24    # "firstLineTail$delegate":Landroidx/compose/runtime/State;
    .end local v25    # "secondLineHead$delegate":Landroidx/compose/runtime/State;
    .end local v26    # "secondLineTail$delegate":Landroidx/compose/runtime/State;
    :cond_26
    move-object/from16 v1, p0

    move-wide v2, v11

    move-wide/from16 v4, v18

    move/from16 v6, v20

    goto :goto_18

    .line 140
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v16    # "$dirty":I
    .end local v18    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v20    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "$dirty":I
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_27
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v16, v1

    move-object v1, v3

    move v6, v4

    move-wide v2, v8

    move-wide v4, v10

    .line 217
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local v16    # "$dirty":I
    :goto_18
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v9

    if-eqz v9, :cond_28

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda8;

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda8;-><init>(Landroidx/compose/ui/Modifier;JJIII)V

    invoke-interface {v9, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_28
    return-void
.end method

.method public static final synthetic LinearProgressIndicator-RIQooxk(Landroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Maintained for binary compatibility"
    .end annotation

    .line 234
    move/from16 v6, p6

    const v0, -0x30d701c2

    move-object/from16 v1, p5

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v13

    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v13, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(LinearProgressIndicator)N(modifier,color:c#ui.graphics.Color,backgroundColor:c#ui.graphics.Color)233@10044L85:ProgressIndicator.kt#jmzs0o"

    invoke-static {v13, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

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

    invoke-interface {v13, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

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

    invoke-interface {v13, v4, v5}, Landroidx/compose/runtime/Composer;->changed(J)Z

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
    and-int/lit16 v7, v6, 0x180

    if-nez v7, :cond_8

    and-int/lit8 v7, p7, 0x4

    if-nez v7, :cond_6

    move-wide/from16 v7, p3

    invoke-interface {v13, v7, v8}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v9

    if-eqz v9, :cond_7

    const/16 v9, 0x100

    goto :goto_4

    :cond_6
    move-wide/from16 v7, p3

    :cond_7
    const/16 v9, 0x80

    :goto_4
    or-int/2addr v1, v9

    goto :goto_5

    :cond_8
    move-wide/from16 v7, p3

    :goto_5
    and-int/lit16 v9, v1, 0x93

    const/16 v10, 0x92

    if-eq v9, v10, :cond_9

    const/4 v9, 0x1

    goto :goto_6

    :cond_9
    const/4 v9, 0x0

    :goto_6
    and-int/lit8 v10, v1, 0x1

    invoke-interface {v13, v9, v10}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v9

    if-eqz v9, :cond_13

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v9, "231@9947L6"

    invoke-static {v13, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v9, v6, 0x1

    if-eqz v9, :cond_d

    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_7

    .line 230
    :cond_a
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p7, 0x2

    if-eqz v2, :cond_b

    and-int/lit8 v1, v1, -0x71

    :cond_b
    and-int/lit8 v2, p7, 0x4

    if-eqz v2, :cond_c

    and-int/lit16 v1, v1, -0x381

    :cond_c
    move-wide v10, v7

    move-object v7, v3

    move-wide v8, v4

    goto :goto_a

    .line 234
    :cond_d
    :goto_7
    if-eqz v2, :cond_e

    .line 231
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_8

    .line 234
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_e
    move-object v2, v3

    .line 231
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_8
    and-int/lit8 v3, p7, 0x2

    if-eqz v3, :cond_f

    .line 232
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v9, 0x6

    invoke-virtual {v3, v13, v9}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v3

    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit8 v1, v1, -0x71

    move-wide v14, v3

    goto :goto_9

    .line 231
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_f
    move-wide v14, v4

    .line 232
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v14, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_9
    and-int/lit8 v3, p7, 0x4

    if-eqz v3, :cond_10

    .line 233
    const/16 v20, 0xe

    const/16 v21, 0x0

    const v16, 0x3e75c28f    # 0.24f

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v14 .. v21}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v3

    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v1, v1, -0x381

    move-object v7, v2

    move-wide v10, v3

    move-wide v8, v14

    goto :goto_a

    .line 232
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_10
    move-wide v10, v7

    move-wide v8, v14

    move-object v7, v2

    .line 230
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v7, "modifier":Landroidx/compose/ui/Modifier;
    .local v8, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v10, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_a
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_11

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.LinearProgressIndicator (ProgressIndicator.kt:233)"

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 234
    :cond_11
    sget-object v0, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v12

    and-int/lit8 v0, v1, 0xe

    and-int/lit8 v2, v1, 0x70

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x380

    or-int v14, v0, v2

    const/4 v15, 0x0

    invoke-static/range {v7 .. v15}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-2cYBFYY(Landroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_12
    move-wide v2, v8

    move-wide v4, v10

    move v8, v1

    move-object v1, v7

    goto :goto_b

    .line 230
    .end local v7    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v8    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v10    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_13
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-wide/from16 v22, v7

    move v8, v1

    move-object v1, v3

    move-wide v2, v4

    move-wide/from16 v4, v22

    .line 234
    .end local p0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v1, "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v8, "$dirty":I
    :goto_b
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v9

    if-eqz v9, :cond_14

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda2;

    move/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/ui/Modifier;JJII)V

    invoke-interface {v9, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_14
    return-void
.end method

.method public static final LinearProgressIndicator-_5eSR-E(FLandroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V
    .locals 26
    .param p0, "progress"    # F
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p7, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p8, "$changed"    # I

    .line 109
    move/from16 v8, p8

    const v0, -0x1fb571e0

    move-object/from16 v1, p7

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v10

    .end local p7    # "$composer":Landroidx/compose/runtime/Composer;
    .local v10, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(LinearProgressIndicator)N(progress,modifier,color:c#ui.graphics.Color,backgroundColor:c#ui.graphics.Color,strokeCap:c#ui.graphics.StrokeCap)115@5390L204,110@5177L417:ProgressIndicator.kt#jmzs0o"

    invoke-static {v10, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p8

    .local v1, "$dirty":I
    and-int/lit8 v2, v8, 0x6

    if-nez v2, :cond_1

    move/from16 v2, p0

    invoke-interface {v10, v2}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    or-int/2addr v1, v3

    goto :goto_1

    :cond_1
    move/from16 v2, p0

    :goto_1
    and-int/lit8 v3, p9, 0x2

    if-eqz v3, :cond_2

    or-int/lit8 v1, v1, 0x30

    move-object/from16 v4, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v4, v8, 0x30

    if-nez v4, :cond_4

    move-object/from16 v4, p1

    invoke-interface {v10, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/16 v5, 0x20

    goto :goto_2

    :cond_3
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v1, v5

    goto :goto_3

    :cond_4
    move-object/from16 v4, p1

    :goto_3
    and-int/lit16 v5, v8, 0x180

    if-nez v5, :cond_7

    and-int/lit8 v5, p9, 0x4

    if-nez v5, :cond_5

    move-wide/from16 v11, p2

    invoke-interface {v10, v11, v12}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x100

    goto :goto_4

    :cond_5
    move-wide/from16 v11, p2

    :cond_6
    const/16 v5, 0x80

    :goto_4
    or-int/2addr v1, v5

    goto :goto_5

    :cond_7
    move-wide/from16 v11, p2

    :goto_5
    and-int/lit16 v5, v8, 0xc00

    const/16 v7, 0x800

    if-nez v5, :cond_a

    and-int/lit8 v5, p9, 0x8

    if-nez v5, :cond_8

    move-wide/from16 v13, p4

    invoke-interface {v10, v13, v14}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v5

    if-eqz v5, :cond_9

    move v5, v7

    goto :goto_6

    :cond_8
    move-wide/from16 v13, p4

    :cond_9
    const/16 v5, 0x400

    :goto_6
    or-int/2addr v1, v5

    goto :goto_7

    :cond_a
    move-wide/from16 v13, p4

    :goto_7
    and-int/lit16 v5, v8, 0x6000

    if-nez v5, :cond_d

    and-int/lit8 v5, p9, 0x10

    if-nez v5, :cond_b

    move/from16 v5, p6

    invoke-interface {v10, v5}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v15

    if-eqz v15, :cond_c

    const/16 v15, 0x4000

    goto :goto_8

    :cond_b
    move/from16 v5, p6

    :cond_c
    const/16 v15, 0x2000

    :goto_8
    or-int/2addr v1, v15

    goto :goto_9

    :cond_d
    move/from16 v5, p6

    :goto_9
    and-int/lit16 v15, v1, 0x2493

    const/16 v6, 0x2492

    const/16 v17, 0x1

    if-eq v15, v6, :cond_e

    move/from16 v6, v17

    goto :goto_a

    :cond_e
    const/4 v6, 0x0

    :goto_a
    and-int/lit8 v15, v1, 0x1

    invoke-interface {v10, v6, v15}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v6

    if-eqz v6, :cond_29

    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v6, "105@4977L6"

    invoke-static {v10, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v6, v8, 0x1

    const v15, -0xe001

    if-eqz v6, :cond_13

    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v6

    if-eqz v6, :cond_f

    goto :goto_b

    .line 103
    :cond_f
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v3, p9, 0x4

    if-eqz v3, :cond_10

    and-int/lit16 v1, v1, -0x381

    :cond_10
    and-int/lit8 v3, p9, 0x8

    if-eqz v3, :cond_11

    and-int/lit16 v1, v1, -0x1c01

    :cond_11
    and-int/lit8 v3, p9, 0x10

    if-eqz v3, :cond_12

    and-int/2addr v1, v15

    :cond_12
    move-object v3, v4

    goto :goto_f

    .line 109
    :cond_13
    :goto_b
    if-eqz v3, :cond_14

    .line 105
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_c

    .line 109
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_14
    move-object v3, v4

    .line 105
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_c
    and-int/lit8 v4, p9, 0x4

    if-eqz v4, :cond_15

    .line 106
    sget-object v4, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v6, 0x6

    invoke-virtual {v4, v10, v6}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v11

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v11, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit16 v1, v1, -0x381

    move-wide/from16 v18, v11

    goto :goto_d

    .line 105
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_15
    move-wide/from16 v18, v11

    .line 106
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v18, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_d
    and-int/lit8 v4, p9, 0x8

    if-eqz v4, :cond_16

    .line 107
    const/16 v24, 0xe

    const/16 v25, 0x0

    const v20, 0x3e75c28f    # 0.24f

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-static/range {v18 .. v25}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v11

    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v11, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v1, v1, -0x1c01

    goto :goto_e

    .line 106
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_16
    move-wide v11, v13

    .line 107
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v11    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_e
    and-int/lit8 v4, p9, 0x10

    if-eqz v4, :cond_17

    .line 108
    sget-object v4, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v4

    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v4, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    and-int/2addr v1, v15

    move v5, v4

    move-wide v13, v11

    move-wide/from16 v11, v18

    goto :goto_f

    .line 107
    .end local v4    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_17
    move-wide v13, v11

    move-wide/from16 v11, v18

    .line 103
    .end local v18    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v5, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v11, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v13, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_f
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_18

    const/4 v4, -0x1

    const-string v6, "androidx.compose.material.LinearProgressIndicator (ProgressIndicator.kt:108)"

    invoke-static {v0, v1, v4, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 110
    :cond_18
    const/4 v0, 0x0

    .local v0, "minimumValue$iv":F
    const/high16 v4, 0x3f800000    # 1.0f

    .local v4, "maximumValue$iv":F
    move/from16 v6, p0

    .local v6, "$this$fastCoerceIn$iv":F
    const/4 v15, 0x0

    .line 610
    .local v15, "$i$f$fastCoerceIn":I
    move/from16 v18, v6

    .local v18, "$this$fastCoerceAtLeast$iv$iv":F
    const/16 v19, 0x0

    .line 614
    .local v19, "$i$f$fastCoerceAtLeast":I
    cmpg-float v20, v18, v0

    if-gez v20, :cond_19

    move/from16 v18, v0

    .line 610
    .end local v18    # "$this$fastCoerceAtLeast$iv$iv":F
    .end local v19    # "$i$f$fastCoerceAtLeast":I
    :cond_19
    nop

    .local v18, "$this$fastCoerceAtMost$iv$iv":F
    const/16 v19, 0x0

    .line 619
    .local v19, "$i$f$fastCoerceAtMost":I
    cmpl-float v20, v18, v4

    if-lez v20, :cond_1a

    move/from16 v22, v4

    goto :goto_10

    :cond_1a
    move/from16 v22, v18

    .line 610
    .end local v18    # "$this$fastCoerceAtMost$iv$iv":F
    .end local v19    # "$i$f$fastCoerceAtMost":I
    :goto_10
    nop

    .line 110
    .end local v0    # "minimumValue$iv":F
    .end local v4    # "maximumValue$iv":F
    .end local v6    # "$this$fastCoerceIn$iv":F
    .end local v15    # "$i$f$fastCoerceIn":I
    move/from16 v0, v22

    .line 112
    .local v0, "coercedProgress":F
    nop

    .line 113
    invoke-static {v3}, Landroidx/compose/material/ProgressIndicatorKt;->increaseSemanticsBounds(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .line 114
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->floatValue()F

    move-result v15

    .line 620
    nop

    .local v15, "it":F
    const/16 v18, 0x0

    .line 114
    .local v18, "$i$a$-takeUnless-ProgressIndicatorKt$LinearProgressIndicator$1":I
    invoke-static {v15}, Ljava/lang/Float;->isNaN(F)Z

    move-result v19

    .end local v15    # "it":F
    .end local v18    # "$i$a$-takeUnless-ProgressIndicatorKt$LinearProgressIndicator$1":I
    if-nez v19, :cond_1b

    goto :goto_11

    :cond_1b
    const/4 v6, 0x0

    :goto_11
    if-eqz v6, :cond_1c

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    goto :goto_12

    :cond_1c
    const/4 v6, 0x0

    :goto_12
    const/4 v15, 0x6

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 p1, v4

    move/from16 p2, v6

    move/from16 p5, v15

    move-object/from16 p6, v18

    move-object/from16 p3, v19

    move/from16 p4, v20

    invoke-static/range {p1 .. p6}, Landroidx/compose/foundation/ProgressSemanticsKt;->progressSemantics$default(Landroidx/compose/ui/Modifier;FLkotlin/ranges/ClosedFloatingPointRange;IILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .line 115
    sget v6, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorWidth:F

    sget v15, Landroidx/compose/material/ProgressIndicatorKt;->LinearIndicatorHeight:F

    invoke-static {v4, v6, v15}, Landroidx/compose/foundation/layout/SizeKt;->size-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .line 116
    const v6, -0x8203274

    const-string v15, "CC(remember):ProgressIndicator.kt#9igjgp"

    invoke-static {v10, v6, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit16 v6, v1, 0x1c00

    xor-int/lit16 v6, v6, 0xc00

    if-le v6, v7, :cond_1d

    invoke-interface {v10, v13, v14}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v6

    if-nez v6, :cond_1e

    :cond_1d
    and-int/lit16 v6, v1, 0xc00

    if-ne v6, v7, :cond_1f

    :cond_1e
    move/from16 v6, v17

    goto :goto_13

    :cond_1f
    const/4 v6, 0x0

    :goto_13
    const v7, 0xe000

    and-int/2addr v7, v1

    xor-int/lit16 v7, v7, 0x6000

    const/16 v15, 0x4000

    if-le v7, v15, :cond_20

    invoke-interface {v10, v5}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v7

    if-nez v7, :cond_21

    :cond_20
    and-int/lit16 v7, v1, 0x6000

    const/16 v15, 0x4000

    if-ne v7, v15, :cond_22

    :cond_21
    move/from16 v7, v17

    goto :goto_14

    :cond_22
    const/4 v7, 0x0

    :goto_14
    or-int/2addr v6, v7

    invoke-interface {v10, v0}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v7

    or-int/2addr v6, v7

    and-int/lit16 v7, v1, 0x380

    xor-int/lit16 v7, v7, 0x180

    const/16 v15, 0x100

    if-le v7, v15, :cond_23

    invoke-interface {v10, v11, v12}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v7

    if-nez v7, :cond_24

    :cond_23
    and-int/lit16 v7, v1, 0x180

    const/16 v15, 0x100

    if-ne v7, v15, :cond_25

    :cond_24
    goto :goto_15

    :cond_25
    const/16 v17, 0x0

    :goto_15
    or-int v6, v6, v17

    .local v6, "invalid$iv":Z
    move-object v7, v10

    .local v7, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 621
    .local v15, "$i$f$cache":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v9

    .local v9, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 622
    .local v16, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v6, :cond_27

    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v22, v0

    .end local v0    # "coercedProgress":F
    .local v22, "coercedProgress":F
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v9, v0, :cond_26

    goto :goto_16

    .line 626
    :cond_26
    move/from16 v21, v5

    move-wide/from16 v23, v11

    move-wide/from16 v19, v13

    goto :goto_17

    .line 622
    .end local v22    # "coercedProgress":F
    .restart local v0    # "coercedProgress":F
    :cond_27
    move/from16 v22, v0

    .line 623
    .end local v0    # "coercedProgress":F
    .restart local v22    # "coercedProgress":F
    :goto_16
    const/4 v0, 0x0

    .line 116
    .local v0, "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$2":I
    new-instance v18, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda10;

    move/from16 v21, v5

    move-wide/from16 v23, v11

    move-wide/from16 v19, v13

    .end local v5    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .end local v11    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v13    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v19, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v21, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v23, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-direct/range {v18 .. v24}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda10;-><init>(JIFJ)V

    .line 623
    .end local v0    # "$i$a$-cache-ProgressIndicatorKt$LinearProgressIndicator$2":I
    move-object/from16 v0, v18

    .line 624
    .local v0, "value$iv":Ljava/lang/Object;
    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 625
    move-object v9, v0

    .line 621
    .end local v0    # "value$iv":Ljava/lang/Object;
    .end local v9    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_17
    nop

    .line 116
    .end local v6    # "invalid$iv":Z
    .end local v7    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    check-cast v9, Lkotlin/jvm/functions/Function1;

    invoke-static {v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 111
    const/4 v0, 0x0

    invoke-static {v4, v9, v10, v0}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 121
    .end local v22    # "coercedProgress":F
    :cond_28
    move-wide/from16 v5, v19

    move/from16 v7, v21

    move v11, v1

    goto :goto_18

    .line 103
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v19    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v21    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .end local v23    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    :cond_29
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v3, v4

    move v7, v5

    move-wide/from16 v23, v11

    move-wide v5, v13

    move v11, v1

    .line 121
    .end local v1    # "$dirty":I
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p6    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v7, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v11, "$dirty":I
    .restart local v23    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_18
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v12

    if-eqz v12, :cond_2a

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda12;

    move/from16 v9, p9

    move v1, v2

    move-object v2, v3

    move-wide/from16 v3, v23

    .end local v23    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    invoke-direct/range {v0 .. v9}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda12;-><init>(FLandroidx/compose/ui/Modifier;JJIII)V

    invoke-interface {v12, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    goto :goto_19

    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .restart local v23    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_2a
    move-object v2, v3

    move-wide/from16 v3, v23

    .end local v23    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_19
    return-void
.end method

.method public static final synthetic LinearProgressIndicator-eaDK9VM(FLandroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "progress"    # F
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p6, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p7, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Maintained for binary compatibility"
    .end annotation

    .line 226
    move/from16 v7, p7

    const v0, -0x32aeb272

    move-object/from16 v1, p6

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v15

    .end local p6    # "$composer":Landroidx/compose/runtime/Composer;
    .local v15, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(LinearProgressIndicator)N(progress,modifier,color:c#ui.graphics.Color,backgroundColor:c#ui.graphics.Color)225@9657L95:ProgressIndicator.kt#jmzs0o"

    invoke-static {v15, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p7

    .local v1, "$dirty":I
    and-int/lit8 v2, v7, 0x6

    if-nez v2, :cond_1

    move/from16 v8, p0

    invoke-interface {v15, v8}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int/2addr v1, v2

    goto :goto_1

    :cond_1
    move/from16 v8, p0

    :goto_1
    and-int/lit8 v2, p8, 0x2

    if-eqz v2, :cond_2

    or-int/lit8 v1, v1, 0x30

    move-object/from16 v3, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v3, v7, 0x30

    if-nez v3, :cond_4

    move-object/from16 v3, p1

    invoke-interface {v15, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x20

    goto :goto_2

    :cond_3
    const/16 v4, 0x10

    :goto_2
    or-int/2addr v1, v4

    goto :goto_3

    :cond_4
    move-object/from16 v3, p1

    :goto_3
    and-int/lit16 v4, v7, 0x180

    if-nez v4, :cond_7

    and-int/lit8 v4, p8, 0x4

    if-nez v4, :cond_5

    move-wide/from16 v4, p2

    invoke-interface {v15, v4, v5}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v6

    if-eqz v6, :cond_6

    const/16 v6, 0x100

    goto :goto_4

    :cond_5
    move-wide/from16 v4, p2

    :cond_6
    const/16 v6, 0x80

    :goto_4
    or-int/2addr v1, v6

    goto :goto_5

    :cond_7
    move-wide/from16 v4, p2

    :goto_5
    and-int/lit16 v6, v7, 0xc00

    if-nez v6, :cond_a

    and-int/lit8 v6, p8, 0x8

    if-nez v6, :cond_8

    move-wide/from16 v9, p4

    invoke-interface {v15, v9, v10}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v6

    if-eqz v6, :cond_9

    const/16 v6, 0x800

    goto :goto_6

    :cond_8
    move-wide/from16 v9, p4

    :cond_9
    const/16 v6, 0x400

    :goto_6
    or-int/2addr v1, v6

    goto :goto_7

    :cond_a
    move-wide/from16 v9, p4

    :goto_7
    and-int/lit16 v6, v1, 0x493

    const/16 v11, 0x492

    if-eq v6, v11, :cond_b

    const/4 v6, 0x1

    goto :goto_8

    :cond_b
    const/4 v6, 0x0

    :goto_8
    and-int/lit8 v11, v1, 0x1

    invoke-interface {v15, v6, v11}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v6

    if-eqz v6, :cond_15

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v6, "223@9560L6"

    invoke-static {v15, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v6, v7, 0x1

    if-eqz v6, :cond_f

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v6

    if-eqz v6, :cond_c

    goto :goto_9

    .line 221
    :cond_c
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v2, p8, 0x4

    if-eqz v2, :cond_d

    and-int/lit16 v1, v1, -0x381

    :cond_d
    and-int/lit8 v2, p8, 0x8

    if-eqz v2, :cond_e

    and-int/lit16 v1, v1, -0x1c01

    :cond_e
    move-wide v12, v9

    move-object v9, v3

    move-wide v10, v4

    goto :goto_c

    .line 226
    :cond_f
    :goto_9
    if-eqz v2, :cond_10

    .line 223
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_a

    .line 226
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_10
    move-object v2, v3

    .line 223
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_a
    and-int/lit8 v3, p8, 0x4

    if-eqz v3, :cond_11

    .line 224
    sget-object v3, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v6, 0x6

    invoke-virtual {v3, v15, v6}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material/Colors;->getPrimary-0d7_KjU()J

    move-result-wide v3

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    and-int/lit16 v1, v1, -0x381

    move-wide/from16 v16, v3

    goto :goto_b

    .line 223
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :cond_11
    move-wide/from16 v16, v4

    .line 224
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v16, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    :goto_b
    and-int/lit8 v3, p8, 0x8

    if-eqz v3, :cond_12

    .line 225
    const/16 v22, 0xe

    const/16 v23, 0x0

    const v18, 0x3e75c28f    # 0.24f

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-static/range {v16 .. v23}, Landroidx/compose/ui/graphics/Color;->copy-wmQWz5c$default(JFFFFILjava/lang/Object;)J

    move-result-wide v3

    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v1, v1, -0x1c01

    move-object v9, v2

    move-wide v12, v3

    move-wide/from16 v10, v16

    goto :goto_c

    .line 224
    .end local v3    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_12
    move-wide v12, v9

    move-wide/from16 v10, v16

    move-object v9, v2

    .line 221
    .end local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v16    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v9, "modifier":Landroidx/compose/ui/Modifier;
    .local v10, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v12, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_c
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_13

    const/4 v2, -0x1

    const-string v3, "androidx.compose.material.LinearProgressIndicator (ProgressIndicator.kt:225)"

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 226
    :cond_13
    sget-object v0, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v14

    and-int/lit8 v0, v1, 0xe

    and-int/lit8 v2, v1, 0x70

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x380

    or-int/2addr v0, v2

    and-int/lit16 v2, v1, 0x1c00

    or-int v16, v0, v2

    const/16 v17, 0x0

    invoke-static/range {v8 .. v17}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-_5eSR-E(FLandroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_14
    move-object v2, v9

    move-wide v3, v10

    move-wide v5, v12

    move v9, v1

    goto :goto_d

    .line 221
    .end local v9    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v10    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local v12    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_15
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v2, v3

    move-wide v3, v4

    move-wide v5, v9

    move v9, v1

    .line 226
    .end local v1    # "$dirty":I
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v9, "$dirty":I
    :goto_d
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v10

    if-eqz v10, :cond_16

    new-instance v0, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda0;

    move/from16 v1, p0

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda0;-><init>(FLandroidx/compose/ui/Modifier;JJII)V

    invoke-interface {v10, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_16
    return-void
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$0$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 157
    const/16 v0, 0x708

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 158
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v1, Landroidx/compose/material/ProgressIndicatorKt;->FirstLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v1, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 159
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x2ee

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 160
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$1(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$firstLineHead$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 151
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 729
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

    .line 151
    return v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$2$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 170
    const/16 v0, 0x708

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 171
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x14d

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v1, Landroidx/compose/material/ProgressIndicatorKt;->FirstLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v1, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 172
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x49f

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 173
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$3(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$firstLineTail$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 164
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 730
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

    .line 164
    return v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$4$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 183
    const/16 v0, 0x708

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 184
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v1, Landroidx/compose/material/ProgressIndicatorKt;->SecondLineHeadEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v1, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 185
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x61f

    invoke-virtual {p0, v0, v1}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 186
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$5(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$secondLineHead$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 177
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 731
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

    .line 177
    return v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$6$0(Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;)Lkotlin/Unit;
    .locals 3
    .param p0, "$this$keyframes"    # Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;

    .line 196
    const/16 v0, 0x708

    invoke-virtual {p0, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->setDurationMillis(I)V

    .line 197
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/16 v2, 0x4f3

    invoke-virtual {p0, v1, v2}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/KeyframeBaseEntity;

    sget-object v2, Landroidx/compose/material/ProgressIndicatorKt;->SecondLineTailEasing:Landroidx/compose/animation/core/CubicBezierEasing;

    check-cast v2, Landroidx/compose/animation/core/Easing;

    invoke-virtual {p0, v1, v2}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->using(Landroidx/compose/animation/core/KeyframeBaseEntity;Landroidx/compose/animation/core/Easing;)Landroidx/compose/animation/core/KeyframeBaseEntity;

    .line 198
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Landroidx/compose/animation/core/KeyframesSpec$KeyframesSpecConfig;->at(Ljava/lang/Object;I)Landroidx/compose/animation/core/KeyframesSpec$KeyframeEntity;

    .line 199
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$7(Landroidx/compose/runtime/State;)F
    .locals 4
    .param p0, "$secondLineTail$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Ljava/lang/Float;",
            ">;)F"
        }
    .end annotation

    .line 190
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 732
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

    .line 190
    return v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$8$0(JIJLandroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 14
    .param p0, "$$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p2, "$$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p3, "$$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p5, "$firstLineHead$delegate"    # Landroidx/compose/runtime/State;
    .param p6, "$firstLineTail$delegate"    # Landroidx/compose/runtime/State;
    .param p7, "$secondLineHead$delegate"    # Landroidx/compose/runtime/State;
    .param p8, "$secondLineTail$delegate"    # Landroidx/compose/runtime/State;
    .param p9, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    .line 208
    invoke-interface/range {p9 .. p9}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v0

    .local v0, "arg0$iv":J
    const/4 v2, 0x0

    .line 733
    .local v2, "$i$f$getHeight-impl":I
    move-wide v3, v0

    .local v3, "value$iv$iv":J
    const/4 v5, 0x0

    .line 734
    .local v5, "$i$f$unpackFloat2":I
    const-wide v6, 0xffffffffL

    and-long/2addr v6, v3

    long-to-int v6, v6

    .local v6, "bits$iv$iv$iv":I
    const/4 v7, 0x0

    .line 735
    .local v7, "$i$f$floatFromBits":I
    invoke-static {v6}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v6

    .line 734
    .end local v6    # "bits$iv$iv$iv":I
    .end local v7    # "$i$f$floatFromBits":I
    nop

    .line 733
    .end local v3    # "value$iv$iv":J
    .end local v5    # "$i$f$unpackFloat2":I
    nop

    .line 208
    .end local v0    # "arg0$iv":J
    .end local v2    # "$i$f$getHeight-impl":I
    move v12, v6

    .line 209
    .local v12, "strokeWidth":F
    move/from16 v13, p2

    move-object/from16 v7, p9

    invoke-static {v7, p0, p1, v12, v13}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicatorBackground-AZGd3zU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFI)V

    .line 210
    invoke-static/range {p5 .. p5}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$1(Landroidx/compose/runtime/State;)F

    move-result v0

    invoke-static/range {p6 .. p6}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$3(Landroidx/compose/runtime/State;)F

    move-result v1

    sub-float/2addr v0, v1

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 211
    invoke-static/range {p5 .. p5}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$1(Landroidx/compose/runtime/State;)F

    move-result v8

    invoke-static/range {p6 .. p6}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$3(Landroidx/compose/runtime/State;)F

    move-result v9

    move-wide/from16 v10, p3

    invoke-static/range {v7 .. v13}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicator-qYKTg0g(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V

    .line 213
    :cond_0
    invoke-static/range {p7 .. p7}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$5(Landroidx/compose/runtime/State;)F

    move-result v0

    invoke-static/range {p8 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$7(Landroidx/compose/runtime/State;)F

    move-result v2

    sub-float/2addr v0, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 214
    invoke-static/range {p7 .. p7}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$5(Landroidx/compose/runtime/State;)F

    move-result v8

    invoke-static/range {p8 .. p8}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator_2cYBFYY$lambda$7(Landroidx/compose/runtime/State;)F

    move-result v9

    move/from16 v13, p2

    move-wide/from16 v10, p3

    move-object/from16 v7, p9

    invoke-static/range {v7 .. v13}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicator-qYKTg0g(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V

    .line 216
    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_2cYBFYY$lambda$9(Landroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10

    or-int/lit8 v0, p6, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move v6, p5

    move/from16 v9, p7

    move-object/from16 v7, p8

    invoke-static/range {v1 .. v9}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-2cYBFYY(Landroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_RIQooxk$lambda$0(Landroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 9

    or-int/lit8 v0, p5, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v7

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move v8, p6

    move-object/from16 v6, p7

    invoke-static/range {v1 .. v8}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-RIQooxk(Landroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator__5eSR_E$lambda$1$0(JIFJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 14
    .param p0, "$$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p2, "$$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I
    .param p3, "$coercedProgress"    # F
    .param p4, "$$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p6, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    .line 117
    invoke-interface/range {p6 .. p6}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v0

    .local v0, "arg0$iv":J
    const/4 v2, 0x0

    .line 726
    .local v2, "$i$f$getHeight-impl":I
    move-wide v3, v0

    .local v3, "value$iv$iv":J
    const/4 v5, 0x0

    .line 727
    .local v5, "$i$f$unpackFloat2":I
    const-wide v6, 0xffffffffL

    and-long/2addr v6, v3

    long-to-int v6, v6

    .local v6, "bits$iv$iv$iv":I
    const/4 v7, 0x0

    .line 728
    .local v7, "$i$f$floatFromBits":I
    invoke-static {v6}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v6

    .line 727
    .end local v6    # "bits$iv$iv$iv":I
    .end local v7    # "$i$f$floatFromBits":I
    nop

    .line 726
    .end local v3    # "value$iv$iv":J
    .end local v5    # "$i$f$unpackFloat2":I
    nop

    .line 117
    .end local v0    # "arg0$iv":J
    .end local v2    # "$i$f$getHeight-impl":I
    move v12, v6

    .line 118
    .local v12, "strokeWidth":F
    move/from16 v13, p2

    move-object/from16 v7, p6

    invoke-static {v7, p0, p1, v12, v13}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicatorBackground-AZGd3zU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFI)V

    .line 119
    const/4 v8, 0x0

    move/from16 v9, p3

    move-wide/from16 v10, p4

    invoke-static/range {v7 .. v13}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicator-qYKTg0g(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V

    .line 120
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator__5eSR_E$lambda$2(FLandroidx/compose/ui/Modifier;JJIIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11

    or-int/lit8 v0, p7, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v9

    move v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    move/from16 v7, p6

    move/from16 v10, p8

    move-object/from16 v8, p9

    invoke-static/range {v1 .. v10}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-_5eSR-E(FLandroidx/compose/ui/Modifier;JJILandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final LinearProgressIndicator_eaDK9VM$lambda$0(FLandroidx/compose/ui/Modifier;JJIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10

    or-int/lit8 v0, p6, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v8

    move v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    move/from16 v9, p7

    move-object/from16 v7, p8

    invoke-static/range {v1 .. v9}, Landroidx/compose/material/ProgressIndicatorKt;->LinearProgressIndicator-eaDK9VM(FLandroidx/compose/ui/Modifier;JJLandroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final drawCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V
    .locals 32
    .param p0, "$this$drawCircularIndicator_u2d42QJj7c"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "startAngle"    # F
    .param p2, "sweep"    # F
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p5, "stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;

    .line 463
    invoke-virtual/range {p5 .. p5}, Landroidx/compose/ui/graphics/drawscope/Stroke;->getWidth()F

    move-result v0

    const/4 v1, 0x2

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 464
    .local v0, "diameterOffset":F
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v2

    .local v2, "arg0$iv":J
    const/4 v4, 0x0

    .line 711
    .local v4, "$i$f$getWidth-impl":I
    move-wide v5, v2

    .local v5, "value$iv$iv":J
    const/4 v7, 0x0

    .line 712
    .local v7, "$i$f$unpackFloat1":I
    const/16 v8, 0x20

    shr-long v9, v5, v8

    long-to-int v9, v9

    .local v9, "bits$iv$iv$iv":I
    const/4 v10, 0x0

    .line 713
    .local v10, "$i$f$floatFromBits":I
    invoke-static {v9}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v9

    .line 712
    .end local v9    # "bits$iv$iv$iv":I
    .end local v10    # "$i$f$floatFromBits":I
    nop

    .line 711
    .end local v5    # "value$iv$iv":J
    .end local v7    # "$i$f$unpackFloat1":I
    nop

    .line 464
    .end local v2    # "arg0$iv":J
    .end local v4    # "$i$f$getWidth-impl":I
    mul-float/2addr v1, v0

    sub-float/2addr v9, v1

    .line 465
    .local v9, "arcDimen":F
    nop

    .line 466
    nop

    .line 467
    nop

    .line 468
    nop

    .line 469
    nop

    .line 470
    move v1, v0

    .local v1, "y$iv":F
    move v2, v0

    .local v2, "x$iv":F
    const/4 v3, 0x0

    .line 714
    .local v3, "$i$f$Offset":I
    const/4 v4, 0x0

    .line 715
    .local v4, "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    int-to-long v5, v5

    .line 716
    .local v5, "v1$iv$iv":J
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v10, v7

    .line 717
    .local v10, "v2$iv$iv":J
    shl-long v12, v5, v8

    const-wide v14, 0xffffffffL

    and-long v16, v10, v14

    or-long v4, v12, v16

    .line 714
    .end local v4    # "$i$f$packFloats":I
    .end local v5    # "v1$iv$iv":J
    .end local v10    # "v2$iv$iv":J
    invoke-static {v4, v5}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v22

    .line 471
    .end local v1    # "y$iv":F
    .end local v2    # "x$iv":F
    .end local v3    # "$i$f$Offset":I
    move v1, v9

    .local v1, "height$iv":F
    move v2, v9

    .local v2, "width$iv":F
    const/4 v3, 0x0

    .line 718
    .local v3, "$i$f$Size":I
    const/4 v4, 0x0

    .line 719
    .restart local v4    # "$i$f$packFloats":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    int-to-long v5, v5

    .line 720
    .restart local v5    # "v1$iv$iv":J
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v10, v7

    .line 721
    .restart local v10    # "v2$iv$iv":J
    shl-long v7, v5, v8

    and-long v12, v10, v14

    or-long v4, v7, v12

    .line 718
    .end local v4    # "$i$f$packFloats":I
    .end local v5    # "v1$iv$iv":J
    .end local v10    # "v2$iv$iv":J
    invoke-static {v4, v5}, Landroidx/compose/ui/geometry/Size;->constructor-impl(J)J

    move-result-wide v24

    .line 465
    .end local v1    # "height$iv":F
    .end local v2    # "width$iv":F
    .end local v3    # "$i$f$Size":I
    nop

    .line 472
    move-object/from16 v27, p5

    check-cast v27, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    .line 465
    const/16 v30, 0x340

    const/16 v31, 0x0

    const/16 v21, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v16, p0

    move/from16 v19, p1

    move/from16 v20, p2

    move-wide/from16 v17, p3

    invoke-static/range {v16 .. v31}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawArc-yD3GUKo$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFFZJJFLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 474
    return-void
.end method

.method private static final drawCircularIndicatorBackground-bw27NRU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JLandroidx/compose/ui/graphics/drawscope/Stroke;)V
    .locals 6
    .param p0, "$this$drawCircularIndicatorBackground_u2dbw27NRU"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;

    .line 477
    const/4 v1, 0x0

    const/high16 v2, 0x43b40000    # 360.0f

    move-object v0, p0

    move-wide v3, p1

    move-object v5, p3

    .end local p0    # "$this$drawCircularIndicatorBackground_u2dbw27NRU":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local v0, "$this$drawCircularIndicatorBackground_u2dbw27NRU":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-static/range {v0 .. v5}, Landroidx/compose/material/ProgressIndicatorKt;->drawCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    return-void
.end method

.method private static final drawDeterminateCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V
    .locals 0
    .param p0, "$this$drawDeterminateCircularIndicator_u2d42QJj7c"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "startAngle"    # F
    .param p2, "sweep"    # F
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p5, "stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;

    .line 517
    invoke-static/range {p0 .. p5}, Landroidx/compose/material/ProgressIndicatorKt;->drawCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    return-void
.end method

.method private static final drawIndeterminateCircularIndicator-hrjfTZI(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V
    .locals 7
    .param p0, "$this$drawIndeterminateCircularIndicator_u2dhrjfTZI"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "startAngle"    # F
    .param p2, "$v$c$androidx-compose-ui-unit-Dp$-strokeWidth$0"    # F
    .param p3, "sweep"    # F
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p6, "stroke"    # Landroidx/compose/ui/graphics/drawscope/Stroke;

    .line 527
    invoke-virtual {p6}, Landroidx/compose/ui/graphics/drawscope/Stroke;->getCap-KaPHkGw()I

    move-result v0

    sget-object v1, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/compose/ui/graphics/StrokeCap;->equals-impl0(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 528
    const/4 v0, 0x0

    goto :goto_0

    .line 533
    :cond_0
    sget v0, Landroidx/compose/material/ProgressIndicatorKt;->CircularIndicatorDiameter:F

    .local v0, "arg0$iv":F
    const/4 v1, 0x2

    .local v1, "other$iv":I
    const/4 v2, 0x0

    .line 722
    .local v2, "$i$f$div-u2uoSUM":I
    int-to-float v3, v1

    div-float v3, v0, v3

    invoke-static {v3}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 533
    .end local v0    # "arg0$iv":F
    .end local v1    # "other$iv":I
    .end local v2    # "$i$f$div-u2uoSUM":I
    move v1, p2

    .local v0, "other$iv":F
    .local v1, "arg0$iv":F
    const/4 v2, 0x0

    .line 725
    .local v2, "$i$f$div-0680j_4":I
    div-float/2addr v1, v0

    .line 533
    .end local v0    # "other$iv":F
    .end local v1    # "arg0$iv":F
    .end local v2    # "$i$f$div-0680j_4":I
    const v0, 0x42652ee1

    mul-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float v0, v1, v0

    .line 527
    :goto_0
    nop

    .line 526
    nop

    .line 538
    .local v0, "strokeCapOffset":F
    add-float v2, p1, v0

    .line 542
    .local v2, "adjustedStartAngle":F
    const v1, 0x3dcccccd    # 0.1f

    invoke-static {p3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 544
    .local v3, "adjustedSweep":F
    move-object v1, p0

    move-wide v4, p4

    move-object v6, p6

    .end local p0    # "$this$drawIndeterminateCircularIndicator_u2dhrjfTZI":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p6    # "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    .local v1, "$this$drawIndeterminateCircularIndicator_u2dhrjfTZI":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v4, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v6, "stroke":Landroidx/compose/ui/graphics/drawscope/Stroke;
    invoke-static/range {v1 .. v6}, Landroidx/compose/material/ProgressIndicatorKt;->drawCircularIndicator-42QJj7c(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJLandroidx/compose/ui/graphics/drawscope/Stroke;)V

    .line 545
    return-void
.end method

.method private static final drawLinearIndicator-qYKTg0g(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V
    .locals 45
    .param p0, "$this$drawLinearIndicator_u2dqYKTg0g"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "startFraction"    # F
    .param p2, "endFraction"    # F
    .param p3, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p5, "strokeWidth"    # F
    .param p6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I

    .line 243
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v0

    .local v0, "arg0$iv":J
    const/4 v2, 0x0

    .line 657
    .local v2, "$i$f$getWidth-impl":I
    move-wide v3, v0

    .local v3, "value$iv$iv":J
    const/4 v5, 0x0

    .line 658
    .local v5, "$i$f$unpackFloat1":I
    const/16 v6, 0x20

    shr-long v7, v3, v6

    long-to-int v7, v7

    .local v7, "bits$iv$iv$iv":I
    const/4 v8, 0x0

    .line 659
    .local v8, "$i$f$floatFromBits":I
    invoke-static {v7}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    .line 658
    .end local v7    # "bits$iv$iv$iv":I
    .end local v8    # "$i$f$floatFromBits":I
    nop

    .line 657
    .end local v3    # "value$iv$iv":J
    .end local v5    # "$i$f$unpackFloat1":I
    nop

    .line 243
    .end local v0    # "arg0$iv":J
    .end local v2    # "$i$f$getWidth-impl":I
    nop

    .line 244
    .local v7, "width":F
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v0

    .restart local v0    # "arg0$iv":J
    const/4 v2, 0x0

    .line 660
    .local v2, "$i$f$getHeight-impl":I
    move-wide v3, v0

    .restart local v3    # "value$iv$iv":J
    const/4 v5, 0x0

    .line 661
    .local v5, "$i$f$unpackFloat2":I
    const-wide v8, 0xffffffffL

    and-long v10, v3, v8

    long-to-int v10, v10

    .local v10, "bits$iv$iv$iv":I
    const/4 v11, 0x0

    .line 662
    .local v11, "$i$f$floatFromBits":I
    invoke-static {v10}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v10

    .line 661
    .end local v10    # "bits$iv$iv$iv":I
    .end local v11    # "$i$f$floatFromBits":I
    nop

    .line 660
    .end local v3    # "value$iv$iv":J
    .end local v5    # "$i$f$unpackFloat2":I
    nop

    .line 244
    .end local v0    # "arg0$iv":J
    .end local v2    # "$i$f$getHeight-impl":I
    nop

    .line 246
    .local v10, "height":F
    const/4 v0, 0x2

    int-to-float v0, v0

    div-float v1, v10, v0

    .line 248
    .local v1, "yOffset":F
    invoke-interface/range {p0 .. p0}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getLayoutDirection()Landroidx/compose/ui/unit/LayoutDirection;

    move-result-object v2

    sget-object v3, Landroidx/compose/ui/unit/LayoutDirection;->Ltr:Landroidx/compose/ui/unit/LayoutDirection;

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 249
    .local v2, "isLtr":Z
    :goto_0
    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v2, :cond_1

    move/from16 v4, p1

    goto :goto_1

    :cond_1
    sub-float v4, v3, p2

    :goto_1
    mul-float/2addr v4, v7

    .line 250
    .local v4, "barStart":F
    if-eqz v2, :cond_2

    move/from16 v3, p2

    goto :goto_2

    :cond_2
    sub-float v3, v3, p1

    :goto_2
    mul-float/2addr v3, v7

    .line 253
    .local v3, "barEnd":F
    sget-object v5, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v5

    move/from16 v11, p6

    invoke-static {v11, v5}, Landroidx/compose/ui/graphics/StrokeCap;->equals-impl0(II)Z

    move-result v5

    if-nez v5, :cond_5

    cmpl-float v5, v10, v7

    if-lez v5, :cond_3

    move/from16 v28, v1

    move/from16 v16, v6

    move-wide/from16 v17, v8

    goto/16 :goto_3

    .line 258
    :cond_3
    div-float v0, p5, v0

    .line 259
    .local v0, "strokeCapOffset":F
    sub-float v5, v7, v0

    invoke-static {v0, v5}, Lkotlin/ranges/RangesKt;->rangeTo(FF)Lkotlin/ranges/ClosedFloatingPointRange;

    move-result-object v5

    .line 260
    .local v5, "coerceRange":Lkotlin/ranges/ClosedFloatingPointRange;
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    check-cast v12, Ljava/lang/Comparable;

    invoke-static {v12, v5}, Lkotlin/ranges/RangesKt;->coerceIn(Ljava/lang/Comparable;Lkotlin/ranges/ClosedFloatingPointRange;)Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->floatValue()F

    move-result v26

    .line 261
    .local v26, "adjustedBarStart":F
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    check-cast v12, Ljava/lang/Comparable;

    invoke-static {v12, v5}, Lkotlin/ranges/RangesKt;->coerceIn(Ljava/lang/Comparable;Lkotlin/ranges/ClosedFloatingPointRange;)Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->floatValue()F

    move-result v27

    .line 263
    .local v27, "adjustedBarEnd":F
    sub-float v12, p2, p1

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    const/4 v13, 0x0

    cmpl-float v12, v12, v13

    if-lez v12, :cond_4

    .line 265
    nop

    .line 266
    nop

    .line 267
    move v12, v1

    .local v12, "y$iv":F
    move/from16 v13, v26

    .local v13, "x$iv":F
    const/4 v14, 0x0

    .line 667
    .local v14, "$i$f$Offset":I
    const/4 v15, 0x0

    .line 668
    .local v15, "$i$f$packFloats":I
    move/from16 v16, v6

    invoke-static {v13}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    move-wide/from16 v17, v8

    int-to-long v8, v6

    .line 669
    .local v8, "v1$iv$iv":J
    invoke-static {v12}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    move/from16 v29, v0

    move/from16 v28, v1

    .end local v0    # "strokeCapOffset":F
    .end local v1    # "yOffset":F
    .local v28, "yOffset":F
    .local v29, "strokeCapOffset":F
    int-to-long v0, v6

    .line 670
    .local v0, "v2$iv$iv":J
    shl-long v19, v8, v16

    and-long v21, v0, v17

    or-long v0, v19, v21

    .line 667
    .end local v0    # "v2$iv$iv":J
    .end local v8    # "v1$iv$iv":J
    .end local v15    # "$i$f$packFloats":I
    invoke-static {v0, v1}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v14

    .line 268
    .end local v12    # "y$iv":F
    .end local v13    # "x$iv":F
    .end local v14    # "$i$f$Offset":I
    move/from16 v0, v28

    .local v0, "y$iv":F
    move/from16 v1, v27

    .local v1, "x$iv":F
    const/4 v6, 0x0

    .line 671
    .local v6, "$i$f$Offset":I
    const/4 v8, 0x0

    .line 672
    .local v8, "$i$f$packFloats":I
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v9

    int-to-long v12, v9

    .line 673
    .local v12, "v1$iv$iv":J
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v9

    move/from16 v20, v0

    move/from16 v19, v1

    .end local v0    # "y$iv":F
    .end local v1    # "x$iv":F
    .local v19, "x$iv":F
    .local v20, "y$iv":F
    int-to-long v0, v9

    .line 674
    .local v0, "v2$iv$iv":J
    shl-long v21, v12, v16

    and-long v16, v0, v17

    or-long v0, v21, v16

    .line 671
    .end local v0    # "v2$iv$iv":J
    .end local v8    # "$i$f$packFloats":I
    .end local v12    # "v1$iv$iv":J
    invoke-static {v0, v1}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v16

    .line 269
    .end local v6    # "$i$f$Offset":I
    .end local v19    # "x$iv":F
    .end local v20    # "y$iv":F
    nop

    .line 270
    nop

    .line 265
    const/16 v24, 0x1e0

    const/16 v25, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-wide/from16 v12, p3

    move/from16 v18, p5

    move/from16 v19, v11

    move-object/from16 v11, p0

    invoke-static/range {v11 .. v25}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawLine-NGM6Ib0$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJFILandroidx/compose/ui/graphics/PathEffect;FLandroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    goto :goto_4

    .line 263
    .end local v28    # "yOffset":F
    .end local v29    # "strokeCapOffset":F
    .local v0, "strokeCapOffset":F
    .local v1, "yOffset":F
    :cond_4
    move/from16 v29, v0

    move/from16 v28, v1

    .end local v0    # "strokeCapOffset":F
    .end local v1    # "yOffset":F
    .restart local v28    # "yOffset":F
    .restart local v29    # "strokeCapOffset":F
    goto :goto_4

    .line 253
    .end local v5    # "coerceRange":Lkotlin/ranges/ClosedFloatingPointRange;
    .end local v26    # "adjustedBarStart":F
    .end local v27    # "adjustedBarEnd":F
    .end local v28    # "yOffset":F
    .end local v29    # "strokeCapOffset":F
    .restart local v1    # "yOffset":F
    :cond_5
    move/from16 v28, v1

    move/from16 v16, v6

    move-wide/from16 v17, v8

    .line 255
    .end local v1    # "yOffset":F
    .restart local v28    # "yOffset":F
    :goto_3
    move/from16 v0, v28

    .local v0, "y$iv":F
    move v1, v4

    .local v1, "x$iv":F
    const/4 v5, 0x0

    .line 663
    .local v5, "$i$f$Offset":I
    const/4 v6, 0x0

    .line 664
    .local v6, "$i$f$packFloats":I
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v8

    int-to-long v8, v8

    .line 665
    .local v8, "v1$iv$iv":J
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v11

    int-to-long v11, v11

    .line 666
    .local v11, "v2$iv$iv":J
    shl-long v13, v8, v16

    and-long v19, v11, v17

    or-long v8, v13, v19

    .line 663
    .end local v6    # "$i$f$packFloats":I
    .end local v8    # "v1$iv$iv":J
    .end local v11    # "v2$iv$iv":J
    invoke-static {v8, v9}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v33

    .line 255
    .end local v0    # "y$iv":F
    .end local v1    # "x$iv":F
    .end local v5    # "$i$f$Offset":I
    nop

    .restart local v0    # "y$iv":F
    move v1, v3

    .restart local v1    # "x$iv":F
    const/4 v5, 0x0

    .line 663
    .restart local v5    # "$i$f$Offset":I
    const/4 v6, 0x0

    .line 664
    .restart local v6    # "$i$f$packFloats":I
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v8

    int-to-long v8, v8

    .line 665
    .restart local v8    # "v1$iv$iv":J
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v11

    int-to-long v11, v11

    .line 666
    .restart local v11    # "v2$iv$iv":J
    shl-long v13, v8, v16

    and-long v15, v11, v17

    or-long v8, v13, v15

    .line 663
    .end local v6    # "$i$f$packFloats":I
    .end local v8    # "v1$iv$iv":J
    .end local v11    # "v2$iv$iv":J
    invoke-static {v8, v9}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v35

    .line 255
    .end local v0    # "y$iv":F
    .end local v1    # "x$iv":F
    .end local v5    # "$i$f$Offset":I
    const/16 v43, 0x1f0

    const/16 v44, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    move-object/from16 v30, p0

    move-wide/from16 v31, p3

    move/from16 v37, p5

    invoke-static/range {v30 .. v44}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawLine-NGM6Ib0$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJFILandroidx/compose/ui/graphics/PathEffect;FLandroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 274
    :goto_4
    return-void
.end method

.method private static final drawLinearIndicatorBackground-AZGd3zU(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFI)V
    .locals 7
    .param p0, "$this$drawLinearIndicatorBackground_u2dAZGd3zU"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .param p1, "$v$c$androidx-compose-ui-graphics-Color$-color$0"    # J
    .param p3, "strokeWidth"    # F
    .param p4, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0"    # I

    .line 280
    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-wide v3, p1

    move v5, p3

    move v6, p4

    .end local p0    # "$this$drawLinearIndicatorBackground_u2dAZGd3zU":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .end local p1    # "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .end local p3    # "strokeWidth":F
    .end local p4    # "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    .local v0, "$this$drawLinearIndicatorBackground_u2dAZGd3zU":Landroidx/compose/ui/graphics/drawscope/DrawScope;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-color$0":J
    .local v5, "strokeWidth":F
    .local v6, "$v$c$androidx-compose-ui-graphics-StrokeCap$-strokeCap$0":I
    invoke-static/range {v0 .. v6}, Landroidx/compose/material/ProgressIndicatorKt;->drawLinearIndicator-qYKTg0g(Landroidx/compose/ui/graphics/drawscope/DrawScope;FFJFI)V

    return-void
.end method

.method public static final increaseSemanticsBounds(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;
    .locals 5
    .param p0, "$this$increaseSemanticsBounds"    # Landroidx/compose/ui/Modifier;

    .line 58
    const/16 v0, 0xa

    .local v0, "$this$dp$iv":I
    const/4 v1, 0x0

    .line 609
    .local v1, "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 58
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    nop

    .line 59
    .local v0, "padding":F
    new-instance v1, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda16;

    invoke-direct {v1, v0}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda16;-><init>(F)V

    invoke-static {p0, v1}, Landroidx/compose/ui/layout/LayoutModifierKt;->layout(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 75
    new-instance v2, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda17;

    invoke-direct {v2}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda17;-><init>()V

    const/4 v3, 0x1

    invoke-static {v1, v3, v2}, Landroidx/compose/ui/semantics/SemanticsModifierKt;->semantics(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function1;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 76
    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-static {v1, v2, v0, v3, v4}, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4$default(Landroidx/compose/ui/Modifier;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 59
    return-object v1
.end method

.method private static final increaseSemanticsBounds$lambda$0(FLandroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 11
    .param p0, "$padding"    # F
    .param p1, "$this$layout"    # Landroidx/compose/ui/layout/MeasureScope;
    .param p2, "measurable"    # Landroidx/compose/ui/layout/Measurable;
    .param p3, "constraints"    # Landroidx/compose/ui/unit/Constraints;

    .line 60
    invoke-interface {p1, p0}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v7

    .line 66
    .local v7, "paddingPx":I
    invoke-virtual {p3}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v1

    mul-int/lit8 v3, v7, 0x2

    const/4 v4, 0x0

    invoke-static {v1, v2, v4, v3}, Landroidx/compose/ui/unit/ConstraintsKt;->offset-NN6Ew-U(JII)J

    move-result-wide v8

    .line 67
    .local v8, "newConstraint":J
    invoke-interface {p2, v8, v9}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v10

    .line 71
    .local v10, "placeable":Landroidx/compose/ui/layout/Placeable;
    invoke-virtual {v10}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v1

    mul-int/lit8 v2, v7, 0x2

    sub-int v2, v1, v2

    .line 72
    .local v2, "height":I
    invoke-virtual {v10}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v1

    .line 73
    .local v1, "width":I
    new-instance v4, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda20;

    invoke-direct {v4, v10, v7}, Landroidx/compose/material/ProgressIndicatorKt$$ExternalSyntheticLambda20;-><init>(Landroidx/compose/ui/layout/Placeable;I)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v3

    return-object v3
.end method

.method private static final increaseSemanticsBounds$lambda$0$0(Landroidx/compose/ui/layout/Placeable;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 7
    .param p0, "$placeable"    # Landroidx/compose/ui/layout/Placeable;
    .param p1, "$paddingPx"    # I
    .param p2, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 73
    neg-int v3, p1

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v0, p2

    .end local p0    # "$placeable":Landroidx/compose/ui/layout/Placeable;
    .end local p2    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .local v0, "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .local v1, "$placeable":Landroidx/compose/ui/layout/Placeable;
    invoke-static/range {v0 .. v6}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->place$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final increaseSemanticsBounds$lambda$1(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 1
    .param p0, "$this$semantics"    # Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;

    .line 75
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
