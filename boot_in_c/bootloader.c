void __attribute__((fastcall)) print_char(int c){
    __asm__("mov $0xe, %%ah\nmov %%cl, %%al\nint $0x10\n"::"c"(c): "eax");
}

void print_string(char* s){
    int i = 0;
    char c = s[i];
    while(c != 0x0){
        print_char((int)c);
        i++;
        c = s[i];
    }
}

int main(){
    print_string("Ola mundo!");
}


