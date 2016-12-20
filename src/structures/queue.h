#ifndef __QUEUE_H__
#define __QUEUE_H__

#define QUEUE_SIZE 0x100

struct queue
{
    int buf[QUEUE_SIZE];
    int start;
    int end;
};

int enqueue(struct queue *q, int val);
int dequeue(struct queue *q, int *val);
int queue_is_empty(struct queue *q);
int queue_is_full(struct queue *q);

#endif /* __QUEUE_H__ */
