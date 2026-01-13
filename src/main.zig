const hello = "Hello world";
const color:u16 = 0x0F00;
export fn _start() noreturn {
    const vga: [*]volatile u16 = @ptrFromInt(0xb8000);
    for (0..80 * 25) |i| { // Clears the VGA buffer
        vga[i * 2] = ' ';
        vga[i * 2 + 1] = 0x0b;
    }
    for (hello, 0..) |byte, i| {
        vga[i] = byte | color;
    }
    while (true) asm volatile ("hlt");
}
