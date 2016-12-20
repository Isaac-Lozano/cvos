#ifndef __SIO_H__
#define __SIO_H__

/* simple io */
struct sio
{
    void *ctx;
    ssize_t (*read_func)(struct sio *, char *, size_t);
    ssize_t (*write_func)(struct sio *, const char *, size_t);
}

ssize_t sio_read(struct sio *sio, char *buf, size_t amount);
ssize_t sio_write(struct sio *sio, const char *buf, size_t amount);

#endif /* __SIO_H__ */
