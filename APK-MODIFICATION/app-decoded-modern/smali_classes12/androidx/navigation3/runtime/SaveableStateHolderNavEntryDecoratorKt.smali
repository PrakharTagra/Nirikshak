.class public final Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecoratorKt;
.super Ljava/lang/Object;
.source "SaveableStateHolderNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSaveableStateHolderNavEntryDecorator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SaveableStateHolderNavEntryDecorator.kt\nandroidx/navigation3/runtime/SaveableStateHolderNavEntryDecoratorKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,60:1\n1277#2,6:61\n*S KotlinDebug\n*F\n+ 1 SaveableStateHolderNavEntryDecorator.kt\nandroidx/navigation3/runtime/SaveableStateHolderNavEntryDecoratorKt\n*L\n36#1:61,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\'\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "rememberSaveableStateHolderNavEntryDecorator",
        "Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;",
        "T",
        "",
        "saveableStateHolder",
        "Landroidx/compose/runtime/saveable/SaveableStateHolder;",
        "(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/compose/runtime/Composer;II)Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;",
        "navigation3-runtime"
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
.method public static final rememberSaveableStateHolderNavEntryDecorator(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/compose/runtime/Composer;II)Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;
    .locals 6
    .param p0, "saveableStateHolder"    # Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/compose/runtime/saveable/SaveableStateHolder;",
            "Landroidx/compose/runtime/Composer;",
            "II)",
            "Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator<",
            "TT;>;"
        }
    .end annotation

    .line 36
    const v0, -0x148374d5

    const-string v1, "C(rememberSaveableStateHolderNavEntryDecorator)N(saveableStateHolder)33@1373L29,35@1452L91:SaveableStateHolderNavEntryDecorator.kt#aulyik"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 34
    const/4 p3, 0x0

    invoke-static {p1, p3}, Landroidx/compose/runtime/saveable/SaveableStateHolderKt;->rememberSaveableStateHolder(Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/saveable/SaveableStateHolder;

    move-result-object p0

    :cond_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 p3, -0x1

    const-string v1, "androidx.navigation3.runtime.rememberSaveableStateHolderNavEntryDecorator (SaveableStateHolderNavEntryDecorator.kt:35)"

    invoke-static {v0, p2, p3, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 36
    :cond_1
    const p3, -0x1797bfa

    const-string v0, "CC(remember):SaveableStateHolderNavEntryDecorator.kt#9igjgp"

    invoke-static {p1, p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result p3

    .local p3, "invalid$iv":Z
    move-object v0, p1

    .local v0, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v1, 0x0

    .line 61
    .local v1, "$i$f$cache":I
    invoke-interface {v0}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    .local v2, "it$iv":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 62
    .local v3, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez p3, :cond_3

    sget-object v4, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v4}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v4

    if-ne v2, v4, :cond_2

    goto :goto_0

    .line 66
    :cond_2
    goto :goto_1

    .line 63
    :cond_3
    :goto_0
    const/4 v4, 0x0

    .line 36
    .local v4, "$i$a$-cache-SaveableStateHolderNavEntryDecoratorKt$rememberSaveableStateHolderNavEntryDecorator$1":I
    new-instance v5, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;

    invoke-direct {v5, p0}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;-><init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V

    .line 63
    .end local v4    # "$i$a$-cache-SaveableStateHolderNavEntryDecoratorKt$rememberSaveableStateHolderNavEntryDecorator$1":I
    nop

    .line 64
    .local v5, "value$iv":Ljava/lang/Object;
    invoke-interface {v0, v5}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 65
    move-object v2, v5

    .line 61
    .end local v2    # "it$iv":Ljava/lang/Object;
    .end local v3    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v5    # "value$iv":Ljava/lang/Object;
    :goto_1
    nop

    .line 36
    .end local v0    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v1    # "$i$f$cache":I
    .end local p3    # "invalid$iv":Z
    check-cast v2, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;

    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_4
    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    return-object v2
.end method
