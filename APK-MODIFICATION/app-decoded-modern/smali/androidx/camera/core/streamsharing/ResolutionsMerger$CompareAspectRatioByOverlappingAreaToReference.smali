.class Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;
.super Ljava/lang/Object;
.source "ResolutionsMerger.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/streamsharing/ResolutionsMerger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CompareAspectRatioByOverlappingAreaToReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/util/Rational;",
        ">;"
    }
.end annotation


# instance fields
.field private final mReferenceAspectRatio:Landroid/util/Rational;

.field private final mReverse:Z


# direct methods
.method constructor <init>(Landroid/util/Rational;Z)V
    .locals 0
    .param p1, "referenceAspectRatio"    # Landroid/util/Rational;
    .param p2, "reverse"    # Z

    .line 864
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 865
    iput-object p1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->mReferenceAspectRatio:Landroid/util/Rational;

    .line 866
    iput-boolean p2, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->mReverse:Z

    .line 867
    return-void
.end method


# virtual methods
.method public compare(Landroid/util/Rational;Landroid/util/Rational;)I
    .locals 3
    .param p1, "lhs"    # Landroid/util/Rational;
    .param p2, "rhs"    # Landroid/util/Rational;

    .line 871
    iget-object v0, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->mReferenceAspectRatio:Landroid/util/Rational;

    invoke-static {p1, v0}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->access$000(Landroid/util/Rational;Landroid/util/Rational;)F

    move-result v0

    .line 872
    .local v0, "lhsOverlapping":F
    iget-object v1, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->mReferenceAspectRatio:Landroid/util/Rational;

    invoke-static {p2, v1}, Landroidx/camera/core/streamsharing/ResolutionsMerger;->access$000(Landroid/util/Rational;Landroid/util/Rational;)F

    move-result v1

    .line 874
    .local v1, "rhsOverlapping":F
    iget-boolean v2, p0, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->mReverse:Z

    if-eqz v2, :cond_0

    .line 875
    invoke-static {v1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    return v2

    .line 877
    :cond_0
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 856
    check-cast p1, Landroid/util/Rational;

    check-cast p2, Landroid/util/Rational;

    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/streamsharing/ResolutionsMerger$CompareAspectRatioByOverlappingAreaToReference;->compare(Landroid/util/Rational;Landroid/util/Rational;)I

    move-result p1

    return p1
.end method
