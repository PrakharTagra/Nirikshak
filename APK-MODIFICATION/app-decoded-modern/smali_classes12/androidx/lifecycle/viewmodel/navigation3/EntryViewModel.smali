.class final Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "ViewModelStoreNavEntryDecorator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nViewModelStoreNavEntryDecorator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/EntryViewModel\n+ 2 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 3 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,173:1\n381#2,7:174\n216#3,2:181\n*S KotlinDebug\n*F\n+ 1 ViewModelStoreNavEntryDecorator.kt\nandroidx/lifecycle/viewmodel/navigation3/EntryViewModel\n*L\n142#1:174,7\n149#1:181,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0006J\u000e\u0010\n\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\u0006J\u0008\u0010\u000c\u001a\u00020\u000bH\u0014R\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00070\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;",
        "Landroidx/lifecycle/ViewModel;",
        "<init>",
        "()V",
        "owners",
        "",
        "",
        "Landroidx/lifecycle/ViewModelStore;",
        "viewModelStoreForKey",
        "key",
        "clearViewModelStoreOwnerForKey",
        "",
        "onCleared",
        "lifecycle-viewmodel-navigation3"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final owners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Landroidx/lifecycle/ViewModelStore;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 139
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 140
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->owners:Ljava/util/Map;

    .line 139
    return-void
.end method


# virtual methods
.method public final clearViewModelStoreOwnerForKey(Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 145
    iget-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->owners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/ViewModelStore;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/lifecycle/ViewModelStore;->clear()V

    .line 146
    :cond_0
    return-void
.end method

.method protected onCleared()V
    .locals 6

    .line 149
    iget-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->owners:Ljava/util/Map;

    .local v0, "$this$forEach$iv":Ljava/util/Map;
    const/4 v1, 0x0

    .line 181
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .local v3, "element$iv":Ljava/util/Map$Entry;
    const/4 v4, 0x0

    .local v4, "$i$a$-forEach-EntryViewModel$onCleared$1":I
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/lifecycle/ViewModelStore;

    .line 149
    .local v5, "store":Landroidx/lifecycle/ViewModelStore;
    invoke-virtual {v5}, Landroidx/lifecycle/ViewModelStore;->clear()V

    .line 181
    .end local v4    # "$i$a$-forEach-EntryViewModel$onCleared$1":I
    .end local v5    # "store":Landroidx/lifecycle/ViewModelStore;
    nop

    .end local v3    # "element$iv":Ljava/util/Map$Entry;
    goto :goto_0

    .line 182
    :cond_0
    nop

    .line 150
    .end local v0    # "$this$forEach$iv":Ljava/util/Map;
    .end local v1    # "$i$f$forEach":I
    return-void
.end method

.method public final viewModelStoreForKey(Ljava/lang/Object;)Landroidx/lifecycle/ViewModelStore;
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;

    .line 142
    iget-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/EntryViewModel;->owners:Ljava/util/Map;

    .local v0, "$this$getOrPut$iv":Ljava/util/Map;
    move-object v1, p1

    .local v1, "key$iv":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 174
    .local v2, "$i$f$getOrPut":I
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 175
    .local v3, "value$iv":Ljava/lang/Object;
    if-nez v3, :cond_0

    .line 176
    const/4 v4, 0x0

    .line 142
    .local v4, "$i$a$-getOrPut-EntryViewModel$viewModelStoreForKey$1":I
    new-instance v5, Landroidx/lifecycle/ViewModelStore;

    invoke-direct {v5}, Landroidx/lifecycle/ViewModelStore;-><init>()V

    .line 176
    .end local v4    # "$i$a$-getOrPut-EntryViewModel$viewModelStoreForKey$1":I
    nop

    .line 177
    .local v5, "answer$iv":Ljava/lang/Object;
    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    nop

    .end local v5    # "answer$iv":Ljava/lang/Object;
    goto :goto_0

    .line 180
    :cond_0
    move-object v5, v3

    .line 175
    :goto_0
    nop

    .end local v0    # "$this$getOrPut$iv":Ljava/util/Map;
    .end local v1    # "key$iv":Ljava/lang/Object;
    .end local v2    # "$i$f$getOrPut":I
    .end local v3    # "value$iv":Ljava/lang/Object;
    check-cast v5, Landroidx/lifecycle/ViewModelStore;

    .line 142
    return-object v5
.end method
