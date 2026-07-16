The evolution from v2.60 to v2.90 represents a complete architectural overhaul of the Morphs Creations Toolbox. We moved from a basic script to a robust, self-healing deployment framework.
Here is the systematic breakdown of all changes made:
1. Core Download Engine (The "Heart")
Engine Migration: Originally used standard PowerShell Invoke-WebRequest, which failed on modern CDNs. We trialed curl.exe, but eventually settled on a Hybrid PowerShell-Native One-Liner.
Protocol Enforcement: Forced TLS 1.2 and 1.3 security protocols to ensure compatibility with GitHub, SourceForge, and private developer servers.
Browser Mimicry: Integrated a permanent Mozilla/5.0 User-Agent string to prevent servers (like Sordum or Harman) from rejecting the connection as a "bot."
Redirection Handling: Added a 10-level redirection limit to follow files that jump through multiple mirrors (common with MajorGeeks and Sordum links).
Corruption Protection: Implemented a 10KB size check; the engine now automatically deletes files that are actually HTML "Access Denied" pages instead of real binaries.
2. Logic & Queue Management (The "Brain")
The "Linear Queue" Implementation: Replaced the fragile FOR loop (which caused the script to crash after one download) with a Linear GOTO Pointer. This treats your input as a string and "peels" off one ID at a time, keeping the script alive.
Strict ID Matching: In v2.60, choosing "1" could accidentally trigger "91". We implemented Strict Label Jumps using findstr /i /b /c: to ensure the script only executes the exact ID selected.
Automation Restore: Added a 2-second automated return to the menu. You no longer have to press "Enter" after every single download; the script now flows through the list automatically.
Progress Tracking: Restored the [Current/Total] counter in the window header so you know exactly where you are in a bulk download list.
3. Link & Binary Optimization
Google Drive Bypass: Solved the "Export=Download" breakage by implementing strict variable isolation. ID 7 (UltraISO) now uses a direct developer CDN to avoid landing pages.
GitHub Binary Correction: Fixed ID 8 (Telegram) and ID 96 (Defender Control) by switching from "Blob" links (which download HTML) to "Raw" links (which download the actual .exe).
AIMP Fix: Resolved the URL splitting bug on ID 9 where the & symbol was crashing the Batch interpreter.
Sordum Stability: Research-backed direct triggers were added for WUB and Defender Control to bypass the "Thank You" landing pages.
4. Special Tool Automation
WUB & Defender Control: These were upgraded from simple downloads to Special Handlers. The script now performs a three-stage cycle: Download -> Extract to Subfolder -> Execute.
Path Intelligence: Fixed the directory logic so tools extract into specific Tools\NamedFolder paths rather than cluttering the root, ensuring the executables are easy to find.
5. Security & Resilience
Defender Exclusions: Added a one-liner to automatically add the EngineToolbox path to Windows Defender's exclusion list on startup.
ESET Mitigation: Revised extraction subroutines to help bypass heuristic blocking by security suites like ESET.
Current Build Version: v2.90 (STABLE)
Status: All Page 1 tools (1-96) verified or corrected.
