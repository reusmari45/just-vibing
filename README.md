# CleanFlow

CleanFlow is a privacy-first phone cleaner, storage analyzer, and device optimizer built with Flutter and Material 3.

## Features
- One-tap Smart Clean with undo window
- Storage Analyzer with donut/treemap visualization
- Junk & cache cleaner previews
- Duplicate finder (exact + similar)
- Large file scanner and sorting
- App manager with rare-use recommendations
- Battery & performance booster
- Privacy & permission auditor
- Scheduled Auto-Clean
- Safe Vault (AES-256 encrypted files)
- Optional cloud moves (user-initiated)
- Viral streaks, shareable cleanups, referral rewards
- Onboarding walkthrough for education and trust

## Build & Run
```bash
flutter pub get
flutter run
```

## Architecture
- `lib/features/*` holds feature screens and components.
- `lib/services/*` handles scanning and cleanup logic.
- `lib/providers/*` owns Riverpod state.
- `assets/` for Lottie, SVG fallback, and Figma tokens.

## Telemetry Schema (Firebase Analytics)
| Event | Parameters |
| --- | --- |
| `clean_start` | `source`, `estimated_mb` |
| `clean_complete` | `freed_mb`, `duration_ms`, `undo_used` |
| `duplicate_scan` | `mode`, `threshold` |
| `duplicate_cleanup` | `count`, `freed_mb` |
| `vault_encrypt` | `file_count`, `size_mb` |
| `subscription_start` | `plan`, `trial` |
| `referral_share` | `channel` |

## QA Handoff Checklist
- [ ] Verify on-device permissions flow (storage, media, notifications)
- [ ] Validate One-tap Clean undo within 30 seconds
- [ ] Confirm duplicate detection accuracy on sample library
- [ ] Validate background Auto-Clean scheduling
- [ ] Check Safe Vault encryption/decryption
- [ ] Ensure TalkBack labels for key actions
- [ ] Review analytics events in debug view

## Store Copy (Draft)
**Tagline:** CleanFlow — Smart Cleaner & Storage Optimizer

**Short Description:**
Free up space, find duplicates, boost battery, and protect privacy in one tap.

**Full Description (Excerpt):**
CleanFlow keeps your phone fast and clutter-free with smart cleanups, duplicate photo detection, and privacy audits. Designed with Material You and built for safety-first cleaning.

## Test Plan
- Unit: services (cleaner, duplicate detection, vault)
- Widget: dashboard, clean progress, storage chart
- Integration: onboarding, smart clean, duplicate cleanup
- E2E: full clean + undo + analytics event validation

## CI/CD
GitHub Actions workflow runs `flutter test` on PRs and main.
