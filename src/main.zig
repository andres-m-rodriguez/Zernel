const hello = "Hello world";

export fn _start() noreturn {
    const vga: [*]volatile u8 = @ptrFromInt(0xb8000);
    for (hello, 0..) |byte, i| {
        vga[i * 2] = byte;
        vga[i * 2 + 1] = 0x0b;
    }
    while (true) asm volatile ("hlt");
}
