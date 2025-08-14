---
description: List and update outdated NuGet packages in .NET projects
---

Update outdated NuGet packages in the current directory.

## Steps

1. **List outdated packages** (including transitive)
   ```bash
   dotnet package list --outdated --include-transitive --format json
   ```

2. **Parse the JSON output** to extract:
   - Project paths that have outdated packages
   - Package name, current version, latest version per project
   - Whether each package is **direct** or **transitive**

3. **Display summary table** showing:
   - Project name
   - Package name (marked as `[T]` if transitive)
   - Current version → Latest version

4. **If no outdated packages found**, inform the user and stop.

5. **Analyze project dependencies**
   - Read each .csproj identified from the package list output
   - Check for `<ProjectReference>` elements to build dependency graph
   - Determine update order: leaf projects first, then dependents

6. **Ask the user** which packages to update:
   - All packages
   - Specific packages by name
   - Cancel

7. **Update packages per project** with `--project` parameter:
   - Independent projects: update in parallel
   - Dependent projects: update in dependency order (leaves first)
   ```bash
   dotnet package update <package-name> --project <path-to-csproj>
   ```

8. **Run a build** to verify no breaking changes:
   ```bash
   dotnet build
   ```

9. **If build fails**, ask the user:
   - **Fix automatically**: Review the build errors, identify breaking changes from package updates, and attempt to fix them
   - **Fix manually**: Show the errors and let the user handle it

10. **Report results** - summarize what was updated and the final build status.

## Dependency Order

Projects with `<ProjectReference>` depend on other projects. Update order:
1. Parse ProjectReferences from each csproj
2. Topologically sort: update projects with no dependencies first
3. Then update projects that depend on already-updated projects
4. Independent branches can run in parallel

## Transitive vs Direct Packages

- **Direct packages**: Explicitly referenced in csproj via `<PackageReference>`. Can be updated directly.
- **Transitive packages**: Pulled in as dependencies of direct packages. Marked with `[T]` in output.

When updating transitive packages:
- Warn user that updating a transitive package may require updating its parent package
- Check which direct package pulls in the transitive dependency
- Suggest updating the parent package instead, or adding a direct reference if pinning is needed

## Error Handling

- If `dotnet package list` fails, check if we're in a .NET project directory
- If `dotnet package update` fails for a specific package, report it and continue with others
- If the build fails after updates:
  1. Parse the build errors
  2. Ask user: "Fix automatically" or "Fix manually"
  3. If automatic: analyze errors, identify API changes from updated packages, apply fixes
  4. Re-run build after fixes to verify
