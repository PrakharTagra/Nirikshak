.class public Landroidx/navigation3/runtime/serialization/NavKeySerializer;
.super Ljava/lang/Object;
.source "NavKeySerializer.android.kt"

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
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNavKeySerializer.android.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NavKeySerializer.android.kt\nandroidx/navigation3/runtime/serialization/NavKeySerializer\n+ 2 Decoding.kt\nkotlinx/serialization/encoding/DecodingKt\n+ 3 Encoding.kt\nkotlinx/serialization/encoding/EncodingKt\n+ 4 SerialDescriptors.kt\nkotlinx/serialization/descriptors/SerialDescriptorsKt\n*L\n1#1,98:1\n570#2,4:99\n475#3,4:103\n156#4:107\n*S KotlinDebug\n*F\n+ 1 NavKeySerializer.android.kt\nandroidx/navigation3/runtime/serialization/NavKeySerializer\n*L\n75#1:99,4\n90#1:103,4\n59#1:107\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0017\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\n\u001a\u00028\u00002\u0006\u0010\u000b\u001a\u00020\u000cH\u0016\u00a2\u0006\u0002\u0010\rJ\u001d\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00028\u0000H\u0016\u00a2\u0006\u0002\u0010\u0013R\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u0014"
    }
    d2 = {
        "Landroidx/navigation3/runtime/serialization/NavKeySerializer;",
        "T",
        "Landroidx/navigation3/runtime/NavKey;",
        "Lkotlinx/serialization/KSerializer;",
        "<init>",
        "()V",
        "descriptor",
        "Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "getDescriptor",
        "()Lkotlinx/serialization/descriptors/SerialDescriptor;",
        "deserialize",
        "decoder",
        "Lkotlinx/serialization/encoding/Decoder;",
        "(Lkotlinx/serialization/encoding/Decoder;)Landroidx/navigation3/runtime/NavKey;",
        "serialize",
        "",
        "encoder",
        "Lkotlinx/serialization/encoding/Encoder;",
        "value",
        "(Lkotlinx/serialization/encoding/Encoder;Landroidx/navigation3/runtime/NavKey;)V",
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
.field private final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;


# direct methods
.method public static synthetic $r8$lambda$U9xLw2LLKX_RabAFe71wJ7N5SM4(Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->descriptor$lambda$0(Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    new-array v0, v0, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    new-instance v1, Landroidx/navigation3/runtime/serialization/NavKeySerializer$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Landroidx/navigation3/runtime/serialization/NavKeySerializer$$ExternalSyntheticLambda0;-><init>()V

    const-string v2, "androidx.navigation.runtime.NavKey"

    invoke-static {v2, v0, v1}, Lkotlinx/serialization/descriptors/SerialDescriptorsKt;->buildClassSerialDescriptor(Ljava/lang/String;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;)Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    iput-object v0, p0, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    .line 54
    return-void
.end method

.method private static final descriptor$lambda$0(Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;)Lkotlin/Unit;
    .locals 16
    .param p0, "$this$buildClassSerialDescriptor"    # Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;

    .line 59
    const/4 v0, 0x0

    .line 107
    .local v0, "$i$f$serialDescriptor":I
    sget-object v1, Lkotlinx/serialization/internal/StringSerializer;->INSTANCE:Lkotlinx/serialization/internal/StringSerializer;

    invoke-interface {v1}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v4

    .line 59
    .end local v0    # "$i$f$serialDescriptor":I
    const/16 v7, 0xc

    const/4 v8, 0x0

    const-string/jumbo v3, "type"

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v8}, Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;->element$default(Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;ZILjava/lang/Object;)V

    .line 60
    nop

    .line 61
    nop

    .line 62
    const/4 v0, 0x0

    new-array v0, v0, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    const/4 v1, 0x0

    const/4 v2, 0x4

    const-string v3, "Any"

    invoke-static {v3, v0, v1, v2, v1}, Lkotlinx/serialization/descriptors/SerialDescriptorsKt;->buildClassSerialDescriptor$default(Ljava/lang/String;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v11

    .line 60
    const/16 v14, 0xc

    const/4 v15, 0x0

    const-string/jumbo v10, "value"

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v9, p0

    invoke-static/range {v9 .. v15}, Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;->element$default(Lkotlinx/serialization/descriptors/ClassSerialDescriptorBuilder;Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;ZILjava/lang/Object;)V

    .line 64
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public deserialize(Lkotlinx/serialization/encoding/Decoder;)Landroidx/navigation3/runtime/NavKey;
    .locals 14
    .param p1, "decoder"    # Lkotlinx/serialization/encoding/Decoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/serialization/encoding/Decoder;",
            ")TT;"
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    .local v0, "descriptor$iv":Lkotlinx/serialization/descriptors/SerialDescriptor;
    move-object v1, p1

    .local v1, "$this$decodeStructure$iv":Lkotlinx/serialization/encoding/Decoder;
    const/4 v2, 0x0

    .line 99
    .local v2, "$i$f$decodeStructure":I
    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->beginStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/CompositeDecoder;

    move-result-object v3

    .line 100
    .local v3, "composite$iv":Lkotlinx/serialization/encoding/CompositeDecoder;
    move-object v4, v3

    .local v4, "$this$deserialize_u24lambda_u240":Lkotlinx/serialization/encoding/CompositeDecoder;
    const/4 v11, 0x0

    .line 76
    .local v11, "$i$a$-decodeStructure-NavKeySerializer$deserialize$1":I
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v5

    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v6

    invoke-interface {v4, v6}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeElementIndex(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    invoke-interface {v4, v5, v6}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeStringElement(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    .line 77
    .local v12, "className":Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lkotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v5

    invoke-static {v5}, Lkotlinx/serialization/SerializersKt;->serializer(Lkotlin/reflect/KClass;)Lkotlinx/serialization/KSerializer;

    move-result-object v13

    .line 78
    .local v13, "serializer":Lkotlinx/serialization/KSerializer;
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v5

    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v6

    invoke-interface {v4, v6}, Lkotlinx/serialization/encoding/CompositeDecoder;->decodeElementIndex(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    move-object v7, v13

    check-cast v7, Lkotlinx/serialization/DeserializationStrategy;

    const/16 v9, 0x8

    const/4 v10, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v10}, Lkotlinx/serialization/encoding/CompositeDecoder$DefaultImpls;->decodeSerializableElement$default(Lkotlinx/serialization/encoding/CompositeDecoder;Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string/jumbo v6, "null cannot be cast to non-null type T of androidx.navigation3.runtime.serialization.NavKeySerializer"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v5, Landroidx/navigation3/runtime/NavKey;

    .line 100
    .end local v4    # "$this$deserialize_u24lambda_u240":Lkotlinx/serialization/encoding/CompositeDecoder;
    .end local v11    # "$i$a$-decodeStructure-NavKeySerializer$deserialize$1":I
    .end local v12    # "className":Ljava/lang/String;
    .end local v13    # "serializer":Lkotlinx/serialization/KSerializer;
    nop

    .line 101
    .local v5, "result$iv":Ljava/lang/Object;
    invoke-interface {v3, v0}, Lkotlinx/serialization/encoding/CompositeDecoder;->endStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    .line 102
    nop

    .line 75
    .end local v0    # "descriptor$iv":Lkotlinx/serialization/descriptors/SerialDescriptor;
    .end local v1    # "$this$decodeStructure$iv":Lkotlinx/serialization/encoding/Decoder;
    .end local v2    # "$i$f$decodeStructure":I
    .end local v3    # "composite$iv":Lkotlinx/serialization/encoding/CompositeDecoder;
    .end local v5    # "result$iv":Ljava/lang/Object;
    return-object v5
.end method

.method public bridge synthetic deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .locals 1
    .param p1, "decoder"    # Lkotlinx/serialization/encoding/Decoder;

    .line 54
    invoke-virtual {p0, p1}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->deserialize(Lkotlinx/serialization/encoding/Decoder;)Landroidx/navigation3/runtime/NavKey;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .locals 1

    .line 57
    iget-object v0, p0, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object v0
.end method

.method public serialize(Lkotlinx/serialization/encoding/Encoder;Landroidx/navigation3/runtime/NavKey;)V
    .locals 11
    .param p1, "encoder"    # Lkotlinx/serialization/encoding/Encoder;
    .param p2, "value"    # Landroidx/navigation3/runtime/NavKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/serialization/encoding/Encoder;",
            "TT;)V"
        }
    .end annotation

    .line 90
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    .local v0, "descriptor$iv":Lkotlinx/serialization/descriptors/SerialDescriptor;
    move-object v1, p1

    .local v1, "$this$encodeStructure$iv":Lkotlinx/serialization/encoding/Encoder;
    const/4 v2, 0x0

    .line 103
    .local v2, "$i$f$encodeStructure":I
    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Encoder;->beginStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/encoding/CompositeEncoder;

    move-result-object v3

    .line 104
    .local v3, "composite$iv":Lkotlinx/serialization/encoding/CompositeEncoder;
    move-object v4, v3

    .local v4, "$this$serialize_u24lambda_u240":Lkotlinx/serialization/encoding/CompositeEncoder;
    const/4 v5, 0x0

    .line 91
    .local v5, "$i$a$-encodeStructure-NavKeySerializer$serialize$1":I
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 92
    .local v6, "className":Ljava/lang/String;
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v4, v7, v8, v6}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeStringElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    .line 93
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-static {v7}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v7

    invoke-static {v7}, Lkotlinx/serialization/SerializersKt;->serializer(Lkotlin/reflect/KClass;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    const-string/jumbo v8, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of androidx.navigation3.runtime.serialization.NavKeySerializer>"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .local v7, "serializer":Lkotlinx/serialization/KSerializer;
    invoke-virtual {p0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v8

    const/4 v9, 0x1

    move-object v10, v7

    check-cast v10, Lkotlinx/serialization/SerializationStrategy;

    invoke-interface {v4, v8, v9, v10, p2}, Lkotlinx/serialization/encoding/CompositeEncoder;->encodeSerializableElement(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V

    .line 95
    nop

    .line 104
    .end local v4    # "$this$serialize_u24lambda_u240":Lkotlinx/serialization/encoding/CompositeEncoder;
    .end local v5    # "$i$a$-encodeStructure-NavKeySerializer$serialize$1":I
    .end local v6    # "className":Ljava/lang/String;
    .end local v7    # "serializer":Lkotlinx/serialization/KSerializer;
    nop

    .line 105
    invoke-interface {v3, v0}, Lkotlinx/serialization/encoding/CompositeEncoder;->endStructure(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    .line 106
    nop

    .line 96
    .end local v0    # "descriptor$iv":Lkotlinx/serialization/descriptors/SerialDescriptor;
    .end local v1    # "$this$encodeStructure$iv":Lkotlinx/serialization/encoding/Encoder;
    .end local v2    # "$i$f$encodeStructure":I
    .end local v3    # "composite$iv":Lkotlinx/serialization/encoding/CompositeEncoder;
    return-void
.end method

.method public bridge synthetic serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .locals 1
    .param p1, "encoder"    # Lkotlinx/serialization/encoding/Encoder;
    .param p2, "value"    # Ljava/lang/Object;

    .line 54
    move-object v0, p2

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, p1, v0}, Landroidx/navigation3/runtime/serialization/NavKeySerializer;->serialize(Lkotlinx/serialization/encoding/Encoder;Landroidx/navigation3/runtime/NavKey;)V

    return-void
.end method
