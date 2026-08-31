### Morphs Creations Toolbox v5.60

<img width="1983" height="793" alt="f50bf53d-5679-4c5a-8ecf-251d885d18d8" src="https://github.com/user-attachments/assets/a95f4632-0697-4aa1-8901-9b847f5e5269" />

Morphs Creations Toolbox Suite (Windows GUI)

Comprehensive Architectural & Functional Overview

1. Executive Overview & Core Philosophy

The Morphs Creations Toolbox Suite is a unified Windows systems administration,
deployment, and power-user software management environment. Built natively for
Windows 10 and Windows 11 using PowerShell WinForms and compiled via PS2EXE into
a standalone, portable binary, the application serves as an all-in-one
installation, diagnostic, and OS maintenance hub.

  - 100% Free Core Engine: Zero feature gating, zero paywalls on system recovery
    or security diagnostics, and zero telemetry collection.
  - Curated Integrity Standard: Strict single-canonical-version and
    single-architecture policies eliminate redundant duplicates,
    installer/portable clones, and fragile micro-stubs in favor of substantial,
    verified software projects.
  - Dynamic Relative Directory Topology: Self-discovers its execution context
    (whether launched as a raw .ps1 or a compiled .exe) and dynamically
    provisions a structured workspace (\EngineToolbox\ containing \Programs\,
    \Tools\, \Frameworks\, and \RegFiles\).

                         [ EngineToolbox Workspace Root ]
                                     │
         ┌───────────────────┬───────┴───────────┬───────────────────┐
         │                   │                   │                   │
    \Programs\         \Frameworks\           \Tools\            \RegFiles\
  (x64 Installers)   (Runtimes & SDKs)    (Standalone Utils)   (Registry Tweaks)

2. Heavyweight & Hard-to-Find Power Applications

Rather than populating menus with small script stubs or disposable utilities,
the Toolbox focuses on substantial, hard-to-find, and specialized engineering
suites (ranging from 10 MB to 1.15 GB+):

  - Advanced 3D CAD & Slicing: Mechanical parametric modelers (FreeCAD,
    SolveSpace), electronic schematic and PCB design suites (KiCad EDA
    Suite 1.15 GB), and modern multi-color 3D printing toolpath engines (Bambu
    Studio, OrcaSlicer, PrusaSlicer, UltiMaker Cura).
  - Data Science & Scientific Computing: Statistical environments (RStudio
    Desktop), dynamic numerical language toolchains (Julia SDK), visual machine
    learning pipelines (Orange Data Mining), relational graph analyzers (Gephi),
    numerical computation suites (GNU Octave), and celestial 3D observatories
    (Stellarium).
  - Media & Digital Production: Professional 3D animation and rendering
    (Blender 3D), raster manipulation (GIMP), digital painting (Krita),
    node-based digital compositing (Natron), and hardware-accelerated
    transcoding suites (StaxRip, HandBrake, LosslessCut).
  - Game Development & Emulation: Standalone engines (Godot Engine Standard x64,
    Defold 2D, Solar2D), RTS game engines (Warzone 2100), 3D racing benchmarks
    (SuperTuxKart), and cycle-accurate multi-system hardware preservation
    emulators (RetroArch, PCSX2, Dolphin, DuckStation, RPCS3, Cemu, BizHawk,
    ares, MAME).

3. Comprehensive Frameworks, SDKs & Runtimes Engine

The Toolbox provides a complete offline runtime installation engine. While
general software strictly follows a single-architecture rule, Frameworks &
Runtimes (Tab 11) are explicitly architected with dual-architecture (x86 and
x64) support to resolve legacy and modern dependency errors on clean Windows
installations:

  - Microsoft Visual C++ Redistributables: Complete range from
    VC++ 2005, 2008, 2010, 2012, 2013, to 2015–2022 in parallel x86 and x64
    standalone packages.
  - Microsoft .NET Ecosystem: Legacy .NET Framework 4.8 / 4.8.1 Offline
    Installers and modern .NET Desktop Runtimes (6.0, 7.0, 8.0, 9.0, and 10.0
    Preview) in both x86 and x64 builds.
  - Java LTS Runtimes: Eclipse Adoptium OpenJDK and Amazon Corretto JDK for
    long-term support versions (Java 8, 11, 17, and 21 LTS).
  - Graphics & System APIs: DirectX 9.0c End-User Redistributable (June 2010),
    DirectX Web Setup, NVIDIA PhysX System Software, Vulkan Runtime Installer,
    Microsoft Edge WebView2 Runtime, and Visual Studio Build Tools.

4. 15-Category Partition Matrix & Search Normalization Engine

The GUI organizes tools across 15 dedicated category tabs, plus an active Live
Search Results tab:

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                        15 DEDICATED SUITE CATEGORIES (TABS)                            │
├───────────────────────────────┬───────────────────────────────┬────────────────────────┤
│ 1. Benchmarks & Hardware      │ 6. Docs, Code & Compilers     │ 11. Runtimes & SDKs    │
│ 2. Web Browsers & Gecko       │ 7. Office, CAD & 3D Tools     │ 12. Security & Privacy │
│ 3. Cleaners & Uninstallers    │ 8. ISO, Disks & Hypervisors   │ 13. Windows Tweaks     │
│ 4. Cloud & Network Tools      │ 9. Media, DAWs & Graphics     │ 14. Heavy Studios      │
│ 5. Diagnostics & Forensics    │ 10. Remote, Chat & Gaming     │ 15. OS Maintenance     │
└───────────────────────────────┴───────────────────────────────┴────────────────────────┘

Real-Time Search Normalization (Matches-SearchQuery):

  - Fuzzy & Substring Matching: Real-time filtering across tool names,
    categories, tabs, and direct IDs.
  - Alphanumeric Sanitization: Automatically strips spaces, symbols, and
    punctuation from search strings (e.g., typing hwinfo, hw-info, or hw info
    instantly isolates HWiNFO64 Diagnostics).
  - Dynamic Tab Switching: Entering a search query automatically switches the
    view to the 🔍 Search Results tab and dynamically updates item count badges.
    Clearing the search box restores the default tab layout.

5. Resilient Download Pipeline & Offset-0 Magic-Byte Validator

Standard download scripts frequently fail because remote web servers
(SourceForge, Cloudflare, anti-bot CDNs) return a 200 OK status with an HTML
error page, landing page, or captcha stub rather than the actual binary. When
executed, these fake HTML files corrupt local caches and crash installers.

The Toolbox resolves this through an Offset-0 Magic-Byte Verification Engine
(Test-ValidBinaryFile):

File on Disk ──> Inspect First 16 Bytes ──> Check Byte 0 != 0x3C ('<') ──> Match Binary Magic Header
                                                                                   │
               ┌───────────────────────┬───────────────────────┬───────────────────┴───────────────────┐
               ▼                       ▼                       ▼                                       ▼
        MZ (0x4D 0x5A)          PK (0x50 0x4B)          Compound Document                   7z (0x37 0x7A 0xBC 0xAF)
       Executable Binaries     ZIP / MSIX / Nupkg           (0xD0 0xCF)                        7-Zip Archives
      (.exe, .dll, .sys)      Archives (.zip, etc.)        MSI Packages (.msi)                     (.7z)

1.  Anti-HTML Detection: Rejects any download where Byte 0 equals 0x3C (<),
    instantly catching XML, HTML, or Cloudflare challenge stubs.
2.  Strict Magic-Byte Signatures:
      - Executables (.exe, .dll, .sys) must start with MZ (0x4D 0x5A) and exceed
        minimum byte lengths.
      - Archive packages (.zip, .msixbundle, .nupkg) must start with PK
        (0x50 0x4B).
      - Windows Installer packages (.msi) must match the Compound Document
        Header (0xD0 0xCF).
      - 7-Zip packages (.7z) must match the 4-byte signature 37 7A BC AF.
3.  Instant Auto-Purge: Any failed, partial, or corrupted file is automatically
    deleted from disk and flagged as Missing.
4.  Zero-Flash Execution: Downloads run via System.Diagnostics.ProcessStartInfo
    utilizing curl.exe with hidden window flags (CreateNoWindow = $true), with
    automatic failover to managed .NET WebClient streams.

6. UI Theming, 4-Tier Font Scaling & Layout System

The interface is built with a high-contrast layout, complete with horizontal
splitter customization (SplitContainer) allowing users to dynamically resize the
tool catalog and logging console.

Unified 10 High-Contrast Themes Matrix

	Themes 
 
 **Dark Mode (Stealth)**      
 **Light Mode (Soft Slate)**  
 **Gamer (Matrix Green)**     
 **Blood Matrix (Cyber Red)** 
 **Cyber Yellow**             
 **Cyberpunk Pink**           
 **Nordic Frost**             
 **Dracula Purple**           
 **Sunset Amber**             
 **Solarized Ocean**          

4-Tier Font Scaling Engine (Consolas)

Adapts dynamically to high-DPI and 4K displays without layout truncation:

  - Small: 8.0pt (Catalog) / 8.0pt Bold (Console)
  - Medium (Default): 9.0pt (Catalog) / 9.5pt Bold (Console)
  - Large: 11.0pt (Catalog) / 11.5pt Bold (Console)
  - Extra Large: 12.5pt (Catalog) / 13.0pt Bold (Console)

7. Asynchronous Runspace Pool & Thread-Safe State Engine

To prevent UI freezing during large multi-gigabyte download queues, the Toolbox
uses an isolated multi-threaded runspace architecture:

  - Thread-Safe State Container (ToolboxState): Coordinates queue locks, active
    worker counts, cancellation flags, and thread-safe progress maps
    ([hashtable]::Synchronized).
  - Runspace Pool Dispatcher: Leverages
    [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, 5)
    to manage 5 concurrent download streams simultaneously.
  - 100ms Non-Blocking UI Marshaller ($UiTimer): A lightweight timer continually
    dequeues log entries from the synchronized LogQueue, calculates overall
    download completion percentages, updates the marquee progress bar, and
    refreshes category item badges ([CACHED], [POLICY]).

8. Context Menu & OS Maintenance Subsystem

Right-Click Action Context Menu ($ActionContextMenu)

Right-clicking any application in the catalog provides direct interaction:

  - 🚀 Run / Install / Apply: Directly executes cached binaries, merges .reg
    files, or runs system maintenance subroutines.
  - 📦 Extract to Folder: Automatically expands .zip or .7z archives into a
    subfolder within the target directory using native .NET ZipFile or 7-Zip.
  - 📂 Open Containing Folder: Opens Windows File Explorer with the target file
    highlighted (explorer.exe /select,"<Path>").
  - 🔍 Verify Local Integrity: Executes an on-demand Offset-0 Magic-Byte
    inspection on disk and outputs byte-level validity to the console.

Tab 15: OS Maintenance (Local In-Memory Policies & CMD Repairs)

Contains 40 offline actions that run without network access:

1.  Context Menu Modifications: One-click .reg policies to restore
    classic Windows 10 menus, modern Windows 11 menus, add Take Ownership, Open
    in PowerShell, Toggle Hidden Files, Toggle Extensions, Copy Path, and God
    Mode.
2.  In-Memory Policy Tweaks: Immediate registry modifications
    disabling telemetry, DiagTrack services, consumer Cortana, Bing Start Menu
    search, lock screen ads, timeline tracking, and advertising IDs, while
    enabling Ultimate Performance schemes and strict hanging application
    termination.
3.  Elevated CMD OS Repairs: Automated execution of administrative
    system repairs: DISM Online Image Restoration (/RestoreHealth), SFC Scannow,
    DNS Flush & Re-registration, Winsock & TCP/IP Stack Reset, Windows Update &
    Catroot2 Service Reset, UWP Built-in Package Re-registration, Icon & Font
    Cache Rebuilding, and Windows Explorer Shell Restarts.

9. Privacy, Feedback & Visual Identity Standards

The Toolbox strictly adheres to clean privacy and visual presentation standards:

  - Zero Plaintext Visual Email: Developer contact endpoints do not appear in
    visual UI labels, sub-headers, or modal body text. System contact handlers
    operate through encoded ASCII byte arrays that resolve into mailto: URI
    dispatchers and system clipboard handlers.
  - Unified Developer Copy: Standardized About and Feedback dialogues provide
    developer background, PayPal, and Ko-fi support endpoints.

    <img width="1664" height="2496" alt="1788191087213-01a0587d-c05b-7db9-9032-9db091b0a550" src="https://github.com/user-attachments/assets/d823639b-b19b-4c98-aa1c-464789c2c6ad" />

