.class public final Landroidx/navigation3/runtime/NavBackStack;
.super Ljava/lang/Object;
.source "NavBackStack.kt"

# interfaces
.implements Ljava/util/List;
.implements Landroidx/compose/runtime/snapshots/StateObject;
.implements Ljava/util/RandomAccess;
.implements Lkotlin/jvm/internal/markers/KMutableList;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/navigation3/runtime/NavBackStack$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroidx/navigation3/runtime/NavKey;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/List<",
        "TT;>;",
        "Landroidx/compose/runtime/snapshots/StateObject;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/jvm/internal/markers/KMutableList;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0011\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u001e\n\u0002\u0008\t\n\u0002\u0010)\n\u0002\u0008\u0002\n\u0002\u0010+\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0014\u0008\u0007\u0018\u0000 <*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u00032\u00020\u00042\u00060\u0005j\u0002`\u0006:\u0001<B\u0015\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0008\u00a2\u0006\u0004\u0008\t\u0010\nB\t\u0008\u0016\u00a2\u0006\u0004\u0008\t\u0010\u000bB\u001d\u0008\u0016\u0012\u0012\u0010\u000c\u001a\n\u0012\u0006\u0008\u0001\u0012\u00028\u00000\r\"\u00028\u0000\u00a2\u0006\u0004\u0008\t\u0010\u000eJ\u0016\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0001\u00a2\u0006\u0002\u0010\u0014J\u001e\u0010\u0011\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0001\u00a2\u0006\u0002\u0010\u0018J\u0017\u0010\u0019\u001a\u00020\u00122\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0001J\u001f\u0010\u0019\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u00172\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0001J\t\u0010\u001b\u001a\u00020\u0015H\u0096\u0001J\u0016\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0003\u00a2\u0006\u0002\u0010\u0014J\u0017\u0010\u001d\u001a\u00020\u00122\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0001J\u0016\u0010\u001e\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00020\u0017H\u0096\u0003\u00a2\u0006\u0002\u0010\u001fJ\u0016\u0010 \u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0001\u00a2\u0006\u0002\u0010!J\t\u0010\"\u001a\u00020\u0012H\u0096\u0001J\u000f\u0010#\u001a\u0008\u0012\u0004\u0012\u00028\u00000$H\u0096\u0003J\u0016\u0010%\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0001\u00a2\u0006\u0002\u0010!J\u000f\u0010&\u001a\u0008\u0012\u0004\u0012\u00028\u00000\'H\u0096\u0001J\u0017\u0010&\u001a\u0008\u0012\u0004\u0012\u00028\u00000\'2\u0006\u0010\u0016\u001a\u00020\u0017H\u0096\u0001J#\u0010(\u001a\u0004\u0018\u00010)2\u0006\u0010*\u001a\u00020)2\u0006\u0010+\u001a\u00020)2\u0006\u0010,\u001a\u00020)H\u0096\u0001J\u0011\u0010-\u001a\u00020\u00152\u0006\u0010.\u001a\u00020)H\u0096\u0001J\u0016\u0010/\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0001\u00a2\u0006\u0002\u0010\u0014J\u0017\u00100\u001a\u00020\u00122\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0001J\u0016\u00101\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00020\u0017H\u0096\u0001\u00a2\u0006\u0002\u0010\u001fJ\u0017\u00102\u001a\u00020\u00122\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u001aH\u0096\u0001J\u001e\u00103\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0003\u00a2\u0006\u0002\u00104J\u001f\u00105\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00032\u0006\u00106\u001a\u00020\u00172\u0006\u00107\u001a\u00020\u0017H\u0096\u0001R\u001a\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0012\u00108\u001a\u00020)X\u0096\u0005\u00a2\u0006\u0006\u001a\u0004\u00089\u0010:R\t\u0010;\u001a\u00020\u0017X\u0096\u0005\u00a8\u0006="
    }
    d2 = {
        "Landroidx/navigation3/runtime/NavBackStack;",
        "T",
        "Landroidx/navigation3/runtime/NavKey;",
        "",
        "Landroidx/compose/runtime/snapshots/StateObject;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "base",
        "Landroidx/compose/runtime/snapshots/SnapshotStateList;",
        "<init>",
        "(Landroidx/compose/runtime/snapshots/SnapshotStateList;)V",
        "()V",
        "elements",
        "",
        "([Landroidx/navigation3/runtime/NavKey;)V",
        "getBase$navigation3_runtime",
        "()Landroidx/compose/runtime/snapshots/SnapshotStateList;",
        "add",
        "",
        "element",
        "(Landroidx/navigation3/runtime/NavKey;)Z",
        "",
        "index",
        "",
        "(ILandroidx/navigation3/runtime/NavKey;)V",
        "addAll",
        "",
        "clear",
        "contains",
        "containsAll",
        "get",
        "(I)Landroidx/navigation3/runtime/NavKey;",
        "indexOf",
        "(Landroidx/navigation3/runtime/NavKey;)I",
        "isEmpty",
        "iterator",
        "",
        "lastIndexOf",
        "listIterator",
        "",
        "mergeRecords",
        "Landroidx/compose/runtime/snapshots/StateRecord;",
        "previous",
        "current",
        "applied",
        "prependStateRecord",
        "value",
        "remove",
        "removeAll",
        "removeAt",
        "retainAll",
        "set",
        "(ILandroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavKey;",
        "subList",
        "fromIndex",
        "toIndex",
        "firstStateRecord",
        "getFirstStateRecord",
        "()Landroidx/compose/runtime/snapshots/StateRecord;",
        "size",
        "Companion",
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

.annotation runtime Lkotlinx/serialization/Serializable;
    with = Landroidx/navigation3/runtime/serialization/NavBackStackSerializer;
.end annotation


# static fields
.field public static final $stable:I

.field public static final Companion:Landroidx/navigation3/runtime/NavBackStack$Companion;


# instance fields
.field private final base:Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/navigation3/runtime/NavBackStack$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/navigation3/runtime/NavBackStack$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/navigation3/runtime/NavBackStack;->Companion:Landroidx/navigation3/runtime/NavBackStack$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-static {}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateListOf()Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;-><init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;)V

    return-void
.end method

.method public constructor <init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;)V
    .locals 0
    .param p1, "base"    # Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "TT;>;)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    return-void
.end method

.method public varargs constructor <init>([Landroidx/navigation3/runtime/NavKey;)V
    .locals 1
    .param p1, "elements"    # [Landroidx/navigation3/runtime/NavKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .line 54
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateListOf([Ljava/lang/Object;)Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;-><init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;)V

    return-void
.end method


# virtual methods
.method public add(ILandroidx/navigation3/runtime/NavKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .line 48
    move-object v0, p2

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, p1, v0}, Landroidx/navigation3/runtime/NavBackStack;->add(ILandroidx/navigation3/runtime/NavKey;)V

    return-void
.end method

.method public add(Landroidx/navigation3/runtime/NavKey;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 48
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;->add(Landroidx/navigation3/runtime/NavKey;)Z

    move-result v0

    return v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+TT;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TT;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->clear()V

    return-void
.end method

.method public contains(Landroidx/navigation3/runtime/NavKey;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 48
    instance-of v0, p1, Landroidx/navigation3/runtime/NavKey;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;->contains(Landroidx/navigation3/runtime/NavKey;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public get(I)Landroidx/navigation3/runtime/NavKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 48
    invoke-virtual {p0, p1}, Landroidx/navigation3/runtime/NavBackStack;->get(I)Landroidx/navigation3/runtime/NavKey;

    move-result-object v0

    return-object v0
.end method

.method public final getBase$navigation3_runtime()Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "TT;>;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    return-object v0
.end method

.method public getFirstStateRecord()Landroidx/compose/runtime/snapshots/StateRecord;
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->getFirstStateRecord()Landroidx/compose/runtime/snapshots/StateRecord;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->size()I

    move-result v0

    return v0
.end method

.method public indexOf(Landroidx/navigation3/runtime/NavKey;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 48
    instance-of v0, p1, Landroidx/navigation3/runtime/NavKey;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;->indexOf(Landroidx/navigation3/runtime/NavKey;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Landroidx/navigation3/runtime/NavKey;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 48
    instance-of v0, p1, Landroidx/navigation3/runtime/NavKey;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;->lastIndexOf(Landroidx/navigation3/runtime/NavKey;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public mergeRecords(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateRecord;)Landroidx/compose/runtime/snapshots/StateRecord;
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->mergeRecords(Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateRecord;Landroidx/compose/runtime/snapshots/StateRecord;)Landroidx/compose/runtime/snapshots/StateRecord;

    move-result-object v0

    return-object v0
.end method

.method public prependStateRecord(Landroidx/compose/runtime/snapshots/StateRecord;)V
    .locals 1

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->prependStateRecord(Landroidx/compose/runtime/snapshots/StateRecord;)V

    return-void
.end method

.method public final bridge remove(I)Landroidx/navigation3/runtime/NavKey;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 48
    invoke-virtual {p0, p1}, Landroidx/navigation3/runtime/NavBackStack;->removeAt(I)Landroidx/navigation3/runtime/NavKey;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 48
    invoke-virtual {p0, p1}, Landroidx/navigation3/runtime/NavBackStack;->remove(I)Landroidx/navigation3/runtime/NavKey;

    move-result-object v0

    return-object v0
.end method

.method public remove(Landroidx/navigation3/runtime/NavKey;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final bridge remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 48
    instance-of v0, p1, Landroidx/navigation3/runtime/NavKey;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, v0}, Landroidx/navigation3/runtime/NavBackStack;->remove(Landroidx/navigation3/runtime/NavKey;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public removeAt(I)Landroidx/navigation3/runtime/NavKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    return-object v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public set(ILandroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .line 48
    move-object v0, p2

    check-cast v0, Landroidx/navigation3/runtime/NavKey;

    invoke-virtual {p0, p1, v0}, Landroidx/navigation3/runtime/NavBackStack;->set(ILandroidx/navigation3/runtime/NavKey;)Landroidx/navigation3/runtime/NavKey;

    move-result-object v0

    return-object v0
.end method

.method public final bridge size()I
    .locals 1

    .line 48
    invoke-virtual {p0}, Landroidx/navigation3/runtime/NavBackStack;->getSize()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/navigation3/runtime/NavBackStack;->base:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v0, p1, p2}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-static {v0}, Lkotlin/jvm/internal/CollectionToArray;->toArray(Ljava/util/Collection;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/CollectionToArray;->toArray(Ljava/util/Collection;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
