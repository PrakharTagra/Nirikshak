.class final synthetic Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt;
.super Ljava/lang/Object;
.source "RememberNavBackStack.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRememberNavBackStack.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RememberNavBackStack.kt\nandroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,75:1\n1277#2,6:76\n*S KotlinDebug\n*F\n+ 1 RememberNavBackStack.kt\nandroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt\n*L\n71#1:76,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u001a/\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u0012\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0006\"\u00020\u0002H\u0007\u00a2\u0006\u0002\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "rememberNavBackStack",
        "Landroidx/navigation3/runtime/NavBackStack;",
        "Landroidx/navigation3/runtime/NavKey;",
        "configuration",
        "Landroidx/savedstate/serialization/SavedStateConfiguration;",
        "elements",
        "",
        "(Landroidx/savedstate/serialization/SavedStateConfiguration;[Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;",
        "navigation3-runtime"
    }
    k = 0x5
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
    xs = "androidx/navigation3/runtime/RememberNavBackStackKt"
.end annotation


# direct methods
.method public static synthetic $r8$lambda$HfiEfvTEKUiEK3rcYDJQt2F9cH4([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt;->rememberNavBackStack$lambda$1$0$RememberNavBackStackKt__RememberNavBackStackKt([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;

    move-result-object p0

    return-object p0
.end method

.method public static final rememberNavBackStack(Landroidx/savedstate/serialization/SavedStateConfiguration;[Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;
    .locals 9
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

    .line 63
    const v0, -0x35ba558d

    const-string v1, "C(rememberNavBackStack)N(configuration,elements)70@3328L39,67@3178L189:RememberNavBackStack.kt#aulyik"

    invoke-static {p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.navigation3.runtime.rememberNavBackStack (RememberNavBackStack.kt:62)"

    invoke-static {v0, p3, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 64
    :cond_0
    invoke-virtual {p0}, Landroidx/savedstate/serialization/SavedStateConfiguration;->getSerializersModule()Lkotlinx/serialization/modules/SerializersModule;

    move-result-object v0

    sget-object v1, Landroidx/savedstate/serialization/SavedStateConfiguration;->DEFAULT:Landroidx/savedstate/serialization/SavedStateConfiguration;

    invoke-virtual {v1}, Landroidx/savedstate/serialization/SavedStateConfiguration;->getSerializersModule()Lkotlinx/serialization/modules/SerializersModule;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 70
    new-instance v0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;

    new-instance v1, Lkotlinx/serialization/PolymorphicSerializer;

    const-class v2, Landroidx/navigation3/runtime/NavKey;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    invoke-direct {v1, v2}, Lkotlinx/serialization/PolymorphicSerializer;-><init>(Lkotlin/reflect/KClass;)V

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-direct {v0, v1}, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;-><init>(Lkotlinx/serialization/KSerializer;)V

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkotlinx/serialization/KSerializer;

    .line 69
    nop

    .line 71
    const v0, 0x4f85227a

    const-string v1, "CC(remember):RememberNavBackStack.kt#9igjgp"

    invoke-static {p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p2, p1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid$iv":Z
    move-object v1, p2

    .local v1, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 76
    .local v4, "$i$f$cache":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 77
    .local v6, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_2

    sget-object v7, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v7}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v7

    if-ne v5, v7, :cond_1

    goto :goto_0

    .line 81
    :cond_1
    goto :goto_1

    .line 78
    :cond_2
    :goto_0
    const/4 v7, 0x0

    .line 71
    .local v7, "$i$a$-cache-RememberNavBackStackKt__RememberNavBackStackKt$rememberNavBackStack$2":I
    new-instance v8, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt$$ExternalSyntheticLambda0;

    invoke-direct {v8, p1}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStackKt$$ExternalSyntheticLambda0;-><init>([Landroidx/navigation3/runtime/NavKey;)V

    .line 78
    .end local v7    # "$i$a$-cache-RememberNavBackStackKt__RememberNavBackStackKt$rememberNavBackStack$2":I
    nop

    .line 79
    .local v8, "value$iv":Ljava/lang/Object;
    invoke-interface {v1, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 80
    move-object v5, v8

    .line 76
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v8    # "value$iv":Ljava/lang/Object;
    :goto_1
    nop

    .line 71
    .end local v0    # "invalid$iv":Z
    .end local v1    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache":I
    check-cast v5, Lkotlin/jvm/functions/Function0;

    invoke-static {p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    shl-int/lit8 v0, p3, 0x6

    and-int/lit16 v7, v0, 0x380

    .line 68
    const/4 v8, 0x0

    move-object v4, p0

    move-object v6, p2

    .end local p0    # "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v2 .. v8}, Landroidx/compose/runtime/saveable/RememberSerializableKt;->rememberSerializable([Ljava/lang/Object;Lkotlinx/serialization/KSerializer;Landroidx/savedstate/serialization/SavedStateConfiguration;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/navigation3/runtime/NavBackStack;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 63
    :cond_3
    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 68
    return-object p0

    .line 64
    .end local v4    # "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .end local v6    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p0    # "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .restart local p2    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_4
    move-object v4, p0

    move-object v6, p2

    .end local p0    # "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v4    # "configuration":Landroidx/savedstate/serialization/SavedStateConfiguration;
    .restart local v6    # "$composer":Landroidx/compose/runtime/Composer;
    const/4 p0, 0x0

    .line 66
    .local p0, "$i$a$-require-RememberNavBackStackKt__RememberNavBackStackKt$rememberNavBackStack$1":I
    nop

    .line 64
    .end local p0    # "$i$a$-require-RememberNavBackStackKt__RememberNavBackStackKt$rememberNavBackStack$1":I
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p2, "You must pass a `SavedStateConfiguration.serializersModule` configured to handle `NavKey` open polymorphism. Define it with: `polymorphic(NavKey::class) { ... }`"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final rememberNavBackStack$lambda$1$0$RememberNavBackStackKt__RememberNavBackStackKt([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;
    .locals 2
    .param p0, "$elements"    # [Landroidx/navigation3/runtime/NavKey;

    .line 72
    new-instance v0, Landroidx/navigation3/runtime/NavBackStack;

    array-length v1, p0

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroidx/navigation3/runtime/NavKey;

    invoke-direct {v0, v1}, Landroidx/navigation3/runtime/NavBackStack;-><init>([Landroidx/navigation3/runtime/NavKey;)V

    return-object v0
.end method
