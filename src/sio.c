#include "sio.h"

ssize_t sio_read(struct sio *sio, char *buf, size_t amount)
{
    sio->read_func(sio, buf, amount);
}

ssize_t sio_write(struct sio *sio, const char *buf, size_t amount)
{
    sio->write_func(sio, buf, amount);
}
