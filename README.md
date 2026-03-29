# iOS application templates

This repository holds **templates for building applications**. Each top-level folder documents the **structure, conventions, and tooling** for a particular kind of app (layout, targets, packages, and how to scaffold or extend it).

## How to use a template

Open the folder you care about. At its **root**, **`TEMPLATE.md`** is the **main instructions** file: follow it as the authoritative guide when generating code, setting up Xcode, or aligning a new project with that template.

Other files in the folder (for example configuration, placeholders, or sample sources) support what `TEMPLATE.md` describes.

If a template includes **`.cursor/rules/`** (for example `ios-2026/.cursor/rules/`), copy that **`.cursor`** directory into the **root of the generated project** so Cursor loads the same rules when you work in the new app repository.
