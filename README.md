# Zernel

Zernel is a hobby OS kernel written in Zig. The goal? Boot into a TUI file browser with a custom filesystem that persists to disk. No more, no less. When I can navigate files with arrow keys in my own operating system, this project is done and I can mass-allocate new problems for myself.

## The Vision

```
┌─ ZERNEL ─────────────────────────────────────┐
│ FILES              │ PREVIEW                 │
│ > hello.txt        │ Hello world!            │
│   notes.txt        │ This is my first file   │
│   todo.txt         │ written in my own OS.   │
│                    │                         │
│                    │                         │
│────────────────────│                         │
│ [↑↓] navigate  [Enter] open  [N]ew  [D]elete │
└──────────────────────────────────────────────┘
```

That's it. That's the whole thing. Boot → TUI → files persist → done.

## Features (Eventually)

- [x] Boot (allegedly)
- [ ] Print to screen (working on it)
- [ ] Keyboard input
- [ ] Text mode shell
- [ ] In-memory filesystem
- [ ] ATA PIO disk driver
- [ ] Custom filesystem with persistence
- [ ] TUI file browser ← **finish line**

## The "Not Doing" List

Scope is how projects get finished. Zernel will NOT have:

- Networking
- Multiple processes / multitasking
- Graphics beyond text mode
- USB support
- AHCI/NVMe (ATA PIO only)
- Subdirectories (flat file list)
- Any feature that sounds cool but prevents me from finishing

## Building

```bash
zig build
```

## Running

```bash
qemu-system-x86_64 -kernel zig-out/bin/zernel
```

(This will probably change as I figure out what I'm doing)

## Why?

Because I wanted to mass-allocate problems for myself.

## License

Do whatever you want with this. If you somehow make money from my kernel that boots 60% of the time, congrats.
