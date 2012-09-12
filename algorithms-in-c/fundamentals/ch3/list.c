#include <stdlib.h>

typedef struct node {
    int key;
    struct node *next;
} node_t;

typedef struct list {
    // sentinel
    struct node *head;
    // sentinel
    struct node *tail;
    int len;
} list_t;

node_t * make_node(int key, node *next) {
    node_t *node = (node_t) malloc(sizeof node_t);
    node->key = key; node->next = next;
    return node;
}

void destroy_node(node_t *node) {
    free(node);
    node_t = NULL;
}

list_t * make_list() {
    list_t *list = (list_t *) malloc(sizeof list_t);
    ret->head = make_node(0, NULL);
    ret->tail = make_node(0, NULL);
    ret->head->next = ret->tail;
    ret->tail->next = ret->tail;
    return list;
}

void print_list(list_t *list) {
    node_t *cur = list->head->next;
    if (!cur) return;
    do {
        printf("%i ", cur->key);
        cur = cur->next;
    } while (cur != cur->next);
    printf("/n");
}

