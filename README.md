<img width="1024" height="1536" alt="1789745938404-01a0b52a-d610-7182-b27e-f2b2848cd141" src="https://github.com/user-attachments/assets/89e98cd7-0cd3-4cd8-b22d-b17c35a4d686" />


Morphs Creations Toolbox Suite v5.80

The 1,000+ Tool Deployment, Diagnostics & System Optimization Suite

Morphs Creations Toolbox Suite is a unified, Windows-native deployment,
diagnostic, and system maintenance platform. Built natively for Windows 10 and
Windows 11 using system-provided components and runtime environments, the suite
manages an extensive catalog of 1,000 deployable software packages, developer
toolchains, runtimes, and utilities, alongside 40 runtime OS policy
modifications and system repair actions (1,040 catalogued items total).

⚙️ Core Architecture & Reliability Features

┌──────────────────────────────────────────────────────────────────────────────────┐
│                     MORPHS CREATIONS TOOLBOX RUNTIME ENGINE                      │
├────────────────────────────────┼─────────────────────────────────────────────────┤
│ 🖥️ Dual-Interface Engine       │ WinForms desktop GUI + 4-page high-density CLI   │
│                                │ companion (toolbox.cmd) with range parser       │
└────────────────────────────────┴─────────────────────────────────────────────────┘

1.  Binary Signature Preflight Validation
    To prevent corrupt downloads, incomplete streams, or server captive portals
    from breaking deployments, incoming files undergo format-signature
    inspection prior to storage:

      - Executables (.exe, .dll, .sys): Preflight checks for the initial
        0x4D 0x5A (MZ) DOS header.
      - Zip Containers (.zip, .msixbundle, .nupkg): Verified against 0x50 0x4B
        (PK).
      - Compound File Installers (.msi): Verified against the CFB signature
        0xD0 0xCF.
      - 7-Zip Archives (.7z): Verified against 0x37 0x7A 0xBC 0xAF.
      - HTML/Response-Stub Detection: Rejects downloads where the initial byte
        is 0x3C (<), intercepting HTML error pages, captive portal login
        screens, and web server redirect stubs.
        (Note: This is an automated file-format sanity check, not a
        cryptographic Authenticode or malware security verdict).

2.  5 MB+ Package Inclusion Threshold
    The software catalog intentionally prioritizes full-featured desktop tools,
    developer SDKs, and complete utilities over micro-scripts and single-purpose
    command-line stubs.

3.  Dual-Path Transport Engine
    Network acquisition executes primarily via Windows-native curl.exe utilizing
    the system network stack, complete with automated redirect resolution (-L)
    and connection retry logic. If the initial stream fails, the engine falls
    back to a managed .NET socket stream.

4.  Resilient Dual-Location Configuration
    Maintains user interface preferences, active themes, font scaling tiers, and
    workspace history across two configuration endpoints
    (.\EngineToolbox\settings.json with fallback to
    %LOCALAPPDATA%\MorphsCreations\Toolbox\settings.json). This ensures full
    functionality when running from read-only media, network shares, or
    removable USB storage.

5.  Location-Independent Directory Topology
    The application requires no fixed installation path, automatically
    provisioning its working directory tree relative to the runtime location:

      - .\EngineToolbox\Programs\ – Software installers and binary packages.
      - .\EngineToolbox\Tools\ – Portable tools and standalone utilities.
      - .\EngineToolbox\Frameworks\ – Runtimes, SDKs, and build environments.
      - .\EngineToolbox\RegFiles\ – Explorer shell context menu configuration
        scripts.

6.  Native Windows Framework
    Runs directly within Windows PowerShell and native command environments
    without requiring third-party package managers, external runtime
    installations, or background telemetry services.

🗂️ Categorical Workspaces (1,040 Catalogued Items)

The catalog is organized into 15 Categorical Tool Tabs and 1 Dynamic Live Search
Tab (16 workspaces total):

┌──────────────────────────────────────────────────────────────────────────────────┐
│                        MASTER WORKSPACE PARTITIONS                               │
├────┬─────────────────────────────┬──────────┬────────────────────────────────────┤
│Tab │ Category Name               │ ID Range │ Scope & Tool Types                 │
├────┼─────────────────────────────┼──────────┼────────────────────────────────────┤
│ 1  │ Benchmarks & Hardware       │ 001–065  │ Sensors, Stress Tests, Fan Curves  │
│ 2  │ Web Browsers & Engines      │ 066–105  │ Privacy, Gecko, Chromium Forks     │
│ 3  │ Cleaners & File Management  │ 106–175  │ Uninstallers, Deduplication, Scrub │
│ 4  │ Cloud, Networks & VPNs      │ 176–245  │ Mesh VPN, Packet Capture, S3 Tools │
│ 5  │ Diagnostics & Forensics     │ 246–315  │ Sysinternals, Hex, Sandboxing      │
│ 6  │ Docs, Code & Dev Stacks     │ 316–400  │ IDEs, SDKs, Local Web/DB Stacks    │
│ 7  │ Office, CAD & GIS           │ 401–480  │ Office Suites, 2D/3D CAD, Mapping  │
│ 8  │ ISO, Disks & Virtualization │ 481–560  │ Hypervisors, Boot Media, Imaging   │
│ 9  │ Media Players & Audio DAWs  │ 561–645  │ Transcoders, Trackers, Art Studios │
│ 10 │ Remote, Gaming & Emulators  │ 646–730  │ Remote Access, Launchers, Emus     │
│ 11 │ Runtimes & Frameworks       │ 731–780  │ VC++ AIO, .NET Runtimes, OpenJDK   │
│ 12 │ Security & Privacy Vaults   │ 781–840  │ Password Managers, Second-Opinion  │
│ 13 │ Windows Tweaks & Mods       │ 841–890  │ Shell Mods, UI Customization       │
│ 14 │ Engineering, Math & AI      │ 891–1000 │ Math, Multiphysics FEM, AI Stacks  │
│ 15 │ OS Maintenance & Repairs    │ 1001–1040│ Policy Controls & CMD Fix Scripts  │
│ 16 │ Dynamic Live Search         │ TabSearch│ Live Normalized String Filter      │
└────┴─────────────────────────────┴──────────┴────────────────────────────────────┘

Tab Summaries

  - Tab 1: Benchmarks, Thermals & Hardware Forensics (IDs 1–65)
    Hardware telemetry, fan curves, storage throughput benchmarks, GPU stress
    suites, and latency diagnostics (CapFrameX, HWiNFO64, Core Temp, AIDA64,
    FurMark 2, Novabench, ATTO Disk Benchmark, LatencyMon, Quick CPU, OpenRGB).
  - Tab 2: Web Browsers & Gecko Engines (IDs 66–105)
    Privacy-hardened browsers, legacy compatibility engines, and performance
    forks (LibreWolf, Mullvad, Tor Browser, Brave, Chrome Enterprise, Firefox,
    Vivaldi, Zen Browser, Floorp, Waterfox, Supermium, Thorium AVX2).
  - Tab 3: Cleaners, Scrubbers & File Management (IDs 106–175)
    Bulk software removal, duplicate file finders, filesystem visualizers, and
    shell management utilities (BCUninstaller, Revo Portable, Geek Uninstaller,
    WizTree, TreeSize Free, SpaceSniffer, AllDup, Double Commander, LockHunter).
  - Tab 4: Cloud, Networks, VPNs & S3 Storage (IDs 176–245)
    Network analyzers, mesh VPN clients, terminal emulators, and local cloud
    infrastructure (WireGuard, OpenVPN, Tailscale, Cloudflare WARP, Wireshark,
    Nmap, WinSCP, Bitvise SSH, Nextcloud, Rclone, MinIO S3 Server, GNS3).
  - Tab 5: System Diagnostics, Process & Binary Forensics (IDs 246–315)
    Process investigation, kernel namespace inspectors, and memory forensics
    (Sysinternals Suite, Process Explorer, Process Monitor, HxD, ImHex,
    AutoHotkey v2, QuickLook, Everything Search, Sandboxie-Plus x64).
  - Tab 6: Docs, Code Editors, Compilers & SDKs (IDs 316–400)
    Development environments, compiler toolchains, database management consoles,
    and local server stacks (VS Code, VSCodium, Notepad++, Sublime Text, Neovim,
    Python, Node.js, Go, Rust, Zig, LLVM, pgAdmin 4, MySQL Workbench, Redis
    Insight, LocalWP, XAMPP, WampServer, Rancher Desktop).
  - Tab 7: Office Suites, Technical CAD, GIS & Publishing (IDs 401–480)
    Productivity applications, geographic information systems, parametric 3D/2D
    CAD, and document utilities (LibreOffice, OnlyOffice, QGIS 1.1GB Suite, SAGA
    GIS, FreeCAD, LibreCAD, QCAD, OpenSCAD, PDF24 Creator, Okular, Calibre,
    Sigil).
  - Tab 8: ISO, Disks, Virtualization & Boot Tools (IDs 481–560)
    Hypervisors, bootable media creators, disk cloners, and forensic image
    analyzers (VirtualBox, QEMU, Rufus, Ventoy, BalenaEtcher, Clonezilla Live,
    GParted Live, EaseUS Partition Master, Autopsy Forensics, FTK
    Imager, 7-Zip).
  - Tab 9: Media Players, Audio DAWs & Video Transcoders (IDs 561–645)
    Media playback, video transcoders, digital audio workstations, audio
    trackers, and raster/vector creation studios (VLC, MPC-HC, MPV, HandBrake,
    VidCoder, Shutter Encoder, OBS Studio, Audacity, Ardour DAW, VCV Rack, Surge
    XT, Vital Synth, Blender, Krita, GIMP, Inkscape).
  - Tab 10: Remote Access, Chat, Game Launchers & Emulators (IDs 646–730)
    Remote desktop utilities, collaboration tools, 2D/3D game engines, and
    multi-console emulation systems (RustDesk, AnyDesk, Discord, Telegram,
    Signal, GDevelop, LÖVE 2D, Ren'Py, Raylib, RetroArch, RPCS3, PCSX2, Dolphin,
    DuckStation, Simple64, Lime3DS, Steam, Heroic Games, Playnite).
  - Tab 11: Complete Runtimes, Frameworks & Core SDKs (IDs 731–780)
    Curated Visual C++ Redistributable libraries (2005–2022 x86/x64), Microsoft
    .NET Desktop Runtimes, Adoptium OpenJDK / Amazon Corretto LTS releases,
    DirectX runtimes, Vulkan, and NVIDIA PhysX.
  - Tab 12: Security Vaults, Privacy Hardening & Anti-Malware (IDs 781–840)
    Credential vaults, secondary emergency malware scanners, disk encryption
    tools, and memory analysis utilities (Bitwarden, KeePassXC, KVRT, ESET
    Online Scanner, MSERT, HitmanPro, VeraCrypt, AxCrypt, Volatility Workbench,
    Magnet RAM Capture).
  - Tab 13: Windows Tweaks, Customization & Shell Mods (IDs 841–890)
    Desktop customizers, shell enhancers, and automation suites (Microsoft
    PowerToys, Chris Titus WinUtil, StartAllBack, Open-Shell, Windhawk, AutoIt,
    TaskbarX, Rainmeter, Flow Launcher, Defender Control).
  - Tab 14: Heavy Studios, Engineering, Math, Scientific & AI (IDs 891–1000)
    Computer algebra systems, multiphysics finite-element engines, local LLM/AI
    runners, and electronic design suites (GNU Octave, Scilab, wxMaxima,
    SageMath, LTspice, ngspice, Avogadro 2, PyMOL, Gmsh, Elmer FEM, KiCad PCB
    Suite, Ollama, LM Studio, ComfyUI, AnythingLLM).
  - Tab 15: OS Maintenance, Policies & Surgical CMD Repairs (IDs 1001–1040)
      - Shell Enhancements: Take Ownership context menu integration, Open in
        PowerShell/CMD here, hidden file/extension toggles, Desktop God Mode,
        and Explorer restart actions.
      - System Policy Controls: Toggles for diagnostic data services, Consumer
        Cortana & Bing Start search, Lock Screen spotlight advertising, location
        sensors, GameDVR overlays, and Fast Startup.
      - CMD Repair Operations: DISM Component Store health restoration
        (/RestoreHealth), System File Checker (sfc /scannow), TCP/IP Winsock
        resets, Windows Update service and SoftwareDistribution/Catroot2 resets,
        bulk UWP app re-registration, and Icon/Font cache rebuilders.
  - Tab 16: Dynamic Live Search Results (TabSearch)
    Real-time normalized filter across all 1,040 items, filtering dynamically
    across names, categories, parent tabs, and IDs.

🎨 User Interface & Operational Features

  - 10 High-Contrast Visual Themes: Soft Slate (Light), Dark Stealth, Blood
    Matrix (Cyber Red), Gamer Theme (Matrix Green), Cyber Yellow, Cyberpunk
    Pink, Nordic Frost, Dracula Purple, Sunset Amber, and Solarized Ocean.
  - 4-Tier Dynamic Font Scaling: Coordinates interface scaling across Small
    (8.0pt), Medium (9.0pt), Large (11.0pt), and Extra Large
    (12.5pt)—dynamically adjusting list items, console telemetry, and tab header
    titles.
  - Literal Direct-ID "Select All": Directly selects 100% of downloadable assets
    (Type -eq 'DL') from memory while leaving disk-checking and skip decisions
    ([SKIPPED]) strictly to the preflight validation engine.
  - Action Context Menus: Right-click entries to launch/install, extract
    compressed archives on-the-fly, open containing directories in Explorer, or
    perform a manual binary header preflight check.
  - Dual-Interface Operation: Launch via the visual WinForms dashboard
    (windowsgui.ps1) or deploy headlessly through the companion 4-page command
    console (toolbox.cmd) supporting range execution (e.g. 1-45) and preset
    deployment profiles.

📄 Licensing & Software Distribution Notice

Third-party software packages accessible through Morphs Creations Toolbox Suite
remain subject to the respective licensing, redistribution, and usage terms of
their original developers and publishers. Morphs Creations Toolbox Suite
provides an automated management and deployment mechanism; it does not claim
ownership or endorsement of third-party software assets.
