#import "@preview/sourcerer:0.2.1": code

= Analyse
== Ist-Zustand
=== Mobile Anwendung
Test:
#figure(
  caption: [Auszug aus der `MainActivity.cs`],
  kind: raw,
  code(
    number-align: right,
    lang: "C#",
    ```cs
    protected override void OnActivityResult([GeneratedEnum] int requestCode, Result resultCode, Intent intent)
    {
        if (resultCode != Result.Ok)
        {
            Log.Warning($"Received non-ok result. (request code: {resultCode}");
            return;
        }

        // Check if we received an image result.
        if (requestCode == CAMERA_REQUEST_CODE)
        {
            Bitmap bmp = (Bitmap)intent.Extras.Get("data");

            Java.IO.File file = Java.IO.File.CreateTempFile("photo", ".png", CacheDir);

            FileStream stream = System.IO.File.OpenWrite(file.AbsolutePath);
            bmp.Compress(Bitmap.CompressFormat.Png, 0, stream);
            stream.Close();

            // [...]
        }

        base.OnActivityResult(requestCode, resultCode, intent);
    }
    ```)
)
=== Web Services
=== Interaktion
== Soll-Zustand
== Handlungsbedarf
Nach voriger Auswertung ergeben sich grob folgende Anforderungen die bearbeitet werden müssen:
- Ananas
- Apfel
- Birne
@buch1

#pagebreak()