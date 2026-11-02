.class final synthetic Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt;
.super Ljava/lang/Object;
.source "RememberNavBackStack.android.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRememberNavBackStack.android.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RememberNavBackStack.android.kt\nandroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,64:1\n1277#2,6:65\n*S KotlinDebug\n*F\n+ 1 RememberNavBackStack.android.kt\nandroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt\n*L\n60#1:65,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\u001a\'\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u0012\u0010\u0003\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0004\"\u00020\u0002H\u0007\u00a2\u0006\u0002\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "rememberNavBackStack",
        "Landroidx/navigation3/runtime/NavBackStack;",
        "Landroidx/navigation3/runtime/NavKey;",
        "elements",
        "",
        "([Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;",
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
.method public static synthetic $r8$lambda$UlLKBbIkSuEgJucviwp3aUg4RfI([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt;->rememberNavBackStack$lambda$0$0$RememberNavBackStackKt__RememberNavBackStack_androidKt([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;

    move-result-object p0

    return-object p0
.end method

.method public static final rememberNavBackStack([Landroidx/navigation3/runtime/NavKey;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavBackStack;
    .locals 9
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

    .line 57
    const v0, -0x1f6289ae

    const-string v1, "C(rememberNavBackStack)N(elements)59@2897L39,57@2785L151:RememberNavBackStack.android.kt#aulyik"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.navigation3.runtime.rememberNavBackStack (RememberNavBackStack.android.kt:56)"

    invoke-static {v0, p2, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Object;

    .line 59
    new-instance v0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;

    new-instance v2, Landroidx/navigation3/runtime/serialization/NavKeySerializer;

    invoke-direct {v2}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;-><init>()V

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-direct {v0, v2}, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;-><init>(Lkotlinx/serialization/KSerializer;)V

    move-object v2, v0

    check-cast v2, Lkotlinx/serialization/KSerializer;

    .line 60
    const v0, 0x2f194299

    const-string v3, "CC(remember):RememberNavBackStack.android.kt#9igjgp"

    invoke-static {p1, v0, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid$iv":Z
    move-object v3, p1

    .local v3, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 65
    .local v4, "$i$f$cache":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 66
    .local v6, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v0, :cond_2

    sget-object v7, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v7}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v7

    if-ne v5, v7, :cond_1

    goto :goto_0

    .line 70
    :cond_1
    goto :goto_1

    .line 67
    :cond_2
    :goto_0
    const/4 v7, 0x0

    .line 60
    .local v7, "$i$a$-cache-RememberNavBackStackKt__RememberNavBackStack_androidKt$rememberNavBackStack$1":I
    new-instance v8, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt$$ExternalSyntheticLambda0;

    invoke-direct {v8, p0}, Landroidx/navigation3/runtime/RememberNavBackStackKt__RememberNavBackStack_androidKt$$ExternalSyntheticLambda0;-><init>([Landroidx/navigation3/runtime/NavKey;)V

    .line 67
    .end local v7    # "$i$a$-cache-RememberNavBackStackKt__RememberNavBackStack_androidKt$rememberNavBackStack$1":I
    nop

    .line 68
    .local v8, "value$iv":Ljava/lang/Object;
    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 69
    move-object v5, v8

    .line 65
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v8    # "value$iv":Ljava/lang/Object;
    :goto_1
    nop

    .line 60
    .end local v0    # "invalid$iv":Z
    .end local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache":I
    move-object v4, v5

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 58
    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x4

    move-object v5, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v7}, Landroidx/compose/runtime/saveable/RememberSerializableKt;->rememberSerializable([Ljava/lang/Object;Lkotlinx/serialization/KSerializer;Landroidx/savedstate/serialization/SavedStateConfiguration;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/navigation3/runtime/NavBackStack;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 57
    :cond_3
    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 58
    return-object p1
.end method

.method private static final rememberNavBackStack$lambda$0$0$RememberNavBackStackKt__RememberNavBackStack_androidKt([Landroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavBackStack;
    .locals 2
    .param p0, "$elements"    # [Landroidx/navigation3/runtime/NavKey;

    .line 61
    new-instance v0, Landroidx/navigation3/runtime/NavBackStack;

    array-length v1, p0

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroidx/navigation3/runtime/NavKey;

    invoke-direct {v0, v1}, Landroidx/navigation3/runtime/NavBackStack;-><init>([Landroidx/navigation3/runtime/NavKey;)V

    return-object v0
.end method
