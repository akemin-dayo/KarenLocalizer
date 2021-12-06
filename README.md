# KarenLocalizer

KarenLocalizer is a library that allows developers to add localization support to their tweaks.

---

## KarenLocalizer setup and usage (assuming you already have the latest version of [Theos](https://github.com/theos/theos))

```
git clone https://github.com/akemin-dayo/KarenLocalizer.git
cd KarenLocalizer/
make setup
```

1. In your project's `Makefile`, add `karenlocalizer` to your `TweakName_LIBRARIES` variable.

1. In your project's `control` file, add `net.angelxwind.karenlocalizer` to the `Depends:` field.

---

## When to use and when NOT to use KarenLocalizer

You can use KarenLocalizer to localize text inside your tweaks. For instance, any UIAlertViews your tweak shows, or text inside your tweak's UIViews, etc.

You *should not* use KarenLocalizer in things that already support localization (UIKit apps, etc.). While there isn't anything *wrong* with doing so, it's just unnecessary.

---

## An example of how to use KarenLocalizer
### `Tweak.xm`
```logos
#import <KarenLocalizer/KarenLocalizer.h>
#import <UIKit/UIKit.h>
KarenLocalizer *karenLocalizer;
%ctor {
	karenLocalizer = [[KarenLocalizer alloc] initWithKarenLocalizerBundle:@"ExampleLocalizedTweak"];
}
%hook SpringBoard
-(void) applicationDidFinishLaunching:(id)arg {
	%orig(arg);
	UIAlertView *exampleAlert = [[UIAlertView alloc] initWithTitle:[karenLocalizer karenLocalizeString:@"LOCALIZED_TITLE"]
		message:[karenLocalizer karenLocalizeString:@"LOCALIZED_MESSAGE"]
		delegate:self
		cancelButtonTitle:[karenLocalizer karenLocalizeString:@"LOCALIZED_BUTTON"]
		otherButtonTitles:nil];
	[exampleAlert show];
}
%end
```

### `Localizable.strings`
With the above example, you'd need to place `Localizable.strings` in `layout/Library/KarenLocalizer/ExampleLocalizedTweak.bundle/Japanese.lproj/Localizable.strings`

```
"LOCALIZED_TITLE" = "タイトル";
"LOCALIZED_MESSAGE" = "メッセージ";
"LOCALIZED_BUTTON" = "ボタン";
```

Note that KarenLocalizer will always look inside `/Library/KarenLocalizer/` for bundles during initialisation.


---

## License

Licensed under the [2-Clause BSD License](https://opensource.org/licenses/BSD-2-Clause).
