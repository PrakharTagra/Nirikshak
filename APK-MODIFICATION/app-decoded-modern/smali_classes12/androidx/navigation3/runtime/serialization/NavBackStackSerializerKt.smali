.class public final Landroidx/navigation3/runtime/serialization/NavBackStackSerializerKt;
.super Ljava/lang/Object;
.source "NavBackStackSerializer.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u001b\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\n\u0008\u0000\u0010\u0002\u0018\u0001*\u00020\u0003H\u0086\u0008\u00a8\u0006\u0004"
    }
    d2 = {
        "NavBackStackSerializer",
        "Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;",
        "T",
        "Landroidx/navigation3/runtime/NavKey;",
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
.method public static final synthetic NavBackStackSerializer()Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/navigation3/runtime/NavKey;",
            ">()",
            "Landroidx/navigation3/runtime/serialization/NavBackStackSerializer<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 84
    .local v0, "$i$f$NavBackStackSerializer":I
    new-instance v1, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;

    const/4 v2, 0x6

    const-string v3, "T"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-string/jumbo v2, "kotlinx.serialization.serializer.simple"

    invoke-static {v2}, Lkotlin/jvm/internal/MagicApiIntrinsics;->voidMagicApiCall(Ljava/lang/Object;)V

    const/4 v2, 0x0

    invoke-static {v2}, Lkotlinx/serialization/SerializersKt;->serializer(Lkotlin/reflect/KType;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;-><init>(Lkotlinx/serialization/KSerializer;)V

    return-object v1
.end method
