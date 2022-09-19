#ifndef PLATFORM_H
#define PLATFORM_H
#define LOG_LOCAL_LEVEL ESP_LOG_VERBOSE

#include "esp_chip_info.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "sdkconfig.h"

void
app_main(void);

#endif
