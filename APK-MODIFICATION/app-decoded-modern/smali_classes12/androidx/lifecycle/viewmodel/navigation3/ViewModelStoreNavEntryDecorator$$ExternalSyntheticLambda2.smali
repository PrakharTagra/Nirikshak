.class public final synthetic Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:Landroidx/navigation3/runtime/NavEntry;


# direct methods
.method public synthetic constructor <init>(Landroidx/navigation3/runtime/NavEntry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda2;->f$0:Landroidx/navigation3/runtime/NavEntry;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator$$ExternalSyntheticLambda2;->f$0:Landroidx/navigation3/runtime/NavEntry;

    check-cast p1, Landroidx/compose/runtime/Composer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v0, p1, p2}, Landroidx/lifecycle/viewmodel/navigation3/ViewModelStoreNavEntryDecorator;->$r8$lambda$13u-eMW1iH632z1iKFQx72NlgA0(Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
