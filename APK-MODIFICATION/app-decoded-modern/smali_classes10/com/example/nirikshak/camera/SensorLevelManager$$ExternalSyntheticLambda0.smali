.class public final synthetic Lcom/example/nirikshak/camera/SensorLevelManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/example/nirikshak/camera/SensorLevelManager$$ExternalSyntheticLambda0;->f$0:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-wide v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager$$ExternalSyntheticLambda0;->f$0:J

    check-cast p1, Lkotlin/Pair;

    invoke-static {v0, v1, p1}, Lcom/example/nirikshak/camera/SensorLevelManager;->$r8$lambda$7LZ69DC7aLenuiHK44CwiVWDqMg(JLkotlin/Pair;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
