.class public final Landroidx/camera/core/DynamicRange;
.super Ljava/lang/Object;
.source "DynamicRange.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/DynamicRange$BitDepth;,
        Landroidx/camera/core/DynamicRange$DynamicRangeEncoding;
    }
.end annotation


# static fields
.field public static final BIT_DEPTH_10_BIT:I = 0xa

.field public static final BIT_DEPTH_8_BIT:I = 0x8

.field public static final BIT_DEPTH_UNSPECIFIED:I = 0x0

.field public static final DOLBY_VISION_10_BIT:Landroidx/camera/core/DynamicRange;

.field public static final DOLBY_VISION_8_BIT:Landroidx/camera/core/DynamicRange;

.field public static final ENCODING_DOLBY_VISION:I = 0x6

.field public static final ENCODING_HDR10:I = 0x4

.field public static final ENCODING_HDR10_PLUS:I = 0x5

.field public static final ENCODING_HDR_UNSPECIFIED:I = 0x2

.field public static final ENCODING_HLG:I = 0x3

.field public static final ENCODING_SDR:I = 0x1

.field public static final ENCODING_UNSPECIFIED:I

.field public static final HDR10_10_BIT:Landroidx/camera/core/DynamicRange;

.field public static final HDR10_PLUS_10_BIT:Landroidx/camera/core/DynamicRange;

.field public static final HDR_UNSPECIFIED_10_BIT:Landroidx/camera/core/DynamicRange;

.field public static final HLG_10_BIT:Landroidx/camera/core/DynamicRange;

.field public static final SDR:Landroidx/camera/core/DynamicRange;

.field public static final UNSPECIFIED:Landroidx/camera/core/DynamicRange;


# instance fields
.field private final mBitDepth:I

.field private final mEncoding:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 113
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    .line 126
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x1

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    .line 142
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x2

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->HDR_UNSPECIFIED_10_BIT:Landroidx/camera/core/DynamicRange;

    .line 155
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x3

    invoke-direct {v0, v1, v3}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->HLG_10_BIT:Landroidx/camera/core/DynamicRange;

    .line 167
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x4

    invoke-direct {v0, v1, v3}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->HDR10_10_BIT:Landroidx/camera/core/DynamicRange;

    .line 180
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x5

    invoke-direct {v0, v1, v3}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->HDR10_PLUS_10_BIT:Landroidx/camera/core/DynamicRange;

    .line 193
    new-instance v0, Landroidx/camera/core/DynamicRange;

    const/4 v1, 0x6

    invoke-direct {v0, v1, v3}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->DOLBY_VISION_10_BIT:Landroidx/camera/core/DynamicRange;

    .line 206
    new-instance v0, Landroidx/camera/core/DynamicRange;

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/DynamicRange;-><init>(II)V

    sput-object v0, Landroidx/camera/core/DynamicRange;->DOLBY_VISION_8_BIT:Landroidx/camera/core/DynamicRange;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "encoding"    # I
    .param p2, "bitDepth"    # I

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput p1, p0, Landroidx/camera/core/DynamicRange;->mEncoding:I

    .line 226
    iput p2, p0, Landroidx/camera/core/DynamicRange;->mBitDepth:I

    .line 227
    return-void
.end method

.method private static getEncodingLabel(I)Ljava/lang/String;
    .locals 1
    .param p0, "encoding"    # I

    .line 311
    packed-switch p0, :pswitch_data_0

    .line 321
    const-string v0, "<Unknown>"

    return-object v0

    .line 318
    :pswitch_0
    const-string v0, "DOLBY_VISION"

    return-object v0

    .line 317
    :pswitch_1
    const-string v0, "HDR10_PLUS"

    return-object v0

    .line 316
    :pswitch_2
    const-string v0, "HDR10"

    return-object v0

    .line 315
    :pswitch_3
    const-string v0, "HLG"

    return-object v0

    .line 314
    :pswitch_4
    const-string v0, "HDR_UNSPECIFIED"

    return-object v0

    .line 313
    :pswitch_5
    const-string v0, "SDR"

    return-object v0

    .line 312
    :pswitch_6
    const-string v0, "UNSPECIFIED"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 288
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 289
    return v0

    .line 291
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/DynamicRange;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 292
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 293
    .local v1, "that":Landroidx/camera/core/DynamicRange;
    iget v3, p0, Landroidx/camera/core/DynamicRange;->mEncoding:I

    invoke-virtual {v1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/DynamicRange;->mBitDepth:I

    .line 294
    invoke-virtual {v1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 293
    :goto_0
    return v0

    .line 296
    .end local v1    # "that":Landroidx/camera/core/DynamicRange;
    :cond_2
    return v2
.end method

.method public getBitDepth()I
    .locals 1

    .line 252
    iget v0, p0, Landroidx/camera/core/DynamicRange;->mBitDepth:I

    return v0
.end method

.method public getEncoding()I
    .locals 1

    .line 238
    iget v0, p0, Landroidx/camera/core/DynamicRange;->mEncoding:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 301
    const/4 v0, 0x1

    .line 302
    .local v0, "hashCode":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 303
    iget v2, p0, Landroidx/camera/core/DynamicRange;->mEncoding:I

    xor-int/2addr v0, v2

    .line 304
    mul-int/2addr v0, v1

    .line 305
    iget v1, p0, Landroidx/camera/core/DynamicRange;->mBitDepth:I

    xor-int/2addr v0, v1

    .line 306
    return v0
.end method

.method public is10BitHdr()Z
    .locals 3

    .line 273
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 274
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    const/16 v2, 0xa

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 273
    :goto_0
    return v1
.end method

.method public isFullySpecified()Z
    .locals 2

    .line 260
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 262
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 260
    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DynamicRange@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "{encoding="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/DynamicRange;->mEncoding:I

    .line 281
    invoke-static {v1}, Landroidx/camera/core/DynamicRange;->getEncodingLabel(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitDepth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/DynamicRange;->mBitDepth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 280
    return-object v0
.end method
