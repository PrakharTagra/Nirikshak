.class public final synthetic Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:Landroidx/lifecycle/ViewModelStore;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/ViewModelStore;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda1;->f$0:Landroidx/lifecycle/ViewModelStore;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda1;->f$0:Landroidx/lifecycle/ViewModelStore;

    check-cast p1, Landroidx/navigation3/runtime/NavEntry;

    check-cast p2, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-static {v0, p1, p2, p3}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;->$r8$lambda$AMaWoWRX9_BOzRHEr1hLxyIehRY(Landroidx/lifecycle/ViewModelStore;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
