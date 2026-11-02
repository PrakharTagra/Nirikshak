.class public final Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;
.super Ljava/lang/Object;
.source "Comparisons.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1\n+ 2 NavDisplay.kt\nandroidx/navigation3/ui/NavDisplayKt__NavDisplayKt\n*L\n1#1,121:1\n428#2:122\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u00022\u000e\u0010\u0003\u001a\n \u0004*\u0004\u0018\u0001H\u0002H\u00022\u000e\u0010\u0005\u001a\n \u0004*\u0004\u0018\u0001H\u0002H\u0002H\n\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "a",
        "kotlin.jvm.PlatformType",
        "b",
        "compare",
        "(Ljava/lang/Object;Ljava/lang/Object;)I",
        "kotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $zIndices$inlined:Landroidx/collection/MutableObjectFloatMap;


# direct methods
.method public constructor <init>(Landroidx/collection/MutableObjectFloatMap;)V
    .locals 0

    iput-object p1, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;->$zIndices$inlined:Landroidx/collection/MutableObjectFloatMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .param p1, "a"    # Ljava/lang/Object;
    .param p2, "b"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 121
    move-object v0, p2

    check-cast v0, Ljava/util/Map$Entry;

    .local v0, "it":Ljava/util/Map$Entry;
    const/4 v1, 0x0

    .line 122
    .local v1, "$i$a$-sortedByDescending-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$1":I
    iget-object v2, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;->$zIndices$inlined:Landroidx/collection/MutableObjectFloatMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/collection/MutableObjectFloatMap;->get(Ljava/lang/Object;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 121
    .end local v0    # "it":Ljava/util/Map$Entry;
    .end local v1    # "$i$a$-sortedByDescending-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$1":I
    check-cast v0, Ljava/lang/Comparable;

    move-object v1, p1

    check-cast v1, Ljava/util/Map$Entry;

    .local v1, "it":Ljava/util/Map$Entry;
    const/4 v2, 0x0

    .line 122
    .local v2, "$i$a$-sortedByDescending-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$1":I
    iget-object v3, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$lambda$14$0$$inlined$sortedByDescending$1;->$zIndices$inlined:Landroidx/collection/MutableObjectFloatMap;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/collection/MutableObjectFloatMap;->get(Ljava/lang/Object;)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 121
    .end local v1    # "it":Ljava/util/Map$Entry;
    .end local v2    # "$i$a$-sortedByDescending-NavDisplayKt__NavDisplayKt$NavDisplay$sceneToExcludedEntryMap$1$1$1":I
    check-cast v1, Ljava/lang/Comparable;

    invoke-static {v0, v1}, Lkotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v0

    return v0
.end method
