# Fontconfig and Noto Color Emoji

This is not strictly a dotfile config but I have to fix it so often that it migh
as well be here: The color emoji support in linuz sucks so bad that it makes
everything invisible if you have Noto Color Emoji installed, unless you use this
lovely XML-based configuration in `/etc/fonts.conf.d/`:

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
	<match target="font">
		<test name="family" compare="contains">
			<string>Emoji</string>
		</test>
		<edit name="hinting" mode="assign">
			<bool>true</bool>
		</edit>
		<edit name="hintstyle" mode="assign">
			<const>hintslight</const>
		</edit>
		<edit name="embeddedbitmap" mode="assign">
			<bool>true</bool>
		</edit>
	</match>
</fontconfig>
```

This haŕd-to-google solution can be found from [feedesktop bugzilla
bug #104542](https://bugs.freedesktop.org/show_bug.cgi?id=104542).

