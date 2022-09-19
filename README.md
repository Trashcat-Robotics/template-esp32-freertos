# template-esp32-freertos

## :exclamation: :busts_in_silhouette: TODO After Cloning

1) Replace "template-esp32-freertos" in the following files:
- `README.md` (above)
- `<root>/CMakeLists.txt`

## Build & Upload

```bash
# Build
make build

# Flash
# Hold Down Boot Button of ESP32
make port=<port> flash

# Clean and Fullclean
make clean
make fullclean
```
