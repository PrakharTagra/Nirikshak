.class public final synthetic Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/saveable/SaveableStateHolder;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda1;->f$0:Landroidx/compose/runtime/saveable/SaveableStateHolder;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator$$ExternalSyntheticLambda1;->f$0:Landroidx/compose/runtime/saveable/SaveableStateHolder;

    check-cast p1, Landroidx/navigation3/runtime/NavEntry;

    check-cast p2, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-static {v0, p1, p2, p3}, Landroidx/navigation3/runtime/SaveableStateHolderNavEntryDecorator;->$r8$lambda$t4eKAgy2A-Z1Twj-AWPTEIV4lzM(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/navigation3/runtime/NavEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
