.class public final Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;
.super Ljava/lang/Object;
.source "NavBackStackSerializer.kt"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroidx/navigation3/runtime/NavKey;",
        ">",
        "Ljava/lang/Object;",
        "Lkotlinx/serialization/KSerializer<",
        "Landroidx/navigation3/runtime/NavBackStack<",
        "TT;>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00010\u00040\u0003B\u0015\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0003\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001e\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u000c\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004H\u0016J\u0016\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00042\u0006\u0010\u0016\u001a\u00020\u0017H\u0016R\u0014\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00028\u00000\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u00020\u000bX\u0096\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0018"
    }
    d2 = {
        "Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;",
        "T",
        "Landroidx/navigation3/runtime/NavKey;",
        "Lkotlinx/serialization/KSerializer;",
        "Landroidx/navigation3/runtime/NavBackStack;",
        "elementSerializer",
        "<init>",
        "(Lkotlinx/serialization/KSerializer;)V",
        "delegate",
        "Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;",
        "descriptor",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "getDescriptor$annotations",
        "()V",
        "getDescriptor",
        "()Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "serialize",
        "",
        "encoder",
        "Lkotlinx/serialization/encoding/Encoder;",
        "value",
        "deserialize",
        "decoder",
        "Lkotlinx/serialization/encoding/Decoder;",
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


# instance fields
.field private final delegate:Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

.field private final elementSerializer:Lkotlinx/serialization/KSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlinx/serialization/KSerializer<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->$stable:I

    return-void
.end method

.method public constructor <init>(Lkotlinx/serialization/KSerializer;)V
    .locals 2
    .param p1, "elementSerializer"    # Lkotlinx/serialization/KSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/serialization/KSerializer<",
            "TT;>;)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->elementSerializer:Lkotlinx/serialization/KSerializer;

    .line 48
    new-instance v0, Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;

    iget-object v1, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->elementSerializer:Lkotlinx/serialization/KSerializer;

    invoke-direct {v0, v1}, Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;-><init>(Lkotlinx/serialization/KSerializer;)V

    iput-object v0, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->delegate:Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;

    .line 52
    iget-object v0, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->delegate:Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;

    invoke-virtual {v0}, Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    const-string v1, "androidx.navigation3.runtime.NavBackStack"

    invoke-static {v1, v0}, Lkotlinx/serialization/descriptors/SerialDescriptorsKt;->SerialDescriptor(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    iput-object v0, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    .line 45
    return-void
.end method

.method public static synthetic getDescriptor$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public deserialize(Lkotlinx/serialization/encoding/Decoder;)Landroidx/navigation3/runtime/NavBackStack;
    .locals 2
    .param p1, "decoder"    # Lkotlinx/serialization/encoding/Decoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/serialization/encoding/Decoder;",
            ")",
            "Landroidx/navigation3/runtime/NavBackStack<",
            "TT;>;"
        }
    .end annotation

    .line 59
    new-instance v0, Landroidx/navigation3/runtime/NavBackStack;

    iget-object v1, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->delegate:Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;

    check-cast v1, Lkotlinx/serialization/DeserializationStrategy;

    invoke-interface {p1, v1}, Lkotlinx/serialization/encoding/Decoder;->decodeSerializableValue(Lkotlinx/serialization/DeserializationStrategy;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-direct {v0, v1}, Landroidx/navigation3/runtime/NavBackStack;-><init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;)V

    return-object v0
.end method

.method public bridge synthetic deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .locals 1
    .param p1, "decoder"    # Lkotlinx/serialization/encoding/Decoder;

    .line 45
    invoke-virtual {p0, p1}, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->deserialize(Lkotlinx/serialization/encoding/Decoder;)Landroidx/navigation3/runtime/NavBackStack;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object v0
.end method

.method public serialize(Lkotlinx/serialization/encoding/Encoder;Landroidx/navigation3/runtime/NavBackStack;)V
    .locals 2
    .param p1, "encoder"    # Lkotlinx/serialization/encoding/Encoder;
    .param p2, "value"    # Landroidx/navigation3/runtime/NavBackStack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/serialization/encoding/Encoder;",
            "Landroidx/navigation3/runtime/NavBackStack<",
            "TT;>;)V"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->delegate:Landroidx/savedstate/compose/serialization/serializers/SnapshotStateListSerializer;

    check-cast v0, Lkotlinx/serialization/SerializationStrategy;

    invoke-virtual {p2}, Landroidx/navigation3/runtime/NavBackStack;->getBase$navigation3_runtime()Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lkotlinx/serialization/encoding/Encoder;->encodeSerializableValue(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    .line 56
    return-void
.end method

.method public bridge synthetic serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .locals 1
    .param p1, "encoder"    # Lkotlinx/serialization/encoding/Encoder;
    .param p2, "value"    # Ljava/lang/Object;

    .line 45
    move-object v0, p2

    check-cast v0, Landroidx/navigation3/runtime/NavBackStack;

    invoke-virtual {p0, p1, v0}, Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;->serialize(Lkotlinx/serialization/encoding/Encoder;Landroidx/navigation3/runtime/NavBackStack;)V

    return-void
.end method
