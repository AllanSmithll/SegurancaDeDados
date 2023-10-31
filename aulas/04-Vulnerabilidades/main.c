// 31/10/2023 - Buffer Overflow - Vulnerabilidades
// Segurança de Dados - Sistemas para Internet - IFPB
#include <stdio.h>
#include <string.h>

int main() {
    char buffer[10];
    char secret[] = "seguro123";

    printf("Digite sua senha: ");
    gets(buffer);

    if (strcmp(buffer, secret) == 0) {
        printf("Acesso concedido.\n");
    } else {
        printf("Acesso negado.\n");
    }

    return 0;
}