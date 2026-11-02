.class public Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;
.super Ljava/lang/Object;
.source "InvalidJpegDataParser.java"


# instance fields
.field private final mQuirk:Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-class v0, Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    iput-object v0, p0, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->mQuirk:Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    return-void
.end method

.method public static getJfifEoiMarkEndPosition([B)I
    .locals 5
    .param p0, "bytes"    # [B

    .line 55
    const/4 v0, 0x2

    .line 58
    .local v0, "markPosition":I
    :goto_0
    add-int/lit8 v1, v0, 0x4

    array-length v2, p0

    const/4 v3, -0x1

    if-gt v1, v2, :cond_4

    aget-byte v1, p0, v0

    if-eq v1, v3, :cond_0

    goto :goto_2

    .line 62
    :cond_0
    add-int/lit8 v1, v0, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, v0, 0x3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 66
    .local v1, "segmentLength":I
    aget-byte v2, p0, v0

    if-ne v2, v3, :cond_3

    add-int/lit8 v2, v0, 0x1

    aget-byte v2, p0, v2

    const/16 v4, -0x26

    if-ne v2, v4, :cond_3

    .line 67
    nop

    .line 73
    .end local v1    # "segmentLength":I
    add-int/lit8 v1, v0, 0x2

    .line 77
    .local v1, "eoiPosition":I
    :goto_1
    add-int/lit8 v2, v1, 0x2

    array-length v4, p0

    if-le v2, v4, :cond_1

    .line 78
    return v3

    .line 81
    :cond_1
    aget-byte v2, p0, v1

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, v1, 0x1

    aget-byte v2, p0, v2

    const/16 v4, -0x27

    if-ne v2, v4, :cond_2

    .line 82
    nop

    .line 87
    add-int/lit8 v2, v1, 0x2

    return v2

    .line 84
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 69
    .local v1, "segmentLength":I
    :cond_3
    add-int/lit8 v2, v1, 0x2

    add-int/2addr v0, v2

    .line 70
    .end local v1    # "segmentLength":I
    goto :goto_0

    .line 59
    :cond_4
    :goto_2
    return v3
.end method


# virtual methods
.method public getValidDataLength([B)I
    .locals 2
    .param p1, "bytes"    # [B

    .line 39
    iget-object v0, p0, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->mQuirk:Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->mQuirk:Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;

    invoke-virtual {v0, p1}, Landroidx/camera/core/internal/compat/quirk/LargeJpegImageQuirk;->shouldCheckInvalidJpegData([B)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 43
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->getJfifEoiMarkEndPosition([B)I

    move-result v0

    .line 45
    .local v0, "jfifEoiMarkEndPosition":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    move v1, v0

    goto :goto_0

    :cond_1
    array-length v1, p1

    :goto_0
    return v1

    .line 40
    .end local v0    # "jfifEoiMarkEndPosition":I
    :cond_2
    :goto_1
    array-length v0, p1

    return v0
.end method
