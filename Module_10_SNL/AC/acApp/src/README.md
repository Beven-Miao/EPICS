# Note on SNL AC

## compile errors
### log
```
converting ../acsnc.stt 
/opt/codac-4.1/epics/base/../modules/sncseq/bin/linux-x86_64/snc     ../acsnc.stt -o acsnc.c.tmp
../acsnc.stt:144: syntax error near token 'when'
../acsnc.stt:224: syntax error near token 'when'
../acsnc.stt:302: syntax error near token 'when'
../acsnc.stt:382: syntax error near token 'when'
../acsnc.stt:462: syntax error near token 'when'
make[3]: *** [acsnc.c] Error 1
```

where the source code:

```
int st;

ss ac{
    ...
    state off {
	when(){
	...
            if(manul == 0 || (manul == 2 && auto == 0)){
                mode = 0;
                p = 0;
                st = 0;
            }
	...
	}
	...
        when (st == 0) {   <----144: syntax error near token 'when'
        } state off
	...
    }
    ...
}

```

### solution
Change `when()` to `entry`
