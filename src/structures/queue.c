#include "queue.h"

int enqueue(struct queue *q, int val)
{
    if(queue_is_empty(q))
    {
        return -1;
    }
    q->buf[q->end++] = val;
    q->end %= QUEUE_SIZE;
    return 0;
}

int dequeue(struct queue *q, int *val)
{
    if(queue_is_empty(q))
    {
        return -1;
    }
    *val = q->buf[q->start++];
    q->start %= QUEUE_SIZE;
    return 0;
}

int queue_is_empty(struct queue *q)
{
    return q->start == q->end;
}

int queue_is_full(struct queue *q)
{
    return (q->end + 1) % QUEUE_SIZE == q->start;
}
