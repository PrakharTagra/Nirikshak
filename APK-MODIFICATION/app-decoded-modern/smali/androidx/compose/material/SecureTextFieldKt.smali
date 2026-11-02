.class public final Landroidx/compose/material/SecureTextFieldKt;
.super Ljava/lang/Object;
.source "SecureTextField.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSecureTextField.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SecureTextField.kt\nandroidx/compose/material/SecureTextFieldKt\n+ 2 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 Color.kt\nandroidx/compose/ui/graphics/ColorKt\n+ 5 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,309:1\n75#2:310\n75#2:319\n75#2:328\n1128#3,6:311\n1128#3,6:320\n1128#3,6:329\n646#4:317\n635#4:318\n646#4:326\n635#4:327\n1#5:335\n*S KotlinDebug\n*F\n+ 1 SecureTextField.kt\nandroidx/compose/material/SecureTextFieldKt\n*L\n108#1:310\n230#1:319\n251#1:328\n124#1:311,6\n246#1:320,6\n262#1:329,6\n126#1:317\n126#1:318\n248#1:326\n248#1:327\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000c\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u001a\u00f1\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u0015\u0008\u0002\u0010\n\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\r\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\u000e\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\u000f\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00072\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00122\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u00142\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u00162\u0008\u0008\u0002\u0010\u0017\u001a\u00020\u00182\n\u0008\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u001c2\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u001e2\n\u0008\u0002\u0010\u001f\u001a\u0004\u0018\u00010 H\u0007\u00a2\u0006\u0004\u0008!\u0010\"\u001a\u00f1\u0001\u0010#\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t2\u0015\u0008\u0002\u0010\n\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\r\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\u000e\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0015\u0008\u0002\u0010\u000f\u001a\u000f\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b\u00a2\u0006\u0002\u0008\u000c2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00072\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00122\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u00142\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u00162\u0008\u0008\u0002\u0010\u0017\u001a\u00020\u00182\n\u0008\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u001c2\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u001e2\n\u0008\u0002\u0010\u001f\u001a\u0004\u0018\u00010 H\u0007\u00a2\u0006\u0004\u0008$\u0010\"\"\u000e\u0010%\u001a\u00020\u0018X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010&\u001a\u00020\u0016X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "SecureTextField",
        "",
        "state",
        "Landroidx/compose/foundation/text/input/TextFieldState;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "enabled",
        "",
        "textStyle",
        "Landroidx/compose/ui/text/TextStyle;",
        "label",
        "Lkotlin/Function0;",
        "Landroidx/compose/runtime/Composable;",
        "placeholder",
        "leadingIcon",
        "trailingIcon",
        "isError",
        "inputTransformation",
        "Landroidx/compose/foundation/text/input/InputTransformation;",
        "textObfuscationMode",
        "Landroidx/compose/foundation/text/input/TextObfuscationMode;",
        "textObfuscationCharacter",
        "",
        "keyboardOptions",
        "Landroidx/compose/foundation/text/KeyboardOptions;",
        "onKeyboardAction",
        "Landroidx/compose/foundation/text/input/KeyboardActionHandler;",
        "shape",
        "Landroidx/compose/ui/graphics/Shape;",
        "colors",
        "Landroidx/compose/material/TextFieldColors;",
        "interactionSource",
        "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
        "SecureTextField-0vce7ms",
        "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;III)V",
        "OutlinedSecureTextField",
        "OutlinedSecureTextField-0vce7ms",
        "SecureTextFieldKeyboardOptions",
        "DefaultObfuscationCharacter",
        "material"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DefaultObfuscationCharacter:C = '\u2022'

.field private static final SecureTextFieldKeyboardOptions:Landroidx/compose/foundation/text/KeyboardOptions;


# direct methods
.method public static synthetic $r8$lambda$1gBMfqHNkxrC23R4HsguqROGXw0(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p21}, Landroidx/compose/material/SecureTextFieldKt;->OutlinedSecureTextField_0vce7ms$lambda$4(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$lRJzCIw7NelpTAsWRDrT50ef40c(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Landroidx/compose/material/SecureTextFieldKt;->OutlinedSecureTextField_0vce7ms$lambda$2$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$yfpDm_1m-DOp22km8ae2WmzUbzw(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p21}, Landroidx/compose/material/SecureTextFieldKt;->SecureTextField_0vce7ms$lambda$2(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 10

    .line 306
    new-instance v0, Landroidx/compose/foundation/text/KeyboardOptions;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    sget-object v1, Landroidx/compose/ui/text/input/KeyboardType;->Companion:Landroidx/compose/ui/text/input/KeyboardType$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/text/input/KeyboardType$Companion;->getPassword-PjHm6EE()I

    move-result v3

    const/16 v8, 0x79

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v9}, Landroidx/compose/foundation/text/KeyboardOptions;-><init>(ILjava/lang/Boolean;IILandroidx/compose/ui/text/input/PlatformImeOptions;Ljava/lang/Boolean;Landroidx/compose/ui/text/intl/LocaleList;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/compose/material/SecureTextFieldKt;->SecureTextFieldKeyboardOptions:Landroidx/compose/foundation/text/KeyboardOptions;

    return-void
.end method

.method public static final OutlinedSecureTextField-0vce7ms(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;III)V
    .locals 99
    .param p0, "state"    # Landroidx/compose/foundation/text/input/TextFieldState;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "enabled"    # Z
    .param p3, "textStyle"    # Landroidx/compose/ui/text/TextStyle;
    .param p4, "label"    # Lkotlin/jvm/functions/Function2;
    .param p5, "placeholder"    # Lkotlin/jvm/functions/Function2;
    .param p6, "leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p7, "trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p8, "isError"    # Z
    .param p9, "inputTransformation"    # Landroidx/compose/foundation/text/input/InputTransformation;
    .param p10, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0"    # I
    .param p11, "textObfuscationCharacter"    # C
    .param p12, "keyboardOptions"    # Landroidx/compose/foundation/text/KeyboardOptions;
    .param p13, "onKeyboardAction"    # Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .param p14, "shape"    # Landroidx/compose/ui/graphics/Shape;
    .param p15, "colors"    # Landroidx/compose/material/TextFieldColors;
    .param p16, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p17, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p18, "$changed"    # I
    .param p19, "$changed1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/foundation/text/input/TextFieldState;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/ui/text/TextStyle;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;Z",
            "Landroidx/compose/foundation/text/input/InputTransformation;",
            "IC",
            "Landroidx/compose/foundation/text/KeyboardOptions;",
            "Landroidx/compose/foundation/text/input/KeyboardActionHandler;",
            "Landroidx/compose/ui/graphics/Shape;",
            "Landroidx/compose/material/TextFieldColors;",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/runtime/Composer;",
            "III)V"
        }
    .end annotation

    .line 244
    move/from16 v0, p18

    move/from16 v1, p19

    move/from16 v2, p20

    const v3, -0x6ea0e2d4

    move-object/from16 v4, p17

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v3

    .end local p17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(OutlinedSecureTextField)N(state,modifier,enabled,textStyle,label,placeholder,leadingIcon,trailingIcon,isError,inputTransformation,textObfuscationMode:c#foundation.text.input.TextObfuscationMode,textObfuscationCharacter,keyboardOptions,onKeyboardAction,shape,colors,interactionSource)250@14549L7,267@15231L38,274@15547L20,252@14562L2138:SecureTextField.kt#jmzs0o"

    invoke-static {v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p18

    .local v4, "$dirty":I
    move/from16 v5, p19

    .local v5, "$dirty1":I
    and-int/lit8 v6, v0, 0x6

    if-nez v6, :cond_1

    move-object/from16 v6, p0

    invoke-interface {v3, v6}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v9, 0x4

    goto :goto_0

    :cond_0
    const/4 v9, 0x2

    :goto_0
    or-int/2addr v4, v9

    goto :goto_1

    :cond_1
    move-object/from16 v6, p0

    :goto_1
    and-int/lit8 v9, v2, 0x2

    if-eqz v9, :cond_2

    or-int/lit8 v4, v4, 0x30

    move-object/from16 v12, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v12, v0, 0x30

    if-nez v12, :cond_4

    move-object/from16 v12, p1

    invoke-interface {v3, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    const/16 v13, 0x20

    goto :goto_2

    :cond_3
    const/16 v13, 0x10

    :goto_2
    or-int/2addr v4, v13

    goto :goto_3

    :cond_4
    move-object/from16 v12, p1

    :goto_3
    and-int/lit8 v13, v2, 0x4

    if-eqz v13, :cond_5

    or-int/lit16 v4, v4, 0x180

    move/from16 v7, p2

    goto :goto_5

    :cond_5
    and-int/lit16 v7, v0, 0x180

    if-nez v7, :cond_7

    move/from16 v7, p2

    invoke-interface {v3, v7}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v16

    if-eqz v16, :cond_6

    const/16 v16, 0x100

    goto :goto_4

    :cond_6
    const/16 v16, 0x80

    :goto_4
    or-int v4, v4, v16

    goto :goto_5

    :cond_7
    move/from16 v7, p2

    :goto_5
    and-int/lit16 v8, v0, 0xc00

    const/16 v17, 0x800

    const/16 v18, 0x400

    if-nez v8, :cond_a

    and-int/lit8 v8, v2, 0x8

    if-nez v8, :cond_8

    move-object/from16 v8, p3

    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    move/from16 v19, v17

    goto :goto_6

    :cond_8
    move-object/from16 v8, p3

    :cond_9
    move/from16 v19, v18

    :goto_6
    or-int v4, v4, v19

    goto :goto_7

    :cond_a
    move-object/from16 v8, p3

    :goto_7
    and-int/lit8 v19, v2, 0x10

    const/16 v20, 0x2000

    const/16 v21, 0x4000

    if-eqz v19, :cond_b

    or-int/lit16 v4, v4, 0x6000

    move-object/from16 v10, p4

    goto :goto_9

    :cond_b
    and-int/lit16 v10, v0, 0x6000

    if-nez v10, :cond_d

    move-object/from16 v10, p4

    invoke-interface {v3, v10}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_c

    move/from16 v23, v21

    goto :goto_8

    :cond_c
    move/from16 v23, v20

    :goto_8
    or-int v4, v4, v23

    goto :goto_9

    :cond_d
    move-object/from16 v10, p4

    :goto_9
    and-int/lit8 v23, v2, 0x20

    const/high16 v24, 0x10000

    const/high16 v25, 0x30000

    if-eqz v23, :cond_e

    or-int v4, v4, v25

    move-object/from16 v11, p5

    goto :goto_b

    :cond_e
    and-int v26, v0, v25

    if-nez v26, :cond_10

    move-object/from16 v11, p5

    invoke-interface {v3, v11}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_f

    const/high16 v27, 0x20000

    goto :goto_a

    :cond_f
    move/from16 v27, v24

    :goto_a
    or-int v4, v4, v27

    goto :goto_b

    :cond_10
    move-object/from16 v11, p5

    :goto_b
    and-int/lit8 v27, v2, 0x40

    const/high16 v28, 0x180000

    if-eqz v27, :cond_11

    or-int v4, v4, v28

    move-object/from16 v14, p6

    goto :goto_d

    :cond_11
    and-int v29, v0, v28

    if-nez v29, :cond_13

    move-object/from16 v14, p6

    invoke-interface {v3, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_12

    const/high16 v30, 0x100000

    goto :goto_c

    :cond_12
    const/high16 v30, 0x80000

    :goto_c
    or-int v4, v4, v30

    goto :goto_d

    :cond_13
    move-object/from16 v14, p6

    :goto_d
    and-int/lit16 v15, v2, 0x80

    const/high16 v31, 0xc00000

    if-eqz v15, :cond_14

    or-int v4, v4, v31

    move-object/from16 v0, p7

    goto :goto_f

    :cond_14
    and-int v31, v0, v31

    if-nez v31, :cond_16

    move-object/from16 v0, p7

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_15

    const/high16 v31, 0x800000

    goto :goto_e

    :cond_15
    const/high16 v31, 0x400000

    :goto_e
    or-int v4, v4, v31

    goto :goto_f

    :cond_16
    move-object/from16 v0, p7

    :goto_f
    and-int/lit16 v0, v2, 0x100

    const/high16 v31, 0x6000000

    if-eqz v0, :cond_17

    or-int v4, v4, v31

    move/from16 v31, v0

    move/from16 v0, p8

    goto :goto_11

    :cond_17
    and-int v31, p18, v31

    if-nez v31, :cond_19

    move/from16 v31, v0

    move/from16 v0, p8

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v32

    if-eqz v32, :cond_18

    const/high16 v32, 0x4000000

    goto :goto_10

    :cond_18
    const/high16 v32, 0x2000000

    :goto_10
    or-int v4, v4, v32

    goto :goto_11

    :cond_19
    move/from16 v31, v0

    move/from16 v0, p8

    :goto_11
    and-int/lit16 v0, v2, 0x200

    const/high16 v32, 0x30000000

    if-eqz v0, :cond_1a

    or-int v4, v4, v32

    move/from16 v32, v0

    move-object/from16 v0, p9

    goto :goto_13

    :cond_1a
    and-int v32, p18, v32

    if-nez v32, :cond_1c

    move/from16 v32, v0

    move-object/from16 v0, p9

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1b

    const/high16 v33, 0x20000000

    goto :goto_12

    :cond_1b
    const/high16 v33, 0x10000000

    :goto_12
    or-int v4, v4, v33

    goto :goto_13

    :cond_1c
    move/from16 v32, v0

    move-object/from16 v0, p9

    :goto_13
    and-int/lit8 v33, v1, 0x6

    if-nez v33, :cond_1f

    and-int/lit16 v0, v2, 0x400

    if-nez v0, :cond_1d

    move/from16 v0, p10

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v33

    if-eqz v33, :cond_1e

    const/16 v16, 0x4

    goto :goto_14

    :cond_1d
    move/from16 v0, p10

    :cond_1e
    const/16 v16, 0x2

    :goto_14
    or-int v5, v5, v16

    goto :goto_15

    :cond_1f
    move/from16 v0, p10

    :goto_15
    and-int/lit16 v0, v2, 0x800

    if-eqz v0, :cond_20

    or-int/lit8 v5, v5, 0x30

    move/from16 v16, v0

    move/from16 v0, p11

    goto :goto_17

    :cond_20
    and-int/lit8 v16, v1, 0x30

    if-nez v16, :cond_22

    move/from16 v16, v0

    move/from16 v0, p11

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(C)Z

    move-result v33

    if-eqz v33, :cond_21

    const/16 v22, 0x20

    goto :goto_16

    :cond_21
    const/16 v22, 0x10

    :goto_16
    or-int v5, v5, v22

    goto :goto_17

    :cond_22
    move/from16 v16, v0

    move/from16 v0, p11

    :goto_17
    and-int/lit16 v0, v2, 0x1000

    if-eqz v0, :cond_23

    or-int/lit16 v5, v5, 0x180

    move/from16 v22, v0

    move-object/from16 v0, p12

    goto :goto_19

    :cond_23
    move/from16 v22, v0

    and-int/lit16 v0, v1, 0x180

    if-nez v0, :cond_25

    move-object/from16 v0, p12

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_24

    const/16 v29, 0x100

    goto :goto_18

    :cond_24
    const/16 v29, 0x80

    :goto_18
    or-int v5, v5, v29

    goto :goto_19

    :cond_25
    move-object/from16 v0, p12

    :goto_19
    and-int/lit16 v0, v2, 0x2000

    if-eqz v0, :cond_26

    or-int/lit16 v5, v5, 0xc00

    move/from16 v26, v0

    move-object/from16 v0, p13

    goto :goto_1b

    :cond_26
    move/from16 v26, v0

    and-int/lit16 v0, v1, 0xc00

    if-nez v0, :cond_28

    move-object/from16 v0, p13

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_27

    goto :goto_1a

    :cond_27
    move/from16 v17, v18

    :goto_1a
    or-int v5, v5, v17

    goto :goto_1b

    :cond_28
    move-object/from16 v0, p13

    :goto_1b
    and-int/lit16 v0, v1, 0x6000

    if-nez v0, :cond_2b

    and-int/lit16 v0, v2, 0x4000

    if-nez v0, :cond_29

    move-object/from16 v0, p14

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2a

    move/from16 v20, v21

    goto :goto_1c

    :cond_29
    move-object/from16 v0, p14

    :cond_2a
    :goto_1c
    or-int v5, v5, v20

    goto :goto_1d

    :cond_2b
    move-object/from16 v0, p14

    :goto_1d
    and-int v17, v1, v25

    const v18, 0x8000

    if-nez v17, :cond_2e

    and-int v17, v2, v18

    if-nez v17, :cond_2c

    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .local p17, "$dirty1":I
    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2d

    const/high16 v17, 0x20000

    goto :goto_1e

    .end local p17    # "$dirty1":I
    .restart local v5    # "$dirty1":I
    :cond_2c
    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .restart local p17    # "$dirty1":I
    :cond_2d
    move/from16 v17, v24

    :goto_1e
    or-int v17, p17, v17

    .end local p17    # "$dirty1":I
    .local v17, "$dirty1":I
    goto :goto_1f

    .end local v17    # "$dirty1":I
    .restart local v5    # "$dirty1":I
    :cond_2e
    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .restart local p17    # "$dirty1":I
    move/from16 v17, p17

    .end local p17    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    :goto_1f
    and-int v52, v2, v24

    if-eqz v52, :cond_2f

    or-int v17, v17, v28

    move-object/from16 v5, p16

    goto :goto_21

    :cond_2f
    and-int v20, v1, v28

    if-nez v20, :cond_31

    move-object/from16 v5, p16

    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_30

    const/high16 v20, 0x100000

    goto :goto_20

    :cond_30
    const/high16 v20, 0x80000

    :goto_20
    or-int v17, v17, v20

    goto :goto_21

    :cond_31
    move-object/from16 v5, p16

    :goto_21
    const v20, 0x12492493

    and-int v0, v4, v20

    const v1, 0x12492492

    if-ne v0, v1, :cond_33

    const v0, 0x92493

    and-int v0, v17, v0

    const v1, 0x92492

    if-eq v0, v1, :cond_32

    goto :goto_22

    :cond_32
    const/4 v0, 0x0

    goto :goto_23

    :cond_33
    :goto_22
    const/4 v0, 0x1

    :goto_23
    and-int/lit8 v1, v4, 0x1

    invoke-interface {v3, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "229@13395L7,240@13998L22,241@14070L25"

    invoke-static {v3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p18, 0x1

    if-eqz v0, :cond_39

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_34

    goto/16 :goto_24

    .line 226
    :cond_34
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v2, 0x8

    if-eqz v0, :cond_35

    and-int/lit16 v4, v4, -0x1c01

    :cond_35
    and-int/lit16 v0, v2, 0x400

    if-eqz v0, :cond_36

    and-int/lit8 v17, v17, -0xf

    :cond_36
    and-int/lit16 v0, v2, 0x4000

    if-eqz v0, :cond_37

    const v0, -0xe001

    and-int v17, v17, v0

    :cond_37
    and-int v0, v2, v18

    if-eqz v0, :cond_38

    const v0, -0x70001

    and-int v0, v17, v0

    move-object v1, v12

    move v12, v0

    move-object v0, v1

    move-object/from16 v58, p7

    move/from16 v16, p10

    move/from16 v17, p11

    move-object/from16 v64, p13

    move-object/from16 v65, p14

    move-object/from16 v22, p16

    move-object v5, v3

    move v9, v4

    move v6, v7

    move-object v1, v8

    move-object/from16 v55, v10

    const/4 v3, 0x1

    move/from16 v4, p8

    move-object/from16 v8, p9

    move-object/from16 v10, p12

    move-object/from16 v7, p15

    .end local v17    # "$dirty1":I
    .local v0, "$dirty1":I
    goto/16 :goto_34

    .end local v0    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    :cond_38
    move-object/from16 v58, p7

    move/from16 v16, p10

    move-object/from16 v64, p13

    move-object/from16 v65, p14

    move-object/from16 v22, p16

    move-object v5, v3

    move v9, v4

    move v6, v7

    move-object v1, v8

    move-object/from16 v55, v10

    move-object v0, v12

    move/from16 v12, v17

    const/4 v3, 0x1

    move/from16 v4, p8

    move-object/from16 v8, p9

    move/from16 v17, p11

    move-object/from16 v10, p12

    move-object/from16 v7, p15

    goto/16 :goto_34

    .line 244
    :cond_39
    :goto_24
    if-eqz v9, :cond_3a

    .line 228
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_25

    .line 244
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_3a
    move-object v0, v12

    .line 228
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_25
    if-eqz v13, :cond_3b

    .line 229
    const/4 v7, 0x1

    move/from16 v53, v7

    .end local p2    # "enabled":Z
    .local v7, "enabled":Z
    goto :goto_26

    .line 228
    .end local v7    # "enabled":Z
    .restart local p2    # "enabled":Z
    :cond_3b
    move/from16 v53, v7

    .line 229
    .end local p2    # "enabled":Z
    .local v53, "enabled":Z
    :goto_26
    and-int/lit8 v7, v2, 0x8

    if-eqz v7, :cond_3c

    .line 230
    invoke-static {}, Landroidx/compose/material/TextKt;->getLocalTextStyle()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v7

    check-cast v7, Landroidx/compose/runtime/CompositionLocal;

    .local v7, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v9, 0x6

    .local v9, "$changed$iv":I
    move-object v12, v3

    .local v12, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 319
    .local v13, "$i$f$getCurrent":I
    const v5, 0x789c5f52

    const-string v1, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v12, v5, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v12, v7}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .end local v7    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v9    # "$changed$iv":I
    .end local v12    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$getCurrent":I
    check-cast v1, Landroidx/compose/ui/text/TextStyle;

    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v1, "textStyle":Landroidx/compose/ui/text/TextStyle;
    and-int/lit16 v4, v4, -0x1c01

    move/from16 v54, v4

    goto :goto_27

    .line 229
    .end local v1    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .restart local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    :cond_3c
    move-object v1, v8

    move/from16 v54, v4

    .line 319
    .end local v4    # "$dirty":I
    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .restart local v1    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v54, "$dirty":I
    :goto_27
    if-eqz v19, :cond_3d

    .line 231
    const/4 v4, 0x0

    move-object/from16 v55, v4

    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .local v4, "label":Lkotlin/jvm/functions/Function2;
    goto :goto_28

    .line 319
    .end local v4    # "label":Lkotlin/jvm/functions/Function2;
    .restart local p4    # "label":Lkotlin/jvm/functions/Function2;
    :cond_3d
    move-object/from16 v55, v10

    .line 231
    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .local v55, "label":Lkotlin/jvm/functions/Function2;
    :goto_28
    if-eqz v23, :cond_3e

    .line 232
    const/4 v4, 0x0

    move-object/from16 v56, v4

    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local v4, "placeholder":Lkotlin/jvm/functions/Function2;
    goto :goto_29

    .line 231
    .end local v4    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    :cond_3e
    move-object/from16 v56, v11

    .line 232
    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local v56, "placeholder":Lkotlin/jvm/functions/Function2;
    :goto_29
    if-eqz v27, :cond_3f

    .line 233
    const/4 v4, 0x0

    move-object/from16 v57, v4

    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "leadingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_2a

    .line 232
    .end local v4    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :cond_3f
    move-object/from16 v57, v14

    .line 233
    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v57, "leadingIcon":Lkotlin/jvm/functions/Function2;
    :goto_2a
    if-eqz v15, :cond_40

    .line 234
    const/4 v4, 0x0

    move-object/from16 v58, v4

    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "trailingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_2b

    .line 233
    .end local v4    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    :cond_40
    move-object/from16 v58, p7

    .line 234
    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v58, "trailingIcon":Lkotlin/jvm/functions/Function2;
    :goto_2b
    if-eqz v31, :cond_41

    .line 235
    const/4 v4, 0x0

    move/from16 v59, v4

    .end local p8    # "isError":Z
    .local v4, "isError":Z
    goto :goto_2c

    .line 234
    .end local v4    # "isError":Z
    .restart local p8    # "isError":Z
    :cond_41
    move/from16 v59, p8

    .line 235
    .end local p8    # "isError":Z
    .local v59, "isError":Z
    :goto_2c
    if-eqz v32, :cond_42

    .line 236
    const/4 v4, 0x0

    move-object/from16 v60, v4

    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v4, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    goto :goto_2d

    .line 235
    .end local v4    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .restart local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    :cond_42
    move-object/from16 v60, p9

    .line 236
    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v60, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    :goto_2d
    and-int/lit16 v4, v2, 0x400

    if-eqz v4, :cond_43

    .line 237
    sget-object v4, Landroidx/compose/foundation/text/input/TextObfuscationMode;->Companion:Landroidx/compose/foundation/text/input/TextObfuscationMode$Companion;

    invoke-virtual {v4}, Landroidx/compose/foundation/text/input/TextObfuscationMode$Companion;->getRevealLastTyped-vTwcZD0()I

    move-result v4

    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v4, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    and-int/lit8 v17, v17, -0xf

    move/from16 v61, v4

    goto :goto_2e

    .line 236
    .end local v4    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .restart local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    :cond_43
    move/from16 v61, p10

    .line 237
    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v61, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    :goto_2e
    if-eqz v16, :cond_44

    .line 238
    const/16 v4, 0x2022

    move/from16 v62, v4

    .end local p11    # "textObfuscationCharacter":C
    .local v4, "textObfuscationCharacter":C
    goto :goto_2f

    .line 237
    .end local v4    # "textObfuscationCharacter":C
    .restart local p11    # "textObfuscationCharacter":C
    :cond_44
    move/from16 v62, p11

    .line 238
    .end local p11    # "textObfuscationCharacter":C
    .local v62, "textObfuscationCharacter":C
    :goto_2f
    if-eqz v22, :cond_45

    .line 239
    sget-object v4, Landroidx/compose/material/SecureTextFieldKt;->SecureTextFieldKeyboardOptions:Landroidx/compose/foundation/text/KeyboardOptions;

    move-object/from16 v63, v4

    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v4, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    goto :goto_30

    .line 238
    .end local v4    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .restart local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    :cond_45
    move-object/from16 v63, p12

    .line 239
    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v63, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    :goto_30
    if-eqz v26, :cond_46

    .line 240
    const/4 v4, 0x0

    move-object/from16 v64, v4

    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v4, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    goto :goto_31

    .line 239
    .end local v4    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .restart local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    :cond_46
    move-object/from16 v64, p13

    .line 240
    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v64, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    :goto_31
    and-int/lit16 v4, v2, 0x4000

    if-eqz v4, :cond_47

    .line 241
    sget-object v4, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    const/4 v5, 0x6

    invoke-virtual {v4, v3, v5}, Landroidx/compose/material/TextFieldDefaults;->getOutlinedTextFieldShape(Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/graphics/Shape;

    move-result-object v4

    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v4, "shape":Landroidx/compose/ui/graphics/Shape;
    const v5, -0xe001

    and-int v17, v17, v5

    move-object/from16 v65, v4

    move/from16 v66, v17

    goto :goto_32

    .line 240
    .end local v4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    :cond_47
    move-object/from16 v65, p14

    move/from16 v66, v17

    .line 241
    .end local v17    # "$dirty1":I
    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v65, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v66, "$dirty1":I
    :goto_32
    and-int v4, v2, v18

    if-eqz v4, :cond_48

    .line 242
    sget-object v4, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    const/16 v50, 0x30

    const v51, 0x1fffff

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const-wide/16 v21, 0x0

    const-wide/16 v23, 0x0

    const-wide/16 v25, 0x0

    const-wide/16 v27, 0x0

    const-wide/16 v29, 0x0

    const-wide/16 v31, 0x0

    const-wide/16 v33, 0x0

    const-wide/16 v35, 0x0

    const-wide/16 v37, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const-wide/16 v43, 0x0

    const-wide/16 v45, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    move-object/from16 v47, v3

    const/4 v3, 0x1

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v47, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v4 .. v51}, Landroidx/compose/material/TextFieldDefaults;->outlinedTextFieldColors-dx8h9Zs(JJJJJJJJJJJJJJJJJJJJJLandroidx/compose/runtime/Composer;IIII)Landroidx/compose/material/TextFieldColors;

    move-result-object v4

    move-object/from16 v5, v47

    .end local v47    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v4, "colors":Landroidx/compose/material/TextFieldColors;
    .local v5, "$composer":Landroidx/compose/runtime/Composer;
    const v6, -0x70001

    and-int v66, v66, v6

    goto :goto_33

    .line 241
    .end local v4    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    :cond_48
    move-object v5, v3

    const/4 v3, 0x1

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v5    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v4, p15

    .line 242
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .restart local v4    # "colors":Landroidx/compose/material/TextFieldColors;
    :goto_33
    if-eqz v52, :cond_49

    .line 243
    const/4 v6, 0x0

    move-object v7, v4

    move-object/from16 v22, v6

    move/from16 v6, v53

    move/from16 v9, v54

    move-object/from16 v11, v56

    move-object/from16 v14, v57

    move/from16 v4, v59

    move-object/from16 v8, v60

    move/from16 v16, v61

    move/from16 v17, v62

    move-object/from16 v10, v63

    move/from16 v12, v66

    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v6, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_34

    .line 242
    .end local v6    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_49
    move-object/from16 v22, p16

    move-object v7, v4

    move/from16 v6, v53

    move/from16 v9, v54

    move-object/from16 v11, v56

    move-object/from16 v14, v57

    move/from16 v4, v59

    move-object/from16 v8, v60

    move/from16 v16, v61

    move/from16 v17, v62

    move-object/from16 v10, v63

    move/from16 v12, v66

    .line 226
    .end local v53    # "enabled":Z
    .end local v54    # "$dirty":I
    .end local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v59    # "isError":Z
    .end local v60    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local v61    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local v62    # "textObfuscationCharacter":C
    .end local v63    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v66    # "$dirty1":I
    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v4, "isError":Z
    .local v6, "enabled":Z
    .local v7, "colors":Landroidx/compose/material/TextFieldColors;
    .local v8, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v9, "$dirty":I
    .local v10, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v11, "placeholder":Lkotlin/jvm/functions/Function2;
    .local v12, "$dirty1":I
    .local v14, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v16, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v17, "textObfuscationCharacter":C
    .local v22, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_34
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v13

    if-eqz v13, :cond_4a

    const v13, -0x6ea0e2d4

    const-string v15, "androidx.compose.material.OutlinedSecureTextField (SecureTextField.kt:243)"

    invoke-static {v13, v9, v12, v15}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 246
    :cond_4a
    if-nez v22, :cond_4c

    const v13, 0xb93024f

    invoke-interface {v5, v13}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v13, "245@14239L39"

    invoke-static {v5, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    const v13, -0x49f2ffed

    const-string v15, "CC(remember):SecureTextField.kt#9igjgp"

    invoke-static {v5, v13, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v13, 0x0

    .local v13, "invalid$iv":Z
    move-object v15, v5

    .local v15, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 320
    .local v18, "$i$f$cache":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it$iv":Ljava/lang/Object;
    const/16 v19, 0x0

    .line 321
    .local v19, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v20, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v20 .. v20}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v3, v2, :cond_4b

    .line 322
    const/4 v2, 0x0

    .line 246
    .local v2, "$i$a$-cache-SecureTextFieldKt$OutlinedSecureTextField$interactionSource$1":I
    invoke-static {}, Landroidx/compose/foundation/interaction/InteractionSourceKt;->MutableInteractionSource()Landroidx/compose/foundation/interaction/MutableInteractionSource;

    move-result-object v2

    .line 322
    .end local v2    # "$i$a$-cache-SecureTextFieldKt$OutlinedSecureTextField$interactionSource$1":I
    nop

    .line 323
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v15, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 324
    move-object v3, v2

    .end local v2    # "value$iv":Ljava/lang/Object;
    goto :goto_35

    .line 325
    :cond_4b
    nop

    .line 320
    .end local v3    # "it$iv":Ljava/lang/Object;
    .end local v19    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_35
    nop

    .line 246
    .end local v13    # "invalid$iv":Z
    .end local v15    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$f$cache":I
    check-cast v3, Landroidx/compose/foundation/interaction/MutableInteractionSource;

    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object v13, v3

    goto :goto_36

    :cond_4c
    const v2, -0x49f30278

    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object/from16 v13, v22

    .local v13, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_36
    const v2, -0x49f2ec06

    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "*247@14418L18"

    invoke-static {v5, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 248
    invoke-virtual {v1}, Landroidx/compose/ui/text/TextStyle;->getColor-0d7_KjU()J

    move-result-wide v2

    .local v2, "$this$takeOrElse_u2dDxMtmZc$iv":J
    const/4 v15, 0x0

    .line 326
    .local v15, "$i$f$takeOrElse-DxMtmZc":I
    move-wide/from16 v18, v2

    .local v18, "$this$isSpecified$iv$iv":J
    const/16 v20, 0x0

    .line 327
    .local v20, "$i$f$isSpecified-8_81llA":I
    const-wide/16 v23, 0x10

    cmp-long v21, v18, v23

    if-eqz v21, :cond_4d

    const/16 v21, 0x1

    goto :goto_37

    :cond_4d
    const/16 v21, 0x0

    .line 326
    .end local v18    # "$this$isSpecified$iv$iv":J
    .end local v20    # "$i$f$isSpecified-8_81llA":I
    :goto_37
    if-eqz v21, :cond_4e

    goto :goto_38

    :cond_4e
    const/16 v18, 0x0

    .line 248
    .local v18, "$i$a$-takeOrElse-DxMtmZc-SecureTextFieldKt$OutlinedSecureTextField$textColor$1":I
    shr-int/lit8 v19, v9, 0x6

    and-int/lit8 v19, v19, 0xe

    shr-int/lit8 v20, v12, 0xc

    and-int/lit8 v20, v20, 0x70

    move-wide/from16 p1, v2

    .end local v2    # "$this$takeOrElse_u2dDxMtmZc$iv":J
    .local p1, "$this$takeOrElse_u2dDxMtmZc$iv":J
    or-int v2, v19, v20

    invoke-interface {v7, v6, v5, v2}, Landroidx/compose/material/TextFieldColors;->textColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v2

    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v2}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v2

    .line 326
    .end local v18    # "$i$a$-takeOrElse-DxMtmZc-SecureTextFieldKt$OutlinedSecureTextField$textColor$1":I
    nop

    .line 248
    .end local v15    # "$i$f$takeOrElse-DxMtmZc":I
    .end local p1    # "$this$takeOrElse_u2dDxMtmZc$iv":J
    :goto_38
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-wide/from16 v67, v2

    .line 249
    .local v67, "textColor":J
    new-instance v66, Landroidx/compose/ui/text/TextStyle;

    const v96, 0xfffffe

    const/16 v97, 0x0

    const-wide/16 v69, 0x0

    const/16 v71, 0x0

    const/16 v72, 0x0

    const/16 v73, 0x0

    const/16 v74, 0x0

    const/16 v75, 0x0

    const-wide/16 v76, 0x0

    const/16 v78, 0x0

    const/16 v79, 0x0

    const/16 v80, 0x0

    const-wide/16 v81, 0x0

    const/16 v83, 0x0

    const/16 v84, 0x0

    const/16 v85, 0x0

    const/16 v86, 0x0

    const/16 v87, 0x0

    const-wide/16 v88, 0x0

    const/16 v90, 0x0

    const/16 v91, 0x0

    const/16 v92, 0x0

    const/16 v93, 0x0

    const/16 v94, 0x0

    const/16 v95, 0x0

    invoke-direct/range {v66 .. v97}, Landroidx/compose/ui/text/TextStyle;-><init>(JJLandroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontSynthesis;Landroidx/compose/ui/text/font/FontFamily;Ljava/lang/String;JLandroidx/compose/ui/text/style/BaselineShift;Landroidx/compose/ui/text/style/TextGeometricTransform;Landroidx/compose/ui/text/intl/LocaleList;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/graphics/Shadow;Landroidx/compose/ui/graphics/drawscope/DrawStyle;IIJLandroidx/compose/ui/text/style/TextIndent;Landroidx/compose/ui/text/PlatformTextStyle;Landroidx/compose/ui/text/style/LineHeightStyle;IILandroidx/compose/ui/text/style/TextMotion;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v2, v66

    invoke-virtual {v1, v2}, Landroidx/compose/ui/text/TextStyle;->merge(Landroidx/compose/ui/text/TextStyle;)Landroidx/compose/ui/text/TextStyle;

    move-result-object v2

    .line 251
    .local v2, "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    check-cast v3, Landroidx/compose/runtime/CompositionLocal;

    .local v3, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v15, 0x0

    .local v15, "$changed$iv":I
    move-object/from16 p1, v5

    .local p1, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 328
    .local v18, "$i$f$getCurrent":I
    move-object/from16 p12, v1

    .end local v1    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local p12, "textStyle":Landroidx/compose/ui/text/TextStyle;
    const v1, 0x789c5f52

    move-object/from16 p13, v2

    .end local v2    # "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    .local p13, "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    const-string v2, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    move/from16 p3, v6

    move-object/from16 v6, p1

    .end local p1    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .local v6, "$composer$iv":Landroidx/compose/runtime/Composer;
    .local p3, "enabled":Z
    invoke-static {v6, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v6, v3}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 251
    .end local v3    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v6    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$changed$iv":I
    .end local v18    # "$i$f$getCurrent":I
    check-cast v1, Landroidx/compose/ui/unit/Density;

    .line 256
    .local v1, "density":Landroidx/compose/ui/unit/Density;
    nop

    .line 258
    if-eqz v55, :cond_50

    const v2, 0xb9a4a6d

    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "261@14981L2"

    invoke-static {v5, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 259
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    .line 262
    const v3, -0x49f2a352

    const-string v6, "CC(remember):SecureTextField.kt#9igjgp"

    invoke-static {v5, v3, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v3, 0x0

    .local v3, "invalid$iv":Z
    move-object v6, v5

    .local v6, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 329
    .local v15, "$i$f$cache":I
    move-object/from16 p14, v1

    .end local v1    # "density":Landroidx/compose/ui/unit/Density;
    .local p14, "density":Landroidx/compose/ui/unit/Density;
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 330
    .local v18, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p1, v3

    .end local v3    # "invalid$iv":Z
    .local p1, "invalid$iv":Z
    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v1, v3, :cond_4f

    .line 331
    const/4 v3, 0x0

    .local v3, "$i$a$-cache-SecureTextFieldKt$OutlinedSecureTextField$1":I
    new-instance v19, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda1;

    invoke-direct/range {v19 .. v19}, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda1;-><init>()V

    .end local v3    # "$i$a$-cache-SecureTextFieldKt$OutlinedSecureTextField$1":I
    move-object/from16 v3, v19

    .line 332
    .local v3, "value$iv":Ljava/lang/Object;
    invoke-interface {v6, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 333
    move-object v1, v3

    .end local v3    # "value$iv":Ljava/lang/Object;
    goto :goto_39

    .line 334
    :cond_4f
    nop

    .line 329
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v18    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_39
    nop

    .line 262
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v3, 0x1

    invoke-static {v2, v3, v1}, Landroidx/compose/ui/semantics/SemanticsModifierKt;->semantics(Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function1;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 263
    nop

    .line 335
    move-object/from16 v2, p14

    .local v2, "$this$OutlinedSecureTextField_0vce7ms_u24lambda_u243":Landroidx/compose/ui/unit/Density;
    const/4 v3, 0x0

    .line 263
    .local v3, "$i$a$-with-SecureTextFieldKt$OutlinedSecureTextField$2":I
    move-object/from16 p15, v10

    move-object/from16 p1, v11

    .end local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v11    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local p1, "placeholder":Lkotlin/jvm/functions/Function2;
    .local p15, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    invoke-static {}, Landroidx/compose/material/OutlinedTextFieldKt;->getOutlinedTextFieldTopPadding()J

    move-result-wide v10

    invoke-interface {v2, v10, v11}, Landroidx/compose/ui/unit/Density;->toDp-GaN1DYA(J)F

    move-result v2

    .end local v2    # "$this$OutlinedSecureTextField_0vce7ms_u24lambda_u243":Landroidx/compose/ui/unit/Density;
    .end local v3    # "$i$a$-with-SecureTextFieldKt$OutlinedSecureTextField$2":I
    const/16 v3, 0xd

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    move-object/from16 p4, v1

    move/from16 p6, v2

    move/from16 p9, v3

    move-object/from16 p10, v6

    move/from16 p5, v10

    move/from16 p7, v11

    move/from16 p8, v15

    invoke-static/range {p4 .. p10}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0$default(Landroidx/compose/ui/Modifier;FFFFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 258
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto :goto_3a

    .line 264
    .end local p1    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local p14    # "density":Landroidx/compose/ui/unit/Density;
    .end local p15    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v1, "density":Landroidx/compose/ui/unit/Density;
    .restart local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .restart local v11    # "placeholder":Lkotlin/jvm/functions/Function2;
    :cond_50
    move-object/from16 p14, v1

    move-object/from16 p15, v10

    move-object/from16 p1, v11

    .end local v1    # "density":Landroidx/compose/ui/unit/Density;
    .end local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v11    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local p1    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local p14    # "density":Landroidx/compose/ui/unit/Density;
    .restart local p15    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    const v1, 0xba02bbe

    invoke-interface {v5, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 265
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    .line 257
    :goto_3a
    invoke-interface {v0, v1}, Landroidx/compose/ui/Modifier;->then(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 268
    sget-object v2, Landroidx/compose/material/Strings;->Companion:Landroidx/compose/material/Strings$Companion;

    invoke-virtual {v2}, Landroidx/compose/material/Strings$Companion;->getDefaultErrorMessage-UdPEhr4()I

    move-result v2

    const/4 v3, 0x6

    invoke-static {v2, v5, v3}, Landroidx/compose/material/Strings_androidKt;->getString-4foXLRw(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v4, v2}, Landroidx/compose/material/TextFieldImplKt;->defaultErrorSemantics(Landroidx/compose/ui/Modifier;ZLjava/lang/String;)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 270
    sget-object v2, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    invoke-virtual {v2}, Landroidx/compose/material/TextFieldDefaults;->getMinWidth-D9Ej5fM()F

    move-result v2

    .line 271
    sget-object v3, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    invoke-virtual {v3}, Landroidx/compose/material/TextFieldDefaults;->getMinHeight-D9Ej5fM()F

    move-result v3

    .line 269
    invoke-static {v1, v2, v3}, Landroidx/compose/foundation/layout/SizeKt;->defaultMinSize-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object v1

    .line 275
    new-instance v2, Landroidx/compose/ui/graphics/SolidColor;

    shr-int/lit8 v3, v9, 0x18

    and-int/lit8 v3, v3, 0xe

    shr-int/lit8 v6, v12, 0xc

    and-int/lit8 v6, v6, 0x70

    or-int/2addr v3, v6

    invoke-interface {v7, v4, v5, v3}, Landroidx/compose/material/TextFieldColors;->cursorColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v3

    invoke-interface {v3}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v10

    const/4 v3, 0x0

    invoke-direct {v2, v10, v11, v3}, Landroidx/compose/ui/graphics/SolidColor;-><init>(JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 282
    new-instance v3, Landroidx/compose/material/SecureTextFieldKt$OutlinedSecureTextField$3;

    move-object/from16 p2, p0

    move-object/from16 p7, p1

    move-object/from16 p1, v3

    move/from16 p5, v4

    move-object/from16 p11, v7

    move-object/from16 p4, v13

    move-object/from16 p8, v14

    move-object/from16 p6, v55

    move-object/from16 p9, v58

    move-object/from16 p10, v65

    .end local v4    # "isError":Z
    .end local v7    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v14    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v55    # "label":Lkotlin/jvm/functions/Function2;
    .end local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p1    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local p4, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local p5, "isError":Z
    .local p6, "label":Lkotlin/jvm/functions/Function2;
    .local p7, "placeholder":Lkotlin/jvm/functions/Function2;
    .local p8, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p9, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p10, "shape":Landroidx/compose/ui/graphics/Shape;
    .local p11, "colors":Landroidx/compose/material/TextFieldColors;
    invoke-direct/range {p1 .. p11}, Landroidx/compose/material/SecureTextFieldKt$OutlinedSecureTextField$3;-><init>(Landroidx/compose/foundation/text/input/TextFieldState;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;)V

    move-object/from16 v4, p1

    move/from16 v6, p3

    move/from16 v59, p5

    move-object/from16 v56, p7

    move-object/from16 v57, p8

    move-object/from16 v3, p11

    .end local p3    # "enabled":Z
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "isError":Z
    .end local p6    # "label":Lkotlin/jvm/functions/Function2;
    .end local p7    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p9    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local p10    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p11    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v3, "colors":Landroidx/compose/material/TextFieldColors;
    .local v6, "enabled":Z
    .restart local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v55    # "label":Lkotlin/jvm/functions/Function2;
    .restart local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v59    # "isError":Z
    .restart local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    move-object v15, v4

    check-cast v15, Landroidx/compose/foundation/text/input/TextFieldDecorator;

    .line 254
    nop

    .line 269
    nop

    .line 273
    nop

    .line 276
    nop

    .line 274
    nop

    .line 279
    nop

    .line 280
    nop

    .line 281
    nop

    .line 275
    move-object v14, v2

    check-cast v14, Landroidx/compose/ui/graphics/Brush;

    .line 282
    nop

    .line 277
    nop

    .line 278
    and-int/lit8 v2, v9, 0xe

    and-int/lit16 v4, v9, 0x380

    or-int/2addr v2, v4

    shr-int/lit8 v4, v9, 0xf

    const v7, 0xe000

    and-int/2addr v4, v7

    or-int/2addr v2, v4

    shl-int/lit8 v4, v12, 0xc

    const/high16 v7, 0x380000

    and-int/2addr v4, v7

    or-int/2addr v2, v4

    const/high16 v4, 0x1c00000

    shl-int/lit8 v7, v12, 0xc

    and-int/2addr v4, v7

    or-int v19, v2, v4

    shl-int/lit8 v2, v12, 0x6

    and-int/lit16 v2, v2, 0x380

    shl-int/lit8 v4, v12, 0x6

    and-int/lit16 v4, v4, 0x1c00

    or-int v20, v2, v4

    .line 253
    const/4 v7, 0x0

    move/from16 v66, v12

    .end local v12    # "$dirty1":I
    .restart local v66    # "$dirty1":I
    const/4 v12, 0x0

    const/16 v21, 0x108

    move-object/from16 v4, p0

    move-object/from16 v10, p15

    move-object/from16 v18, v5

    move/from16 v54, v9

    move-object/from16 v11, v64

    move-object/from16 v9, p13

    move-object v5, v1

    .end local v5    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v64    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .end local p13    # "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    .end local p15    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v9, "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    .restart local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v11, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v18, "$composer":Landroidx/compose/runtime/Composer;
    .restart local v54    # "$dirty":I
    invoke-static/range {v4 .. v21}, Landroidx/compose/foundation/text/BasicSecureTextFieldKt;->BasicSecureTextField-egD4TGM(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/TextFieldDecorator;ICLandroidx/compose/runtime/Composer;III)V

    move-object/from16 v47, v18

    .end local v18    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v47    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 303
    .end local v9    # "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    .end local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v67    # "textColor":J
    .end local p14    # "density":Landroidx/compose/ui/unit/Density;
    :cond_51
    move-object/from16 v4, p12

    move-object v2, v0

    move-object v13, v10

    move-object v14, v11

    move/from16 v11, v16

    move/from16 v12, v17

    move-object/from16 v17, v22

    move-object/from16 v5, v55

    move-object/from16 v7, v57

    move/from16 v9, v59

    move-object/from16 v15, v65

    move-object/from16 v16, v3

    move v3, v6

    move-object v10, v8

    move-object/from16 v6, v56

    move-object/from16 v8, v58

    goto :goto_3b

    .line 226
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v6    # "enabled":Z
    .end local v8    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v11    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .end local v16    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local v22    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v47    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v54    # "$dirty":I
    .end local v55    # "label":Lkotlin/jvm/functions/Function2;
    .end local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local v59    # "isError":Z
    .end local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v66    # "$dirty1":I
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$dirty":I
    .local v17, "$dirty1":I
    .local p1, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "enabled":Z
    .local p3, "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local p4, "label":Lkotlin/jvm/functions/Function2;
    .local p5, "placeholder":Lkotlin/jvm/functions/Function2;
    .local p6, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p7, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p8, "isError":Z
    .local p9, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local p10, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local p11, "textObfuscationCharacter":C
    .local p12, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local p13, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local p14, "shape":Landroidx/compose/ui/graphics/Shape;
    .local p15, "colors":Landroidx/compose/material/TextFieldColors;
    .restart local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_52
    move-object/from16 v47, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v47    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v47 .. v47}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v9, p8

    move-object/from16 v13, p12

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move/from16 v54, v4

    move v3, v7

    move-object v4, v8

    move-object v5, v10

    move-object v6, v11

    move-object v2, v12

    move-object v7, v14

    move/from16 v66, v17

    move-object/from16 v8, p7

    move-object/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v14, p13

    move-object/from16 v17, p16

    .line 303
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "enabled":Z
    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local p8    # "isError":Z
    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local p11    # "textObfuscationCharacter":C
    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "enabled":Z
    .local v4, "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v5, "label":Lkotlin/jvm/functions/Function2;
    .local v6, "placeholder":Lkotlin/jvm/functions/Function2;
    .local v7, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v8, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v9, "isError":Z
    .local v10, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v11, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v12, "textObfuscationCharacter":C
    .local v13, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v14, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v15, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v16, "colors":Landroidx/compose/material/TextFieldColors;
    .local v17, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v54    # "$dirty":I
    .restart local v66    # "$dirty1":I
    :goto_3b
    invoke-interface/range {v47 .. v47}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-eqz v0, :cond_53

    move-object v1, v0

    new-instance v0, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda2;

    move/from16 v18, p18

    move/from16 v19, p19

    move/from16 v20, p20

    move-object/from16 v98, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v20}, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda2;-><init>(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;III)V

    move-object/from16 v1, v98

    invoke-interface {v1, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_53
    return-void
.end method

.method private static final OutlinedSecureTextField_0vce7ms$lambda$2$0(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Lkotlin/Unit;
    .locals 1
    .param p0, "$this$semantics"    # Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;

    .line 262
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final OutlinedSecureTextField_0vce7ms$lambda$4(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 22

    or-int/lit8 v0, p17, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v19

    invoke-static/range {p18 .. p18}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move-object/from16 v17, p16

    move/from16 v21, p19

    move-object/from16 v18, p20

    invoke-static/range {v1 .. v21}, Landroidx/compose/material/SecureTextFieldKt;->OutlinedSecureTextField-0vce7ms(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;III)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final SecureTextField-0vce7ms(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;III)V
    .locals 68
    .param p0, "state"    # Landroidx/compose/foundation/text/input/TextFieldState;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "enabled"    # Z
    .param p3, "textStyle"    # Landroidx/compose/ui/text/TextStyle;
    .param p4, "label"    # Lkotlin/jvm/functions/Function2;
    .param p5, "placeholder"    # Lkotlin/jvm/functions/Function2;
    .param p6, "leadingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p7, "trailingIcon"    # Lkotlin/jvm/functions/Function2;
    .param p8, "isError"    # Z
    .param p9, "inputTransformation"    # Landroidx/compose/foundation/text/input/InputTransformation;
    .param p10, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0"    # I
    .param p11, "textObfuscationCharacter"    # C
    .param p12, "keyboardOptions"    # Landroidx/compose/foundation/text/KeyboardOptions;
    .param p13, "onKeyboardAction"    # Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .param p14, "shape"    # Landroidx/compose/ui/graphics/Shape;
    .param p15, "colors"    # Landroidx/compose/material/TextFieldColors;
    .param p16, "interactionSource"    # Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .param p17, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p18, "$changed"    # I
    .param p19, "$changed1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/foundation/text/input/TextFieldState;",
            "Landroidx/compose/ui/Modifier;",
            "Z",
            "Landroidx/compose/ui/text/TextStyle;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;Z",
            "Landroidx/compose/foundation/text/input/InputTransformation;",
            "IC",
            "Landroidx/compose/foundation/text/KeyboardOptions;",
            "Landroidx/compose/foundation/text/input/KeyboardActionHandler;",
            "Landroidx/compose/ui/graphics/Shape;",
            "Landroidx/compose/material/TextFieldColors;",
            "Landroidx/compose/foundation/interaction/MutableInteractionSource;",
            "Landroidx/compose/runtime/Composer;",
            "III)V"
        }
    .end annotation

    .line 122
    move/from16 v0, p18

    move/from16 v1, p19

    move/from16 v2, p20

    const v3, -0x1267fdd6

    move-object/from16 v4, p17

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v3

    .end local p17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(SecureTextField)N(state,modifier,enabled,textStyle,label,placeholder,leadingIcon,trailingIcon,isError,inputTransformation,textObfuscationMode:c#foundation.text.input.TextObfuscationMode,textObfuscationCharacter,keyboardOptions,onKeyboardAction,shape,colors,interactionSource)133@7665L38,140@7981L20,128@7456L1524:SecureTextField.kt#jmzs0o"

    invoke-static {v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p18

    .local v4, "$dirty":I
    move/from16 v5, p19

    .local v5, "$dirty1":I
    and-int/lit8 v6, v0, 0x6

    if-nez v6, :cond_1

    move-object/from16 v6, p0

    invoke-interface {v3, v6}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v9, 0x4

    goto :goto_0

    :cond_0
    const/4 v9, 0x2

    :goto_0
    or-int/2addr v4, v9

    goto :goto_1

    :cond_1
    move-object/from16 v6, p0

    :goto_1
    and-int/lit8 v9, v2, 0x2

    if-eqz v9, :cond_2

    or-int/lit8 v4, v4, 0x30

    move-object/from16 v12, p1

    goto :goto_3

    :cond_2
    and-int/lit8 v12, v0, 0x30

    if-nez v12, :cond_4

    move-object/from16 v12, p1

    invoke-interface {v3, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    const/16 v13, 0x20

    goto :goto_2

    :cond_3
    const/16 v13, 0x10

    :goto_2
    or-int/2addr v4, v13

    goto :goto_3

    :cond_4
    move-object/from16 v12, p1

    :goto_3
    and-int/lit8 v13, v2, 0x4

    if-eqz v13, :cond_5

    or-int/lit16 v4, v4, 0x180

    move/from16 v7, p2

    goto :goto_5

    :cond_5
    and-int/lit16 v7, v0, 0x180

    if-nez v7, :cond_7

    move/from16 v7, p2

    invoke-interface {v3, v7}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v16

    if-eqz v16, :cond_6

    const/16 v16, 0x100

    goto :goto_4

    :cond_6
    const/16 v16, 0x80

    :goto_4
    or-int v4, v4, v16

    goto :goto_5

    :cond_7
    move/from16 v7, p2

    :goto_5
    and-int/lit16 v8, v0, 0xc00

    const/16 v17, 0x800

    const/16 v18, 0x400

    if-nez v8, :cond_a

    and-int/lit8 v8, v2, 0x8

    if-nez v8, :cond_8

    move-object/from16 v8, p3

    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    move/from16 v19, v17

    goto :goto_6

    :cond_8
    move-object/from16 v8, p3

    :cond_9
    move/from16 v19, v18

    :goto_6
    or-int v4, v4, v19

    goto :goto_7

    :cond_a
    move-object/from16 v8, p3

    :goto_7
    and-int/lit8 v19, v2, 0x10

    const/16 v20, 0x2000

    const/16 v21, 0x4000

    if-eqz v19, :cond_b

    or-int/lit16 v4, v4, 0x6000

    move-object/from16 v10, p4

    goto :goto_9

    :cond_b
    and-int/lit16 v10, v0, 0x6000

    if-nez v10, :cond_d

    move-object/from16 v10, p4

    invoke-interface {v3, v10}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_c

    move/from16 v23, v21

    goto :goto_8

    :cond_c
    move/from16 v23, v20

    :goto_8
    or-int v4, v4, v23

    goto :goto_9

    :cond_d
    move-object/from16 v10, p4

    :goto_9
    and-int/lit8 v23, v2, 0x20

    const/high16 v24, 0x10000

    const/high16 v25, 0x30000

    if-eqz v23, :cond_e

    or-int v4, v4, v25

    move-object/from16 v11, p5

    goto :goto_b

    :cond_e
    and-int v26, v0, v25

    if-nez v26, :cond_10

    move-object/from16 v11, p5

    invoke-interface {v3, v11}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_f

    const/high16 v27, 0x20000

    goto :goto_a

    :cond_f
    move/from16 v27, v24

    :goto_a
    or-int v4, v4, v27

    goto :goto_b

    :cond_10
    move-object/from16 v11, p5

    :goto_b
    and-int/lit8 v27, v2, 0x40

    const/high16 v28, 0x180000

    if-eqz v27, :cond_11

    or-int v4, v4, v28

    move-object/from16 v14, p6

    goto :goto_d

    :cond_11
    and-int v29, v0, v28

    if-nez v29, :cond_13

    move-object/from16 v14, p6

    invoke-interface {v3, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_12

    const/high16 v30, 0x100000

    goto :goto_c

    :cond_12
    const/high16 v30, 0x80000

    :goto_c
    or-int v4, v4, v30

    goto :goto_d

    :cond_13
    move-object/from16 v14, p6

    :goto_d
    and-int/lit16 v15, v2, 0x80

    const/high16 v31, 0xc00000

    if-eqz v15, :cond_14

    or-int v4, v4, v31

    move-object/from16 v0, p7

    goto :goto_f

    :cond_14
    and-int v31, v0, v31

    if-nez v31, :cond_16

    move-object/from16 v0, p7

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_15

    const/high16 v31, 0x800000

    goto :goto_e

    :cond_15
    const/high16 v31, 0x400000

    :goto_e
    or-int v4, v4, v31

    goto :goto_f

    :cond_16
    move-object/from16 v0, p7

    :goto_f
    and-int/lit16 v0, v2, 0x100

    const/high16 v31, 0x6000000

    if-eqz v0, :cond_17

    or-int v4, v4, v31

    move/from16 v31, v0

    move/from16 v0, p8

    goto :goto_11

    :cond_17
    and-int v31, p18, v31

    if-nez v31, :cond_19

    move/from16 v31, v0

    move/from16 v0, p8

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v32

    if-eqz v32, :cond_18

    const/high16 v32, 0x4000000

    goto :goto_10

    :cond_18
    const/high16 v32, 0x2000000

    :goto_10
    or-int v4, v4, v32

    goto :goto_11

    :cond_19
    move/from16 v31, v0

    move/from16 v0, p8

    :goto_11
    and-int/lit16 v0, v2, 0x200

    const/high16 v32, 0x30000000

    if-eqz v0, :cond_1a

    or-int v4, v4, v32

    move/from16 v32, v0

    move-object/from16 v0, p9

    goto :goto_13

    :cond_1a
    and-int v32, p18, v32

    if-nez v32, :cond_1c

    move/from16 v32, v0

    move-object/from16 v0, p9

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1b

    const/high16 v33, 0x20000000

    goto :goto_12

    :cond_1b
    const/high16 v33, 0x10000000

    :goto_12
    or-int v4, v4, v33

    goto :goto_13

    :cond_1c
    move/from16 v32, v0

    move-object/from16 v0, p9

    :goto_13
    and-int/lit8 v33, v1, 0x6

    if-nez v33, :cond_1f

    and-int/lit16 v0, v2, 0x400

    if-nez v0, :cond_1d

    move/from16 v0, p10

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v33

    if-eqz v33, :cond_1e

    const/16 v16, 0x4

    goto :goto_14

    :cond_1d
    move/from16 v0, p10

    :cond_1e
    const/16 v16, 0x2

    :goto_14
    or-int v5, v5, v16

    goto :goto_15

    :cond_1f
    move/from16 v0, p10

    :goto_15
    and-int/lit16 v0, v2, 0x800

    if-eqz v0, :cond_20

    or-int/lit8 v5, v5, 0x30

    move/from16 v16, v0

    move/from16 v0, p11

    goto :goto_17

    :cond_20
    and-int/lit8 v16, v1, 0x30

    if-nez v16, :cond_22

    move/from16 v16, v0

    move/from16 v0, p11

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(C)Z

    move-result v33

    if-eqz v33, :cond_21

    const/16 v22, 0x20

    goto :goto_16

    :cond_21
    const/16 v22, 0x10

    :goto_16
    or-int v5, v5, v22

    goto :goto_17

    :cond_22
    move/from16 v16, v0

    move/from16 v0, p11

    :goto_17
    and-int/lit16 v0, v2, 0x1000

    if-eqz v0, :cond_23

    or-int/lit16 v5, v5, 0x180

    move/from16 v22, v0

    move-object/from16 v0, p12

    goto :goto_19

    :cond_23
    move/from16 v22, v0

    and-int/lit16 v0, v1, 0x180

    if-nez v0, :cond_25

    move-object/from16 v0, p12

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_24

    const/16 v29, 0x100

    goto :goto_18

    :cond_24
    const/16 v29, 0x80

    :goto_18
    or-int v5, v5, v29

    goto :goto_19

    :cond_25
    move-object/from16 v0, p12

    :goto_19
    and-int/lit16 v0, v2, 0x2000

    if-eqz v0, :cond_26

    or-int/lit16 v5, v5, 0xc00

    move/from16 v26, v0

    move-object/from16 v0, p13

    goto :goto_1b

    :cond_26
    move/from16 v26, v0

    and-int/lit16 v0, v1, 0xc00

    if-nez v0, :cond_28

    move-object/from16 v0, p13

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_27

    goto :goto_1a

    :cond_27
    move/from16 v17, v18

    :goto_1a
    or-int v5, v5, v17

    goto :goto_1b

    :cond_28
    move-object/from16 v0, p13

    :goto_1b
    and-int/lit16 v0, v1, 0x6000

    if-nez v0, :cond_2b

    and-int/lit16 v0, v2, 0x4000

    if-nez v0, :cond_29

    move-object/from16 v0, p14

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2a

    move/from16 v20, v21

    goto :goto_1c

    :cond_29
    move-object/from16 v0, p14

    :cond_2a
    :goto_1c
    or-int v5, v5, v20

    goto :goto_1d

    :cond_2b
    move-object/from16 v0, p14

    :goto_1d
    and-int v17, v1, v25

    const v18, 0x8000

    if-nez v17, :cond_2e

    and-int v17, v2, v18

    if-nez v17, :cond_2c

    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .local p17, "$dirty1":I
    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2d

    const/high16 v17, 0x20000

    goto :goto_1e

    .end local p17    # "$dirty1":I
    .restart local v5    # "$dirty1":I
    :cond_2c
    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .restart local p17    # "$dirty1":I
    :cond_2d
    move/from16 v17, v24

    :goto_1e
    or-int v17, p17, v17

    .end local p17    # "$dirty1":I
    .local v17, "$dirty1":I
    goto :goto_1f

    .end local v17    # "$dirty1":I
    .restart local v5    # "$dirty1":I
    :cond_2e
    move/from16 p17, v5

    move-object/from16 v5, p15

    .end local v5    # "$dirty1":I
    .restart local p17    # "$dirty1":I
    move/from16 v17, p17

    .end local p17    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    :goto_1f
    and-int v52, v2, v24

    if-eqz v52, :cond_2f

    or-int v17, v17, v28

    move-object/from16 v5, p16

    goto :goto_21

    :cond_2f
    and-int v20, v1, v28

    if-nez v20, :cond_31

    move-object/from16 v5, p16

    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_30

    const/high16 v20, 0x100000

    goto :goto_20

    :cond_30
    const/high16 v20, 0x80000

    :goto_20
    or-int v17, v17, v20

    goto :goto_21

    :cond_31
    move-object/from16 v5, p16

    :goto_21
    const v20, 0x12492493

    and-int v0, v4, v20

    const v1, 0x12492492

    const/16 v53, 0x1

    if-ne v0, v1, :cond_33

    const v0, 0x92493

    and-int v0, v17, v0

    const v1, 0x92492

    if-eq v0, v1, :cond_32

    goto :goto_22

    :cond_32
    const/4 v0, 0x0

    goto :goto_23

    :cond_33
    :goto_22
    move/from16 v0, v53

    :goto_23
    and-int/lit8 v1, v4, 0x1

    invoke-interface {v3, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "107@6345L7,118@6948L14,119@7012L17"

    invoke-static {v3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p18, 0x1

    if-eqz v0, :cond_39

    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_34

    goto/16 :goto_24

    .line 104
    :cond_34
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, v2, 0x8

    if-eqz v0, :cond_35

    and-int/lit16 v4, v4, -0x1c01

    :cond_35
    and-int/lit16 v0, v2, 0x400

    if-eqz v0, :cond_36

    and-int/lit8 v17, v17, -0xf

    :cond_36
    and-int/lit16 v0, v2, 0x4000

    if-eqz v0, :cond_37

    const v0, -0xe001

    and-int v17, v17, v0

    :cond_37
    and-int v0, v2, v18

    if-eqz v0, :cond_38

    const v0, -0x70001

    and-int v0, v17, v0

    move-object/from16 v58, p7

    move/from16 v59, p8

    move/from16 v16, p10

    move/from16 v17, p11

    move-object/from16 v64, p13

    move-object/from16 v65, p14

    move-object v1, v5

    move v6, v7

    move-object/from16 v55, v10

    move-object/from16 v10, p12

    move v7, v0

    move v5, v4

    move-object v0, v8

    move-object/from16 v8, p9

    move-object v4, v3

    move-object/from16 v3, p15

    .end local v17    # "$dirty1":I
    .local v0, "$dirty1":I
    goto/16 :goto_34

    .end local v0    # "$dirty1":I
    .restart local v17    # "$dirty1":I
    :cond_38
    move-object/from16 v58, p7

    move/from16 v59, p8

    move/from16 v16, p10

    move-object/from16 v64, p13

    move-object/from16 v65, p14

    move-object v1, v5

    move v6, v7

    move-object v0, v8

    move-object/from16 v55, v10

    move/from16 v7, v17

    move-object/from16 v8, p9

    move/from16 v17, p11

    move-object/from16 v10, p12

    move v5, v4

    move-object v4, v3

    move-object/from16 v3, p15

    goto/16 :goto_34

    .line 122
    :cond_39
    :goto_24
    if-eqz v9, :cond_3a

    .line 106
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_25

    .line 122
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_3a
    move-object v0, v12

    .line 106
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_25
    if-eqz v13, :cond_3b

    .line 107
    const/4 v7, 0x1

    move/from16 v54, v7

    .end local p2    # "enabled":Z
    .local v7, "enabled":Z
    goto :goto_26

    .line 106
    .end local v7    # "enabled":Z
    .restart local p2    # "enabled":Z
    :cond_3b
    move/from16 v54, v7

    .line 107
    .end local p2    # "enabled":Z
    .local v54, "enabled":Z
    :goto_26
    and-int/lit8 v7, v2, 0x8

    if-eqz v7, :cond_3c

    .line 108
    invoke-static {}, Landroidx/compose/material/TextKt;->getLocalTextStyle()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v7

    check-cast v7, Landroidx/compose/runtime/CompositionLocal;

    .local v7, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v9, 0x6

    .local v9, "$changed$iv":I
    move-object v12, v3

    .local v12, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 310
    .local v13, "$i$f$getCurrent":I
    const v1, 0x789c5f52

    move-object/from16 p1, v0

    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    const-string v0, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v12, v1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v12, v7}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .end local v7    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v9    # "$changed$iv":I
    .end local v12    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$getCurrent":I
    check-cast v0, Landroidx/compose/ui/text/TextStyle;

    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v0, "textStyle":Landroidx/compose/ui/text/TextStyle;
    and-int/lit16 v4, v4, -0x1c01

    move v1, v4

    goto :goto_27

    .line 107
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    :cond_3c
    move-object/from16 p1, v0

    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    move-object v0, v8

    move v1, v4

    .line 310
    .end local v4    # "$dirty":I
    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v0, "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v1, "$dirty":I
    :goto_27
    if-eqz v19, :cond_3d

    .line 109
    const/4 v4, 0x0

    move-object/from16 v55, v4

    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .local v4, "label":Lkotlin/jvm/functions/Function2;
    goto :goto_28

    .line 310
    .end local v4    # "label":Lkotlin/jvm/functions/Function2;
    .restart local p4    # "label":Lkotlin/jvm/functions/Function2;
    :cond_3d
    move-object/from16 v55, v10

    .line 109
    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .local v55, "label":Lkotlin/jvm/functions/Function2;
    :goto_28
    if-eqz v23, :cond_3e

    .line 110
    const/4 v4, 0x0

    move-object/from16 v56, v4

    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local v4, "placeholder":Lkotlin/jvm/functions/Function2;
    goto :goto_29

    .line 109
    .end local v4    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    :cond_3e
    move-object/from16 v56, v11

    .line 110
    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .local v56, "placeholder":Lkotlin/jvm/functions/Function2;
    :goto_29
    if-eqz v27, :cond_3f

    .line 111
    const/4 v4, 0x0

    move-object/from16 v57, v4

    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "leadingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_2a

    .line 110
    .end local v4    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    :cond_3f
    move-object/from16 v57, v14

    .line 111
    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v57, "leadingIcon":Lkotlin/jvm/functions/Function2;
    :goto_2a
    if-eqz v15, :cond_40

    .line 112
    const/4 v4, 0x0

    move-object/from16 v58, v4

    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v4, "trailingIcon":Lkotlin/jvm/functions/Function2;
    goto :goto_2b

    .line 111
    .end local v4    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    :cond_40
    move-object/from16 v58, p7

    .line 112
    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v58, "trailingIcon":Lkotlin/jvm/functions/Function2;
    :goto_2b
    if-eqz v31, :cond_41

    .line 113
    const/4 v4, 0x0

    move/from16 v59, v4

    .end local p8    # "isError":Z
    .local v4, "isError":Z
    goto :goto_2c

    .line 112
    .end local v4    # "isError":Z
    .restart local p8    # "isError":Z
    :cond_41
    move/from16 v59, p8

    .line 113
    .end local p8    # "isError":Z
    .local v59, "isError":Z
    :goto_2c
    if-eqz v32, :cond_42

    .line 114
    const/4 v4, 0x0

    move-object/from16 v60, v4

    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v4, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    goto :goto_2d

    .line 113
    .end local v4    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .restart local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    :cond_42
    move-object/from16 v60, p9

    .line 114
    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v60, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    :goto_2d
    and-int/lit16 v4, v2, 0x400

    if-eqz v4, :cond_43

    .line 115
    sget-object v4, Landroidx/compose/foundation/text/input/TextObfuscationMode;->Companion:Landroidx/compose/foundation/text/input/TextObfuscationMode$Companion;

    invoke-virtual {v4}, Landroidx/compose/foundation/text/input/TextObfuscationMode$Companion;->getRevealLastTyped-vTwcZD0()I

    move-result v4

    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v4, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    and-int/lit8 v17, v17, -0xf

    move/from16 v61, v4

    goto :goto_2e

    .line 114
    .end local v4    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .restart local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    :cond_43
    move/from16 v61, p10

    .line 115
    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v61, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    :goto_2e
    if-eqz v16, :cond_44

    .line 116
    const/16 v4, 0x2022

    move/from16 v62, v4

    .end local p11    # "textObfuscationCharacter":C
    .local v4, "textObfuscationCharacter":C
    goto :goto_2f

    .line 115
    .end local v4    # "textObfuscationCharacter":C
    .restart local p11    # "textObfuscationCharacter":C
    :cond_44
    move/from16 v62, p11

    .line 116
    .end local p11    # "textObfuscationCharacter":C
    .local v62, "textObfuscationCharacter":C
    :goto_2f
    if-eqz v22, :cond_45

    .line 117
    sget-object v4, Landroidx/compose/material/SecureTextFieldKt;->SecureTextFieldKeyboardOptions:Landroidx/compose/foundation/text/KeyboardOptions;

    move-object/from16 v63, v4

    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v4, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    goto :goto_30

    .line 116
    .end local v4    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .restart local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    :cond_45
    move-object/from16 v63, p12

    .line 117
    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v63, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    :goto_30
    if-eqz v26, :cond_46

    .line 118
    const/4 v4, 0x0

    move-object/from16 v64, v4

    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v4, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    goto :goto_31

    .line 117
    .end local v4    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .restart local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    :cond_46
    move-object/from16 v64, p13

    .line 118
    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v64, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    :goto_31
    and-int/lit16 v4, v2, 0x4000

    if-eqz v4, :cond_47

    .line 119
    sget-object v4, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    const/4 v7, 0x6

    invoke-virtual {v4, v3, v7}, Landroidx/compose/material/TextFieldDefaults;->getTextFieldShape(Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/graphics/Shape;

    move-result-object v4

    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v4, "shape":Landroidx/compose/ui/graphics/Shape;
    const v7, -0xe001

    and-int v17, v17, v7

    move-object/from16 v65, v4

    move/from16 v66, v17

    goto :goto_32

    .line 118
    .end local v4    # "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    :cond_47
    move-object/from16 v65, p14

    move/from16 v66, v17

    .line 119
    .end local v17    # "$dirty1":I
    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local v65, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v66, "$dirty1":I
    :goto_32
    and-int v4, v2, v18

    if-eqz v4, :cond_48

    .line 120
    sget-object v4, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    const/16 v50, 0x30

    const v51, 0x1fffff

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const-wide/16 v21, 0x0

    const-wide/16 v23, 0x0

    const-wide/16 v25, 0x0

    const-wide/16 v27, 0x0

    const-wide/16 v29, 0x0

    const-wide/16 v31, 0x0

    const-wide/16 v33, 0x0

    const-wide/16 v35, 0x0

    const-wide/16 v37, 0x0

    const-wide/16 v39, 0x0

    const-wide/16 v41, 0x0

    const-wide/16 v43, 0x0

    const-wide/16 v45, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    move-object/from16 v47, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v47, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v4 .. v51}, Landroidx/compose/material/TextFieldDefaults;->textFieldColors-dx8h9Zs(JJJJJJJJJJJJJJJJJJJJJLandroidx/compose/runtime/Composer;IIII)Landroidx/compose/material/TextFieldColors;

    move-result-object v3

    move-object/from16 v4, v47

    .end local v47    # "$composer":Landroidx/compose/runtime/Composer;
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v3, "colors":Landroidx/compose/material/TextFieldColors;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const v5, -0x70001

    and-int v66, v66, v5

    goto :goto_33

    .line 119
    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    .restart local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    :cond_48
    move-object v4, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    move-object/from16 v3, p15

    .line 120
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v3, "colors":Landroidx/compose/material/TextFieldColors;
    :goto_33
    if-eqz v52, :cond_49

    .line 121
    const/4 v5, 0x0

    move-object v6, v5

    move v5, v1

    move-object v1, v6

    move-object/from16 v12, p1

    move/from16 v6, v54

    move-object/from16 v11, v56

    move-object/from16 v14, v57

    move-object/from16 v8, v60

    move/from16 v16, v61

    move/from16 v17, v62

    move-object/from16 v10, v63

    move/from16 v7, v66

    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v5, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    goto :goto_34

    .line 120
    .end local v5    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_49
    move-object/from16 v12, p1

    move v5, v1

    move/from16 v6, v54

    move-object/from16 v11, v56

    move-object/from16 v14, v57

    move-object/from16 v8, v60

    move/from16 v16, v61

    move/from16 v17, v62

    move-object/from16 v10, v63

    move/from16 v7, v66

    move-object/from16 v1, p16

    .line 104
    .end local v54    # "enabled":Z
    .end local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v60    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local v61    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local v62    # "textObfuscationCharacter":C
    .end local v63    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v66    # "$dirty1":I
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v1, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v5, "$dirty":I
    .local v6, "enabled":Z
    .local v7, "$dirty1":I
    .local v8, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v10, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v11, "placeholder":Lkotlin/jvm/functions/Function2;
    .local v12, "modifier":Landroidx/compose/ui/Modifier;
    .local v14, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v16, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v17, "textObfuscationCharacter":C
    :goto_34
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v9

    if-eqz v9, :cond_4a

    const v9, -0x1267fdd6

    const-string v13, "androidx.compose.material.SecureTextField (SecureTextField.kt:121)"

    invoke-static {v9, v5, v7, v13}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 124
    :cond_4a
    if-nez v1, :cond_4c

    const v9, 0xc72b791

    invoke-interface {v4, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v9, "123@7173L39"

    invoke-static {v4, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    const v9, -0x185f656f

    const-string v13, "CC(remember):SecureTextField.kt#9igjgp"

    invoke-static {v4, v9, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v9, 0x0

    .local v9, "invalid$iv":Z
    move-object v13, v4

    .local v13, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v15, 0x0

    .line 311
    .local v15, "$i$f$cache":I
    move-object/from16 p12, v1

    .end local v1    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local p12, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 312
    .local v18, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_4b

    .line 313
    const/4 v2, 0x0

    .line 124
    .local v2, "$i$a$-cache-SecureTextFieldKt$SecureTextField$interactionSource$1":I
    invoke-static {}, Landroidx/compose/foundation/interaction/InteractionSourceKt;->MutableInteractionSource()Landroidx/compose/foundation/interaction/MutableInteractionSource;

    move-result-object v2

    .line 313
    .end local v2    # "$i$a$-cache-SecureTextFieldKt$SecureTextField$interactionSource$1":I
    nop

    .line 314
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v13, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 315
    move-object v1, v2

    .end local v2    # "value$iv":Ljava/lang/Object;
    goto :goto_35

    .line 316
    :cond_4b
    nop

    .line 311
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v18    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_35
    nop

    .line 124
    .end local v9    # "invalid$iv":Z
    .end local v13    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v15    # "$i$f$cache":I
    check-cast v1, Landroidx/compose/foundation/interaction/MutableInteractionSource;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object v13, v1

    goto :goto_36

    .end local p12    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v1, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_4c
    move-object/from16 p12, v1

    .end local v1    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p12    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    const v1, -0x185f67fa

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object/from16 v13, p12

    .local v13, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :goto_36
    const v1, -0x185f5188

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "*125@7352L18"

    invoke-static {v4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 126
    invoke-virtual {v0}, Landroidx/compose/ui/text/TextStyle;->getColor-0d7_KjU()J

    move-result-wide v1

    .local v1, "$this$takeOrElse_u2dDxMtmZc$iv":J
    const/4 v9, 0x0

    .line 317
    .local v9, "$i$f$takeOrElse-DxMtmZc":I
    move-wide/from16 v18, v1

    .local v18, "$this$isSpecified$iv$iv":J
    const/4 v15, 0x0

    .line 318
    .local v15, "$i$f$isSpecified-8_81llA":I
    const-wide/16 v20, 0x10

    cmp-long v20, v18, v20

    if-eqz v20, :cond_4d

    goto :goto_37

    :cond_4d
    const/16 v53, 0x0

    .line 317
    .end local v15    # "$i$f$isSpecified-8_81llA":I
    .end local v18    # "$this$isSpecified$iv$iv":J
    :goto_37
    if-eqz v53, :cond_4e

    goto :goto_38

    :cond_4e
    const/4 v15, 0x0

    .line 126
    .local v15, "$i$a$-takeOrElse-DxMtmZc-SecureTextFieldKt$SecureTextField$textColor$1":I
    shr-int/lit8 v18, v5, 0x6

    and-int/lit8 v18, v18, 0xe

    shr-int/lit8 v19, v7, 0xc

    and-int/lit8 v19, v19, 0x70

    move-wide/from16 p1, v1

    .end local v1    # "$this$takeOrElse_u2dDxMtmZc$iv":J
    .local p1, "$this$takeOrElse_u2dDxMtmZc$iv":J
    or-int v1, v18, v19

    invoke-interface {v3, v6, v4, v1}, Landroidx/compose/material/TextFieldColors;->textColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v1

    invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/compose/ui/graphics/Color;

    invoke-virtual {v1}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v1

    .line 317
    .end local v15    # "$i$a$-takeOrElse-DxMtmZc-SecureTextFieldKt$SecureTextField$textColor$1":I
    nop

    .line 126
    .end local v9    # "$i$f$takeOrElse-DxMtmZc":I
    .end local p1    # "$this$takeOrElse_u2dDxMtmZc$iv":J
    :goto_38
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-wide/from16 v19, v1

    .line 127
    .local v19, "textColor":J
    new-instance v18, Landroidx/compose/ui/text/TextStyle;

    const v48, 0xfffffe

    const/16 v49, 0x0

    const-wide/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const-wide/16 v28, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const-wide/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const-wide/16 v40, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const/16 v45, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    invoke-direct/range {v18 .. v49}, Landroidx/compose/ui/text/TextStyle;-><init>(JJLandroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontSynthesis;Landroidx/compose/ui/text/font/FontFamily;Ljava/lang/String;JLandroidx/compose/ui/text/style/BaselineShift;Landroidx/compose/ui/text/style/TextGeometricTransform;Landroidx/compose/ui/text/intl/LocaleList;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/graphics/Shadow;Landroidx/compose/ui/graphics/drawscope/DrawStyle;IIJLandroidx/compose/ui/text/style/TextIndent;Landroidx/compose/ui/text/PlatformTextStyle;Landroidx/compose/ui/text/style/LineHeightStyle;IILandroidx/compose/ui/text/style/TextMotion;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v9, v18

    .end local v19    # "textColor":J
    .local v1, "textColor":J
    invoke-virtual {v0, v9}, Landroidx/compose/ui/text/TextStyle;->merge(Landroidx/compose/ui/text/TextStyle;)Landroidx/compose/ui/text/TextStyle;

    move-result-object v9

    .line 132
    .local v9, "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    sget-object v15, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    .line 133
    move-object/from16 v18, v13

    check-cast v18, Landroidx/compose/foundation/interaction/InteractionSource;

    const/16 v19, 0x30

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 p7, v3

    move/from16 p4, v6

    move-object/from16 p3, v12

    move-object/from16 p2, v15

    move-object/from16 p6, v18

    move/from16 p10, v19

    move-object/from16 p11, v20

    move/from16 p8, v21

    move/from16 p9, v22

    move/from16 p5, v59

    .end local v3    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local v6    # "enabled":Z
    .end local v12    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v59    # "isError":Z
    .local p3, "modifier":Landroidx/compose/ui/Modifier;
    .local p4, "enabled":Z
    .local p5, "isError":Z
    .local p7, "colors":Landroidx/compose/material/TextFieldColors;
    invoke-static/range {p2 .. p11}, Landroidx/compose/material/TextFieldDefaults;->indicatorLine-gv0btCI$default(Landroidx/compose/material/TextFieldDefaults;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/interaction/InteractionSource;Landroidx/compose/material/TextFieldColors;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 134
    move-object/from16 v22, p3

    move/from16 v54, p4

    move/from16 v12, p5

    move-object/from16 v6, p7

    .end local p3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p4    # "enabled":Z
    .end local p5    # "isError":Z
    .end local p7    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v6, "colors":Landroidx/compose/material/TextFieldColors;
    .local v12, "isError":Z
    .local v22, "modifier":Landroidx/compose/ui/Modifier;
    .restart local v54    # "enabled":Z
    sget-object v15, Landroidx/compose/material/Strings;->Companion:Landroidx/compose/material/Strings$Companion;

    invoke-virtual {v15}, Landroidx/compose/material/Strings$Companion;->getDefaultErrorMessage-UdPEhr4()I

    move-result v15

    move-object/from16 p13, v0

    const/4 v0, 0x6

    .end local v0    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local p13, "textStyle":Landroidx/compose/ui/text/TextStyle;
    invoke-static {v15, v4, v0}, Landroidx/compose/material/Strings_androidKt;->getString-4foXLRw(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v12, v0}, Landroidx/compose/material/TextFieldImplKt;->defaultErrorSemantics(Landroidx/compose/ui/Modifier;ZLjava/lang/String;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 136
    sget-object v3, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    invoke-virtual {v3}, Landroidx/compose/material/TextFieldDefaults;->getMinWidth-D9Ej5fM()F

    move-result v3

    .line 137
    sget-object v15, Landroidx/compose/material/TextFieldDefaults;->INSTANCE:Landroidx/compose/material/TextFieldDefaults;

    invoke-virtual {v15}, Landroidx/compose/material/TextFieldDefaults;->getMinHeight-D9Ej5fM()F

    move-result v15

    .line 135
    invoke-static {v0, v3, v15}, Landroidx/compose/foundation/layout/SizeKt;->defaultMinSize-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 141
    new-instance v3, Landroidx/compose/ui/graphics/SolidColor;

    shr-int/lit8 v15, v5, 0x18

    and-int/lit8 v15, v15, 0xe

    shr-int/lit8 v18, v7, 0xc

    and-int/lit8 v18, v18, 0x70

    or-int v15, v15, v18

    invoke-interface {v6, v12, v4, v15}, Landroidx/compose/material/TextFieldColors;->cursorColor(ZLandroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v15

    invoke-interface {v15}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/compose/ui/graphics/Color;

    move-object/from16 p16, v0

    move-wide/from16 p14, v1

    .end local v1    # "textColor":J
    .local p14, "textColor":J
    invoke-virtual {v15}, Landroidx/compose/ui/graphics/Color;->unbox-impl()J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-direct {v3, v0, v1, v2}, Landroidx/compose/ui/graphics/SolidColor;-><init>(JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 148
    new-instance v0, Landroidx/compose/material/SecureTextFieldKt$SecureTextField$1;

    move-object/from16 p2, p0

    move-object/from16 p1, v0

    move-object/from16 p11, v6

    move-object/from16 p7, v11

    move-object/from16 p4, v13

    move-object/from16 p8, v14

    move/from16 p3, v54

    move-object/from16 p6, v55

    move-object/from16 p9, v58

    move-object/from16 p10, v65

    .end local v6    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local v11    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local v12    # "isError":Z
    .end local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local v14    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v54    # "enabled":Z
    .end local v55    # "label":Lkotlin/jvm/functions/Function2;
    .end local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    .local p3, "enabled":Z
    .local p4, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local p5    # "isError":Z
    .local p6, "label":Lkotlin/jvm/functions/Function2;
    .local p7, "placeholder":Lkotlin/jvm/functions/Function2;
    .local p8, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p9, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p10, "shape":Landroidx/compose/ui/graphics/Shape;
    .local p11, "colors":Landroidx/compose/material/TextFieldColors;
    invoke-direct/range {p1 .. p11}, Landroidx/compose/material/SecureTextFieldKt$SecureTextField$1;-><init>(Landroidx/compose/foundation/text/input/TextFieldState;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;ZLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;)V

    move-object/from16 v1, p1

    move-object/from16 v56, p7

    move-object/from16 v57, p8

    move-object/from16 v0, p11

    .end local p3    # "enabled":Z
    .end local p4    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p5    # "isError":Z
    .end local p6    # "label":Lkotlin/jvm/functions/Function2;
    .end local p7    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local p8    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p9    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local p10    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p11    # "colors":Landroidx/compose/material/TextFieldColors;
    .local v0, "colors":Landroidx/compose/material/TextFieldColors;
    .restart local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .restart local v54    # "enabled":Z
    .restart local v55    # "label":Lkotlin/jvm/functions/Function2;
    .restart local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .restart local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .restart local v59    # "isError":Z
    .restart local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    move-object v15, v1

    check-cast v15, Landroidx/compose/foundation/text/input/TextFieldDecorator;

    .line 130
    nop

    .line 135
    nop

    .line 139
    nop

    .line 142
    nop

    .line 140
    nop

    .line 145
    nop

    .line 146
    nop

    .line 147
    nop

    .line 141
    move-object v14, v3

    check-cast v14, Landroidx/compose/ui/graphics/Brush;

    .line 148
    nop

    .line 143
    nop

    .line 144
    and-int/lit8 v1, v5, 0xe

    and-int/lit16 v2, v5, 0x380

    or-int/2addr v1, v2

    shr-int/lit8 v2, v5, 0xf

    const v3, 0xe000

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    shl-int/lit8 v2, v7, 0xc

    const/high16 v3, 0x380000

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    const/high16 v2, 0x1c00000

    shl-int/lit8 v3, v7, 0xc

    and-int/2addr v2, v3

    or-int v19, v1, v2

    shl-int/lit8 v1, v7, 0x6

    and-int/lit16 v1, v1, 0x380

    shl-int/lit8 v2, v7, 0x6

    and-int/lit16 v2, v2, 0x1c00

    or-int v20, v1, v2

    .line 129
    move/from16 v66, v7

    .end local v7    # "$dirty1":I
    .restart local v66    # "$dirty1":I
    const/4 v7, 0x0

    const/4 v12, 0x0

    const/16 v21, 0x108

    move-object/from16 v18, v4

    move v1, v5

    move/from16 v6, v54

    move-object/from16 v11, v64

    move-object/from16 v4, p0

    move-object/from16 v5, p16

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v5    # "$dirty":I
    .end local v54    # "enabled":Z
    .end local v64    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v1, "$dirty":I
    .local v6, "enabled":Z
    .local v11, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v18, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v4 .. v21}, Landroidx/compose/foundation/text/BasicSecureTextFieldKt;->BasicSecureTextField-egD4TGM(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/TextFieldDecorator;ICLandroidx/compose/runtime/Composer;III)V

    move-object/from16 v47, v18

    .end local v6    # "enabled":Z
    .end local v18    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v47    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v54    # "enabled":Z
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_4f

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 166
    .end local v9    # "mergedTextStyle":Landroidx/compose/ui/text/TextStyle;
    .end local v13    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .end local p14    # "textColor":J
    :cond_4f
    move-object/from16 v4, p13

    move/from16 v21, v1

    move-object v13, v10

    move-object v14, v11

    move/from16 v11, v16

    move/from16 v12, v17

    move-object/from16 v2, v22

    move/from16 v3, v54

    move-object/from16 v5, v55

    move-object/from16 v6, v56

    move-object/from16 v7, v57

    move/from16 v9, v59

    move-object/from16 v15, v65

    move-object/from16 v17, p12

    move-object/from16 v16, v0

    move-object v10, v8

    move-object/from16 v8, v58

    goto :goto_39

    .line 104
    .end local v0    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local v1    # "$dirty":I
    .end local v8    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local v10    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local v11    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .end local v16    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local v22    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v47    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v54    # "enabled":Z
    .end local v55    # "label":Lkotlin/jvm/functions/Function2;
    .end local v56    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local v57    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local v58    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local v59    # "isError":Z
    .end local v65    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local v66    # "$dirty1":I
    .local v3, "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$dirty":I
    .local v17, "$dirty1":I
    .local p1, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "enabled":Z
    .local p3, "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local p4, "label":Lkotlin/jvm/functions/Function2;
    .local p5, "placeholder":Lkotlin/jvm/functions/Function2;
    .local p6, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local p7, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local p8, "isError":Z
    .local p9, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local p10, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local p11, "textObfuscationCharacter":C
    .local p12, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local p13, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local p14, "shape":Landroidx/compose/ui/graphics/Shape;
    .restart local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .restart local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    :cond_50
    move-object/from16 v47, v3

    .end local v3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v47    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v47 .. v47}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move/from16 v9, p8

    move-object/from16 v13, p12

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move/from16 v21, v4

    move v3, v7

    move-object v4, v8

    move-object v5, v10

    move-object v6, v11

    move-object v2, v12

    move-object v7, v14

    move/from16 v66, v17

    move-object/from16 v8, p7

    move-object/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v14, p13

    move-object/from16 v17, p16

    .line 166
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "enabled":Z
    .end local p3    # "textStyle":Landroidx/compose/ui/text/TextStyle;
    .end local p4    # "label":Lkotlin/jvm/functions/Function2;
    .end local p5    # "placeholder":Lkotlin/jvm/functions/Function2;
    .end local p6    # "leadingIcon":Lkotlin/jvm/functions/Function2;
    .end local p7    # "trailingIcon":Lkotlin/jvm/functions/Function2;
    .end local p8    # "isError":Z
    .end local p9    # "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .end local p10    # "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .end local p11    # "textObfuscationCharacter":C
    .end local p12    # "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .end local p13    # "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .end local p14    # "shape":Landroidx/compose/ui/graphics/Shape;
    .end local p15    # "colors":Landroidx/compose/material/TextFieldColors;
    .end local p16    # "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "enabled":Z
    .local v4, "textStyle":Landroidx/compose/ui/text/TextStyle;
    .local v5, "label":Lkotlin/jvm/functions/Function2;
    .local v6, "placeholder":Lkotlin/jvm/functions/Function2;
    .local v7, "leadingIcon":Lkotlin/jvm/functions/Function2;
    .local v8, "trailingIcon":Lkotlin/jvm/functions/Function2;
    .local v9, "isError":Z
    .local v10, "inputTransformation":Landroidx/compose/foundation/text/input/InputTransformation;
    .local v11, "$v$c$androidx-compose-foundation-text-input-TextObfuscationMode$-textObfuscationMode$0":I
    .local v12, "textObfuscationCharacter":C
    .local v13, "keyboardOptions":Landroidx/compose/foundation/text/KeyboardOptions;
    .local v14, "onKeyboardAction":Landroidx/compose/foundation/text/input/KeyboardActionHandler;
    .local v15, "shape":Landroidx/compose/ui/graphics/Shape;
    .local v16, "colors":Landroidx/compose/material/TextFieldColors;
    .local v17, "interactionSource":Landroidx/compose/foundation/interaction/MutableInteractionSource;
    .local v21, "$dirty":I
    .restart local v66    # "$dirty1":I
    :goto_39
    invoke-interface/range {v47 .. v47}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-eqz v0, :cond_51

    move-object v1, v0

    new-instance v0, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda0;

    move/from16 v18, p18

    move/from16 v19, p19

    move/from16 v20, p20

    move-object/from16 v67, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v20}, Landroidx/compose/material/SecureTextFieldKt$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;III)V

    move-object/from16 v1, v67

    invoke-interface {v1, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_51
    return-void
.end method

.method private static final SecureTextField_0vce7ms$lambda$2(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;IIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 22

    or-int/lit8 v0, p17, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v19

    invoke-static/range {p18 .. p18}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move-object/from16 v17, p16

    move/from16 v21, p19

    move-object/from16 v18, p20

    invoke-static/range {v1 .. v21}, Landroidx/compose/material/SecureTextFieldKt;->SecureTextField-0vce7ms(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/foundation/text/input/InputTransformation;ICLandroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material/TextFieldColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;III)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
