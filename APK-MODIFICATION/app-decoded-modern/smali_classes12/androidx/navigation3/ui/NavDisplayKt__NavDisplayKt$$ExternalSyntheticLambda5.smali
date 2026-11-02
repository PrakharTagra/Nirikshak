.class public final synthetic Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lkotlin/jvm/functions/Function1;

.field public final synthetic f$1:F

.field public final synthetic f$2:Landroidx/compose/animation/SizeTransform;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$0:Lkotlin/jvm/functions/Function1;

    iput p2, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$1:F

    iput-object p3, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$2:Landroidx/compose/animation/SizeTransform;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$0:Lkotlin/jvm/functions/Function1;

    iget v1, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$1:F

    iget-object v2, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$$ExternalSyntheticLambda5;->f$2:Landroidx/compose/animation/SizeTransform;

    check-cast p1, Landroidx/compose/animation/AnimatedContentTransitionScope;

    invoke-static {v0, v1, v2, p1}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->$r8$lambda$IqxnKnNKGJ3S7yicEwTY5rtZvYw(Lkotlin/jvm/functions/Function1;FLandroidx/compose/animation/SizeTransform;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;

    move-result-object p1

    return-object p1
.end method
