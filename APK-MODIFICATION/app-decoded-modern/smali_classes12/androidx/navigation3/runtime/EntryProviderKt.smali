.class public final Landroidx/navigation3/runtime/EntryProviderKt;
.super Ljava/lang/Object;
.source "EntryProvider.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001ao\u0010\u0000\u001a\u0014\u0012\u0004\u0012\u0002H\u0002\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00030\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00042)\u0008\n\u0010\u0005\u001a#\u0012\u0013\u0012\u0011H\u0002\u00a2\u0006\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00030\u00012\u001d\u0010\t\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\n\u0012\u0004\u0012\u00020\u000b0\u0001\u00a2\u0006\u0002\u0008\u000cH\u0086\u0008\u00a8\u0006\r"
    }
    d2 = {
        "entryProvider",
        "Lkotlin/Function1;",
        "T",
        "Landroidx/navigation3/runtime/NavEntry;",
        "",
        "fallback",
        "Lkotlin/ParameterName;",
        "name",
        "unknownScreen",
        "builder",
        "Landroidx/navigation3/runtime/EntryProviderScope;",
        "",
        "Lkotlin/ExtensionFunctionType;",
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
.method public static final entryProvider(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;
    .locals 2
    .param p0, "fallback"    # Lkotlin/jvm/functions/Function1;
    .param p1, "builder"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/navigation3/runtime/EntryProviderScope<",
            "TT;>;",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlin/jvm/functions/Function1<",
            "TT;",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 40
    .local v0, "$i$f$entryProvider":I
    new-instance v1, Landroidx/navigation3/runtime/EntryProviderScope;

    invoke-direct {v1, p0}, Landroidx/navigation3/runtime/EntryProviderScope;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Landroidx/navigation3/runtime/EntryProviderScope;->build()Lkotlin/jvm/functions/Function1;

    move-result-object v1

    return-object v1
.end method

.method public static synthetic entryProvider$default(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlin/jvm/functions/Function1;
    .locals 0
    .param p0, "fallback"    # Lkotlin/jvm/functions/Function1;
    .param p1, "builder"    # Lkotlin/jvm/functions/Function1;

    .line 35
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 36
    sget-object p2, Landroidx/navigation3/runtime/EntryProviderKt$entryProvider$1;->INSTANCE:Landroidx/navigation3/runtime/EntryProviderKt$entryProvider$1;

    move-object p0, p2

    check-cast p0, Lkotlin/jvm/functions/Function1;

    .line 35
    :cond_0
    const/4 p2, 0x0

    .line 40
    .local p2, "$i$f$entryProvider":I
    new-instance p3, Landroidx/navigation3/runtime/EntryProviderScope;

    invoke-direct {p3, p0}, Landroidx/navigation3/runtime/EntryProviderScope;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-interface {p1, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p3}, Landroidx/navigation3/runtime/EntryProviderScope;->build()Lkotlin/jvm/functions/Function1;

    move-result-object p3

    return-object p3
.end method
