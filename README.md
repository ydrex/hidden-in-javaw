# hidden-in-javaw

Windows defender is built around `.exe` files. A `.jar` is not an exe. Java runs it, so task manager shows `java.exe` or `javaw.exe`. You don't see the jar name.

Same kind of program. Two file types. Only the process name changes.

## why defender cares less about jars

Defender is really good at `.exe` and `.dll`. That's most of the malware on windows. It opens the file, looks at the pe header, imports, known families, maybe sandboxes it. The models grew up on that.

A `.jar` is just a zip with `.class` files. Windows doesn't run it. You double click it, `javaw.exe` starts, java loads the bytecode. Task manager says java. Not `sketchy_mod.jar`.

And `javaw.exe` is everywhere. Minecraft, runescape, launchers, intellij. If defender freaked out every time java touched files, nobody would use it. So the host looks fine.

The jar itself doesn't get the same heat. Less signatures, bytecode is a pain to emulate, so a random exe in downloads gets more attention than a random jar next to it.

You can do the same stuff in both. Difference is the exe looks like itself. The jar looks like a game you already play.

Defender can still catch a jar later. It's not magic. It just starts looking at the wrong thing.

That's why a "free modpack" from discord blends in. `javaw.exe` is already on your pc. Didn't get it from modrinth, curseforge, or the actual launcher? Treat it like an exe some random sent you.

## exe vs jar

Download an exe, windows runs that file, task manager shows that exe. Download a jar, java runs it, task manager shows `javaw.exe`. Defender can scan jars. It just doesn't look there first.

If `javaw.exe` is running and you didn't start a game or an ide, check the command line. That's the jar.

## run

```powershell
git clone https://github.com/ydrex/hidden-in-javaw.git
cd hidden-in-javaw

.\examples\runs-as-exe\RunsAsExe.exe
java -jar .\examples\runs-as-java\RunsAsJava.jar
.\tools\Inspect-JavaRuns.ps1
```

Exe and jar are already built. Exe needs .net 8 runtime, jar needs java. `.\build.ps1` if you want to rebuild (.net 8 sdk + jdk 17+).

Sources in `examples/` are tiny.

## license

Mit. See [LICENSE](LICENSE)
