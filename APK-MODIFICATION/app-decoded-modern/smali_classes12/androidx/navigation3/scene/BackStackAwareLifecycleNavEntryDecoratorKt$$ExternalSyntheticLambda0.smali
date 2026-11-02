.class public final synthetic Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroidx/navigation3/runtime/NavEntry;


# direct methods
.method public synthetic constructor <init>(Landroidx/navigation3/runtime/NavEntry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda0;->f$0:Landroidx/navigation3/runtime/NavEntry;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt$$ExternalSyntheticLambda0;->f$0:Landroidx/navigation3/runtime/NavEntry;

    check-cast p1, Landroidx/navigation3/runtime/NavEntry;

    invoke-static {v0, p1}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->$r8$lambda$8HEtEGU_Sn5Nq8OaIG_TmqfMcL4(Landroidx/navigation3/runtime/NavEntry;Landroidx/navigation3/runtime/NavEntry;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
