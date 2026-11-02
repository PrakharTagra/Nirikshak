.class public final Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;
.super Landroidx/navigation3/runtime/NavEntryDecorator;
.source "SaveableStateHolderNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/navigation3/runtime/NavEntryDecorator<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;",
        "T",
        "",
        "Landroidx/navigation3/runtime/NavEntryDecorator;",
        "saveableStateHolder",
        "Landroidx/compose/runtime/saveable/SaveableStateHolder;",
        "<init>",
        "(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V",
        "navigation3-runtime"
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


# direct methods
.method public static synthetic $r8$lambda$5AEs6Y8xjT-m9rz_14ajr7_PkrE(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;->_init_$lambda$1$0(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$VFpj1iHfkGsZKknQulWytuuRNvU(Landroidx/compose/runtime/saveable/SaveableStateHolder;Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;->_init_$lambda$0(Landroidx/compose/runtime/saveable/SaveableStateHolder;Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$t4eKAgy2A-Z1Twj-AWPTEIV4lzM(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;->_init_$lambda$1(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V
    .locals 4
    .param p1, "saveableStateHolder"    # Landroidx/compose/runtime/saveable/SaveableStateHolder;

    .line 51
    nop

    .line 55
    new-instance v0, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V

    .line 56
    new-instance v1, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V

    const v2, -0x4eba27d9

    const/4 v3, 0x1

    invoke-static {v2, v3, v1}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function3;

    .line 51
    invoke-direct {p0, v0, v1}, Landroidx/navigation3/runtime/NavEntryDecorator;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method private static final _init_$lambda$0(Landroidx/compose/runtime/saveable/SaveableStateHolder;Ljava/lang/Object;)Lkotlin/Unit;
    .locals 1
    .param p0, "$saveableStateHolder"    # Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .param p1, "contentKey"    # Ljava/lang/Object;

    .line 55
    invoke-interface {p0, p1}, Landroidx/compose/runtime/saveable/SaveableStateHolder;->removeState(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final _init_$lambda$1(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 6
    .param p0, "$saveableStateHolder"    # Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .param p1, "entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "CN(entry)56@2558L19,56@2518L59:SaveableStateHolderNavEntryDecorator.kt#aulyik"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move v0, p3

    .local v0, "$dirty":I
    and-int/lit8 v1, p3, 0x6

    if-nez v1, :cond_1

    invoke-interface {p2, p1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v0, v1

    :cond_1
    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x1

    if-eq v1, v2, :cond_2

    move v1, v3

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    and-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v2, "androidx.navigation3.runtime.SaveableStateHolderNavEntryDecorator.<init>.<anonymous> (SaveableStateHolderNavEntryDecorator.kt:56)"

    const v4, -0x4eba27d9

    invoke-static {v4, v0, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 57
    :cond_3
    invoke-virtual {p1}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda2;-><init>(Landroidx/navigation3/runtime/NavEntry;)V

    const/16 v4, 0x36

    const v5, 0x73a5348

    invoke-static {v5, v3, v2, p2, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function2;

    const/16 v3, 0x30

    invoke-interface {p0, v1, v2, p2, v3}, Landroidx/compose/runtime/saveable/SaveableStateHolder;->SaveableStateProvider(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_2

    .line 56
    :cond_4
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 58
    :cond_5
    :goto_2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final _init_$lambda$1$0(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C56@2566L9:SaveableStateHolderNavEntryDecorator.kt#aulyik"

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

    const-string v1, "androidx.navigation3.runtime.SaveableStateHolderNavEntryDecorator.<init>.<anonymous>.<anonymous> (SaveableStateHolderNavEntryDecorator.kt:56)"

    const v3, 0x73a5348

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 57
    :cond_1
    invoke-virtual {p0, p1, v2}, Landroidx/navigation3/runtime/NavEntry;->Content(Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
