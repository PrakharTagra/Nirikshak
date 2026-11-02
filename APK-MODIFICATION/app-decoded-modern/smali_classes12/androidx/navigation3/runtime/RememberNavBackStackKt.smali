.class public final Landroidx/navigation3/runtime/RememberNavBackStackKt;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "androidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt",
        "androidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt"
    }
    k = 0x4
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final rememberNavBackStack(Landroidx/savedstate/serialization/SavedStateConfiguration;[Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;
    .locals 1
    .param p0, "configuration"    # Landroidx/savedstate/serialization/SavedStateConfiguration;
    .param p1, "elements"    # [Landroidx/navigation3/runtime/NavKey;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/savedstate/serialization/SavedStateConfiguration;",
            "[",
            "Landroidx/navigation3/runtime/NavKey;",
            "Landroidx/compose/runtime/Composer;",
            "I)",
            "Landroidx/navigation3/runtime/NavBackStack<",
            "Landroidx/navigation3/runtime/NavKey;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt;->rememberNavBackStack(Landroidx/savedstate/serialization/SavedStateConfiguration;[Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;

    move-result-object v0

    return-object v0
.end method

.method public static final rememberNavBackStack([Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;
    .locals 1
    .param p0, "elements"    # [Landroidx/navigation3/runtime/NavKey;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroidx/navigation3/runtime/NavKey;",
            "Landroidx/compose/runtime/Composer;",
            "I)",
            "Landroidx/navigation3/runtime/NavBackStack<",
            "Landroidx/navigation3/runtime/NavKey;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt;->rememberNavBackStack([Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;

    move-result-object v0

    return-object v0
.end method
