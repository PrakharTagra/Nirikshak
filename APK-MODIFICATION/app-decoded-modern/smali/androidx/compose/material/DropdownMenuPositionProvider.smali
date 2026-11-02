.class public final Landroidx/compose/material/DropdownMenuPositionProvider;
.super Ljava/lang/Object;
.source "Menu.kt"

# interfaces
.implements Landroidx/compose/ui/window/PopupPositionProvider;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMenu.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Menu.kt\nandroidx/compose/material/DropdownMenuPositionProvider\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 IntSize.kt\nandroidx/compose/ui/unit/IntSize\n+ 4 InlineClassHelper.kt\nandroidx/compose/ui/util/InlineClassHelperKt\n+ 5 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n+ 6 IntOffset.kt\nandroidx/compose/ui/unit/IntOffsetKt\n*L\n1#1,386:1\n1#2:387\n54#3:388\n54#3:390\n54#3:392\n54#3:395\n59#3:398\n59#3:400\n59#3:402\n59#3:405\n54#3:408\n59#3:410\n85#4:389\n85#4:391\n85#4:393\n85#4:396\n90#4:399\n90#4:401\n90#4:403\n90#4:406\n85#4:409\n90#4:411\n80#4:413\n183#5:394\n184#5:397\n183#5:404\n184#5:407\n32#6:412\n*S KotlinDebug\n*F\n+ 1 Menu.kt\nandroidx/compose/material/DropdownMenuPositionProvider\n*L\n336#1:388\n337#1:390\n355#1:392\n359#1:395\n364#1:398\n365#1:400\n366#1:402\n376#1:405\n381#1:408\n381#1:410\n336#1:389\n337#1:391\n355#1:393\n359#1:396\n364#1:399\n365#1:401\n366#1:403\n376#1:406\n381#1:409\n381#1:411\n383#1:413\n359#1:394\n359#1:397\n374#1:404\n374#1:407\n383#1:412\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0081\u0008\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u001a\u0008\u0002\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ/\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00082\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0017H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003H\u00c6\u0003\u00a2\u0006\u0004\u0008\u001e\u0010\rJ\t\u0010\u001f\u001a\u00020\u0005H\u00c6\u0003J\u001b\u0010 \u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007H\u00c6\u0003J@\u0010!\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u001a\u0008\u0002\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007H\u00c6\u0001\u00a2\u0006\u0004\u0008\"\u0010#J\u0013\u0010$\u001a\u00020%2\u0008\u0010&\u001a\u0004\u0018\u00010\'H\u00d6\u0003J\t\u0010(\u001a\u00020)H\u00d6\u0001J\t\u0010*\u001a\u00020+H\u00d6\u0001R\u0013\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\n\n\u0002\u0010\u000e\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R#\u0010\u0006\u001a\u0014\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\u00a8\u0006,"
    }
    d2 = {
        "Landroidx/compose/material/DropdownMenuPositionProvider;",
        "Landroidx/compose/ui/window/PopupPositionProvider;",
        "contentOffset",
        "Landroidx/compose/ui/unit/DpOffset;",
        "density",
        "Landroidx/compose/ui/unit/Density;",
        "onPositionCalculated",
        "Lkotlin/Function2;",
        "Landroidx/compose/ui/unit/IntRect;",
        "",
        "<init>",
        "(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "getContentOffset-RKDOV3M",
        "()J",
        "J",
        "getDensity",
        "()Landroidx/compose/ui/unit/Density;",
        "getOnPositionCalculated",
        "()Lkotlin/jvm/functions/Function2;",
        "calculatePosition",
        "Landroidx/compose/ui/unit/IntOffset;",
        "anchorBounds",
        "windowSize",
        "Landroidx/compose/ui/unit/IntSize;",
        "layoutDirection",
        "Landroidx/compose/ui/unit/LayoutDirection;",
        "popupContentSize",
        "calculatePosition-llwVHH4",
        "(Landroidx/compose/ui/unit/IntRect;JLandroidx/compose/ui/unit/LayoutDirection;J)J",
        "component1",
        "component1-RKDOV3M",
        "component2",
        "component3",
        "copy",
        "copy-rOJDEFc",
        "(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;)Landroidx/compose/material/DropdownMenuPositionProvider;",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "",
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


# instance fields
.field private final contentOffset:J

.field private final density:Landroidx/compose/ui/unit/Density;

.field private final onPositionCalculated:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/ui/unit/IntRect;",
            "Landroidx/compose/ui/unit/IntRect;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$jhoHPzDwZ2AgPyyHxwBvIAVCk0c(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/unit/IntRect;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/compose/material/DropdownMenuPositionProvider;->_init_$lambda$0(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/unit/IntRect;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;)V
    .locals 0
    .param p1, "contentOffset"    # J
    .param p3, "density"    # Landroidx/compose/ui/unit/Density;
    .param p4, "onPositionCalculated"    # Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroidx/compose/ui/unit/Density;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/ui/unit/IntRect;",
            "-",
            "Landroidx/compose/ui/unit/IntRect;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iput-wide p1, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    .line 315
    iput-object p3, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    .line 316
    iput-object p4, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    .line 313
    return-void
.end method

.method public synthetic constructor <init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 6

    .line 313
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_0

    .line 316
    new-instance p4, Landroidx/compose/material/DropdownMenuPositionProvider$$ExternalSyntheticLambda0;

    invoke-direct {p4}, Landroidx/compose/material/DropdownMenuPositionProvider$$ExternalSyntheticLambda0;-><init>()V

    move-object v4, p4

    goto :goto_0

    .line 313
    :cond_0
    move-object v4, p4

    :goto_0
    const/4 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Landroidx/compose/material/DropdownMenuPositionProvider;-><init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 317
    return-void
.end method

.method public synthetic constructor <init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/compose/material/DropdownMenuPositionProvider;-><init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;)V

    return-void
.end method

.method private static final _init_$lambda$0(Landroidx/compose/ui/unit/IntRect;Landroidx/compose/ui/unit/IntRect;)Lkotlin/Unit;
    .locals 0

    .line 316
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static synthetic copy-rOJDEFc$default(Landroidx/compose/material/DropdownMenuPositionProvider;JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Landroidx/compose/material/DropdownMenuPositionProvider;
    .locals 0

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    iget-wide p1, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    iget-object p3, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    :cond_1
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_2

    iget-object p4, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/compose/material/DropdownMenuPositionProvider;->copy-rOJDEFc(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;)Landroidx/compose/material/DropdownMenuPositionProvider;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public calculatePosition-llwVHH4(Landroidx/compose/ui/unit/IntRect;JLandroidx/compose/ui/unit/LayoutDirection;J)J
    .locals 33
    .param p1, "anchorBounds"    # Landroidx/compose/ui/unit/IntRect;
    .param p2, "$v$c$androidx-compose-ui-unit-IntSize$-windowSize$0"    # J
    .param p4, "layoutDirection"    # Landroidx/compose/ui/unit/LayoutDirection;
    .param p5, "$v$c$androidx-compose-ui-unit-IntSize$-popupContentSize$0"    # J

    .line 325
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    iget-object v2, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    .line 387
    .local v2, "$this$calculatePosition_llwVHH4_u24lambda_u240":Landroidx/compose/ui/unit/Density;
    const/4 v3, 0x0

    .line 325
    .local v3, "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$verticalMargin$1":I
    invoke-static {}, Landroidx/compose/material/MenuKt;->getMenuVerticalMargin()F

    move-result v4

    invoke-interface {v2, v4}, Landroidx/compose/ui/unit/Density;->roundToPx-0680j_4(F)I

    move-result v2

    .line 328
    .end local v3    # "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$verticalMargin$1":I
    .local v2, "verticalMargin":I
    iget-object v3, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    .local v3, "$this$calculatePosition_llwVHH4_u24lambda_u241":Landroidx/compose/ui/unit/Density;
    const/4 v4, 0x0

    .line 329
    .local v4, "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$contentOffsetX$1":I
    iget-wide v5, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    invoke-static {v5, v6}, Landroidx/compose/ui/unit/DpOffset;->getX-D9Ej5fM(J)F

    move-result v5

    invoke-interface {v3, v5}, Landroidx/compose/ui/unit/Density;->roundToPx-0680j_4(F)I

    move-result v5

    .line 330
    sget-object v6, Landroidx/compose/ui/unit/LayoutDirection;->Ltr:Landroidx/compose/ui/unit/LayoutDirection;

    if-ne v1, v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, -0x1

    .line 329
    :goto_0
    mul-int/2addr v5, v6

    .line 330
    nop

    .line 328
    .end local v3    # "$this$calculatePosition_llwVHH4_u24lambda_u241":Landroidx/compose/ui/unit/Density;
    .end local v4    # "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$contentOffsetX$1":I
    nop

    .line 327
    nop

    .line 332
    .local v5, "contentOffsetX":I
    iget-object v3, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    .line 387
    .local v3, "$this$calculatePosition_llwVHH4_u24lambda_u242":Landroidx/compose/ui/unit/Density;
    const/4 v4, 0x0

    .line 332
    .local v4, "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$contentOffsetY$1":I
    iget-wide v8, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    invoke-static {v8, v9}, Landroidx/compose/ui/unit/DpOffset;->getY-D9Ej5fM(J)F

    move-result v6

    invoke-interface {v3, v6}, Landroidx/compose/ui/unit/Density;->roundToPx-0680j_4(F)I

    move-result v3

    .line 335
    .end local v4    # "$i$a$-with-DropdownMenuPositionProvider$calculatePosition$contentOffsetY$1":I
    .local v3, "contentOffsetY":I
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getLeft()I

    move-result v4

    add-int/2addr v4, v5

    .line 336
    .local v4, "leftToAnchorLeft":I
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getRight()I

    move-result v6

    move-wide/from16 v8, p5

    .local v8, "arg0$iv":J
    const/4 v10, 0x0

    .line 388
    .local v10, "$i$f$getWidth-impl":I
    move-wide v11, v8

    .local v11, "value$iv$iv":J
    const/4 v13, 0x0

    .line 389
    .local v13, "$i$f$unpackInt1":I
    const/16 v14, 0x20

    move-wide/from16 v16, v8

    const/4 v15, 0x1

    .end local v8    # "arg0$iv":J
    .local v16, "arg0$iv":J
    shr-long v7, v11, v14

    long-to-int v7, v7

    .line 388
    .end local v11    # "value$iv$iv":J
    .end local v13    # "$i$f$unpackInt1":I
    nop

    .line 336
    .end local v10    # "$i$f$getWidth-impl":I
    .end local v16    # "arg0$iv":J
    sub-int/2addr v6, v7

    add-int/2addr v6, v5

    .line 337
    .local v6, "rightToAnchorRight":I
    move-wide/from16 v7, p2

    .local v7, "arg0$iv":J
    const/4 v9, 0x0

    .line 390
    .local v9, "$i$f$getWidth-impl":I
    move-wide v10, v7

    .local v10, "value$iv$iv":J
    const/4 v12, 0x0

    .line 391
    .local v12, "$i$f$unpackInt1":I
    move v13, v14

    move/from16 v16, v15

    shr-long v14, v10, v13

    long-to-int v10, v14

    .line 390
    .end local v10    # "value$iv$iv":J
    .end local v12    # "$i$f$unpackInt1":I
    nop

    .line 337
    .end local v7    # "arg0$iv":J
    .end local v9    # "$i$f$getWidth-impl":I
    move-wide/from16 v7, p5

    .restart local v7    # "arg0$iv":J
    const/4 v9, 0x0

    .line 390
    .restart local v9    # "$i$f$getWidth-impl":I
    move-wide v11, v7

    .restart local v11    # "value$iv$iv":J
    const/4 v14, 0x0

    .line 391
    .local v14, "$i$f$unpackInt1":I
    move v15, v13

    move/from16 v17, v14

    .end local v14    # "$i$f$unpackInt1":I
    .local v17, "$i$f$unpackInt1":I
    shr-long v13, v11, v15

    long-to-int v11, v13

    .line 390
    .end local v11    # "value$iv$iv":J
    .end local v17    # "$i$f$unpackInt1":I
    nop

    .line 337
    .end local v7    # "arg0$iv":J
    .end local v9    # "$i$f$getWidth-impl":I
    sub-int/2addr v10, v11

    .line 338
    .local v10, "rightToWindowRight":I
    const/4 v7, 0x0

    .line 340
    .local v7, "leftToWindowLeft":I
    sget-object v8, Landroidx/compose/ui/unit/LayoutDirection;->Ltr:Landroidx/compose/ui/unit/LayoutDirection;

    const/4 v9, 0x3

    const/4 v11, 0x2

    const/4 v12, 0x0

    if-ne v1, v8, :cond_2

    .line 342
    new-array v8, v9, [Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v12

    .line 343
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v16

    .line 342
    nop

    .line 346
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getLeft()I

    move-result v13

    if-ltz v13, :cond_1

    move v13, v10

    goto :goto_1

    :cond_1
    move v13, v7

    :goto_1
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v11

    .line 342
    nop

    .line 341
    invoke-static {v8}, Lkotlin/sequences/SequencesKt;->sequenceOf([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v8

    move/from16 v23, v9

    move/from16 v22, v10

    goto :goto_3

    .line 350
    :cond_2
    new-array v8, v9, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v12

    .line 351
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v16

    .line 350
    nop

    .line 355
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getRight()I

    move-result v13

    move-wide/from16 v17, p2

    .local v17, "arg0$iv":J
    const/4 v14, 0x0

    .line 392
    .local v14, "$i$f$getWidth-impl":I
    move-wide/from16 v19, v17

    .local v19, "value$iv$iv":J
    const/16 v21, 0x0

    .line 393
    .local v21, "$i$f$unpackInt1":I
    move/from16 v23, v9

    move/from16 v22, v10

    .end local v10    # "rightToWindowRight":I
    .local v22, "rightToWindowRight":I
    shr-long v9, v19, v15

    long-to-int v9, v9

    .line 392
    .end local v19    # "value$iv$iv":J
    .end local v21    # "$i$f$unpackInt1":I
    nop

    .line 355
    .end local v14    # "$i$f$getWidth-impl":I
    .end local v17    # "arg0$iv":J
    if-gt v13, v9, :cond_3

    move v9, v7

    goto :goto_2

    .line 356
    :cond_3
    move/from16 v9, v22

    :goto_2
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    .line 350
    nop

    .line 349
    invoke-static {v8}, Lkotlin/sequences/SequencesKt;->sequenceOf([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v8

    .line 359
    :goto_3
    nop

    .local v8, "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    const/4 v9, 0x0

    .line 394
    .local v9, "$i$f$firstOrNull":I
    invoke-interface {v8}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv":Ljava/lang/Object;
    move-object/from16 v17, v13

    check-cast v17, Ljava/lang/Number;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Number;->intValue()I

    move-result v17

    .local v17, "it":I
    const/16 v18, 0x0

    .line 359
    .local v18, "$i$a$-firstOrNull-DropdownMenuPositionProvider$calculatePosition$x$1":I
    if-ltz v17, :cond_4

    move-wide/from16 v19, p5

    .local v19, "arg0$iv":J
    const/16 v21, 0x0

    .line 395
    .local v21, "$i$f$getWidth-impl":I
    move-wide/from16 v24, v19

    .local v24, "value$iv$iv":J
    const/16 v26, 0x0

    .line 396
    .local v26, "$i$f$unpackInt1":I
    move/from16 v27, v11

    move/from16 v28, v12

    shr-long v11, v24, v15

    long-to-int v11, v11

    .line 395
    .end local v24    # "value$iv$iv":J
    .end local v26    # "$i$f$unpackInt1":I
    nop

    .line 359
    .end local v19    # "arg0$iv":J
    .end local v21    # "$i$f$getWidth-impl":I
    add-int v11, v17, v11

    move-wide/from16 v19, p2

    .restart local v19    # "arg0$iv":J
    const/4 v12, 0x0

    .line 395
    .local v12, "$i$f$getWidth-impl":I
    move-wide/from16 v24, v19

    .restart local v24    # "value$iv$iv":J
    const/16 v21, 0x0

    .line 396
    .local v21, "$i$f$unpackInt1":I
    move/from16 v26, v15

    shr-long v14, v24, v26

    long-to-int v14, v14

    .line 395
    .end local v21    # "$i$f$unpackInt1":I
    .end local v24    # "value$iv$iv":J
    nop

    .line 359
    .end local v12    # "$i$f$getWidth-impl":I
    .end local v19    # "arg0$iv":J
    if-gt v11, v14, :cond_5

    move/from16 v11, v16

    goto :goto_5

    :cond_4
    move/from16 v27, v11

    move/from16 v28, v12

    move/from16 v26, v15

    :cond_5
    move/from16 v11, v28

    .line 394
    .end local v17    # "it":I
    .end local v18    # "$i$a$-firstOrNull-DropdownMenuPositionProvider$calculatePosition$x$1":I
    :goto_5
    if-eqz v11, :cond_6

    goto :goto_6

    :cond_6
    move/from16 v15, v26

    move/from16 v11, v27

    move/from16 v12, v28

    goto :goto_4

    .line 397
    .end local v13    # "element$iv":Ljava/lang/Object;
    :cond_7
    move/from16 v27, v11

    move/from16 v28, v12

    move/from16 v26, v15

    const/4 v13, 0x0

    .line 359
    .end local v8    # "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    .end local v9    # "$i$f$firstOrNull":I
    :goto_6
    check-cast v13, Ljava/lang/Integer;

    .line 340
    if-eqz v13, :cond_8

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_7

    .line 360
    :cond_8
    move v8, v6

    .line 340
    :goto_7
    nop

    .line 339
    nop

    .line 363
    .local v8, "x":I
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getBottom()I

    move-result v9

    add-int/2addr v9, v3

    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 364
    .local v9, "topToAnchorBottom":I
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getTop()I

    move-result v10

    move-wide/from16 v11, p5

    .local v11, "arg0$iv":J
    const/4 v13, 0x0

    .line 398
    .local v13, "$i$f$getHeight-impl":I
    move-wide v14, v11

    .local v14, "value$iv$iv":J
    const/16 v17, 0x0

    .line 399
    .local v17, "$i$f$unpackInt2":I
    const-wide v18, 0xffffffffL

    move/from16 v20, v3

    move/from16 v21, v4

    .end local v3    # "contentOffsetY":I
    .end local v4    # "leftToAnchorLeft":I
    .local v20, "contentOffsetY":I
    .local v21, "leftToAnchorLeft":I
    and-long v3, v14, v18

    long-to-int v3, v3

    .line 398
    .end local v14    # "value$iv$iv":J
    .end local v17    # "$i$f$unpackInt2":I
    nop

    .line 364
    .end local v11    # "arg0$iv":J
    .end local v13    # "$i$f$getHeight-impl":I
    sub-int/2addr v10, v3

    add-int v10, v10, v20

    .line 365
    .local v10, "bottomToAnchorTop":I
    invoke-virtual/range {p1 .. p1}, Landroidx/compose/ui/unit/IntRect;->getTop()I

    move-result v3

    .restart local v11    # "arg0$iv":J
    const/4 v4, 0x0

    .line 400
    .local v4, "$i$f$getHeight-impl":I
    move-wide v13, v11

    .local v13, "value$iv$iv":J
    const/4 v15, 0x0

    .line 401
    .local v15, "$i$f$unpackInt2":I
    move/from16 v17, v3

    move/from16 v24, v4

    .end local v4    # "$i$f$getHeight-impl":I
    .local v24, "$i$f$getHeight-impl":I
    and-long v3, v13, v18

    long-to-int v3, v3

    .line 400
    .end local v13    # "value$iv$iv":J
    .end local v15    # "$i$f$unpackInt2":I
    nop

    .line 365
    .end local v11    # "arg0$iv":J
    .end local v24    # "$i$f$getHeight-impl":I
    div-int/lit8 v3, v3, 0x2

    sub-int v3, v17, v3

    add-int v3, v3, v20

    .line 366
    .local v3, "centerToAnchorTop":I
    move-wide/from16 v11, p2

    .restart local v11    # "arg0$iv":J
    const/4 v4, 0x0

    .line 402
    .restart local v4    # "$i$f$getHeight-impl":I
    move-wide v13, v11

    .restart local v13    # "value$iv$iv":J
    const/4 v15, 0x0

    .line 403
    .restart local v15    # "$i$f$unpackInt2":I
    move/from16 v17, v3

    move/from16 v24, v4

    .end local v3    # "centerToAnchorTop":I
    .end local v4    # "$i$f$getHeight-impl":I
    .local v17, "centerToAnchorTop":I
    .restart local v24    # "$i$f$getHeight-impl":I
    and-long v3, v13, v18

    long-to-int v3, v3

    .line 402
    .end local v13    # "value$iv$iv":J
    .end local v15    # "$i$f$unpackInt2":I
    nop

    .line 366
    .end local v11    # "arg0$iv":J
    .end local v24    # "$i$f$getHeight-impl":I
    move-wide/from16 v11, p5

    .restart local v11    # "arg0$iv":J
    const/4 v4, 0x0

    .line 402
    .restart local v4    # "$i$f$getHeight-impl":I
    move-wide v13, v11

    .restart local v13    # "value$iv$iv":J
    const/4 v15, 0x0

    .line 403
    .restart local v15    # "$i$f$unpackInt2":I
    move/from16 v24, v3

    move/from16 v25, v4

    .end local v4    # "$i$f$getHeight-impl":I
    .local v25, "$i$f$getHeight-impl":I
    and-long v3, v13, v18

    long-to-int v3, v3

    .line 402
    .end local v13    # "value$iv$iv":J
    .end local v15    # "$i$f$unpackInt2":I
    nop

    .line 366
    .end local v11    # "arg0$iv":J
    .end local v25    # "$i$f$getHeight-impl":I
    sub-int v3, v24, v3

    sub-int/2addr v3, v2

    .line 368
    .local v3, "bottomToWindowBottom":I
    nop

    .line 369
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Integer;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v28

    .line 370
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v16

    .line 369
    nop

    .line 371
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v27

    .line 369
    nop

    .line 372
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v23

    .line 369
    nop

    .line 368
    invoke-static {v4}, Lkotlin/sequences/SequencesKt;->sequenceOf([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object v4

    .line 374
    nop

    .local v4, "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    const/4 v11, 0x0

    .line 404
    .local v11, "$i$f$firstOrNull":I
    invoke-interface {v4}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_c

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->intValue()I

    move-result v14

    .local v14, "it":I
    const/4 v15, 0x0

    .line 375
    .local v15, "$i$a$-firstOrNull-DropdownMenuPositionProvider$calculatePosition$y$1":I
    if-lt v14, v2, :cond_9

    .line 376
    move-wide/from16 v23, p5

    .local v23, "arg0$iv":J
    const/16 v25, 0x0

    .line 405
    .restart local v25    # "$i$f$getHeight-impl":I
    move-wide/from16 v29, v23

    .local v29, "value$iv$iv":J
    const/16 v27, 0x0

    .line 406
    .local v27, "$i$f$unpackInt2":I
    move/from16 v31, v2

    .end local v2    # "verticalMargin":I
    .local v31, "verticalMargin":I
    and-long v1, v29, v18

    long-to-int v1, v1

    .line 405
    .end local v27    # "$i$f$unpackInt2":I
    .end local v29    # "value$iv$iv":J
    nop

    .line 376
    .end local v23    # "arg0$iv":J
    .end local v25    # "$i$f$getHeight-impl":I
    add-int/2addr v1, v14

    move-wide/from16 v23, p2

    .restart local v23    # "arg0$iv":J
    const/4 v2, 0x0

    .line 405
    .local v2, "$i$f$getHeight-impl":I
    move-wide/from16 v29, v23

    .restart local v29    # "value$iv$iv":J
    const/16 v25, 0x0

    .line 406
    .local v25, "$i$f$unpackInt2":I
    move/from16 v32, v2

    move/from16 v27, v3

    .end local v2    # "$i$f$getHeight-impl":I
    .end local v3    # "bottomToWindowBottom":I
    .local v27, "bottomToWindowBottom":I
    .local v32, "$i$f$getHeight-impl":I
    and-long v2, v29, v18

    long-to-int v2, v2

    .line 405
    .end local v25    # "$i$f$unpackInt2":I
    .end local v29    # "value$iv$iv":J
    nop

    .line 376
    .end local v23    # "arg0$iv":J
    .end local v32    # "$i$f$getHeight-impl":I
    sub-int v2, v2, v31

    if-gt v1, v2, :cond_a

    move/from16 v1, v16

    goto :goto_9

    .line 375
    .end local v27    # "bottomToWindowBottom":I
    .end local v31    # "verticalMargin":I
    .local v2, "verticalMargin":I
    .restart local v3    # "bottomToWindowBottom":I
    :cond_9
    move/from16 v31, v2

    move/from16 v27, v3

    .line 376
    .end local v2    # "verticalMargin":I
    .end local v3    # "bottomToWindowBottom":I
    .restart local v27    # "bottomToWindowBottom":I
    .restart local v31    # "verticalMargin":I
    :cond_a
    move/from16 v1, v28

    .line 404
    .end local v14    # "it":I
    .end local v15    # "$i$a$-firstOrNull-DropdownMenuPositionProvider$calculatePosition$y$1":I
    :goto_9
    if-eqz v1, :cond_b

    move-object v14, v13

    goto :goto_a

    :cond_b
    move-object/from16 v1, p4

    move/from16 v3, v27

    move/from16 v2, v31

    goto :goto_8

    .line 407
    .end local v13    # "element$iv":Ljava/lang/Object;
    .end local v27    # "bottomToWindowBottom":I
    .end local v31    # "verticalMargin":I
    .restart local v2    # "verticalMargin":I
    .restart local v3    # "bottomToWindowBottom":I
    :cond_c
    move/from16 v31, v2

    move/from16 v27, v3

    .end local v2    # "verticalMargin":I
    .end local v3    # "bottomToWindowBottom":I
    .restart local v27    # "bottomToWindowBottom":I
    .restart local v31    # "verticalMargin":I
    const/4 v14, 0x0

    .line 374
    .end local v4    # "$this$firstOrNull$iv":Lkotlin/sequences/Sequence;
    .end local v11    # "$i$f$firstOrNull":I
    :goto_a
    check-cast v14, Ljava/lang/Integer;

    .line 368
    if-eqz v14, :cond_d

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_b

    .line 377
    :cond_d
    move v1, v10

    .line 368
    :goto_b
    nop

    .line 367
    nop

    .line 379
    .local v1, "y":I
    iget-object v2, v0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    .line 380
    nop

    .line 381
    new-instance v3, Landroidx/compose/ui/unit/IntRect;

    move-wide/from16 v11, p5

    .local v11, "arg0$iv":J
    const/4 v4, 0x0

    .line 408
    .local v4, "$i$f$getWidth-impl":I
    move-wide v13, v11

    .local v13, "value$iv$iv":J
    const/4 v15, 0x0

    .line 409
    .local v15, "$i$f$unpackInt1":I
    move/from16 v23, v4

    move/from16 v16, v5

    .end local v4    # "$i$f$getWidth-impl":I
    .end local v5    # "contentOffsetX":I
    .local v16, "contentOffsetX":I
    .local v23, "$i$f$getWidth-impl":I
    shr-long v4, v13, v26

    long-to-int v4, v4

    .line 408
    .end local v13    # "value$iv$iv":J
    .end local v15    # "$i$f$unpackInt1":I
    nop

    .line 381
    .end local v11    # "arg0$iv":J
    .end local v23    # "$i$f$getWidth-impl":I
    add-int/2addr v4, v8

    .restart local v11    # "arg0$iv":J
    const/4 v5, 0x0

    .line 410
    .local v5, "$i$f$getHeight-impl":I
    nop

    .restart local v13    # "value$iv$iv":J
    const/4 v15, 0x0

    .line 411
    .local v15, "$i$f$unpackInt2":I
    move/from16 v24, v5

    move/from16 v23, v6

    .end local v5    # "$i$f$getHeight-impl":I
    .end local v6    # "rightToAnchorRight":I
    .local v23, "rightToAnchorRight":I
    .restart local v24    # "$i$f$getHeight-impl":I
    and-long v5, v13, v18

    long-to-int v5, v5

    .line 410
    .end local v13    # "value$iv$iv":J
    .end local v15    # "$i$f$unpackInt2":I
    nop

    .line 381
    .end local v11    # "arg0$iv":J
    .end local v24    # "$i$f$getHeight-impl":I
    add-int/2addr v5, v1

    invoke-direct {v3, v8, v1, v4, v5}, Landroidx/compose/ui/unit/IntRect;-><init>(IIII)V

    .line 379
    move-object/from16 v4, p1

    invoke-interface {v2, v4, v3}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    move v2, v1

    .local v2, "y$iv":I
    move v3, v8

    .local v3, "x$iv":I
    const/4 v5, 0x0

    .line 412
    .local v5, "$i$f$IntOffset":I
    const/4 v6, 0x0

    .line 413
    .local v6, "$i$f$packInts":I
    int-to-long v11, v3

    shl-long v11, v11, v26

    int-to-long v13, v2

    and-long v13, v13, v18

    or-long/2addr v11, v13

    .line 412
    .end local v6    # "$i$f$packInts":I
    invoke-static {v11, v12}, Landroidx/compose/ui/unit/IntOffset;->constructor-impl(J)J

    move-result-wide v2

    .line 383
    .end local v2    # "y$iv":I
    .end local v3    # "x$iv":I
    .end local v5    # "$i$f$IntOffset":I
    return-wide v2
.end method

.method public final component1-RKDOV3M()J
    .locals 2

    iget-wide v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    return-wide v0
.end method

.method public final component2()Landroidx/compose/ui/unit/Density;
    .locals 1

    iget-object v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    return-object v0
.end method

.method public final component3()Lkotlin/jvm/functions/Function2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/ui/unit/IntRect;",
            "Landroidx/compose/ui/unit/IntRect;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    return-object v0
.end method

.method public final copy-rOJDEFc(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;)Landroidx/compose/material/DropdownMenuPositionProvider;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroidx/compose/ui/unit/Density;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/ui/unit/IntRect;",
            "-",
            "Landroidx/compose/ui/unit/IntRect;",
            "Lkotlin/Unit;",
            ">;)",
            "Landroidx/compose/material/DropdownMenuPositionProvider;"
        }
    .end annotation

    new-instance v0, Landroidx/compose/material/DropdownMenuPositionProvider;

    const/4 v5, 0x0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Landroidx/compose/material/DropdownMenuPositionProvider;-><init>(JLandroidx/compose/ui/unit/Density;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Landroidx/compose/material/DropdownMenuPositionProvider;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Landroidx/compose/material/DropdownMenuPositionProvider;

    iget-wide v3, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    iget-wide v5, v1, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    invoke-static {v3, v4, v5, v6}, Landroidx/compose/ui/unit/DpOffset;->equals-impl0(JJ)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    iget-object v4, v1, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    iget-object v1, v1, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getContentOffset-RKDOV3M()J
    .locals 2

    .line 314
    iget-wide v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    return-wide v0
.end method

.method public final getDensity()Landroidx/compose/ui/unit/Density;
    .locals 1

    .line 315
    iget-object v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    return-object v0
.end method

.method public final getOnPositionCalculated()Lkotlin/jvm/functions/Function2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/ui/unit/IntRect;",
            "Landroidx/compose/ui/unit/IntRect;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 316
    iget-object v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-wide v0, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/DpOffset;->hashCode-impl(J)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DropdownMenuPositionProvider(contentOffset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->contentOffset:J

    invoke-static {v1, v2}, Landroidx/compose/ui/unit/DpOffset;->toString-impl(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", density="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->density:Landroidx/compose/ui/unit/Density;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", onPositionCalculated="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/compose/material/DropdownMenuPositionProvider;->onPositionCalculated:Lkotlin/jvm/functions/Function2;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
