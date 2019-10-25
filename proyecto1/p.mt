16893100010008maraton/3320410001000139718maraton/farida.cpp#include<iostream> 
#include<stdio.h> 
#include<string> 
#include<bitset> 
	
using namespace std; 

void rec_rev(int coins[], bool bits[], int ind); 
int sum_bits(int coins[], bool bits[], int size); 

int main() 
{
	int monster[10001];
	int t; 
	cin>>t; 
	
	int resp[t]; 

	int n, aux, prev, current; 
	bool cond; 
	for(int i=0; i<t; i++) { 

		cin>>n; 	
		for(int j=0; j<n; j++) { 
			cin>>aux; 
			monster[j] = aux; 
		}
	
		bool acum[n]; 
		acum[0] = 1; 
		for(int c=1; c<n; c++) { 
			
			rec_rev(monster, acum, c);
		}		

		resp[i] = sum_bits(monster, acum, n);  
			
	}
			
	for(int k=0; k<t; k++) { 
		cout<<"Case "<<k+1<<": "<<resp[k]<<endl; 
	}


	return 0; 
}

void rec_rev(int coins[], bool chosen[], int ind) 
{
	int r_p, l_p;
	if (ind >= 1)
	{
		if (chosen[ind-1]) 
		{
			r_p = coins[ind]; 
			if (ind >= 2)
			{
				l_p = coins[ind-1]; 

				if (l_p + r_p > coins[ind])
				{
					chosen[ind-1] = false; 
					chosen[ind-2] = true; 
					rec_rev(coins, chosen, ind-2); 
				}
				else { 
					chosen[ind] = false; 
				}
			}
			else if (ind == 1) {
				if (r_p > coins[ind-1])
				{
					chosen[ind-1] = false; 
					chosen[ind] = true; 
				}
			}
		}
		else { 
			chosen[ind] = true; 
		}
	}

}

int sum_bits(int coins[], bool bits[], int size) 
{
	int response = 0; 

	for (int k=0; k<size; k++) { 
		if ( bits[k] )
		{
			response += coins[k]; 
		}	
	}
	
	return response; 
}
3327710001000802411maraton/outELF              @�4   �      4   	 (      4   4�4�               T  T�T�                    � �0
  0
           �  ����8  p             ���   �            h  h�h�D   D         P�td�  ��<   <         Q�td                          R�td�  ����          /lib/ld-linux.so.2           GNU                        GNU �o{nޒB���_{arZ�zT�            #          s��K��!��	(E�L�C                �                                           K             �             3               i              O               �              �              c  @��     v  ܈     �    �       3  ��       �   ��      libstdc++.so.6 __gmon_start__ _Jv_RegisterClasses _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc _ZSt4cout _ZNSolsEPFRSoS_E _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_ _ZNSt8ios_base4InitD1Ev _ZNSt8ios_base4InitC1Ev _ZSt3cin libc.so.6 _IO_stdin_used __cxa_atexit __libc_start_main GLIBC_2.0 GLIBC_2.1.3 GLIBCXX_3.4                          l     0   ii   �     si	   �                  t)�   �      ��  @�  �  �  �  �  �  �   �	  $�
  (�  S����   �Ç  ��������t�   ��[�             �5��%�    �%�h    ������%�h   ������%�h   ������%�h   �����%�h    �����% �h(   �����%$�h0   �����%(�h8   �p����%��f�        1�^����PTRh��h`�QVh;��o����f�f�f�f�f�f�f��$�f�f�f�f�f�f��7�-4���v�    ��tU���h4��Ѓ���Ð�t& �4�-4����������t�    ��tU���Ph4��҃���Ít& ��'    �=l� uU����|����l����f������u듍v �    ��t�U���P�҃���u����L$����q�U��Q����h��h@���������h��h��}������E�   �}��  R�E���� <eu��h�h��I������&�E���� <yu��h�h��#�������E�륃�h �h��&������    �M�ɍa��U����}u3�}��  u*��hh���������h0�hh�h���z��������U�����h��  j��������f�f�f�f�f�UWVS�����×  ���l$ ����������������)�����t%1���    ���t$,�t$,U�����������9�u��[^_]Ív ��  S��������3  ��[�     h ee y  ;8      ����T   S���x   ����   T����   x����   ����0         zR |�         \����    FJtx ?;*2$"(   @   �����    D Gu Cu|� A�C   l   f���B    A�B~�     �   ����    A�BV�  H   �   ����]    A�A�A�A�N i$D(D,A0M GA�A�A�A�     �   ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �<���             l     p�   Ĉ   ��         �      ���o��   ��   ��
   �                   �   @            0�   �            ���oȄ���o   ���o��                                                    �        ��ƅօ�����&�        GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609                        T�          h�          ��          ��          ��          ��          ��          Ȅ          �     	     0�     
     p�          ��          0�          @�          Ĉ          ؈          �          $�          ��          �          �          �          ��           �          ,�          @�                                ��   �         ��         ��      .   ��      D   l�     S   �      z   �      �   ��      �            ���   h�     �   ��B     �   <�                 ��  ,�        �                   ��  �       1   �      G  �       X  ��       k  �      �  ,�       t  @��     �             �  ��     �  @�      �              �              �  ؈     �  Ĉ      �                             ��       E              a             �  ܈     �              �  ,�      �  p�    �  4�     �  ��       0�     "  `�]     2             {  4�         ���    S  l�      �             �   �       �  4�      �  ;��     ,  p�       crtstuff.c __JCR_LIST__ deregister_tm_clones __do_global_dtors_aux completed.7209 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry greeting.cpp _ZStL8__ioinit _Z41__static_initialization_and_destruction_0ii _GLOBAL__sub_I_hey __FRAME_END__ __JCR_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ __init_array_end __init_array_start _DYNAMIC _ZSt3cin@@GLIBCXX_3.4 __cxa_atexit@@GLIBC_2.1.3 __libc_csu_fini __gmon_start__ _Jv_RegisterClasses _fp_hw _ZNSt8ios_base4InitC1Ev@@GLIBCXX_3.4 __libc_start_main@@GLIBC_2.0 _ZNSt8ios_base4InitD1Ev@@GLIBCXX_3.4 _ITM_deregisterTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@@GLIBCXX_3.4 _IO_stdin_used _ITM_registerTMCloneTable __data_start __x86.get_pc_thunk.bx __TMC_END__ _ZSt4cout@@GLIBCXX_3.4 __dso_handle __libc_csu_init _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@@GLIBCXX_3.4 __bss_start _ZNSolsEPFRSoS_E@@GLIBCXX_3.4 _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@@GLIBCXX_3.4 _edata main  .symtab .strtab .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .init_array .fini_array .jcr .dynamic .got.plt .data .bss .comment                                                   T�T                    #         h�h                     1         ���  $                  D   ���o   ���  4                N         ���                 V         ���  �                 ^   ���o   ���                   k   ���o   Ȅ�  P                z   	      �                  �   	   B   0�0  @               �         p�p  #                  �         ���  �                 �         0�0                    �         @�@  �                 �         Ĉ�                    �         ؈�                    �         ��  <                  �         $�$	                   �         ���                    �         �                    �         �                    �         �  �                �         ���                   �          �   ,                 �         ,�,                    �         @�4  ,                       0       4  5                               u  
                               l       2         	              |  �                 332041000100045629maraton/stickers_and_toys.cpp
#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int main() 
{
	int resp[1000]; 
	int T, n, s, t; 
	cin>>T; 

	for(int c=0; c<T; c++) {
	
		cin>>n>>s>>t; 
		if (n == s+t)
		{
			resp[c] = (s>t)? s + 1: t + 1; 
		}
		else { 
			int uni_s_t = (t + s) - n; 
			int a = t - uni_s_t; 
			int b = s - uni_s_t; 
			
			resp[c] = (a>b)? a + 1: b + 1; 
		}	
	}

	for (int i=0; i<T; i++) {
		cout<<resp[i]<<endl; 
	}

	return 0; 
}
3320410001000131517maraton/candy.cpp
#include<iostream> 
#include<stdio.h> 
#include<queue>
#include<string> 
	
using namespace std; 

int isDivisible(int candies[], int size); //if it is ret quotient, else ret -1
int movesCount(int candies[], int comp, int size); 

/* This program tells for a given amount of candy bags n, and the amount of candies on it arr[n], the minimum number of
	moves to make all candy bags have the same amount of candies. If it is not possible to have the same amount of candies
	it returns -1. A move is considered as taking a "single" candy from one bag and moving it to another one.
*/
int main() 
{
	int c = 0; 
	int resp[10000];
	int n;
	int equals; 

	while (true) {
		
		cin>>n; 
		if (n == -1) 
		{
			break; 
		}

		int arr[n];

		for (int i=0; i<n; i++) {
			cin>>arr[i]; 
		}
	
		equals = isDivisible(arr, n); 	
		resp[c] = (equals != -1)? movesCount(arr,equals, n): -1; 
	
		c++; 
	}	

	for (int i=0; i<c; i++) {
		cout<<resp[i]<<endl;
	}		

	return 0; 
}

int isDivisible (int candies[], int size) { 
	int sum = 0;

	for (int j=0; j<size; j++) { 
		sum += candies[j]; 
	}
	
	return (sum%size == 0)? sum/size: -1; 
}


int movesCount(int candies[], int comp, int size) {
	int counter = 0;

	for (int k=0; k<size; k++) { 
		
		if (candies[k]<comp) { 
			counter += comp - candies[k]; 
		}
	}	
	return counter;
}
168931000100016maraton/graph_tc33204100010004526maraton/graph_tc/graph_tc55 4

0 1
2 3
3 4
4 2
#simple not-conex graph
33204100010003026maraton/graph_tc/graph_tc23 3

0 1
1 2
2 3
#Simple line
33204100010002826maraton/graph_tc/graph_tc35 5 0

0 1
0 2
2 4
4 3
3 1

33204100010003126maraton/graph_tc/graph_tc13 3

0 1
1 2
2 0
#simple cicle
33204100010003826maraton/graph_tc/graph_tc46 5

0 1
1 3
0 2
2 4
2 5
#simple tree
3320410001000136517maraton/stpar.cpp
#include<iostream> 
#include<string> 
#include<stack>
#include<queue>
	
using namespace std; 

bool isPossible(queue <int>app_st);
bool isIncreasing(stack <int>some_stk);

int main() 
{
	string resp[100];
	int count=0;

	while (true)  {

		int c;
		cin>>c; 	
		if (c == 0)
		{
			break;
		}
		
		queue <int>perm; 
		int aux; 
		for (int i=0; i<c ; i++) {
			cin>>aux;
			perm.push(aux);
		}				

		if ( isPossible(perm) ) 
		{	
			resp[count] = "yes"; 
		}
		else { 
			resp[count] = "no";
		}
	
		count++;
	}

	for (int j=0; j<count; j++) {
		cout<<resp[j]<<endl; 
	}

	return 0; 
}


bool isPossible(queue <int>app_st) { 

	int next = 1; 	
	int n = app_st.size(); 
	stack <int>side_st;
	
	while ( !side_st.empty() || !app_st.empty() ) { 

		if ( !side_st.empty() && side_st.top() == next ) 
		{
			side_st.pop(); 
			next++; 
		}
		else { 
		
			if (app_st.front() == next) 
			{
				app_st.pop();
				next++; 
			} 
			else { 
				side_st.push( app_st.front() );
				app_st.pop();
				
				if ( !isIncreasing(side_st) ) 
				{
					return false; 
				}	
			}
		}
		
	}		

	return true;
}
	

bool isIncreasing(stack <int>some_stk) { 
	
	int n = some_stk.size();
	int arr[n];

	for (int i=0; i<n; i++) { 
		arr[i] = some_stk.top(); 
		some_stk.pop(); 	
	}

	for (int j=0; j<n-1; j++) { 
		
		if (arr[j] > arr[j+1]) 
		{	
			return false;
		}
	}
	
	return true;
}
33204100010009817maraton/tcases.pyprint("1") 
print("10000")

for i in range(10000): 
    print("1000000000", end=" ") 

print("")

33204100010007315maraton/test.py
print("h",end="")
for i in range(997):
   print("e",end="")

print("y")
3320410001000116726maraton/farida-propper.cpp#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int farida(int coins[], int size, int ind);  

/*
 * This program only draws the recursive solution without using any help to avoid overlapping problems.
 *
 */
int main() 
{
	int t; 

	cin>>t; 
	int resp[t]; 

	int n, aux; 
	for (int c=0; c<t; c++) { 
		cin>>n;

		int monster[n];  
		for(int r=0; r<n; r++) { 
			cin>>aux; 
			monster[r] = aux; 
		}

		resp[c]  = farida(monster, n, n + 1); 
	}

	for(int i=0; i<t; i++) { 
		cout<<"Case "<<i+1<<": "<<resp[i]<<endl; 
	}

	return 0; 
}

int farida(int coins[], int size, int ind) 
{
	int first, second; 
	if (ind == 0)
	{
		return coins[0];
	}
	else if (ind == 1)
	{
		return (coins[1] > coins[0])? coins[1]: coins[0];  
	}
	else if (ind == 2)
	{
		return (coins[2] + coins[0] > coins[1])? coins[2] + coins[0]: coins[1];
	}
	else 
	{
		first = farida(coins, size, ind-2); 
		
		second = farida(coins, size, ind-3); 

		if (first > second ) 
		{
			if (ind > size)
			{
				return first ;
			}
			return first + coins[ind]; 
		}
		else { 
			if (ind > size)
			{
				return second;  
			}
			return second + coins[ind]; 
		}
	}

		
}

332041000100060918maraton/permu2.cpp
#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

bool isAmbiguous(int perm[], int size);

int main() 
{
	int n; 
	int c = 0; 
	string resp[1000];
	
	while(true) { 
		cin>>n; 
		int num[n];

		if (n == 0) {
			break; 
		}
	
		for (int i=0; i<n; i++){ 
			cin>>num[i];
		}
		
		resp[c] = (isAmbiguous(num, n))? "ambiguous":"not ambiguous"; 
		c++;
	}
		
	for (int j=0; j<c; j++) {
		cout<<resp[j]<<endl; 
	}
	return 0; 
}

bool isAmbiguous(int perm[], int size) { 

	for (int k=0; k<size; k++) { 
		
		if ( k+1 != perm[ perm[k] - 1 ] ) 
		{
			return 0;
		}
	}
	
	return 1;	
}
3320410001000132720maraton/farida-2.cpp#include<iostream> 
#include<string> 
	
using namespace std; 

void rec_rev(int coins[], bool chosen[], int ind);
int bits_sum(int coins[], bool chosen[], int size); 

int main() 
{
	int t;
	cin>>t; 
	int resp[t]; 

	int n, aux; 
	for(int c=0; c<t; c++) { 

		cin>>n; 
		int monster[n]; 
		bool chosen[n]; 
		for(int r=0; r<n; r++) { 
			cin>>aux; 
			monster[r] = aux; 
			chosen[r] = 0;
		}
		
		chosen[0] = 1; 
		for(int i=1; i<n; i++) {

			if (chosen[i-1])
			{
				if (monster[i-1] < monster[i])
				{
					chosen[i-1] = 0; 
					chosen[i] = 1; 
					rec_rev(monster, chosen, i-2); 		
				}
			}
			else { 
				chosen[i] = 1; 
			}	
		}	

		resp[c] = bits_sum(monster, chosen, n); 
	}

	for(int j=0; j<t; j++) { 
		cout<<"Case "<<j+1<<": "<<resp[j]<<endl; 
	}

	return 0; 
}

void rec_rev(int coins[], bool chosen[], int ind)
{
	if (ind >= 1)
	{
		if (chosen[ind]==0 && chosen[ind-1]==0)
		{
			chosen[ind] = 1; 
		}
		else if (chosen[ind-1]==1 && chosen[ind]==0)
		{
			if (coins[ind] > coins[ind-1])
			{
				chosen[ind-1] = 0; 
				chosen[ind] = 1; 
				rec_rev(coins, chosen, ind-2); 
			}
			
		}
	}
	else if (ind==0)
	{
		chosen[ind] = 1; 
	}

}

int bits_sum(int coins[], bool chosen[], int size) 
{
	int acum = 0; 

	for(int i=0; i<size; i++) { 
		if (chosen[i]) { 
			acum += coins[i]; 
		}
	}
	return acum; 

}
168931000100013maraton/mylib332041000100013226maraton/mylib/c++_template
#include<iostream> 
#include<stdio.h> 
#include<string>
#include<algorithm> 

using namespace std; 

int main() 
{ 

	return 0; 
}
168931000100020maraton/mylib/miscel332041000100055030maraton/mylib/miscel/sieve.cpp
#include<iostream> 
#include<stdio.h> 
#include<math.h>
#include<string>
#include<algorithm> 

using namespace std; 

void sieve(int sect[], int n) { 

	for (unsigned int c=2; c<n+1; c++) { 
		sect[c] = c; 
	}
	sect[1] = 0;

	int i=2; 
	int j;
	while(i <= sqrt(n)) {
	
		j = 2;	
		if (sect[i] != 0) 
		{
			while (i*j <= n) { 
				sect[i*j] = 0; 
				j++; 
			}
		}
		
		i++;
	}

}

int main() { 
	int a;
	cin>>a;
	int arr[a+1];
	sieve(arr,a); 
	
	for (int k=2; k<a+1; k++) {
		
		if(arr[k] != 0)
		{
			cout<<arr[k]<<endl; 
		}
	}
	
	return 0; 
}

332041000100029029maraton/mylib/miscel/fibo.cpp
#include<iostream> 

using namespace std; 

int fibo (int x) { 
	int n = 0 ; 

	if (x == 0) 
	{ 
		return 0;
	}	
	else if (x == 1) 
	{
		return 1; 
	}
	else if (x > 1) 
	{ 
		n += fibo(x-1) + fibo(x-2) ; 	
	}
}

int main()
{
	int c; 
	cin>>c; 

	cout<<fibo(c)<<endl; 

	return 0 ; 
}
	
	

332041000100029631maraton/mylib/miscel/fact_r.cpp
#include<iostream> 

using namespace std; 

unsigned long long fact(int x); 

int main() {
	int c;
	cin>>c; 
	
	cout<<fact(c)<<endl; 

	return 0 ;
}

unsigned long long fact(int x) {
	unsigned long long r = x;
		
	if (x == 1) 
	{	
		return x ; 
	}
	else if (x > 1)
	{
		r = r * fact(x-1);
	}

}
332041000100028031maraton/mylib/miscel/fact_i.cpp
#include<iostream> 

using namespace std; 

unsigned long long fact_r(int x); 

int main() 
{
	int c; 
	cin>>c; 
	
	cout<<fact_r(c)<<endl; 

	return 0; 
}

unsigned long long fact_r(int x) { 
	unsigned long long r = 1; 
	
	while (x != 0) { 
		r *= x; 
		x--; 
	}
	
	return r; 
}
332041000100057331maraton/mylib/miscel/sizeof.cpp
#include<iostream>
using namespace std; 

int main() { 
	cout<<"Size of int is: "<<sizeof(int)<<" bytes"<<endl;
	cout<<"Size of short int is: "<<sizeof(short)<<" bytes"<<endl;
	cout<<"Size of long int is: "<<sizeof(long int)<<" bytes"<<endl;
	cout<<"Size of float is: "<<sizeof(float)<<" bytes"<<endl;
	cout<<"Size of double is: "<<sizeof(double)<<" bytes"<<endl;
	cout<<"Size of long double is: "<<sizeof(long double)<<" bytes"<<endl;
	cout<<"Size of bool is: "<<sizeof(bool)<<" bytes"<<endl; 
	cout<<"Size of char is: "<<sizeof(char)<<" bytes"<<endl;

	return 0;
}
	



168931000100019maraton/mylib/graph33277100010006623223maraton/mylib/graph/outELF              ��4   ��      4   	 (       4   4�4�               T  T�T�                    � �؃  ؃           �  ���  �           �  �   �            h  h�h�D   D         P�td T   � ��  �        Q�td                          R�td�  ��          /lib/ld-linux.so.2           GNU                        GNU �VY����0�XL�=��d�              !a         s��K��!��	(E�L�CyIk�                �             �             �                                           �             �             q             �             
             3               i              O               @             :             V             �             �              �                          �              �                           	             �             �  � �     �  ��       `�       �  ��       �    !�     %  ��        libstdc++.so.6 __gmon_start__ _Jv_RegisterClasses _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc _ZSt4cout _ZNSolsEPFRSoS_E __cxa_end_catch _ZSt28_Rb_tree_rebalance_for_erasePSt18_Rb_tree_node_baseRS_ __cxa_begin_catch _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_ _ZSt20__throw_length_errorPKc __cxa_rethrow _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base _ZNSt8ios_base4InitD1Ev _ZSt17__throw_bad_allocv __gxx_personality_v0 _Znwj _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base _ZNSt8ios_base4InitC1Ev _ZNSirsERi _ZdlPv _ZSt3cin _ZNSolsEi libgcc_s.so.1 _Unwind_Resume libc.so.6 _IO_stdin_used __stack_chk_fail __cxa_atexit memmove __libc_start_main GCC_3.0 GLIBC_2.4 GLIBC_2.0 GLIBC_2.1.3 CXXABI_1.3 GLIBCXX_3.4                                         �         P&y           �     @   ii   $     ii   .     si	   8                  ӯk   D     t)�   O      �  �    !                     $ 	  ( 
  ,   0   4   8   <   @   D   H   L   P   T   X   \   `   d   h   S����  ���  ��������t�  ��[� �5 �%     �% h    ������% h   ������% h   ������% h   �����% h    �����%  h(   �����%$ h0   �����%( h8   �p����%, h@   �`����%0 hH   �P����%4 hP   �@����%8 hX   �0����%< h`   � ����%@ hh   �����%D hp   � ����%H hx   ������%L h�   ������%P h�   ������%T h�   ������%X h�   �����%\ h�   �����%` h�   �����%d h�   �����%h h�   �p����%�f�        1�^����PTRh��hP�QVh�������f�f�f�f�f�f�f��$�f�f�f�f�f�f��w -t ��v�    ��tU���ht �Ѓ���Ð�t& �t -t ���������t�    ��tU���Pht �҃���Ít& ��'    �=�! uU����|�����!���f�� ���u듍v �    ��t�U���P�҃���u����L$����q�U��VSQ��Le�   �E�1����E�P�E	  �����E�P�	  �����E�Ph� ���������E�PR�������U��E���RP�E�P�z  ���E���j P�E�P��	  ���E�    �E�9E�}�E���P�E�P�t
  ��� �����E��ك��E�Ph� �������u��]����E�P�E�P�M
  ��V�E�PS�E�P�,  �����E�P�  ���E�    �E�9E�}=�E���P�E�P��	  ��� ��Ph !�I�������h��P�������E�뻃�h`�h !�������    ���E�P�  �����E�P��  ���؋M�e3   tI�B�Ã��E�P��  ����Ã��E�P�D  ����Ã��E�P�  ���؃�P�����`����e�Y[^]�a��U��S��4�E�E�e�   �E�1����E�P��  ���E���U�RP�u���
  �����E�P��  ���E�    �E�;E}*�]�E���P�u��f  ����j SP��  ���E����E�    �E�;E��   ���E�Ph� ����������E�PR���������E�PR�������E܉ËE؃�P�u���
  ����SP�@  ���E��E�닉Ã��E�P�  ���؃�P�������E�e3   t�&����]���U��S��   �E��d����E��`���e�   �E�1�����|���P�  �����E�P�r
  ���E��P��`����  ���E��E��j P��|���P��  ��ǅt���    ��t���;E}(��t�����P��|���P�V  ��� �����t����͋E��p�����h��h !������ǅx���    ��x���;E�`  ���E�P�E�P�=
  ������`����E�P��  ������d����E�P��  ������p�����|���P�E�P�E�P�u�E�P��  �� ���E�P�  �����E�P�p  �����E�P�  �����E�P�E�P�	  ������|���P�E�P�N  �����E�P�E�P��  ����l������E�P�  �����E�P�U  ����l�����P��`����  ����p��������l���P�E�P�C	  ����l�����P��|���P��  ��� �����l�����p�����x���������h��h !���������E�P��  ������|���P�\  ����E�e3   ��   �   �Ã��E�P�  ����Ã��E�P�"  ����Ã��E�P�c  ���(�Ã��E�P��  ����Ã��E�P�=  ����Ã��E�P�*  ����Ã���|���P��  ���؃�P����������]���U��VS�� �E�E�E�E��E�E܋E�E�e�   �E�1��E�    �E�;E��   �E�ËE��P�u��  ����SP�g  ��� ��������   �E��P�u��F  ��� ���������   �E��P�u��$  ����E�ƋE��P�u��  ����VP��  ��� 9�����tR�E��P�u���  ���ËE�ƋE��P�u��j  ����VP�  ��� ��E���U�R�u�P�  ���E���E��������E�e3   t�����e�[^]�U���8�E�EԋE�E�e�   �E�1��E�������E�P�;  ���Ẽ��u�P�9  ���ẺE�E���u�P�i  �����E�P�E�P�  ����t���E�P��  ��� ��P�u���  ��� ;E�����t9���E�P��  ��� ��P�u��  ��� �E���E�P�  ��� �E��E��j �U�RP�4  ���X����E��M�e3   t������U����}u3�}��  u*��h�!���������hp h�!h�����������U�����h��  j��������U��E]�U��]�U��E�@��t�E�@�E��E]�U��E�@��t�E�@�E��E]�U����E��P�  �����U����E��P��  �����U��S���E��P�;  �����E�P�E� ��QRP�(  ���E��P�  ����ËE��P�  ���؃�P� ����]��ÐU����E��P�  �����U��S���E��P�u  �����E�P�E� ��QRP�b  ���E��P��  ����ËE��P��  ���؃�P�����]��ÐU��S��$�E�E�e�   �E�1����u��#  ��;E����t>���u��  ���E)ЉÍE����u�P�
  ���EPS�u��u��  ���4���u���  ��;E����t�E� �U��Ѓ�P�u��  ����E�e3   t�*����]��ÐU��E� �U���]�U��VS�� �E�E�E�E�e�   �E�1��E���P�  ����P��  ���Ã��u���  ���E��SRP��  ���E��P�9  ���ƋE��E���u�P�Z  ���E����u�P��  ��VS�u��u��  ���E�P��E�e3   t#��ËE��P�l  ���؃�P������3����e�[^]�U��VS�� �E�E�E�E�e�   �E�1��E���P�?  ����P�+  ���Ã��u��M  ���E��SRP�  ���E��P�	  ���ƋE��E���u�P�  ���E����u�P�,  ��VS�u��u��  ���E�P��E�e3   t#��ËE��P�B  ���؃�P������M����e�[^]�U��S��$�E�E�E�E�e�   �E�1����u��  ��;E����t=���u��  ���E)ЉÍE����u�P�:  ���u�S�u��u��J  ���:���u���  ��;E����t"�E��U������ȃ�P�u��,  ����E�e3   t�����]���U��E��U�������]�U����E��P�"  �����U������u�#  ����ÐU��S�����u�x  ����P�u�  ���E��P��������ËE��P�������؃�P�����]���U����U�E��RP�*  �����U����E���uP�-  ����U���(�E�E�E�E��E�E�e�   �E�1��U��E���u�RP�r  �����E�P�E�P�I	  �����E��P�E�P�u��@	  ���E�M�e3   t�5����� �U��E�     �]ÐU���(�E�E�E�E�e�   �E�1��U��E��RP�	  ���E�M�e3   t������� U���(�E�E�E�E�e�   �E�1��U��E��RP��  ���E�M�e3   t������ U��E��E� 9���]�U���(�E�E�E�E�e�   �E�1��E�U����E�� ��P�������E����E�M�e3   t�(����� U����E� ��P�d  ���ÐU������u�  ����ÐU����E��P�N  �����U��S���E�@�E� )���i������E� ��RP�u�_  ���E��P��������ËE��P�y������؃�P�����]���U��E]�U������u�u�2  �����U������u�i  ����ÐU����E��P�  �����U��S���E�@�E� )����E� ��RP�u�3  ���E��P��������ËE��P�������؃�P�_����]���U��E]�U������u�u�  �����U��E�@�E� )���]ÐU����E����P�u��  ���E�� U����u�u�u�u��  ����ÐU����E��P�r������E�@��RP�u�b������E�U�P��ÐU��E�@�E� )���i�����]�U��E]ÐU��E]�U��S���E���uP�  �����u�u�  ����ËE��P�������؃�P�,����]��ÐU���(�E�E�E�E�e�   �E�1��E�� �E����E�P�u��  ���E�U�e3   t�;����� �U���(�E�E�E�E�e�   �E�1��E��@�E����E�P�u��O  ���E�U�e3   t������� U������u�u�u�-  ����U��E]�U��E]�U��S���E���uP�"  �����u�u�I  ����ËE��P�2������؃�P�����]��ÐU���(�E�E�E�E�e�   �E�1��E�� �E����E�P�u��.  ���E�U�e3   t�!����� �U���(�E�E�E�E�e�   �E�1��E��@�E����E�P�u���
  ���E�U�e3   t������� U������u�u�u�
  ����U����E����P�u�
  ���E�� U����u�u�u�u�
  ����ÐU����E��P��������E�@��RP�u��������E�U�P��ÐU����E��P�  �����U������u�S  ����ÐU����} tG���u�;  ����P�u����������u�)  ���E���u�u�   ���E�E볐��U��E�@]ÐU��VS���u�*  ����P�  �����U�E��QRP�  �����u�\  ����������   ���u�M  ���Ã��u�U  ���ƃ��u�9  ����VP�u�A  ������u�  ���Ã��u��  ��� ��P�|  ������u�  ���Ã��u��  ��� ��P�p  ����E�P�E�P��ËE��P�J������؃�P�.�����e�[^]�U���(�E�E�E�E�e�   �E�1��E���u��u�P�!  �����u��  ���E���u��u��u��  �����u��  ���E�)ЋM�e3   t�	����ÐU��S��4�E�EԋE�EЋE�E�e�   �E�1����u̍E�P�I  ���E��R�u�P�  ���E���tO���uЍE�P�#  ���E��M��U�E���]�S�u�QR�u�P�  �����E�P�E�P�u��  ���-�E� �E��P�E�P�  �����E�P�E�P�u���  ���EԋM�e3   t�$����]��� �U��E��E��]�U��E�U���E��E�P�]�U����E�@��P�u�  ���E�� U����E����P�u�  ���E�� U����E����P�y  ����U������u�k  ���E�     �E�@    �E�@    ���U������u�O  ����ÐU����} t�E���u�uP�0  �����U������u�u�3  �����U������u�M  ���E�     �E�@    �E�@    ���U������u�1  ����ÐU����} t�E���u�uP�  �����U������u�u�  �����U��E��E��]�U��VS��@�E�EċE�E�e�   �E�1��} ��  �Eċ@�Eċ@)���;E��  �E�� �EԍE؃��u�P���������EP�E�P�  ���E��Eċ@�E�E�;E��   �Eă�P�������ƋEċP�Eċ@�MċI�]�����VRPQ�x  ���Eċ@�U��EĉP�E���؉E����EP�a  ��� ���u�SP�W  �����EP�@  ��� �U������EP�&  ��� ���U�RSP�U  ����  �Eă�P�]��������E+E��Eċ@Q�M�QRP�]  ���EĉP�Eă�P�'������ƋEċX���EP�  ��� VS�u�P�  ���Eċ@�U���EĉP���EP�  ��� ���U�R�u�P�  ���1  ��h���u�u���  ���E�E؃��u�P�  �����E�P�EP��  ���E�Eă��u�P�  ���E��E��E܋Eă�P�X������E��    �E��R�u��uP�V  ���E�    �Eă�P�!������Ã��EP�  ����Eċ S�u�RP�`  ���E܋E��E܋Eă�P��������ƋEċX���EP�k  ��� V�u�SP�  ���E܋Eă�P���������EċP�Eċ ��QRP�������Eċ@�Eċ )������Eċ�Eă�QRP�^������EċU���EċU܉P�E��    �E�EĉP�   ��P�c������}� uD�Eă�P���������U�EЍ�    �E�E��    �E�؃�QRP��������!�Eă�P���������P�u��u���������Eă��u��u�P������������������؃�P�������E�e3   t�7����e�[^]�U������u�u��  ���E�     �E�@    �E�@    ��ÐU������u�u��  ���E��E��E�P�E��U��������E�P���U��E��E��]�U����E����u�u�u�  ����U������u�u�  ���E�     �E�@    �E�@    ��ÐU������u�u�  ���E��E��E�P�E� �U��E�P��ÐU��E��E��]�U����E����u�u�u�  ����U��E��E��]�U��WVS��L�E�E��E�E�e�   �E�1��} �t  �E��@�E��@)���i�����;E��  ���u��E�P�A������E����u�P���������EP�E�P�*  ���EċE��@�EȋE�;E��   �E���P�������ǋE��X�E��H�E��p�U���������WSQP�  ���E��H�U��������E��P�U�������؉Eȍ���EP��  ��� ���u�SP��  �����EP��  ����U����������EP�  ��� ���U�RSP��  ���   �E���P����������E+EĉE��@Q�M�QRP��  ���E��P�E���P�������ƋE��X���EP�6  ��� VS�u�P�	  ���E��H�Uĉ�������E��P���EP��  ��� ���U�R�u�P�)  �����E�P�\������j  ��h���u�u��W  ���E̍E؃��u�P�$  �����E�P�EP�=  ���EЋE����u�P�(  ���EԋEԉE��E���P���������UЉ������E��Q�u��uP��  ���E�    �E���P�������Ã��EP�  ����E�� S�u�RP�  ���E��U������E��E���P�<������ƋE��X���EP��  ��� V�u�SP�Z  ���E��E���P���������E��P�E�� ��QRP��������E��@�E�� )���i��������E���E���QRP��������E��Uԉ�E��U��P�Ủ������E�E��P��   �Ã��E�P�������؃�P�x�����P�O������}� uM�E���P�J������ËUЋE������Eԍ�UЉ������E�Ѓ�SQP�������!�E���P���������P�u��u���������E����u��u�P� ����������������؃�P�������E�e3   t�����e�[^_]�U������u��  ���E�@    �E�@    �E�@    �E�@    �E�@    ���u��  ����ÐU��]�U��E�@]�U��E�@]�U������u�u��  �����u�u�+  �����U��E]ÐU��E]�U������u�u�(  ���E�@    �E�@    �E�@    �E�@    �E�@    ���u�  �����U��E�@]ÐU��E��]ÐU��E�@]ÐU��E��]ÐU���(�E�E�E�E��E�E�e�   �E�1����u�E�P�$  ���E�P�u��u��u��  ���U�e3   t�}����ÐU��E��]�U������u�6������ÐU��E��]�U������u�1������ÐU���8�E�EԋE�EЋE�E�e�   �E�1����u��X������E���u��������E�}� ��   ���u���  ���EЃ��u�RP�+  ����t���u��������E�뼃��u��  ���EЃ�R�u�P��  ����t�E�E���u���������E��y����E�E�E�E��E�E���u��������E���u��������E�E����u��u��u��u�P�  ���E܃��u��u��u��u�P�{  �����E�P�E�P�u��W  ���:���u�E�P�  �����u�E�P�  �����E�P�E�P�u��  ���EԋM�e3   t������ U��E�@]ÐU���(�E�E�e�   �E�1����EP�E�P�G��������EP�E�P�4��������u��u��u���  ����E�e3   t�'����ÐU���8�E�EԋE�EЋE�E�e�   �E�1����u��F������E���u��������E��E��}� tU�E�E����u���
  ���EЃ�R�u�P�  ���E߀}� t���u������������u���������E�륃��u��E�P�7  ���}� t\�E���u�P�  �����E�P�E�P�  ����t$�E��E�E�E���E�P�E�P�u��
  ���x���E�P�  ���E���P�)  ���EЃ��u�RP�O
  ����t$�E��E�E�E���E�P�E�P�u��  ����E�    ���E�P�E�P�u��  ���EԋM�e3   t������ �U��E]�U��E�U��]�U��VS��0�E�E�E�E��E�E܋E�E؋E�EԋE�E�e�   �E�1��    �}� uQ���u��C�����;E�t>���u��=  ���ƻ   ���uԍE�P�q������E���VRP�L	  ����t�   ��    �E�ې���u��u��3  ���E��E��P�E�R�u��u�P�������E��@�P�E��P���u��u��J   ���E�M�e3   t��ې��P�����_����e�[^]� U��E�U���E��E�P�]�U��E�U��]�U��E�U��]�U��E]�U������u�  ����ÐU��]�U������u�u�u�u  �����U����E;Et ���u�m  ����P�i  ���E�ؐ��U������u�c  ����ÐU��]�U������u�u�u�E  �����U��]�U��S�����u�?   ��� �Ã��u�-   ��� )É����]���U����u�u�u�u�  ����U��E]�U��S�����u�  ���Ã��u��
  �����uSP��
  ���]���U��S�����u�%  ���Ã��u�  �����uSP�  ����]���U������u�u�u�"  ���ÐU��S��$�E�E�E�E�e�   �E�1����u��  ���Ã��u���������)E9�����t���u��W������u��������Ã��u��t������E���EP�E�P��
  ��� ؉E����u��I�����;E�w���u��
  ��;E�s���u��y
  ����E��M�e3   t�����]��ÐU����E��P�u�	������E�� �U����} t�E���uP�]
  ����    ��U����u�u�u�u�%	  ���ÐU������u�u�<
  �����U����} t�E���uP�!
  ����    ��U��S���E�E���EP�EP�
  ����tA���EP�G
  ���Ã��u��b  ����SP�4
  �����EP�
  ���E�먋E��4��P���������u��u�Q�����������������؃�P������]���U������u�u�
  �����U������u�u�u�
  ����U��S�����u�F   ��� �Ã��u�4   ��� )É���i������]���U����u�u�u�u�
  ���ÐU��E]�U��S�����u�
  ���Ã��u��	  �����uSP�
  ���]���U��S�����u�2
  ���Ã��u�"
  �����uSP�(
  ����]���U������u�u�u�0
  ���ÐU��S��$�E�E�E�E�e�   �E�1����u��!
  ���Ã��u����������)E9�����t���u��������u���������Ã��u��������E���EP�E�P�  ��� ؉E����u�������;E�w���u��	  ��;E�s���u��	  ����E��M�e3   t�P����]��ÐU����E��P�u�[������E�� U����u�u�u�u�Z  ���ÐU������u�?	  ����ÐU��E�@    �E�@    �E�P�E�P�E�P�E�P�]�U��S��$�E�E�E�E�e�   �E�1����u��	  ���ÍE���u�P��  ����S�E�P�	  �����E�P��������E�e3   t�S����]���U������u��  ����j�uP�  �����U������u�u��  �����U��S�����u�u�u�  ���E��E��U�P�E�@��t(���u��  ���u�u�P�u�������E��P�E��E���u�  ���E�} tt���u�u�u�C  ���E�E�U�P�E�U�P�E�@��t(���u�_  ���u�u�P�u�:������E�P�E�E���u�<  ���E놋E��4��P���������u��u��������k������D����؃�P�����]���U���(�E�E�e�   �E�1����u���  ����P�E�P�(������U�e3   t������U��E��E� 9���]�U����} tV���u�������E���uRP�����������t�E�E���u�������E뷃��u�z������E뤃��u�u��������E�� U����} tS���u�������E��R�uP�F�������t�E�E���u�!������E뺃��u�������E맃��u�u�g������E�� �U��E�U���E�U��P�]ÐU��S��4�E�E�e�   �E�1��    �E� �E����u�P��   ���E����E�P�E�P�������E����E�P�EP�P  ����tL�E���u�P�N  ���   ���E�P�E�P��������E����E�P�EP�  ����t�   ��    �}� �ۀ}� �}� ��t���u��  ���?���EP�EP��������t(�E���j �URP����������u��u��  ������E�e3   t�Q����]���U����E�@��P�u��������E�� U��E��E� 9���]�U��E��E��E��E�P�]ÐU����E� ��P�v������E��E��U���(�E�E�e�   �E�1����u��o  ����P�E�P�������U�e3   t�����ÐU����E� ���uP�G  ����U��]�U������u���������U��E]�U������u����������U��]�U������u���������U������u�u�u�  ����U������u�  ����U��VS���u�8   ���ƃ��u�(   ���Ã��u�   ����VSP��  ���e�[^]�U������u�  ����U����E� �E��E;Et�E�U���E����U����E����u�u�u�  ����U����E��P�n�������P�  ����U��E��E� 9�s�E��E]�U�����j �u�u�h  ���ÐU��]�U�����j �u�u�~  ����U��S�����u�  ������u�  ��� 9����]���U��E� �P�E��E]ÐU��E� ]�U��WVS���u��Vj�)������Å�t+���uS��������ǃ�VS����������P�������e�[^_]�U��]�U���(�E�E�e�   �E�1��E���uP��  ���E����uP��  �����u��u��u��	  ���U�e3   t������U������u�u�u�$  ����U������u�.  ����U��VS���u�8   ���ƃ��u�(   ���Ã��u�   ����VSP��  ���e�[^]�U������u��  ����U����E;Et���u�u��  ���E����U����E����u�u�u��  ����U����E��P���������P�R  ���ÐU��]�U������u�=�������P�u�<  ���E�� U����E����P�4  ����U��]�U������u�u�u�  ����ÐU��E]�U��]�U������u��������P�u�������E�E��E��E��@    �E��@    �E���U��E�@]�U��E�@]�U������u�&������ÐU��E��E� 9���]�U����E����P�u�f������E�� U������u���������P�u�p������E��P�C  ����ÐU������u�u�Z  �����U������u��������U������u�o  ���E���u�u��u�|  ���E���U����E����u�u�u��  ����U��E]�U����E����u�u�u��  ����U������u�u�u�  ����U������u�  ����U������u�  ��;E����t������E����P�4������ÐU������u��  ��;E����t�����U��������P��������ÐU��E]�U���(�E�E�e�   �E�1��E���uP�  ���E�U�e3   t������� U��VS���u�������ƃ��u�[  ���Ã��u�K  ����VSP�S  ���e�[^]�U����E����u�u�u�N  ����U��E]�U����E� ���u�u�u�  ���ÐU��WVS��L�E�E��E�E�e�   �E�1��E�;E��  ���u��g������E܃��u��  ��;E�������   �E����u�P�������Eă��u�P�P������u��u��u��u��l  ���E��E���P����������E��P�E�� ��QRP��������E��@�E�� )������E���E���QRP�������E��U���E�� �U���E��P�  ���u�������;E�������   �E���P�J������ÍEȃ��u�P�r������Ẽ��u�P�B������EЃ��u�P�������Eԃ��u�P�N������E��u��u��u�P��  ����S�u��u��>  ���u�E���E��0���u������������E�� ��SRP�%  ���E���P�������E��E��p�E��X�E��8���u�����������u�VSP�������E�� �U���E��P�E��}�e3=   t�����e�[^_]�U��S���E�E�} t'���u��w��������uP�G������m�E��ӋE��4��P�"��������u��u�o�������������ҽ���؃�P�����]���U������u��  ����U������u���������U��E]ÐU������u苼������ÐU��E�@    �E�P�E�P�E�P�E�P�E�@    �]�U����E�P�E��RP�������E���u��u�'������E�@�P��E�P���U������u�O�������jP�  ����U��S��$�E�E�E�E��E�E�e�   �E�1����u���������ÍE���u�P���������u�S�E�P�P  �����E�P�S�������E�e3   t�����]���U������u�u�u�  ����U����U�E)����E�}� t)�E��    �E����؉��Eȃ�R�uP�߻�����E����؉E���U������u����������u�uP�  ���ÐU�����?]�U��UUU]�U��E�U��E]� U������u�  ����U����E����u�u�u�  ����U��S���E�E�E;Et'���u����������uP�q������E�E��ыE��4��P�L��������u��u�������#�����������؃�P�A����]���U����U�E)���i������E�}� ~�m�m���u�u�.������m��ۋE��U��E�@�E� )���]ÐU��S���E���uP�������E�E��P�Z�����P�u��u�u�6������E��8��P�q������E���u�u�P� ������D����������؃�P�b����]���U���(�E�E�e�   �E�1��E���uP�������E����uP�}������E��u�u��u�P�>  ���E�U�e3   t�Y����� U������u�u�  �����U��S�����u�,������Ã��u���������uSP�x  ���]���U�����j �u�u�  ����U����E��Pj��������t�U�����U����E� �E��E�E��}� t�E�U���m��E��E��U������EP�t  ��� ��U����U�E)����E�}� t�E�����P�u�u�v������E��    �E���U��VS�� �E�E�e�   �E�1����u�  ���ƃ��u�������Ã��u��������VSP�������E����E�P�u��M������E�U�e3   t贷���e�[^]� U������u�u�   �����U��VS���u��������ƃ��u��������Ã��u���������VSP�m   ���e�[^]ÐU������u�q   ��;E����t腷���U���������P��������U��E]�U������u�5   ����U��]�U����E����u�u�u�T�������U�����]�U������EP������� ��f��UWVS臷���çL  ���l$ �������{���������)�����t%1���    ���t$,�t$,U�����������9�u��[^_]Ív ��  S���#�����CL  ��[�       llego
 paso el for
 vector::_M_fill_insert    ;�    ����  �����	  �����	  Ϻ�� 
  ���T
  U����
  ^����,  ����-  �����  ����	  ����0	  ����P	  ��� 
  ����
  2����
  �����
  ����  ���8  ����\  ����|  �����  �����  n���   ����   ����@  ����`  ����  (����  B����  �����  ����  ���,  `���L  t���l  �����  �����  �����  ����  ����  ����8  ����X  ����x  �����  6����  >����  X���  r���$  ����D  ����d  �����  ����  ����  ����  j���  ����0  
���P  &���p  .����  6����  �����  �����  $���  @���<  b���\  ����|  �����  �����  �����  @����  L���  j���L  ����l  �����  �����   ����  "����  D���  ^���0  ����P  ����p  �����  �����  ����  4����  X���  r���0  ����P  �����  �����  >����  N����  n���  ����(  ����H  ����h  ����  &����  �����  6���   <���   G���@  R���`  }����  �����  �����  �����  ����    ���   ���@  ���`  v����  �����  �����  �����  ����   Z���   f���@  ����`  f����  n����  |����  �����  ����  ����0  ����P  ����p  �����  �����  ����  F����  ^���  d���0  ����P  ����p  �����  �����  �����  ����  U���  r���<  T���`  t����  �����  �����  �����  ����   ����0  ����P  ����p  ����  *����  2����  l����  ����  ����<  ����`  �����  �����  �����  ,����  ����  ����$  ����D  ���t  T����  h����  �����  Z����  v���  ����8  ����X  ����x  �����  ����  b����  ~����  ����   ����8   ����X   ����x   �����   �����   �����   	����   Q��� !  g���@!  ����`!  �����!  �����!  �����!  ����!  ��� "  )��� "  Z���D"  p���d"  z����"  �����"  �����"  6����"  R���#  h���8#  ����`#  �����#  �����#  ����#  2����#  8��� $  b��� $  |���@$  ����`$  �����$  �����$  �����$  �����$  ��� %  ��� %  $���@%  8���`%  Z����%  �����%  �����%  �����%  ���� &  ��� &  ���@&  8���`&  T����&  j����&  �����&  �����&  ���� '  )��� '  q���H'  ����h'  �����'  �����'  ����'  ~���(  ����$(  ����D(  ����d(  �����(  �����(  @����(  d����(  ����)  ����()  U���H)  ~���h)  �����)  �����)  �����)  �����)  ����*  T���4*  ����T*  ����t*  3����*  �����*  �����*  ����+  
���$+  /���D+  `���d+  y����+  �����+  E����+  _����+  ����,  ����4,  ����T,  ���t,  
����,  *����,  4����,  P���4-  �����-         zR |�         <����   FJtx ?;*2$"   @   ·��    A�BD�     `   ����    A�BB�     �   ����    A�BY�     �   ����    A�BY�         zPLR | �� �  @   $   ����  �D Gu Eutu|uxd.�� A�A�A�C (   h   ����4  �A�BD�n.���     P  ����    A�BT�  0   �   ����7  �A�BG�v.. O.��� (   �  ����O   A�BE��D�A�A�      �  ʹ��	   A�B�   �  r���    A�BT�  (   T  j���c   >A�BD�b.y��      <  ����    A�BT�  (   �  ����c   NA�BD�b.y��       �  Ҷ���    A�BD����    �  h���    A�BN�  ,     Z����   ^A�BE��u.f�A�A�,   @  ����   pA�BE��u.f�A�A�    ,  Ƹ���    A�BD����    P  f���    A�BT�     p  ^���    A�BT�     �  V���    A�BS�  (   �  N���V   �A�BD�U.y��      �  x���    A�BX�     �  t���    A�BV�       n���}    A�Bw�    <  ̹��    A�BK�     \  ����H    A�BB�    |  ���H    A�BB�    �  ���    A�BP�     �   ���X    A�BR�    �  8���    A�BU�     �  2���    A�BS�       *���    A�BT�  (   �  "���j   �A�BD�i.y��      h  `���    A�BD�     �  H���    A�BV�     �  B���    A�BS�     �  :���    A�BT�  (   ,  2���d   �A�BD�c.y��        j���    A�BD�     4  R���    A�BV�     T  L���    A�BU�     t  F���"    A�B\�     �  H���    A�BY�     �  F���9    A�Bu�     �  `���    A�B[�     �  _���    A�BD�       H���    A�BD�  (   x  0���M   �A�BD�[.j��      `  R���O    A�BI�    �  ����P    A�BJ�    �  ����    A�BX�     �  ����    A�BD�     �  ����    A�BD�  (   D  ~���M   �A�BD�[.j��      ,  ����O    A�BI�    L  к��P    A�BJ�    l   ���    A�BX�     �  ����"    A�B\�     �  ����    A�BY�     �  ����9    A�Bu�     �  ���    A�BT�     	  ���    A�BS�     ,	  ���V    A�BR�    L	  <���    A�BG�  ,   �  (���  �A�BB���.��A�A�   �	  ���    A�B{�     �	  v����    A�BD����    �	  <���    A�BL�      
  ,���    A�BX�      
  (���"    A�B\�     @
  *���"    A�B\�     `
  ,���    A�BV�     �
  &���4    A�Bp�     �
  :���    A�BS�     �
  2���$    A�B`�     �
  6���    A�BV�        0���4    A�Bp�        D���    A�BS�     @  <���$    A�B`�     `  @���    A�BV�     �  :���    A�BL�  4   �
  *���>  �A�BE��p.�. m�A�A�      �  0���7    A�Bs�     �  H���F    A�BB�      n���    A�BL�     8  ^���     A�B\�     X  ^���7    A�Bs�     x  v���?    A�B{�     �  ����    A�BL�     �  ����     A�B\�     �  ����    A�BL�  4   <  v����  �A�BF���t.
. m�A�A�A�   0  ����W    A�BS�    P  .���    A�BB�     p  ���    A�BG�     �  ����    A�BG�     �  ����+    A�Bg�     �  ����    A�BD�     �  ����    A�BD�       ����Z    A�BV�    0   ���    A�BG�     P  ����    A�BG�     p  ����    A�BG�     �  ����    A�BG�     �  ����]    A�BY�    �  ����    A�BG�     �  ����    A�BR�       ����    A�BG�     0  ����    A�BR�     P  �����   A�B��   p  2���    A�BG�     �  ���e    A�Ba�    �  d����   A�B��   �  ����    A�BD�     �  ����    A�BJ�  ,   T  ����  4A�BE��S.��A�A�   @  ����    A�BX�     `  ����    A�BJ�     �  ����    A�BJ�     �  z���    A�BD�     �  b���    A�BS�     �  Z���    A�BB�        @���    A�BY�        =���1    A�Bm�     @  N���    A�BS�     `  F���    A�BB�     �  ,���    A�BY�     �  )���    A�BB�      �  ���5    A�BD�m��     �   ���    A�BX�       ���    A�BD�      $  ���:    A�BD�r��      H  ���;    A�BD�s��     l  1���    A�BX�      �  .����    A�BD����    �  ����    A�BY�     �  ����'    A�Bc�     �  ����    A�BX�       ����    A�BV�     0  ����'    A�Bc�  ,   �  �����   DA�BD�Q.o. [��      �  d���    A�BV�     �  ^���    A�BX�      �  Z���;    A�BD�s��     �  q���    A�BX�       n���    A�BD�      $  V���:    A�BD�r��      H  l���;    A�BD�s��     l  ����    A�BX�      �  �����    A�BD����    �  >���    A�BY�     �  =���    A�BX�     �  :���    A�BS�       2���2    A�Bn�      0  D���v    A�BD�n��    T  ����(    A�Bd�     t  ����    A�BV�  ,   �  ����(  `A�BD�B.�. [��     �  ����H    A�BD�    �  ����    A�BP�       ����z    A�Bt�    $  ���w    A�Bq�    D  ^���    A�BW�      d  Z���.   A�BD�&��   �  d���"    A�B\�     �  f���    A�BP�     �  Z���    A�BW�     �  V���#    A�B_�       Y���H    A�BD�    (  ����    A�BX�     H  ~���    A�BB�     h  d���    A�BS�     �  [���    A�BD�     �  C���    A�BS�     �  :���    A�BB�     �   ���    A�BS�       ���    A�BX�     (  ���    A�BR�  $   H  	���H    A�BB��@�A�A�   p  )���    A�BR�     �  ���'    A�Bc�     �  &���     A�B\�     �  &���#    A�B_�     �  )���    A�BW�       $���    A�BW�     0   ���    A�BB�     P  ���    A�BW�      p  ���1    A�BD�i��     �  ���    A�BQ�     �  ���
    A�BF�  0     ����T   �A�BF���^.i�A�A�A�       ���    A�BB�     (  ����b    A�B^�    H  6���    A�BX�     h  2���    A�BR�  $   �  (���H    A�BB��@�A�A�   �  H���    A�BR�     �  >���(    A�Bd�     �  F���     A�B\�       F���#    A�B_�     0  J���    A�BB�     P  0���*    A�Bd�     p  :���    A�BV�     �  4���    A�BB�     �  ���    A�BY�     �  ���    A�BD�     �   ���    A�BB�       ����I    A�BE�    0  ���    A�BG�     P  ����    A�BG�     p  ����    A�BR�     �  ����    A�BP�     �  ����"    A�B\�     �  ����5    A�Bq�     �  ����    A�BV�       ����    A�BR�     0  ����0    A�Bl�     P  ����     A�B\�     p  ����    A�BD�     �  ����     A�B\�     �  ����    A�BX�     �  ����    A�BR�     �  ����7    A�Bs�       ����=    A�By�     0  ����    A�BD�     P  ����A    A�B{�  $   p  ���H    A�BB��@�A�A�   �  !���     A�B\�     �  !���    A�BD�     �  	���     A�B\�  ,   �  
���L   A�BF���?�A�A�A�   (   l  &���x   �A�BD�a.t. [��   T  r���    A�BR�     t  h���    A�BS�     �  _���    A�BD�     �  H���    A�BS�     �  @���2    A�Bn�     �  R���B    A�B~�        t���$    A�B`�      4   x���    A�BD�w��    X   ����    A�BX�     x   ����V    A�BR�    �   ���(    A�Bd�     �   ���
    A�BF�     �   ����
    A�BF�     �   ����    A�BL�     !  ����    A�BR�     8!  ����     A�B\�  (   �   ����z   �A�BD�c.t. [��   �!  ���F    A�BB�    �!  >���    A�BU�  (   !  8���   �A�BD�n.n. [��   �!  ����h    A�Bb�    "  ����    A�BV�      0"  ����:    A�BD�r��     T"  ����    A�BW�     t"  ����%    A�Ba�     �"  ����1    A�Bm�     �"  ����    A�BU�     �"  ����E    A�BA� $   �"  ����    A�BE��z�A�A�   #  q���    A�BV�  $   <#  k���H    A�BB��@�A�A�   d#  ����>    A�Bz�     �#  ����    A�BD�     �#  ����    A�BR�     �#  ����    A�BB�     �#  n���     A�B\�     $  n���
    A�BF�     $$  X���    A�BU�     D$  b���B    A�B~�     d$  ����    A�BV�  H   �$  ���]    A�A�A�A�N i$D(D,A0M GA�A�A�A�     �$  (���           ��+%  4� H�� �� �f� �� �  �  ��  5� D�  �  ��\1  @� t�� �� �� �� �� �� �� �� �� �� ��� �� �  �  ��)B 8  Y  ��)B 8  Y  ��U  }'� �  ��U  }'� �  ��5 L  ��0I `  ��*C Z  ��", C  ��", C  ��-  �� �     � %l�  ����1  �E� �        � 5+X  }�� �]  ����7  �  �E�	 �	         ��
[� �b    � 5j� �          �   I}��� �        ��'1 F  � (?Ta n        � *AVc p        �   5B[h u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ����`�             �     �     �   ��   �         �      ���o��   �   �
   [                       �            ,�   �            ���o�����o   ���oD�                                                            &�6�F�V�f�v���������Ɖ։�����&�6�F�V�f�v�����        GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609                        T�          h�          ��          ��          �          �          D�          ��          �     	     ,�     
     �          �          ��          ��          ��          ��           �          ��          �          �          �                               �                      l           �                                 ��             ��          �      .   `�      D   �!     S   �      z   ��      �   �      �            ���   �!     �   ^�B     �   ��                 ��  �                            ��   �       .          D  �       U  �       h        q  Һ;   "  4   l        �  ��
   "    � �     .  ��    "  �  ��=   "  �  ��   "    �j   "  9  L�  "  r  ���   "  �  ��   "               7  �   "  �  �V   "  �  U�(   "    t�X   "  -  _�H   "  Y  2�   "  �  6�   "  �  ��   "    �   "  2  b�   "  �             �  ��   "  �  ޖ�   "    <�   "  e               ��>  "  �  ��   "  �  ��       �   "  +  ��   "  K  ��   "  8   ��      �  ��   "  �  4�$   "  �  �O    K	  y�E   "  �	  ,�v   "  �	  ��   "  F
  Ҝd   "  f
  �   "  �
  ��   "  �
  
�   "  [  ��z   "  �  ��   "  �  X�   "    ��   "  E  ~�   "  y              �              �  t�'   "  �  �   "    ��   "  -  ��     4  ڶ   "  Q             e  ^�   "  �  ��   "  �  &��  "  �  b�   "  N  ��2   "  �  �;   "  �  ��    "  �  r�"   "    ޯW   "  d  ��   "  �  ��   "  �  ��   "    ��        F�   "    @�   "  T             n             �  ��(   "    ط   "  E  Ļ�   "  y  *�
   "  �  ��   "  �  �   "    h�z   "  u  Τ   "  �  �    "  �  8�*   "    
�    "  ?  N�    "  �  v�   "  �  ��   "    ��   "  ;             x  2�:   "  �  ^�   "  �  ��B   "  0  v�.  "  �             �  >�   "  �  n�7   "    ̳�  "  P  n�   "  �  Ҷ   "  �  ė�   "  �  Ķ   "    КH   "  1  ��V   "  �  n�   "  �  �4   "  	  ��   "  A  ^�4   "  �  ��   "  �  ��   "  �  ��#   "  	  ��c   "  "  ��   "  R  �   "  �  Z�   "  �  ��       �  �   "  E  ��   "  s              �             �  �x   "  /  ��   "  O  ��     ^  6�   "  �  ��#   "  �  �   "  �  ��   "  �  ��   "    2�   "  K  Ҡ   "  k  ��   "  �  ��Z   "    ��   "  [  �   "  �  ��   "  �  h�H   "  -  ~�   "  q  ��   "  �  2�c   "  �  ��   "    Ҡ   "  3  ��   "  f  �j   "  �  B�}   "  �  ��   "  �  �   "                 2   l       ?   E�   "  �   )�H   "  �   ��   "  )!  ��    "  T!  Z�5   "  �!   �"   "  �!  �   "  "  ��   "  V"  ��   "  �"  ��?   "  �"  ��   "  �"  T�   "  �"  "�"   "  "#  6�M   "  G#  �#   "  s#  ��   "  �#  n�7   "  �#  d�   "  1$  ԣ   "  p$  �   "  �$  $�   "  %  6�   "  U%  Ҝd   "  u%  ��   "  �%  ��   "  �%  D�   "  �%  ��7   "  "&  ��   "  X&  ��    n&  ė�   "  �&             �&  ��    "  '  ��   "  `'  ��P   "  �'  ̖   "  �'  ԣ   "  �'  ��   "  *(  2�c   "  N(  4�   "  �(  L�  "  �(  ώ7    )  ��F   "  O)  t      [)  X�   "  s)   !�     �)  U�   "  �)  ��   "  *  �   "  >*  &�   "  |*  ��   "  �*  p      �*  ��   "  +  r��   "  D+  r�   "  �+  ��   "  �+  T�   "  ,  �   "  6,  ��   "  ^,  P�]     n,  ~�   "  �,  ��   "  �,  �M   "  �,  �   "  -  ��   "  Q-  �   "  �-  F�   "  �-  ��   "  �-  �   "  !.  ޯW   "  n.  r�   "  �.  >�   "  �.  ԟP   "  /  ��9   "  K/  �1   "  �/  �   "  �/  ��   "  0  ��   "  30  Z�   "  f0  /�1   "  �0             �0  ��   "  41  ��    "  _1  ��c   "  x1  ��9   "  �1  |�  "  +2  ��   "  x2  q�    "  �2  ��"   "  �2  Ķ   "  )3  3�h   "  �3  ��   "  �3  ��   "  �3  ��   "  4  @�$   "  W4  ��   "  �4  �   "  �4  g�'   "  25  ��L  "  O5  �   "  �5  ���   "  6  j�O   "  D6  ��   "  �6  f�   "  �6  �   "  7  t       7             c7  ��   "  y7  n�   "  �7  b�   "  �7  ��   "  �7  ��   "  �7  �   "  8  ��V   "  K8  >�   "  �8  �   "  �8             �8  �4   "  ,9  |�   "  W9  �   "  �9  U�	    �9  j�   "  :  �M   "  K:  6�   "  �:             �:  �   "  �:  �H   "  ";  ��    "  P;  ż   "  �;  ��   "  �;  8�"   "  <  �   "  _<  ��   "  �<             �<  Z�   "  �<  T�F   "  a=  G�   "  �=  ��   "  �=  ��   "  >  ҹ'   "  B>  T�   "  v>  ��   "  �>  �]   "  �>  `�   "  X?             k?  j�7   "  �?  �   "  �?  ��>   "  �?  	�H   "  3@  �:   "  Y@  ��   "  �@  ��4    �@  �   "  �@  ޖ�   "  A  z�T   "  LA  ��Z   "  �A  ��   "  P  �!      �A             B  ��   "  lB  )�1   "  �B  ��   "  C  ̛   "  ?C  R�   "  �C  �H   "  �C  ��   "  *D   �   "  gD  Z�   "  �D  ��(   "  �D             
E  l�;   "  6E             \E  �H   "  �E  Ȕ   "  �E  ��A   "  HF  �(  "  �F  `�   "  �F  ��V   "  G  �   "  @G  ʽ   "  dG  `�       �G  d�   "  �G             H  @�"   "  )H  .�   "  ]H  �   "  �H  ��   "  �H  ��0   "  I  ��   "  !I  
�%   "  QI  ڶ   "  nI  t       uI     "  ~I  ���  "  �I  ��       �I  �   "  �I  ~�
   "  J  p�
   "  dJ  ��O   "  �J  ��7   "  �J  �w   "  #K  ���   "  OK             gK  ��   "  �K  6�M   "  �K  �   "  L  ��2   "  ]L  }�   "  �L  ��I   "   M  ��   "  =M  *�   "  �M  ʽ   "  �M  ��   "  �M  ^�4   "  !N  ��   "  @N  ��b   "  �N  ��$   "  �N  f�e   "  $O  $�   "  OO  ��:   "  kO  R�+   "  �O  Q�   "  �   ���    �O  �   "  h,  �      PP  8�   "  �P  ��   "  �P  (�   "  �P  ��5   "   crtstuff.c __JCR_LIST__ deregister_tm_clones __do_global_dtors_aux completed.7209 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry prim.cpp _ZStL8__ioinit _Z41__static_initialization_and_destruction_0ii _GLOBAL__sub_I_main __FRAME_END__ __JCR_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ __init_array_end __init_array_start _DYNAMIC _ZN9__gnu_cxxmiIPSt6vectorIiSaIiEES1_IS3_SaIS3_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKSA_SD_ _ZNK9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE8max_sizeEv _ZSt3cin@@GLIBCXX_3.4 _ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_ _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE8allocateEjPKv _ZSt12__miter_baseIPiENSt11_Miter_baseIT_E13iterator_typeES2_ _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EED1Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEEC2ERKS5_ _ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEENS1_IPiS6_EEET1_T0_SB_SA_ _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EEC2Ev _ZSt20__throw_length_errorPKc@@GLIBCXX_3.4 _ZNSt12_Destroy_auxILb1EE9__destroyIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEEEvT_S9_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_M_eraseEPSt13_Rb_tree_nodeIiE _ZSt6fill_nIPijiET_S1_T0_RKT1_ _ZNSt23_Rb_tree_const_iteratorIiEppEi _ZSt14__copy_move_a2ILb0EPiS0_ET1_T0_S2_S1_ _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEEC2Ev _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEED1Ev _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIiSaIiEEEE10deallocateERS4_PS3_j _ZNSt3setIiSt4lessIiESaIiEED1Ev _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_Alloc_nodeclIiEEPSt13_Rb_tree_nodeIiERKT_ _ZNSolsEi@@GLIBCXX_3.4 _ZSt34__uninitialized_move_if_noexcept_aIPiS0_SaIiEET0_T_S3_S2_RT1_ _ZNSt6vectorIS_IiSaIiEESaIS1_EEC2ERKS3_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_S_rightEPSt18_Rb_tree_node_base __cxa_atexit@@GLIBC_2.1.3 _ZNSt6vectorIiSaIiEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPiS1_EEjRKi _ZSt11__addressofISt6vectorIiSaIiEEEPT_RS3_ __libc_csu_fini _ZNSt3setIiSt4lessIiESaIiEED2Ev _ZNSt3setIiSt4lessIiESaIiEEC1Ev _ZNSt10_Iter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEELb0EE7_S_baseES7_ _ZN9__gnu_cxx13new_allocatorIiEC1ERKS1_ _ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij _Z16update_adyacentsSt6vectorIS_IiSaIiEESaIS1_EEiS1_St3setIiSt4lessIiES0_ERS1_i _ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE15_M_destroy_nodeEPSt13_Rb_tree_nodeIiE _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EED2Ev _ZNSt12_Vector_baseIiSaIiEED2Ev _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEED2Ev _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE19_M_get_Tp_allocatorEv _ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES2_IS4_SaIS4_EEEEPS4_S4_ET0_T_SC_SB_RSaIT1_E _ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPSt6vectorIiSaIiEES5_EET0_T_S7_S6_ _ZNSt20__uninitialized_copyILb1EE13__uninit_copyIPiS2_EET0_T_S4_S3_ _ZNKSt6vectorIiSaIiEE4sizeEv _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEEC1Ev _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEEC1Ev __gmon_start__ _Jv_RegisterClasses _ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implD1Ev _ZNSt23_Rb_tree_const_iteratorIiEC1Ev _fp_hw _ZNSaISt6vectorIiSaIiEEEC1Ev _ZdlPv@@GLIBCXX_3.4 _ZN9__gnu_cxx13new_allocatorIiED1Ev _ZNSaIiEC1ERKS_ _ZNSt6vectorIS_IiSaIiEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEjRKS1_ _ZNSt6vectorIS_IiSaIiEESaIS1_EE6insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEjRKS1_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EE8_M_resetEv _ZSt4fillIPiiEvT_S1_RKT0_ _ZSt20uninitialized_fill_nIPSt6vectorIiSaIiEEjS2_ET_S4_T0_RKT1_ _ZNSt6vectorIiSaIiEE3endEv _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EEC1Ev _ZNSaIiEC1ISt13_Rb_tree_nodeIiEEERKSaIT_E _ZNSt10_Iter_baseIPSt6vectorIiSaIiEELb0EE7_S_baseES3_ _ZNSt6vectorIiSaIiEE6insertEN9__gnu_cxx17__normal_iteratorIPiS1_EEjRKi _ZNSaIiEC2Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_M_beginEv __cxa_rethrow@@CXXABI_1.3 _ZNSt8ios_base4InitC1Ev@@GLIBCXX_3.4 _ZSt8__fill_aIPSt6vectorIiSaIiEES2_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT0_E7__valueEvE6__typeET_SB_RKS7_ _ZNK9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEE4baseEv _ZNKSt6vectorIS_IiSaIiEESaIS1_EE12_M_check_lenEjPKc _ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEE8max_sizeEv _ZNSt6vectorIS_IiSaIiEESaIS1_EE5beginEv _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEEC2ERKS4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE14_M_lower_boundEPSt13_Rb_tree_nodeIiES8_RKi _ZSt8_DestroyIPSt6vectorIiSaIiEEEvT_S4_ _ZSt22__copy_move_backward_aILb0EPiS0_ET1_T0_S2_S1_ _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13get_allocatorEv _ZSt13__copy_move_aILb0EPiS0_ET1_T0_S2_S1_ _ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES2_IS4_SaIS4_EEEEPS4_ET0_T_SC_SB_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_M_leftmostEv _ZSt8_DestroyISt6vectorIiSaIiEEEvPT_ _ZNSaIiEC2ISt13_Rb_tree_nodeIiEEERKSaIT_E _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@@GLIBCXX_3.4 _ZSt13copy_backwardIPSt6vectorIiSaIiEES3_ET0_T_S5_S4_ _ZN9__gnu_cxx13new_allocatorIiED2Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE12_M_erase_auxESt23_Rb_tree_const_iteratorIiE _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE12_M_erase_auxESt23_Rb_tree_const_iteratorIiES7_ __libc_start_main@@GLIBC_2.0 _ZSt8_DestroyIPiiEvT_S1_RSaIT0_E _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE24_M_get_insert_unique_posERKi _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_Alloc_nodeC2ERS5_ _ZSt11__addressofIKiEPT_RS1_ _ZNSt6vectorIiSaIiEEC1ERKS1_ _ZNSt23_Rb_tree_const_iteratorIiEC1EPKSt18_Rb_tree_node_base _ZNKSt3setIiSt4lessIiESaIiEE5beginEv _ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bIiEEPT_PKS3_S6_S4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_Alloc_nodeC1ERS5_ _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev _ZSt22__uninitialized_move_aIPiS0_SaIiEET0_T_S3_S2_RT1_ _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implC1Ev _ZN9__gnu_cxx14__alloc_traitsISaISt13_Rb_tree_nodeIiEEE8allocateERS3_j _ZNSt3setIiSt4lessIiESaIiEEC2Ev _ZNKSt6vectorIiSaIiEE8max_sizeEv _ZNSt6vectorIiSaIiEED1Ev _ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij _ZNSt4pairISt23_Rb_tree_const_iteratorIiEbEC1ERKS1_RKb _ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEEppEv _ZNSt8ios_base4InitD1Ev@@GLIBCXX_3.4 _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIiSaIiEEEE17_S_select_on_copyERKS4_ _ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev _ITM_deregisterTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@@GLIBCXX_3.4 _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIiSaIiEEjS4_EET_S6_T0_RKT1_ _ZNSt12_Vector_baseIiSaIiEEC1Ev _IO_stdin_used _ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv _ZNSt17_Rb_tree_iteratorIiEmmEv _ZNSaISt13_Rb_tree_nodeIiEEC2Ev _ZnwjPv _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEEC2ERKS3_ _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEEC1Ev _ZNSaISt13_Rb_tree_nodeIiEED1Ev _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEEC1ERKS3_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EEC2ERKS3_RKSaISt13_Rb_tree_nodeIiEE _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE21_M_get_Node_allocatorEv _ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_ _ZSt12__niter_baseIPSt6vectorIiSaIiEEENSt11_Niter_baseIT_E13iterator_typeES5_ _ZSt23__copy_move_backward_a2ILb0EPSt6vectorIiSaIiEES3_ET1_T0_S5_S4_ _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIiSaIiEEEE8max_sizeERKS4_ _ZNSt6vectorIiSaIiEE20_M_allocate_and_copyIN9__gnu_cxx17__normal_iteratorIPKiS1_EEEEPijT_S9_ _ZNSt6vectorIS_IiSaIiEESaIS1_EED1Ev _ZNKSt6vectorIiSaIiEE8capacityEv _ZNSaISt13_Rb_tree_nodeIiEED2Ev _ZSt8_DestroyIPSt6vectorIiSaIiEES2_EvT_S4_RSaIT0_E _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EED2Ev _ZNSt3setIiSt4lessIiESaIiEE6insertERKi _ZNSt4pairISt17_Rb_tree_iteratorIiEbEC1ERKS1_RKb _ZNKSt6vectorIS_IiSaIiEESaIS1_EE4sizeEv _ITM_registerTMCloneTable __data_start _ZSt8_DestroyIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEEvT_S7_ _ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET1_T0_SA_S9_ _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE10deallocateEPS3_j _ZSt18uninitialized_copyIPiS0_ET0_T_S2_S1_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5clearEv _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5beginEv _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implD2Ev _ZSt24__uninitialized_fill_n_aIPSt6vectorIiSaIiEEjS2_S2_ET_S4_T0_RKT1_RSaIT2_E _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EEC1Ev _ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj _ZNSt6vectorIiSaIiEEC2Ev _ZNKSt4lessIiEclERKiS2_ _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE3endEv _ZNSt12_Vector_baseIiSaIiEEC1EjRKS0_ _ZNKSt6vectorIS_IiSaIiEESaIS1_EE8max_sizeEv _ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_ _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE17_M_construct_nodeEPSt13_Rb_tree_nodeIiERKi _ZNSt23_Rb_tree_const_iteratorIiEC2ERKSt17_Rb_tree_iteratorIiE _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIiSaIiEEEE8allocateERS4_j _ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiiET0_T_SA_S9_RSaIT1_E _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEED2Ev _ZNSt12_Vector_baseIiSaIiEED1Ev _ZN9__gnu_cxx13new_allocatorIiEC1Ev _ZNSt12_Vector_baseIiSaIiEEC2Ev _ZNKSt13_Rb_tree_nodeIiE9_M_valptrEv _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implC1ERKS3_ _ZNSt17_Rb_tree_iteratorIiEC1EPSt18_Rb_tree_node_base __x86.get_pc_thunk.bx _ZNSt6vectorIiSaIiEEC2ERKS1_ _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base@@GLIBCXX_3.4 _ZSt22__copy_move_backward_aILb0EPSt6vectorIiSaIiEES3_ET1_T0_S5_S4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_S_rightEPKSt18_Rb_tree_node_base _ZNKSt6vectorIS_IiSaIiEESaIS1_EE3endEv _ZNSt6vectorIiSaIiEEixEj _ZNSt23_Rb_tree_const_iteratorIiEC1ERKSt17_Rb_tree_iteratorIiE _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE21_M_get_Node_allocatorEv _ZNSt6vectorIS_IiSaIiEESaIS1_EED2Ev _ZNSt10_Iter_baseIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEELb1EE7_S_baseES6_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEEC1ERKS5_ _Z7kruskalSt6vectorIS_IiSaIiEESaIS1_EEiRS1_i _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE17_M_create_storageEj __TMC_END__ _ZSt8_DestroyIPiEvT_S1_ _ZSt4cout@@GLIBCXX_3.4 _ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE10_S_maximumEPSt18_Rb_tree_node_base _ZNSt3setIiSt4lessIiESaIiEEC2ERKS3_ _ZN9__gnu_cxx14__alloc_traitsISaIiEE17_S_select_on_copyERKS1_ _ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_ __dso_handle _ZSt11__addressofIiEPT_RS0_ _ZNKSt6vectorIiSaIiEE12_M_check_lenEjPKc _ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC1ERKS1_ _ZSt12__niter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEENSt11_Niter_baseIT_E13iterator_typeES9_ _ZNSt6vectorIiSaIiEE5beginEv _ZNSt10_Iter_baseIPiLb0EE7_S_baseES0_ _ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_ __libc_csu_init _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEEC2Ev _ZNSt23_Rb_tree_const_iteratorIiEC2Ev _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EEC1EjRKS3_ _ZNSaIiED2Ev _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEE10deallocateEPS2_j _ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC1ERKS2_ _ZNSaIiEC1Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EED1Ev _ZNSt4pairISt23_Rb_tree_const_iteratorIiEbEC2ERKS1_RKb _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EEC2Ev _ZN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEC2ERKS1_ _ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEEC1ERKS5_ _ZNKSt6vectorIiSaIiEE3endEv _ZNSt6vectorIS_IiSaIiEESaIS1_EE15_M_erase_at_endEPS1_ _ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIiSaIiEEEEvT_S6_ _ZN9__gnu_cxx17__normal_iteratorIPSt6vectorIiSaIiEES1_IS3_SaIS3_EEEC1ERKS4_ _ZSt22__uninitialized_copy_aIPiS0_iET0_T_S2_S1_RSaIT1_E _ZNKSt17_Rb_tree_iteratorIiEeqERKS0_ _ZNSt4pairISt17_Rb_tree_iteratorIiES1_EC1ERKS1_S4_ _ZSt10__fill_n_aIPijiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT1_E7__valueET_E6__typeES6_T0_RKS4_ _Znwj@@GLIBCXX_3.4 _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE10_S_minimumEPSt18_Rb_tree_node_base _ZSt13__copy_move_aILb0EPKiPiET1_T0_S4_S3_ _ZNSt6vectorIiSaIiEED2Ev _ZNSt6vectorIiSaIiEE15_M_erase_at_endEPi _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE10_M_insert_INS5_11_Alloc_nodeEEESt17_Rb_tree_iteratorIiEPSt18_Rb_tree_node_baseSB_RKiRT_ _ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEE4baseEv _ZSt18uninitialized_copyIPSt6vectorIiSaIiEES3_ET0_T_S5_S4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5beginEv _ZNSt23_Rb_tree_const_iteratorIiEC2EPKSt18_Rb_tree_node_base _ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEENS1_IPiS6_EEET0_T_SB_SA_ _ZNSt17_Rb_tree_iteratorIiEC2EPSt18_Rb_tree_node_base _ZNSt6vectorIiSaIiEEC1Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE16_M_insert_uniqueERKi _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_M_get_nodeEv _ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_M_rootEv _ZSt8__fill_aIPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_ _ZNSt6vectorIiSaIiEEaSERKS1_ _ZNKSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE19_M_get_Tp_allocatorEv _ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES4_IS6_SaIS6_EEEEPS6_EET0_T_SE_SD_ _ZNKSt6vectorIS_IiSaIiEESaIS1_EE5beginEv _ZSt12__niter_baseIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEENSt11_Niter_baseIT_E13iterator_typeES8_ _ZNKSt9_IdentityIiEclERKi _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE6_M_endEv __bss_start _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@@GLIBCXX_3.4 _ZSt3maxIjERKT_S2_S2_ _ZNSt6vectorIS_IiSaIiEESaIS1_EEixEj _ZNSt13_Rb_tree_nodeIiE9_M_valptrEv _ZNSaIiEC2ERKS_ _ZNSaISt6vectorIiSaIiEEEC1ERKS2_ _ZNSt6vectorIS_IiSaIiEESaIS1_EEC1Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEED2Ev _ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEEC2ERKS5_ _ZSt22__uninitialized_move_aIPSt6vectorIiSaIiEES3_SaIS2_EET0_T_S6_S5_RT1_ __stack_chk_fail@@GLIBC_2.4 _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1Ev _ZN9__gnu_cxx13new_allocatorIiE7destroyEPi _ZN9__gnu_cxx17__normal_iteratorIPSt6vectorIiSaIiEES1_IS3_SaIS3_EEEC2ERKS4_ _Z10min_weightSt6vectorIiSaIiEESt3setIiSt4lessIiES0_E _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5eraseERKi _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EEC2EjRKS3_ _ZSt22__uninitialized_copy_aIPSt6vectorIiSaIiEES3_S2_ET0_T_S5_S4_RSaIT1_E _ZSt28_Rb_tree_rebalance_for_erasePSt18_Rb_tree_node_baseRS_@@GLIBCXX_3.4 _ZNSaISt13_Rb_tree_nodeIiEEC1Ev _ZNKSt3setIiSt4lessIiESaIiEE3endEv _ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_ _ZSt34__uninitialized_move_if_noexcept_aIPSt6vectorIiSaIiEES3_SaIS2_EET0_T_S6_S5_RT1_ _ZNSt4pairISt17_Rb_tree_iteratorIiEbEC2ERKS1_RKb _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE3endEv _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_S_valueEPKSt13_Rb_tree_nodeIiE _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_M_rootEv _ZNSirsERi@@GLIBCXX_3.4 _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE4sizeEv _ZNSt20__copy_move_backwardILb0ELb0ESt26random_access_iterator_tagE13__copy_move_bIPSt6vectorIiSaIiEES6_EET0_T_S8_S7_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_S_leftEPSt18_Rb_tree_node_base _ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC1ERKS1_S4_ _ZNSaISt6vectorIiSaIiEEEC2ERKS2_ _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE11_M_allocateEj _ZN9__gnu_cxx14__alloc_traitsISaIiEE8max_sizeERKS1_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEEC2Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_M_copyEPKSt13_Rb_tree_nodeIiEPS7_ _ZNSt10_Iter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEELb1EE7_S_baseES7_ memmove@@GLIBC_2.0 _ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv _ZNSt3setIiSt4lessIiESaIiEEC1ERKS3_ _ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeIiEE8allocateEjPKv _ZSt23__copy_move_backward_a2ILb0EPiS0_ET1_T0_S2_S1_ _ZSt13copy_backwardIPiS0_ET0_T_S2_S1_ _ZNSt4pairIPSt18_Rb_tree_node_baseS1_EC2ERKS1_S4_ _Z13load_weightedRSt6vectorIS_IiSaIiEESaIS1_EEii _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEEC1ERKS4_ _ZNSt6vectorIS_IiSaIiEESaIS1_EEC1ERKS3_ _ZSt10_ConstructISt6vectorIiSaIiEES2_EvPT_RKT0_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EEC1ERKS3_RKSaISt13_Rb_tree_nodeIiEE _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE12_M_rightmostEv _ZNSolsEPFRSoS_E@@GLIBCXX_3.4 _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5eraseESt23_Rb_tree_const_iteratorIiE _ZN9__gnu_cxxneIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEEEbRKNS_17__normal_iteratorIT_T0_EESD_ _ZSt8_DestroyIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEiEvT_S7_RSaIT0_E _ZNKSt23_Rb_tree_const_iteratorIiEdeEv _ZSt12__miter_baseIPSt6vectorIiSaIiEEENSt11_Miter_baseIT_E13iterator_typeES5_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE6_S_keyEPKSt13_Rb_tree_nodeIiE _ZN9__gnu_cxx14__alloc_traitsISaISt13_Rb_tree_nodeIiEEE10deallocateERS3_PS2_j _ZNKSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_M_beginEv _ZNSt4pairISt17_Rb_tree_iteratorIiES1_EC2ERKS1_S4_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11_M_put_nodeEPSt13_Rb_tree_nodeIiE __cxa_end_catch@@CXXABI_1.3 _ZSt4fillIPSt6vectorIiSaIiEES2_EvT_S4_RKT0_ _ZSt17__throw_bad_allocv@@GLIBCXX_3.4 _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE6_S_keyEPKSt18_Rb_tree_node_base _ZNSt18_Rb_tree_node_base10_S_minimumEPS_ _ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEENSt11_Miter_baseIT_E13iterator_typeES9_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_M_copyINS5_11_Alloc_nodeEEEPSt13_Rb_tree_nodeIiEPKS9_SA_RT_ _ZNKSt23_Rb_tree_const_iteratorIiEneERKS0_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEED1Ev _ZNSt18_Rb_tree_node_base10_S_maximumEPS_ _ZNSaISt13_Rb_tree_nodeIiEEC2ERKS1_ _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@@GLIBCXX_3.4 _ZN9__gnu_cxx14__alloc_traitsISaIiEE10deallocateERS1_Pij __cxa_begin_catch@@CXXABI_1.3 _ZNSt6vectorIS_IiSaIiEESaIS1_EE3endEv _ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv _ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEED1Ev _ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE14_M_create_nodeERKi _ZNSaISt6vectorIiSaIiEEED1Ev _ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi _ZNSaISt6vectorIiSaIiEEEC2Ev _edata _ZdlPvS_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE11equal_rangeERKi __gxx_personality_v0@@CXXABI_1.3 _ZNSaIiED1Ev _ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv _ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIiSaIiEES1_IS3_SaIS3_EEEdeEv _ZNKSt6vectorIiSaIiEE5beginEv _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implC2ERKS3_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE14_M_upper_boundEPSt13_Rb_tree_nodeIiES8_RKi _ZNSt6vectorIS_IiSaIiEESaIS1_EE6resizeEjS1_ _Unwind_Resume@@GCC_3.0 _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE8_S_valueEPKSt18_Rb_tree_node_base _ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_ _ZNSt6vectorIS_IiSaIiEESaIS1_EEC2Ev _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_Rb_tree_implIS3_Lb0EE13_M_initializeEv _ZN9__gnu_cxx14__alloc_traitsISaISt13_Rb_tree_nodeIiEEE17_S_select_on_copyERKS3_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE13_M_clone_nodeINS5_11_Alloc_nodeEEEPSt13_Rb_tree_nodeIiEPKS9_RT_ _ZNSaISt6vectorIiSaIiEEED2Ev _ZNK9__gnu_cxx17__normal_iteratorIPSt6vectorIiSaIiEES1_IS3_SaIS3_EEE4baseEv _ZNSaISt13_Rb_tree_nodeIiEEC1ERKS1_ _ZN9__gnu_cxx14__alloc_traitsISaIiEE8allocateERS1_j _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE12_Vector_implC2Ev _ZNSt6vectorIiSaIiEE6resizeEji _ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_ _ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE13_M_deallocateEPS2_j _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE5eraseESt17_Rb_tree_iteratorIiES7_ _ZNKSt23_Rb_tree_const_iteratorIiEeqERKS0_ _ZSt4copyIPiS0_ET0_T_S2_S1_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE12_M_drop_nodeEPSt13_Rb_tree_nodeIiE _ZSt12__niter_baseIPiENSt11_Niter_baseIT_E13iterator_typeES2_ _ZNSt8_Rb_treeIiiSt9_IdentityIiESt4lessIiESaIiEE7_S_leftEPKSt18_Rb_tree_node_base _ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_ _ZN9__gnu_cxx13new_allocatorIiEC2Ev _ZNSt3setIiSt4lessIiESaIiEE5eraseERKi _ZN9__gnu_cxxmiIPiSt6vectorIiSaIiEEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS8_SB_  .symtab .strtab .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .gcc_except_table .init_array .fini_array .jcr .dynamic .got.plt .data .bss .comment                                                  T�T                    #         h�h                     1         ���  $                  D   ���o   ���  <                N         ��                 V         ��  [                 ^   ���o   D�D  @                k   ���o   ���  �                z   	      �                  �   	   B   ,�,  �               �         ��  #                  �         �	  �                �         ���
                    �         ���
  I                 �         ���S                    �         ���S  5                  �          � T  �                 �         ���\  �$                 �         ���  @                 �         ��                    �         ���                    �           �                    �         �  �                �         ���                   �            �  l                         l l�                            � t�  0                       0       t�  5                               ��                                 ��  �     3         	              \�  @Q                 332041000100024229maraton/mylib/graph/tcases.pyimport random 

n = random.randint(0,100)
print( str(n) )

ex = n*n 

e = random.randint(0,ex - 1)
print( str(e) )

for c in range(e): 
    a = random.randint(0,n-1)
    b = random.randint(0,n-1)
    print( str(a) + " " + str(b), end="\n")


3320410001000131127maraton/mylib/graph/tr1.txt0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 
168931000100027maraton/mylib/graph/proyect3320410001000510439maraton/mylib/graph/proyect/graphs_.cpp#include "graphs_.hpp"
#include<stdio>
#include<set> 

using namespace std;


/* List of included graph functions: 
 *
 * Done: 
 * 	general: 
 *		load_graph
 * 		print_graph
 * 	reach:
 * 		reach_brute_force
 * 		roy_warshall
 * 		comp_conex
 * Yet to do: 
 * 	MST:
 * 		prim (v1 & v2) 
 * 		kruskal (v1 & v2) 
 * 	graph traversal:
 * 		dfs (rec and some other imp)
 * 		dfs visit
 * 		bfs
 * 		backtracking
 *
 * 	Not seen graph functions
 *
 * This is a work-in-progress graph library for reviewing contents of my algorithms III course (which I suspended). I hope this 
 * grows to incorporate every alogrithm given in the course, with smart, optimized (I'm aiming high) implementation and
 * readable and understandeable documentation and simultaneously, helps me pass the subject and learn about library development.
 * 
 * XOXO
 *
 * cCc
 *
 * PD: don't forget to update namespaces for every included function. Set in comp_conex() is giving trouble
 */

void load_graph(vector< vector<bool> > &in_m, int size, int n_edges)
{
	
	//Enabling enough capacity for the 2D vector to work
	in_m.resize(size); 
	
	for(int i=0; i<size; i++) { 
		in_m[i].resize(size); 
		in_m[i][i] = true; 	//adding Identity
	}

	int a,b; 
	for(int j=0; j<n_edges; j++) { 
		cin>>a>>b; 
		in_m[a][b] = true;
	}	
}


void print_graph(vector< vector<bool> > &in_m, int size)
{
	for(int k=0; k<size; k++) { 
		for(int l=0; l<size; l++) { 
			cout<<in_m[k][l]<<" "; 	
		}	
		cout<<endl; 
	}	

}


void reach_brute_force(vector< vector<bool> > &in_m, int size)
{
	vector< vector<bool> > aux_m; 

	//This is created to add the l-th reach relation to the input adjacency matrix.
	aux_m.resize(size);
	for(int p=0; p<size; p++) { 
		aux_m[p].resize(p); 
	}

	/* Main algorithm:
	 *	Input: 	Adjacency matrix
	 *	Output: Reach matrix 
	 *
	 *	It searches through every file for an edge (k,j) (with 0<=i,j<n) and then, search for edges (j,i) at j file,
	 *	if found, in_m[j][i] is considered reachable and include to the l-th relation of reach.
	 *
	 *	-Order: O(n^4)
	 *	-Propositions involved: 
	 *		Recursive definition of a relation. 
	 *		" Let G=(V,E) be a (di)graph and n=|V|. For all m in N, if {v,w} is in E^m, then {v,w} is in E^(n-1) "
	 *	-Termination: It is formed by nested loops bounded by finite numbers, it will end.  
	 *	-Correcteness: --> unfinished 
	 */

	for(int l=1; l<size-1; l++) {
		for(int k=0; k<size; k++) {
			for(int j=0; j<size; j++) {

				if (in_m[k][j] == 1)
				{
					for(int i=0; i<size; i++) {
	
						if (in_m[j][i] == 1)
							aux_m[k][i] = 1; 
					}
				}
			}
		}
	
		for(int c=0; c<size; c++){ 
			for(int r=0; r<size; r++) { 
				in_m[c][r] = in_m[c][r] | aux_m[c][r]; 
			}
		}
			
	}	
	
}



void roy_warshall(vector< vector<bool> > &in_m, int size)
{
	/*Main Algorithm: 
	 * 	-Input: Adjacency matrix
	 *	-Output: Reach matrix
	 *	
	 *
	 *
	 *	-Order: O(n^3)
	 *	-Propositions involved: 
	 *		Weird relation definition
	 *		" Let G=(V,E) be a graph , v,w belonging V and 0<=k<=|V|. If (v,w) doesn't belong to E_k-1, then 
	 *		(v,w) belongs to E_k if and only if exist a v_k in V such that (v,v_k) belongs to E_k-1 
	 *		and (v_k,w) to E_k-1 "
	 *	-Termination: Inmediate 
	 *	-Correctness: --> not finished
	 */
	
	for (int k=0; k<size; k++) { 
		for(int j=0; j<size; j++) { 
			for(int i=0; i<size; i++) { 
				in_m[i][j] = in_m[i][j] | (in_m[i][k] && in_m[k][j]) ;	
			}
		}
	}	
	
}


int comp_conex(vector< vector<bool> > reach_m, vector< vector<int> > &resp, int size)
{
	/*Main algorithm: 
	 *
	 * 	-Input: Reach matrix
	 * 	-Output: Conex components of a graph
	 *
	 * 	It uses a set to represent the elements of the graph and iterates while the set is not empty, using the d-th element
	 * 	of the set as a "representative" whose reacheable nodes are calculated in O(n) time using the reach matrix.
	 * 	
	 * 	Since it requires the reach matrix, the preprocessing pushes the time bound to O(n^3) (Roy-Wharshall).
	 *
	 * 	-Order: 
	 * 		>>Time: O(k*n) where k is the number of conex components and n=|V|
	 * 		>>Memory: 
	 * 	-Propositions Involved: None
	 * 	-Termination: For every node, whithin the internal loop it is garanteed that at least one node will be deleated from
	 * 	the set (since for all i such 0<=i<n, in_m[i][i] == true), thus the while condition is guaranteed to be false 
	 * 	eventually.
	 * 	-Correctness: A conex component is defined as the induced graph from every partition of V derived from the mutual 
	 * 	reach relation. This algorithm verifies for a node, wheter the elements it reaches, reach it as well (mutual reach),
	 * 	and then it groups them in the same vector (which ressembles a partition). Thus this algorithm.....
	 */ 

	resp.resize(size);
	set<int ,set<int> > sect; 
	
	for(int c=0; c!=size; c++) {
		sect.insert(c); 
	}

	set<int, set<int> >::iterator d; 
	int node, count; 
	count = 0; 
	while ( !sect.empty() )	{
		d = sect.begin(); 
		node = *d; 

		for(int r=0 ; r!=size ;r++) { 
			
			if(reach_m[node][r] && reach_m[r][node])
			{
				resp[count].push_back(r); 
				sect.erase(r);
			}
		}
		count++; 
	}
	
	return count;
}
332041000100023436maraton/mylib/graph/proyect/main.cpp
#include<iostream> 
#include<vector>
#include "./source/graphs_.cpp" 

using namespace std; 

int main() 
{ 
	vector< vector<bool> > p_matrix; 
	int n, e; 
	cin>>n>>e; 
	
	load(p_matrix, n, e); 

	print(p_matrix, n); 

	return 0; 
}
3320410001000157736maraton/mylib/graph/roy_warshall.cpp#include<iostream> 
#include<vector>

using namespace std; 

void load(vector< vector<bool> > &in_m, int size, int n_edges);
void print(vector< vector<bool> > &in_m, int size);
void roy_warshall(vector< vector<bool> > &in_m, int size); 

int main() 
{ 
	vector< vector<bool> > ccc; 
	int n, e; 
	cin>>n>>e; 	

	load(ccc, n, e); 
	
	roy_warshall(ccc, n); 
		
	print(ccc, n); 


	return 0; 
}


void roy_warshall(vector< vector<bool> > &in_m, int size)
{
	/*Main Algorithm: 
	 * 	-Input: Adjacency matrix
	 *	-Output: Reach matrix
	 *	
	 *
	 *
	 *	-Order: O(n^3)
	 *	-Propositions involved: 
	 *		Weird relation definition
	 *		" Let G=(V,E) be a graph , v,w belonging V and 0<=k<=|V|. If (v,w) doesn't belong to E_k-1, then 
	 *		(v,w) belongs to E_k if and only if exist a v_k in V such that (v,v_k) belongs to E_k-1 
	 *		and (v_k,w) to E_k-1 "
	 *	-Termination: Inmediate 
	 *	-Correctness: --> not finished
	 */
	
	for (int k=0; k<size; k++) { 
		for(int j=0; j<size; j++) { 
			for(int i=0; i<size; i++) { 
				in_m[i][j] = in_m[i][j] | (in_m[i][k] && in_m[k][j]) ;	
			}
		}
	}	
	
}


void load(vector< vector<bool> > &in_m, int size, int n_edges)
{
	
	in_m.resize(size); 
	for(int i=0; i<size; i++) { 
		in_m[i].resize(size); 
		in_m[i][i] = true; 	
	}

	int a,b; 
	for(int j=0; j<n_edges; j++) { 
		cin>>a>>b; 
		in_m[a][b] = true;
	}	

}


void print(vector< vector<bool> > &in_m, int size)
{
	for(int k=0; k<size; k++) { 
		for(int l=0; l<size; l++) { 
			cout<<in_m[k][l]<<" "; 	
		}	
		cout<<endl; 
	}	

}

/* Input type: 
 	n
	e
	v_1 w_1
	v_2 w_2
	.
	.
	v_e w_e
*/
3320410001000215928maraton/mylib/graph/prim.cpp
#include<iostream> 
#include<vector>
#include<utility> 
#include<set> 
#include<iterator> 
#include<algorithm>
#include<climits>


using namespace std; 

void kruskal(vector< vector<int> > in_m, int size, vector<int> &parents, int root);
void update_adyacents(vector< vector<int> > in_m, int size, vector<int> cut, set<int> sect, vector<int> &weights, int node);
int min_weight(vector<int> weights, set<int> tiles);
void load_weighted(vector<vector<int> > &in_m, int size, int edge);


int main() 
{ 
	vector< vector<int> > graph;
	vector<int> parent_v; 
	int n, e, r;
	cin>>n>>e; 

	load_weighted(graph, n, e); 

	parent_v.resize(n);
	for(int i=0; i<n; i++) { 
		parent_v[i] = -1; 
	}
	
	cin>>r; 
	kruskal(graph, n, parent_v, r); 

	for(int j=0; j<n; j++) { 
		cout<<parent_v[j]<<" "; 
	}
	cout<<endl; 

	return 0; 
}


void load_weighted(vector<vector<int> > &in_m, int size, int edge)
{
	in_m.resize(size); 
	for(int i=0; i<size; i++) {
		in_m[i].resize(size); 
	}

	int u,v,p; 
	for(int j=0; j<edge; j++) { 

		cin>>u>>v>>p; 
		in_m[u][v] = p; 
	}
}


void kruskal(vector< vector<int> > in_m, int size, vector<int> &parents, int root)
{
	vector<int> weights; 
	set<int> sect; 
	int current;

	parents[root] = root; 
	weights.resize(size); 
	for(int r=0; r<size; r++) { 
		weights[r] = INT_MAX; 
	}
	current = root;

	int aux;
	for(int c=0; c<size; c++) { 
	
		update_adyacents(in_m, size, parents, sect, weights, current); 

		aux = min_weight(weights, sect); 

		parents[aux] = current; 
		sect.erase(aux); 
		weights[aux] = INT_MAX; 
		current = aux; 

	}		
}


void update_adyacents(vector< vector<int> > in_m, int size, vector<int> cut, set<int> sect, vector<int> &weights, int node)
{
	for(int c=0; c<size; c++){

		if (in_m[node][c] != 0)
		{
			if (cut[c] == -1)
			{
				if (weights[c] > in_m[node][c]) 
				{ 
					weights[c] = in_m[node][c]; 
					sect.insert(c); 
				}
					
			}
		}
	}

}

int min_weight(vector<int> weights, set<int> tiles)
{

	int l, ind;  
	l = INT_MAX; 
	set<int>::iterator it; 
	for(it=tiles.begin(); it!=tiles.end(); it++) { 
		
		if (weights[*it] < l)
		{
			l = weights[*it];
			ind = *it; 
		}
	}

	return ind; 
}

332041000100023701627maraton/mylib/graph/tr2.txt1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
3320410001000187427maraton/mylib/graph/bfs.cpp#include <stdio.h> 
#include <iostream> 
#include <deque> 
#include <vector> 

using namespace std; 

#define NODE_CEIL 100
//#define MAX_NODE 1000 
//
//typedef vector< vector<bool> > ady_may;

deque<int> waiting; 
vector<int> visited; 
vector< vector<bool> > adj_mat; 


void input_mat(vector< vector<bool> > &mat, int n_edges) {
	int j,u,v;
	for(j=0; j<n_edges; j++) {
		cin>>u>>v; 
		mat.at(u).at(v) = true; 
		mat.at(v).at(u) = true; 
	}
}


void get_suc(vector< vector<bool> > mat, vector<int> &suc_list,  int el, int size) { 
	int k; 
	
	for (k=0; k<size; k++) { 
		if( mat[el][k] == true )  
			suc_list.push_back(k); 
	}
}


bool vect_contains(vector<int> vect, int el) { 
	int x;
	for(x=0; x<vect.size(); x++)  {
		if (vect[x] == el)
			return true;
	}

	return false; 
}

bool deque_contains(deque<int> de, int el ) { 
	int y; 
	for(y=0; y<de.size(); y++) { 
		if (de[y] == el) 
			return true; 
	}

	return false; 
}

int main() {

	/*	allocating space for adj_mat	*/
	adj_mat.resize(NODE_CEIL); 
	int i; 
	for(i=0; i<NODE_CEIL; i++) 
		adj_mat[i].resize(NODE_CEIL);
	

	/*	initialice matrix 	*/
	int n,m;
	cin>>n>>m; 
	input_mat(adj_mat, m); 
	
	/*	root of bfs 	*/
	int root; 
	cin>>root; 
	
	/*	begin bfs 	*/ 
	vector<int> sucs; 
	waiting.push_back(root);
	int dummie; 
	while( visited.size() != n ) { 

		if (waiting.size() == 0) 
			break;

		dummie = waiting.front(); 
		visited.push_back(dummie); 
		waiting.pop_front();

		get_suc(adj_mat, sucs, dummie, n); 
		int k; 
		while (sucs.size() != 0) { 

			//La segunda parte de este if me la chuletee, shame on me, no se me ocurrio que tuviese carga
			if( !vect_contains(visited,sucs.back()) && !deque_contains(waiting,sucs.back()) )
				waiting.push_back( sucs.back() ); 

			sucs.pop_back(); 

		}

		       				
	}	

	int c; 
	for(c=0; c<visited.size(); c++)  
		cout<<visited[c]<<endl; 
		
	return 0;
}
332041000100040528maraton/mylib/graph/test.cpp#include<iostream> 
#include<vector> 
#include<algorithm>
#include<iterator>
#include<utility>

using namespace std; 

int main() 
{ 
	vector< pair<int, int> > v; 
	int n; 
	cin>>n; 

	for(int i=0; i<n; i++) {
		v[i].first = i; 
		v[i].second = n-i; 	
	}

	vector< pair<int, int> >::iterator it; 	

	for(it=v.begin(); it!=v.end(); it++) {  
		cout<<*it.first<<" "<<*it.second<<endl;;  
	}


	return 0; 
}
33204100010001214125maraton/mylib/graph/input95
2093
29 32
37 60
13 34
12 60
57 59
92 45
60 72
4 65
80 35
90 31
76 93
70 75
12 37
45 20
78 82
31 17
62 7
41 54
18 73
71 51
28 10
22 48
34 65
48 5
67 29
28 16
7 31
78 9
33 4
92 90
76 57
76 56
75 78
19 46
19 40
73 64
89 46
93 1
13 85
69 62
19 44
93 28
23 63
24 45
15 86
8 56
41 49
26 14
1 10
43 71
18 24
64 17
23 65
29 74
85 65
40 51
33 37
16 7
22 47
16 35
69 65
9 79
29 0
55 80
19 45
0 82
42 39
13 83
73 48
30 64
59 15
46 5
80 32
47 91
65 12
78 15
32 41
60 87
47 84
89 72
77 84
70 93
74 35
25 19
29 51
36 55
88 66
7 40
42 65
82 61
77 72
25 11
49 5
14 48
84 59
36 24
4 16
33 43
64 39
23 6
2 94
20 33
7 24
81 1
43 24
94 80
25 64
46 26
1 72
41 52
85 21
9 84
33 79
0 37
48 34
25 55
92 84
73 60
2 74
25 93
59 24
56 17
26 6
55 9
82 68
34 5
11 45
1 56
76 22
52 9
59 85
25 71
61 19
5 73
91 1
67 66
82 60
84 36
85 4
21 83
72 26
49 32
29 77
41 4
49 19
89 90
42 8
38 60
40 80
81 91
6 14
48 58
91 28
27 2
79 36
36 5
91 90
84 83
42 64
38 39
52 0
85 53
58 44
1 90
76 32
82 38
58 65
41 61
80 75
76 5
55 51
60 36
19 48
21 76
52 52
41 77
28 93
23 82
67 26
52 56
10 93
49 14
20 83
0 88
15 33
86 18
20 32
15 71
31 3
85 56
63 75
87 92
82 3
90 15
54 59
65 89
7 60
47 69
83 6
81 36
20 31
54 20
87 68
38 4
34 22
10 71
29 40
70 24
78 47
65 74
37 20
74 86
67 26
37 91
28 64
91 69
16 20
29 7
79 2
60 15
7 50
5 4
17 44
94 36
55 14
55 39
51 68
30 59
19 35
29 58
13 43
16 45
85 63
9 17
8 66
76 18
3 54
52 66
39 42
15 81
89 30
39 75
74 36
44 46
22 19
78 91
84 46
87 50
30 63
58 12
50 20
84 20
2 65
74 78
72 45
83 72
23 34
93 60
20 4
67 57
72 19
69 32
50 8
92 7
46 0
33 84
83 64
84 76
84 78
25 9
27 2
84 25
0 88
47 41
10 53
75 71
94 74
21 43
35 75
17 81
62 34
10 74
74 70
68 56
87 1
32 11
28 87
18 85
11 71
72 79
72 24
7 63
71 69
72 54
9 19
11 57
71 8
43 77
1 49
13 24
61 51
46 36
43 88
56 53
77 67
4 50
68 24
33 6
12 66
83 41
4 50
9 47
39 29
74 51
0 11
32 63
80 18
42 82
8 6
64 59
60 69
9 32
93 35
51 19
1 27
14 25
24 86
22 26
69 52
36 87
85 49
41 5
28 64
42 35
90 42
56 56
6 80
29 53
11 44
61 84
74 21
37 48
42 46
28 47
10 44
72 66
71 13
90 93
23 80
86 4
4 90
71 70
42 18
82 35
47 91
84 91
53 36
48 31
29 44
6 40
85 93
31 71
6 10
78 70
60 8
65 19
54 78
71 7
84 41
93 25
14 76
74 17
29 70
77 42
91 43
15 40
42 58
83 47
51 26
90 4
83 47
48 83
54 22
3 76
69 66
93 49
80 56
40 83
82 63
50 59
10 59
11 7
86 60
65 68
71 51
62 27
93 56
65 69
22 81
55 45
62 53
9 37
33 59
71 79
23 74
58 94
75 26
69 94
4 45
79 70
35 50
20 47
35 63
88 25
36 33
24 67
8 60
83 38
67 67
39 6
14 67
31 93
30 83
16 79
9 51
85 71
93 68
34 82
92 42
93 81
60 4
64 84
81 85
88 20
15 70
88 71
21 43
45 19
46 93
86 17
24 26
3 65
34 66
33 51
71 39
74 50
0 91
66 21
21 9
77 21
79 57
65 88
22 60
6 1
34 30
80 84
90 65
10 86
81 5
20 29
92 38
44 36
16 26
50 78
74 10
69 3
92 54
11 69
6 76
46 84
56 59
43 9
82 1
58 9
58 34
56 76
48 23
1 2
86 89
0 7
24 27
94 84
24 41
64 83
49 5
71 75
47 73
86 24
58 42
42 31
35 90
76 91
31 9
70 6
89 37
2 23
15 42
25 82
70 50
26 94
44 31
41 57
75 12
3 89
50 21
76 85
55 61
12 77
65 33
90 84
72 29
14 55
47 30
88 18
75 34
58 48
64 54
39 23
90 24
37 60
21 75
30 73
63 85
60 27
52 5
4 76
81 55
48 43
30 0
37 22
82 17
11 45
7 49
55 0
28 37
17 51
10 34
55 35
53 92
18 51
54 55
90 5
65 28
84 3
36 11
58 27
7 83
21 64
14 23
17 39
76 40
10 30
13 35
83 31
55 75
57 92
68 80
51 43
91 67
56 83
10 59
92 9
4 52
19 48
64 74
31 16
40 34
81 34
68 14
33 44
93 17
75 36
82 34
41 71
31 11
32 37
8 5
85 20
64 32
43 80
85 28
51 81
3 64
40 43
36 89
13 92
78 68
15 58
76 45
70 14
11 60
67 87
17 12
21 73
27 4
72 70
53 50
78 60
40 43
19 53
18 36
81 40
59 70
24 4
63 82
67 19
69 21
79 4
18 47
18 85
41 49
94 48
77 51
89 24
87 5
10 16
32 12
48 29
49 79
93 86
34 6
83 39
1 44
94 42
72 40
47 0
7 54
66 43
92 8
85 56
43 80
51 51
3 41
90 79
54 38
82 91
47 44
93 6
66 56
45 86
29 60
41 76
27 27
1 22
12 28
9 27
30 37
17 78
13 91
43 14
82 59
42 13
16 56
2 28
94 55
15 31
11 60
52 35
47 30
51 19
18 60
62 81
52 88
5 76
24 57
23 2
23 48
85 27
53 79
87 60
37 48
48 57
60 59
14 51
60 9
22 91
90 87
0 6
8 0
84 57
47 25
89 35
90 63
73 83
37 24
26 69
73 4
83 52
25 1
79 25
12 27
63 85
28 63
49 22
80 78
75 64
36 87
42 66
65 87
11 39
9 85
58 49
2 45
16 45
29 77
59 82
74 66
79 22
66 42
82 31
84 72
72 17
68 40
49 14
19 83
66 12
10 9
13 37
54 78
59 74
66 16
48 85
54 91
66 19
91 64
82 17
69 76
64 14
9 74
81 94
41 42
42 9
91 6
89 62
79 12
4 25
22 49
23 90
5 13
40 83
7 85
23 42
78 60
73 73
0 26
78 4
26 26
21 25
13 64
26 67
33 8
87 37
91 31
5 49
14 58
63 45
82 58
21 51
88 22
4 53
31 64
36 79
83 42
7 73
31 27
21 15
51 54
37 25
68 77
4 41
38 94
54 72
87 92
9 2
86 13
24 17
64 90
25 31
6 21
35 33
34 63
67 88
36 70
63 93
1 54
77 8
62 88
50 78
1 66
4 78
44 59
6 7
37 49
5 56
35 5
44 10
79 76
47 88
30 29
51 81
46 34
17 17
33 5
51 52
29 6
15 27
56 35
12 21
75 38
54 22
51 53
16 70
92 43
37 35
93 29
84 78
18 28
15 85
79 64
50 84
27 52
63 50
53 31
47 8
42 24
64 75
7 68
14 25
50 73
61 6
3 10
52 71
46 87
49 15
93 52
52 89
12 22
35 61
30 7
31 94
50 82
36 62
12 89
69 8
29 5
44 71
48 61
29 2
84 52
51 83
37 94
79 19
22 23
40 83
43 79
80 46
19 82
58 74
31 73
69 1
4 20
35 84
47 23
15 79
68 68
21 45
51 34
9 39
66 54
66 23
60 10
0 68
88 28
91 56
66 74
53 20
10 18
58 78
68 49
21 57
74 66
16 10
83 84
76 93
17 88
68 59
58 19
11 11
93 37
90 61
49 85
59 22
16 21
80 58
22 60
72 64
25 26
54 61
56 72
61 74
81 31
69 13
15 34
55 49
86 22
56 28
50 34
83 86
72 38
35 17
82 36
14 3
51 11
31 36
44 9
87 4
51 88
27 14
35 79
77 88
21 70
23 46
50 83
65 34
63 86
51 86
72 19
62 38
1 54
85 39
30 36
22 34
6 33
23 93
73 83
28 63
51 58
77 12
56 27
88 82
18 63
89 47
44 41
54 13
40 53
70 85
81 64
72 76
54 89
61 43
75 92
39 84
51 27
28 50
77 14
5 6
56 29
92 19
64 33
0 2
64 75
81 54
58 14
89 27
0 63
82 85
60 75
49 63
20 83
2 33
56 46
17 21
18 28
51 79
78 50
12 35
60 32
17 93
65 26
21 85
79 47
89 32
47 58
8 93
91 34
1 18
48 82
44 85
0 19
45 28
61 37
3 36
30 49
36 37
44 30
26 67
38 58
14 89
63 23
45 34
21 2
78 67
52 36
53 66
28 53
86 37
66 1
60 89
10 58
26 89
59 35
29 69
94 38
75 58
21 69
70 33
20 11
27 79
53 66
18 5
84 21
85 82
60 37
70 2
27 70
79 94
44 6
77 21
67 69
91 54
74 70
2 74
1 18
75 54
0 61
90 56
12 0
80 75
16 7
44 76
56 42
47 64
12 89
94 2
31 13
21 30
27 82
40 85
51 81
0 55
83 45
22 34
64 20
19 64
81 31
4 56
14 40
54 86
14 25
11 17
88 41
9 53
1 15
37 67
52 21
68 43
74 52
4 36
25 92
45 49
87 28
94 60
37 44
23 17
89 4
74 71
37 45
89 30
31 74
21 29
12 19
4 81
37 72
25 78
18 39
47 45
58 27
92 11
71 48
15 88
70 86
64 82
14 62
60 47
37 6
88 63
40 19
10 29
54 47
73 73
43 1
32 11
7 54
68 18
89 76
29 15
94 91
75 28
55 80
2 1
70 21
52 60
68 15
32 32
83 38
73 49
76 24
91 89
57 56
2 58
32 70
73 69
64 29
36 5
57 68
85 82
56 11
9 3
17 53
16 69
52 14
12 64
49 66
39 81
92 33
76 38
28 69
16 77
21 24
55 43
1 1
35 1
82 51
40 6
70 21
45 2
55 6
88 62
64 86
84 31
66 24
84 84
17 30
20 76
66 40
12 63
92 85
2 26
94 59
87 64
23 17
9 12
33 90
89 66
39 58
75 12
60 22
30 73
49 62
10 10
51 36
2 71
89 43
41 2
74 31
82 16
10 38
90 58
92 58
75 81
9 17
59 94
50 31
72 19
42 83
47 31
87 88
46 62
86 78
61 36
25 81
20 58
34 30
20 66
43 63
19 58
87 13
35 5
10 36
71 89
79 76
89 25
28 81
33 18
35 62
40 10
71 51
5 60
83 1
86 41
80 38
9 36
32 21
53 13
32 44
51 89
81 41
93 42
67 12
66 42
41 24
35 66
81 67
54 12
29 91
26 47
15 41
51 13
91 37
70 20
32 15
0 10
60 82
22 7
48 79
13 68
32 36
80 80
59 9
14 39
75 32
0 88
70 12
58 57
49 63
58 94
9 10
24 78
77 38
7 25
73 78
52 45
73 40
38 59
14 50
27 43
15 54
71 26
43 69
24 61
59 80
10 26
1 35
74 3
57 60
35 25
8 50
43 90
24 28
42 88
82 62
61 60
13 31
37 32
11 3
29 66
42 79
64 20
91 49
31 85
49 57
78 92
67 43
10 16
21 19
44 57
27 24
84 31
5 91
86 31
11 17
40 8
49 17
7 21
75 38
51 21
24 81
19 57
41 31
86 20
1 86
39 11
29 23
65 15
20 58
57 74
78 74
56 45
26 70
45 64
86 43
0 2
67 66
47 22
59 42
14 85
44 40
57 87
16 14
37 74
15 82
81 31
60 39
12 12
4 2
63 20
30 29
10 86
11 11
60 59
74 92
60 80
54 82
11 1
52 93
52 16
43 91
71 88
11 17
69 13
73 31
25 88
47 8
0 56
5 29
57 10
42 45
58 90
86 2
26 86
80 42
41 55
51 92
81 21
91 49
54 60
43 60
87 21
88 32
32 94
54 65
84 50
60 43
47 65
7 18
76 71
33 51
78 56
23 80
56 64
48 30
43 31
59 82
8 19
5 37
46 68
51 39
64 3
7 56
62 62
38 48
81 28
6 61
18 66
10 33
65 23
21 59
86 49
19 50
63 54
8 66
48 28
14 41
1 67
18 13
15 48
49 94
30 0
66 72
90 48
63 77
84 71
86 61
79 70
76 1
31 50
5 94
65 31
16 27
74 10
27 42
32 14
72 34
48 21
61 59
38 26
29 47
79 87
79 53
1 28
93 87
77 55
94 30
0 26
29 41
45 50
53 66
5 71
38 41
79 31
47 33
36 44
16 10
92 22
72 54
49 28
48 8
21 88
62 49
38 73
61 56
80 38
56 67
53 37
67 57
79 15
35 21
51 60
13 22
69 65
30 45
55 33
67 73
66 11
26 19
63 36
1 89
92 90
68 69
31 73
24 9
52 25
21 13
70 47
20 50
25 55
41 92
83 37
6 80
92 49
1 14
13 41
84 4
34 94
85 87
16 13
89 58
17 81
45 4
2 6
10 54
25 14
71 7
90 1
51 73
88 54
37 56
35 81
24 46
85 75
81 4
49 82
28 92
29 64
9 72
29 27
62 47
77 24
81 74
43 10
85 64
17 16
80 82
0 27
88 24
79 31
63 54
76 19
83 2
86 65
54 30
78 89
14 17
87 30
32 80
18 87
33 50
76 27
59 42
27 90
9 83
17 44
28 70
39 51
43 69
63 66
9 60
44 41
42 5
81 14
21 41
37 64
45 82
19 63
22 53
67 74
40 38
70 32
87 46
3 10
81 68
60 26
38 50
68 16
27 40
74 63
14 39
15 61
27 10
88 61
76 64
54 64
30 88
12 66
25 69
1 60
68 72
45 34
70 89
75 54
70 93
30 32
32 34
46 22
64 90
93 0
60 71
27 73
55 54
22 79
94 79
4 42
79 41
22 76
33 51
0 4
94 36
24 10
63 94
60 2
40 9
53 93
83 64
66 1
15 82
17 9
5 92
79 80
62 8
36 71
54 25
92 4
16 45
78 20
70 9
28 33
76 26
55 81
22 39
0 32
7 32
11 5
84 18
44 6
46 19
84 20
33 43
78 56
71 43
25 23
83 42
29 66
9 51
91 51
22 75
45 23
20 52
34 62
84 44
34 34
21 41
86 92
66 49
2 57
11 5
73 3
78 46
89 60
1 81
1 73
17 52
55 19
6 10
44 17
17 92
75 32
94 18
66 38
73 39
41 59
89 85
9 75
93 76
10 45
71 53
9 46
29 3
61 43
73 93
67 10
85 48
76 77
67 15
63 35
39 9
37 63
69 81
2 25
15 3
43 83
41 91
17 52
30 41
77 73
61 26
93 89
28 27
83 45
37 1
54 93
30 79
71 3
22 54
17 0
73 82
66 77
48 43
74 34
4 28
14 27
0 71
2 62
21 73
69 89
43 18
55 32
64 6
92 42
20 30
24 4
67 7
92 46
65 59
25 71
30 57
8 31
85 17
49 53
45 17
35 38
21 27
84 63
4 94
15 93
82 13
76 90
56 13
31 61
37 38
29 4
81 64
16 6
77 78
67 73
17 43
4 27
85 23
5 9
53 69
50 0
75 34
51 56
71 81
64 63
84 9
16 51
32 15
37 54
48 45
70 38
58 39
72 91
24 73
3 66
24 52
12 66
32 8
80 15
51 40
14 93
24 1
88 8
57 1
28 65
46 88
66 6
42 4
35 82
16 46
35 7
14 86
16 79
25 78
69 78
70 37
85 87
39 12
85 48
35 69
50 38
8 67
87 60
50 94
55 59
78 21
49 52
17 92
44 72
24 94
39 79
39 58
77 52
49 37
10 56
42 82
70 14
64 8
39 66
60 39
21 39
47 66
29 26
5 87
69 56
79 93
42 2
91 71
2 35
49 45
51 67
23 80
93 57
79 35
30 7
12 68
80 7
80 20
23 91
15 7
90 70
9 73
7 3
26 85
5 50
79 93
65 59
86 35
29 3
92 16
56 11
17 79
64 62
90 75
71 49
54 92
31 35
94 73
61 27
30 28
66 15
13 12
31 2
23 73
32 85
59 29
8 19
63 79
7 22
45 76
81 62
51 9
91 30
91 55
42 31
23 61
35 91
34 13
76 80
51 42
47 48
43 86
78 13
93 61
80 90
68 59
22 23
67 56
46 52
68 18
16 42
91 11
47 21
84 65
8 54
24 11
74 56
0 55
42 74
62 44
89 42
11 93
10 15
19 22
35 49
54 68
23 87
60 30
65 59
43 71
53 32
47 81
87 5
57 59
64 48
8 25
18 56
57 87
29 65
62 31
58 39
77 78
79 55
71 1
30 69
63 9
38 66
33 60
46 24
93 63
92 22
69 45
85 84
1 35
92 54
57 8
90 28
87 68
8 73
78 76
16 76
63 6
7 56
69 90
82 80
51 88
69 68
28 68
38 56
94 25
27 44
17 93
44 7
7 34
33 44
57 59
75 29
34 54
11 48
33 64
84 80
42 8
42 72
38 89
37 92
22 1
93 34
79 3
71 38
74 75
33 94
8 58
18 10
86 13
65 66
50 16
18 27
73 69
12 30
81 66
20 14
81 76
83 63
13 91
54 41
13 42
39 66
9 20
61 41
57 1
16 41
70 1
41 12
59 94
76 76
58 78
62 77
4 61
8 68
31 57
12 84
6 34
28 62
39 58
34 55
57 49
47 36
1 6
31 25
70 13
67 49
1 65
41 43
59 33
72 73
67 67
41 25
5 86
40 23
20 87
38 41
94 8
77 93
82 8
60 13
27 21
58 68
70 27
94 51
17 0
81 76
79 47
78 81
23 7
94 60
91 71
88 54
83 44
47 70
27 34
52 89
38 73
92 0
22 40
44 3
35 61
20 92
62 27
45 68
55 53
21 4
69 85
54 29
50 93
83 80
85 16
87 43
73 33
46 43
48 38
60 25
49 24
18 69
67 55
19 49
88 23
15 53
7 41
89 29
53 12
20 69
2 89
78 6
1 34
8 67
52 30
79 30
52 84
62 55
88 41
3 81
41 17
52 71
93 71
34 55
50 15
69 7
73 45
70 16
21 11
38 72
64 55
58 42
75 66
82 32
49 91
23 54
77 70
16 42
13 66
70 56
65 44
13 64
64 77
9 26
38 52
36 24
15 4
65 78
91 67
81 18
60 12
71 32
44 11
74 91
88 8
75 51
21 67
7 16
35 87
84 80
5 30
16 51
54 73
89 7
51 46
38 49
55 77
16 39
90 65
57 13
36 34
16 65
6 92
332041000100092629maraton/mylib/graph/dfs_r.cpp#include <iostream> 
#include <stdio.h>
#include <vector> 

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d",&c,&cc)

//type for adyacency list
typedef vector< vector<int> > adyl ;


#define MAX_NODES 30000

adyl my_adyl(MAX_NODES);
int parent[MAX_NODES];

/*	Recovery of dfs paths	*/
void path_print(int n) { 
	int d; 

	FOR(n) { 
		d = i; 
		while (d != parent[d] && parent[d] != -1) { 
			cout<<d<<" "; 
			d = parent[d]; 	
		}
		
		if(parent[d]!=-1 || paren[d]==d)
			cout<<parent[d]<<endl;
	}
}

vector<int> getAdyacents(int current) {

	return my_adyl[current]; 
}


void dfs_r(int current) { 
	
	vector<int> ady;
	int d;

	ady = getAdyacents(current); 

	FOR(ady.size()) {
		
		d = ady[i]; 
		if( parent[d] == -1 ) 
		{ 
			parent[d] = current; 
			dfs_r(d); 
		}
	}
		
}

int main() 
{

	return 0; 
}
3320410001000312434maraton/mylib/graph/comp_conex.cpp#include<iostream> 
#include<set> 
#include<vector>
#include<list>

using namespace std; 

void load(vector< vector<bool> > &in_m, int size, int n_edges);
void print(vector< vector<bool> > &in_m, int size);
void roy_warshall(vector< vector<bool> > &in_m, int size); 
int comp_conex(vector< vector<bool> > reach_m, vector< vector<int> > &resp, int size);

int main() 
{ 
	vector< vector<bool> > in_m;
	vector< vector<int> > results; 
	int n, e; 
	
        cin>>n>>e; 

	load(in_m, n, e); 

	roy_warshall(in_m, n); 
	
	int stop = comp_conex(in_m, results, n);

	for(int i=0; i<stop; i++) { 
		for(int j=0; j<results[i].size(); j++) { 
			cout<<results[i][j]<<" "; 
		}
		cout<<endl;
	}

	
	return 0; 
}


int comp_conex(vector< vector<bool> > reach_m, vector< vector<int> > &resp, int size)
{
	/*Main algorithm: 
	 *
	 * 	-Input: Reach matrix
	 * 	-Output: Conex components of a graph
	 *
	 * 	It uses a set to represent the elements of the graph and iterates while the set is not empty, using the d-th element
	 * 	of the set as a "representative" whose reacheable nodes are calculated in O(n) time using the reach matrix.
	 * 	
	 * 	Since it requires the reach matrix, the preprocessing pushes the time bound to O(n^3) (Roy-Wharshall).
	 *
	 * 	-Order: 
	 * 		>>Time: O(k*n) where k is the number of conex components and n=|V|
	 * 		>>Memory: 
	 * 	-Propositions Involved: None
	 * 	-Termination: For every node, whithin the internal loop it is garanteed that at least one node will be deleated from
	 * 	the set (since for all i such 0<=i<n, in_m[i][i] == true), thus the while condition is guaranteed to be false 
	 * 	eventually.
	 * 	-Correctness: A conex component is defined as the induced graph from every partition of V derived from the mutual 
	 * 	reach relation. This algorithm verifies for a node, wheter the elements it reaches, reach it as well (mutual reach),
	 * 	and then it groups them in the same vector (which ressembles a partition). Thus this algorithm.....
	 */ 

	resp.resize(size);
	set<int ,less<int> > sect; 
	
	for(int c=0; c!=size; c++) {
		sect.insert(c); 
	}

	set<int, less<int> >::iterator d; 
	int node, count; 
	count = 0; 
	while ( !sect.empty() )	{
		d = sect.begin(); 
		node = *d; 

		for(int r=0 ; r!=size ;r++) { 
			
			if(reach_m[node][r] && reach_m[r][node])
			{
				resp[count].push_back(r); 
				sect.erase(r);
			}
		}
		count++; 
	}
	
	return count;
}

void roy_warshall(vector< vector<bool> > &in_m, int size)
{
	
	for (int k=0; k<size; k++) { 
		for(int j=0; j<size; j++) { 
			for(int i=0; i<size; i++) { 
				in_m[i][j] = in_m[i][j] | (in_m[i][k] && in_m[k][j]) ;	
			}
		}
	}	
	
}


void load(vector< vector<bool> > &in_m, int size, int n_edges)
{
	
	in_m.resize(size); 
	for(int i=0; i<size; i++) { 
		in_m[i].resize(size); 
		in_m[i][i] = true; 	
	}

	int a,b; 
	for(int j=0; j<n_edges; j++) { 
		cin>>a>>b; 
		in_m[a][b] = true;
	}	

}


void print(vector< vector<bool> > &in_m, int size)
{
	for(int k=0; k<size; k++) { 
		for(int l=0; l<size; l++) { 
			cout<<in_m[k][l]<<" "; 	
		}	
		cout<<endl; 
	}	

}

/* Input type: 
 	n
	e
	v_1 w_1
	v_2 w_2
	.
	.
	v_e w_e
*/
332041000100054931maraton/mylib/graph/kruskal.cpp#include<iostream> 
#include<vector> 
#include<set> 
#include<queue> 

using namespace std; 

void load_weighted(vector<vector<int> > in_m, int size, int edges); 
void prim(vector<vector<int> > in_m, int size, int root); 

int main() 
{ 

	return 0; 
}

void load_weighted(vector<vector<int> > &in_m, int size, int edge)
{
	in_m.resize(size); 
	for(int i=0; i<size; i++) {
		in_m[i].resize(size); 
	}

	int u,v,p; 
	for(int j=0; j<edges; j++) { 

		cin>>u>>v>>p; 
		in_m[u][v] = p; 
	}
}

void prim(vector<vector<int> > in_m, int size, int root)
{

33277100010004185224maraton/mylib/graph/out2ELF              0�4   |�      4   	 (       4   4�4�               T  T�T�                    � �W  W           �^  ����p  �           _  ���   �            h  h�h�D   D         P�tdh:  h�h�T  T        Q�td                          R�td�^  ����          /lib/ld-linux.so.2           GNU                        GNU �R��Xaƛ��8�a3���\�              !a         s��K��!��	(E�L�CyIk�                                                                        �             7             �             *             3               i              O               �             �                          �             "             �              �              ]             �              �             �  ���     �  ,�     �   ��       E  @�       �    ��     v   �        libstdc++.so.6 __gmon_start__ _Jv_RegisterClasses _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc _ZSt4cout _ZNSolsEPFRSoS_E __cxa_end_catch __cxa_begin_catch _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ _ZSt20__throw_length_errorPKc __cxa_rethrow _ZNSt8ios_base4InitD1Ev _ZSt17__throw_bad_allocv __gxx_personality_v0 _Znwj _ZNSt8ios_base4InitC1Ev _ZNSirsERi _ZdlPv _ZSt3cin _ZNSolsEb libgcc_s.so.1 _Unwind_Resume libc.so.6 _IO_stdin_used __stack_chk_fail __cxa_atexit memmove __libc_start_main GCC_3.0 GLIBC_2.4 GLIBC_2.0 GLIBC_2.1.3 CXXABI_1.3 GLIBCXX_3.4                                     �         P&y   <        �     @   ii   D     ii   N     si	   X                  ӯk   d     t)�   o      ��  ��   �  �  �  �  �  �   �  $�  (�
  ,�  0�  4�  8�  <�  @�  D�  H�  L�  P�  T�  X�  S���  ��Sh  ��������t�^  ��[�         �5��%�    �%�h    ������%�h   ������%�h   ������%�h   �����%�h    �����% �h(   �����%$�h0   �����%(�h8   �p����%,�h@   �`����%0�hH   �P����%4�hP   �@����%8�hX   �0����%<�h`   � ����%@�hh   �����%D�hp   � ����%H�hx   ������%L�h�   ������%P�h�   ������%T�h�   ������%X�h�   �����%��f�        1�^����PTRh�h��QVh+�������f�f�f�f�f�f�f��$�f�f�f�f�f�f��g�-d���v�    ��tU���hd��Ѓ���Ð�t& �d�-d����������t�    ��tU���Phd��҃���Ít& ��'    �=�� uU����|���������f�� ����u듍v �    ��t�U���P�҃���u����L$����q�U��SQ�� e�   �E�1����E�P�
  �����E�Ph���(��������E�PR�������U�E���RP�E�P�
  ���E���P�E�P�e   ���E���P�E�P�O  ���    ���E�P�E
  ���؋M�e3   t#��Ã��E�P�$
  ���؃�P���������e�Y[]�a��U��VS��@�E�E�e�   �E�1��E�    �E�;E�M  �E�    �E�;E�1  �E�    �E�;E�  �]̋EЃ�P�u��
  ���E܃�SRP�
  �����E�P��  �����E� �]ȋEЃ�P�u���	  ���E��SRP��	  ���E����E�P�  ����tF�]̋Eȃ�P�u��	  ���E��SRP�	  ���E����E�P�K  ����t�   ��    	��؋űEЃ�P�u��;	  ���Eԃ�VRP�B	  ����S�E�P�  ���}� �}� �E�������E�������E�������E�e3   t������e�[^]�U��S��D�E�E�e�   �E�1����E�P�A	  ���E���U�RP�u��{
  �����E�P�4	  ���E�    �E�;E}c�]�E؃�P�u��l  ����j SP��
  ���]؋E؃�P�u��H  ���E���SRP�O  ����j�E�P�$  ���E���E�    �E�;E��   ���E�Ph�����������E�PR�������EԉËEЃ�P�u���  ���E���SRP��  ����j�E�P�  ���E�덉Ã��E�P�7  ���؃�P�!�����E�e3   t�����]���U��S��4�E�E�e�   �E�1��E�    �E�;E��   �E�    �E�;E}b�]�E��P�u��"  ���E��SRP�)  �����E�P��   ������Ph ����������h0�P�������E�떃�h��h ���������E��e�����E�e3   t�����]���U����}u3�}��  u*��h���'�������h`�h��h@�����������U�����h��  j��������U��E]�U��]ÐU��E�U��E�U�P�]ÐU��E� ��E�@!Ѕ���]ÐU����E�E��}� t�E� �U��
�U�R	ʉ��E� �U��
�U�R��!ʉ�E�ÐU������u����������P�u��������U��]�U������u��������E�U��E�U�P���U��E�@�H�U�J������t�E�@    �E� �P�E��]�U��E�@�H��U�J������t�E�@   �E� �P��E��]ÐU����E�P�EЉE��E��E��H��H�����E��E����Ѓ�)ЉE��}� y�E� �E� �P��E��U��E�P��ÐU��E��E� 9�u�E�P�E�@9�u�   ��    ]ÐU������u�u����������U��E� �E� )������E�@E�@)�]ÐU����E��j j P�t��������U����E���u�uP�V��������U����E�@�   ����E� ��RP�u�������E�� �U����E��P�4������E��U����E��P�P������E��U����E���uP�i������E�ÐU���(�E�E�E�E�e�   �E�1��E��P� �E�U����u�E�P�������M�P� ��Q�E�U�e3   t������ U����E���u�uP�R��������U����E�H�E��E��QRP�-�������ÐU���(�E�E�e�   �E�1��E�@�   ����E� ��RP�E�P�E��������E�P�N������M�e3   t�`�����U����E��P��������E��U��S��$�E�E�e�   �E�1����EP�EP��������t8�]�E���URP��������S�E�P����������EP�.�����뱐�E�e3   t������]���U��S��$�E�E�e�   �E�1��U�E9���   �E�� ��t�������    �E�E�U�J���U�RPQ�   ���E�� �؋E����j P�E�P�K�������S�u��u��u�u������� �E�� �؋E��j P�E�P��������S�u�u�u��u������� �!�E�� ����P�u�u�u�u������ ��E�e3   t������]���U��S�����u�  ���Ã��u�  �����uSP�  ����]��ÐU����E��P�0  �����U��S���E��P�  �����E�P�E� ��QRP�  ���E��P�  ����ËE��P��  ���؃�P�����]��ÐU��E��U��������]ÐU���(�E�E�E�E�e�   �E�1��E���E�� �M����ȃ�RP�E�P�������E���U�RP�������E�U�e3   t������ �U����E��P��  �����U����E��P��  �����U��S��4�E�EԋE�E�e�   �E�1��EЃ�P�  ����P��  ����P�E�P��  ���Eԃ��U�RP�  �����E�P��  �����u��  ����P�u��G  ���E���u�P�	  ���E���u�P��  ���E܋U��r�2�u��u��u��u��u�P�  ����E�e3   t?�8�Ã��E�P�b  ���؃�P������ËEԃ�P��  ���؃�P������5����]���U��S��$�E�E�E�E�e�   �E�1����u��y  ��;E����t=���u��a  ���E)ЉÍE����u�P�f  ���u�S�u��u��v  ���;���u��$  ��;E����t#�E��U�������ȃ�P�u��W  ����E�e3   t�p����]��ÐU��S��4�E�U�UԈE�e�   �E�1����u��u  ��;E����t?�]�E���u�P�D  ���E��S�U�RP���������u��u��u��  ���B���u��  ���E)ЉÍE���u�P�  �����E�PS�u��u��u��  �� ��E�e3   t�����]���U������u�  ����U����E� �E��E;Et�U��E��E���ÐU������u�  ����ÐU����E��P�  �����U��S���E�@�E� )���i����̉E� ��RP�u��  ���E��P��������ËE��P�y������؃�P�Y����]���U��E]�U������u�u�  �����U������u��  ����ÐU����E��P�  �����U��S�����u��  ���E��P��������ËE��P�������؃�P������]���U��E]ÐU��E]�U������u��  ����ÐU������u�  ����ÐU���(�E�E�E�E�e�   �E�1����u��E�P�  ���E���U�RP�  �����E�P��  ����E�e3   t�����ÐU��S��$�E�E�e�   �E�1��E���uP�  ���E���u�  ����    �E�E�P���u��  ����j P�E�P�������M�E�U���Q�M�U�]�E؃�QRP�������E؋U܉C�S��E�e3   t������]���U���8�E�E�e�   �E�1��E���u�P��   ���E���u�P��   �����E�P�E�P�1������U�e3   t�m����ÐU���8�E�EԋE�E�e�   �E�1��M �U�E��QRP�  ���E���j �u��E�P�������E��j P�E�P�������Eԃ��u��u��u�u�u��u�P�  ���EԋU�e3   t������� �U����E��P�u��������E�� �U����E����P�u�������E�� U��E�@�E� )���i�����]ÐU����E����P�u�v  ���E�� U����u�u�u�u�e  ����ÐU����E��P�X������E�@��RP�u�H������E�U�P��ÐU��M�E�U�A�Q�]ÐU��M�E�P� ��Q�E]� U��M�E�P�@��Q�E]� �U����E� ����P�u�u�u�u�v  �� ���U��E]�U������u��	  ���E�     �E�@    �E�@    ���U������u�	  ����ÐU����} t�E���u�uP�	  �����U������u�u�	  �����U������u�	  ���E��P�������E����P�������E�@    ���U������u�	  ����ÐU����E� ��tC�E��P�m	  ���E� )����E�E�@�U�����E���u�RP�j	  ����ÐU��]�U��]�U������u�c	  ����ÐU������u�u�N	  ���E��P��������E����P��������E�@    ��ÐU������u�   ���E��RP�	  ����U��E����]�U��E]�U��S�����u�	  ���Ã��u��  �����uSP��  ���]���U���8�E�E�e�   �E�1��E���u�uP�	  ���E���u�uP��  ���Eԃ��u �u�u��u��u��u�P�	  ���EԋU�e3   t������� U��E��E��]�U��WVS��\�E�E��E�E�e�   �E�1��} �~  �E��@�E��@)���i�����;E��  ���u��E�P�#������E����u�P����������EP�E�P��  ���E��E��@�E��E�;E��   �E���P�c������ǋE��X�E��H�E��p�U����������WSQP��  ���E��H�U���������E��P�U��������؉E�����EP�  ��� ���u�SP�  �����EP�  ����U�����������EP�z  ��� ���U�RSP�  ���   �E���P���������E+E��E��@Q�M�QRP�  ���E��P�E���P�Q������ƋE��X���EP�  ��� VS�u�P��  ���E��H�U����������E��P���EP��  ��� ���U�R�u�P��  �����E�P�7������o  ��h2��u�u��&  ���EčEЃ��u�P��  �����E�P�EP�  ���EȋE����u�P��  ���E̋ẺE��E���P�k��������Uȉ�������E��Q�u��uP�  ���E�    �E���P�/������Ã��EP��  ����E�� S�u�RP�  ���E��U�������E��E���P��������ƋE��X���EP�  ��� V�u�SP�O  ���E��E���P���������E��P�E�� ��QRP�������E��@�E�� )���i����̉��E���E���QRP��������E��Ủ�E��U��P�Uĉ�������E�E��P��   �Ã��E�P�|������؃�P�f�����P�=������}� uO�E���P��������ËUȋE�������E̍�Uȉ�������E�Ѓ�SQP�������!�E���P��������P�u��u��������E����u��u�P��������������s����؃�P������E�e3   t�����e�[^_]�U��S��T�E�U�U��E�e�   �E�1��} �;  ���u���  ���Ã��u��������)É�;E������   �U�E��H�Eă�RQP�=������Ẽ��u�P��������E���u��u��u��u��u�uP��  ���U�Eԃ�R�URP����������E�P�u��u��u�u�t����� �E�U�����PR�������r  ��hI��u�u���  ���E��E����u�P�"������E����u��G�������j P�E�P����������EP�E�P��������E܃��u�P����������E�P�E�P�������E��u��u��u��u��u��u��u�P�������U�E܃�R�U�RP����������E�P�u��u��u��u������� �U�E��R�U�RP��������E���u�P�Y������]��E����u��u��u��u��u�uP�  ���E��U��C�S�E���P�L��������u��&�������    �E�E��P�M��E̋UЉ�Q���E�e3   t�����]���U������u�  ����ÐU��]�U������u�u�u�  �����U����E;Et ���u�  ����P�  ���E�ؐ��U������u�[   ����ÐU��]�U����E�@��t�E�@����P�L���������    ��U������u�u�u�,  �����U��]�U������u�u�$  �����U�����j �u�u�  ����U������u���������U��VS���u�������ƃ��u�������Ã��u��������VSP��  ���e�[^]�U���(�E�E�e�   �E�1��E���u�uP��  ���E�U�e3   t������� U���8�E�E�e�   �E�1��E܃��u �uP��  ���E���u�uP�  ���E���u�uP�  ���Eԃ��u��u��u��u��u��u�P��  ���EԋU�e3   t�T����� U��S�����u�F   ��� �Ã��u�4   ��� )É���i����̋]���U����u�u�u�u��  ���ÐU��E]�U��S�����u��  ���Ã��u�  �����uSP��  ���]���U��S�����u��  ���Ã��u��  �����uSP��  ����]���U������u�u�u��  ���ÐU��S��$�E�E�E�E�e�   �E�1����u���  ���Ã��u���������)E9�����t���u��g������u��n������Ã��u��^������E���EP�E�P�  ��� ؉E����u��3�����;E�w���u��Z  ��;E�s���u��G  ����E��M�e3   t�����]��ÐU����E��P�u�������E�� �U����} t�E���uP�+  ����    ��U����u�u�u�u��  ���ÐU���8�E�E�e�   �E�1��E���u�P�"������Eԃ�P���������j P�E�P����������E�P�E�P�n������U�e3   t������U���8�E�E�e�   �E�1��E���u�uP�  ���E���u�uP�o  ���Eԃ��u �u�u��u��u��u�P�  ���EԋU�e3   t�2����� U��S��$�E�E�E�E�e�   �E�1����u���  ���Ã��u��)�������)E9�����t���u��7������u�� ������Ã��u���������E���EP�E�P�u  ��� ؉E����u��������;E�w���u��V  ��;E�s���u��C  ����E��M�e3   t�R����]���U���8�E�E�e�   �E�1��E���u�uP�)  ���E���u�uP�  ���Eԃ��u �u�u��u��u��u�P�	  ���EԋU�e3   t������� �U��]�U������u�;��������U��E]�U������u�4��������U������u��������ÐU��]�U������u�  ��;E����t�����E����P�6�������U����E����u�u�u��  ����U��M�E�U��Q�E]� U���(�E�E�e�   �E�1��E���u�uP�������E�U�e3   t������� U���(�E�E�e�   �E�1��E���u�uP�  ���E�U�e3   t������ U���(�E�E�e�   �E�1��E� �E���u �u�u�u�u�uP�Y  ���E�U�e3   t�1����� U������u�u�u��  ����U������u��  ����U��VS���u�8   ���ƃ��u�(   ���Ã��u�   ����VSP�  ���e�[^]�U������u�  ����U����E;Et���u�u�  ���E����U����E����u�u�u�j  ���ÐU����E��P��  ����P�  ����U��E��E� 9�s�E��E]�U�����j �u�u�  ����U���(�E�E�e�   �E�1��E���u�uP��  ���E�U�e3   t������ U���8�E�E�e�   �E�1��E܃��u �uP��������E���u�uP�������E���u�uP�������Eԃ��u��u��u��u��u��u�P�'  ���EԋU�e3   t�,����� U����E�����E��P���������P�;  ���E�}����w�E����������U���8�E�E�e�   �E�1��E܃��u �uP��������E���u�uP��������E���u�uP��������Eԃ��u��u��u��u��u��u�P�  ���EԋU�e3   t�Z����� U�����?]�U����U�E)����E�}� t�E�����P�u�u�;������E��    �E���U��M�E�U��Q�E]� U��S��$�E�E�e�   �E�1����EP�EP�w������E�}� ~Y���EP��������؍E���URP��������S�E�P�}��������EP���������EP�������m�롋M�E�U ��Q�E�U�e3   t�@����]��� U����E����u�u�u��  ����U��E]�U����E� ���u�u�u�  ���ÐU��S��4�E�EԋE�E�e�   �E�1��E�;E�u�E��   ���u���������Ã��u�������9�����t,�Eԃ�P����������u���������P�u���������E܃��u�P�������E���u�P�������E���u�P�l������]ԍE��u��u��u��u��u��u��u�P�������EȋỦC�S�EԋU�e3   t������]���U��S���E�E�} t'���u����������uP�%  ���m�E��ӋE��4��P���������u��u������������������؃�P�����]���U������u�  ����U��E]�U������u��  ��;E����t�����U���������P��������U���(�E�E�e�   �E�1��E� �E���u �u�u�u�u�uP�  ���E�U�e3   t������� U������u�a�������U���(�E�E�e�   �E�1��E� �E���u �u�u�u�u�uP��  ���E�U�e3   t�b����� U��S���E�E�E;Et'���u����������uP�   ���E�E��ыE��4��P���������u��u��������������4����؃�P�y����]���U����U�E)���i����̉E�}� ~�m�m���u�u�������m��ۋE��U��WVS���u��Vj�:������Å�t+���uS�"�������ǃ�VS����������P�������e�[^_]�U�����]�U���8�E�E�e�   �E�1����EP�EP��������E��}� ~[���EP�g������E��RP�	��������EP�F������E��RP����������E�P�E�P��������m�럋MԋE�U ��Q�EԋM�e3   t������ U���8�E�E�e�   �E�1����EP�EP�������E��}� ~]�E���URP�c������E���URP�P��������E�P�E�P�_��������EP�`��������EP�Q������m�띋MԋE�U ��Q�EԋM�e3   t������� f�f�f�UWVS������G6  ���l$ �����������������)�����t%1���    ���t$,�t$,U�����������9�u��[^_]Ív ��  S���C������5  ��[�       vector::_M_fill_insert vector<bool>::_M_fill_insert   ;P  �   h���l  ����	  ����T	  3����	  �����	  o���,  ����L  �����  �����  �����  �����  ���  T���0  |���P  ����p  �����  �����  ����  |����  ����  ����0  ����P  ���p  2����  d����  ~����  �����  ����  ���0  6���P  \���p  �����  �����  R����  T����	  �����	  ����
  ���@
  &���`
  �����
  �����
  �����
  �����
  ����  |���8  ����X  ����x  �����  �����  T����  \���  v���$  ����D  ����d  �����  �����  �����  ����  .���  ����0  L���T  ����t  H����  h����  �����  �����  ����  ����4  $���T  :���t  T����  p����  �����  �����  ����  ����4  ���T  ,���t  n����  �����  �����  �����  ����   ���4  F���T  n���t  |����  �����  �����  8����  H���  
���P  ����t  �����  �����  �����  �����  ���  ���4  ?���T  \���t  b����  |����  �����  �����  ����  9���<  ����\  ����   ����  (����  b����  ����  ����(  ����L  ����l  �����   ����  p����  �����  ����  F���0  L���P  c���p  k����  �����  �����  �����  ����  ����0  ���P  S���p  �����  �����  ����  ����  e���  {���8  ����X  ����x  �����  ����  ����  a����  ����  3���8  ����X  ����x  ����  )����  �����  �����  ���  (���<  (���`  �����  �����  �����  �����  P���  f���,  ����L  4���x  z����  �����  �����  ����  H���l  �����         zR |�         ����P   FJtx ?;*2$"   @   3���    A�BD�     `   ���    A�BB�     �   ���    A�BS�     �   ����    A�BU�     �   ����G    A�BC�    �   ���(    A�Bd�        $���    A�BB�        
���(    A�Bd�     @  ���6    A�Br�     `  (���5    A�Bq�     �  >���e    A�Ba�    �  ����/    A�Bk�     �  ����    A�BX�     �  ����/    A�Bk�        ����    A�BX�        ����    A�BZ�     @  ����1    A�Bk�     `  ����    A�BV�     �  ����    A�BV�     �  ����    A�BY�     �  ����b    A�B\�    �  ����    A�BZ�        ����%    A�Ba�        ����^    A�BZ�    @  "���    A�BV�      `  ���~    A�BD�v��     �  v���   A�BD����        zPLR |  � �  8   $   �����   8�D Gu Duxu|i.�� A�A�C (     E����   A�BE����A�A�   (   �   ����k  O�A�BD�n.5��     \  �����    A�BD����     �  |���;    A�BD�s��     �  ����    A�BT�  (      ����c   f�A�BD�b.y��      �  ����    A�BU�       ����q    A�Bk�    0  ���    A�BT�     P  ���    A�BT�  ,   �   ���   v�A�BD�M.s. X��     �  �����    A�BD����     �  �����    A�BD����    �  <���    A�BR�       2���'    A�Bc�     (  :���    A�BS�     H  2���    A�BT�  (   �  *���j   ��A�BD�i.y��      �  h���    A�BD�     �  P���    A�BV�     �  J���    A�BS�     �  B���    A�BT�  (   p  :���G   ��A�BD�F.y��      @  U���    A�BD�     `  >���    A�BD�     �  &���    A�BS�     �  ���    A�BS�     �  ���e    A�Ba�     �  \����    A�BD����      ����a    A�B]�    $  2����    A�B��    D  ����    A�BY�     d  ����"    A�B\�     �  ����    A�B[�     �  ����"    A�B\�     �  ����    A�BY�     �  ����9    A�Bu�     	  ����    A�BQ�     $	  ����    A�BT�     D	  ����    A�BU�     d	  ����*    A�Bf�     �	  ����    A�BD�     �	  ����4    A�Bp�     �	  ����    A�BS�     �	  ����$    A�B`�     
  ����    A�BV�     $
  ����B    A�B~�     D
  ����    A�BS�     d
  ����U    A�BQ�    �
   ���    A�BB�     �
  ����    A�BB�     �
  ����    A�BS�     �
  ����E    A�BA�      ����(    A�Bd�     $  ����    A�BJ�     D  ����    A�BD�      d  ����:    A�BD�r��     �  ����z    A�Bt�    �  8���    A�BL�  4   $  (����  ��A�BF���t.. m�A�A�A�       ����z   A�BD�r��   $  ���    A�BS�     D   ���    A�BB�     d  ����    A�BY�     �  ����1    A�Bm�     �  ����    A�BS�     �  ����    A�BB�     �  ����1    A�Bm�       ����    A�BY�     $  ����    A�BB�     D  ����    A�BV�     d  ����    A�BW�     �  ����    A�BR�  $   �  ����H    A�BB��@�A�A�   �  ����D    A�B~�     �  �����    A�B��       d���;    A�BD�s��     0  {���    A�BX�     P  x���    A�BD�      p  `���:    A�BD�r��      �  v���;    A�BD�s��     �  ����    A�BX�      �  �����    A�BD����    �  H���    A�BY�       H���'    A�Bc�     <  O���    A�BX�     \  L���p    A�Bl�    |  ����z    A�Bt�     �  �����    A�BD����    �  ����z    A�Bt�    �  ���    A�BB�        ����    A�BS�        ����    A�BD�     @  ����    A�BS�     `  ����    A�BS�     �  ����    A�BB�     �  ����7    A�Bs�     �  ����     A�B\�     �  ����    A�BR�        ����D    A�B~�        ����D    A�B~�     @  ����T    A�BN�    `  3���    A�BX�     �  /���    A�BR�  $   �  %���H    A�BB��@�A�A�   �  E���    A�BR�     �  ;���(    A�Bd�       C���     A�B\�     (  D���#    A�B_�     H  G���    A�BW�     h  B���    A�BW�     �  =���D    A�B~�     �  a����    A�B��    �  ����C    A�B�     �  �����    A�B��      b���
    A�BF�     (  L���E    A�BA�    H  q���    A�BR�      h  i����    A�BD����    �  ����     A�B\�     �  ����    A�BD�     �  ����     A�B\�      �  ����    A�BD���� (   l  ����x   ��A�BD�a.t. [��   <  ���    A�BR�     \  ���    A�BD�     |  ����>    A�Bz�     �  ���T    A�BN�    �  <���    A�BR�     �  2���T    A�BN� (   X  f���z   ��A�BD�c.t. [��   (  ����F    A�BB� 0   �  ����T   �A�BF���^.i�A�A�A�     |  ����
    A�BF�     �  �����    A�B��    �  x����    A�B��    �  ;���B    A�B~�     �  ]���    A�BV�  H     ����]    A�A�A�A�N i$D(D,A0M GA�A�A�A�     h  ����           ��$  8T� �  �  ��  5� D�  �  ��)B 8  Y  ��T� q[� �  �  ��0I `  ��& =    � 5+X  }�� �]  ����7  �  �E�	 �	         � (?Ta n        � *AVc p        ��'1 F                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ����             �     �     ��   �   ��         ��      ���o��   ��   �
   {                   �   �            �   �            ���o\����o   ���o$�                                                    �        �����&�6�F�V�f�v���������ƈֈ�����        GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609                        T�          h�          ��          ��          �          ��          $�          \�          �     	     �     
     ��          Ї           �          0�          �          (�          h�          ��          8�          ��          ��           �          �          ��           �          \�          ��                                ��    �         p�         ��      .   ��      D   ��     S   ��      z    �      �   ��      �            ���   ��     �   ׎B     �   �                 ��	  4�         �                   ��#  h�       6   �      L  ��       ]  ��       p  �      y  ��   "  �  \�       �  ���     �  ��   "  �  ��   "     >�   "               H  ]�D   "  �  &�>   "  �  ��  "  �  ~�   "    ?�    "  1  �G   "  Q  J�   "  u  �T   "  �  �   "  �  ʪ;   "  �               �   "  5  �     E  "�z   "  �  0�      �  �/   "  �  ��   "     �(   "     ���   "  �  ��   "  �  ��       f�   "    
�4   "  Z  ɱ�   "  �  "�   "  �  �   "    ʨ   "  "  0�;   "  �  ��   "  �              �              �  B�   "     (�       ���   "  B             V  �   "  |  ��'   "  �  0�/   "  �  &�z   "  =	  h�E   "  r	  B�   "  ?  �      �	  �b   "  �	  _�   "  �	             �	             "
  ���   "  q
  ��1   "  �
  �   "  �
  �(   "  '  ؝*   "  Y  r�z  "  �  R�9   "  �  ��   "  �  P�   "  �  ��B   "  ,  '�1   "  k  ޙ   "  �  ��   "  �  �   "  �  �(   "    `�   "                =  R��   "  f  `�   "    ��   "  �  4�E   "  !  G�    "  \  |�   "  w  ��   "  �   �   "  �  �   "  �  z�   "    R�j   "  O  ��B   "  ~  �   "  �  @�       �              �             ,  D�   "  P  ,�     _  3�   "  g  �   "  �  Ͱ   "  �  ˮ   "  '  P�   "  >  ��k    e  ^�   "  �  |�   "  �              �  \�      �  ���   "    ��%   "  3  P��   "  _   �   "  x  :�   "  �  �   "  �  �:   "    ��:   "  K  Ē^   "  k  ~�   "  x  �   "  �  �6   "  �  Ӯ   "  �  ��   "    X�   "  &  J�   "  J  w�D   "  �  D�   "  �  g�   "  �  p�   "    f�   "  2  �   "  k  <�~   "  �             �  ��x   "    S�   "  P  `�    f   �   "    X�C   "  �  ,�#   "  �  �   "  �  d�     �   ��       ��   "  W  ��   "  �  ���   "  �  ��   "  .  U�   "  l  `�     y  0�   "  �  ��]     �  ʨ   "  �  �   "  �  Z�   "  �  ę   "  "  ��   "  `  k�   "  �  >�   "  �  ޙ   "  �  6�
   "  2  y�   "  g  *�
   "  �             �  ���  "    4�   "  [  Ĩ   "    �7   "  �  �U   "  �  ��(   "  �  ��q   "    o�   "  ^  ��e   "  �  ��T   "  �  ��   "  �  R�j   "  !  �G   "  A  d�      M  h�E   "  �  ζT   "  �  O�   "  �  ��   "  �  �   "    ��(   "  7  d�T   "  z  М"   "  �  t�   "  �             �  ֞   "  �  ��H   "  (  جz   "  ]  v�1   "  �  V�$   "  �  ��;   "  �  ̑   "                &   �"   "  L   �   "  t   h�p   "  �              �   ֞   "  �   ��   "  �   0�   "  �   ��   "  A!  	��    p!  X�   "  }!  "�   "  �!  o�    "  X  ��      "             "  :�   "  Q"  
�   "  �"  �c   "  �"  ��   "  �"  �H   "  #             ##             I#  ��a   "  f#  �   "  �#  t�G   "  �#  ��   "  �#  ֟   "  $  ��       W$             u$  �c   "  �$  �   "  �$  "�   "  �$  ��   "  	%  K�   "  _%  d�      f%  ;�   "  o%  @��   "  �%   �       &  �   "  C&  �   "  `&             x&  ��D   "  �&  ��   "  �&  "��   "  '  p�   "  A'  ��F   "  �'  �    "  �'  ~�e   "    +��     �  ��      (  
�4   "  [(  j�   "  �(  ��D   "  �(  �   "  %)  3�z   "  P)  �   "  �)  ��e   "  �)  H�5   "  �)  $�'   "  *  ��%   "  @*  Ĩ   "   crtstuff.c __JCR_LIST__ deregister_tm_clones __do_global_dtors_aux completed.7209 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry roy_warshall.cpp _ZStL8__ioinit _Z41__static_initialization_and_destruction_0ii _GLOBAL__sub_I_main __FRAME_END__ __JCR_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ __init_array_end __init_array_start _DYNAMIC _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEEC2Ev _ZSt3cin@@GLIBCXX_3.4 _ZNSt13_Bvector_baseISaIbEEC1Ev _ZNSt6vectorIbSaIbEEaSERKS1_ _ZNSaISt6vectorIbSaIbEEED1Ev _ZSt20__throw_length_errorPKc@@GLIBCXX_3.4 _ZSt12__miter_baseISt19_Bit_const_iteratorENSt11_Miter_baseIT_E13iterator_typeES2_ _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEE8allocateEjPKv _ZSt4fillSt13_Bit_iteratorS_RKb _ZNSaIbED1Ev _ZSt13__copy_move_aILb0EPmS0_ET1_T0_S2_S1_ _ZNSt13_Bvector_baseISaIbEED1Ev _ZN9__gnu_cxx13new_allocatorIbED1Ev _ZSt10_ConstructISt6vectorIbSaIbEES2_EvPT_RKT0_ _ZNKSt18_Bit_iterator_baseneERKS_ _ZSt4fillIPSt6vectorIbSaIbEES2_EvT_S4_RKT0_ __cxa_atexit@@GLIBC_2.1.3 _ZNSt6vectorIS_IbSaIbEESaIS1_EE5beginEv __libc_csu_fini _ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPSt6vectorIbSaIbEES5_EET0_T_S7_S6_ _ZNKSt18_Bit_iterator_baseeqERKS_ _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE19_M_get_Tp_allocatorEv _ZNSt18_Bit_iterator_baseC1EPmj _ZNSt11__copy_moveILb0ELb0ESt26random_access_iterator_tagE8__copy_mISt19_Bit_const_iteratorSt13_Bit_iteratorEET0_T_S6_S5_ _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEE10deallocateEPS3_j _Z5printRSt6vectorIS_IbSaIbEESaIS1_EEi _ZNSaIbEC2ImEERKSaIT_E _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE12_Vector_implC2Ev _ZSt23__copy_move_backward_a2ILb0ESt13_Bit_iteratorS0_ET1_T0_S2_S1_ _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE12_Vector_implD1Ev _ZN9__gnu_cxx14__alloc_traitsISaImEE8allocateERS1_j _ZNSaImEC2ERKS_ _ZN9__gnu_cxxmiIPSt6vectorIbSaIbEES1_IS3_SaIS3_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKSA_SD_ _ZN9__gnu_cxx14__alloc_traitsISaImEE8max_sizeERKS1_ __gmon_start__ _Jv_RegisterClasses _ZNSt14_Bit_referenceC1EPmm _fp_hw _ZSt14__copy_move_a2ILb0ESt13_Bit_iteratorS0_ET1_T0_S2_S1_ _ZdlPv@@GLIBCXX_3.4 _ZNSt10_Iter_baseIPmLb0EE7_S_baseES0_ _ZSt8__fill_aIPmiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_ _ZStmiRKSt18_Bit_iterator_baseS1_ _ZSt4copyISt19_Bit_const_iteratorSt13_Bit_iteratorET0_T_S3_S2_ _ZNSt13_Bvector_baseISaIbEE13_Bvector_implC2ERKSaImE _ZNSt14_Bit_referenceC2EPmm _ZNKSt13_Bit_iteratorplEi _ZNSt10_Iter_baseISt19_Bit_const_iteratorLb0EE7_S_baseES0_ __cxa_rethrow@@CXXABI_1.3 _ZNSt8ios_base4InitC1Ev@@GLIBCXX_3.4 _ZSt14__copy_move_a2ILb0ESt19_Bit_const_iteratorSt13_Bit_iteratorET1_T0_S3_S2_ _ZNKSt13_Bit_iteratordeEv _ZN9__gnu_cxx13new_allocatorImEC2ERKS1_ _ZSt8__fill_aIPSt6vectorIbSaIbEES2_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT0_E7__valueEvE6__typeET_SB_RKS7_ _ZNSt6vectorIbSaIbEE6insertESt13_Bit_iteratorjRKb _ZNSt6vectorIbSaIbEE14_M_fill_insertESt13_Bit_iteratorjb _ZNSt6vectorIS_IbSaIbEESaIS1_EE15_M_erase_at_endEPS1_ _ZNKSt6vectorIbSaIbEE5beginEv _ZNSaImEC1IbEERKSaIT_E _ZNSt13_Bvector_baseISaIbEE13_Bvector_implC2Ev _ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIbSaIbEEEEvT_S6_ _ZNSt13_Bvector_baseISaIbEE13_Bvector_implD1Ev _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEEC1Ev _ZNSt13_Bit_iteratormmEv _ZNSt18_Bit_iterator_baseC2EPmj _ZNSt13_Bit_iteratorC1Ev __libc_start_main@@GLIBC_2.0 _ZNKSt6vectorIbSaIbEE12_M_check_lenEjPKc _ZNSt13_Bit_iteratorC2Ev _ZN9__gnu_cxx17__normal_iteratorIPSt6vectorIbSaIbEES1_IS3_SaIS3_EEEC2ERKS4_ _ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mImEEPT_PKS3_S6_S4_ _ZSt18uninitialized_copyIPSt6vectorIbSaIbEES3_ET0_T_S5_S4_ _ZNSt13_Bit_iteratorC1EPmj _ZNK9__gnu_cxx17__normal_iteratorIPSt6vectorIbSaIbEES1_IS3_SaIS3_EEE4baseEv _ZNSt6vectorIbSaIbEEC1Ev _ZNSt6vectorIbSaIbEED2Ev _ZSt8_DestroyIPSt6vectorIbSaIbEEEvT_S4_ _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EED2Ev _ZNSt13_Bvector_baseISaIbEE13_Bvector_implC1Ev _ZNKSt6vectorIS_IbSaIbEESaIS1_EE4sizeEv _ZNSt8ios_base4InitD1Ev@@GLIBCXX_3.4 _ITM_deregisterTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@@GLIBCXX_3.4 _ZN9__gnu_cxx13new_allocatorIbEC2Ev _IO_stdin_used _ZnwjPv _ZNKSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE19_M_get_Tp_allocatorEv _ZSt12__niter_baseIPSt6vectorIbSaIbEEENSt11_Niter_baseIT_E13iterator_typeES5_ _ZSt11__addressofISt6vectorIbSaIbEEEPT_RS3_ _ZNSaImEC2IbEERKSaIT_E _Z4loadRSt6vectorIS_IbSaIbEESaIS1_EEii _ZNKSt13_Bvector_baseISaIbEE20_M_get_Bit_allocatorEv _ZNSt13_Bit_iteratorC2EPmj _ITM_registerTMCloneTable __data_start _ZNSt6vectorIbSaIbEE13_M_initializeEj _ZNSt19_Bit_const_iteratorC2ERKSt13_Bit_iterator _ZNSt6vectorIS_IbSaIbEESaIS1_EE6resizeEjS1_ _ZNSt6vectorIbSaIbEEC2Ev _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EEC1Ev _ZSt24__uninitialized_fill_n_aIPSt6vectorIbSaIbEEjS2_S2_ET_S4_T0_RKT1_RSaIT2_E _ZSt4copyIPmS0_ET0_T_S2_S1_ _ZSt13copy_backwardIPSt6vectorIbSaIbEES3_ET0_T_S5_S4_ _ZNKSt19_Bit_const_iteratordeEv _ZNSaIbED2Ev _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEED2Ev _ZNSt18_Bit_iterator_base10_M_bump_upEv _ZSt8_DestroyISt6vectorIbSaIbEEEvPT_ _ZNSt13_Bvector_baseISaIbEEC2Ev _ZNSaImEC2Ev _ZN9__gnu_cxx13new_allocatorIbED2Ev _ZSt12__niter_baseISt19_Bit_const_iteratorENSt11_Niter_baseIT_E13iterator_typeES2_ _ZN9__gnu_cxx13new_allocatorIbEC1Ev _ZNSt10_Iter_baseIPSt6vectorIbSaIbEELb0EE7_S_baseES3_ _ZN9__gnu_cxx13new_allocatorImED2Ev _ZNSaIbEC1ImEERKSaIT_E _ZNSt8iteratorISt26random_access_iterator_tagbiPbRbEC2Ev _ZSt14__fill_bvectorSt13_Bit_iteratorS_b _ZNSolsEb@@GLIBCXX_3.4 _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPSt6vectorIbSaIbEEjS4_EET_S6_T0_RKT1_ _ZSt22__uninitialized_copy_aIPSt6vectorIbSaIbEES3_S2_ET0_T_S5_S4_RSaIT1_E __x86.get_pc_thunk.bx _ZNSt13_Bit_iteratorpLEi _ZNKSt6vectorIbSaIbEE8max_sizeEv _ZNKSt6vectorIS_IbSaIbEESaIS1_EE8max_sizeEv _ZSt11__addressofImEPT_RS0_ __TMC_END__ _ZSt4cout@@GLIBCXX_3.4 _ZN9__gnu_cxx17__normal_iteratorIPSt6vectorIbSaIbEES1_IS3_SaIS3_EEEC1ERKS4_ _ZNSt6vectorIbSaIbEE15_M_erase_at_endESt13_Bit_iterator _ZNSt11__copy_moveILb0ELb0ESt26random_access_iterator_tagE8__copy_mISt13_Bit_iteratorS3_EET0_T_S5_S4_ _ZN9__gnu_cxx14__alloc_traitsISaImEE10deallocateERS1_Pmj _ZN9__gnu_cxx14__alloc_traitsISaImEE17_S_select_on_copyERKS1_ __dso_handle _ZNSt6vectorIbSaIbEEC1ERKS1_ __libc_csu_init _ZNSaImEC1ERKS_ _ZNSaISt6vectorIbSaIbEEEC2Ev _ZNKSt14_Bit_referencecvbEv _ZSt8_DestroyIPSt6vectorIbSaIbEES2_EvT_S4_RSaIT0_E _ZSt12__miter_baseIPmENSt11_Miter_baseIT_E13iterator_typeES2_ _ZSt22__uninitialized_move_aIPSt6vectorIbSaIbEES3_SaIS2_EET0_T_S6_S5_RT1_ _ZNSaISt6vectorIbSaIbEEED2Ev _ZNSt13_Bvector_baseISaIbEE13_Bvector_implD2Ev _ZNK9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEE8max_sizeEv _ZNSt10_Iter_baseISt13_Bit_iteratorLb0EE7_S_baseES0_ _ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv _Znwj@@GLIBCXX_3.4 _ZNSt6vectorIS_IbSaIbEESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEjRKS1_ _ZNSt6vectorIS_IbSaIbEESaIS1_EE6insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEjRKS1_ _ZN9__gnu_cxx13new_allocatorImEC2Ev _ZN9__gnu_cxx13new_allocatorImE8allocateEjPKv _ZNSt13_Bvector_baseISaIbEE13_M_deallocateEv _ZNSt14_Bit_referenceaSERKS_ _ZNSt6vectorIbSaIbEEixEj _ZSt12__miter_baseIPSt6vectorIbSaIbEEENSt11_Miter_baseIT_E13iterator_typeES5_ _ZNSt13_Bvector_baseISaIbEEC2ERKS0_ _ZSt13__copy_move_aILb0ESt19_Bit_const_iteratorSt13_Bit_iteratorET1_T0_S3_S2_ _ZNSt6vectorIbSaIbEE6resizeEjb _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EED1Ev _ZNSt13_Bvector_baseISaIbEED2Ev __bss_start _ZNSt13_Bvector_baseISaIbEE13_Bvector_implC1ERKSaImE _ZSt13__copy_move_aILb0ESt13_Bit_iteratorS0_ET1_T0_S2_S1_ _ZSt3maxIjERKT_S2_S2_ _ZNSt19_Bit_const_iteratorC2EPmj _ZNSt6vectorIbSaIbEED1Ev _ZNSt13_Bvector_baseISaIbEE11_M_allocateEj _ZSt22__copy_move_backward_aILb0ESt13_Bit_iteratorS0_ET1_T0_S2_S1_ _ZNKSt6vectorIbSaIbEE3endEv _ZNSt6vectorIS_IbSaIbEESaIS1_EEixEj __stack_chk_fail@@GLIBC_2.4 _ZNSaImED1Ev _ZSt23__copy_move_backward_a2ILb0EPSt6vectorIbSaIbEES3_ET1_T0_S5_S4_ _ZSt13copy_backwardISt13_Bit_iteratorS0_ET0_T_S2_S1_ _ZNKSt13_Bvector_baseISaIbEE13_Bvector_impl11_M_end_addrEv _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE13_M_deallocateEPS2_j _ZSt4fillIPmiEvT_S1_RKT0_ _ZNSt13_Bit_iteratorppEv _ZNSirsERi@@GLIBCXX_3.4 _ZNSt6vectorIS_IbSaIbEESaIS1_EE3endEv _ZN9__gnu_cxx13new_allocatorImEC1ERKS1_ _ZNKSt6vectorIbSaIbEE8capacityEv memmove@@GLIBC_2.0 _ZNSaImED2Ev _ZNSt6vectorIbSaIbEE5beginEv _ZNSt6vectorIbSaIbEEC2ERKS1_ _ZNSt6vectorIbSaIbEE15_M_copy_alignedESt19_Bit_const_iteratorS2_St13_Bit_iterator _Z12roy_warshallRSt6vectorIS_IbSaIbEESaIS1_EEi _ZNSaImEC1Ev _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE12_Vector_implD2Ev _ZSt22__copy_move_backward_aILb0EPSt6vectorIbSaIbEES3_ET1_T0_S5_S4_ _ZNSolsEPFRSoS_E@@GLIBCXX_3.4 _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EEC2Ev _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIbSaIbEEEE10deallocateERS4_PS3_j _ZNSt6vectorIS_IbSaIbEESaIS1_EED1Ev _ZNSt6vectorIbSaIbEE3endEv _ZSt14__copy_move_a2ILb0EPmS0_ET1_T0_S2_S1_ __cxa_end_catch@@CXXABI_1.3 _ZSt17__throw_bad_allocv@@GLIBCXX_3.4 _ZNKSt6vectorIbSaIbEE4sizeEv _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIbSaIbEEEE8max_sizeERKS4_ _ZNSt14_Bit_referenceaSEb _ZNSt6vectorIS_IbSaIbEESaIS1_EEC1Ev _ZNSt13_Bvector_baseISaIbEE8_S_nwordEj _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@@GLIBCXX_3.4 __cxa_begin_catch@@CXXABI_1.3 _ZNSt6vectorIS_IbSaIbEESaIS1_EED2Ev _ZN9__gnu_cxx13new_allocatorImE10deallocateEPmj _ZNSt19_Bit_const_iteratorppEv _ZNSt19_Bit_const_iteratorC1EPmj _ZSt34__uninitialized_move_if_noexcept_aIPSt6vectorIbSaIbEES3_SaIS2_EET0_T_S6_S5_RT1_ _edata _ZdlPvS_ _ZNSt20__copy_move_backwardILb0ELb0ESt26random_access_iterator_tagE13__copy_move_bISt13_Bit_iteratorS3_EET0_T_S5_S4_ __gxx_personality_v0@@CXXABI_1.3 _ZSt12__niter_baseIPmENSt11_Niter_baseIT_E13iterator_typeES2_ _ZNSaISt6vectorIbSaIbEEEC1Ev _Unwind_Resume@@GCC_3.0 _ZSt12__niter_baseISt13_Bit_iteratorENSt11_Niter_baseIT_E13iterator_typeES2_ _ZNSt6vectorIS_IbSaIbEESaIS1_EEC2Ev _ZNKSt6vectorIS_IbSaIbEESaIS1_EE12_M_check_lenEjPKc _ZN9__gnu_cxx13new_allocatorImED1Ev _ZNSt20__copy_move_backwardILb0ELb0ESt26random_access_iterator_tagE13__copy_move_bIPSt6vectorIbSaIbEES6_EET0_T_S8_S7_ _ZSt20uninitialized_fill_nIPSt6vectorIbSaIbEEjS2_ET_S4_T0_RKT1_ _ZNSt18_Bit_iterator_base7_M_incrEi _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE12_Vector_implC1Ev _ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIbSaIbEEEE8allocateERS4_j _ZSt12__miter_baseISt13_Bit_iteratorENSt11_Miter_baseIT_E13iterator_typeES2_ _ZNSt8iteratorISt26random_access_iterator_tagbiPbRbEC1Ev _ZSt4copyISt13_Bit_iteratorS0_ET0_T_S2_S1_ _ZN9__gnu_cxx13new_allocatorISt6vectorIbSaIbEEED1Ev _ZNSt13_Bvector_baseISaIbEEC1ERKS0_ _ZNSt18_Bit_iterator_base12_M_bump_downEv _ZNSt12_Vector_baseISt6vectorIbSaIbEESaIS2_EE11_M_allocateEj _ZNSt19_Bit_const_iteratorC1ERKSt13_Bit_iterator _ZN9__gnu_cxx13new_allocatorImEC1Ev  .symtab .strtab .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .gcc_except_table .init_array .fini_array .jcr .dynamic .got.plt .data .bss .comment                                                  T�T                    #         h�h                     1         ���  $                  D   ���o   ���  <                N         ��  �              V         ���  {                 ^   ���o   $�$  8                k   ���o   \�\  �                z   	      ��                  �   	   B   �  �               �         ���  #                  �         Ї�  P                �          � 	                    �         0�0	  �0                 �         �:                    �         (�(:  >                  �         h�h:  T                 �         ���?  |                 �         8�8V  �                  �         ���^                    �         ���^                    �          � _                    �         �_  �                �         ���_                   �          � `  \                         \�\`                            ��d`  0                       0       d`  5                               `�                                 �`  `     3         	              �r  d*                 3320410001000235241maraton/mylib/graph/reach_brute_force.cpp
#include<iostream> 
#include<vector>

using namespace std; 

// Practice implementation for graph algorithm. This is only to set a baseline on what will be specified
// on future graph algorithm implementations

void load_graph(vector< vector<bool> > &in_m, int size, int n_edges); 
void reach(vector< vector<bool> > & in_m, int size); 
void print_graph(vector< vector<bool> > &in_m, int size); 

int main() 
{ 
	vector< vector<bool> > cc; 
	int n,e; 
	cin>>n; 
	cin>>e; 

	load_graph(cc, n, e);	

	reach(cc, n); 

	print_graph(cc, n); 


	return 0; 
}


void reach(vector< vector<bool> > &in_m, int size)
{
	vector< vector<bool> > aux_m; 

	//This is created to add the l-th reach relation to the input adjacency matrix.
	aux_m.resize(size);
	for(int p=0; p<size; p++) { 
		aux_m[p].resize(p); 
	}

	/* Main algorithm:
	 *	Input: 	Adjacency matrix
	 *	Output: Reach matrix 
	 *
	 *	It searches through every file for an edge (k,j) (with 0<=i,j<n) and then, search for edges (j,i) at j file,
	 *	if found, in_m[j][i] is considered reachable and include to the l-th relation of reach.
	 *
	 *	-Order: O(n^4)
	 *	-Propositions involved: 
	 *		Recursive definition of a relation. 
	 *		" Let G=(V,E) be a (di)graph and n=|V|. For all m in N, if {v,w} is in E^m, then {v,w} is in E^(n-1) "
	 *	-Termination: It is formed by nested loops bounded by finite numbers, it will end.  
	 *	-Correcteness: --> unfinished 
	 */

	for(int l=1; l<size-1; l++) {
		for(int k=0; k<size; k++) {
			for(int j=0; j<size; j++) {

				if (in_m[k][j] == 1)
				{
					for(int i=0; i<size; i++) {
	
						if (in_m[j][i] == 1)
							aux_m[k][i] = 1; 
					}
				}
			}
		}
	
		for(int c=0; c<size; c++){ 
			for(int r=0; r<size; r++) { 
				in_m[c][r] = in_m[c][r] | aux_m[c][r]; 
			}
		}
			
	}	
	
}


void load_graph(vector< vector<bool> > &in_m, int size, int n_edges)
{
	
	//Enabling enough capacity for the 2D vector to work
	in_m.resize(size); 
	
	for(int i=0; i<size; i++) { 
		in_m[i].resize(size); 
		in_m[i][i] = true; 	//adding Identity
	}

	int a,b; 
	for(int j=0; j<n_edges; j++) { 
		cin>>a>>b; 
		in_m[a][b] = true;
	}	
}


void print_graph(vector< vector<bool> > &in_m, int size)
{
	for(int k=0; k<size; k++) { 
		for(int l=0; l<size; l++) { 
			cout<<in_m[k][l]<<" "; 	
		}	
		cout<<endl; 
	}	

}

/* Input type: 
 	n
	e
	v_1 w_1
	v_2 w_2
	.
	.
	v_e w_e
*/
332041000100042620maraton/hangover.cpp#include<iostream> 

using namespace std; 

int harmonic(float x){ 
	float c = 0.00; 
	int j = 2; 
		
	while (c <= x) { 
		c += 1.00/(float)j ; 
		j ++; 
	}
	
	return j - 2; 
}	
	

int main() 
{
	float arr[1000] ;
	float current = -1.00;
	int n = 0;

	while( current != 0.00 )
	{
		cin>>arr[n]; 
		current = arr[n];
		n++;
	}
	
	n--;
	
	for (int i=0; i<n; i++) { 
		cout<<harmonic(arr[i])<<" card(s)"<<endl; 
	}

	return 0;
}
3320410001000104518maraton/prime1.cpp
#include<iostream> 
#include<string> 
#include<math.h>
#include<bitset>
#include<vector>
#include<iterator>
	
using namespace std; 

vector<unsigned int> sieveModif(long n, long l_bound); 

int main() 
{
	int t;
	cin>>t; 
	vector<unsigned int> resp[t]; 	

	long a, b;
	for (int i=0; i<t; i++) {
		cin>>a; 
		cin>>b; 
		resp[i]  = sieveModif(b, a);
	}
		 

	for (int j=0; j<t; j++) {
		
		for (vector<unsigned int>::iterator it = resp[j].begin(); it!=resp[j].end(); it++) 
		{
			cout<<*it<<endl; 
		}	
	
		if (j != t-1) 
		{
			cout<<endl; 	
		}
	}

	return 0; 
}

vector<unsigned int> sieveModif(long n, long l_bound){ 
	
	bitset<1000000001> bithelp; 
	vector<unsigned int> primes; 
	primes.resize(n-l_bound+1); 

	bithelp[0] = bithelp[1] = 1; 

	int j = 2;
	while (	j <= sqrt(n) ) { 

		int k = 2; 
		if (bithelp[j] != 1)
		{
			while ( j*k <= n ) { 
				bithelp[j*k] = 1; 
				k++; 
			}
		}		
		j++;
	}

	for (unsigned int l=l_bound; l<n+1; l++) { 
		
		if (bithelp[l] != 1) 
			{
				primes.push_back(l); 				
			}
	}
	
	return primes; 
}
332041000100044218maraton/nsteps.cpp
#include<iostream> 
#include<stdio.h>
#include<string> 
	
using namespace std; 

int main() 
{
	
	int n;
	cin>>n; 
	int x,y,aux;
	int resp[n];

	for (int c=0; c<n; c++) { 
		
		cin>>x>>y; 
		if ( x==y || x==2+y)
		{
			resp[c] = ( x%2==0 )? x + y: x + y - 1;
		}
		else { 
			resp[c] = -1;
		}
	}

	for (int i=0; i<n; i++) { 

		if (resp[i]==-1) 
		{
			cout<<"No Number"<<endl; 
		}
		else { 
			cout<<resp[i]<<endl; 
		}
	}

	return 0; 
}
3320410001000325620maraton/problem_list/-- startup --/ 

http://www.spoj.com/problems/NSTEPS/ 		done(cpp)	

http://www.spoj.com/problems/OFFSIDE/ 		done(cpp)

http://www.spoj.com/problems/ACPC10A/ 		done(cpp)

http://www.spoj.com/problems/EGYPIZZA/ 		done(cpp)

http://www.spoj.com/problems/ADDREV/ 		done(cpp)

http://www.spoj.com/problems/CANDY/		done(cpp) 

http://www.spoj.com/problems/HANGOVER/ 		done(cpp)

http://www.spoj.com/problems/PERMUT2/		done(cpp)

http://www.spoj.com/problems/EIGHTS/ 		thinking it

http://www.spoj.com/problems/JAVAC/ 		done(cpp)

http://www.spoj.com/problems/STPAR/		done(cpp)

http://www.spoj.com/problems/CANTON/ 		done(cpp)


/-- DP --/ 

http://spoj.com/problems/FARIDA/		done(cpp)

http://www.spoj.com/problems/PIGBANK/

http://www.spoj.com/problems/TRT/
*** Puntos extra: hacer TRT con menos de 6MB de memoria 

http://www.spoj.com/problems/BYTESM2/

http://www.spoj.com/problems/SCUBADIV/

http://www.spoj.com/problems/SOLDIER/

http://www.spoj.com/problems/EDIST/
https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=467 (EDIT DISTANCE + reconstruir la solucion)

http://www.spoj.com/problems/ANARC05H/

http://www.spoj.com/problems/BABTWR/

http://www.spoj.com/problems/MIXTURES/


/-- GRAPHS --/ 

http://www.spoj.com/problems/CAM5/               

http://www.spoj.com/problems/SHPATH/

http://www.spoj.com/problems/PT07Y/             

http://www.spoj.com/problems/ALLIZWEL/       

http://www.spoj.com/problems/BITMAP/        

http://www.spoj.com/problems/CSTREET/

http://www.spoj.com/problems/CANDN/

https://icpcarchive.ecs.baylor.edu/index.php?option=onlinejudge&page=show_problem&problem=4897

http://www.spoj.com/problems/INCARDS/

http://www.spoj.com/problems/SAMER08A/

http://www.spoj.com/problems/DCEPC706/

http://www.spoj.com/problems/BUGLIFE/

http://www.spoj.com/problems/ARBITRAG/

http://www.spoj.com/problems/TFRIENDS/

http://www.spoj.com/problems/CAPCITY/

http://www.spoj.com/problems/WEBISL/


/-- Other lists --/


http://www.spoj.com/problems/KGSS/ 			TLE (for search and queu imp, probably have to deduce segment tree)
http://www.spoj.com/problems/GSS1/
http://www.spoj.com/problems/GSS3/


http://www.spoj.com/problems/AGGRCOW/
http://codeforces.com/problemset/problem/479/C
http://codeforces.com/problemset/problem/510/C
http://codeforces.com/problemset/problem/274/A
https://icpcarchive.ecs.baylor.edu/index.php?option=onlinejudge&page=show_problem&problem=2978
http://acm.tju.edu.cn/toj/showp1633.html
https://icpcarchive.ecs.baylor.edu/index.php?option=onlinejudge&page=show_problem&problem=4849
http://www.spoj.com/problems/HELPBOB/

/-- personal --/ 

https://www.spoj.com/problems/PRIME1/ 			TLE (segmentation fault) 
http://codeforces.com/problemset/problem/1186/C		vus the cossack and strings - TLE (needs sme fucking savant refinement)
http://codeforces.com/problemset/problem/1189/B		Number Circle
http://codeforces.com/problemset/problem/1189/A		Keanu Reeves 	- done(cpp)
http://codeforces.com/problemset/problem/1023/B		pair of toys 	- done(cpp)
http://codeforces.com/contest/1066/problem/C		books queries	- done(cpp)
https://www.spoj.com/problems/KNAPSACK/			WA - needs better dp approach (both greedy, and pushing maximum failed)
https://www.spoj.com/problems/LCS/
3320410001000115218maraton/wonowon.pyimport sys
import math 
import time

def erathostenes(n:int) -> [int]:
    selection = [ int(x) for x in range(0,n+1) ]

    for i in range(2,math.floor(math.sqrt(n))):
        if selection[i] != -1 :
            for j in range(2*i, n+1, i):
                selection[j] = -1

    selection[0],selection[1] = -1, -1
    primes = [ selection[x] for x in range(n+1) if selection[x] != -1 ]

    return primes

def serie(n:int): 
    k = n//2 
    return sum(10**(2*i) for i in range(k+1))

beg = time.clock()

n = int(sys.argv[1])
primes = erathostenes(n)
barray = [0 for x in range(len(primes))] 

for i in range(3, len(primes)): 
    b = True
    reference = primes[i]-2
    wnw = serie(reference)

    if wnw%primes[i] == 0:  
        reference -= 2
        wnw = serie(reference)

        while wnw > primes[i]: 

            if wnw%primes[i] == 0: 
                b = False
                break

            reference -= 2
            wnw = serie(reference)
    else: 
        b = False

    if b == True: 
        barray[i] = 1

count = sum(barray[i] for i in range(len(barray)))

end = time.clock()

print(count)
total = end-beg
print(total)



33204100010002060011maraton/c++-------------------------------theory
-all ines beggining with # are called 'directive; include directives are processed by the preprocessor:(a program invoked by the compiler).
-headerfiles:
<iostream> - objects: cout,cin,cerr <-- all of these belong to the ostream class
<iomanip> -  
<fstream> - 
-source code -preprocessors-> expanded source code -compiler-> object code -linker-> executable file 
preprocessor directives tell the compiler to preprocess the program before complining.
MACROS(#|template|expansion|arguments): piece of code that is given some name and whenever the compiler encounters that name it replaces it by the piece of code. 
FILE INCLUSION(#|<>|""):allows to include pre-defined functions into our files or our very own allowing modularity.
-------------------------------functions
-To define a function:
returntype funcname(formal parameters and type) { staments..; return }

function declaration: to say the type of parameters --> function definition: what the function does with the parameters.

sizeof(args) <-- returns the length of the given arg. 

-------------------------------objects
endl <-- returns newline.

-------------------------------blahblah
#include<iostream> <--incluve directive asks the computer to include a file
int main() { content } <-- function declaration, returns int 
std::cout<<somestatement <-- It prints the statement to stdout (i'm guessing)
cout<<statement | cin>>variable <-- insertion operators

	Whenever using a variable it has to be declared alongside with its type.
-------------------------------loop's boilerplate code
*for:
for(inizialization expr; test expr; update expr) { statements }

*while:
inizialization expr
while(test expr) {
	statements;
	update expr;
}

*do while: 
do {
	statements;
	update expr;
} while (test expr);

if-else if-else:

if (condition) {
	staments..;
else if (condition) {
	staments..;
else 
	staments..;
}

-------------------------------array
-declaration by size: type name[size];
-declaration by extension: type name[]={elements..};
#the last two can be combined



---------------- Booknotes: Programacion en C++ ---------------- 

*--Entry 25/06/2019:

The order of included files does matter, since they must go at the beggining of the program (thus the name "header files")

Use " " rounding filenames to include them if they don't belong to the "include" directory (absolute pathname may be necessary). This may turn usefull when handling several files. 

/-- Everything before main is regarded as global --/

Apparently, functions are declared by convention in the "global area" and then it is possible to define them after the main. 

Similarly to Java, C++ posseses library functions, accessed through header files such as iostream(.h)

interesting :p When going from source code to executable files, in the last step (linking), the object code of library functions included in the source code is 'linked' with the object code from our source code. 

/-- Remeber: Source --> Compiled | header files --> Assembled --> Object --> Linked | library funct.--> Executable --/ 

interesing :p The type 'char' is really a 1-1 mapping to ASCII code (oddly with (-128, 127) range) , hence, we are actually representing integer. Adittionally, the string type is (worth the simplification) an array of characters.

*-- Entry 26/06/2019: 

/--	Since 'char' characters are simply a mapping to integers, one can combine integers with char. 
	Here, octal numbers are preceded by a leading 0 (and their 3 digits, of course). 
	U, and L at the end of an asignation represents "unsigned" and "long" respectively.	--/ 

Character constant are enclosed in ' ' single quotes and string constant are enclosed in " " double quotes <-- does this matter?: yes, it fucking does.

It is also possible to define constant using "#define " directive.

/-- there's an especial data type called enum which seems usefull for making list of thing to iterate through --/ 

One can use the extraction operator repeatedly over a single input stream to assign values to variables. 
	e.g.: cin>>a>>b; //'a' and 'b' are now defined. 


Interesting :p this "operators" n++, n--, add and substract 1 respesctively from n. 

It is possible to compare characters using comparison operators, since the compiler uses their ASCII code.

These are &, ||, ^, ~, <<, >> bitwise operators and they only apply to char, int and long :D. They include abreviated versions of themselves such as: a &= b to assign to a the result of a & b <-- dull. 

/-- There is a third conditional and comma operator simply sequenciates in the same line... since coma does the same as ';' is kinda irrellevant buuut it is the operator with higher precendence so we must not forget :D --/ 

The :: (scope) operator is used to tell to which object we refer in the case of a namespace conflict.

sizeof() operator is important :p it is also a compilation time operator since every ocurrence of it in a program is replaced at compilation time by an unsigned integer.

Finally, there's a cast operator (), which allows to make explicit type change on variables. e.g.: int i = 0; (float)i; 

---------------- (Booknotes: Programacion en C++) ---------------- 


Since this all seemed boring cause it was intended for begginers, I skipped it and left it as a reference manual. Now, the following notes are from tutorial from G4G and cplusplus.com and they may come as presented in the page, or as needed by some competitive programing problem. See ya.


This is supossed to be a cool introduction to C++ STL (standard templates library), but I'm still learning what a template (and a template class is) so I'll keep us updated.

To be "plain" as possible, **templates** are used to create functions or classes whose operations are generic for several data-types. e.g: we could find maximum for two given integers or doubles.

Some special keyword when using templates are 'typename' or 'class' to declare the generic datatype we'll be working with. One can also include a different type from those when creating a template. e.g: template<typename/class T,int/char/.. i> 

Another interesting thing about templates is how they record values of "static" variables accross calls from different type. This is, for each type a template function/class is called/instantiated, a different copy of static variables is made and maintained. But in the end this is a consequence of "static" variable, which I don't handle yet... pffff this is hard, yet entertaining.

Interesting structures: So, as I normally would call the following "structures" since they're abstractions of real life objects to easily identify their behavior, they're known in C++ as **container** and if I find the reason of that, I'll let you know... well, they're also called container-classes.

/-- Stack --/ #include <stack>

Capacity:
	empty()->bool ~ O(1) 		size()->int ~ O(1)		

Element access: 
	top()->typename ~ O(1)		

Modifiers: 
	push(typename)->void ~ O(1)	pop()->void ~ O(1)


/-- Queue --/ #include<queue>
	
Capacity:
	empty()->bool 		size()->int		

Element access:
	front()->typename		back()->typename 

Modifiers: 
	push(typename)->void		pop()->void		


/-- Set --/ #include<set> : as a regular set, all elements are different, and this is an implementation of an ordered set.  
It is oddly declared like this: set < typename, greater/less <typename> >
	In my torough search for knowlege, I discovered that greater/less identifier represent the type of order stablished in the set, hence, if one wants a set ordered increasingly, one much choose less so the smallest elements is placed first.

Iterators: 
	begin()->iterator		end()->iterator			rbegin()->reverse_iterator		
	rend()->reverse_iterator	upper_bound(typename)->itr	lower_bound(typename)->iterator	find(typename)->itr

Capacity:
	size()->int			max_size()->int			empty()->bool				

Element access:
	count(typename)->bool			

Modifiers:
	insert(typename)->void		erase->void			


-/comments 
	-yes, there's a thing called reverse iterator, it is probably a type and I asume it acts as a "prev" pointer over memory locations. 
	-max_size() returns maximum available size for the structure
	-the difference between find() and count() is that the second tells wether an element is in the set or not, and the first returns either an iterator to the found element or (if the search fails) an iterator to end.
	-end() returns an iterator to the next-to-last element, just as rend() returns an iterator to the previous-to-first element.
	-upper_bound() is sort of a floor for the paramenter given, returning the closest element less or equal than argument, lower_bound() does the analogous work


/-- Vector --/ #include<vector> 

Iterators: 
	begin()->itr		end()->itr		rbegin()->r_itr		rend()->r_itr

Capacity: 
	size()->int		max_size()->int		capacity()->int		resize(int)->void //# of elements
	empty()->bool		reserve(int)->void //capacity

Element access
	[int]->typename		at(int)->typename	front()->typename	back()->typename

Modifiers: 
	assign(itr, int//offset)->void		push_back(typename)->void 		pop_back(typename)->void
	erase(int[, int])->void			clear()->void


/-comments 
	-This is the most marvellous and organized clasification I've found for a STL container, I should've begun from here..
	-size() concerns number of elements whilst capacity() is an upper bound for them (which double each time is reached)
	-Supossedly, max_size() gives the maximum amount of element for any vector.. (we'll have to check it).
	-reserve() does something similar to arr[t], it allocates space to be used and serves both for initiallizacion and size expansion
	-Speaking of size expansion, what is the diference betwen resize() and reserve()?? resize pushes both the capacity and the size, this meaning even if there are no elements, the vector is fuelled with 0 until reached requested size. On the other hand, reserve() only does memory allocation
	-Of course we'll use [int] rather than at().
	-I'm delighted about this


/-- Bitset --/ #include<bitset> ... bitset<const t> //t represent the size of the bit string

So, this structure seemed usefull for bits manipulation since manages to save a lot of space to store individual bits and easily performs bitwise operations. It has a peculiarity though, wenever we're instanciating an object, the template argument must be an intenger constant (not const or n = const) which is either explicitly written betwen '<>' or created by using "#define". This constant is the size of the bit string (it pads with zeroes all the way to the left if the given bit string is smaller than this constant).

//Like with processors, bits are indexed from right to left. 

Capacity: 
	count()->int		size()->int		test()->bool 		
	
Cool operatrions:
	to_string()->string		to_ulong()->unsigned long		to_ullong()->unsigned long long	

/-comments: 
	-Cool operations may be desirable for future programming problems. 
	-The actual juice of this is accessing bits with the '[]' operator, performing bitwise operation and the space optimization.


/-- Priority Queue --/ #include <queue> ... priority_queue<typename> 

It's odd to make an statement about this cause it encompasses sort of advance OOP in C++, but the idea is that some underlying container class template that support some operations (alongside with other requirements.. we're getting chessy), serve as a base for this structure. And of course, the behaviour is that we already know of a (greater) priority queue, implemented as a "max binary heap"

Capacity:
	size()->int		empty()->bool 		

Element access: 
	top()->typename
	
Modifiers: 
	push()->void		pop()->void


/-- Pair --/: #include<utility> 

This is actually not a complex structure, it's only a container that helps holding together two objects with (possibly) different types, whose order, in the structure is fixed and accesses through keywords .first and .second. 


Element access: 
	.first->typename			.second->typename

Modifiers; 
	make_pair(typename, typename)->void

And yes, that's all what is to it. It might have some non-interesting features such as support for logical operators and various types of inicialization, but we get the point, it works as a mathematical 2-tuple (or an R^2 vector). 


/-- List --/: #include<list> 

This structure incorporates all possible functions from vector, besides, in their documentation is emphasis on how the doubly linked list implementation causes linear time insertion and deletion and better performance when searching. Additionaly, their set to be located at not necessarily contiguous memory positions, but after some tests.. every object seems to be after the other.

Iterators: 
	begin()->it		end()->int		rbegin()->r_it		rend()->r_it

Capacity: 
	empty()->bool 		size()->int		max_size()->int

Element access: 
	front()->typename	back()->typename

Modifiers: 
	push_back(typename)->void		pop_back()->void		push_front(typename)->void
	pop_front()->void			insert(iterator, typename)->void

/- comments: 
	-insert takes an iterator representing the place at the list where one wishes to insert the element. There are different ways of using this. 
	-sorting it is a pain in the ass... well not quite, but I don't yet understand it. 


**Juicy library with cool functions: 

/-- Algorithms --/  #include<algorithms> 

sort(array[+offset] ,array+[offset1] [, comparator] )->int* //implementation of mergesort
	This sorts arrays of any valid type from index array[offset] to array[offset - 1], in other words only i in the range: 
		offset <= i < offset1 are ordered (with i being an index of course)

binary_search(array ,array+size ,value )->bool 


It turns out that there's is a rational order for all of this "structures"<-actually container, check a previous update. And since I despice ordered stuff, I'll present to you:


	Sequence containters: Data structures that can be accesed in a sequential manner.
		vector	list	deque	array	forward_list

	Adaptor containers: DS that provide a different interface for sequence containers.
		queue	priority_queue	stack

	Associative containters: Implement sorted DS that can be searched in O(log(n)).
		set	multiset	mat	multimap
	
	Unordered Associative containers: Unordered DS that can be quickly searched.
		unordered_set	unordered_multiset	unordered_map	unordered_multimap

I just found out that only containers that are not adaptor have a max_size() function returning the maximum element input per structure.


Had to jump to OOP in C++ cause a problem required so.. here we go.

		data abstraction -- polymorphism -- encapsulation -- inheritance -- classes and objects

I'll only walk through the concepts I don't handle. 

<>Main concepts

>>Data abstraction: An analogy of frontend/backend landscape of web desing (isn't clear yet). 
>>Polymorphism: Perform the same task in various ways. This is, a function behaves differently depending on the parameters it is 
given.It consists of function overloading and function overrinding. 
>>Encapsulation: Binding data and functions under a single unit (imagie a pill). 
>>Inheritance: Classes deriving things to classes in several ways: multilevel, hierarchical, hybrid, multiple.. 

<>C++ OOP features

>>Types of polymorfism
	Compile time
		function overloading		function overriding
	Run time
		Virtual function

>>class structure 

class class_name
{
	access_specifier
	data_members; 
	member_functions; 
}

/-- member functions can be declared within the class, or outside of it using the scope "::" operator. --/ 

>>inline functions: C++ feature that allows function code (preferably with few instructions) to be rewritten every place the funtion
is called instead of calling it (wich might produce overhead). This of course happens when preprocessing the source code (as with 
macros). They're created using the token **inline**.

/-- every member function is by default inline --/ 

>>constructors
	default -- parametrized -- copy

default and parametrized constructors are straightforward .. 

copy: It is a member function that initialices an object using another object of the same class. It is created by default (convenion 
is using the className as the constructor name), and unless user defined, it performs shadow copying (points existing object memory 
addresses). When user defined, it  performs shadow copying (allocates memory and copies). 


>>destructor: special member funnction that is called by the compiler when the scope of an object ends. Syntax is ~class_name(){}

>>access modifiers
	public -- private -- protected
/-- default is private --/ 

private: Can only be accessed by member functions of a class. 
protected: Similar to private, but can be accessed by subclasses.

>>friend class/function: class that can access private and protected data members of another class declared friend.
In an analogous way, a friend function can be a member function or global function and has the same privileges. 

/-- Recall that the friend token serves to grant permission, thus it is the class/function declared as friend who
can no access private and protected data member/member functions from the class it is declared into --/ 


.. aaand this is it. For now.

In C++ class attributes (Java) are known as data members and methods (Java) are known as member functions.
---------------- Booknoes C++ Primer (5th Edition) ---------------- 

Ok, I've been out for some time from G4G and cplusplus.com only to gather a new baseline from a textbook I think might provide a necessary solid ground in my process of learning C++. So, I shall proceed to write down whatever I recall from my read and stop writing like a victorian idiot.


It turns out going from C to C++ was quite a big change. Both languages were conceived on AT&T bell labs and the mayor improvement that C++ included was OOP plus generic programming (which is the feature included by templates and yes, a programming paradigm). 

An important point is made on programming paradigms: procedural programming is algorithm centered, hence in this spirit the solution of a problem is attacked breaking it down on several small solutions (top - down approach), which we fondly remember as functions. On the other hand, OOP enphasizes data, hence it relies on creating advantegeous representations of the data to solve a problem; to leave it clear, they're not mutualy exclusive, since they're problem solving/programming approaches to computational (or daily) problems both can be combined and we'll benefit from it. Oh, I need to say, the process of going from a bunch (a great bunch) of classes, to an entiry whole proyect could be the ressult of applying bottom-up approach, and yes, OOP eases this.

Now on an historical note, spaguetti code comes from jump statements making programmers unable to trace the flow of a function on assembly-like languages, situation that led to the development of control structures (we remember them better as foor, while and do-while loops), which in general acquired the name of structured programming.

I'll continue adding notes as I read... Aaaand here it goes (25/07/2019)

There's an emphasis on prototyping functions on source files, right after the include (and using) directives. This seems like a good practice for short programs altough repetitive (since callee functions will be written under the main, thus we'll be writting the function firm twice in the same file). I assume this is done to avoid having the main at the bottom of the program.. yet, not good for competitive programming. 

Another cool "modular thing" is that what we know as header files (.h,.hpp), merely contain prototypes of the functions/classes they provide, the actual function/classes are held as compiled code within library files.

In c++ slang, a function is both a procedure and, well, a function. Now ,speaking of return values, main's function return value is given to the OS itself, and as a convention, whatever nonzero value it returns is regarded as an error. 

//Whenever writing a serious proyect, limit the use of std namespace// 

Names beginning with two underscores or with an underscore and an uppercase are reserved for the implementation, this is, don't fucking use them. 

**climits** is a cool header file (constant naming [U,S]TYPE_[BIT/MIN/MAX])

Variables initialized wherever but main, hold whatever there was on that memory location, while on main they're set to 0. 

#define is a preprocessors directive that allows the creation of symbolic constant, and at preprocessor time, each ocurrence of a defined contstant is searched and replaced by it's value (this is for C programs, C++ uses const) 


3320410001000110025maraton/boxes_packing.cpp#include<iostream> 
#include<vector>
#include<iterator>
#include<set>
	
using namespace std; 

int figure_out(vector<int> bundle, int n_, int m_, int k_, int i) { 

	int o_count, running, reminder; 
	o_count = running = 0;  
	reminder = m_; 

	//cout<<"---------------------------------"<<endl;
	while (true) { 

		running+=bundle[i];

		if (running > k_)
	       	{ 
			reminder--; 
			running = bundle[i]; 
		}

		(reminder != 0)? o_count++: o_count+=0; 	
		//cout<<"running: "<<running<<"\treminder: "<<reminder<<"\to_count: "<<o_count<<endl; 
		if (o_count==n_ | reminder==0)
		{
			break; 
		}

		i++; 
	}

	return o_count; 
}

int main() 
{
	vector<int> objects; 
	objects.reserve(200000); 
	set<int, greater<int> > resp; 	
	int n, m, k; 

	cin>>n>>m>>k; 

	int aux; 
	for(int c=0; c!=n; c++) {
		cin>>aux; 
		objects.push_back(aux); 
	}
	
	int c_ans; 
	int r = 0; 
	while(true) {
		c_ans = figure_out(objects, n-r, m, k, r); 
		
		resp.insert(c_ans); 	
		if (c_ans == n-r) 
		{
			break; 
		}

		r++;
	}

	set<int, greater<int> >::iterator d = resp.begin(); 
	cout<<*d<<endl; 


	return 0; 
}
33204100010007119maraton/2
#include <iostream> 
#include <vector> 
#include <list> 
#include <utility>

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d",&c,&cc)

#define MAX_NODES 30000
#define MAX_ADY 100

using namespace std; 

typedef vector< list<int> > ady_l ;
typedef pair< list<int>::iterator, list<int>::iterator > itpr; 
//ady_l perico[MAX_NODES][MAX_ADY];

int main() 
{
	int nc, tc; 
	rints(nc,tc); 	
	ady_l perico; 
	perico.resize(nc);

	perico[0].push_back(5); 

	//perico.at(0).push_back(2);
	/*
	list<int> hola, como;
	list<int>::iterator it1, it2;
	itpr tortuga;
	tortuga.first = it1; 
	tortuga.second = it2;
	*/
	return 0; 
}
332041000100022824maraton/c++_template.txt#include<iostream> 

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d, &c, &cc)
	

int main() 
{

	return 0; 
}
332041000100084518maraton/kgss-2.cpp

#include<iostream> 
#include<stdio.h> 
#include<vector>
#include<algorithm> 
	
using namespace std; 

int max_sum(vector<int> s, int a, int b) 
{
	vector<int> help ;
	help.resize(b-a+1); 

	for(int i=a-1; i!=b; i++) { 
		help.push_back( s[i] ); 
	}
	
	sort(help.begin(), help.end()) ; 	
	
	int t = help.size(); 

	return help[t-1] + help[t-2] ;
}


int main() 
{
	int n, q; 
	vector<int> a; 
	a.reserve(100000);
	vector<int> resp; 
	resp.reserve(100000);
		
	cin>>n; 

	int aux; 
	for (int c=0; c<n; c++){
		cin>>aux; 
		a.push_back(aux); 
	}

	cin>>q; 
	char qt; 
	int x, y, d; 
	int count = 0;
	for (int r=0; r<q; r++)  {

		cin>>qt>>x>>y; 	
		if (qt == 'U')
		{
			a[x - 1] = y;
		}
		else { 
			d = max_sum(a,x,y); 
			resp.push_back(d);
			count++;
		}

	}

	for (int i=0; i<count; i++) { 
		cout<<resp[i]<<endl; 
	}
			
		
	return 0; 
}
332041000100072918maraton/addrev.cpp#include<iostream> 
#include<stdio.h> 
#include<math.h>
#include<string> 
	
using namespace std; 
 
int reverse(int number);
 
int main() 
{
	int resp[10000]; 
	int n, a, b, temp; 
	cin>>n; 
	
	for (int i=0; i<n; i++) {
		cin>>a>>b; 
		temp = reverse(a) + reverse(b); 
		resp[i] = reverse(temp);
	}
			
	for(int j=0; j<n; j++) { 
		cout<<resp[j]<<endl; 
	}
	
	return 0; 
}
 
int reverse(int number){
 
	if (number<10)
	{
		return number; 
	}
 
	int aux, c, digit;
	aux = c = 0;
 
	int stop = ceil( log10(number) ); 
	stop += (number/pow(10,stop)==1)? 1: 0; 
		
	stop--;
 
	while (stop!=-1)
	{
		digit = floor(number/pow(10,stop));
		aux += digit*pow(10,c);
		number -= digit*pow(10,stop); 	
		stop--;
		c++;
	}
	
	return aux; 
}
332041000100016418maraton/battle.cpp#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int main() 
{
	int xs,ys,xf,yf; 

	cin>>xs>>ys; 
	cin>>xf>>yf; 

	
	return 0; 

}
3327710001000806813maraton/a.outELF              @�4   �      4   	 (      4   4�4�               T  T�T�                    � �0
  0
           �  ����8  p             ���   �            h  h�h�D   D         P�td�  ��<   <         Q�td                          R�td�  ����          /lib/ld-linux.so.2           GNU                        GNU ؞�I8�v�J:u��b�k            #          s��K��!��	(E�L�C                �                                           K             �             3               i              O               �              �              c  @��     v  ܈     �    �       3  ��       �   ��      libstdc++.so.6 __gmon_start__ _Jv_RegisterClasses _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc _ZSt4cout _ZNSolsEPFRSoS_E _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_ _ZNSt8ios_base4InitD1Ev _ZNSt8ios_base4InitC1Ev _ZSt3cin libc.so.6 _IO_stdin_used __cxa_atexit __libc_start_main GLIBC_2.0 GLIBC_2.1.3 GLIBCXX_3.4                          l     0   ii   �     si	   �                  t)�   �      ��  @�  �  �  �  �  �  �   �	  $�
  (�  S����   �Ç  ��������t�   ��[�             �5��%�    �%�h    ������%�h   ������%�h   ������%�h   �����%�h    �����% �h(   �����%$�h0   �����%(�h8   �p����%��f�        1�^����PTRh��h`�QVh;��o����f�f�f�f�f�f�f��$�f�f�f�f�f�f��7�-4���v�    ��tU���h4��Ѓ���Ð�t& �4�-4����������t�    ��tU���Ph4��҃���Ít& ��'    �=l� uU����|����l����f������u듍v �    ��t�U���P�҃���u����L$����q�U��Q����h��h@���������h�h��}������E�   �}��  R�E���� <eu��h�h��I������&�E���� <yu��h�h��#�������E�륃�h �h��&������    �M�ɍa��U����}u3�}��  u*��hh���������h0�hh�h���z��������U�����h��  j��������f�f�f�f�f�UWVS�����×  ���l$ ����������������)�����t%1���    ���t$,�t$,U�����������9�u��[^_]Ív ��  S��������3  ��[�      h ee y ;8      ����T   S���x   ����   T����   x����   ����0         zR |�         \����    FJtx ?;*2$"(   @   �����    D Gu Cu|� A�C   l   f���B    A�B~�     �   ����    A�BV�  H   �   ����]    A�A�A�A�N i$D(D,A0M GA�A�A�A�     �   ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �<���             l     p�   Ĉ   ��         �      ���o��   ��   ��
   �                   �   @            0�   �            ���oȄ���o   ���o��                                                    �        ��ƅօ�����&�        GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609                        T�          h�          ��          ��          ��          ��          ��          Ȅ          �     	     0�     
     p�          ��          0�          @�          Ĉ          ؈          �          $�          ��          �          �          �          ��           �          ,�          @�                                ��   �         ��         ��      .   ��      D   l�     S   �      z   �      �   ��      �            ���   ��     �   h�     �   ��B       <�                 ��  ,�      -  �                   ��9  �       L   �      b  �       s  ��       �  �      �  ,�       �  @��     �             �  ��     �  @�      �              �              �  ؈     �  Ĉ      �                          ;  ��       `              |             �  ܈     �              �  ,�      �  p�      4�       ��     0  0�     =  `�]     M             �  4�        ���    n  l�      �             �   �         4�        ;��     G  p�       crtstuff.c __JCR_LIST__ deregister_tm_clones __do_global_dtors_aux completed.7209 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry greeting.cpp _ZStL19piecewise_construct _ZStL8__ioinit _Z41__static_initialization_and_destruction_0ii _GLOBAL__sub_I_hey __FRAME_END__ __JCR_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ __init_array_end __init_array_start _DYNAMIC _ZSt3cin@@GLIBCXX_3.4 __cxa_atexit@@GLIBC_2.1.3 __libc_csu_fini __gmon_start__ _Jv_RegisterClasses _fp_hw _ZNSt8ios_base4InitC1Ev@@GLIBCXX_3.4 __libc_start_main@@GLIBC_2.0 _ZNSt8ios_base4InitD1Ev@@GLIBCXX_3.4 _ITM_deregisterTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@@GLIBCXX_3.4 _IO_stdin_used _ITM_registerTMCloneTable __data_start __x86.get_pc_thunk.bx __TMC_END__ _ZSt4cout@@GLIBCXX_3.4 __dso_handle __libc_csu_init _ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@@GLIBCXX_3.4 __bss_start _ZNSolsEPFRSoS_E@@GLIBCXX_3.4 _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@@GLIBCXX_3.4 _edata main  .symtab .strtab .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .init_array .fini_array .jcr .dynamic .got.plt .data .bss .comment                                                    T�T                    #         h�h                     1         ���  $                  D   ���o   ���  4                N         ���                 V         ���  �                 ^   ���o   ���                   k   ���o   Ȅ�  P                z   	      �                  �   	   B   0�0  @               �         p�p  #                  �         ���  �                 �         0�0                    �         @�@  �                 �         Ĉ�                    �         ؈�                    �         ��  <                  �         $�$	                   �         ���                    �         �                    �         �                    �         �  �                �         ���                   �          �   ,                 �         ,�,                    �         @�4  ,                       0       4  5                               �  
                               l        3         	              �                   332041000100067817maraton/1055a.cpp#include<iostream> 
	
using namespace std; 

#define MAX_STATIONS 1000
bool trn[2][MAX_STATIONS]; 

int main() 
{
	int ns, as, i, j, buff;

	cin>>ns>>as;

	for(i=0; i<2; i++) { 
		for(j=0; j<ns; j++) { 
			cin>>buff; 
			trn[i][j] = ( buff )? true: false; 
		}
	}

	if (trn[0][0] == 1) { 
		
		if( trn[0][as-1] )
			cout<<"YES"<<endl; 
		else {
			if( trn[1][as-1] ) { 

				int k;
				bool found = false; 
				for(k=as; k<ns; k++) { 

					if ( trn[0][k] && trn[1][k] )
					{
						found = true; 
						break; 
					}
				
				}
					
				( found )? cout<<"YES"<<endl: cout<<"NO"<<endl;
			}
			else  
				cout<<"NO"<<endl;

		}
	}
	else  
		cout<<"NO"<<endl;
	
	return 0; 
}
3320410001000218820maraton/java_c++.cpp
#include<iostream>
#include<stdio.h> 
#include<string> 
	
using namespace std; 

bool isUpper(char c) { 
	
	if ( 60 <= (int)c && (int)c < 91 ) 
	{
		return true; 
	}

	return false; 		
}


bool isLower(char c) { 

	if ( 97<= (int)c && (int)c<123 ) 
	{
		return true; 
	}
	
	return false; 
}

bool notAlpha(char c) { 

	if ( !isUpper(c) ) 
	{
		if ( !isLower(c) )
		{
			return true;
		}
	}
	
	return false;
}


char changeCase(char letra) {

	int aux = (int)letra; 

	if ( isLower((char)aux) ) 
	{
		aux -= 32; 
	} 
	else if ( isUpper((char)aux) ) 
	{
		aux += 32; 
	}

	return (char)aux;
}


bool isJava(string some_string) {
	
	if ( isUpper(some_string[0]) ) 
	{
		return false; 
	}

	for (int j=0; j<some_string.length() ; j++)  {
		
		if ( notAlpha(some_string[j]) )
		{
			return false; 
		}
	}
	return true;
}


bool isCpp(string some_string) { 
	

	if (some_string[0] == 95 || some_string[ some_string.length()-1 ] == 95 || isUpper( some_string[some_string.length()-1] ) ) 
	{
		return false; 
	}

	//single number exception for christ sake
	
	if ( notAlpha(some_string[0]) )
	{	
		return false; 
	}
	
	for (int k=0; k<some_string.length()-1; k++) {
		
		if ( isUpper(some_string[k]) ) 
		{	
			return false; 
		}
		if ( notAlpha(some_string[k]) && some_string[k] != 95 ) 
		{
			return false; 
		}

		if ( some_string[k] == 95 && some_string[k+1] == 95 ) 
		{
			return false; 
		}
	}
	return true;
}	


string jTcpp(string ident) { 
	string aux ; 

	for (int i=0; i<ident.length(); i++) { 
			
		if ( isUpper(ident[i]) )
		{
			aux = '_';
			aux += changeCase(ident[i]);
			ident.replace(i,1,aux); 
		}
	
	}
	return ident;
}

string cppTj(string ident) { 
	string aux; 
		
	for (int j=0; j<ident.length(); j++) {
		
		if (ident[j] == 95) 
		{
			aux = changeCase(ident[j+1]);
			ident.replace(j,2,aux);
		}
	}
	
	return ident;
}	

int main() 
{
	string identifiers[100];
	int c=0;
	
	while (cin>>identifiers[c]) {
		c++;
	}

	for (int j=0; j<c; j++) { 

		if ( isCpp(identifiers[j]) ) 
		{
			cout<<cppTj( identifiers[j] )<<endl; 
		} 
		else if ( isJava(identifiers[j]) ) {
			cout<<jTcpp( identifiers[j] )<<endl; 
		}
		else { 
			cout<<"Error!"<<endl; 
		}
	}

	return 0; 
}
3320410001000100216maraton/500a.cpp#include <iostream> 
#include <stdio.h>
#include <vector> 

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define BFOR(l,u) for(int i=l; i<u; i++) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d",&c,&cc)

typedef vector< vector<int> > adyl ;


#define MAX_NODES 30001

adyl my_adyl(MAX_NODES);
int parent[MAX_NODES];


vector<int> getAdyacents(int current) {

	return my_adyl[current]; 
}


void dfsRec(int current) { 
	
	vector<int> ady;
	int d;

	ady = getAdyacents(current); 

	FOR(ady.size()) {
		
		d = ady[i]; 
		if( parent[d] == -1 ) 
		{ 
			parent[d] = current; 
			dfsRec(d); 
		}
	}
		
}

int main() 
{
	int nc, tc; 
	rints(nc,tc);


	FOR(nc) 
		parent[i] = -1; 
	parent[0] = 0;

	int rng; 
	FOR(nc-1) { 
		rint(rng);
		my_adyl[i].push_back(i+rng); 
	}


	dfsRec(0);
	BFOR(1,nc)
		dfsRec(i);


	int d = tc-1;
	while(d!=parent[d] && d!=-1)  
		d = parent[d];

	(d == 0)? printf("YES\n"): printf("NO\n");


	return 0; 
}
332041000100051041maraton/vus_the_cossack_and_strings-2.cpp
#include<iostream> 
#include<string>
#include<bitset>

using namespace std; 


int main() 
{
	string f,s;
	cin>>f>>s; 

	int n,m,diff; 
	n = f.size(); 	
	m = s.size(); 
	diff = n-m;

	bitset<1000000> a(f);
	bitset<1000000> b(s);
	bitset<1000000> c; 	
	int count;
	int tot = 0;
	for (int i=0; i<=diff; i++) { 
		
		c = a^b; 	
		count = 0; 
		for (int j=i; j<i+m; j++) { 
		
			if (c[j] == 1)
			{	
				count++; 
			}
		}

		if (count%2 == 0)
		{
			tot++; 
		}

		b<<=1;
	}
	
	cout<<tot<<endl; 
	return 0; 
}

332041000100093927maraton/books_queries-3.cpp#include<iostream> 
#include<vector>
#include<iterator>
	
using namespace std; 

int main() 
{
	int shelve[200001]; 
	vector<int> resp; 

	int q, aux, r_count, l_count;
	char e; 
	r_count = l_count = 0; 

	cin>>q; 
	for(int c=0; c!=q; c++) { 
		
		cin>>e>>aux; 
		if(e == 'L')
		{
			l_count++; 
			shelve[aux] = -l_count;  
		}
		else if(e == 'R')
		{
			r_count++; 
			shelve[aux] = r_count; 
		}
		else{

			if (shelve[aux] > 0)
			{
				if (r_count-shelve[aux] < l_count+shelve[aux])
				{
					resp.push_back(r_count - shelve[aux]); 
				}
				else { 
					resp.push_back(l_count + shelve[aux] - 1);
				}
			}
			else { 
				if (l_count+shelve[aux] < r_count + -1*shelve[aux])
				{
					resp.push_back(l_count + shelve[aux]); 
				}
				else { 
					resp.push_back(r_count + -1*shelve[aux] - 1); 
				}
			}
		}
	}	

	vector<int>::iterator it; 

	for(it=resp.begin(); it!=resp.end(); it++) { 
		cout<<*it<<endl; 
	}


	return 0; 
}
3320410001000191316maraton/129b.cpp#include<iostream> 
#include<vector>
#include<list>
#include<iterator> 
#include<utility> 
	
using namespace std; 

#define MAX_GRAPH 100

vector< list<int> > students_l; 

typedef pair< list<int>::iterator, list<int>::iterator> itpr; 

void adyListInsert(vector< list<int> > &ady_l, int a, int b) { 
	
	ady_l[a].push_back(b); 
	ady_l[b].push_back(a); 
}


itpr adyListFind(vector< list<int> > &ady_l, int a, int b) { 

	list<int>::iterator it_a,it_b; 
	itpr resp; 

	resp.first = ady_l[a].end();
	resp.second = ady_l[b].end();

	for(it_a=ady_l[a].begin(); it_a!=ady_l[a].end(); it_a++) {

		if (*it_a == b)
		{
			resp.first = it_a; 
			break ;
		}
	}

	for(it_b=ady_l[b].begin(); it_b!=ady_l[b].end(); it_b++) {

		if (*it_b == a)
		{
			resp.second = it_b; 
			break ;
		}
	}

	return resp; 
}

void adyListDelete(vector< list<int> > &ady_l, int a, int b) { 

	itpr to_delete; 
	
	to_delete = adyListFind(ady_l, a, b); 

	if (to_delete.first!=ady_l[a].end() && to_delete.second!=ady_l[b].end()) 
	{
		ady_l[a].erase( to_delete.first ); 
		ady_l[b].erase( to_delete.second );
	}
		
}

int main() 
{
	int ns, nt; 
	list<int>::iterator it; 

	cin>>ns>>nt; 

	students_l.resize(ns);

	int i,x,y; 
	for(i=0; i<nt; i++) { 
		cin>>x>>y; 
		adyListInsert(students_l,x-1,y-1); 
	}


	int j, count, s_count; 
	bool cond; 
	vector< pair<int, int> > later_delete; 

	later_delete.resize(ns); 
	count = 0;	
	
	while (true) { 

		cond = false; 
		s_count = 0; 
		for(j=0 ; j<ns; j++)  {

			if (students_l[j].size() == 1) 
			{
				cond = true;

				later_delete[s_count].first = j; 
				later_delete[s_count].second = students_l[j].front(); 

				s_count++; 
			}	
				
		}

		if (cond == true) 
		{
			int p; 
			for(p=0; p<s_count; p++)  
				adyListDelete(students_l, later_delete[p].first, later_delete[p].second); 

			count++;

			later_delete.clear(); 
		}
		else 
			break;
	}


	cout<<count<<endl; 
	return 0; 
}

332041000100084716maraton/kgss.cpp
#include<iostream> 
#include<stdio.h> 
#include<vector>
#include<algorithm> 
#include<queue>
	
using namespace std; 

int max_sum(vector<int> s, int a, int b) 
{
	priority_queue<int> help ;

	for(int i=a-1; i!=b; i++) { 
		help.push( s[i] ); 
	}
	
	int p, q; 
	p = help.top(); 
       	help.pop();	
	q = help.top(); 
	help.pop();	

	return p + q; 
}


int main() 
{
	int n, q; 
	vector<int> a; 
	a.reserve(100000);
	vector<int> resp; 
	resp.reserve(100000);
		
	cin>>n; 

	int aux; 
	for (int c=0; c<n; c++){
		cin>>aux; 
		a.push_back(aux); 
	}

	cin>>q; 
	char qt; 
	int x, y, d; 
	int count = 0;
	for (int r=0; r<q; r++)  {

		cin>>qt>>x>>y; 	
		if (qt == 'U')
		{
			a[x - 1] = y;
		}
		else { 
			d = max_sum(a,x,y); 
			resp.push_back(d);
			count++;
		}

	}

	for (int i=0; i<count; i++) { 
		cout<<resp[i]<<endl; 
	}
			
		
	return 0; 
}
332041000100043520maraton/greeting.cpp#include<iostream> 
#include <stdio.h>

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d", &c, &cc)
	

char hey[1000];

int main() 
{
	int i;
	cin>>hey;

	cout<<"h";
	for(i=1; i<1000; i++) { 

		if (hey[i] == 'e')
			cout<<"ee";
		else if(hey[i] == 'y')
		{
			cout<<"y";
			break;
		}
	}
	
	cout<<endl;

	return 0; 
}
3320410001000111919maraton/offside.cpp
#include<iostream> 
#include<string> 
#include<algorithm> 
	
using namespace std; 

bool isOffside(int A[], int size, int player_pos);
int myMin(int D[], int size);


int main() 
{
	char response[100]; 
	int count = 0;
	int a,b; 
	int attack[11],defense[11]; 

	while (true) {

		cin>>a>>b; 
		if (a==0 && b==0)
		{
			break;
		}

		for (int i=0; i<a; i++) { 
			cin>>attack[i]; 
		}

		for (int j=0; j<b; j++) { 
			cin>>defense[j]; 
		}
		
		int position = myMin(attack, a); 
		
		response[count] = ( isOffside(defense, b, position) ) ? 'Y': 'N'; 
		count++;
	}

	for (int l=0; l<count; l++) { 
		cout<<response[l]<<endl; 
	}	

	return 0; 
}


bool isOffside(int A[], int size, int player_pos) {
	
	sort(A,A+size); 
	
	if ( A[0]!=A[1] ) 
	{	
		if (player_pos<A[1] )
		{
			return true;
		}
	}
	else { 	
		if( player_pos<A[0] )	
		{	
			return true;
		}
	}

	return false; 
}

int myMin(int D[], int size) { 
	int aux = 10001; // input specification says the distance from goal line is up to 10000 so we're using a maxInt

	for (int k=0; k<size; k++) { 

		if (aux > D[k])
		{
			aux = D[k]; 
		}
	}

	return aux;
}

332041000100072115maraton/arya.pyimport time
"""
def fibo(n:int)->int: 
	
	if n == 0: 
		return 1 
	elif n == 1: 	
		return 1 
	else: 	
		return fibo(n-1) + fibo(n-2) 
"""

def fibo1(n:int)->int: 
	tot, p = 0, 0
	for x in range(0, n+1): 	
		if x == 0: 
			tot = 1
		elif x == 1: 
			tot = 1
			p = 1 
		else: 	
			temp = tot
			tot = tot + p				
			p = temp

	return tot
		
def exponacci(n:int)->int: 
	if n == 0: 
		return 1
	else: 
		return 2**fibo1(n-1)
 

inp = int(input()) 
resp = []
times = []

for i in range(inp): 
	curr = int(input()) 

	beg = time.clock()	
	mezzo = exponacci(curr)%(10**9 + 7)
	end = time.clock()
	resp.append(mezzo)

	times.append(end-beg)

for i in resp: print(i)

tt = sum(x for x in times) 
print("total time: "+str(tt))

168931000100012maraton/.git168931000100018maraton/.git/hooks3327710001000134834maraton/.git/hooks/pre-push.sample#!/bin/sh

# An example hook script to verify what is about to be pushed.  Called by "git
# push" after it has checked the remote status, but before anything has been
# pushed.  If this script exits with a non-zero status nothing will be pushed.
#
# This hook is called with the following parameters:
#
# $1 -- Name of the remote to which the push is being done
# $2 -- URL to which the push is being done
#
# If pushing without using a named remote those arguments will be equal.
#
# Information about the commits which are being pushed is supplied as lines to
# the standard input in the form:
#
#   <local ref> <local sha1> <remote ref> <remote sha1>
#
# This sample shows how to prevent push of commits where the log message starts
# with "WIP" (work in progress).

remote="$1"
url="$2"

z40=0000000000000000000000000000000000000000

while read local_ref local_sha remote_ref remote_sha
do
	if [ "$local_sha" = $z40 ]
	then
		# Handle delete
		:
	else
		if [ "$remote_sha" = $z40 ]
		then
			# New branch, examine all commits
			range="$local_sha"
		else
			# Update to existing branch, examine new commits
			range="$remote_sha..$local_sha"
		fi

		# Check for WIP commit
		commit=`git rev-list -n 1 --grep '^WIP' "$range"`
		if [ -n "$commit" ]
		then
			echo >&2 "Found WIP commit in $local_ref, not pushing"
			exit 1
		fi
	fi
done

exit 0
3327710001000361032maraton/.git/hooks/update.sample#!/bin/sh
#
# An example hook script to block unannotated tags from entering.
# Called by "git receive-pack" with arguments: refname sha1-old sha1-new
#
# To enable this hook, rename this file to "update".
#
# Config
# ------
# hooks.allowunannotated
#   This boolean sets whether unannotated tags will be allowed into the
#   repository.  By default they won't be.
# hooks.allowdeletetag
#   This boolean sets whether deleting tags will be allowed in the
#   repository.  By default they won't be.
# hooks.allowmodifytag
#   This boolean sets whether a tag may be modified after creation. By default
#   it won't be.
# hooks.allowdeletebranch
#   This boolean sets whether deleting branches will be allowed in the
#   repository.  By default they won't be.
# hooks.denycreatebranch
#   This boolean sets whether remotely creating branches will be denied
#   in the repository.  By default this is allowed.
#

# --- Command line
refname="$1"
oldrev="$2"
newrev="$3"

# --- Safety check
if [ -z "$GIT_DIR" ]; then
	echo "Don't run this script from the command line." >&2
	echo " (if you want, you could supply GIT_DIR then run" >&2
	echo "  $0 <ref> <oldrev> <newrev>)" >&2
	exit 1
fi

if [ -z "$refname" -o -z "$oldrev" -o -z "$newrev" ]; then
	echo "usage: $0 <ref> <oldrev> <newrev>" >&2
	exit 1
fi

# --- Config
allowunannotated=$(git config --bool hooks.allowunannotated)
allowdeletebranch=$(git config --bool hooks.allowdeletebranch)
denycreatebranch=$(git config --bool hooks.denycreatebranch)
allowdeletetag=$(git config --bool hooks.allowdeletetag)
allowmodifytag=$(git config --bool hooks.allowmodifytag)

# check for no description
projectdesc=$(sed -e '1q' "$GIT_DIR/description")
case "$projectdesc" in
"Unnamed repository"* | "")
	echo "*** Project description file hasn't been set" >&2
	exit 1
	;;
esac

# --- Check types
# if $newrev is 0000...0000, it's a commit to delete a ref.
zero="0000000000000000000000000000000000000000"
if [ "$newrev" = "$zero" ]; then
	newrev_type=delete
else
	newrev_type=$(git cat-file -t $newrev)
fi

case "$refname","$newrev_type" in
	refs/tags/*,commit)
		# un-annotated tag
		short_refname=${refname##refs/tags/}
		if [ "$allowunannotated" != "true" ]; then
			echo "*** The un-annotated tag, $short_refname, is not allowed in this repository" >&2
			echo "*** Use 'git tag [ -a | -s ]' for tags you want to propagate." >&2
			exit 1
		fi
		;;
	refs/tags/*,delete)
		# delete tag
		if [ "$allowdeletetag" != "true" ]; then
			echo "*** Deleting a tag is not allowed in this repository" >&2
			exit 1
		fi
		;;
	refs/tags/*,tag)
		# annotated tag
		if [ "$allowmodifytag" != "true" ] && git rev-parse $refname > /dev/null 2>&1
		then
			echo "*** Tag '$refname' already exists." >&2
			echo "*** Modifying a tag is not allowed in this repository." >&2
			exit 1
		fi
		;;
	refs/heads/*,commit)
		# branch
		if [ "$oldrev" = "$zero" -a "$denycreatebranch" = "true" ]; then
			echo "*** Creating a branch is not allowed in this repository" >&2
			exit 1
		fi
		;;
	refs/heads/*,delete)
		# delete branch
		if [ "$allowdeletebranch" != "true" ]; then
			echo "*** Deleting a branch is not allowed in this repository" >&2
			exit 1
		fi
		;;
	refs/remotes/*,commit)
		# tracking branch
		;;
	refs/remotes/*,delete)
		# delete tracking branch
		if [ "$allowdeletebranch" != "true" ]; then
			echo "*** Deleting a tracking branch is not allowed in this repository" >&2
			exit 1
		fi
		;;
	*)
		# Anything else (is there anything else?)
		echo "*** Update hook: unknown type of update to ref $refname of type $newrev_type" >&2
		exit 1
		;;
esac

# --- Finished
exit 0
332771000100089636maraton/.git/hooks/commit-msg.sample#!/bin/sh
#
# An example hook script to check the commit log message.
# Called by "git commit" with one argument, the name of the file
# that has the commit message.  The hook should exit with non-zero
# status after issuing an appropriate message if it wants to stop the
# commit.  The hook is allowed to edit the commit message file.
#
# To enable this hook, rename this file to "commit-msg".

# Uncomment the below to add a Signed-off-by line to the message.
# Doing this in a hook is a bad idea in general, but the prepare-commit-msg
# hook is more suited to it.
#
# SOB=$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
# grep -qs "^$SOB" "$1" || echo "$SOB" >> "$1"

# This example catches duplicate Signed-off-by lines.

test "" = "$(grep '^Signed-off-by: ' "$1" |
	 sort | uniq -c | sed -e '/^[ 	]*1[ 	]/d')" || {
	echo >&2 Duplicate Signed-off-by lines.
	exit 1
}
332771000100042440maraton/.git/hooks/pre-applypatch.sample#!/bin/sh
#
# An example hook script to verify what is about to be committed
# by applypatch from an e-mail message.
#
# The hook should exit with non-zero status after issuing an
# appropriate message if it wants to stop the commit.
#
# To enable this hook, rename this file to "pre-applypatch".

. git-sh-setup
precommit="$(git rev-parse --git-path hooks/pre-commit)"
test -x "$precommit" && exec "$precommit" ${1+"$@"}
:
3327710001000164236maraton/.git/hooks/pre-commit.sample#!/bin/sh
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# To enable this hook, rename this file to "pre-commit".

if git rev-parse --verify HEAD >/dev/null 2>&1
then
	against=HEAD
else
	# Initial commit: diff against an empty tree object
	against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# If you want to allow non-ASCII filenames set this variable to true.
allownonascii=$(git config --bool hooks.allownonascii)

# Redirect output to stderr.
exec 1>&2

# Cross platform projects tend to avoid non-ASCII filenames; prevent
# them from being added to the repository. We exploit the fact that the
# printable range starts at the space character and ends with tilde.
if [ "$allownonascii" != "true" ] &&
	# Note that the use of brackets around a tr range is ok here, (it's
	# even required, for portability to Solaris 10's /usr/bin/tr), since
	# the square bracket bytes happen to fall in the designated range.
	test $(git diff --cached --name-only --diff-filter=A -z $against |
	  LC_ALL=C tr -d '[ -~]\0' | wc -c) != 0
then
	cat <<\EOF
Error: Attempt to add a non-ASCII file name.

This can cause problems if you want to work with people on other platforms.

To be portable it is advisable to rename the file.

If you know what you are doing you can disable this check using:

  git config hooks.allownonascii true
EOF
	exit 1
fi

# If there are whitespace errors, print the offending file names and fail.
exec git diff-index --check --cached $against --
332771000100047840maraton/.git/hooks/applypatch-msg.sample#!/bin/sh
#
# An example hook script to check the commit log message taken by
# applypatch from an e-mail message.
#
# The hook should exit with non-zero status after issuing an
# appropriate message if it wants to stop the commit.  The hook is
# allowed to edit the commit message file.
#
# To enable this hook, rename this file to "applypatch-msg".

. git-sh-setup
commitmsg="$(git rev-parse --git-path hooks/commit-msg)"
test -x "$commitmsg" && exec "$commitmsg" ${1+"$@"}
:
3327710001000489836maraton/.git/hooks/pre-rebase.sample#!/bin/sh
#
# Copyright (c) 2006, 2008 Junio C Hamano
#
# The "pre-rebase" hook is run just before "git rebase" starts doing
# its job, and can prevent the command from running by exiting with
# non-zero status.
#
# The hook is called with the following parameters:
#
# $1 -- the upstream the series was forked from.
# $2 -- the branch being rebased (or empty when rebasing the current branch).
#
# This sample shows how to prevent topic branches that are already
# merged to 'next' branch from getting rebased, because allowing it
# would result in rebasing already published history.

publish=next
basebranch="$1"
if test "$#" = 2
then
	topic="refs/heads/$2"
else
	topic=`git symbolic-ref HEAD` ||
	exit 0 ;# we do not interrupt rebasing detached HEAD
fi

case "$topic" in
refs/heads/??/*)
	;;
*)
	exit 0 ;# we do not interrupt others.
	;;
esac

# Now we are dealing with a topic branch being rebased
# on top of master.  Is it OK to rebase it?

# Does the topic really exist?
git show-ref -q "$topic" || {
	echo >&2 "No such branch $topic"
	exit 1
}

# Is topic fully merged to master?
not_in_master=`git rev-list --pretty=oneline ^master "$topic"`
if test -z "$not_in_master"
then
	echo >&2 "$topic is fully merged to master; better remove it."
	exit 1 ;# we could allow it, but there is no point.
fi

# Is topic ever merged to next?  If so you should not be rebasing it.
only_next_1=`git rev-list ^master "^$topic" ${publish} | sort`
only_next_2=`git rev-list ^master           ${publish} | sort`
if test "$only_next_1" = "$only_next_2"
then
	not_in_topic=`git rev-list "^$topic" master`
	if test -z "$not_in_topic"
	then
		echo >&2 "$topic is already up-to-date with master"
		exit 1 ;# we could allow it, but there is no point.
	else
		exit 0
	fi
else
	not_in_next=`git rev-list --pretty=oneline ^${publish} "$topic"`
	/usr/bin/perl -e '
		my $topic = $ARGV[0];
		my $msg = "* $topic has commits already merged to public branch:\n";
		my (%not_in_next) = map {
			/^([0-9a-f]+) /;
			($1 => 1);
		} split(/\n/, $ARGV[1]);
		for my $elem (map {
				/^([0-9a-f]+) (.*)$/;
				[$1 => $2];
			} split(/\n/, $ARGV[2])) {
			if (!exists $not_in_next{$elem->[0]}) {
				if ($msg) {
					print STDERR $msg;
					undef $msg;
				}
				print STDERR " $elem->[1]\n";
			}
		}
	' "$topic" "$not_in_next" "$not_in_master"
	exit 1
fi

<<\DOC_END

This sample hook safeguards topic branches that have been
published from being rewound.

The workflow assumed here is:

 * Once a topic branch forks from "master", "master" is never
   merged into it again (either directly or indirectly).

 * Once a topic branch is fully cooked and merged into "master",
   it is deleted.  If you need to build on top of it to correct
   earlier mistakes, a new topic branch is created by forking at
   the tip of the "master".  This is not strictly necessary, but
   it makes it easier to keep your history simple.

 * Whenever you need to test or publish your changes to topic
   branches, merge them into "next" branch.

The script, being an example, hardcodes the publish branch name
to be "next", but it is trivial to make it configurable via
$GIT_DIR/config mechanism.

With this workflow, you would want to know:

(1) ... if a topic branch has ever been merged to "next".  Young
    topic branches can have stupid mistakes you would rather
    clean up before publishing, and things that have not been
    merged into other branches can be easily rebased without
    affecting other people.  But once it is published, you would
    not want to rewind it.

(2) ... if a topic branch has been fully merged to "master".
    Then you can delete it.  More importantly, you should not
    build on top of it -- other people may already want to
    change things related to the topic as patches against your
    "master", so if you need further changes, it is better to
    fork the topic (perhaps with the same name) afresh from the
    tip of "master".

Let's look at this example:

		   o---o---o---o---o---o---o---o---o---o "next"
		  /       /           /           /
		 /   a---a---b A     /           /
		/   /               /           /
	       /   /   c---c---c---c B         /
	      /   /   /             \         /
	     /   /   /   b---b C     \       /
	    /   /   /   /             \     /
    ---o---o---o---o---o---o---o---o---o---o---o "master"


A, B and C are topic branches.

 * A has one fix since it was merged up to "next".

 * B has finished.  It has been fully merged up to "master" and "next",
   and is ready to be deleted.

 * C has not merged to "next" at all.

We would want to allow C to be rebased, refuse A, and encourage
B to be deleted.

To compute (1):

	git rev-list ^master ^topic next
	git rev-list ^master        next

	if these match, topic has not merged in next at all.

To compute (2):

	git rev-list master..topic

	if this is empty, it is fully merged to "master".

DOC_END
332771000100018937maraton/.git/hooks/post-update.sample#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.
#
# To enable this hook, rename this file to "post-update".

exec git update-server-info
3327710001000123944maraton/.git/hooks/prepare-commit-msg.sample#!/bin/sh
#
# An example hook script to prepare the commit log message.
# Called by "git commit" with the name of the file that has the
# commit message, followed by the description of the commit
# message's source.  The hook's purpose is to edit the commit
# message file.  If the hook fails with a non-zero status,
# the commit is aborted.
#
# To enable this hook, rename this file to "prepare-commit-msg".

# This hook includes three examples.  The first comments out the
# "Conflicts:" part of a merge commit.
#
# The second includes the output of "git diff --name-status -r"
# into the message, just before the "git status" output.  It is
# commented because it doesn't cope with --amend or with squashed
# commits.
#
# The third example adds a Signed-off-by line to the message, that can
# still be edited.  This is rarely a good idea.

case "$2,$3" in
  merge,)
    /usr/bin/perl -i.bak -ne 's/^/# /, s/^# #/#/ if /^Conflicts/ .. /#/; print' "$1" ;;

# ,|template,)
#   /usr/bin/perl -i.bak -pe '
#      print "\n" . `git diff --cached --name-status -r`
#	 if /^#/ && $first++ == 0' "$1" ;;

  *) ;;
esac

# SOB=$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
# grep -qs "^$SOB" "$1" || echo "$SOB" >> "$1"
168931000100021maraton/.git/branches332041000100026219maraton/.git/config[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = https://github.com/cccsar/maraton.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
332041000100010724maraton/.git/packed-refs# pack-refs with: peeled fully-peeled 
02590e5d95cf786c874c4a77e66096c47e24ba27 refs/remotes/origin/master
3320410001000708018maraton/.git/indexDIRC      T]�L ��5]�L ��5   > �  ��  �  �  �G���O�����k�i#�6 	1055a.cpp ]��z4�n]��z4�n   > �  ��  �  �  ������m�``��c�#� 	1217a.cpp ]�L ���]�L ���   > �  ��  �  �  y
Q�[˛��7�!����#��w 129b.cpp  ]�L ���]�L ���   > �  ��  �  �  ��j��G�j�,T��cA 2 ]����ow]���	8��   > �  ��  �  �  �sg�xF�8f�t�p?ٗ� 500a.cpp  ]�L ���]�L ���   > �  ��  �  �  �ް�����̣gHU�!����) 616b.cpp  \�=�hN\�=�hN   >�  ��  �  �   
fN�ƿd�?xǚ������� 	README.md ]��9y�]��9y�   > |  ��  �  �  Z@V4e����>��>]�J�� a.out     ]��-��]��,�   >  ��  �  �  ��Ex}��/��i�~=~]��� 
acpc10.cpp        ]ܢ"U�,]ܢ"U�,   >�  ��  �  �  �	|c�4�D��>{u���� 
addrev.cpp        \Ű�8�h�\Ű�5�t   >�  ��  �  �  Ӝo���Z�l�������d* 	addrev.py \�n9�$\�nQZ�   >�  ��  �  �  ѯb5am�k"��`Gܕ�l$� arya.py   ]*[�$6"]*[�$6"   >  ��  �  �   �J�^(� ���ɣ(DȦь� 
battle.cpp        ]-%��m�]-%�?�   >  ��  �  �  Hаҝ~,v���"tq��u}��� books_queries-2.cpp       ].}�hC].}�r$t   >  ��  �  �  ��]ZݽtO�m��EB[��z� books_queries-3.cpp       ],�� ��0],���   >  ��  �  �  ��Kք*�j��%��1@d˔~^ books_queries.cpp ]0�� v1]0��;8�   >  ��  �  �  Lbb��ȹ<�O�F�E(� boxes_packing.cpp ]���	��]���	��   > �  ��  �  �  Px�|p�Bu��=őC�TG��, c++       ]�L ���]�L ���   > �  ��  �  �   �#X��svWgԑ�7	}%�/�G c++_template.txt  ]"g���]!e\ �he   >  ��  �  �  /f��_ww1�����H��b candy-2.cpp       ]'Y�*5F]'Y�(��}   >  ��  �  �  #�-7ݧ&�Lx���ߑ���p�� 	candy.cpp ]�V��]�V��   >�  ��  �  �  "�U�w�����Ŋ�J�V� 
canton.cpp        ]O�4w�]O��'   >S  ��  �  �  �X����d���/��S�Ax��� delivery.cpp      ]���>�]��
�   >   ��  �  �  ��A""B�}$d`�^��\ߪ�� eggypizza.cpp     \�=�hN\�=�hN   >�  ��  �  �  `�wĉ���v���9J>���m eggypizza.py      ]?���.]?���je   >*  ��  �  �  /F��^J�ܑ|5,78^� farida-2.cpp      ]S��m�]S��5S   >�  ��  �  �  -ڽ�=�%3Z��F3A+<?z| farida-def-2.cpp  ]D�;z>$]D�9�8   >9  ��  �  �  c��8�N�axV� aX� �} farida-def.cpp    ]������]�����;   > �  ��  �  �  y��iP��f��!�~2���53n farida-propper-2.cpp      ]D��.�:]D��,��   >8  ��  �  �  �LI��kuF��E2�Hqe<'� farida-propper.cpp        ]>Z�	��]>Z�jP   >  ��  �  �  un����!�1�4>`ݔ� � 
farida.cpp        ]���@��]�CG�   > �  ��  �  �   ��΋8o��nf_73a�e�2 graph_tc/graph_tc1        ]���@��]�6�8   > �  ��  �  �   ŭ�5N�l�£��ӛ�� graph_tc/graph_tc2        ]���@��]����   > �  ��  �  �   qu���b�O���Q=W�]� graph_tc/graph_tc3        ]���@��]��6��   > �  ��  �  �   & ����V���8r��W�0�� graph_tc/graph_tc4        ]��� �x�]����+�   @
#  ��  �  �   -hX��W% �t�_9�|X��v� graph_tc/graph_tc5        ]!1-��5]!1,���   >�  ��  �  �  �e�&��e��=@-~���w�, hangover.cpp      ]qCLοI]qCLοI   >E  ��  �  �   ֠\g�ţzS���RBԴ�� input     ](�D�2](��P   >�  ��  �  �  �}�ِ�B�"I��X�g(�8�� java_c++.cpp      ]* [.dV�]* [-p,   >  ��  �  �  ^����)4�81�h�L��#� keanu_reeves.cpp  ]&��+a?
]&��)�Q   >  ��  �  �  M������٬�|�(���+� 
kgss-2.cpp        ]&i�9�N]&i�7�   >�  ��  �  �  O�r<4���4K��31�B� kgss.cpp  ];x�2L];x���   >�  ��  �  �  R�u���F�hg�Y�f
.�� knapsack-2.cpp    ];f4*�"];f4(M�   >�  ��  �  �  �Y�[��	xH�aA%��i
? knapsack.cpp      ]4�P�d�]4�P�+�   <3  ��  �  �   �M�C���2/-�*T ���u� mylib/c++_template        ]�$#%j=]�$##D�^   <�  ��  �  �  R�$i����9u�i9P�=?G��� mylib/graph/bfs.cpp       ]7s�3��9]7s�2ZǛ   <�  ��  �  �  4�R��s�v��0˿j7' mylib/graph/comp_conex.cpp        ]��b�"�]��b&��   <�  ��  �  �  �~�<�?�)C ��'\ mylib/graph/dfs_r.cpp     ]7n�8�
t]7n�8�
t   <
.  ��  �  �  /m��H���� � /~T.jO�` mylib/graph/input ]:��^�]:���M   <8  ��  �  �  %��/�{�X� �	-a�̓��D mylib/graph/kruskal.cpp   ]=w00T�]=w00T�   <�  ��  �  � �w�M"�y��o^xє���2 mylib/graph/out   ]4��m�]4��m�   <  ��  �  �  �|�kwm����b�42dw�n� mylib/graph/out2  ]=���]=��L   <	�  ��  �  �  o�U��b*��pfPj���+�� mylib/graph/prim.cpp      ]�6�9�ae]�6�8��    > �  ��  �  �  �*���3 ?*�W��iT��� mylib/graph/proyect/graphs_.cpp   ]7�p�W ]7�p�`   >8  ��  �  �   ꪥ�wv3v��V1�)�H׽T mylib/graph/proyect/main.cpp      ]�7#�>3]�7"���   <�  ��  �  �  	0e�
�>��C���Ι�F�� !mylib/graph/reach_brute_force.cpp ]7sfە�]7sfmf1   <0  ��  �  �  )ԅB��`��J&:p(ks� mylib/graph/roy_warshall.cpp      ]7n��sI]7n��<   <C  ��  �  �   �ULIES�1�\R��և�� mylib/graph/tcases.py     ]<fA,L]<fA�#:   <  ��  �  �  ��ꝼ:Z3X*��K�U���� mylib/graph/test.cpp      ]71.�=]71.�=   <5  ��  �  �  �O��O[
D�/�[~����� mylib/graph/tr1.txt       ]4�\8;�@]4�\8;�@   <6  ��  �  � ��\�x�!�C� �`��Q
��] mylib/graph/tr2.txt       ]4��`��]��1ӫ^   <�  ��  �  �  �	CkeO�{)���N���� mylib/miscel/fact_i.cpp   ]4�����]��vz   <�  ��  �  �  (����H�@�������
 mylib/miscel/fact_r.cpp   ]4�����]��1/7   <�  ��  �  �  "/ԇ�l[
�?)�kh3� mylib/miscel/fibo.cpp     ]4�����]�G/wh   <�  ��  �  �  &oX$3G3��[�{h��̏ mylib/miscel/sieve.cpp    ]4�����] ���r�   <�  ��  �  �  =#�7��-O��7�,z,�j�Z mylib/miscel/sizeof.cpp   ]���]����   >�  ��  �  �  �/�sI����;`�3z��T 
nsteps.cpp        \Ŷ_*�S�\Ŷ_)3�   >�  ��  �  �  ^��0�����k�ϟN��a 0 	nsteps.py ]{b�8I]{bWk   >�  ��  �  �  _�����́��ƴ�k�1 offside.cpp       ]S��\a]S��\a   >  ��  �  �   J�9��W7E����@��}%. out2      ]+���Q]+��f�i   >	  ��  �  �  /��T�98:@-V@C8`��z pair_of_toys.cpp  ]Z� �]Z����   >�  ��  �  �  a(�)�=;�Z+P���[Z� 
permu2.cpp        ]"1�6<��]"1�4�I�   >t  ��  �  �  wO�˳������+#l܇UB 
prime1.cpp        ]S1{�L�]S1{XJ   >6  ��  �  �  ���mg
�!Q��|G�`�� problem_list      ]�26�[]�23�p�   >�  ��  �  �  ��Nc�r
#�ވTxA�ũ�0 stickers_and_toys.cpp     ]�`%EVF]�`$9   >s  ��  �  �  Uw�0}9�K
/�E)��1�b�U 	stpar.cpp ]�L ���]�L ���   > �  ��  �  �   |ku=�i���O���Q�N�� tc        ]SI8\�]SI6   >  ��  �  �   b�T�{��`�xS��no��+S 	tcases.py ]��]���6p   > ~  ��  �  �  ٜf��)$T������] test.cpp  ]��z5C�]��z5C�   > �  ��  �  �  ]}���}�2
�B���}�a�8 traverseDir.c     ]"`,���]!,F/�   >  ��  �  �  �@�V�؉�/�N�����o" !vus_the_cossack_and_strings-2.cpp ]+ex �q�]+ew:���   >  ��  �  �  ��cN-i��fxfü�.� vus_the_cossack_and_strings.cpp   \�=f{^\�=f{^   >�  ��  �  �  �	ƶrU��]g�x3O  whatsnext.py      \�R�,b��\�R�*z1�   >�  ��  �  �  ������=.=�����`+��� 
wonowon.py        TREE   � 84 2
b �Ag��ғ��3��S�Z�mylib 22 2
����C��}���W*(�ZT��graph 16 1
+�v"sZۣ8خ�	[�@~proyect 2 0
� /�&ƺ">3�p�����@miscel 5 0
���1��d�{��J��Ty�graph_tc 5 0
���G�̜/�/S�!���1A
��>V�>d����^ę�H33204100010002317maraton/.git/HEADref: refs/heads/master
33204100010004122maraton/.git/ORIG_HEADb30765df6ab4056e6b09224482d9cb1faa957cbb
33204100010007324maraton/.git/descriptionUnnamed repository; edit this file 'description' to name the repository.
33204100010001527maraton/.git/COMMIT_EDITMSGpusheando
ando
168931000100017maraton/.git/refs168931000100023maraton/.git/refs/heads33204100010004130maraton/.git/refs/heads/master0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3
168931000100025maraton/.git/refs/remotes168931000100032maraton/.git/refs/remotes/origin33204100010003237maraton/.git/refs/remotes/origin/HEADref: refs/remotes/origin/master
33204100010004139maraton/.git/refs/remotes/origin/master0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3
168931000100022maraton/.git/refs/tags168931000100020maraton/.git/objects168931000100023maraton/.git/objects/3a330601000100093362maraton/.git/objects/3a/0b0d31a4c4266acc6d3afd2d92b2763933db12x+)JMU044�`040031Qrut�u��MaH��vl�ry{���Zf.iް�=TQbrA���^rA�O�
�چ��R�d.�����v�)LUJJQjXgM�]�.����K�7��.&8	UUA%Ü�ٳ�wF�ϙ�z�ӡ_��h�U&���O2M�]����MK�����sT^σ*I�֎/I�-�I,I�+�(ah�{�tj�����������2�61/��0)����_F<f�塴#Kg���E%�y`UrJGB�/�:k�cɣ]�����߀�*N-9�ՙȦ���l�f������Ca�+ P S|qrQfAI1C,_u����6)
���ez\k$Ԥ���ʂ̪�D�������ժ�$�c�;�s՟�
��&�,?ҹE����,��&��ȅ��H�K�/K-��z\���L��S��u]��Ӂ���+(-aXu�uS�i��}mWOT�����1�U��X�_�A�OoNx���\���ӈ���׮@�����U�o.������:�	��|�U��������y����BK�e�9?�o��DH�姥�d�2�����mw[����Υ�S�6�x5��83%l��Y���H8�8a�-G�e�J�����*��6�/H@�\�D�M�Ư��&BM)H-�-5¢�P��ֺ5J;����u��?�0UE�����)��}������G��#����1��*?)'57>'���a��� ޽�7=����xz��-��'��
*K2���)"�-1�j����������}�u,�K2��S����5�$��b���7q�*w���p�zte���%���.�5����ͥ?�Us�C��I3C��JR�K�^)L�y��"�C��|��e���^��)�H,)�K�(�lq�cۊ$C���3�ƦO�0�����y�@R5o��o�m�l7�X�HvQ����[� �1��168931000100023maraton/.git/objects/3733060100010001032462maraton/.git/objects/37/140ef8254799c1cde60866a28836ccdc36a7b4x�}{s۶���=��0=�\��K�eI���I����9�N�C��D["U�������o /��$MߧjcS$�X�.{<��c����<�������;�d1������D���\��Fz ܹ�C˗]K̝`:�d`����2���o�����ݣ�z����ާ�-OI������ �c@�1ab�r�m�1��7�ߣ����A7d$h�{��L�Μ(���Z%�g���>��O�rt���U7\[����\.Ļ�_�r��T�� ��Z7r}F^l	7 8Qz�LeE8�i��lQ�2���6q�^Ȩ"~tn��8{V��u������\'�0��h5^�g�g�����̜�F�q1��%�G�<�V�$����� ��@Ћ�^MV���a@=�������#|���^�Vqz��B�P�֗wKt����%��'o}W���"��O|gnӸ�Q�[5E�48t��$�N�L���Qp�P|̀L�}g���=K�'eJ���u{�n��[�_/!e�;�3{9�k�P���ZE��K�$Y�k����*�OU� ⚖��.P�r�V���}#4������v��2����؍�%q9�Z��^P||����~"���d3P���pj���ɖ���ۡ�_��S�,\,�ć � �<J�&�7�Ԥ�/��K�}R#-x��y5��-��3e�y"��1�Y��Ӂ��R��ir#f���m<���W��c��H·V<�qW� P�H�#�1��vo�{$R�Rt�?_\l�2�㚥�:�DF���J
 �}\����~q�4��?����ӝ�G��?A�x[WĖ�;��iN��Y�1˱��M��?_�.epx�q�U�W���ſ#�����8Y�e<�jB��|,BDl&�K��(��8�_����7���_��_uD<󡕠װRt히WK�>"��j�W��Z���jJ�8r����$!��ꆞ�ƷA-�V�Q�z�5��@n��<�����x�I�Lt��;�����8��6�ː�ܻ^PH�4Iz�֪���h�ݫ.|�u����9#�=� �kmtV���w����m�&�����6^�s�8 ~��R����'�A.r$���ł��JB���9����Y�L�ﰾ�韣�&dRC��
���A�^h~Q�=�~���̆^װC��[<IJ�χ��W2Z���K�Qm���u\*L=���	v��d��;X�xa�a����ݘ_C+7"�����|D�@|���-���?�6���:�.�ex+������G����Kp���kǟ'a9@�u"�hǗ�в���L�|<�qu.�i2;��c/B��=��9M���	a�C����V�����F�w�E�p(.����I.������<88!�P�H&�(������js{4�9�JR�U^�6�(@9�az�Ѡv�m$]��oW�8\�+ Q&LȞM$�cX�ۣLP!�hM�%C�(��jy9�WS'�^Me�o�-�����_�xE/�^�^A	�7�X����a�^���r��-#UC��*�C����i��U��F�~@�}XwV�Qt����y2j�)��Co�,�eb����A���+[uu��5A���^'r/a�$g����<0��GF[:��V�fQx�n���^xv�)h��#:S=��D��z!`>�B�eca�E~hy�@�κ/�0�'��)�%��~ �4_�D�^D>Ê�*�V!V�i�W�d���������<3����
e��U��Y���
6���yH����|@�o6؂��&��t��\�bb���Y8�+:�~�-m;+�ha���[��x�>�i�rys"ع�f�';�Y��#�Ԡ�}/ �S7�Ⴟ!M���x�$��o��x��(0N��''�
]�'[���1��'�@�J��;q�ıc؈�r��M�y�=�q[}�
!TiZ?ǘ����1LV@���/��X�G������3b��3@ �4����6&el�~��� �Z,ƍT}R,���x�`�G���T#��5L��~~�e�2WOĶ��ٰR���؉�1B쀨������7)�m��FG*J땙$-�mf1�J�I�P�Tw�Wz�$����eN7L�)��)sg�K��[��-��܆ R$�:�m.mQ�PA*��F�em�.U�x�Ǫnk���)��9�l�e�^MYI��5�[o��s���)��2!� g#�f�P�������8�11B4��c(*��������+�U��_��b2�V'���bH�e�r�Xx�L�N�d��R��[��I:�M��|]�޿����k&뻟߾xu��"�SrP����$�6�籈�`��b��\AU\\�^��y}�;L����ޠ,�31+��O���Wt�}rK"������79Z��ۡ����g�\��1�U'���7����C-Jӧظ�ɒ�)�6bc+^��$�=\�sn��7�ҳ�`*TN��_"��-�_ٺ�l���f6�F�	�8���*�uQ�0]��͐�J����'�eP[!%aj�����2��f|�i��
�/t]0	�.{o���S����L��T��X��0�P��������P���G������M�_C��9�wb�;�rj�<^ÈC��-�����<"W����,4�R�|��91�g��F�He��
�Ǥ{���ոƠ<�[��r�=ӿQ����?]��X���b�����^�B�?��s�������lJ�eArӳ5�`��}h�Z|��Զ����{Sa�Ŋb�y�[���}|�]FW���6L�8��1����g�~��X2�ďb8R���s%RD2�>'�
NMW9�Z�2'� 8/UDA�6��r��X�+}J":ʙ/�1��^,�\}qC��&N�;G�]��o��ޗ���5���x�^�,��qriˎ'��k��Y��Z���6{\C��G<�ծ�����˗������:���F����(�>���v�v��w/]��J��D�^�S�Ġ��.����.��5ė�/Ԧ��j�&pu9[�N�ח)$��"^9�'5�#�����ū����=u�:cP3_���������֞��Z9����4��B�}�\�5I���q�)M/ȳPnT������
x��+�5S$ə�Ϟ����ʕ�����J�z�K'r<����oLrӦ̏6�)���[�gp�2�ćbX�bQ������������YP�:��Z��Ԣ0��r�d�9�r�@dJy2O�Hb�D
�f���� +Cx�@�y�d?�$:)��� 2�.
��c�����n��u�r��Z��B�/�P�Wp���Ö`�"vK8N��:H�#K��Nӎ\YE$���=�Sy�?G���<o�D�7]D�U���(wΈR=�	�2���l&!]����&��}v'�b���>ފ����B�)�U��ŝ� �2B;��ɣ��R���|�*$3��}U���g<�:�O�s��t�aCKѬ�VE�+��pbC���+��?W�/����5�q�c�'k�E�/��r������.��Bo���`4A���l>�ju��:� ������"7��x��J����y/�� ���	�� ��⒩���}H+�C�%f�p���D��!h�	­,F܏��+=1q�݃2�;C\: a�
jb���|$1=5M|�������@���pSa�' �jP¼������V�&�ĸ.C��\]���aq�5ɀ��� \T{ �H���1�u(�8���'�piI�®
!�3�B�i�yk�����%�\/�%���A#�ݢ�ˑb$�R\�J�8���t�z�S[6�(��2����vH����_&m �?�����W��C2~@�ax���!�;�����@=œO溚�`��@�"��Z�|�� �d�d,�;��AL��of1���q!��dj��6� &
@��R�% �!R�	��e���A�Ɗ�F�	I	�&މ#��(,�)��f���`�^�oR`���u�)����^�ha!���_|
^�',��Fr�~��mѢ��y���U[tD���:�4*��`�x�pҩ�d�4D�k���0G��-�H#�|[R!�����/#����s{#�uV^/8�.�p1���.idv�x�x�U��e�C�>�ـZ��m����X�8O���Y.ʡ«g:��-r�fI&�sϬ2<R[Y�V*$Ğ�6v���"L�A⠼���oY*�2��0��N� �`��4��9� CQ=�b��5��#@���&���kuJ�a���<9I�C|����t�7� c9��q�U0��'vz��C�aNmjS���8l�A�H���t�F�����/�����g�!O�������ܟog;�������;��� �W��,�)D�E�0�.�ہ��)M�4�e"����r_�i�ôs���BK�����P�Jp/�b�����M�"��J��uZ>R>��u��D,��M`���K�E����(/d�%z�>F���o��"��.9�tPu�$*��q�J�O�Q���	(� �B�	�<�v>Vh��g?��:��}9C:{��(/���V��ۦ1�\����U!x��#���q� �+�mDI��D��(�NLa�ˋ�v��9Ff7&:T�ϨK��-�5���$�Pl�_%�~�Q���¦����F�H�W*\1��� ��#ԥ��$�����P��f�BN }�UN���X<x&P,	Х0�T��EzNG@`�&B��9��}dސo��i��T5R�ь[�+�2uY����출F��u�yܝ�d�=�:nW����v�9%��FW�<�Y�Vh^Z,��
=�qNm�%��̨�kd�H���Uʁj�и�1��cvp����g�n�B=T�ح�ht��z�s��^_E�H��
����MZ��n�f/%�`~c���y¯�s�⸩��O8��x���Q��5[��򺝦��t;��{,�^��9?�fqH�]�
w����j!����V4{���7Z��p��6Yq��kaJ,��P��T^�>��|���R��f&����b\��{(�9�bf!J��^>Տu��9�C��{��I���G��Q�~��|�9cƫi<^�:D�5�嫙հ�m���[�~{׼y7ZM�
"ȼPy����%
j�+�v(��
�����9�<o<�w�u��6&Gn������ޓ����{ݠ��g��t���ׯ�N�n	̣F�;��B {b�����"��P�,��3���8:��i�	�w�XĢ)���5	�m)���B%� ������%��66%����6�n��k���X������6�H@��s�/���I���r�Bə��Z�֏�F�&֭��75�R�q����K$��t/&vP� �?G� ;����TWC�>}�7�Ķ�n�[�N���t[�Fw��N��q��t��sg�L\;�,r��"�g�x����Yud7��0�v��S�����S5O���|sٷ�8%�� ��+N��;1|�6#�KF���N��n(���=�5�UDX��i�e��+�t��Y��s��6��:�H��l�=�;�^�;���m�5�XJv���q���+s�բ�%�v'[�;�t��R��/�+�*D�Z|�r�Y>;XBy��[4#�M��<�Ի��q�ޜ�[7dgr�rZ��۔�/����8c�ф]�^~5�:v�X4��6��j�*u��0��sJ �7��p��)]�$T�&2?���e��u0<�Sou����ȑ��<j���N�s
-�b�<�����ܗ��O�n��!����Cl|@��� ����H���ÖK�݄��L(CCSLG���r����'uB�}�+b�C�S-��lb�b6�7��S������M�V�Y�m4kih�\�&��l�T���9}lm�q��ʞN���r@�(GI���
[Ӓ����R,�4Mb��{�j����<�#���D�H�Ʊ���:�/����$v �1� (~s%��z�W-�V���7PߪT.8��B�L'�8P�"���P�Ilw�ɹ�f���-Q?�C泵@YNdgh�����:��:`��	�mg\O�GDY5N�p�у(nV�i
�V�Q-پ	ys�2_�9��TD��L���H�as�:L8�+z�ʵqo�]�:�p��H��h#�yw(��ҹŏi� ��0���E�to`����i����d"���*z�!��q?�f��p����M#F å{��fQ��B�F�~D<6������&��t#-�ORh+��2920������G�ԓ
_7�f�qrŁ2N�@<��?�{��FQ����9Z�� �F�^� �a<���@��?uo"xE�nf67���# \���뗔?�M���G~�L^u����}w
O�ɟ����?�З�q�[b�ˢ={�f�}R��D/�!��oH���D�z6 a�c����0�_�V�:}h�a~Aǔ�w���A)"{�c:D5�sIfV4C��;�N��G��N@#� ��f�<�ѾD-��v�Cڠ�A0��HA4�+�8@~�����Љ�餇|q�& W?�]ld��R�lb��=���T�(�4+V��4J��F�ͭQ#�{�(��Z�&i� W>ب�ތ7�'������卲�4ӡ�]R�@���I��fL�1������c���B��=���D�:p�'h�W:>�{��'�\O���P����[9<���{DDΟ�PZ�����vh��*�pU8�B��S�H��ڳ5Ė\x��=\�8����(`�o:��\��Դ�TJJkm��$T8�؏�8����i�tXw��� ��@�	������yN��In�%FE�����̩�I$���'rn�"Q��V(9����ګ�s�{�c�f�ޱ�]D�������/ ���Өǌe������^ ��z��W:T����En���{�7_jtZ��_�9�{�ay�3�bE�PS���;iF�U���������u�����R�鐗���׭S8���H3x�Pq�>O+��u�ؔ��b�x���sk�B�W]���7�����?�"e��ʴ�UP��l�_�#l��B�_��
{&��L�_��1�7na�%��`�#���?�|��9�Bլ�k]zŴ0���|�6͹�FO�7Ӝ�ж��`���E����\�dq�L�`��R��*\@P?0h�4�ZYR�"֐oP�z�/޾�'�UU<��"!������"��j��\�+7�D�b#ֈݰtI���3�:T%#� #�Pd�Fӌ����O���T1ق�7�Ɂ�G�`�h,�ߤ
��R�&����6jչ���hi�7A\50>�����cM����|˦=Ѻ����6��4Jq�l��������� w���9Q �]��S( �r1��B�*���W�'h�U���SWp�M�����yf�PM����$���'}�><��X���� ���0�K���9�.p[��s�"~I�2���*98,�;�C�����r��'����4��U�!��] Q5���jd��Ŋ�i��(���5gyހ�W�pK0ϕ`��H��H��Y1�t�L���f�W��{��pJN	'� MH�0�Q�Y��3w�X��'�F��v�c^r�[����:�ΐxp�D2��L�WK2�8"��"�F 1F�C���2�??0=!���;�S�b~���l� 1M�5 ��*�d]�㢞 H�&VK�jQ.x$�(���z
a�SZ&(ܢ�'�շ��a�)R�yMkP��0���1S�_:<�	�z�NU!�.�Qx���eD}�ZB��4{�oa��ȗRJД�7���ђ�se�����vWJ�f���
C*��
=��i[5���WT�D��#2qk�-�sB���B"Ŵ�:XP�U��҆l�[_�0�Hv@�}+�t��TaԖE���3$�<_l?O�t>T�·z��r�l^	#�AهvX
�I�-2�;��J
Rk��Ks_m�*�\�m��m:���"�f
�g1��l��7l�(�&��� �{%f<�[���:�#�K#CtS)	�i+�`u_<�ok��D���r��
Q51K��.Z�؈�^r�|���*Zf��8��[cvaO�K��3~�N2�t�c�2�]x��A)<�(sb�v�M�E��=jj���(�C5��R�>�(5�9�r����B��fl����iF&Q͚�H��a�v���|���Ҋ�T45���F
5
dLY�'Ǡ�V����G��y�vwڨh��h�?��C�������X�_�����+ߦ�^�w�H�yos���I���0��x
��SM�+�����.%��3;��HY�0�	N�]�ķ|����]K��7�@G/��e.��)��~�G�H���M=G�˥�$��&��:��<4aD	t �a�H�,X@8S�TE��u0����w/mASC�[���oF)K8a���A����Y�cNOpԶ �%61c+�D\ Ԇ��^^.�H�E���Ż羬w�9��іw�����%bg���)L�(������ƪ�Ʃ1�օF��}�^�i�0����`/Op�0᤾0f>�Uz�y��o���ZJ��'m�0�����r}�݈������ϴu=F.�#��z�1�u���Ī�c�Hll%7T���*Y ��3�Q�6��&Nn	��sB����b�0I婢Ґ��i�F�8�_.�_,���)�3)=y"� P]�5ض�>����#G����+g�3�J��bf��.H�f{e�a�h��Z~*���Jh���/x c�T�+�I�E���[�l Ǿ�ms:t�#�Л�_��yJ �w�~����.�?������L�������,�i�<ֽ�S.�.M��@��~������i����C��8,��Q�֒�4"(ӭ8h�܇���%�2�����P�@�S(���@ϟMPF.[�@����6ٶ�@;hp{�4���3w��aM��4�w�f3��j�F��[>�Mc�Ն��·@%����ÏO$�g�ю��y�Xgi33
�n�#�M��O�£D�pP�1�h��̩�(��m��-���n����kz��y�GN����΃>��k����}����O+��gQ꓾��+��a	z<��I�����d��ROG��Y�M:�(=R}����:e��OK,��G�k�����)�yT�C�7�kh����� k�� ����˝�q������(�����{쟪z�kܘ\S��#�^`�/֗���_p����� YTT�2�\#�� 0D-�؄iP�DNC�qW�qQڂ� �W��(tO�	<\���7U�!�u��U-�� �g���b>l<�?�!�ܟ1y�Y�0�6�U4�Ci�/o�O����&Y��%��1����WT&-g���ctN:�8��g2~�m�J\	+�JTq*��������cf������5Y�m���F����F"K��V��������p;v_��P�S�ハnr|�rDAyW�:IU9�4D*q�[2c�*'և����BLO;�G#��wp�»��ƨ�ā�����n�(5x��j�7�X)M^ޅ��A�N�q�z�~�;j�^w�V�Z꣜�	���yWW�\Ccj��d�S=�(c&r�
�kD8�,uZ�� z��N3#���W޳a>�{dܟ��I����i�ͬ:�ҏ��t<V���8+ΙU�f�2��D<�0���~���v���u|��|��:�p;�a�8^I�dS��qQbN�T*ұD,�a���܌osH�(�
�r��Gl�!:�K�:c��̸5�ņ����ŷC�c���!f�YT��3^���:FY�)�_��^���%E����Rz~�=�33�5����^�cG<��Y���	�o�D�5�'%K#E�^��R8RP�$q�,����sVu�|^[���U�,;�'sy�� I:׭���+�NKW���D*�A�҅0ş��a�\�V�MW$�T� ۾_��@�]�B�l�C����ڰ��te�'��E��9�Qqk[��'�j̄�ޖ��lJ���=��:���`��@G�����na�z��&9fY^���Q��%��R�7�,07���9�����$F3306010001000153962maraton/.git/objects/37/50c77886989d4279909e1a57dba0a05974a207x��{8Ti��bm�к�F"EØc�Q(�B�˖d�93���s��r/+Q�K�Y�tY�������G�IQ���H�8�T��g�y�_�9������},A]�D�	�_�d]"�h�iF~ݏ�=��;��\򌎸�F�w�h���&<��a������ذXr3=*�Tdq�� ��F$ ��$?��/3]6�f��}M�L��B0QBh=�M+����C������ꑹJ�9���P��}��.�px^�đ,�Zx))�3��l��WQ���)O9�3Q��0DFsn�5Ǵ�]�x+�pS}�����2��!J��@Ȅ��{��'Ìk>���U���5���f��ǻ�v��꼬w�ߝ��f��8�s�ʵE�}�w�Aa&і~;9��3��E ��,��~j~S�����ݒ'����5PL��(0�p ����Z'{��Md�xVR��
�}�x� �7SF��XLT��y�m�t�T��5C�6���_��M�4��7�X�sAz��y��ѫ�|$�K����ڸ
�R�}���V (��bg�ԹrzF�YӁn�v;IlZ5�@&3H�
�M�E;==���Ut�U�kq>�g&s���M�v�k�.y�X~���y}bBu@Ȣh������oJ��B��[X��*�ut��ڮJե6)f����p��C��H;��햽�I�īd�
��)�+B�@ 
�ʱ#�Y�/�a\Z�Fki57�}�#շm)e�U&H/��@�5�s4�x��j+���Z�=�1��<&_���o�_�N7�ؚ��a�z�M�h5O �1m�r>̢ڜ`�H�ɜ�-����(Ҙ!�B�:������r�og.�0ڲ�-���"�[A�u�իU�ȍ���*�G�=�׏�Y&$;d�'������<w?d�pb�,��W
�tWShM���?RHޚ~Ҍ��̾Wfx� �t�;E�Z�펇��v)ɍ0�	g�#����E��nz�@�4��3��`)n �?]n��JմL>��n�oU�����uk0�>y
f;4� m�<[�-\GM4ۧ�(�h�UҔ�y�P]�v��}�n�kv'�!���`@,���4��޸\{�1<1������&jτ���\�/ݠf�4��h��|:���p���/�0ί��v�n�p)��uی[�xY� KH�3(0?hv�c��]V����dk�e�ђZ�$��4�\���'g���ͺho�v���v��ޓeJ��Dd!�n	�/t����<~:���t�z�V|?ȥpX����2�W�3x>d��y Ku̢�A!D�^O_&���J+*.�?����Į��t�l� X ��Z|�j��U�4����Q�o�4O�*L i���#�{��
�{��i���]�@F��v��6b&��˙�WUjE�)4>44d�,��Ͳ��z�v�6-úNͫ
>�������q��i�&,m�:Z	�ƕp� ����!(�gz�\PwQ������|�=������-����gFe�~�o��)I�~����[r�k�_��]168931000100023maraton/.git/objects/d4330601000100073862maraton/.git/objects/d4/8542b5b560939e4a263a70280b6b1a1a0b73ebx�Tmk�0�W�Wtv�M�(����2
ctJf[I��R��Y���;�q֍�n�I���y�N��z�w���^K��u!b��3"����Z�N����J5�U®�\�u�p�ֲ�RgE�X���'Z�	$�'UZE �+�f�RQ̄���A���>Fo����yV�/vE�D�ʤ
B����3��<Gy��U�ƹTI�N�̋F���d��V����5a����c�}�m.�Dx��o9�=gG��P��3m��WC�����jU�!�,��7��yG(�_�Σ_D��E޾hf
a�p��o����+m��ZY��Z�kQ4�2�MHS�eF8b*�7�������:�a" ���Vs�`��B�Ռ��2U�q<Zƣ��C��B�&!ZX�Ƶ��4\��� 7�Kg��l������Ԫ��X�I�p�u�D���1n�9�W�������,@b��zMr�
SI���RU����c��6O����O@i� ;�Q'M����o9��X�tx�p�="���-�������;[;�n��f1�J�&�m3[�ao���d�2c�?�>�d׸�}	P�rO��������gD�<�p�I��L�,R�m��фN�6x���N�dvI�'>Ko���7�.�O�.�t���-������m	ˎ�u���'�S��=���:�ip�����Q=�ǆ�3n�x^�)�ރ� n�Npp�١֩���ؕ?y��j168931000100023maraton/.git/objects/aa330601000100017062maraton/.git/objects/aa/a516ab777633768cf55631dc29da48d7bd5404xM��
�0�wk�"�ѱ�n�W�Z�+�iI�1{�U����d4n���c{�ҤI�څHJX?vS2:�_ e��H�n&�ah��%0���PX��
B�.k�`�ƪ� Vl{x��9Á�����9R,l@-���y�U��81Uo����K�)��7&!���^N�KE33060100010004062maraton/.git/objects/aa/d645b2803578a5be86d5c87af93e3c7d1c30b2xK��OR03g0�240P b0�l(ƃq�|. V�168931000100023maraton/.git/objects/55330601000100015362maraton/.git/objects/55/58f3a1ded599ba73d3a4a7fd0f9115e38e0a8ex��[
�  ��)�@��#*�ҫ�ݕL-�����?�3�}ߺ���zc�ȐSp��V+�k�lb�d,xҔf�I��]r �9(�39�-F��X�@l,/����F�HM�:�U���TL�U��X�/?%����f%��A	�6;�k-I� ^}G�168931000100023maraton/.git/objects/6633060100010002662maraton/.git/objects/66/4ef6c6bf64a71f3f0f78c79a8499a483b0b1efxK��OR04`PV�M,J,��� 2n`168931000100023maraton/.git/objects/84330601000100050762maraton/.git/objects/84/e4a60ffc179e85de6dd860076095d6638f23bfx�S]k�@��W,���G[Rh!�>�P�B��p:���d���Ξl���m��fwvf�EU�̓��+cU՗:5u�5Zns��kc5�?�|кn|c;2�|I&��	ÀF����ƈ��q|k��W�Jڵ?�X΢k�]���U��!�(�V��`�X|&��W�BO����r�۝T�ڮ\�I������w��w�0f.n��uv���N��ˣ3�E�ܱ�f���.�W�eTD_ս�@�I���PH�q�@��Rx
!�aB8�X�]���fi*Q��"M�-+`��6�&_�j��H�E��[�n2��g֌F�0@��bf��)>ଫV��5� 5V0����ot�7�Q�Qܲ��b�9�[��ß�	�bö�X��u���#�;g�/��޸�d�tϽ��Q �t�e� ���;��Q0�m�<�{^�f��̊�A�L����'�yS��݉ ��&n���[�s{
@{v)w��!]�\�,��O=�j��N�d��_��168931000100023maraton/.git/objects/2f330601000100084762maraton/.git/objects/2f/1e669be85f777731078486e41dd7fc48fdb062x�T�n1�u�+&�*A ���e!��K�E��.&8�k/�7Q���}c�JSUEH`{��{o�.S�Շ����o���~#e��R�+z�s~��l7������a�U�Y�;�#-Z�:QIB���\iO�}U�ʩ��#^WBo�t7�)�ҩ�r���\mIq4Y�i����S���a��*���^�/���oh�2m�<����`;kn�h�˦q�5�ݪ{�I�Gf�=R)n�)�(��|q�d4s��h���Vi��-�-�VN��7ԊXM3���2�;X�g�};����θ�#��#�T<aho����}&��6WF;��VnH8��
*{]�^@�֚z%�A>G,h�X����|�c���Pz4��)�B�iI��EXX����%>�E���W�{�8�Y��S�����P2|+�W+�0fe�i��$T�2��J�p�@�b��䆇�QKPQ��d�#4�u����GQSҘ,�Z�5BF)�,p�.�1�=���O��%�\M&��KvՀ]ez_��Z�ԛ��I��`.D���Q�k���P8�>�,�fH��+�b�w�����������$�!�gqc.�ׄ���I3����G��A{�Z��uV����(в�����׎R�p`u�:뤳>�T��m��
�<&8s�2��w����ɑz��M���,�Z/`@�a8$�N	)��(��r�0ܩn�g�Ҙ�J[���tUΘ�l;������E���zȌBr�>I� ���t�101�,2��$��Ac$)\aO�%A�G �+p�E:�x�����-�G�!G���{�| ���X�X�>p�q[�%`�!�9M�����^y�330601000100051262maraton/.git/objects/2f/23bbbbc9e7acd97545c4720358f6babdf15e47x}R펛0�_�)�����H�V� �A��U�8������S޽���qҩ��x<;����~~��I~6���AƏaЪ+魇�q֝N��)� O��t)��F@ɩN���5�ᐓ�q�0.�4�W��sL�&�!��ߕ��!e0�;e\��|���!��6�, b�6��ǰ�I�ߓ	dF�&4z�РVàΔ<7~Ԥ���
�;2_:������V���
��:�RX�Ԇ�\Jq�E�f���)��dYJP6KR,i.�XFMfO�[[mH��0�ҶL�2m{��1V't������p�!P'�fQ�)�u�8x��(�;�(B\�z�'l����0GJZ��Q����w|�qFA��:L�#H�X����/�}�S?<	��q"�G�m�����aF��D͓�{��b��-�@,S�X~���@JDKbxB��A[ �)y�J������̏��h�����)��b��<�ny�9�"c3~.|
�ϼv�,	̑�٤�~��渓��y�ZY�D(� q�_33060100010001255862maraton/.git/objects/2f/b0c75b86ed080bce4eed67269cc7accbecec32x�{|����I&t\c�6���6UD���+�A"�I�x�$8�5������lȖ�nkW�b�ڲ-[�.��/����ѥ-m���ڗ���Җ�Rg��̼sIP��>����9���s�˼�5�mkʧϨ�5��Hp�"���أ�)t��T�ظES��r�g2/qƐ$�����,���E��99������|7��B#Y� ǡ��cnp9��S��'�;�ɗ�9�)T�c�jW�d����@�S�r
_҆�Q�Di[΅�rZZ���œg�N@�2rZ���=��iީ��寘��� ��ؚk��n��&�*:�*�i�����W�W�!u�sJ�2Nѝ�_�ƭ}��>�3ᯱ�ڶ�ShqJ�+��K�Pi〻�������<gr��K�)^��f����=�#��qpw��C�³=ʹx�E��5���,��Y�����g����~IV~�=u�s՛U��,�,���S�G��n~GV��臲诀O�����G[/woŮ9�� �r�8i���m�󝋝�<t��76���b83�p�����pg<����MµMw�:�M�#��M�N��~Y����$�/[����TY�ܤi�)��ś;k��UU�HG8���;k��ZҦ��t��m��HKMC}8X7#Z���)W�Ж�s�����3ZT[�V�kCW$���n���__�6E
�����5\����HN�i��p<��vw�����x4����֡�RMw4)��,>;��F����X|aUp���j��cM�1innk����+������i��7�7T����u��Z��jlI�Z	1鸻�oUNxE��14Q�ԙhib��К���FT��lj�e��a}�!�>�6k6J�ě�bq��!Һ�iijii�@g��c-�X�s����΍Kk�/O��N]�Ӫ*�;V��7�&,�*�U�N,�����\K\�ǀ��|QG�ʵ���[�圡I�u�Qa|�G��kE��,;O��L�R�T�E�\�w�7v�D��R�hA�8������wV���)�_N��?�0�*z��.i_ y�"�8��	���i�@8�,�@:U U
,f�X�8��u��"�\��3���d�[*�����z��g����{8�>����^E�>�L&��w���L��"�:�3��J^�$$��ryl�b�+DʨЎ(\������+\����pl��E�h��;.Z�N|��E�J�7+\��-x��E;ѹ��V�h)�X��E[ѐ�s.Z�"�s�Rᢽ�j��.Z��@�J.ڌ��(\���ě$\!ڍn|P���V�.ڎn�_���#��V�X�Z����7w���=t"T_u���_�>�2�������ɵ۽�z'L�����E�W7��Ԙ��J�t��+z~�=\Br������ؿ�/>��+)*�S�
z�~�����x*~�>U���`iH�|I���}߽R�l���,!�n�/�ރJI��&�n�� ^o�/%���o�c���f(�TUKPL��;<)��O^������	�������|m�D|~�>��OǄ����H�v�5��Q���0��X'��P��o�Q�al���Do�W�+��4���$O��������k�{��E�a�]D��|����{�F{����;��瀞�YVO�dU�pq_�h�K�X_�U<����~Fj&1�2��nʸ!��	e��R5Tj�ӽ��s����-���\������Gz����:�"�S�4N���w�⣴;x�w�Q�H�nz;=�4�H���<~M�~E��U�~��$!aP'�!O�=F�q��{�����-�����>��>��!_�0����ѳn	��؃"vop`Np�޲���A-	�&�����C��r$���������ݷD��H(:Y�����*{W��!�@O�(P���ð��*t4T���.�L��_C�u�[��*�\6[�eВ	�-���[���'8��k�����V&i�q�(�Nb2G����O�E5%��4����$Iפ����n��`���Ɯ��{�����!�ĔtQ�N[MB����۲��=MRa�wq�2�"w��e��닜W��'zM�ހo�G���{��I���������1���6R����p��i������
�7���n�T"��+��E+�o�����Ψ�QM�����H�""�;U��5�uٔ�S~P'��i�(r�e�:h�
E�u>�m*�K�]mW�D���[�}_4鷄kB�S$�$��?Xr�LU�k:��г��I��z��v�#�p�RMg��7#=œ?�(K&`�M��d����)���a�N2<�2j��D�@��_�o���!���4V�'�3�=fE P�~ڶ'5MH|J&��L�0�����]��,*�� �w\_p���d�}]���Nؔ-:ee]21�p��ؠ*�	��1�r-7m�D}F@<�gb��N�v���C"�R%�%�n+�PUop���=c��E�j�{��*xT%�q��e�6xt��c��+&��W����,�ؔ�Jlj�O&�I&�&{�M���ܣ8�4���Q&�'erF�B�@��tπL4T�RU�2��uŒg�`�z��G�z��'{B�c���������D�O(a>�0�2t�l8��<�d�rk�{ަ�۔+�8-/�M�����H2�|21�L���T��C2*>�y?�������Ϗ�0�����(�']Ĳ����'�K�h�qw��Rg�����|λVօ���:�TE�=��5M�����ŔN�vgXْx�\�t��t������bQ���:�G��!��Ct�W�sH�'�;p�s-�d��)>p|������R�\�a��!��ݼ�R�O&��)�����,K&��0hb�B
�])q��"c�i���4]�fg��.h�xXOu���#:���pdc8���`�؀���\����F�'�hi$HEMj(��t�t�7�/K��`i��x9�ܱ���k_˖~���J�2W�MͰM������1���Xr���	�fxCi������̫R
-ʕX��M����G���-wP&��1E:���nKlx�������Xsum_�Շ?eT����g*�c�g4�[���ɱW�+t���XY�]��|�=Ъ5�T'��[�n���D��{L�7�`�'��� �6�H&{��E�1Z��Ke��˺�-v��ҥjx�i>tǢW�7(�����T�����T1��T�H����N�s�D�ĉ���TbF�]��S|��aH�x�HiV<�:�+�آr�b���XO�D���UJ��(��<�Z��yi�4��2�W�מ���`iOp�� �	*�V�v�n�K���O���$s=�]�a��e����InW�(����Q�%K�(%#��ߔZ���[q�cQ�?:�5�:c���ߞ���R�-���� ���(�p�y�T$�=زL�������`��=���yB&��Z��[vy5��P�5���Ye�`椽X��^���e�mۃ�E3��lS�)�aF^+���P��dDC!פ
ۂI����� ��5Iz����aŗ������+N��8����R�̄6#�b�c��ˢ{���XAf���S�W��A�D3F�xŠLS�XU:v�����{밊o���4����
��\�f�N|F��JOѓ��sѩ�R��T�0eޣ�x��Z���H�N���~�}��rʽ�˩�J��N�8�8K�j��̧(�4cy��Wu}:�ӳO�\gJG+��w(��Hl�0�)�|N�{���Z�R;'w �g��~	��{ӳ�y���5�~�H����xD���X}d�iFԌ8��Q�rU���1��_������
eGe'lP M�{��:��zrOp�K�;��>4ogf�+��'�Yk��x��m~]W���	������m�R�iT�X��kp;Ҵhܰ�И��r��]g��a��u~w��T�`+�]�+J{/��fk��o���Y>�i\ʺR7���:v7Q�L0�R\�<���EU���W�H1ݟN�>�٣��i�\�{��������܅&��iȭ6�Z�˨�"���^��:�#j>�������{��Mm���H��MxT'/�-0�����5�$v/� Đj-�6e���#,rm!e�l�X��1+{d�}��]N~O��m;�T�xn�J�Z��T63���s����kAf��uJ�Tsy_�Y���ib���c��VKJ�fz����/��l�P?����Gly#�v��f���w�V�u�̪f���M�u��ԡJy�Ǌ�vq��?g�ʺ�?d��})7��t��޸��\b�!� +�W�rG�m����^g�ӝE\�9�Q�k76�K/�z�U۵�=�d��ؿ� �7�*�J�;'�!]TY2S������<Y|��d�Q�����M�d�p�4�����,���e��ej�a9f� �y½]:���j�Z:��ɧt�2�!�'�/���e�봞�N��?�ٮ�T����`1�9J�/P��][M_�&7�;��a��c�Z�86ZХ��JO:q��N�dr�k����vHOM�J}��\������.j�;�2��Ժ/�1�&��t�iI�9����&X���]ʠH=��Y���{���;�I<>��d�s+L.Yr��Իݳ1��h��SzR�#@ʇn���C'��&�A����Coj��C{��Xe���S�
�.�����Q9;tu�+J<�c��l��]�bŅv�GS�Q��E����R��K�t�Ǐd�K]U�N����T����"�d����ڜo��w�hP'/kF�@�{N�l�\Ҹ����+�x�!
ݿ�C��}���yby����>�fF�'��r�7�S���d���K\0>q��+������>�C�9N��o�js�߇��o�G�\���,�7 0o���ܹ����F�:���7;��m�@xY8����mI�D�㻸��Rf��SnlM��	���0v��8PVOb�X\<Ơ����/��L�s_D?0���p)�^6ob�x���	x���R�u��<O?��O&� ��\|�#��@?�\cXNM����v�6�v�����G�����7�XTE������N���������7��������˸�d�xX�gθ���4���2����� ˁ�����[�]L���<
�<|8��Z.b+�:���ہ��� �~�]�Q�Q���4p*p�x�x;p;���c�W��F��������D� p)�ab���� �F���	`�K�q��V�l�����v|x��*��4��rF�qܷ38��
�	��Q�ව{��� <�=p\)w81��^	\���|���x��p X�}Bo �K���e������r`?�:� �(7>�
|	�XMPn�nn�~�<�U�0����b�G�
\\
���W����eS����$�d�=����Q��_ V��wp.p/p�:|�j�=���~�V��rR'pN�����4�ܸ�˹a��WM�x���rF�����+	<P0�����R�.���t\9M���o&��'������R��'�Wz����%ٷ)�Tq�.}���a2���_��8d��H��]�XQZ0��~��T������r2��Ȼ��Ң���`la�1�>R�=�@eW���|����Ȟ��^�&m���� �������T�n4M��D�_#/����K˹�F�K[��?A���.�l+RQ����I�>M�||�VA��u��jO]���	Զv���;ɿ��j;}���â�
�w�P Y�̐�O����đ� ��W�e�$���i��4}�.����T��0�_CI�'��
=���KY��z#��<�/�.l�극�0F��x��_��[Ӳ�L˲�I�#�����H�~�����*�L���2��K2e��c�7d�Z'y?��7�%�l�{r3I�ՙ�k�kF�K�)�Oo��Qxq(��n���˷��3�uyo�:e5){�^=�A�)E�3?�(t�+U~UZ����^�׭���#\��3ym�(m�pnS�'��}ϓw"ש�V�ے_���{�m��%M��У��kR�@�\�2/��t���C�g��)��ʠ�[��0Dd�_�"�H��y�$�x�02T�&���g�m}��R�U�N�U8�6�PF��E�{�7J)ݵ�e{�!��|A�C�����.�b����d�S��}���=�I���OA�o��������6�C��:%��wA�>ϛ�o����~���c��t']��4���˽t��L5�+��t����R>_��L�ЋGit��<o����.�P�!/]�I���H;2���|#����7@��tRz��rH;2�o���K��ƾ��v�#�6�{�y�u��_�G����Ô��4f�('�1蛠�拲��N��:�6�Y�H�x��s�O�CK?�g�-1#+O���'�g1yF����BI�Q�}$��
}&t\4-�g����Q臠�Ҿ�4z�v��
)?��N��@/�����ņ>����B�#�o+�?A��[��Ҷ������CЏAϘ3y|ۅ�3��l^x
�|q�d���(����Q��B�|�.�o������z�(�2�|��v�?D�3�t)kٝ仜2��N�C%��C��Bп}$=�C��1};�Q軡���������dD���z��=�����:!L`]��(�\�>�k��*�S)K��v���G���c���UR�1��п�9�����JC���[��^��gO�H>1�}�!�_�-�1m�A��ٴ�WwP��d=���=�6k�;+Jc�ő�:�!���.q�Lv,{#�G�K۱��3)�w��c� �h��|�$�>��Q�_�"�U��-i�uA��Hvz��������Gw2v�x.ء'�� uIll����̼����B�#��R�t�{1?]t^	���w��WR�Pἒ���Jʺ�����J&.,���d꼒�e%�7����_R:�@I�%�yϖ��ss�P����ԑL�.��=�_���E��9��su�GZO�P<�h�3��[^�\4ͩ�x�
�W~���P�Q"pU��Vs}Y�Tg���,�qVg�;I�=���I�Q4�w�yQ'�5� Gҹ�w�'|�����������+r�.7��l��W<��_�y�5Mf�,�r���x�y>Vt��t����9���w��Au�g����Y���Y���Y���Y���Y���Y���Y�����m���vE*�W����H���El�:���5?O]�^���N�g�����=+�]�?��l�u?� �z{7�$��>Y1l���qk�:�ghg��=��r��6��[~���g����֒z����m7mդs�M���m_mo>�e}[��?��6�������K.��9�s�Jε�8���9��y��G��s�zyK��'�X�h�'�gTTWT^=3�����fVTVWTUMф�i�U3+gVαe���OP��[
�;�4�w����J���K��и���'��]s����Mѳ�kq�?4Ώ_�OW���^4.�M��C��5�WF/��X���B�]�3�����R�X�~g��Be)���կ3�܆�����!��q�.m�7Vh��P�E��S��=u�mI:���E٫��κs;��q�����q�+�\���_�ů��w~�T1��h_j�k�Q�>��v^n}V��՛��>r��I� ��M@�u�%��@���%!�C���\���S��p��%A��\�H*x�<~\�7�] <�i�R���I�x�S%��>}h�Fp+�D�w��/�zp�_>�ƿaB�?ʉNq��|Yǟ��W���,�����eV��� _�������y�����]~#���k��:\�����M�A�/6���q��O�.)�ջ�ء㩔�?��(�g�W&�BG�E�����Ӿx�П�2�/�J\��i�V�?�i`����/��s���.�@�\"��_�š���l ��e<�>�՟���??�)�1�v�r��Yx�'�+�I�[�)/�)�g�%>��ݓ;��X��=p{�N^��Æ*�G��b�R_��
^n� ��G����"��t�i5�1���HǘC�{(�{,Z?��ׯ�wc_��+�_AH]��i�� �o���� �U��&����@�Obs�^y��!����n߇>m�����O��g�+�3��_���J����%��?�ߓ+�2�q�����W��/}�;��ݠr������=dPZ��$.�]�(�����𙔗H-����w���[Х[�>�!( �o��d�z���T����>�{ф�2�����W��@�8.�����!�V�o$���]����O�r�?n�Y)�����C~�w_l}�2�M�,�.�w�oA?����{��G~���=J[�_��W� �`��[�я�%�_��Y}�?�=/3���op�����׾>
�?社�*�^%J�Ɵ���������I�I�=�4�ɸ(��aJP��$^\@gM ����M�+�������� �<�����w��"��|��zCP�����%��B��3|3�mBg|]
�+�e�����F_V�rO�jO}�^1��?��8���;~��{��E�	趽���� ~
��{%����u�wP^��������ǟl�C;I<��6��?5�{�e��������C���@yn���<���*C?��>�Z}-C4���J�c��8�}�?~�'^n�Ƨ/��}E)+���k���ki��ox����7[�w�����Upk���o���ػø��J3��dp�x4�*����-ra�/����/�{��G���tpo���i�J�y>~�ݬ�g�������xs?U��@�ŵ��� },6�'�7`�0�>p�x����fT��	T_��z���~槠��;wH 3���w���V�_Ȣ�:/���*�3��|xG�����K�	�����!�T#��ı�b���}�>�G3����ǿ?�?���w���
3W���3�@W�o�������5�Y^Jy׃x�����πߎ=[}?�������W��9D����|����D?�{��"���f��G��c/k>�2�m"^N4x|�i���{=����{j�����WP�\�t�x1�(�;���4t�;㉵k+x�w����5u��e<�2�p�%� ��5��ƶ�]|9 �n�	�N��_C[K{sS���b�4V�y3���Zc�HGGd#o�wlt�vDZ������`<R�BO�������v����X����R/ώ�rI����M�x���Gx�vc�.O4(�2s�7.�y���I�	ׄ[6�#��uۋj�-�����Օ�5����֦�yѢ� �&�7iP
e0-���$�7�;ᅷ,���f��/|�^7ޚ���]U�[���/!��R��>S?^Y���Ă���HW�3��ɾ�|v�5%moZok�X��S#�7om�h��b�#^�Z˭8�y�z}�n^�nR����|�7������f�i�p�4�޺^C���%��e�4^#_5���olo
�MSm�sZx�z�T����7L�ɽ��#~X^��L�Y��2��-�by]U~y�<���w����(���s�z_�.o�!��a^�.8�
�e�mg�|�n��TQ>�᜗����&�7)��˾�_T�ci���ƦT���U�Cu������X��u��T�i��+bk1�����v\Y�:�5k{��kaG��wݛ�y����^����࣍M��mk�0���!����7t&T��)\�I��;2
���p�2�`ݬl�f�H,�gj���@�9���c�5�b�"lʘ�%���Ƀ�D���p��E��:��$�2*PGh	����;���L,����W+Y��Z�-�#XNV�Us���x��=�t��K�����td�JG7H�^OuXu9Q4���T�|[��9���l��)۫9+#1��s�M�)�G1�R�ֶ��w�j�y����>9��19�+g��*v"���kc���֚P��'�F�"k�(�d�Z��ć�i���޼_�;��E
寙_�	sD��B{��Y-���6g����U��
Ӫ�M�)��Ckp]ʙ=���Y)���.>�yT����7��3��ě��wG:�8��y�;n���ˌ�5�FNO76��F�������t��O�d�)骈ϑ,%�Ly���a��,+M��]f�L��cHZVko5vf�o�ۋ���.>��;_Hʜ��:��ˌ���a95^d��ԓ�/9��F�����B��;�PPv���5�VͰT���O��2�e�t���[��0�'�2?�3Jq��C@�[?7���M�uDP�ܪi���7FXu�&�;�m����Q#��DFhY"Ӏ�:;]��[n̳��;��n��G��S ��s�2_���s��ٽ�5b���Zn��#�H����=�g��;b�qQ�7
�Icy�=�V3=�'�T�L��3 ��ҋ�w��� vN��<�{�s�Z�XbۆZF�P�1[�U�֑f�Q���:"'���wi'T3=�$N���B�9u�#g���k�ad~�����M�G[G��L,{ь�"!	�����v"�hK:����e!2JhI�d�T��c�~��X��d�DV50F���@�ր�>�e4�l4�H�5UR�#�����>R��(!��Y�l?�Nύ|d=��$,��fϬ��J{_�K���Xӥe�u�釚���G1�e'���۲g�v���"�Z)�W��y�=���{K�~���L�r��Jv��������#�ޫw65��f�NLԻb�}�����	�i6����C�7v������K���o�>A%�����lu���x����\U�	�ai7��T]�1��-OW�ooM���X��MF�.��*	Ų�=t��m�_��L���;��\L-�j�0���udU���,.rD4��<9'��&���@d�j��#�s����2{�j�?y���g;����<km���C;X�nwsG[=tٯk�4��i�Լ�3$05Ύ3�v�65�	Y�:ˬS��d�Yω��NN���x�Nw�3�v�����z��6��>:�NC>�̻�`�ԥ�����<|k�?["ܚ���l�[~M�Y3�r5���rG�Ԩf�q�=�a_���5M/ �u��'^�T5I�u�,��g�f�����J�����ɂ
le��%���G��O��H־�'��D�[
pd�"!�L!&�������Wg�}'�<޺sz#=3M�&4-c�����kF��R�W�[��`F�Բģ�,Fr:�c�ٖ��[�`�����P��V��U9�ȲE���.�v�~9;H��.U��l�g��6XS__��b�y��ON�8�)|��#����i+�-����r~s�o�)�Xl�~B:[X�l���Xy���9�vo��ە���Y
�(�ͻ�凑�c�v�5b3K�T�|��Gn>��N ت��ȡ�e^����Y�l2�|`;[a��o�!8˿cY?���)(k��҄�\�5{O��J/�e����7Vd>�=�r�,1��]�����DgTm�3�+o�����W�i:�>��N�L25˼1 ��FVa��E/C�v�T���R�*|��í�
��%:C�;����1%g�N�a����O��W�h��]ۄ�74�[�g���Sѹ�%Y�wh�W�L6u�;�m�
>�~5?���@*�$b͍W��
���ΨSѸ���4�wh��Mϭ-HZGS�����q�B-�*�������W��!O��ʊ����&�H�n�_o~�G
Ū2};���^�k� �FZb�k�K����W0�t*�1�E���8�(ne��
�3u?���p�i��r���.���B(��r�r���'��{p��*{�|I���mR�</��|�\s��:$���9�E[�+�u�O����� *� ;+99�>yl;�<�e�+ǝ����乣7ip&׶]I�s��M>yIޑ��4iWڱrl�[�UyNI�u.���$����)��s��K�ɷ�k��-��>�'��
�Ҏ�WG��sm��C$�|�<����l2
��aO>y�����L>{��'�z~f�7�R��s�v��dy*&}X��b�.�y�q�LgK�|�\�b��V�^~ϓO���}*�������z��sY��s��0l��'��ʮ�R��9��Y]HV��\s˺�'��&��y��D��P�qCc�|����_�?�2iRT������`���'y��|�9���fɣ�2[���;���[B&I9��F�m����G���ZI�}*��G{MN�"�Cv�<��a/����1�[����s����C��N���r�a��_9^��330601000100019562maraton/.git/objects/2f/d487821d6c195b0af13f2905b96b1c6833f208xU����0D{��b�������ɿ$����J�}���Rt��Q7Ln�ՉΉð�ѧ)�9�c�%'��c��6D����N\�H��jux��JF�
���]Q���Q3ǲ̌�Nf3d�#����SWI1����4�q��v����7'�K�F��sl[G��`�Ԑ�iT�����b��>r?�����"%d�D�M330601000100027562maraton/.git/objects/2f/b373499eabc51dae3b6090337f0e0d7aaffe54x]�An�0E��O1JU	D��U��r��8N:ؕ�(��Ui�X���[��=�g4��-�v��U[��������Vqhn�a�wtS�����2��9��
M�����)4Ea�2+�~�W~ =�;��0e�9�ZQД<�m�$��N����E1�$�W�`�r��#�,c����9T� ��%�� �;����H�Hl���N/%����yڒa �@�+���K)�#�~�P��B��ξ���	�ͥ���/�5�- 8�{g���Ŀ�x�168931000100023maraton/.git/objects/0d3306010001000363462maraton/.git/objects/0d/a89307bbe64b76ddd93c5cdf759d25438843cdx�Y}pT���X4,��ղ-��Ⱥ��Ƣ5K��b����nؕ�n�}��
���k�):�3��0mm;Ì��iikk0H���~Lu�!����FI�����w߻a�f�5�����s��{�}��{߹g;b�O�o�O<�55�l6��]8���NW��Jx�,�\,��4QV�: :�J��9@���{�.�U�$��,	L�%={�$�e�|�-��w�.�Ft�mr\�Q�9��:]���$΋c�"��ؤz`����g�<W`�_��A��; ��?�������b,탉cюc�U�h<��M%��M�R�a��7��6= �-�w��y��J�����+?8�Q����j�l6�6�+���b�J�+��L������'��ko4]�liD�;[exC�U�Dp�?`�o+꿦@�A}s��Hm�k�>����������b�����s�����v�����(�(�?	���*e��+W�EU]�ѕ��)#�4t]����єN���T8%���f=NZ���u�D<�舅M���{ڌ�`"m��Mm�XJkihmK�� 
�C��`�QY����D�TcP�ZѶ�#���D�H�]��z�O�ڪ1?�2j����pUc<j�Wj=ӵש�h2��F�k�Ѹ��|��E���I�0hy�q3\���t*�����N=٩w�14{z��F�|:;Z.�
`�M�����^�T�j�V�]c��K_�层�͕Nηʵ>u��,�=`���^=��h[�D���d��Ŗ��r)�!V������Z��ݷk�?G0�	c��)��g�'q���4�K02�T�\��399�rrl������1��#V��,ZN�3��R!|�8��2c�7�ޡ;�Z���|>�o�(ɽ�Ye������J~�=��\����2�(���Qt�/��"����3��g%�L#�H�G<�%��#ˉ$�D|�{$�Dj��%�Ej��K�'�l$n���� ��������93����ב�}N�[#��w�r::Lt�eW⣷�����/sqF�£4
w����^f�<BA~$s������~�:q�-R��E{������6���Ƣ_Ȏ��dǲ��fOv��KT�sK�<��J�r�1�%l�a�΁���-��j���S�=B��МPK^�<�F7ٲ|X��-��fm봱��Ym��|�j.�ˀ}��6f;�6pf�9L�����mm�Զѷ�{����xjqEn��<&~J}��鳧ޜ���c�F�6a�4^`~$Kw��j�s��&�i��.��J�m�v6n;���PS�o.��$���̘'|���>m�r�o�o�S�δDj���k��Ie�3}��ب���q�1���F~Κ��G�,[q�o43�8��C�O�n9�y�bkKn�|�a-g>���#_�FvK.������Nc3�1h��ђ�dN*��l�~&�N�;����|l��P�_���m���!�gv��k�>\����>3V����R֝��&#��4%�e`��m�c!p�Y�z`˝[�r�bT��k����l�����$�9w��Mf�'�}j�w�XV���)�
Egި���%��/�����M���/��>}���y�ys�;t�j�P�	��ֶȱ����#�k�;1�=�+a� ��0���u�	p��8�F����w,��Z�m�˶���܏v���`��p�ܥ�͹�p��[��~u�)������۵Ͼ~v���W`F�д���>���6���Ӣ~�#�;��aOﶟ:�f����:t�ͧA~�=�(��H�rN?As�򭦜����ۦ�~w����q��]�)���D�������n_�۳�]�r��O�K��n��7>o\�����z?+�y�3�=��	��Q���	�o�S3vD&�s�x�r"Y ���"pv��0	����>�'�)�ćhFx'�	{��~�+�X�/�}��$BHq-1�e���d�Cs\���!���q����ׅ�g��O�h�Q׀�U�@[A�����PW���-鸑���Vy}���U>RY��Uy++W��j_e���w��[̙'`��}0��&6O��Sr�5A?�r�@?�Xz���P�q�/����/��������&��3ׁ�����s���g��!o�f���y;7׏�ԣ��z21� B�"L̷�o˔�o�\w��
�ugb��=:����{uD(���ru��ugb�,�r�0W�y�!w�UΚYb��
;�y�˾���;���EX{����q=����m���
�\<�=KL�����m��X�
��<����i���`��[������%��*�?Og��yB�,
�O�S)��G2��j��i��mV��]�X͟�X�/�׏������������ �2g�`U�:�+Ęw�<<�aT��A<R����"|��;�9�� ����9��}���Y��f�K�@��a�͓E������?A�,�� 8��B�>���q���n�0�u�b�}�xx�Ib�o�����k&c9�_ ���A�y�Pr��E�.���r��]$�����%�K�����~(�nq0�;�>Λ`�H��Noɕ��Z��ƶvd�.%�t�K2���J�;������H��@�W]ݱ�y����Jzg4��d`���]�3�
�tW�.t)@:4��TS�pO����]�&�XU)F2Xl�bчFi�@<�L�Z�ľ(�R�6��7�K�Co��{�J�-���fM�6�37']��H���FKac}딝�m2f��M;]6s�
d�O��wo�77�M��jke��P��]��� fI��bz�J�Si�a��c���#��\Qz�i�⁋�m�F�Mg�	�"�2�yyꏪ�'8�P��i?���e��{k��;�ԍH:����G y�ަʏMM�z��U3�HG�KK�H���s��F��N0��EƋ2����5-[d'L��	�Ԯ.#�n$MQ�hI�n�'��׿�q��a��#�o
ѐ�E����v�a��FҔ�)�ˀY2��Y��+}�Eջ#��-���NB���X�>�	�̮��7{���A�a�@W4�$�G���^D]8\x�����?98��ߔ ��>GK��<��o?xPWŌ��D��c\�\D�RWz��_@lM{�7C�
u+z��bTH=ơ���L�1��
��.�d|
�{�*�z�����u5.�I;A���x�(����q9�,���R���bԧ�Q���z�A�[��{	������\9�S��uUԸO�A�1^���N�P� H�1�����vU��J��� ��|P���!��c��DoE�R���CK�~a�3zj,**=Ɠ�G=�y���uU�ޯР����W��(�a`7�Sg����5�y[���I�)h���F��HW0NE����@gjm@���^���d�����{��4�h��=��p�B���Ǹ�
z�=�$����`�{3�|�󠝅?W��'b)譵�d��x��>gI�brVQUr�[U����y4���$�F�����ۂe�Q��F168931000100023maraton/.git/objects/9133060100010008162maraton/.git/objects/91/dcbc364edd2d3eca521445e8f6e37fc1b14a7cx+)JMU0�d040031Q((�+�d�vc��m�����.�����h1��83�,����+B�/y�=����cD��EG�: \� �3306010001000560962maraton/.git/objects/91/e18148a8bee5fb00817f002f7e542e6a4fe660x5�K�#K�k�jk��_�N���Ϳ�ֆ��Ȕ!w@F������{��o����^����q��������.������}}����w�>_����s�<�����w}�.?����}��Ǐ�nz|.����w�|�_[ޮ���}��|�����~,��v���������c?�W}���~|_>;�{�]��H~�~__�}Z�~�����|�ӯ���y����q���׮����%�y\����B�?K���~���������&�|>��|�����,�����qЫ�Ͽ��ooٖվ���u���w����,���/��p�-N��%��]o��� ��s��.����q�6�\��\�>��,�Y���Z jK{~�� ~�Q�]𩢟
�����s�D����	(�W�G��=D.��ħ�Ñ���/�|�=Kٞ���]��&<����CJ���7�E����*k�PwYb��K� �d�b��Z���Hs�_^b�6�������J��.��$ ��������WV�"�	�T��ZB���_���뫢�䶒Ŧ�������Np����ۉ�������#��l��g�<
�(�.G�[�#L2LA�Јᄨ�H���䖋� ?}ܧ����Mi��B�
��*��6�19C"w�y��[��MOx�������P#l|�,� H��wk�p�{ ��H�]Ȃ���9�q�m�7�s���LdF�:�&��f�.ۅ�ݨQyoD0��p���n�1���  A��6�.��X}�Gz>���.<�=��
d���T���I\ҿG!Y�7����<��d>��I5��Cʢ <Rλ�[:��<���Ά��.88C~�����i?o�vH����Է�1��ƌ�h-�:��p��ޡ&X�M�����g���>��,�J�tj3a"sSykj�,�1�J���nϫU�����E��2�����,�2��4��~S�O��zl'Y�� +�O�X�f��8$��
q��E$oq4�'�'�Ow�.�,巆��Dp��"JQ[>�t�Ir�e���:,��3%@�HE@a �4��qQe�q z&%��qL+��y/i ���95�	�MPy~YG��*��Et2δ�؋J��.���L�w���i2�@a�T�� �D>F� �+���j�VX�=�P��P!�[����)�B�d�@L�A����*u��Ԩ���,�W)���1�����T����Dbȏ`iέs�
�3��0�H�n��ߠ�K�"b!!�SƮ��_ØOu��+����Qg�,�� ER�Am$S%�pF���aʚ��F/_�K����� �5�vq��Z!�9/��.x�4/s��)�.����;�d\�"%��P,;��A]��&@/�Fĩ�Kk�JA���j�<��Kˤ�O|]rZ�}��B�f<�����e��}�0ہ5J�QZ��K=G*���nBR�Ux��Ar���#�p2n�	mmY��>�/�����Q��,��4�Aǚ���}�ݕ���ÑTems";����� �c�W�����:4*�/ IRT`;Ⱥ�s��;^BW }���Q7�ɽ,�3�֨��8\�{�TP\�Y�s�aO�\u�5��`�L����-��a�Fd�L�X�� �73n]�of_g� $i�b��h�=&/ay%7���FYQ�e'r[��7�8�I@�ܐ:����,���c�bhbC�
��7��y�`�b�x,_	V5iZ�2
���Ԉ�`�tZ�:����5��B,����ܮ�J�f�hs˥�:�=���8Dͥ?�a1�pJU�|'9k�+�ɴ��D�ܰ"��u7~Tcd���	�M{�`D��8}��3�m����l�Kb���3��B�"���ǡ�k���g�>�	;߭LC����G�=�4�N3u]<!��c�4^]Z��86�oO�����Xnr��CQ�#��^3�ڧ�5E7'̼���M]�Q�\�Ĩ6�#N�&�(yf�`I�Qag�M�(�������G�:�*����ȃH�$_�YC��pDt -ǯـ����h�������D���Y^�EUP�)$P��~?u�|����1�g�} �Jy:���"�$Mb���0����!ٞ�����ܑ������b9��b�9;�='ր<��4�`=����&��ِ��Y�Պ���	z��t<���*�a�!>E�*���a#M6�4��Ks�j����&}��!���Շ�I57�]Xq��bĀie>I��Ie4����EE��M�*'`�L�R�g�M�󍍹t��פr���&��:r�e��� m�ٙ�K��JJ�1�(�;�����{5����� jC��0�Pд���RF�I_{;tdO�B�0�Lf4x�S�Z�7.�8k�R%�m���s��ۄe!ӑ(wA�a����
,k�{R�L�8�F�ؙ����c�`Ok[�'��1xg�p���!�E�5p���?F��(�@�B�:���;*�{yʪAB�٣&���EE��	\C�}��~A�����zh���@L��I��1s-���$Y�q�d���]��.[��}B;�}<��5z����6)��ez��)�0 ��K�,Я�	&"!!���Na쟑h3�ܰ6P�]�Z�,�*��ܷy�n��g"G"ᨡ����D9>pP�����<ӹ�@�n���c�G�r���D�Eǖd�\c��C
Vc�V�1J�XE�4K"{��u��?[v�$6(MX�]>��q^�R�o��M�����!�4ĕK޵�H��}�b�=4 �����1L��V��S��Fe���<�ȏL��g�u�L�yH)	��|&��DaJ\mhjĉ�a�b��#�b�C�г'��}t�ʽ�0�׉�$#�,��إY8��H�䓊���C����ә;�J��CY�yz��T	�c��$biԈ�Gl`sv��N���*��8Vl���us3����݄Ϙ�����R�W-C���"�9{��[�I�1i�C'�׏g*hx����̲{�]���ZT+_r\5t��6-J"�;�=:�~6��_6�c,3l�d�n��sS�nƔ��縞�H�tO���g��k�%�`��˽��!�6y8?w�Oi6G6¨~��!�� ���si�0�8�`$w�\��"9s?�e��i�@���CW7���Dh�N?u`;��_O�6�G�zm��㔾��q���l����1$"/u7SY�L�懲��+��C�㴜�"=��6�^:�#�E��G���tb{��gfj3)����׳�!7P����}�<�
+"�ߜ`L��#�&�M��$؎#�d=N�����~EZC6�Dq�p/K�gV�� ';�̅q�t���^�@<��Ix=u�1Y���x���h�ii�8��w�+�l��i!X��#q���۶W%Խa ���A�u�$��$l&���.��LjP
�9�-t��G��� ��B��.s�H���p
iZT�5�F$��D��XK|�s��āU,p5��8hn.��Nr ������Ĳ;��r1��� �:�:N��CDv��:�J�D�ʿ�O}�r��P�����c?^��=�ԋ��NO���	v�`#���=K��_GU;e��)XPx�W�鴚̪U��r�>��Ƒ�T���f�8.�1%F�*Y�#d���������)_W�릡����3��㊠�P� �;5XN�Dڼ��&C���r�l�*����J��V���k
���M����6"���kf��w��i<�T>cĞ��`��Κ�[���I9Y�\�R���`I9��4�=��֡�jBn' ��@�v�-���/,�h�^��% !ʥio����g��{[��=c�<q��k��C��3X� 2e�'T�QW P ���SS��5�R �5J$,�r@�2�	c�Քqjx,���nX��CY>�r�Laa�����
�$6k��z׊3�9+O嵩��ȕּ�8��h��]���7�#x5��(D�����Vi��GPع��*�r����AB�u0;C�����0���):����ʇ�
��m#Ep���yu�L�r�Y��*$GG+�e��dF+4�̍WnR���\���a����(��H
���nB1H�Ί�@��)�G,E�(P��;Ck�U+KN�]_�U��4g l�^��x� �w-#���d�Ο*QX��X&�LN��ke��̀-&rr6Pt�p������Sb#E��	@<R��h�3�Ɓu+ӳ@@%�h�˲Q�&�� &jUJ�� ��o����j������am�v���J��P5�$P�Q[ͪ���؅��������ڙ.�U5���e�#"���n�w�i{��[\�ޒb�>K���$��*;*&(&& "`b�i���e�f���<F#�W�+���������"�㮮�Ɇ�vR����tW���%u���GCW4��̪\�~c�$ƮaǮ���ڶ��q+*�����Ӱ��aM������q0V�?�"��$W@���UQ�-G�iL�Ji���[����b��c�C�І0���{��:K,��Mb(&�]�QX`�(��6� }$���w>�ѝS��|1�\1�QIOIr��i�� ���]�9`m� ���]�!��+���V�ݬB�/%':��0��͹-p ��3s
>hYM��)������%��$��7���$ҽ,j�u3[Aq=cT�|�����y&��{D�b���L����P4G��F𣞈�P����ސ�a8-��F{r�M{�9*7vȴb��pZM�d"9ZI��@Eӊ�����θ�&��s�`oК�Ez�0~xZz������oöM�8���u�O":4햳��y�ͦM�e��i��i��@E�9���p$�	'	���i�s/���րmr��6�h�������:������(�j�:�X�tx�Q���R� ��*��qs!���ǙXRdE�� �Զ�M�� ��}T>�1�uG��}7�/
�
ĥ6��M��Zz�F����V3V~�d���6�-n��@����?{m�v���?O�F���9�
P<�o0�H�`:J�~����g�è��V��4��)� "�O6N]8l�=�2m]� %KP�����B���Fm"��D̋�m����@�:�t�s�K<��*|P�m�,��=��{ {�@���hb]^J���5(d�ޮ�SV�dTkp�&'�f?ldh�p�����G�꬞��cf������^�h��T,[�s-vO��@���Kx���c���Or0�yct)c  ���/\�\�ْ����C}�_��o��W���s�d�g�I6 oLV��r+�x֙�뵺�2�U�#p��X����U8�$��$�
ܕ�R}�)f-V&(5�.f��&�T�f"H�>5��$JJ�<Pn*]�;��$Ԫ^/�l?ゔ�Z���@���ǗX���lj;{��0`��|�+'���ǽ�1���!l��n��Z8Ie:����zl'�Q)���im��IiH���ﺤz���}j�<I:�?�s��pB��rT_�Ţ�Os����@u0�RW��:�1��Cu�nT�]��*����d168931000100023maraton/.git/objects/8b33060100010008762maraton/.git/objects/8b/53412a484274963d838af99f918a5c1f4d8623x�;
�0 P���Ż�$ЦҤ�xw}����ad��':��5��DpЕ�B����P-��bX<�4#< ���&����J168931000100023maraton/.git/objects/f333060100010008162maraton/.git/objects/f3/54a67bd0fc60bb7853a01ba9106e6fcec92b53xK��OR��`((��+�P2T�T����@I��+-�H!S!3O�(1/=U�$�i��� �jA�J:
�y)�J
 �`F�L �x 330601000100040262maraton/.git/objects/f3/9e6a94ea47eb896adf03042c54081291ae6341xU��k�0��j�GK�ܺq�Q
uj(t}[��F	A����#�<�������q�`��~���ëƭ�(N�Z�t���@ިM#������`�#�#l���g�Y�5�<�6���->LK�����U��{�u�|�E�������!u
A+�����iv���%��ԙ#�S29��,_�O_�×)?G���O(X]@�VmLh�6�.Aڶ��>��f|u�z�l��V���H�+2;�D6@j=_��Sk<j�6���}�R���F���_�ģ��f���Ϥ���#�[O�	��H˔�ߦ�Iۅ��J�_������Er���7ܙ�"9����vǥA-�Td�������P�����������8���v����2�Mu��-������168931000100023maraton/.git/objects/653306010001000110962maraton/.git/objects/65/b30aa13e87be43c50e881815d1ce99f34683afx�U�o�6�W�8d� ���d��60l�`k����5(��iK�@Qv�$�{ߑ�mM��D��ww��Yi2��������˶�Seg���t����;��Q����dS�\R�+����[�;�)Uե��v�)�ie,�[Q�I���*��F�q����򁜡F:��F�JKL�~-�UYR/���Jɂ1f�Z+_¾����Ψ�J#��� 	iL�{gƔs��OJ/�)��Q��0�KY��&Ez���W��Ⱛ�@�_�yk̡TB�$��������#^������>�x.�N����L�"BJ~�{�N�=N�B��-����������D�eY�8��^9��,X��k-��5y�x�AZ0�I麅|�����2�#=��5�GzG�c�3�SOy�7oRz�a�]����L����9��#9�xGtݰ�	E������,�.0��y�
�Ia�l��5����N�Z�R���X��l���=ʇ�Ngj��ꔄ���D���eK�f����ƃ�C�V��eu�Yܩ�ant�
iA��Xdp��]O��89��~�
��t����eB����K�]�[S�Fq/@��)w��x���[ۨ��B������pȣn�����,�4�N�'J
�v����ӧ���v#�5*��wHtE���������g:R�/f=�H�,��Q�Ji��	�8�
�T`'{ -�fiL�P�l�y�$�V��w�K�bD!����ZtR	�fB��Z���50��:�Z�.�����K
��[���6o:�&��;��
 ǿ]@4���
�(z|� �P~Xr�:b`��:�����ßg��O~��g�+g_y�+�/_��e���ևP}��β��?O��A�4��g����=��f�{?pkCs_kT_�R�B�.H�P�P$��ݽ�մ7v�s/��ф����
��	p�>Ou�P���!�l�Ɔ��A9��W2�	͌;�dLM�`�{�9��o1�����X�e̹��=\���#4e�0�!kN�7�,�P}M�9�M�SO�W.��3:C���qwvc�9c�����7��Z�'Q��H�Z^�~y��K.�=��R⯌Q�_���s330601000100027362maraton/.git/objects/65/c726810fcc65ffca3d402d7e8a1dfedf77ce2cx=�Mn� ���S��(J�U�r�*��Qb*B�J�ܽ&?�A������C������ţ��)���|�<~��M?�:�RW��1���1���k&���g[mAC�ZUde�����?��ߛJS�&f��p���-L���{(�\,��KsD�*׬��d4�~?ƛ?�UU�P��ctD���sH�\�9k�C	8\�>H�(�Y�M�C�]���]$��eI%MD�5]�+��(��Ü�z�0�V*ukb'&yR�a7l�?�'څ�ht}168931000100023maraton/.git/objects/7d330601000100076962maraton/.git/objects/7d/92fe9b0b7df5320ada428de7ce7d830161b738x}T�j�@����ɨQh�$�K�B ���Oi1��*^��b�r��{Ϭ$[����ų3gngfY�%�]�|�յ,�\�U�rmNV״/+�­�ݴ��4��S�ʵU�ۓ1�����a�6:')\����3͊<��0�7|	�̉���Ze��jA�jt),R�4�V��nn�� ����;�:+��Y%��ʖ�����X+۪v4� %��֢R��0聨O�f�L��.)��v�Ect픽��z8�p�JC6���������R��4�t�b�'n�V�V1�$��9}�~wGCx�.bB��j�F��'�F'Qr4?���׵z�)�|d�ġ=v��"7&p�v�gYhۺ�+��9���Bپ �*d�V&ׅ�BjS�PԚ�UT
��E��sA��S�=�$΁��Q�6�Cc���=:hv��FY�J��И*�?V8�D8Cr�����E�k�Qz�n�G{�fP� ����~��J�>�;F6�'��9�F�̑xJl�e�'��E31���M�4,�q4 ��`��2���"g&OPY�J�#]-1�C�^�m�:�����7�d�4�$�v�x�M�� x�.<���+1��s���b��=&��5��&�7��~��`v`��_[|�fO�AJ#E��aAkb���(!��f�~R�����@��]J��@H>e�g���ϞD���0I�Sž�5?��]��NG��ȷ���xK��0��@�/`ƔxO�n���]�Q?Ua�~k���(y�#�330601000100081162maraton/.git/objects/7d/e5d990e24203e72249c3e558a567288538d6d4x}UMo�@�~�$���a�Mdl��z�zLOȊ�zc@4������^l'7�;3o�{3�eQ-a��~񿊒݊ǢjZ���|wԴ+Q]esp��(����A�nyS��FO���UU�h��5��R	,�WJ���>�x�(ې�ٙ��]!����'y��Z�q,���=Z�E�g�����S=��ݏ#Hq4��_i��(Je��,�,u9���n�WV\�¼/�q��9�~'~����/K�'~�6\��)
�����v/`�T7���B���vo����L��(0GQA��2� k�g!������N��v�HSm���M/��`���d��=s���J���|6�B;�W/��,/F�
���}NF�F��X߭3n/����8?ju�5^�lw�����#q?z�8�V'74qj;i쿽!���]_���n����u+�HX�IѴФޛtT7��*�{���6mȦ�Q�.#�!�\�,W�^�1=�� i|>�q����|[u/S��_qY�>�Io6��o�$`��+�R-NsMS�ƻW��"V�}�����?��V��p�^o����)%�9��u�u��$�\����.0#�=��؎��T+���=�vd��>=U�i3��N�n�i�=β�������
���/&����.e�͢��ME�k��7n*@��M��,O��Iz��\�D9�����"�0����pg�.�u�%���Zc}+��k�X��0㘗�B�E��W+{�@ۄ�颺C?-jk����i�����ɩ>�W�6������168931000100023maraton/.git/objects/c6330601000100035462maraton/.git/objects/c6/d5de15c2102934cc3831cb1068934ce08c2382xU��n�0�wM��c�
���Ѳ�vhC�hm2%�4����2�"ſ�?����m��Óu���>���ݞ�]��������;Ar����;?km�;�Һ��ں,'y��C]���#ߥ����IO7V��qI�KF���}���t�X�h�J�tAf"�o����"�Q��Jq���Z_�#e�+'@'����mfeiܡ墛����fz�1(C��A�)�ﬖY-��Ċ�2�}���	7$�0s�!��0��ɯ�h\!fp�Ѕ�Tx�&h!|�ǎ��M����u���n�;��,�3���66q۴���C��ʊ%��&�vew=�K�튓��0��v0�\����y��c168931000100023maraton/.git/objects/593306010001000105762maraton/.git/objects/59/f485155bcee809784802b5614125849b690a3fx�UM�"7���+*i5,���=�+�!�m�����n2���W�݄�F
v�>^��`S�=<<~��'늪-Mn}L��zE�E�&[�t�Hem�nGN�&6�0S��,�.�ևu�6�u�sǲ���=O����e�p�E/L��N�']�cw)��K#�n�9��aET�u#���l38�d?����gO&d����m����)��m4��t$�3u�i�c�3�&x]�'����Nd�&���i�o�bHW;l��p%n*�p2��d%`�u[���a
!���+I�%tm�,8���.��&9�Q��v�O�~�� 6)66��өF����}S���8:�B{��i�[WNh����Qk���(m HRx��������l�S�]Bp+1�~4%\���2pкd�-wpB5��:�;��+�����pxx��ᑞD���<�N�+��T�+#�|[��ЗuN���m�����hi�L����0{��I�}W���|��=�h�>��i�Q�4�=�u�`��Հ�� �;��:-����]L��;B��K�Ąj���&&[XH����!_~a6t���\C�I��G�D�6��,"�nߥ�@
�;w��0i.魈Qf���N���n/�ں�e���=0q<���n�����w�òH�Ʒ�~3��58W{��-��0���^��լV��؁}�%5l�د\��;��m�sx�׾�����yw8��ܸ�0�`�!z'��˄�˞cz.�7.=&�f�E_l��8�n_��W�T�䄄gdg�t�Z.��|3���+���E'�T�y���n�v��΢����a����Le��%����{�8��~?G(�rcw���2+�WN�ǐL;���y��8�\\R� �@5�r.i0ɊYR�T��vԅ����7�s���E�7��^��:C��E��[~������p3aoX�?��}� 	��ϥ����^��W������(KA���V<��P;�7,�8���\$7� ��Y���Ү�@�ę�4zT�a�Kde���3306010001000156262maraton/.git/objects/59/fada7c52f33fa3d1e90d40f01ef1f10bc8c8eex��{8Ty��bm�к�H�ø,6
ERhsْ�3g�d.ǜ3f̢��J�RxV.]֥(���$�<�TRT.�';�s����y����������=�Ax �aldF"���~15� ��"��~뾬E�5�眫{�y4R�C��m�8��4��Cm%-oզ���i��g"���0P!*�-5n/�9�`�ኡ���P��}��pE���@T-
�v��nYusd��e��W���WP�7=]��}V����U�2i�q��bR�k��5+^GR�v%?c����/� ,}�S���8�U��;�:[�r�-����� �	��(P�t:T?��s�&PT�魮�.7A��}^��k[�U���޼�ۃ��(��.������W�$�ݤP�/X�d��39��*�N��]��rMt�T��^��a��A� X���]��I���upX�6�@@""D�ٮw�CNXGĎg&�z�r���-��a����_��Td�s��I��E�_3��a��;���o{O��������J]��� w,�g�kb˝J<�c���� /hv���S�h�����l�1�U�� �)͆�����]n�应ύX�s���@q&(���%�޵���tژ����1i 6�CN��ӻ��D��f��>)���c��B~y�u���W�I[=�M��o,:�t�E�K" �,^,G v��C�K�ǅ ��U����y�����P��3�w=Z}Ƕ�Q��\����+G� �j]�<�*N�t�B��G�XӍ��h�A~ ���=���kÖ6����6��jS=�F<@L�G�Yތl�[��d�.���\�dq
�B!}	O��kn�շ;��e�ڌ��>Y|��0jk[+V��6X������$N+��N55-/��q�a����
�k�z�_)��}e��id���i�MH�K�zp� X�%a����S)ks8��x�GFb�.M�?��V��>Jqo��EB����vd:Sz������b1}	C)�I'����-K�~�v��# 4;��%x[�������KD�S���0%N��J�����������0ĥ�a&m��KkkX�:���S[R���ER�	����W�AM����oP�Oxw�
����ys��	JN�-�w�nn%��M��;!�D<��䑹t2��m{�Gѽ��B�ןl<m6[P������qe�gG	�^�#����v�DT�����\�+��Ѕ��߽�%����lZO���a�Eq}Y ��b��}B�͐[�[����S���LI�����`��x�kR�ɅZ̓^�u��!w�mK��(|�`fs-8bb��]�0�^��#I�o�T�*B`q���=����r�[��Y9���@A���TM�2����W28�+�t��a2���\x&hh�0��x�mz<s�W���L-�{1�U������J�S]��2��'T�B��ka�A�Q���P��̠���2OE�C��х���BW��]��p�׌�(z�!Ϛh]���T�/�޲{�S��z+|330601000100016162maraton/.git/objects/59/8bd493bba4252d58c85aa842bb1b06626790c9x��A�  =�
>�YX(%�ճ/X�n��bZ��M��m�2�\�4m�;��Y�Q82�DhB�0{�9 Yv11g����M'��B/}�\p	��O��,���ƺ��X�Ϣ�-E_��n�Z=�Z��x�6��>�=�#8 ������Xi=/�hU?]J
168931000100023maraton/.git/objects/cf330601000100045262maraton/.git/objects/cf/17723c34848c03f1ae344b9a9d3331e4b542dfxmR�n�0�W�+�����Q"�t'��>UU��XGئE���Ť��������ا�;��_��ƪv�ui:��gẇ�t�f}h:'�پw΄�p��g|�ƾ��g�{�4`�876�YNG?��X�DH�ρ�d�N)�g�3�a>.U#��m��s	IL%�����,K��1����7	��
)vgW4�H��0�C3t}B�k�/ J��i_�9s:��B�R��o���Y��]�n�dC���}�䰧��mIx���o��P+�EN�O��1#XBRվ U"AaBm�4�OIOR�M[�Z�.A�F:�I���F�_ՍV�Gߟ=�t%����[�!1	1�Ιy�d@u�Ϗ)d�ɗ	����Ug�JW�t�u�]V#~{G2��y��bB�ajJ�%Y��3��4dӔe��eI���)Km��%����Qͯ���}168931000100023maraton/.git/objects/6e330601000100060762maraton/.git/objects/6e/bbffc8128221db318a343e601815dd948600a8x�T�n�0���Ez�a���C�Z���a�L�-�2(*(��;�zX�%`�>fgw�:V͑��?|�꼩�¦�ic�y�#=��X����{Sp���rt����>�ym�Kn,!CZ�6��`�!��G�#���v����41 _��|�@
ۮ>�냌����"9u�����VQ7��6��z�d����󻝜zc �}�G2�����.��"Ӆ`��c�xnL�� ��v�!�"�-�zc���ߐ�y<s�9��<�!�Q���9�-s��UJj禫���*%�5&r˘-�˘[�0A�@C�F]�b�2
Ǡ���=�-\�1dM���_Ƀ(�¦�b�>��[KiZ.�~�Q*�Y�Z_T��U�@��� �q�@;�i���gZ~8\VT.��aO�0��VP���dx���Q�QHD�F��G=�x��P` �f�$�wI��Jz_��;�I �W��mc�|���M�q�B;~E��3?� �Q�,J�� p^M��Oơmyh�3�{��G'�>b��]��󮛩6f|ox��(h��~(n�������!+M��Y$��we.cG��*3⎥_���,GŔ�^�J�$�1���?���168931000100023maraton/.git/objects/87330601000100033862maraton/.git/objects/87/f1b26950b7cd66c0ef219e7e32f5d4d535336ex}��n�0�wM���.E�RY���e�QqHC:E@2%A�T��g:��8������s�^�ǧg��0uV��r�zl@J!���x=�������^�����:�u>�	Χs�
��
"�<j�Ȼf��|��Q�b]ι�{"�tہ'�e�O��su�� qf��p�PΔewԟ��8�"aQa22��N$(ĸ��j����qs������+�U��SOf=�ԓ��0e�6�:Y�(՗Fotd�U��n �h�=��D�uE��|��tP�p(�k֙��&��ݭX��m;��㣈���VA"�`����=�P.��@���?PU ��hB~!�:168931000100023maraton/.git/objects/6a330601000100016162maraton/.git/objects/6a/5290a5407a09cc304d2d94352bde346eb5d958x���
�@��>�O�XD�aw�Z��MУ&Dh+)��u.h��3�O;�6ާ��mY�#����<�{҅�gh�~�A;O�A�Te�9%�c(�ئ�5<z&��ڨ�����*n�@-k��"�9C�|�;�����w�
�Av������5C�$B�O�168931000100023maraton/.git/objects/163306010001000394962maraton/.git/objects/16/4aec3993da573745b795bec1409bc97d252e0ex�Y}p�ř_Y������&���$��C;gŖ��I���^dIΫF�|ҫ�d�����h�C�sІ��43e��Nzp��Cs��renMg�&�	�5�����]{����&��������~������ڦ���PO���:�� �8`xZ�[�(I�����J�L,sXNz: ?*�jQf�ܠ~��}���`e(�&�����§�3^!f�mxH��d��/�Ȋ�����`�b$u,�M�&iY�gv��5B-R?d$-�r����>���W�g�/I�q|�$�$c�����h �
4��Y���7�W��m�A�D�Q����d�=�7z߼s���{�E�)�[d��뺥~b�B, e��[s�ΟN��g]�2��=���@�e�6अ໪0m�ɏ�2���W����U��
��6U`?�'�(��
�����28�� o?bxƑ_ �{��Ɯҟ0[���Z�����W�g��Q�8��]ƎEW��ĵ
��>�63v$m��0��i�Ʒ'2v<ݑ�d2�0��7��x�)��БL��#ɸ�]Yro���t�ٍ�Q+�6�t$ag���P/ʚ"�D�Le�t<2��7C}k��Qa�^K4����ؗJfB�޾T�R��p,����7��p+ƅ�쵉T�D�������y��]�HgB�	�ks41,ui��e��f�qd�&x1�6��x~�K�;̨���$�(��F̈M`h&+:^����=��:̦@�l�a6�hV��[�fhpgq��s�ů��r8��[l�z�o�'�:��$6�_:8�,qw�Q`&�����7>�uV#�9��Ms`�g-6*�Y-m�\�I��ɱ���@XJ��'G��ɯb%9έ���h ��-�D_��\��\�͔��	��t��Nx��5��+<������b��4��+h�E��S�:�.:;!1���$1����G$���J�q�i��@������xDb��j'~Pb�ʺ�8,1Gg���%�Wǁej����ȝ���ƾ����k���#���	>��WX�|��@�9C��sv.>�F���?˝��((�ʝ����xѾ^c��?~�&���/s���E{��ʊo�eE_X�|[�d��7P��%���_�z���x��e.t18~̃�|cogk�}��S�v�S.�&�fQ�س����:��[���w���Bğ�w$:�8��Ώ��r�8�eV��Qv�W�e��+?�4�&\ǧ����c�m�N�=s҄O>�1��D~:71�x����T��/��j�M���g��=t�[���{|�
�m�m��/���3e�,+H���c��$p�{� ����.JY�����+Ҿ�3�/o�$��#'�s��ޛ;A���{w�
O��*ا��T-����4Ai���w�K���N��4¥u���/\�vV���(\�w
dӮ���H����B�L�y����h��p�}�ۊ��I�6vzK!�ɇN����q"��Nd�)�N�Sg�	{�\��(�M0��=.��8G<u�*���ATz&`�P)���ՠR��G���;�Ǥ�B�]�Е����C���g�^����t���O�(�¶�����ܯ0�m3oq����qe�����\doʝ����J��&�iX_��e��w�^%�m.g寻J/*;��)�`mA�����snm�ޣ�S�jPL���漶w�m�3���m���fl����7���+$���/�T�%f&7�e}���׌}l�h,@���e{�ͤ���_�Nnʅ�}��i�D's���I�܎�>2�5�_�Ru�s���٦k��6���Nt������p.:8�O�_���~�E�����{�O��	�Yar���=ג:�8�r?ʖ�N}Z.O����[w��klcT����njZ��v���QGtֹ�z_mMVt�wgG����d����dG}�~�u�����T��t%�ُ�����E���Y7��3�y�I�Ў�݄���ֹ��eoB��U�ms��dP*���G�ϺJ�o�6(�m�(��v^jc���t3� �6+z�q��F�[�����'��;�+;�7��������<�Ny=�7�����(�2`/>��O�O���G�8M���b��\��~�_�{�k��N|��v0��>/���ɷ�/���40�n����M����L�Ík`+�{��? �������Y���b٤f��bκ�O#�N|?�Jsp�~t=���� =	z����տr�@v����Z�[�5~��5��hl�Q	�M���m�n5g��e*���
�]rpV.='�k%������9P�3�3��[̕�>d�-��|�0OX5
s�ZP�3	�cn�J�%�/n��b(�n�jWkHa�؅8�5�0O�P�3�tH˹��#w˕�֞����Qa���ܺ�Y,xsVr�0$�=2�\]B���\���B�+�9��b��'�2=��w�k�l��W5?�LC �}Gy'�����_8�p����JL��܋�.��yf�D{xi�EB����-������Y�Sp�}�ab�����Pp���_(�����%�>��%���V6�������x��#��~bXϗ�U�%���o��[�8ŷ�?����}���W�D~��#�_��'��J��
}?t>���P��;�q�3��LD{�E�ڢ�2���r��������Q��8��
�u����Y�ʸ��
9�V��-����ޅ5^���j�$�������ϭ��hjy�OI~�i��������约��X'��r��*̻��'밽������@9ۻX���qa��{�K�>�UJ�S4mg���` !#�^�����K�*�2�U!�e�R�v�#I3f��3����H2n�c��4�Ծ��9�N��t:�ˌ��]b0������.T�@&4��U#�D,�z$���W7�##2�Գ�4)��4�`��xK�dbw�N *�!��Y6*qC���=��{P%;`v�2xd�]��!3���1<��G����(���;������"d�u=!V��z�*
dxP���ln��C`H��]����#w�C����P��f_����U��0G��#]Nl,��J������i=$��
�1�W�񽭃rZ�tfu�)Wj�1ê����������"��r�ՌE숊)b`�k[��95m+;�#00�Ro�*�q֪��X&eZXy��*�p*�Z52݃���e�]�����OS��RGS�\�ÿ�R���XpU;qzM�@fא �ӊ[:�F0|D�Sv<\׽ڎlw���l` ���B1 �"Kb��ў�vZIv��l�ˀ	Y:���ʌ$m�� ؞D��<������s�X14����� UC��z�%�� e�y�p�L��0�����M�6�x�Tɿ���eLׁx#����~�u�7����x�;}�����	���6��(�ZP�nż�(�Λ,��;ez ޖ��o�[@�<Q�� �3:��(�o޵O���Q��e}��0��>��g�,�}L���&�2���GC|����^D�u ��l(�=E=�k=~�i+���GP�y�t���@��zZ	�>��c �ǻ�KhX~�QΤ�����kz��� S�!�����j?&G��!@�U��<ۣ_x';=�ŀ�Kz�G^�ɿuB�_j����U��7.�X�IZo
�o������1RU뽃<_8��� �2���C��P�wk���wr��xG��~/8e`�=��$H�Ƿ��ڣ�����a֢L'�>��x_�+�wz,�}���C��H'����Y��`�q�d��8�lK��H��'�,9׀N�h�A��?BA�c@��������(t�n��S��330601000100027462maraton/.git/objects/16/d24e63b1720a0d2388de88547841d5c5a98530x]��j�0D{��b��Ņ���V"���(�#�|
���*�����7ޙa����?�GJa\��������q�����_�)}�b��rC��ȿ>D����2��RUÞ���,��K۶[��Y!��+dU%�6j6�i���v�Љ����Ț'(;W|�����Z ��)��=*v������~t�9ˉ#G��U-�v��jR�k<!����HW�6d�������_R�R�|��ҙ�3ig�v6aZrוF�������V��2'�Ş���zR168931000100023maraton/.git/objects/09330601000100038862maraton/.git/objects/09/7c63dd348a441fc1f13e7b7513b1a8b7161192xuQAn�0��b�^p!-�R���(C���Ș�R��ww�(�T$$3;;3������v�`lӍ;]7�U_�X�!�{:�B�
GDn9��R"1x�z=�T��� @��O��َ}��\ϣ^KM���3|��͐MA�P�t"�1��,�D�wX֔�L��I	(7�TU�D�h�%���,�d�����a�F��(0��YKf-��lF��CQ�D�-
mw�⦈����K��%Ef�TQ�gRDt�y}�'Qbb�j�J�Iag&`N����̜!8�x�MC�y6H�k�<)l�O��YJ�,�\~@��ѩBW+�>M�!&�\�sVN�v��9?���:9'Z2�q6lx2]V��f�`���'��o������70��3306010001000182062maraton/.git/objects/09/6601325643d7fa0b421a517b49b3afaa25f62fx��{8Ty ��I�"%6d_�1ø�E(��-�Z-�93����1��\����\�'K�����Vk�[H�G��e��z61��̙Z�=����_����������3��::��HT
ŅF[K�8;d���ڃn��Zt8G/A�.j�HuU!�����Y���}���6g��T����=��;ok�aנ�ܢ�Q�3�G�b�8�&�bO��d�*447��fW0��Eg
E��M��-�pc��3�f��S�+�BuQm�/+��n+aom����~�-a��zo��K�1I��7����n֗4��}�"�Ő���Z�,��0(_1�A�s\�q1��n)`�*/譯d����գ�C%IIo꟫�)�p�(��G�����qϯD˫ʯ/˙��xR���@�f�Cn�V�؂������j$����vx�;��F���r׍$@Q.���8��-���w�Kl�6��xT��Z	�~@
!�w��#YǙ�q�3���Y�H:P��Q��w�}wР;<�f_����^}�1����OR׿���(�z1[O&E���� ���8^m�|�|sSZP�ߴ����c3��HK+��)Q����-!�#c>,�Q�s$��d�/������nr]$=h��᯶ �O��`�*��.S�Sӟ�uMo��E���i�ٻ���,k����+E�k^���*���ܲ>�gq�d�w��2oT���	r�8P�*r_���fA�%����.o��:lv<%$�:�����O�t3�{��2�T\�.��z"�[\�Q�|Bw�x�{��,9�p,@1�V���Ȁ����l����\�"O���pL�E؞;�V�ȵv
?t����n����11���8���$aU�H��är�|	0
�ȇǯ@�_��aԢ(�q������s�����A˔���6��5�Ӹ�ߚm6<d�5��eb�w2�TN�`��l! ��QI���Y[�ÔC�E��:���b >[��<��Y�~8���e��i�T���=�al*<)���]�P���7]�ǧ�zX=�b�8��5*H����S�����=�WʶIs{�Il�����8�m��~�:[Z��� 曝?�:��lD}M+
;:VU?��c���j��g�^�I��n�������?�D}V�P> #�e#�C��ɍ.�c1쟾��g钳.�E���=�h�/�$�� �֩��f����P4�rϛ�[*��K+d��m���\�O��#(�*t��l/��`V�1����K*�!��ȟ�\�T��~��)|x6�� Q$`����n��]mkL�ڒO�6V�s�z��s}<7����x��8R�K�R`���mC|Xv$���M�^W�����*�/�&��@B��EG�'F!=�n+���e��-J�4���h�H5?5ml�ylL��\/���|��b�B<���8(��j�2����Y;+n��P��J�yt.��$��J[7�bw�ȕDeT��Y-�!(���B��M�Iw2���K���	�x?n���>6�U_��Q��w�:d�����j�/:/���ݎD�ȣ�}�t��_wN��߯֦��)���t�-Ip������]���Y�2>5Pj�nMȅ�%�k���P!�]2�
a��9ʂ��IG��c/ۥ)� ��'B�hHg��~ŋEP!�#��	^��RyF�C�Y�rAm����??�'���h���3�2aIX�n'�G�G�1 ��A	:W��E�ׄ&�B�g�khE�s%NA�Eb_�}�T��7�=�U�������[��G�:L��168931000100023maraton/.git/objects/f5330601000100018262maraton/.git/objects/f5/0943176b651f4fe67b29b18bd44e88dd10afe1x�N�
�0��|Ŋ�F(TO�iE�$�@��<�P��fK���ݙٝ��������ɡ��X馘�Uc���p T��o�-�d�$ctZ~*�<�N�P9L0�!4*�� �pFT�i�]������ܭZHi�x2�`SM!��<X��Oh�B��}^�[�f8�Ј���[�i�溦������/�'T3330601000100020262maraton/.git/objects/f5/df1554da3938173a08402d5640433860b0e27axU��n�0E�jŕ�P+k�#��RڰEI��I����
)�,��c�B<a_�?VN�0�ָ��hۡ?g)�.�~�G���OI;H;���vJ��$ch�%���Bs�O�S�i��;L�B6�l�^3�!�┍������dC���k�^Û�-_c(�꾾���^dS��_d�6����e�3���L���(��+� ��TG330601000100057762maraton/.git/objects/f5/9ad7cc1c1bf0cc8190a5c6b4c46b1ddc311b0ex�SMo�0�U�46b��q��!@/;l;�1ȶ�(Q$C��fE��()v�����j�n�(���'�:9���:�ٹ��F���F��k#���:YL�bgnG�q��/��Vk	��+z��`�k2�V���k�����Q۴�>u�|*T?�Vc��<�t
�����<U+�wE�7x.�$��𹁼��,k�s�u�]Q4Y���R�x�C���Sx� 鄪kV�M� 	�lr����)V`��8�E^<h�� ��K��z����L���w��G+<��5�{�a� �׋�Nh������X�u��eNa6V&7�\�3h��,�������~�O���(�+]�J߲�B?��1�j9Y6U�U/=�A��d���c�$�f�q�6ۮ�V�4X��77�]ѠJ�ô��ם�b�|��� ��2	���w��p��>�g9o��ȁ!O��5[����R�E	��xm�	/��;1���-�Xp���)�{��g�k&A
��`�Fp:��`5<���,�3{��ܭ�'o�����ITv[��awj�yb�K
����q�#&Ko�_h"E�168931000100023maraton/.git/objects/8d330601000100014762maraton/.git/objects/8d/15ab43e2e0cc46b00df13d4f0bc94c5cb58f55x���	�0 `�3E�\��Ӏ��$�+�P[���7p�>[���#_��=WL4g�FZ˔s�P����%�a+��{��-��:�MJFE�E ��:R-�������̎��[�!%��8�z��=&f!�R� ��f��1���J���;�168931000100023maraton/.git/objects/363306010001000967962maraton/.git/objects/36/838a050e759926eac3b9a50cf880bd6cfbb019x�}�v�8���k���03����l˒�����Ɋ�3�W�^^II�)RMR��th�>�0/v�* ��R����X� �B�P��q�E�yx��^�>���7�b�΃����i��OD���Sq ~�p;I���	��"�����Bc$�~�Bן�f�y��u>����v?]�:M=B�h�Gճ�=����F��{k�L�܏�g����-�
z�ł:�3�{�-��'^:4���<4�|w�A꧁7�x��gˉ��o�hxsq~qy��bP�PX+���и�VwQ�&�p�0�B�&B/��Wv0�b?��k"YD�5Y&I�/����[�&N��;q� ���߯��*�EaM���
U�9�E�k�Ÿ��ɍ�"���QMkb�il�"�ߛ�h�ή&��I�(���0�C z�t	_ �^g UM<;yB	�H(�}�{w4S���靈�����g�MM����v`R��a�juE�84�����M�L�ȭ"�!G5�1�����w��lLڭf�w��`g ����<�ա!3A_Q���Tk�J�4]�����;��;���.����?�`��Iz���L'�upd:������^����Ƹ ̲�B9�/�����zWT� Y���cd�8z8��R���~_��C���/�̓h��S�W�|v:����~�j��)g^�.���:���l���.|wh� H�)-
�������o6�8
���3L�1�����4&Y�*��x\D�C#�a~8�T(C����~o�g�Q$PT�o/.66'Iݐ@� ���NA%	��(�u�ۿ��y��7�s��S������nɦ�hX��
X�(����fc'I�N����^�a�I��h�:�����?l4�I�
�d�yW@�
D�fR�Ahơ����E�נ��A��|��+�����e�g�d� �#��*�AhA��.i����o ��@N	����Ps�8�K�UG������mXO�ex�LԵ���.!�(��<��;srq�ϣ(M !��Φ}�%��5{q=NjB-L������Zc�nH�d�m�m5�e�̚�(�*�+�|F��Z"И�;h���oo�Ak�&M�3��q}����!~����k�Zo'��/
$2���r��JkL��c�t��g1��by�ӿ@�u�$�7���т�x�9�E-��d�Y�=
x]C�n�$���<�_z�O^�M����R�j�},��:إ_g���j`�+�Y�I�?��]+_C��#��/U����x�y�G�c,�?�L����g-�Et��ս�ݝ�+��Kx��+�Ҩ�  �ڱ����xhtIU�W>^���
�p�Ύ��}T�n�C�T(�'�9�Ҫ�wL�@�����a��A�PE�ux��^�b(.����$��'�v5ܯ�����:T0��e���6ßx�2�Z��u#�RI��%n��T�`��4��5{����t-C�%��&�ͦ�c�6k�LP!�xE�%E�(��jy�΍��vj]M�T=�P�M���U*T�� ����[��ͩ��p/��-�jō�%-#���oT�>�uxô�uŨ�D��أ�> �3�zq����O�L���Hv��]A7��21p�[m�%���bu<�5A�S�Z'
��D��A��N=����k:���R�bqt'��:Q`�]���N��?���B�� |=P�f��"J���"?4\����0
�cC�)�%��~�$_�D�^F>Ǌ�*�V"րj�W�d�q3[���T-)yf����R�ћ�ؾ3�Q�:�Կ�K�h/S��|@R5��Ao�I$�r��eB� �8�,
`��_�H���4'Z�4h0�`+�f2HT��4s��9lZ�E�����,`��Y�Q��K��TŔ��{"�ȴ3/�ڜ�d9��d6J
��P��z{	���?M��cX$��1�ǘ@�J��;���6�p�2�ɉ"p@=���^��x,��BU�V������M�*+����h�a..YY�G��/��=b��s@ �4�[��6!al:~��� &K,ƍD}2,��Pxo���y�G���fW��8��YY|�&bG���[�Ȇ��؎�1l��������)�m[�fד��+3��P_tx�IU�OF�������%v��@�s�`MaݐL	�E+Iq�,lV"TP*44t)�Hn$k��
\V�<B%�Lb��1��m���U��X��'�h�1ȩx�P�̳T5J"�)\z���7'�a�>��$��]��3�� 8k��]�����7PE@ā�y��Q�<���⾐Ӹطe���VU+��D�� �� �Z��ǂ!��X(�c�Q<:}I�%7���G�l�k����X�{r�{���o޾~���܆j��m���R�����"	<,_2̥�+����g��|^۟hS��8n�5��L̂����|�ƔM�}I$�����&C�,}3R��8�8���{` �ZU���'��/O/.?��M�Ɲ���N��+[��q<2ݣЁ;�fh��Zy�+L�=�;�%/XS����\��e&�`*����$P�PQ�����2���J�y��p3�/��/uL��m&��bV�/rI�_�EvC�%������-}~��]�g*�ʭǊ��i������-8����.����߭n���
���=q'�1��2��
J|V{���;F����uj�V�b3̉1�c�5�Y*Oo�?!�3��f[�:���00F��z=ݾ��� N���[��f�zģ�%�W	��.�S��c.EZ�����u܄���,�6�{��PQ�X�����6�F��빣W���6J�qt�%d���y����2)&~��x�Vqd�8B	���.`gq����4���󊝠Xڼ */OD?�0陽�ݫ�c��
t�G�C]���7�XDs��ↄ�M�Fw��:̿W?�	�����.
W(*~�z��O	>'���xrH�&������աCOO��,��|���uRvqrv�
7�^����1��5+�����&�ӬQ\�9+5E]�x�d|t�8�م3�a��*j��0w̖.ru]�O	6B}
/�f��Z�٢r,��� T>ʩ?������\f/^)�~l}�����QL>�Еw�kxJ:@S帍��J�d`
�������\\dlR5hT(*A+Vמ�2�~^�J��@���Ӻ횳�1�X��f��;2���[�mן�M~A~�4)ģtx{J���G��\+����*d�U7m��n�%�}�S/Xk�@+W�Z�"A3X���1_��|z��~��j��؃* l�P|��C��K	���� ����=2�ռ�'��TM�j�!��ItG6����i��=a�Xx��| 4�0�D���b�~�N*QJD�Yk��D���C�j�� ��ɠ[/X��t�'��O�!	"-~~��\kP_�~�E����dq�n3�в��G-���=�f%�~��"R���^p�#64�����E�nnS ���GKaǞH#�Gt�#L�9�b���&L!'�-�S|-���������6�o���\�����jO�DCn�AY�ʰ@��%5<҅E��X⦞h`(�pl4��o�����ƶ��%�5�!�\z��V��؜׊��[h�p�&��n���z�%�B���LC9G� ��e	:�X N8'=#�X���$�����U�ɻ�_��:ƌK��a)�s��س� �AY�<�������:��&#u�A>I��AA�����a�#Z?��D7���.S��+�F�&
gH�,�<,?҆/I����T�]{�i/�"�;y��!�f�a��a���t"��%ͫG��)\�k!��u�U��sԌf��T,^��p��q!�BϬ����tԜ(�p���IamC^%3c_���8�T���%�f���q ���D�қ+~dH������+wv����0r> ��7�wQ:,�Ԃ�(��(�b�Fi|x�y��j�^2���^�M���h	��T�V�B-��������g��JmqX6!�&���hi6F-�,Y_��\�+�!ܲ	��W��l��Jp���z_	����W�;���+�nw����6�k6���FVibn(�Zs�̋sD�2�$-J&�9�e(�LI0dֿ�� ���#��B��V���K%QV�byh�R/8ǌ�Yk`���=��Up����/���{e�.�1�j��^��qu�*QE���!���,�*�%���,(�q�B�+>��z�A;vH��W}!��U6����n��h���}5GZ�������K����.���>c�o�ް���jy����9]�&lL���腔=��<ֳ����a����(�b?�.�66�W����HHΫ*W%�~��﹙º�ۑFL=BL c��o%��,��|�Ll���x���=�K����[��_�m�"�3��%�KivɬX���Zّ_���ʹ���U�CK��!���Ƚ 3��s
���7m����A��v��-�u��g��&͞{��&�N�	���fOF�լ������sVz�"W��2ݪN�̤����w�l��QvI¥���&�Bw�����eI�q|����M�td6:f�!��F���J ��Y���L��Q����Q; c�,e��ݡ��/��l�i��N� 0�t&�IhW���>~�ש@���?0jd�2�ƣ�6L&y�ė��n�iq˒�JI������v��C�ݳ�Ao��v��ĵ���s�b��Ґ�1���Gp���of���:�f���7�Q�������(Z@|7Z���F�O���n�^s�q&ݎw��V{�t�<۳�Ik�Ŵ�>�1E�k����2�y�ov�S7�v�SXL#�~���
���gOڭ1X���{қt���:r���b
o�f�E�}�nB�e��L���f��n��0X6���	��C�g���?���i�u�n�`L?cI���;jx��wd�?�����A���u��om� ��H��t�ܞ���G����^�?�����Ǉ��^g�:�F�9l����n�{��d� 3��.dK~�m�p�B������B��p����e�pp�P���z�%=�a�6-�쮄�5B���Y��
~n�~?&�3R��"51'tr��w�;ۈ�/���p�����q:	��A����i!o�Ϝq�}Է/$�8��z��٦�m�tjt^�����A̗ά���J��mlcg�"�RĀC	Ā�$�W��>/e~�N]V���e��n;��;lB18�8��t�z݃N�n}�eL�+,c�����f�����ۖ����@i�x6���@���Is����2��aϠH�1�����p�@��lj;��m%�P���(�{����)�1i;GnÞ�{�q���nw�P*;N�a���9�N~��4���q�W߃3:��Bַ�M{d��=�����#΄�la�#��Xe%[�+�_������������k8�q�m��a�ݵݦ���;N\�on���㹍����w(R�����qQ���Xqe�&k�#_�b	?9W��8�<p�9U:��a�;�ׇ09�R�{���_�y��SD{j�#���jH���GxJ��ũ,����86�ՙ7�<��F��M ��1��� W{z��KI��������/��B�í�:TS]�&����Y�ҝǞ dn�~S���Dw�6�C��H�(T)�2��zˑz� �X'��*��2	q7CF���b�(�jzS��(�QjI�ˈ��p���Z�'����#������^gC#)I�V#Z5��"�T@���gl�@G�A�Uk�2��]��]D ���M��Wg�V�B�+��L.����,�5F�I8��*�\2����vb�S�`��a& �'��V��|�~�$
�JP�A��Ax�-t]��v%Zy���*�S���p�����y�Y�.DoY��}w�8�|�ٰ~a�ғ��X�+D�J��YC_Х5Z~�)���"�_� #w(,p��f�b�_!�^�skah=l�t֮V]O~s;�
��J�ʳeX��R.�4v�4Ry;�������]����S
L�R�;��J�R�#h�!�ΐy���(��g[�5�Fs���MBY�\�Bw?��@� �B�\�;����U���:�q�]���ێ�8w�U����O�i���'�8x�i�>�-Z��>����!l�V���UiO��Q!)9@eIa�N�Z�`�ʻ��"ɉ�THBm�P�"�}��y@~8�$zD�5�`�i-�w��!r�v��X^"]�Xa����=�QIdJ��a��+�+$����<�K��0$�ӑ�x���'�DU`����oH*�!��y/̡����l�-�쩱�ҴET*By�Y�%���:��e�է�V����[)t��7Ǟ��J�n���a%��q\�rG'���4�P��-~rR:�8.� ��и#ʋL���* ���{�="eG���jD��c�R������ER$����})~�0������8��{���aO��u~z	w̦�x������o#q�қ���i�@�_�,v��Ԍ�KʥA���z�O:;�F26��s���=օO�_dE�h)�%�v�,z.�?>Tx�c��!*���W��ȉ�U�W�D�=��ᓒA��Q��{��5a����� �Lee0W�8�'،� �km�u���V�����M$̅7�*�N�K��D �D���{��?B�E�k��>噒8�	N�Rۼc��G�܎��/�/�nA� -���P��uղo��.�
�u��Cv�7�? >���=��)ۤ
h����v,�UEAb��z�e�D�f��Fpzk�g�;����8�솢�Dd�>��Ky���"+��H��LD求)Ak��48��D��U��V(���&��FҖ�6n����b���6;�m�wY�9��v��i��Х���B�h��FD�܈��-ġSvv2�b�9@amd���^��b�������L�	]��<,����y���Ri'�[�f.�X]C�FG�Av�~&��a�&O6�ZW���[��#�$wJ���\�R*~`����o�}rW��0H�@�bC%�	��~�<�![���>�~d_��$����h�w����Src����ꘋT����� ���"`�Z�\UsFQM�^�҂(�{��(���|f�[Z&��"�'�U�a�a��Q�yMkP"k�Ʌ��fCOM���_`~Y��< �.�V<BF�2��%��F��=l���P�RFД�7�b�
ˇh�n��8E^�A�+)�G��:����L�B�a7��Vv�T�j�^�H�ģ-`7@�����(fm@�A����2a�d}��XuM!�=�����P��ł�Z��S{HC�d���l���C:�%�	Ƿ<��g�tC֯��K����@�dy���K6�Թ��_j�e䪴��4%����L�P�țK`���u6��m|�=U$�aC�F�>�_�Y�����H��d^!z(��_W����-F��:ϒ�����)��U��$���t�t5��#�0?0��XI�<7g��+L��s���~�2D�SWr�]�
�(�`��l������	�q∂ʾ��~�T��4o�t�P�����`m"����e�p�Q��Y4�i�9ø�c�0jdtI�'�uB$!��D��X%�R�7b#K;1(��6������2�p�ij.�\��`ᲿBt�ځ�oCYxa!Q���E��I����$�P���e�\���*�{�{�b��aJm�(0�*kQ!�}%/Yi�����N��ٕ��Q|
O	ʄ��@#527��+3zF�d��?
'V���� ��Ku��L�-)t	����8���a��R �D^<(�,ho�?�N1c����GKЩ����_��(��?��%�;"�ZRN͜��i-�|�^<��|�! � Yy���y����o��䬶Ԝ��xCݟ^�y��s������9&���@��#����@q�����A�f��(m�l���8�p��0���*�@�"K7��(��f�sp���;O�h�:� \K���-哈��w�k�k�<�$��bS�%>?]�s8?qD,R������
��<9�Ws��r>��dO��hH.��G
#^.^�fOq����6R�;�8�!#{5(�ؓ�����#zQK�=�a��.3A�.H��3�Y�(��ΩX,��8z�M�5F-?�vk��l^:�%+V]��(M",������?��z�&y@_���P��D��El����H�2Zd+�x�D�^&��^p8`�;>6b�;�2f-r_w�v�B[	w�M�nz�
#S]ё�|Xv˪�q,����s��o��Fe��;M�{_�~�
��&V�Db�c�ed�h�5�<iL:^������T�8�v<,�f���-h�v9�����`�Y�(�|��ϡh�Ճ�,�>a��!�Ҏ�Yg��%���,�(��2u�cv�u��
��b�w�G��J�r�E�҆���f$����[Z)�y�F�����΃6���[�(�Qm0���O��Gũ�x(�,NJGz@���fi�I�*}�a+⚝!M'e�Q�8۶p��ms�U�����s��I�J�o����"*��k��4�
Z6��:�Y ��O�8�O:T�Tz�{C\�}$t�l��\�k<�\���%�^%_$�W����/8����o�,J�@
J�gh �MA�&\H�r��z
`��Ă�EZ� ��2���b$N8),\ E7�)Ǚ6Wo^��άy|?σa�	��3wX�#O��+����m��A�;���rN'��`؋�=��UUwI�}��i �%�I�i$�����,O%����%DN[��Ԣڴ���|��k�'�$x�? ��F�������6���_�߆��?
#��JO��������K^&�*�|hn����e@�q��+�
6t\"z�W#�s��8��mqT}�<Fzm�Ϸ�:F ?�Uq.ܠ5��Q���y7���/����;�U�Lm^ޅ��A�N�ӆ��n��� ������*���������>���
�R(�U�KG�_�Ɋ�ߣ�>��i:'�� ���H�%�����r=�џa���5�Gg73kv=�_�q������<�yb�̺�]_�L�d�~v���������:��w?�e�a�y����nE�d���p�c� ��Wd}��=��>���_?x���R^�����S�0��CtV)���5�Qa�q����`x�&�C��0�ѫ�ܒf�xe���9:�{�����$H�$�P�B��l���̃ݚ�<��\�[<��Y���!�s+�]�s��S��!z�)�&p���gq'ޔ"�}k!g�OYJ�8U���vx���s��?~~I�Y�J߅W��A	x �F�l^�7�"��nϊ�|�x����rIVI� ����k%w��?]j��	*&y�����w<Aea&���JݤSr����<R��`��AF����7q�S5���B��~I�����e���s�aʪ�b;`�� +O��168931000100023maraton/.git/objects/473306010001000975462maraton/.git/objects/47/e9a7c96cc53b544b1dc803206a34f91dd382cex�}�r�Ʋ��+U��p�IEx�$���V��Y���$�T*��!	� ��$��_�<���g����{g+�E3==�==}��x�E��;�?��߼=9���N�,]�G��Ƕ�K0�T�<��р^o�&��
�d�s7�-Z#1x���`�m����{�I}��{���i*	�?W_��}L�<�0J�@n����<f��G�;�[,� �@Ƃ&�3X���̍��U:�-<���� ҹ��{���Ea�wq4�˅�������t�~PWM�\-trh]��M��%�(Le�D�;�5�ΧQ��EM$�貦�$i�A�5�{���ɓ�x�&�;�g���_�u:��W�5����ԯ���e�&Wr�� Y�}ͣiML�8�]t��f�Q���dzi�4R΃�^�|� h���&������DTӾ����}��l�����6�� ����4/9l:�N���!1�t=��i��\ � K !gs(�q�]./���q��j�z��^��[X/!gYb����5]h�m�V��i���~�~ss�P���ԍD��, 9h�z��6sH��mL�l/v���>0�L�8X���)tP�|���&A*/�s��)�w�R�����0�e��V�������s�$Z,�4� �<J'�ඞ'j���e֥�6��"<Ζ�Z�"����ԝ2Т��X�C�u!�Q���a�\�Y,'CkO&��E(o�/"��̰F�U*�%R��L,�����)=�����C�IR�Pw��8tSPI������:���. ������VJ_i;=��r,�ݒmC[��8�(�Υ�d/I�M�E0_�.e��I��h�:��ß�9l44�I���d&%��(؇��L�P�q(Sqz��G1�6��Cs����_uE2���ٰY��C����D4�$ԯ��@�+�
"�ԒI�-�JIB�[Oԋ|�M��z��+��s	�u��@a��<�����xEi�Lt���Dh��T�8�	�=�ː��z~�$�B�${Po;m�Y-�g�"@+PW�_���3��1	�����`�����m�ds��h�ǫ`�'�/����Ƭ6�Ig����$�%�C�!�������YDL�g�`��/�2�!�k�t�'� CV/�?k5�^l?h�bVC�KX"J�-^$�z����o+�Y��G��4�?��2���^d�����
��U����갈����n��U�H�U��>��'����#�	6�I0�6����s��2��qu�xw���u�1<������Ө�  \������в�34U�^xg.�i:;��э���Sa��@�<O���1a�[�����^MC1����z���8K� �:�8Z����p����;&�P�X��81������bs;4�9KR�oq�M����0=�hP;6�,䷫t�B���&dѦ2l[�-R&�i�&ʒ�@\b�<�]�J�Ë��:S��Uf�����E��N����wuz���zg8�V�y���*�V��[�6�z��VE�C]�WL|�X��h6{4���fU�{����H�A]�%��q�a�E�M����h���d�A���#�'�vڼ��D��Hr7h_�)��pdl���� nUjG7�a���o7[��i;�35�I�3�\/̧Y���l��->��]�E����<��s5a�����6ѣ��ϱ��J�U�5`�h2��V�p	SKi�Y���v�2rC��"vo,H�|L��<�;���|� �t�&[��z�̀��b�@O΢9�ѡ�#i�Y9�D����f`'��D�S�ǐ˫c��U_���:��%�?rMJ��Bp:u31��i2�ƫ4�5�x��Ƌ�\GE�q
��}9qW0����I�pc�E�h�qy{����WL\;	���p >�a�cq�	� 0Ϣp:�� ;��X!�*-����5�,�A�Ђ�`�p8�+6��`���X�3�H=���6�`�MH�^{���5����q#UG?�J{h��_���EqF���7�>�����We�^���ie����c#�Q�Se�oR�۶ͮT��+3IZ�/:�b2��'#C	S=`Q�� �GK��9�0���nH���e/IK�jl	^"LPj4�L+�H�$g��\̡֢�T&���������5��nk���)��9�l��e��f�$Bў­�p:���Q�y��������{3e(Z�u�}UT��1��1���B-���Vs3��G��LE
1�G.�w�c�X1��2Sx,<Z&@�yF_2A�)��-��$[�&�sw�.W��rH�,�w�߾xu��,�SrP����$�6��H�`��a��\IU��??������pX�W$q�AY.gbVL���L��&�DZk;aslr��ӷ#=�7/�N~<��1�U������7�g�C-K��ظ�˒�)�6bc+Yy�$�=
=�s���W�ʓ�`��9'��/x���/l��Ưh3��P#�L�ys����I�m�zs�W�=�J�E��O�ˠ�BV¼ԱT�_3eD�f�!�T�'�Ⱦ��IX2t�{�>�OɆ.�3S��cE�ôCo�v&��CE�w�O��o�WQ�������K=��ٙ�x#1�=��w�#�\QL����J1R�Ęޱ��"���w*��������u����e7����	r�5�A=b��c�qՊ��A`:��_��Rg��������A�-weմ��{(-�ȅ�
G-Jw,r���6o�׃�2��&�Q*�ѭL�$?w�vK��6)&A��yRV���a�"zI�gq�$���lg�{�APlmr��'�!K���^��E"�}� -儗n����],��{qE��*I�WT=�ߋ����{ ���=
�h*�A��[%�?�K[s�8]$����uXðӓ:"K"��~�ԟ���|�_^���֝��p�7B�4����&��lP|~��4M����,�.I��3o��T�vE����B��s1%��)���:����,g�ʱ��<�dQ[�(����b��PsY�x������>����-�q[yw0k����,U��(ϫͤ�(�-�Y��_��X��h #�BIPX��#�y�������\hPwZ'Q��Tt�����INl�K7v�`���EhLӦ䎶��)��@�Y�,���fc�@u�]8�ۂ�W����2��٤6hO�U�F"�2X��'=��௮�����ŰX	���\$�i���7����3!^N��̽��vi�5~F�<�Ȩ� x,V�������PI��n�gY��#IV�LE:sD�)���*�K.��H������4�&���'~F���nzi�iF�ϊ`�W�f3����6P�,�*���Cd0�y�B�ƀz�B� ��4���)��^G�;�J�f�%i:�G�?�f��_����n��+�,q��PL%Bl�W�� ������=��1�>��2L6j��R�ů�z� /�+�V73	fn%y�Y ��=�N��3CXjh�ɨ�U3M`-������tFh�;5!SϹ�5�h:0$q�XdS+�x��|$���#��Pn*}k�I0]a�c9�n�A}9b�j%8�b&�VJ�kS��^�\����A�r�A"�a�ڣ��C,��FY��!�*�X	�AX�dd(�a"��u��Y�	��pg9����%�U+N��M�p�~ʡ#��<W�;O\�AA�Sכ��^<O �	���4 �P|�:Y�R��he/� Lͨ-������,0u2�z��D�W��"0[ �+�N�q����[v3U�hW��T���p,����I�x*"�A�oA7i��tCu
��iC3�6�d�&JM$"�˝$.RPI�H���H�3�]H����Ut&�Ͱ3#>���i�Xb��&�Ÿ�%7+!�#��(ui<�m;�G��]Z�i�g<)�S��"����U�ӣ�^3�\��:(�Q� ����v]���d���b>�p�2�%�R8�#�!�R���3�$��(����u����*I�6V٨5��GrdR�d��ʉ͎�x���]�84�M�I��V�G��,��A[�	6\$�F�T�z�(;K��ry�7o�80JՕ��#K��RI�b�c�ưP�擇@8��B��0�[�?@��J���X��ү�6X�����hQ�Z��Q���?jk'X�0ޠ�Yl�ź�[f�S�~rY�M����Hɻ��l9k�b�R �s��l�e���mð�v���e��� {`o;����`;��; ��ԼA.IK�o�W����VNG1�-��\m�!���]���m�S�)P�W�o�ض�T�d������҅��\CG�3��|� �7��^�p�)j���.d�u�rg9���;�*��s�9���iW+��Biu�Syb�2�q����!u�H�6��Zm����ҽ��H��'�	�����U���4F�e��ݷjo�|���?��buܭ;���6 ʐ�P�cS���}x�=BV�~Lt���S��D[�kP7�7HHa�*w%�~�aRl�����H�:!Bv%�V��� jvc�Dpg�|���;o�nf�U)���
��M�"�(��Х��T��E�N;��S
_����>�Lĺ��v јk�+�b&���Q|8A���E �{Л4���������,vO)1�h6{*߮W�ڪM�c�`��"�u�33>�N�iE�kD'�Q���K?�� (�����vI�;V���. N>��z�(�:��y���F���Ǜ6H�"@$[�7����ab'kG|�����(���"Z7YŰ9-��Y&7���;�����ۇ�θ��v�#�H�Z=O�z�C���� �X&2�W���+D����͇��Z�N���F��� �ԓCAa�i���?In�<<��I��w�5ۇ�����p2n����Z�M�{�?vg�y��<:�F��/@��S��o���Ju�#�7�,��-��%j4�z�Ioܝx�,܉��d'�,�S8`F���o_���j��߹O��͢�X�E��� k���~� ���j��1�N�mw��a�k�h��ˉy�@�5�EwִF�/��-���F���7�S/?�P��5����L���n��ۘ���6��P��F�#��gS�~��277������޴[�8���>�j�گQ�O
=F��!��W��r(��xqO|	7F1�y��%*(��bhΊ$b\ӎ ��9�ħ&����M��d<i�k�ݑ�n��v��P(V.;H�f� ����.��=�{�V�~~�����ӷo߿���s��~���\�z���?˃Ngk`�v{o<nA���a��u���v�����k��p�Iy!������/���hv��N����ֵ{^Y��E%��a9��^����u�~9h��������CZ!�.�]kT����ph7v�E\�@��Å�d�=�]����u��f�y�<�&R�����}�o|�u��[�9l�Ay���vj��m��&Z���@���*�ȇxR(��`6m�tEd�> ��e��߉4�M���n��]�@Ҝ�I]�'�:��螎i瞂H��#7����sM]�#y��,ֱ�lW�t���
�	�t2��c����=�(��4�B�u�2����  ����<������O�;3y�Aل�7�A2L���4�5D͆
�!`B�u�ڜ��/�����sЍ��9"�.�AD5Ĝeh�M#_�M�Ai$b!*n��'�l��2N�0��e�^f�Q�$t6k�V-�{@��c����#`�3
�N��o͎p5��黙�ِ+�� p=U'<_�_R�S�_.X܋�)"�����1G�KQxN��J��K�����+,�%�G�,:��l& �OF�{�Kf�!��+@U(��" 䃐(�,Lݼ�qZy��9��S��8p��������բ.dĘ�Ck�߷�q�
���ǠVQ�;�x��h_!�V�����)m��� ���E�����7˯(~��P��.��Ak�f!��Cl���2�lbs����� *r���*/T#!Z*��z��F=!�����*�ѡN�ڨc���7�d���Yl#I��c��$�hf���t����,K��`��)�ym>5Y�>ׇq�^�:�G̋[�ơS:A��c\}�����Հ����Ó|�i�>�RTd>D���ѡn�I���E�H��ħ=]ɀ:�0ę5\�k�Ö��-]�W�t�W�Zд�XoFk��
�I�p�p`5��N�@\[^�@"}�$�P}h����,v�h&�N$HHe!�<z��sT���|�'���x��l�h�w+*��%�<���S9��7��`[�F��m[k:�����4�V��0�[���&	��F�.ܨƋ�(�����Yovjv۽�w;�����'tBJ8���	5j@9��ONCO5�K����Zc��8Y�ܮJ�"��w����2��AӼ�cF^P1�����$'�s��-UN����W�3���/��y��)΄��Þ�����Ǉ�q�=BD�Г��u���*�{��qt�L��ހ�k�I@	Q#m�HALSa������o�⧈3(�1�Z��M��7�dM�6J��)1�iN=�5�� ޵{�:�z�O��w�r�w��ո�t�������@�g�0�]�+dcq��go�S{����\ �"�	�2@�\D�z������v��s�`ᕍ"C���To���C������"�5�l�d�\"��jG�����::L1����_�\^cCw�R�Pn��;:_gSu�멨��F�9�P���w�ppu��eƤ�j���M�u�,
F��$��i��:@������O w�	�ݸ1�+`�uF>�%�5jZt�5��̼�GA[�p8��%��U��W���!��Fgʥ�Qn�����><g�-
K�\������\��%n�~aRD���Q�8�^���|q覄��L������B.9][��^��^��Y�����f*)�5�w���c�fy݀��`p+0Е`��H<�H4�]1�t<����f^�.�۝�H�G����(��2�xdAK��s���5�nT'�F�A!�*8�dWp���y�t�JW�ݳWK��8��"�F 1F]eA����2��>1� �΋�K�Q0��S��A�2�����\,�uUw��z�h ��X-QPB���0e�D�LT�[��6A5<I�~G;��*�kڃ��,�=���,M_~Ճ� �.�Qx��5�{�*����F+1��[�?C(�%3�h�˛�~��B��ڨB1�&o�݅���B�-1uPT�c3z�>׶j��D:h�zF�%�vD�\��-��F1��B�)��!��֮���=~�
A� =�W�ت�ԟ�Cb��%�ȣF�i:�Tr�p���8{V�Sc�J�(|�k�e`��"S�s�� ��0�4�UUy霟m+�������Q7W���i��bC�&��u�UT5
�4�u��,��q-��!Rz;Yl�*%��7m�=���:�"���%j�1�C!�&jI8QC�E�j�Jay��\YE˼�ך�k��%)�*%���kʡ��LwA��\m��r�Hcܤb�Tk/;?Q9	nQ�G�������_)E����o�~��\��h!��4/����L���5S��������P�ϥ3�> h*�9�j�*����;N&�A�w8I7��vWsW���*�8=���S�Y�.�`A�oK[�b�~ѣRMW�Mw� ��$�h��Qf*x�$Gw�����1���sÔ�".0���M#�� �be���ܫGg(�o�f�5ŧ���H���:�˲����9����c�g�҈��M=Gι�H�|�M�b���4��t��nT��Z�w$K:��p0�=���ty+49�:�[GrL�f�JN]��*J ��G5���lk��x����k��wpP���-!�wqp�zk�.���CnP����xK��y�'�&u��3w����@�{�-X�\Ս��W��lШٸm6���pޑn96FO�q�<�ݜ�����d��hP���>v�$�Np-Osw�-���L�B�
���t�j8��;�Z�2���]�Abc+����g�t� (niE��'B��"��O���r�Z&�S5R5���(cE��C���S��|2EM��������e�`�ⴏ7��G��E#�W�W�C��bV��>�~�+��u�h�7�},��PHe�;;۷��1Pq���E@iaS��@�:H�q@�+��շ9�U�Н5DI������<&�;e?�G�lgO����d��3N'���n���'�,�و<ם�[�С2jTR��P=�
#[�����4���S��8,��QWG�G6ӈ�L��rT�Ҭ�hb�AO|����	(����ɤ1��6a����QC�l[p�:<� ��S�+*��ω�g��̰#oi��o�C�W�ϗX�T@�s���S�c���螑̍g�g��(��0cS_g�KgF�Q�t8(�[4�-�TQ�X��E���|�0
ҝq�B�wF)��;FA���9�;c��� G���Z�?��M߅C7(�I�VlAG�?
T���lE\�k���O�-��n�r�l���޽|}�߽Z��{�l�縈J~���t���ƕH�l2��E&0%s'c�H×�l�=ʃ!>���u�쟪��K:�~IO��{]���X���7��q�_�B����(�F\�`�Z�u��H�R�Thh�q,.�-(= 0|Ŕ�/F������pOt��p\+s��U=��ژ'���b>l>�?��o��z�9��u�� ��t(M���]���i�)���5ɪ�.)�YU��2i9��}�`pґ�D>���iԒZT���[[���R���	�#]�F�_�v|�IV~���/�C���?#��JO�����۟��+�+^%�*R�|om����m@��q��d+�
.�5�W��G{5����������Ù�a�E"�7}z���x41�a�z.���z�ZF@\)M71�Z
��j�d���o�S�V����A;����n���e7y߁[Uhӿ(KzC�����'�J��15� %�s�*g&r�G�%"�t�0��tU3G
w��]K�+��0�*>r�����v	����f��.��W��Uz�_�y���̜���L)(���]~��������2��w?�m�a���0d\��V�)U�Ѹ,1��{�q&�\b�t��&���w&��t�Eo~5��#��]�ܥ�̘+,3^]}�!0`��zH|,�Q1��6G�=�=^��e�Z��.��wN��"����Rz}g=�33�5��Q�s1N\��g������+d]�sR�4S���M5���%�n$rJ��>g�P9��%ܜ�Bg8�9��[�Iҹp��?���Y�J�GT��Aex �V����g�녒�ޛ�H��s�0?d\q�yW���Th��xhq�RǊ9��,|����t� n��V���3a���W��6���57���U'��E�t�/�4f��zb�c��/��{=��*��qs	�f���*k`���Ȍ{�330601000100038562maraton/.git/objects/47/9ac7ce4fbbb0ddcbc5086b06efab690223df36xeQ�j�0�U��%�`���?J=���Z�)~HE�#�>��{W�8	��B��ٝeu������T����t�H�1p�{����(�o�0] ��BH�|�?�w���}�ف�yϚ���Շer��&�t�Ti�~�̆�, �_-�\@�Kp�r��X�8N�e�:*�P���܅����ޗ�6�_C�f�%��C�@M�i�b2��@v��9.Δ��D��qX��C�0��G?׶ϛ�����n�B5��P��_Q��͐U@G�N6�.��� ���
�Hgu�I(�;r���(�Q;ƈ�[�D�2��1B�m8g(��O�j��lG�Op��^`����qv���������V�2?�?θ��168931000100023maraton/.git/objects/11330601000100011162maraton/.git/objects/11/1c11a2ed8e60c281b66a4eb9e8a6f37ad09b2dxU���0D�����BT�Ŀ��R� Ǚ��;�:�{w�ļ���eYc�h�\L	�7+�q��,�|w0�Yَ�0���W?�$d����(YU���o� ��-R168931000100023maraton/.git/objects/f733060100010001002762maraton/.git/objects/f7/d8564a3452d4153068f1e382d7db50adb691a7x�]{w۶���s�w@��H�E=��eI��uS�y���wO7�C��D["U����������,9��^7�(f��� σ�ht:���������O�,^̇��G���7�X����x;��aϭ(�+<�m���O��C����;��i��w��|R���~�o[��.!~T��Q���1��� 6=w�i��1s-g��G����|An(h�{��[Ya��cO̮���=��c/��Ë�׿T�`!Lq㹻�g����WeTB��;0���m:�!���]���+kꖅ5���e-�����Ƀ��/֍U'���܊lk�g�;8(��:�~Y���M���c��2��kw���-Q?���,&A�����@/V�4Y�v�>��s��W+�� u� R��ӓ� ���r�7�{�D7�a�zN<8�g�&)��bϚ�4.wP�Ԍ*�"h
��X����=�r�N�H0BH��0&㞵\�<����٨�;��a�Q�8��ݯ������\�{�*��V�p�i4��e�Z����P{��U�4UwA����j5���)���
�V��tǍ��[�3�*�J�����5�6�bwD�3��8	<8����y���eD&��c�����=5O��Ҋ=�_�����`��mky"��y�g\���UR��Ʉ��]x�� E[S�U b����O�8��@&ɵ���d`l��DV��-�E��|`D3�{e�8B��w�,#�"���}sq���0���j�c7��T� !�s����zwH#ϣ�A�~r]G�9��?ݱ�	t��uEl� ��P��t�ZK/b1��臉�������\X~�k�j�C�����߭��Q�����u�$$��@�
D�fR�Ai���ӻ�<��A-Z��/~�|��%�����e�mvE�Z���DUp���zՐ� ����-��חSBD�=0�%	il5P;p\ht�W�p�_��*W��_�HdVO0O�ǃ9���gAGпP�DgӺu�`횼��Ge���pi�/�;��+c���"I
��J�R���iYe����/C~�����@c^=Dg5�,[���{�m�4�X�8X���ʛ;��ݽ���f?�r�!�6��T�R���mG`�"`����EN��7!�b�0WH|B�����g� ;P���_�l��u+DJ����P��|��c�k�>�h�+u�c�\E���P���П�`W^�A6�������f&1�����������#�%��E�c,�o�P+�TY���������+i�����K˛�A1@��B�j�Ǐ��0���H�<���Qe���xv��c�@��=��y��1a�+���f�U}1�F���
��@\ġ�O+�0X���E���(���:T1t�U���k�?��e0��c��n����*PF�A�d4��t�6��׫x�|��(&d��.�cص[�LP!�pM�%C�(��jyZ��FS+���n�
�̆я�/�xE�2*#(a���+C�^w�>,�Ko���Xp{E�HE��7
� �ڿf��`ʢ^���� kϊn�ރ���%S�*=���8pְ��"^&��w���hi�n�F��ҡ\T=eިu"�K$����e�Q974�ґ���U�[Y�+����p�zC�:m��t&{ �~��녀�4���A���������[���=6Oa-�\�|/����$ ��<�)V�Wn��L~
&��l$`P��0���y�?WH#��hF�uk@��+�`���!=��Z��Oy��Z�ق�֒H�;�6�UDl Ulw����P�lg�-Lb7�J�-��c/�C.���V=�h��x':Kx~�j���9��p�j*V�-Rd��WqkN�&Z��������t܉���F�'��
�)�=����1&����N,1��ț�&x�����D�?`��tH�Av��}X!�*M��O����N�&+�y�Έ�pWl,zC��W�~��ng�) �z`�m��z�26m/��k ��	�F��~,��Pxg��aˇ��d%��VL��<;��Y�-U�P��tX	g}�fl���v@���T�������Z��JJ镙KZ�'��d*�OB���ì��%~��@%s�bL�ݐN�[�^��PY��D��Ti`�Z�Ha��82��F�C9��B��1��}���U�V��㓬�r*��T��,5MXI��5�ko�bs���#+I����������{=d(Z�u�}UT蘎��1�����ٱ��+�U���DE
1��W�c��X1��2Qx,<J&@�yB_2An(��54�Q%��:�s�.W����\z��'�����^��D�PM״�����%�%��>�E���s��r������o���G��Խ&����r9��bz��կߢ3��Xi��;��"O�T�?�]��v�-0�c�*�1�ׯ.O/(�� ���16�l
���؊V����6�9��b�qj0J��n��`K�w�nR[�-�L`�FTI9k��GE�.*&����sB:3�(|���_]a?B�W1U�_eD��j��j��	/�/��3	s�.{o�ӧ����Y��a��{,(�V(��������P���G������u�[C��Z�+n�RuV�}��x#1�[��ف�yD�(CC�Y���6�Ęޱ��"���sHt�R��\e�΍a��N��U�%"�X5�b��r<�J�Wf=\�i���ƅ��Q���kIx\�i/X�qj.������4�LC���'
>fYnl��Wv�Ao7��M���΍�)$/?���s�Z)&^���nV��X!a�"�Ip�x*'���dy��őP�o�v�QD?3�Y�(rه����~�����x'��>��&w���%�6����p�y.����U����N
+����R&�I�;f�z���*Lb�Q�%��xV���O/N��^����?Y����F���� �>���f�t���\W4ć�'7I�I"�^�S�Ġ��,���Y2N���,�Q�N
�U�-l��r�,K@//H�E�r�M��-F(�7�ŋ�K � �E���(!�C���Y��<�"`���t�r�����[���Ab��t���ck�6C%|%�:���f��?ɯ�:P� Cִj9�,��:���'��\g��.si�PGӅ�/(b�w3M��Qּ5%T�#c�X΁��T��Pc�G����\�m�ZA٧L>����f���E�H����s+���Ya��0���+Ʈ����Uu��z�*�@"���5�*B�+��_���� �@cx� ����>+5��t���E�t�ש�y�@$��#�(�ȵB{�D \-�?VʨO[�.�B�¦�����4!^c����G�n,ngA��"­��V����o��M�_X���5�!u;_&��@_1��}l���Oݪ�ꌨ�����>��9<�`xM`<.1V�t� Ds��A�H ��a^NAR �ք(Փ��V�/���>��m��σ�,	N-0 �f�70R	���O>,#�� 6&/2�0�D�.�����ܨe~Ji�:¶)�?a��!��u��ۙ����	���ٳC
� �C�(,t�Al &P�
�n0��M��ڧw	�����Ʊ�j���:��b9N]~�@!���h�i�����M�Dۺg���2�ʀ�6Ÿ8��WE��$��(��|EсGl�(\v/�h�6���I4t���l��VxBYao`���pg�&9Q��6�u7i>�����1D�|�Q9��-P�vY�,�"�k?��&�{3�"C�F��g��P���q��~���4��=[�s��
�z!C��:%�0�O��q��O�@��Y1��-h̴�&�졞����o�P����Aۊj���pDˡ1l0e�\�<p���0����y�ٱ��/w�\�����k!��vp�/��������}!�����/��i�UT���5��,� i��o�k��dO���[GD�Aȹ��+!ko�ZB﹚��|�tc�/8Ë-�G�I��z��T�H�:��.��s��\;���1L�b�CN��Ի�Ņ�iD釼� ��+�*��\r �T�	��@[����X/;����)r��lwz16
k�ևru%���w�ʺ+�H����#������(�k�+#)���e�7�?PY-��p6��΄s�[�& �>�.8�:������������ԥ��-�ը��R��M���@ad[n�����n��� "��p�$�����ܘ�@�o~~���r-6k�b��[���_��"�3�\`��.��%sRR��}CvGL!/Ӛå�a� �Qj�O��t��p�o���`�c�>:���n��5�[���ۙt��F�~��������6�j�z[�ѪY--�/�{-F��v�۪J��Q����Z��4���TK/Yo�h�S���"�fo���C\|�n�1H td�f�+j��a�������/�$W�vbr��<�v~,V�d��X�-L*�"!�c���͛
m6�d�d���֚�F��x������Ċ�9���� �.a�r���mmƲi6Z�vԫ�{-�cYsS9��p�~tT���n��j؝F�;�95�r'��s���v��*�K<�n�j��P~~V"�פ;Xm��uK�v�J�jV�
B������Y/}�h����՗�$9�hE%po|$���*t���=3��_½f�sT��n�ޝX�G��I��4M�ڮ�i4?�{���*�YP#����W3�n֏0)z-0Q����>8�,�����Ȇ� !6C1 ==!�6CGP�h��+�ٟLȿ�Qv�nۭ�3i�'v}�L:��3�٭�{tԮ}6�vO3g�Y5����q�k�kf�&j-Ҩ��:�j�3�p�����)�sc�|��Zҷm����k��,8���h�Ɠv�ֵ��&��9���b���𵴯aA�:���D"���(M��I&ţGR���(vz=$
��pE�Jc�	�6����B+Br���E���f{~��3>�M�P5�@�I�`+�}]���HiiRDƤ2�����XD���o~���1��D�]3�]�����5֚���^;��z�-pt�n�v���7]c�}�G���$?}�B�E�ޫ�6���Q��;�X��sqLD6���I��ⰼ���)k�bDr#�+W`��C�� ���bSH�S�}B+��4�F�c~@]1�;U\�����?MJ/���[�ISw�H|	Ru���	�")�^܉��;�/%⸥=p�Ⱦĉ �2CS�oi�"A�E�L�e9U9|϶)���2(��$�'%��4U)��b�y����)tS0�.@�V�����]�� �DM �=Ap%Q {�m������HP���#�c+�*�Y`����d�AgeS�;�1"$���'�t�J%S�/Y�'�v�j��V��v���&o�ٝ���6�t���1Ƙ��5�y�#��~�n������.��?#̾�`}�8l`i-"�����~��]�[�se�-����[�<�v۾H���[��g�¾�.k��6�q�Y$���q�q��l�t8"�vk��Z�ѱ�G����-W8u�=n����v����.�ե���\�� u��#�;�a��G�+��v�ݮ��5x�V���:�]����ժM�����g�m�.��7c������� ���"���X#�j��*va���x�ڠ��:Xaq����V$�+��ћwuEQM4>�D��1"�I+U�4�Ip�yP��8Bkc�7�#QĊJ;��?؁�=N?��>�ɀ���xeϘ��{�PѾ�d'Ap�����@�O���#}�(7V\��0	tL�?jR�D��8�e������%���m�:g��O]�puJ,m��I����q��Z�I�_ㅍg kQ����ca����?׃���4 9n1��.��P3�A��~Dt�^�Cl��.z�I 5U�C�X.����'�d�������x�z��$*n�M�ᲂ�0N�@����{��%%	�M���EC����4� J�-���7�|���_��y�nn�oȕ�E ���c���g�	�6��Vv6|Ndr�Ԫp���[I<	'oR�
��(��S=�i!Cl�h X�b6��'��N���s<���p6@(3Im��D�����h�������gtL�َ�7(EdO{L�('u&#���8p�c�[�A�4�"
?ד�>����h!K藍��-?�qGr�A\Q����N��G���mr&8��r��m�v�����~ �JLS_eOخ�4�|��!�F~,0��:�E�ǚ|R��dL��n�7Sqr9wt�l�14������v�O�.A&L,h�B;KrDԙ3��,�i)��<�a�f��}{Ǌ��^�|)��q���.h�o�m����'�v~<ltN��?:71�������F��0��r��	I)�� �0���@�k��-e���^�:��hE�Q�N��P��I q���9!,�0@��=�&�lu��b����l�>NӁ[�p���S��C�F��Qɽ�6��c��K�8���2nH��l"w��p�RhȢk�P���t�VBNi�z?�D�%#����E���
n�j��d��]�T�f�z��~y���x��xr�'8��X�D2-�OT�~R�ٲ:]O�MR蹁1#S�F'��Y<C��\<�k0��Xy�d��ԃ�gE���(%�SĆ�;����7/�/曟�^��^�x���Q��xVyuz	ǃجk�op�5��uf�"��݂�!���h�k��#��A�@Vr�N�����蕻�:�X)T���|��Ǥ*�jh��uuj��^y~v�I���=6�9�~�!D>�P�ve�.���l
l�.�M�b��i!�뗋ׯ�92���(�4D��e�0��.�*�(�z��J���ym�aGzxD#-*2Ccdd��l�(B���O�K���G}�h0�m�gV�~Ec��U�<��Ba�.�zz��f*�����q	<���&�{�����$��蒒�����EDAbk�F�+%��E�e�x+8}6��u>;ȹ�]�Dd�>��������lH�gP��4@d�<Z�EE�#j�R�YR4x%����i"T��B�.0����E�ا���#��2��>���G3�s�`�s�4�̠�����"qzOK���5{{�\1���Gz��UFn����L��&3!Z-�L1����������c9gyހ�#�9��R0H�5$�t(j��2	�	�<��k�$}���	��p��)��:��s'8#Ɗÿa��c�C��!�ݲ����pE�����M�੹Z�}�1��0��y}fI�e�_>05!���;���9�-2S�1�n�
 ��ء�zV(�`]Tᢚ 
H�*VKd��Y��3`�\"��-�oi����잤V�a�
{�H�֠H�Г��������� #���1�B�U+<BF�2��35!�F����77~���K
)�h�ӛ[a�
G�h�I���NE^�A���H�2��I��&C��pSm+��k>� �A�W#�/Q���̹!@[B!�b�t,���*QfIE���M79���
A� ��wX�EQ��`�%O�p�vW{���'���$L�2�l_	-�{B���@�dyNh�$���/�~y�(w@�4%����L�R�țj`��4t��!mܜ�c1E�0�2����/�,��q��Y���� J-��7������}�?Hf)2���
����U�$�����vч�%3?�w^��e�^�K��5��7 :E���~�1�d�k{R��k���	q��@9��Q��w�d��q�E�@᠐�h0]p�X��� �&0��[�6B��m󼅞�K�$��Y5�i�)l�.1�e:�&E�t�9��"D5�Y�bIi��='��D`������y����
Ip(p����ˇ'D�����E��-�� Yu噔��P
vcuޙN��[�@rT#oy'Am��&NCR_�FP��*�D�L\H��(�5���t������^Ғ-E`�o��c� M���a�Oq9��f�<�18�s܇q�Ʌ��	p�����ǽ�:8�X�
ܯR�/ݸ!�U��8
�#�8���U���=X���*7���OF)�~���p�HJ ��F2����le\��\^�,-���� /�[� �wc�kq�^����S�Noi����7�q2j���l�&�ٜ(vo��-��O��<t*�kwȚ��tC�����?��ǸY�p�_�D~�lEaRD�yΞ��H��"e���;X��Ņ�A�"(�����&Rk�5�F)�kdHlL)7����*^ ։;���?���XZQx��cz���9��R)P�4		��H�G��F���S��|2E�J��B 7}$dϣ��V��#G��S�/�1ψ
��9�	�Kx ���-R��*�[�� Tz�&8��۾t���B�F"J� �2�
7^�=�^qI~��^��C�$��>�+�b�\���2Y�œ'"�2������;��#����O��0�Ǻ7��:�K�ӮL��Ӈ������������X6�#/>�M�l�A�n�A����,��c���a�����k5(�����69t�����£�2ٶ�@'�P�_����ʽ���H��gX��E�?:�����/ �<�����tp�|����p��'}_��n�n2��X������QCxh�{�-
�s*+J,r[��Dic>�	�^?Y���^2p�����#�s���$��>2pT,����I�ݿG_��D7}�Q�:,A��?
Te��6Բ�&���U�v�w��I���r?r�4C�v��¹��R�;�$]fo�΢�^ҽ1\MÝ�e׸��1�`j����W)�U���Q��i4�AJ=�7�Oe��
&W�tȽW�ѳ��5}�D���{�-$��'�q���	 ���p%�F.H�*h�q,��
4.�X�c `��!�;_u�<	;��k��ຂ��q���E5r辣�w��b>�?�?y����	N*FȤ�4�g34�C�4X_^�U�8�O��q�E5\R|��(zIe�r	�*B�#�S�|&�w	���+G�<-�e��(��~/<��Ad�����
�,����������ό�Hd)Ri�~Y���?�۶qL��mC�u9*}(s��{�%A��+XtSv��A�Lx���3֪�&��~�l��?=^�$�@~(o���e�xQN���@(����@r�d�U�o��\�Z��A+�ĝ���V���4�:�;p�25C�{�Ko���Wp�Q�TԦ�?�¯Rf�!�s_!��weӎ$]4�Q e��XȮ%�����O�)�g�}\��q�u�`3�̮�+��"����c;��<�Ye4���������sp��,���Ut�k}H�Z�`;�a�XNA�d���r^b4K�a"�XB�� ��9W�
��R*
t��6�b��d��16/�ʌ��2cW������6J���fQ�n�xm�W�):�y �7���QR�;�F(���w2�S>3sa[S��:�qd�G0>�]\��:�����,�q{:3e�tn�suq�{�Ni����ZH��˹"�NM��<����;���s�ʯ����$M�� �HԠ|;t+]SihVs��0�s���l.U?��P���s�>�ٌ��Q+y��ӥ��`bR��m�ٞ�u�;���2f{]~��n�)�_}_~Y�I�X�]Ŀ��XU�G�0R5�=�J +~Q��l���2a��M%�n>��0���N�G�33060100010004762maraton/.git/objects/f7/86ce8b386f12c1f56e665f373361bf6591321cxK��OR06d0V0��2P0�2T0�2R0�R.��-�IUH�L�I� �	9168931000100023maraton/.git/objects/28330601000100022362maraton/.git/objects/28/3692ba30ae7ce838728877301ececee5a67b1axePAN�0��WLo6uP�8E*�|h����خ��viaO��ٝ�9L��?�|��`ޗO@�w?�'b.>�,�@�(t��ܸ\�O��P����(�1a�i>��u�'�Fi�uU|��lm�JE��U��и*Yr����*�^>�\~$V� 54�J��_����{g�1�����뎹����N�f�[+kq�hA�=Ü�3�C��/�p=(���Pt�168931000100023maraton/.git/objects/933306010001000138962maraton/.git/objects/93/52b0159073c976b9a3301219cbbf6a1c1a3727x�Vێ�6����-H�^o.}�(�C�"҇�k�ms-�*Iy�&���!%�� H���-���3gn\WfMϟ>���.���3e��R�J�5'���A���i�R�/ҴuJoI�Z�F��/����J��(�(8��wmL��=VzU�HiON�-�^�r+]>����w*�e�9��u;QU�-J)�(Lݬ
����	��bǰ8���	'� )譅�YN�J��=L���N-���w�5a�zD��S��
�|x5M�\>����X�6y'�*�7��	�g:�#��K�16cj�dJj�R�����T�w�}7�o�r��`�n8�����3�w���.T�	���eb>�z�X�[�	�S,�?1K?����+��D�5V�]=&��J�_��zé@��V��v^�>l��
d�A{GfC��V4�����Z'6Ph�Yـ1�'��$+Y����I蒔�VxH��T%�a֠i�I֍?������k��E�@�,$���`Yxu�Pl�8(�6�)��T��h+�M�3��W�<��:^��`���F=��*�P����XSH\hZ��Ckӂ��>�){c��캂σ�h���-����$Y,��r�K���I��gژ��ki9P��σǜ���w�Z(z%kc����߬i�S^��>�� �	���wH�J[+v���/ƒ<H{��8�~2�KZ-*tN$�����`��B橒�y�����UU��F΄�l����>����_$uE�\��}2��z�:�����V��6R����� �=a2lz#*dL�	ߴoa�؅�����C#���!ì����!�1�P�^cҳ;c��>�@��A�"aK
'X�n�r$���HW?��;Xj-ܪ�BnV�`HD �*0�,ׂŢ�� ��Yg2�G�N��|pkM��j.��n�Pz
���5j�r�2g�!����ǆn��C��;,�Q'(����9~�������6^p�.�Y�7������NZ�aHp��t��}���$6#��8��+F�q�������=;���ѣ`"�*��<A�MJ
�k��q��n<X�W�Ӏ��'4%����|3"I�&�@R����.���:��e\��,[N���r�g��>�CG�����<�����c��0���<��5�������P�c(\
wϡ��b����}$���φl������W]�ߡ�>���l6v�}`/�험�9M�l��^�4�o7��/[�<���7��p~!6��m-t�)+�2׆�9l����z~S	�+�X��Q�Xޮ�P��'�՝���|#�g@�e@5d@wM��S��(����Y��\bP�B��`&���4��:�����)?<�ó4A��簒x���M���168931000100023maraton/.git/objects/e5330601000100012062maraton/.git/objects/e5/f82744edd6d2bd9b4bd7517e35e54d9bb09c29x+)JMU040e040031QH�֎/I�-�I,Ie����竑����Z!�>01 ���Ă��[K��o�[a�i%2�9��������������OH3|�yu��������
 O./168931000100023maraton/.git/objects/05330601000100031162maraton/.git/objects/05/3b0681ddb6232e52f9e54da629924df28405dcx]�OK�@Ž�~��B�$�z����/�"J(�d���I6(H��o���ݼy�{/[cMw��Պ]3,��y��dͱ$��2�{#g�v�0��ٷi�j큝����~���^��&M�f��'���U	��T�ץ2!忖��G�.�&��Uî,=J(��L��8Q�E��pé�F��,.�2�v	��ꄚqq@��:uB���Ba�/��]E1�UA��"*:��w,EF�!��T�a'"��| 7�Qu�3��.a'�U�a�)~ˊ./Ћͣ^��R������y���<��`֠�er�gN�����168931000100023maraton/.git/objects/cc330601000100093462maraton/.git/objects/cc/e13149d533dac4ea16b5be74d50177e9dc8f89x+)JMU0440c040031Qrut�u��MaH��vl�ry{���Zf.iް�=TQbrA���^rA�O�
�چ��R�d.�����v�)LUJJQjXgM�]�.����K�7��.&8	UUA%Ü�ٳ�wF�ϙ�z�ӡ_��h�U&���O2M�]����MK�����sT^σ*I�֎/I�-�I,I�+�(ah�{�tj�����������2�61/��0)����_F<f�塴#Kg���E%�y`UrJGB�/�:k�cɣ]�����߀�*N-9�ՙȦ���l�f������Ca�+ P S|qrQfAI1C,_u����6)
���ez\k$Ԥ���ʂ̪�D�������ժ�$�c�;�s՟�
��&�,?ҹE����,��&��ȅ��H�K�/K-��z\���L��S��u]��Ӂ���+(-ap
��D�냎�v5����w^�*�J,K��/ؠڧ7'<rb~��y�i��t�V�kW �̭��Lb؟��.������{'?��L+കW\�ZP6Es���Ge�Y'L0���Z�/U�o�ͫ���Zr,{���~n&2@姥g�����:���g',=��H��Ci>�2sSS�|��f�	�����X`��u�qY�D�)�E��F`CX4j��Z�Fi�4�.����(37��l�ݻO>_s���Hsķ]{?ƹ�U�'����d�0L?Ļ����z{Oe�	��ʒ��<xz�xg���]]�SA"�/�=�?�ѫj`qIfrvjQq<0�Ɨ�WBN�_��".^�{!�W��l��IqIA"$��{j-gxs�Ot���Ð}m��P��%��%`���<�[���X>W�޲��]_/AՔg$��V��ҵ8�mE�����YcӧV��ʊ���| �������z�g,x$�(A[�� ���33060100010001515862maraton/.git/objects/cc/7921c3a16b724485f4c2b92c118bed1cab2f07x�}}xյ����!RԨT�
Pb� O�L	�Q����@���	*��P�1�r�k�j{�R_j�H���ǣA���FK%�Wji{��Jm�ּ����3{����y����Ѱf�Z{���^{���̙YQ۰�W4�xr������ii�:2��]�!1%L��O J�b�4�;�8���L���	@�GM�f1>���`��f>�����q�i����#���:�k'|�ɧ�����H��0�n���+��#�l�^ҷ��a ��NX/2����vr9s�^
*{�M�oӝ�4:$^:����s_	]%Í�����7P���̾����r�_A���FWL-���zRm���uRk��IS���
E�I>�^��R�D�eQ�>
ׄ#������%9?9�;k���w\~���ɐ����4�$��;�J]�ݧ���u��t����y�����=�{�_���������=���,������x�o��U�1����y|��?��>�O>�\_�'�s��9����oB�3�s��oIb.���b|g��&�����_r	��T#\U�Pl���b��,[�0Xi���6�"MKΩm��,���H�;��E��hCspE�9RTV���WA�j���s�T4T�T[kk�1���P����W烫����pk(�5�áX���Xa~0�ijX��ԯ��#MMM���Bx��ٿ$*�"�յe�XAA�&��5���沰߿��P,64ǚ"�������A�T4XԊ�Z��T�+B��PmmCX����9���k����z��:c�AX4��L	.�Y���a������������X)x��Wp�W�Cm��(��U���z�Nv*�V���f�*0���k�h��HsK]��ª���X�5
9�+��/���A�c���eW͙���o\��l��`a^a�cNUլ�e����]U�"�<�`
�.13���t�,A��2A(z��f�	>��O��k���30� z:����詔�g��p�����c7��Lc��M؂��a\�ב��,݈py�gU^��A�����|7�{���S��z_�,G9B��tkx�#	ߣ�Y4��^����$4<�,u�i�3�_ß�ᷱ�d�^��5�i�Pq��lA�e9��J�""�4<�^����������c$�X���Ou�#��U��\�ạ́J�3���\��QPk4�p��Qß��[5|��ߠ�s4�m�-_h�_�~i�/-���Z �v4+�>���a��K�����m�90�=��¿#Ɣ���k�~�w Ǹ�tM��p��~��)%��/�5�������yx��~��)%�,��kJ�7���R��Fq� ]S�?�\\�C�����-tM��p�����)���ߥk
�}�z]SH?�#���B�aC\?p�a�܌kq�OY����m��ʗ.�4���0ݦ�/��Qh�����̱cJ�r�,l2����ؙ0����O�1f	���g�)�L�<���@�/�+qe mo���c� `
��])�Q�7\qA�Z.��]�g�D��h��!ILB�5�g�O�#�_��)x�� V�#'_�o9��k������@��@�+�=��������� ӎ+ە&�1f�&0�_��U���}�=��N�J��Z*���K���y7�?�h������Ią�w�����3\*z�$��
$C"��ffx_@4pS%�HWa�Pncgl�R?��vc��s�]�������>��x"�#w&�;�+����7���j�2��m�G���	4kTW�w�&m�X� ��������#wBUtqe��
x@�gG�e{�r*� ��@{������#�
�.�|` R;��}P���B�FR��]v�FN�F�H@T��f�W�F#�����}��E�e���_eG��,v�-��);)"���Y�I:�L��-�[��o's§�M�/�whq�*	�7�gA	���^��E�^\nF8���z��Ң�����#)�����MWT.���=Nf�1�c�`���Ur-�xN��.�Qj�k���z?J�������s��ӹ����%�D�i$����Gӎ<!�H�a�����#���.�!�t��]���i�?A N�'Fl�Wq�P��O��D�'��  �֟&�0!idf[%wO�0�NV�V_Cr>AF!9[��rٌ���6oZ�?�v8�X�a��F,���\��]�o��ت>�۫2���7������"�����ҔѾ���aln���k���Oe����"�EgL��F~��9rn w�o�f�/|��No$�Q\���,��߶�����Y�?0���^t)xׁMg>Cn�R������&A�b(1~C�[$��������
\��#���`J�kJG���������߽YO@��%D�}.�`���9r���5�5��� s��
v����[:�W�� �+�9G
���k�J|���3$2��s��K�
��<bEC�aE���I��@W�X�m�L4_q��4��m�X]�T[I%\�{\��YG�hRP�;��H������s�����Tk|�(%"�v�S�hXQ���Ot�w���+�7�l��\��X��R�Qx��d��@;z���i�.o9
Ac�ȧ�����G�]��#�XZ��nJ��"�@��GD���+~� �NV�,ݡ���x̤4���۲��$��3=f%*e,"�0�mi��2qL�����'&
�ј�4E�& _�fɤ�[Ў�V��J�p�l��m�&���ED���̷$I�]ڙ�
�&�i�8�Z����r���p����\bMnu�)>�է�v�X�� ���"4rv����k�m}$��Z> �dJ�v��t%z�(�W�J�)�j�Ք?	���d�zG�h�j&K@m�{�d0Ox��Ʈ~�'^���C��xx�1�a���A��fb�e�|3��+{��C���؅���F�b�_�˳��>�a0����B%;u�mV�0G��66ȁ�:�uX���;�H^�8�$k�&ͺ�"�h��ҽR�S�����<̍jMx�� K����r�����H�W|2b�D=�ZB4�XH�P�Cd�g�Xm
@�N��#ж����Y�����Jl�S:ŵ�u�����p4GO��M���9Ka�
W\���=�j��.�w4MU�$�8����}a�����)Bi��uә�CE|���!!XH3�.:�f�o�*��ҵ�l(��Jdx:X��Gb��߉�T@8�72��a�QB6r&i�H��
�#[_'��7C8D���EWK���9�Lx5)5��ӌ���P�u�4L�-�r�\W�TOB��;(��f�n۠�02�[ceG��s�|��� �ٶ>aĮMj�hYL�	��.��+��QX��J�BS�~��D%ɏ�N����܂S<5�j;*ǎ̢?�]r?��EA`}�+��P�+��~�څ��zY�W�%M1�<�+��D�h;!Õ�_��&��g-����SiSE<��Q�� .L��4�EBDz�j�0�p<�8pČ&-f<9��a����QE�A��lQ�[�($9��vR~��&Ah�m:s�yD�$9�Bğ���q�ؙ�Ï6��/����%4t��8��!a����&8$���PgH8��"����]Ǒ��#��^ �t�Y�ȇ�\I9G��+�W#~�R�3��Z��.#��e������H.F���PU;p:���4�������Q�;i����ѷ�w3���u,��3��h=�0`�˵�{�Q��2zY�m}�;[H�	C�Bg���@W��>���Z�ъ��҉��]	b��$�?%���T�5Mf��>�$�T��b��<&A��|B�B���d�)�z7���=N2�o��͝	��/�#rwB�����Ȍ2.���r�y�E��9���$�F���Y���x�c�K{�|�*C�~7�/�{ZN?���C��9��(��J�,ܕ�9��'���ؔ�yIј��G�Ji��g��3;�������vSG�L+d���&�t�n/x%^k��⒂r���y%�ӗ4���(g�MČ����
��&`Vg+�����U��Ӻ=���u:M�E��G,��Wi45%�;b����]�c�S Z!��O�KN$HW̊0�y'!6��|������dIR��i��ϩ
R������Jx��_�R�%Җ⟲˶i�������/:�}�T0
����;�޷�����7���A1⵼/".��o��q8����m�7��y_��>����*�R�X���t�W����8a��c�[Q	��m-e�.�2�9""m�K�����} jw*�(n"b��8Bj� T����۸'9F2�{7z�\��c�TGd�������L��1����Z�eڣ;]�w�vK�*��F�8M���m��?�����J���/p_-�+ձ�7�0��ҹ��VV�� إ-��
��{,��v�k�0�:���P�����T�~[�9&�m�:RZO�����C�ФN�������3V1կ�=C���h�������l!U���-8�A9[ѻ����ɮ�W�e�Ä=���)��n'����y�x#�� ��6��Ƌ�#W�2*����lI`'o3c�HV*F�d��^#�#����	�G���7-����=��W/�����ϻ�CϾMل��-��D�T�JT/x��d��+�<z{0��,��Z��6�Ak.����S��e'�E�@6�MG��j����E��Dc�#-��@=b�'���U뻥ia���lڝҴ�d�D�0m��d��-a1�ŉ�Ri�#�c�u.Y4�:p_�NSM�dw.��Ȼf��5�[��Ĵ��- R��dO�*z�ˊ�Ck���&�s�?���ߴvasĴ���H4�E9 ��d/�˰h���(���\s��x���$���*�6��'��r���y6��=������ּ�P�4���B�F�p��#�dv���l�&�IH?�Ԝ���&(j�"��8���Űp�CW�V���(�����iM����ݕ���,p�����uˬ�6[�����2�"
[���� �,s���ӴL�,�K��2o(,��ꖡH�/��"�S��]��j�aU�剗��j2&�3�E�%��(�֗�GL�k�M�R����	'Нc&Y�B���.vk�(IuR\l?ռC�>���yC��yqHS^��y�~���Pqt������Z�u�P���j��Jni5	#��TӆY�mH\�o�+/��SHmb^�蚮TW1��K%r�I��`ŗ3!���,�Cf��t�j�)�7OO%}ҕx��n���b;^n����);C=(ғ��g�:�M�z���3XW�P/�r7]��3\��j�W/D��d�u�TԆk����6�vɾOx�i�d�<�?��A���R�m�%�S�!E�-+�F��=c�7��f]]�dV��?g�	�q���Q�4�X�`=z��]�̈�W��1Ƃ���OJ��50�@�����[އ}���~ֲY�ϺaV�p���L��)^Q���|i�/-�l���cu$kh�1?U�����Ƃ��F��O���q9���1*�=0Ѝs�Ձ�~��m�|��U���w�NA��� �!�t A��>�xF��@���� �=��1�K1�p�~��� 绀����!�~�Ld��1�8����n���OnL�|w�������Qo`�3p4� ���p(�S�v.�l��/��� ,�F����x+�����>xp"&3���%�_�p�J$���=�; ����#f��7 �/j/�p�Ӏ������p'�K�=�YA����/�,����: n#<`'� {�4�� }� ������ �8������8|�U x)`��x>`-`��� ��e���G7��qcn7`>`.��R���1���w~�I����<8
?�<�b�E�U������ ��w���5�~�^�\�x�T$�b�"�*� [� �>	�� `�'���i}(�}^X8�
�
�p%�V��|
���~�<�����,��
0
�
�
��W�;� ~ �X���G� ����`+`��(����0 ��Ї�ê�p,�r��7 �����e�^� �h6�W>�ـ%�}�5���&�m�� ,��08���w�����X��0��q��� ���ߏ���k)`>���倏6������>Ey���ғ�9�b|�n,~�����v ��|����?z�?���/�lL����v ����k�6q��[b��椝7����i���Xj~30p�d��󣯘�K��.�윹ٹ�F��&k�q幗O�<�B@�K�r"̓����Ƨ���1��ι5}��CB!\�f�M��WK���� �i@���-#�Ò�	�-��<u��͠#�X2�,:�m:t�������6SmXi�/}���l����F>��DKt:ڀ'K�:�f��+_ z�{�L0��d��~���?Rp�_aqUɹ<]��g��a{f���M�=}��u�KN��z_L/�Stz�E���1L��߰�E}:N�/�荠�x���A?��:�z���g�O��5��a误��*��z�uzz@0�}r��;5E�|Ћ@�g+�7˗�N�r��������t�����U_j~?
:�W��i<߱ڱ���1e�߬�
2�~70�pbd���ꩴd|����e\g�GgJ����kQޫ����t��M���et�i4��6܀���6�_#�$���<�F���É�z7�d��� ��0^�|�.ŋ�}�n�c,�tB�_����F�Wv�8��!������~�٠�z4Ⱦ�zƣ�ދ~�<�^O��V(����E��|鵦͎�����e��c=�>ȥ�!�@�1��kL�T��qT���f7�VЋA��s�|�򽭠��"�.ò�M�h�\��&{L�t��x�e���{��; �Ɨ.�t��ڠ<^>2��A����ҵ������=t����s@w���X؂�?O����Vٛ|�?-=^��m�X�3dя�� �^��Ĝ����Sy7=Ɏ@�ˣ~�Gю{@�x��RT;�|�2 υ�1�z�}{
�A��[~�Ad�����.����e�Q����֛���K:�(���:�d̳dT��{���o�н|j+�?
�W��	�C�{�T�σ�������ιXo�}��F�'��A�u�Î��C���x3������6�<�9d'菂�e�^��4]ϹV?��ƿ���ӣ��v�������%L���c���v~�/�y�`V>�ڒAk�߃�M���� �W��:�=x��C��ê_��L��_��cA? �W�(���W��	��/Q�6r����i1a;��Q~�N�r���}�N�朇@�#�:]�C��3�Wqt��2��{�X)蟀3[��|��?��eߍ��t���:����{@�ݳ�A����3Q�A���X�� �˾���~^���t/�l�-��r�����K�=������;��k�h���L��ϫ���S�cEe�_l��R�i|�uzz�` �ՠ��^�|]:��������н������-��^���31}*ݳ��/ݭ�4?!�@߀�̏��U��|�ŹZ���ٺ��-=� �н��0����^�н�|�OA���g`���8��C)�@�MA��MЯ�ۿN���8����nL\u;�Բӓ��{�^z���)��@_��F!�V�>^ד��'��^��s���� �#����͠��������y�����gA?E��@�t�vP���~t�^����қ�0��,���Qн��2Їb��+������@	z�^?����,�SA��tM�����~�g�(?Gt���~���ZY�e�/ݫ�n}�^q�>�g��No_z�� �~���f�O�f���#�{��g���W����)��gR�_�C�{��f���˾��~�ߖ�i�gAoMQ�-�����@�^>�Fa?pd�y(O��َ�)ox��x|���=;0 Q�\� ���-O9�=���9?L�g�� ß�۔��ǐ@v��C��m�\�]rcv���Y��gg�fg�vv�x���S9�U�\�\�s�W��k��2n�����qi�=�6���Eog���@&�>���wCPN�5��/������f��(c&ʙ�#ӈ��g�BF���>��i}�=3m�eC榅��4bVE���6�!�i�aw��S)SE�Aڐ$�����z�z_�z?���	�d��ӻX�P���U:0u�b>�J�c������}�b���xs�<��Si\ҁe�8���tO��s�H;�d(_g�,��c����m�!���	p1�h�H.&�D��8�5"�>��+Rx�W�C�]Ά��N���pS���u9�k�nՉ�9���u&������;���=���W2\��V�w3|���e�:�?3���P$q����ck�:�o1��_Y�����B�IS'�;���Qx�r�N�1���0��΃ޅ��Y�ѻ����C��v�)��;>�P�dǟj(?��ʟ�x���?���O7|�S���W߁��a�8a�Cx����xӹ�?���w���Ѻ�?�P�H�fg��q���2��;7��{�����#zޔ�����W�ҒNa%��p���3����r��inC����Wy@J1�i8ICT�o���O�O�$_�Y�0����l�������12Kp�C���8?��mh�\R��p@A�0^�9�I�[�>����������	Œ��_Ƒ>��e����?�QI�v��I�;H�,���_;4���5����Ŧ�1�8�K�C�� }�S$g'�;�?�J:���YS$Iyꃌ_��~7�J�b�8���d�]�4�G'`q,k��In���K��*�rT{�����L$P����4�:��������X��;Η�j�B��H�~F,d9���*�yda�B�?g��g�\���&ծ���Z ��{��A<�����2�D����ƿ�/��z����y�b��2~&Pz>��[/���b9g��I���	ɿ����g��J����.q��t��f5�0�����?�%a�<�``��eΠ�V"��&q�e��W��_��+T��O�wc0�z�/�r�?�g�l����M��/Ő�C������(���X�Nc8��UR�;^��?��Tv����d)`6����z���a����Y���,H�)�(,ΈO㽆6=�BG���s��_��!����v�ac�� �ޕ�`ǿ0�,����;�%���<��c;+93�W���ѧ���U��>��|�G�e��㰪��0�BF���%���q�\��lt������X���~�dT���f�Q���?>I�_��c�\V��d���?����#���Y�8�ǸL���u�w��ڵ�Q�c�����U�{�Ց/�#P�5\���g:���;�wh,�7�2y���#�oc����`����}��O3fz�^
{�'ϓ�a�|@�����qr�����]����>�"��g�	���f��#��8~��y�P���o�/e=9�C�"�?](����V�D��g�c���a�b|7�;e���� �k1ˁ{�#����O|�����?��>���8.ő��E�oe�ʟ�S$�?��U�_����W����G�s�Q�������8{f���F٧x7}��u�Tu>k� ��oU~���g١T{��|kݧ�-�l��AvXz>�������濍J��]�'�I��3C�Uv8�xg<���3�:Y�8y�M����=�N����Ì?�vSv�3���X�^Əb;(��L�1��T`U�-a����O��9?��;���w���0���YŽI�?���_�経;Y6�4n/�#�/e���N�5���Kqd� �wΣ���$����g�ݦ0��;�Ç?���R�"�R�yl���ƿ��5�o������9X_�� �7q<�fo0�q�6����O��^,���Ά�pG��{?q�������G��=T�L�j�^���2�����P
���3�N������w=��b�Wj�����^�N����z�,�Z���9�60���%����Ӻɹ�����P�W�?sп�f)G����A��qH}���������.�#f3��)~��a���a�fH�3����'���W�z�;�5,M����B��C����b�\�{*�����A�@է,Z���=1�P�c�s��c�?����w���!�_�k���'����_J��S�:����k�y��A���{Ð���{�����5�?�hd�������p��O0�9���L���_c�L�75���'u����� ?g~�z�m�O�߹�0q��t�#��w��.�w��f����fe?b�s?����(�����;���x����;כ/1�9�����u�9��O�g)�x�g�1�5���ߔ�a��8~��E�K�뗕���y=�;�d��l�3��3:�>�}c��<��g�/2y��6O�����uG��������W��A�:z�%3޹��c�?���G7��/�<N6����+9/#�#�A����H���1�9����[��? ?��Jq�;�-��f��2�E���d9C�0��-�g^�Q���u���������=�P���!g$�z�b�ґ-�`�s�*��F6�r���x���e�;�!?d��ܿpq\�y'���e� �_w���_�����{���o��bͱ��+��]�`�.�/�6�C���U��z�6X�_O7C-�F����6�T�M�\8ŝ)���F������`�>ִ�X����[��֢�v'~���N_���(�K�
�7F#�Țhs$n��Wr[��iY����h�eQA��×t	�O��
�����Y����*�UϞ� EZV˂�k�a�j����=%��Z����.����/*���]��?��@�#Xz͢Y��fkD�!>`lV�x��
?>�;k�?},�'�*�^���6��MeѨ�"TVQ����k#�&�	ނ����w���e(��e�j��޲(�E�~Qz2J�W|WEb����[�!������O������ɩt��i��x��a�Ȳ緄m�.)_镟�O���J[;���0FL�I_(�FZ*�*�Կk�?�������2WV�i&���`�4���b%�۬���K��`r�z-}.�4BqV=�Y�'���d{�MA��C��0}s���B�%E�`��-U�u*�↖�Q~S�f�F�f���@�P}ۚ-P$�.�oy�[�O!��x;���HA�&T�_\Q(�>L��VG�f5�Z����a��H*?Y��E�R|�{:x���\����E�����5��t���f�+��[2�89bi�bX�F�C��4U[�Ipi�����`�.tS$(M������#�1�L���lH�	�������P����l���[��5�i��d!q�bHC��r8��T(���O��Q���z3�D�!��Ƶ2�LV4�t3���pa0�b3��iv�{���ȷ�WNj�\�z4�5.��C��Sŗ�i����S@K�������F�q��`9$�C�b$��h}��9���=meCӚPSu��X�F��<#��)�2��G���E���Nf,q� m��45�A*���o�-5�g\��� 4
Nl%3�#!{�G|�^xy0��kJJ���;��47)k"!��L�u���B?B[�� �6�7E��¼�<N�.����ޙ��U]U��T�[Ѳ1������֘�¢e�b�����掚B�k`>�o�5��{(�Ci�,b�W�.����E�5r4��`zT�R�p�ڲ0�� \2�R؏��D�a��k�-�P]�H�S�In��J�izX�=4���n�*u�<�2|į�f.�������1��IUqc�6�@M]�k�9yZ��*�"���2��Č�|J�"j#��b5�%MM���I���l2�#� ��B�A����F�,t�	�\YYs��_����Ӽ�
��K�����,�j#��u�S��n����kNA�\�I"V���>�R92�9NRZ��ҧ�lj0�F���K�I]�O+��;E!��B1Xz�ǉzgX}�\�e򼘔�ɾ)�W��<d�<L[[�����
Ʊ����'ݕ�q��={_��5I���Jn'����0���o
b����R�jd�N��9���@��� DY����a��jP�3���RSȜB,��(�	�l�E*��RE&��}:P��Ki�d���	�ola�1�Tv�(Ȏ�:��t=f!֨E%f�!I���D�����-"����g%"���fL�Q����}��]��]���M�evT��YQo��
\;E��[��Z���t�"1�������Bv1��ھ͂q {��,6U�_�[�m��GnN᭕�)�ۻ���S�z�M"�O��]L�1�l�ƒ��h���f�5��n�����닜]o�g2-tOrR��k!N��q�	�\յ�ɋ�Tc���fZ3{Wk�1y�1�lfkLm�v�ؐ�E7��(�¦��a��|i����5u.���j�-�Qz������p��Vʩ(��5_<�N�"G�SY��L7�)mk������K**�~g;����9j7^߸�gߜ��S*�$�e�3O�7�y`��ʦ\������@վ����աZs��ANaQ�5ĂK�Q�R����Չ������;�IX�I�E�,�yˀfМ l�H5R��l��M5�Fq�Ì�L�Zc���Җ���6z1m�ٌ�'�'�xV�VmsU��0~�r�E�챌�j�'a�q뾳��iv%���M5�P��<��9n[���4��!Z�i��欆���ݵ&��b��.��u�KC�N��!�Qm�j��fys�ҞbOء�mR��<+�'V��&��d�X�MO���?`�T#��4���B���]a��POub�WK��'���)���i�W�Zk���b{K��������]�-�]�YA�Y�ݭ�r�(������z5��p��Meu�#B�.��e�L��|���rZ��#ߘ�z��fV����	Ҿy�g��B� H7��F���B����-�Loli��M��M0� �ܪo,q�]���c܈�g�7Z��'�-��]���꓿��IZw{{��
�"k��Q�!,�_D�Ai�Z�8����~��RNw�����t��r�=�k����N�M��YSDerk���9�y��cO@y����OS�p�^-�j�ᚎ-U�p�X��m|�x��b-l�+��3�EZ{M������ePs_U'�֖�d+^�G��s5Ee�	�(���1�ZBhr���d�6�"7��-�T��a �p�@��eem��r�IPn�<OO;"����b+�Z�?E��I�h��R_��p������w�H�^Y������8 �,d��A/ �s��O"����TX�PsB��i���e=��٭����"���w8�D*P�P@t.��*��dG�{���W8}9���"5���-k�������jm�]S�I��u�8]��n�[Ϗ����I�rX���kK�"���.'��h���$=;s�[Φ��V��-�A����Nv�Z��(�%0���6���([Jk��*܂�4a󆞏]Z!o�jKT7�^���x�/���_��_pI�����Ә3'��$����`�W��
*)�'��k�u���ju٠k����J��Mhқ����l�|�d�s�;֤�6�������p��9QЬ�"��0��C�޶�r�FLve����頩�����Mw�s�vP�zJC�I�P����� �9ު:<s-��iZ����~`��&*뮅�.k��N��i8{ft�z0���<���Jw5I���Dć��/�:����*f�A.��(�ʅL&^C��
�s
(��>���/���8;��m�,�Mos�%Z��q�`�Ψ���SyJ�j�5����V ƚ$�Qg�z��F#��!ɛ5�lR,�����nފ�hm��h��GW5��#�zm=�Ik���x��6�]Ak�Ԇ� �5�ƌ<z����iު��"�!,��A<ݛ���L�TC����p8ȏ��GB��9����Qg�.F���u��<���<���?~���/���~��?k2�K��O�?�2kQ�[R���)Zy��:}��a��~��W�S?�����s\J�><�sqa��P�E89��zo���L
j�*�~�z5pZy�~=cJ0x�p����]��M��O�"Q������	hz���V��Sp�#�IO�?��u8!����̠�z���_�W����g�@��?k��T��8�� 8b!�đc�x���p�T����+�4�C�q����:C��RB]+�cGy�~B����Cկp?ŉ��z����*F�����˫�3J��!�l�������T�*�+��[����y�����
v��e7%�EGy��E�#Cg�oO��#ߦC��n��ioU��A��S���c;���#�t�k?N�-���;�T��a��rJ��(C�S���@��4|�D�_U^��@�˛��[.�l6K�UN�!(��W�3���i��*�p��0����;�K��ʱ�������?_!��^����A�Q���[.�Q����B�)�U�h|)�e	�o�z	�;S�*^
n�G>*9�qp\�7o0x330601000100087662maraton/.git/objects/cc/2469d0d6d9f5397583693950c33d3f47a4b6edxuUmk�0�W�W\)�I��ƶ�n�:�(�%QcK�%e�����$�qGJ��sϽv՘����ݛK�e�k�ҺZ��v�Y��u�����_�I(��H�{���h��D �9�/k\+�����/է/_���l�O�I���ϊu,�)�ϝ�Hn���\�,`�>U�8��<�)�v�-�#��
҃��!y끰3�Fՠ��;�x\�nLft������~|����t���leoB?on�]&�^,�bq��YFX
�G�}�-���Pu*?T���&�t���5���Wd\5�R!lb*V�A�G�8�y@��Dv%�3d��պ B_bs����m$#`e��L��n����b7b�H��ZI��Pڦb�h�"-lΤ�}e�L�XrVfU�yq���1�" �ӡ󝎵ey��Ec��$
��@�Y��D��L�:qN���:�5>Q:JE��S"*4d��%�EK�)xt�lz���1R�C�2
N�f8���Y�{�a���օ�3�J�SV��0e*W��T�/��`&JӾ�FѦ�t�!>���z�f�������J�3ƁY�jm�(,d׀�^��
7J'c�8M�e���!Fċ־mUX��[�`�����c���Jpq�x�g�Tيn�.Q�EL��d��h�y:I����ͣ6y�;J^����f�ݸg?�9���YH
�dBL��L�w,n���E�����'�M���[ߠC�v��[F��brd#}�)� �?($��Fp �
܎�
����p	F#�����V���s���/�h�U��A�%�Q��w=��!�����k&�3���7A��G��>*�.�weR/�}Y���&�~�gs�!� �7u168931000100023maraton/.git/objects/e633060100010001562maraton/.git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391xK��OR0`  	��168931000100023maraton/.git/objects/ca330601000100011762maraton/.git/objects/ca/3acc5982f1695b06a69aabfb6eb0720820b1eaxm��
�0D{u�b��%R���B?&A-Md��O���9�^\K�����E�T6"����6����cڥu�Tze0��"HH��߹�oP���S+`�,����ۤ��!�4u168931000100023maraton/.git/objects/d0330601000100015162maraton/.git/objects/d0/3c383a613971bb1c2d12873953e28f65115392x���m�0E�~k
-���H+�"�H��;�#7�'��\���ό���܁��,�5�^]Pyi�P�+q)���q�p�;���4k<L:+����@�j"�z������Q�xa=1'���h�����Kʢ�$�H����M��	���:^b=>w330601000100050962maraton/.git/objects/d0/b0d29d7e2c76c4fdaf227471b0bf757de1c4c5x}S�r�0�U|�fzO&�t�6��?���r�p�p;����$�tz�Yޮ޾}Z�~h��Ï�_�j��ӎ=��r}�(�b����~��v�2�8s�[-Ym�P��iDD�>�x�[&�m(I�qt��I3J^�)��{�όhjq\09�"A�MU�hyz�&��֐C�V;�|�F����H�*�������n�a2nE��|�}m�+k���Q�XM�\��A�`S�lK����y��+RA;W����R���۟�^a�R����4�M�>��΄Y��,����#��(���7Mg�<Q�G�^�+�����Bs1lN�w���� ���7L��{�3���B�?���m��b�w"D�����H��8�`}�i�I�%tP�gD����>t9@At5��@&��������O�a��U�����HaW�+{Ė�����ds�a�L8d�->����۝6�����j"U.�!@7c�����ʢ>	Ww@��^�����d���K��&u3306010001000977462maraton/.git/objects/d0/99fe675c60d012f89947e02c603d1f60c8f929x�}ks۸���ծ���0s"y,�~������fN2qŞ=�55��HH�-����d��ߧ�M���֬�H� �������z�Yo�����ޞ]��Ź�G���p��4w�b�W�#�腰VW
W�����А�1�'�K�q��fZ}o��g���l����Y$�㽣��_���P~���܂e��q̥���XZ�'��`���%��2�hjv<?<�g��B�./��\���0�E�Or)N�.�j��AE�@i!b`���C�Fn���	a�^$= 'L���,	k1�7�/K"\��%U&�����֭UgOK��
mk�k�=>.��&��^I��U�%���g%�̭�F.p�p��������BE0�\b h�J��kώ\ߣ�|o�z���ڡ� ;� �J��`J�C5�[Wޭ�Lf�w�͇��umi�MI����¤q�a�\5*��iphc�6Cß����)�����N��j5vC�'!J�^kw��f�^C�;�߬�eI���Z�5Z��]���"SiE�~�rwwW���P �h~���.�7`�J��R@��}$�M;(���>0���]�3���r�����%w�6t#9����@	<hK��S/c��L��ڽ�����g�reE.0���P�5�w�<S�μ�S.��Q���I2�Ք�34HD֌�fe�8<��f�Ol�{Jx��ɍ�r:4v�d���=y�t�\�p�b�#A�����D�ʽ��K�H�;����d�C��<+�@��µ�9߫������3ih�J�(Q�����oᮦ�,!�wJ�3ߟ-��rC�c;�O����߮�w|iya�Q�����ƿ�u�U��0�,d8�bB���(X�ٌ�W��'#q~�Z�$6��@n��]�y��܅T�\�J�6�"\�H��H�-_=��Ւ��H>�)!��z������;��z�(X{7�D��5z<�($2(����`�./���G!$0D2�ٴ�d�/!_�ؓ�$�ڔa��K��v��$�D7$I��F�Q�U���Yy����/�~�I�/h� �y��ƪ�X������k�$c1#T&kw���/��Bb|kT��Ds�EEf��X��`i�I5|�;��=-�8K���닚��oC&1�}�\!�-H����/jA5�'��Z�ĳ!ӯk�!���$�J�����kl��ԥY+���rrCO�G�B~n�]�Y��֮��u����}�կ��P�C1�|D�H|���#�)�橻�&���8*���+������G�J*���U��r�_n�@x�*��e04���*�+��AX^Ho�O��cT�axC�T�g�9�Q�=:�@�/z�a��n��'��V�|�W�8��(p�Yy��3]���GG'�*�hx"@Gp���x��o〆��ZI��K�v(#��L��N�����:��k�y�N�'��F�14[��QF�Q�!̒�@\a��
,�F��̊�㙌���7���D+���PC�7�X�����^�K鯣b���5-#�@�Q������P�j�������(������Y4*�(9L|g�$�ebื���,[6���x:Rk�.���Nd*a�$c����,0z�Gk:��R�b������\:f�.h�6w6W-��D��z)�>�}ȯ�ba�E~h8�@֦/<ߓ'��)�%����$_�D���|�+j+7Zձ*T��S�ͬ'`P��VP��䙻�SW(%��hƁug��k�`J��!=Z�ZGdQ���k�X��U�P7�u��� ��r�/`��_�H���:'\�D4�n��03\>D��v�9_ޜ6���������`��aw)��u&�.��߳CM��:���)ڄ���%�Qa`y�LGN�56��4
�V �(�c6��O0�0����S�ݙg���~LN����F�h�cu?�B]�i���X�������o�{q�ʢ;}�T��v���g>&�6��!	c�v�z`�4�⾑��O�K%=t��7���2;"U��ӂ�=�N�tVf��،g`:����u;�sW j��r�t�mE�l�z�֒ʂ�re.I
�E�IL�}4�z��
=^`�h�<�F��ɔ��
a%iU���J�
J��F\*~$ORy�\R"O�W��	���]��Q�Ūjk���)Ң�[tj����,UMHI��5�K��s���
)���l��	�s���!h������8�11\4��*��ٱ�qSԪn?��b��-0�V'���`��U"2�y4O O����ܒ��K��G�d��>���u�~�
�ʕv<Y/޽}����eʧ1�Ae�n��k����>ۋ��/Iϕ�ˉ�˫ӫ_?��O4��{C����j&f�����}�ƴM��Hj��'l�M�Y��������ٯ�ߣ0L�U�F|�����˫ǡ��Sd<HyI�Z���m[���{6�97C�b�i�0��p'��.x����ݤ��(3�R!mL�Eu����Q�,�zqIg�n%S�|�ꓹT�I�/L��m"��bR�/RI�^�ErC�9�0����-}~����g
�J�ǂ��i������\��pe��Cx?Y��������۝�Iq'V��2�f���8���X�?���#2E1
��XQ
ϰ1'&��(e�T<]('~H�GK�}�+�Å1J.�����"��s+z��[�uNB��^�Ƞ�3�a����;oJ`\�`�}%�R�xܨ1�d��mhi���"jW�w�]0�35U5G��1Ktc���y��`�OǷ~$'���,$;?��s4�j)�nR�V��X#��I0�8��m�e����b_(V8�����a�M9hǖ3%[�c`�Qz�2p߈�b�/a��q7a��Y�h3�<�{W����6(*V���{Ů��ѥ�:�#
�!�f�f��eJ1����x4�\#ry���ܼy}�Ok���V���%���ΒFq}�*����H�!q��=sa��
zբp�R�r}]�k	�Beg�f���W�U�Dzs�@2�,\�3wZoq��s��x�����.X\*�f��$��|8��Y��B
+�o����Tp����:�A����M�d� �+Uh���
qǕpG�/�8�ϼI�¼"�V�k���A@�r��D�F�6��0�E��7�J:.��-���ȵ)�9��B��Ӌ#��!�Pҳ%�<��!B�\D�u�����2�Ht�SZ�1'�!)*�@d�����+! � �؈�J6J�U�����T�?<(���ww�/C���9�˺j+����JI�a)r��`�8�C���8����n�d!m��a��c������'�2��췰�_BԞ"��D��-�|�w  ����'k���h7%���r����]-6� h} ��A��xo�{/rO�>+:��X�1uX�2 sLaO�[��b�P��h�<]Ы�%ў1f	İE�i�w9�(��Q�%��Hp�N�M�AIl���8$�p$aNE�9qb.��&Йߓ��a�Ae5����y��m��j�?`C5-����	�����D>̙%��eX��tM\���N��QL �N[�wL5jͥ�(>�h��I�Z�jU<[D'ª	�i���~}$f
`�(d�Kp{b��#��W`#�(����c��M�0�x�s�!i��_�T�a�]�5���F��9~�jR����UWj4��$��)uzA8~yR#��Bq�3�,���<q��T��L�T��d5d�0O(	���ɲ8�XR\&0#Y4��"͆`�ݼ0D�;'H��j"'\H8�ˏٱ�z Y�5�GU�*|�E�]]W��K���(�m�^kU�m51	��a��fW��*�-�;(w�C7�����yl�o�.�-[=A��wɞW��5y���>�;�_�D�X�d�3^��ނ6:�Y�(��|�ش�������>�X���v��]V-;|I! �M^�q87F��K�Nc�N/ت�Z��:D\���wYH=ɽ�#2�2��|��V� 
�s m���ah�P� �W!�"MxNTy�L�O�AzP�D�K� ��F�c�/��U������lS-Բ��tޢ�l�,�4[�f�bXC�Z�td�3FuF-9
�^}7����CmW�0�!���k���Zx����_��^�k�uv��~-��nx�����r�+	�	��cj�%[,�M3D9Io̖�c�t���ݳ	�Z�qC�*��"o���"�L�lI��v�8A)���A���Ӥ�8:~T&O�&I�(}�>���7YN����vi"lg�2S�*҇lkN@����:��]q��lEQP,����џ��x	B;�G&�,~�Nw#�����Re�����um��N�����}a�<�2Jjǅ�����%�7�=RX/�W
p6c�ބ�C�& ��D:�s'*��|kv��"��{���~�]
\��o���w��,rUe�o�~�a����p�����FƄ��O��A��1@d��������ߏ�P.�v���<y�Y?��N4,�<���V���Һ�v�B�<Hz��.�����5�$�g�����[�+�+uYqzN�:�w�N�6i�z��Cfe�:�5;��l=���3
�Vk���гZi%��e�dh�;:��Y
V���"�f\�2�$��O�J�����q�_����;)@Dǧ�v�D�zf�i�����{�VKVmH_b��Փ�(��$䳥�B��7��n�ӄA�>��@� Lr2�"���������[n�-G�7H�'a���Ã�}J�$�w��mh���lu��Z��iMk��v��SR�씘���Y���x��Qz�����7���>b:�W��!�H�"��}J�\�7 ����{)Q�X�i�Q�N�N�e�k�^�[k�m��h֦�/���9E�����1��~39f�+j�~�կB��9��T�=5�0�&p�+u��M��H���-�!�7�%D.J�\u�e�[^A��D}Ȩ����d�{�f{�Ԭ�#�NgRmO��Vǚ8�IG~9��&l9�K�|}�Wm¯ۯ6�M��;	����&1�Sٹ	��;iZ��l��v۪7'�F���u��eud�ӫM�ߤQ#7F����]7���4��n��c'�Y^Q��w���P���[Nc2�7�nwR�{���>u�^êO�Ӧӝ|1��s������cȪ���)P#
T;}�|&�N
\qt�lv��IR���&����`�¡Rt����\�$b���%^q΄�'��.N��?�=���&���EH�BJK�t���m�7j	M�!�v�ݒ�z;�:v�7��z�ݰ�v����޻6Yk���x�7F��� v]Tk�V�_��`'�_E�MIe{��e]�s2��'�#s������v�<G.�ߩ��N���(v�W��ִi��^�a��ѳ�f�4\�sk���в��gﾍ:]�N��0�ll»��:�g�'�B�~�?y�D���y���K(��"rG��tN�=�t�nۭ�3m��vm�L;ӆ3�ڭ���ڵ�8S��kUk0���[iP��M�$5��O�����x�7�}�T�a�Z�jJ��uj5�-N�m7���wd{�C��]�� ����쪀�ܬaw��?'�8^-J�g��7rx(v��t	d�-v��V�P�eH*�b����b��M�1q���8���-�6����#Q6�a�1A�+:��W�7zVT;"hM�� ob7����e�*e��y��FƉ�m༝"�!�]Hqݡ0k�K�����z�SZ#u�h����ek%�b�/x �a�z@%=lo:�x��e<x�uԸi��b��[u�!2i�_�#�L���f,��(z�� =]�E	l� 7�tH# � ����5ʸh�ZR�&��6�t�.���!�)�#��<q��(LRw�k���G�H-�*` G�K�ьI�49��b���v�m���l��s�����9{�X�{�MGhrP�*�;��7�~R��i�
Pz���/}ɻ^�áI��p�d& �'����s��]��h�1@(��Y1��B"{63�������N^ƛȾ�a�XfN���)B{�b2D5�3QP���8v���C��ra�_Ɠ�!���h!�嵐/�.?BsK�5�*9��vR�� a�6�ld&h�	ps[�ܘl�t�ݔq=��� *��ϖ&p��8����d���Rey�Fe��t�1y���Md�n;��|�j��êI k+/ qK�Mc�NvI���K2����$0�7Oa�������ᄿ��#G���zvv�v�����L�ۭ`�CI}� �!E�9�Էrx���O�z���^��x�99�!mN�	�qn����b��d����!C���軕�P��[�(Ѹ"�w�kMכ�y��	���?�km�p�0 �zC=V�H��V`�,�%NGH)�Slm�|"$����l;�}tyl���#7�-�����H�R�T�0��Bg)<��U�Hw"�ۥ�r�´N����B���:�H�B��V�ү�/�d��F"�k�]	&Y���J��=���a+R�T'�kT����O�<[��6����	��𧟭�(�B��B�춫G����ª�H�0nPQ��>(LQF)O�ޖ+�$N/ߴ��w��N� �ej�X"�bd�u f\R�	:�^�{q���/}��>�f|��fc��ã����SR���\Ѹ$O���Z�����>&�+�]R����:9��H�J���@`��3�]���/#m��˷�dc�p`!%������n T'�M�¹��BVLQB�	'�wcB�Ǧ<�$OR�H��H3�� H��.�~��jJ�ХlQ�8:j��@�<~aP��4��!!�C_�uŏ�P���LTDCw����'< >���#�V�&U@���͏Lښ�sǠp7YۡQƅ��D�c��Np:�9�:�ѻ;+���9p�ꂃi��x= 5,:����4�d�,ZjE9G���8[�h�B	:~#����4�rm�� �}>xNa0�im���&�������&8K�s�4�̠��_� wH�4���=ȡ�(�b�v����hc�f�~8��`�xҗ����i��@��r�vY�ܫ�,��z�30P� E[1�z�!�fG�LA�ä�<���q���A�%�Q��	�P��8Rs{���	����	�9�-�P�ip����6�Gs�a�Is�"���}��ha�y!��EŎa����9.n���w��'c�#�94�4@LS�G��,��*�5sg��'�R���
2.]{&�%��ނ��	r���k�cdX��Li^����:��E�ɕ��3̯j��$����:�ZQۙ��F#��=l77~���K
)�p�ӛ[f�
Ӄp��^��0�^ȁ���H��)qb���^�0O��z��q��^�(~�G{��ȔK;h+$�w1i���auS�0K
�>�������NZ��(C--�B�5$�<[!G���4�EC:�&�Ωy$�2�w�_��/�l��@�d���+6HԹG�/M~��&���4�ʏ�L�Q�ЛJ`��4t���m��Id����q��'5�0��0&n%�D�@�� q��C%%���@���mq�~���,y�fW�E���OTPyhQ��AI������T�2M���q��kE[:�
�i�y{�N���2���U�<<�t8�&޹���t�*�:�wg1���y����A,���	��J�~�&D�c`�<��gNqJY���<n?���9󱄤\-�I���qn u �5�I�|E�����%A	��vJ�č׋2�q��5������{D���v��S�5��Ut�t�<%0O"�2�MvS>�]	�[݋'[8]�j����	|��їsz�6�Oqz!mQ%�eͮ�0��S�=��)�����a�q�>��)��1���W�h���R���W��a;5���<x[�0���a��r�du�@��݊8�I;����գ%�\�rc�o�U�S�P7F�Z�,$+L�G�bbAop,�.?�6���Kx�p�>�ʫ��E��Z�F\�8�}E9$��3g���w�O}jPS/M�/y&���u�X:Vu�)N�x�� �U�k�2�N"v����8���pg1�d�L.��,Kf7e�� ��f�y���l�9���_����Y"���K�̯)[%L�wBlc*�����h	W&��E���F,�pw>Óz���CՓ���!�x|�a��eÃu��)Ι?#8ϑ'B ����[����~�_ԒxmMxF�IwW��L�T���t��>�E�|�O9��s i�����/�ʞ?��Q��X��=P�uCw�����n}2��#v��njyB ��@^��deϞ���p��K��y�'c�~�S*=�¤E���*hG ��rQ"��ӝ~<��Wt|:�J��p=4��Ų=u@�-V������	s
jj�԰�`�눧�Ý!_ ���5�:�N��A�R��W�*ێ>��<��`ٙ;R�e��;N�̱"�$�\ɷ|Ξ pz�b�)K�}B��C>�H��7G{Z�7��uD��1Ƣ.~L��N�J�(P\{�,��u�T����v�E���|i3
҃v�L�-�d�<l#����F
�A�I�-md��6�S3����3��C��0wh	���]���Ar�l_�ò�H��;���f�[�q�o�i�{x���yx��{��<M:ە�0���8�Z5��l��& c+��N'8���tԚ�=J�!8�ۧ*5�����tȼ׹�͕5��,8k����,ʏ@FI�'\ �|�/Ҡld$ERC�q�!q��� �-��{>�y8ƀ�&��M��Ԟ���J�Щ<O陸�bX{{�3��w
ϰ�T���<0h��4X_~�F$Y@�^H�G �z�$�>&�1�
�$��N��!'��Jd3�v�)n�RX�K�RP�Jˣ��p���b�=Y���5Y�c����믿2#��HO�������8z΋�	�������:~ĉ�����+Xt�s��Q� .�b'a}&�U���v�l�N?;Y�E�@~<*"Wn�R�XQJ���yc��D`L���Jz���J���˻�2��p�r�ڪv���Y�ufU�d��C��wyWW`�L�Xՠ-��_�𫔘����]���g:SD��f/�VCi,��R����R7R��A��t��,�$�f^�_�+G�"=���n�y6��x~})#rJ���k��7�v�]�_����Ǵ�5�w�����L�sN�sLLģ� �d,�Gt���:�����Ni/��לb��G=��Ct(+-��s�
�]Q7&�}���2*�īͲ�̞�Ɯ�78bhgu��"����OE A�'-��z~'=�3�5����3���x� �QNa};Ү�9	Y)��t������I:�Ej��B
$�o)!���Y.v�N��A�tNA��ϯ�:�B�;�*6(�݉�)����8�L�V�mS$u��}/�6](�A�h9'��k��xH��k�6J�?]i��TL�"��y�˪w<AUaF���JݥSr�8H�������֋�2��W�����8J�GTh�e���i�ۄu������� ���@1�0��[N
F168931000100023maraton/.git/objects/17330601000100024562maraton/.git/objects/17/09c6b67218115507fd8f03055d679578334f00xm�1O�0�Y}���dS�&ej�,�2t�<���nb9����r��JL�w��߳M�>w���1��0�>�П�T��0�L�V�!9���_�.X4x���)��i�8f��!G�4[jg9)��	'*УF �.��RcӐV��Y�A����6��Əܴ5��fg�|�ߒm��o]�E,O)N1��]n��p�r���Pr�Tz�������Hq�x@ɬ�LI�a����R��#�D5ƴ~|i�q�168931000100023maraton/.git/objects/97330601000100077862maraton/.git/objects/97/cc5e520dbde7b2e7592ebc01cbb81a3d0613f2x�V�n�0�+�
?Um'b��@%49�	^!D�)�/U<H�(q����0���a�мDJ�=����k?$���+���A!�\���!89YI�]C���l�x4"��Y.�.�0��j��(��k���`��hB����:&�s�������c���s�V�!]���s'����c:����m��Q��C�Y���_q����|G��>FV�|D����&�?N*�9�����k�(qԔ��Bލ�(�'�/S)
�_d^�U��� )X�T�Zp�[�k��"�C��Zs��qK'!��rȭ79D�ES8vH�j��h��h�"M�?��%7D��q��/F�ʾ�L�"���{�tJ$_ǋ~�4��_����v{�n��v�g*U>��|9W�*d^�9HBP�����F2��WC]i��Lۀ1����m�(�"����e����Fz0��
�YÜ�3kx�hD�fx���-���߁uƴF1V&9<ȫI�mA���(��<Z�O��Qa<���|Q�w�[70Q�gjD�Fԩ���1���v,86�m����YSwDXCTu�"W�cJ��/�F�M�\G7�	F
�1�D�԰J�B���׃��q�΃�h�!��T�u�=��REb��<��ޕ�������w���f�x�lC�a�?�zfw'>�ֆ|,��aD)��V�4kv./��\'�u�%�n������Ϳ����ȷ&��Hu�g</D&o�pU��cاd�����F�|�N`VG���<�.�-�lv;�# D��b168931000100023maraton/.git/objects/733306010001000401962maraton/.git/objects/73/70bfcd3e8d56dc90d88f0624b3110422f412f3x�\}p�u_�DEHɒ+[��*�D�KH�D��� y�1�dY$��|P�K�P��C���a�:�?�(_w&�����f�F�\+�)u��;��̐�3��aRZ�����#���t��`�����>�ݻ��n��C�~o������Fwg��%��Ňq���ׂ��+ ~�"V�x�x�X�ZbJ�WRU��i��ݠd���;�Z�)GH��ʕ� S�σ�j�H�N:&�B0ey�=/�x�1Oku�L�(7�����bz^ۍ�vَ`�;���k;��ڎ)�rB���I; �t�����^�Ӈ,�����8��i?��+���:~��*�������
7Ec�ці}����q_�<o�O���������]I����Ǒ�����ʣ��]�?���I�p<B�k�!�>-�Q�yex�sk����q@���^8,�_-�?\����)�K�-����,�2��W�S��28e���v���~V_'n'�JX^\��}7]�}²N�cV�&l�VW�a+IDNE�v$�{�}(����"JVZ�Gz�h<i����]����h���P�8�y�'�c z콑Xx�+�c76��	�N�v�+dǀ큇hȊ'�D$8��k��}�ly���{(��˹��Y�u���
%O��(��ViA�T(d%�k$<��
������"f E��d( H�:���hL��jk?~���۫�V����LWÍ{ɝ?�Pu�\�[��q�w~C�[$��$i3�<�n��"?Oh9��<���S~����/Ӎ���k��~)�����U8��|Or� סH��
p�E�k8N _f
���Q!����B�� ����<�&�bV��X���W5�i��ïj��M�n?� ��z�o��Q���/a�O6�R�@%�T2P�@%��3`N\�535o��|�]��bN�X{)b��7!�m�Ʊn�5�I>{-���_���N�W$���'����#���d��OO?If�I����O��I�7��/K�v��>b��4'���vgk�	[3��G�V-�6�
�u[:H��$3[���F�ޏ}���V��m'Ǘ4��R���Dv�4/�t��y��̽��%��M{��vP��6 �a��֝��.��Ϝh=-a�d�13�?3ӀS����\'؎��A��\���ө��}�f�^���������Zژ7q��6�������m�"5���\�LOe���Kf��3_#>��#���,�V��qF��@���1��G]ps`��u���/��2����ŷ���\]@�>D5}`��B�n�eB�NO�m�rɐ�T�FP��7�E�3/�W��ͧIq��:��*qo^�{�l;�����Q>vN���mW@��*3ۇ�3�=j�M�،�y)�Ҋ.����2�*x�v�R�m�����q�bf/ںl,R=c�8`,�e�P7��g�WŘW&�7q�$�7�� S홾�ʅ��L�բ����S�!�O���ޑ&�f�;fvͳԘ����q�z�\����R�K��b�X4�3��R65_%�5Usi#��(n-n�,�K_����8�b��ń��]�$_6��~a̟1�Z��Lu�L���Cƶ.�+�K6x7]T�����\n�Xp͝�i}�s^�[L�&�]��'�r9�S;q���_�q��d�?
^�^/�<
�r��d�-�f����M�-��Լ��3�8�g��
��Uz�Ҁ�n�Y:;�HW���������q������6���t�>R;s����{n{s��m��_t���H��mxݜ��2��z��҇N�<�p�Y�[4�ʦ+�J*�d���J*�d���J��3ࢷ	�{��ۏ��0���-�6������W@m�=j�F��M���4���/���,�:(=��z����?��^կq��c�5Z�ڼfe��ke=��ο��?_J�����\n��=���M�[���qq���ڳm+�d߁�9�����w�ch��x꟮j_�p��\�J�����.�qǥ��ϼ�s��Is�� �*�WuH/�k��B�4oT�D�W���9A@���SU�g�3n���V���1=��^azZ&V����<��mo�g��<������:�J�d���J*�d���J*�d���ߞ�:8^���������_����<*xK�J�"k5k�	���LUx]�f�kuq��y́����g7sq��Ei���j����b=��󚹌�o�R�4�ai�`��_A�ʤ"��%�Y��?��?��q�^�>�����I��HU�2�����I����ߦ�?׼>}��=�u��H��ݩ郚hzZӧ5e{^oy���H4����v7�۩*�Z���V�yNd��7�u�0�=��tI�jQ��W�~M���+��b|���X��
����*������W���;�Hr7�RoI|��,�{��6���	���q8�"�����
�n��-���q�XC~�n1�Q��wnq��u����{�����1:�%���V�������^-~���Ņ��*�����3�UH)**��q�Y�Fӑ�B�=*���0J��)A��v���H��y~x���$��E�n��d�6Q�.�<N��d��A�|NlQ�����0�+�.��w��To����ҿS���݉��
����E������#�ܲ,��i��?�~��+z���J�_>�y<	��������0�xK��O@�U�<�x�Ԉ�N���E��猨����hw]�&��-˂�������Z�g���ė�~���2�Ce�?N�8������jt<�ϒ>�~�
����2�/ ��;��N����M�?+oB�3��"�����|.���ۖ��v�v7P>�^w|��~�I�[[��{��|�#�ψ��� N���t?ϖ��QƏ%줝����~��B�c&�} �u
�CV؎'�V05*B�ᑡ�	���ij.�D;J�V0���"1;qF$��+�>�΂�]���Ը?����.ݍF��P�c�d�
�c�U�
ю���Ų�q���Ѣ+6v��-�1(c?��#~w4*�C����a�귺�D$�֬�c�Æe�mD��Y��A�㘰:>z$p������ŀ܈�o����{�m�m�7�&�z�D$��ؔt?"GcV*!_�[r�~��F﷑�q~�Hڙ�ȃ˛�[�H팒��]A�mRs���$G[�mT��]Z�w�_E���U��$G`�OmS��a�pp�+j����i�?�U2��X�Ëv_7��>��)y��Vm��:���=fj���� 18vS9�b��_e�Zq`<3l�A턢�\�ưnD�bq;��u5��S�;K��SQl�������`rP��gb𧨝P�ӑD�QcA���@�F�l���Uߩ8X�9�Qfŗ������`0'�)S5,(����p4���6yFpt�p��c�0ƛ���Uh^Kc1�Yx����Z,u�N���\��y~��Ya���5�Rh����XQS�}�w1���y�Ô��x���\v{�k�=�Ǚ�;\*4��*���A`�������)��"�1�*4w��y���N����?������|��_�S����kX<�
��y��ԫ��ٞ����o�y~�tR�dO� ��� �&�c��߻z�A6��y���{�ӑBcԵ8O��a��J�/�a�����tL�:���ߗ�<Oe��aX��N�����'�ZSS~N�Qy��N�/����^0(LVl��l�[�����)��e�7�_F��tQ�y
�w��~6u��=�'_�rl*���%���������� ���l�q���Ο�y���] QZ�ٞ�[���Vݭ��Y&l��
�y~`j{��i���Q!_�I�����*��+�����z^���?Ȇ
Q�{ЇQ�pP?�$?�]������6��=x@y�!�v���`������X�0p�����168931000100023maraton/.git/objects/5f33060100010001048462maraton/.git/objects/5f/0f7a238a8d612c36dc25a7db71c8a7a8343779x�}�r�Ʋ��+U��p�IE�(����he)�,%Y�R)�$$` P����������=3����v��[$0�����ӷO�p"��f����|����?�^�y��G��'���7~"�.ŉ�u4����8�+<�k�
fC���<��o��if���=�������>޷<K\B����'��#��	�����L�8��k9���-�z�F�&y0X��%��n24V���x~x��A�%�;�~����.�)�F��w����/5�m�Рk��;w�FNl;7 h��ʚ�a��0���"�ex[�m�$��F�uoU��ӊxkŶ��3�?>���:��AED��]�ޅ��ҍ�en�w���/�>
�pV�0J"�~w�i`+�4]v��� �ەC� M:� JU���+�IEA9�{�}Xb�ܴ<'��޳]��T�x�g�&��6�u�F���!1�d=4�Y����������o-�c�1��,i5ݓn��m�!��a���%$,�C3�~_����k��N�$Y�k����*�'a�) q�e�������@�jq����̦�5�74���f��8nlGޒ8�V�Vs$?�r�\c/q��9YO����Zm/j��#*��o+�~h����ܼK+� |9�W�Cb�·��\p�M�o����H����].v�9C��@b�h^{��C�mV�� �a ��a�܉y�N��.�Le�q�>0_D��C#�cuثD(C$���X\{4�3(R'j�w��;���fH����Q`%��i�=���?. ��������:RɩA~v'⟠[�k(bK�R��,g�k-���؎��Sk���ᛥ_[A�o��6�t��z��B5N־�]*B��|l?Dl&�Tf���|\�a]j9�D~�W/;"�{�H�i�#�fOī%iNU*�WMI��O�rI�8���Z�$!��&j�����Z��;�N�j����	���x2��}�"����lZn.�[�P֓�"Ԯ�.M���h;Au�!��#�Z�ڪ6j�e�����
�U�#?䌴�g�D�1��1X��?�?��h�M:3	WQm��|�8!~�R���'�C.r$2���f��JB����9���Y�L���]����2�!�k�t�'���^h~�r �ؾW�E��^��A���HJ�����Vn�f��F����/�q��0�"� X��M�+�� �55��S������������_���#�G��[<2�bg�z�kB}����2\��nT>:;<xO��~.��2yey~�c� �{+���v�1}��*�+��A\��`��ϼ�ct�iC�TX��9�I�;:#�`�Ѱ���4C�h���ӫH�uy��:��Ņ�]��ͣ�3�5��d""���O2|�7�q@��aR�­���D��?�j��F����*����y	$ʄ	ٲ��V�Ŷ(T�$Ze�P 
.�[�D�}�F���J�㙛�efÿ����A��N��1��}wy����5�j���[��*)���^�6R�� ���8���6�\2JѨ׏h�� k��n�b��<�5�&���m�61p�{��K�v[uu<�=A�S��'r��E��A��A=���F[:���V�fQ� �ڡo.���O��7���=���z!`>�C�ecc�M~h8�>|k�A�g��)�%��^ �46	���|��U��D�Ӏ?��)�f6S0h�K�ZR��=ǁ�+��`6��z0 Q�
6���yJ�h��<@R=lA��I$�r��*&6�*�;}8�C�G<R���ˉ&1n<%����D��G3'�˻3��U_4;�8ۋ�~9���{!����
��)2&�$�5'y�&��FI�I�1wj�`��珓`aE`��>V���K)�p���Zf��Q |�a�cq�	b0��`6�� ;��X!�*-�������μ&+�y�����Wl,z#��W�A��ng� �zb�m��~�26m/��k ��	�F��~R,��Px�`�G���d#�;k�~���ŗ���S��zf�J9X�+2'C�"��-f��4�ȷm�WzPJ��]�B}�f��D?)
���J���=J�̩�I8�wC:ŷ�1�$%���!x�0A���Э�c Ő���T��E�2�L�[���F���v5p[�&�O�hoȩd+׬(��5e%��n��{�I��l$�+��wȄ�` ����)C�2���;�"��@�l��(&O��ܨ/�2��m��hT5
~�*R��Zޭ��cŐ��T-���(� ����d��S��[h��I��ug{�.W��r鹶^�o߽y����u&���{��$�6�籈�`��b.�\AU\ߜ���icd8,�;���Ѡ,�s1+�w��+S>��%��Z�N��-���P�����ŏ�pL`U�	f|������͇���cl<�dI�J���l�%�=l�s�������`*UNz�_"��-�_غ�l�_�f
6�F�	�Z~sl��j_T$L�A��d+d����Aqp���2�����/5,���TQǴ�4U�	/�/��`]��x�O�S����L��T��XR�0�P�~������P��=D������]���z{�W<����I��d#1�#���#�\QL���PJ26�Ąޱ�e"����2���Q�f_��F��7F���~z|�")W!�cq!�=m��eP���]2���.���E��/���1��5+<A)�b?�P���Aq�O����)q��c����y#`��v�q8߇�;	ݘ|Br�3G��@l�b�E1(�e幋�("�����
�M�Lw7�X����0x�"걔����rƱ�.�TDT�s]�b�w�w�p��)��8	,Q�Y���	�w����0X��Xz��>JY%`��0��E�D�5F�,X��[�E[=�!��!���k�q��������z��O��'p�7¬4�2��G��g�����0M���	�C���k{����ԖE���%���sq%�	�"�����[]Η�3	��M
ɠ��Sμi�����x�nacdD~`]1��/J�����`�d+OiX�����W�sߵ��M��(祛�H�ʄJ�J�uHA�-�7
BA�ɎxL�%�	�4Z�/5R��q(�B�t��/�M��MF>%Pe
L�ك9�1�8��k�s"�dn!v g�(����8]Ni\���VL``�v�r��.�@<x���	��&��p1�D��a>3
��P rFH<�! �q�o�fs������dM=��+@j�s�dd�i�3��)0-�r��0�}�+BknݻS,b�&�ɐ��:�!J��ϑ�'byqz2���v����
k�.(F��I���ǐA�b��@qK,��{��7C'���Wv��B`��Z�@�YX�ڗOI�
	!H�#@
��R����h0�)%��a���g�A�H�%VR�K+�����H�S�HRL'�1Ud����%֒T�����UJ3$�����y��4xv���./�]Y�#Gw�+���zP<���_�<9�"�0A�J\7�� �`��� �Q�/��h��=�������8WB"].��l�y����Bʹ�*��p�+!|���$��NoWr�JY�%�,�G������.��?��O@�c!&�D'�_ZQ��I�)��@(��k�~�� ��LQA������x3�TC�cٴ5�3`��DX�ф5�OZ	�?� (<��@�IӼy&������D.J	P�I'V$�-3^PɜH@�~�e-�)d�0��z�Y� Ѐ����+���-�o���b%E�	�(@��I�0y�m9��|Qp��U�h���rs��L藩��(�����N��Cn�ш\�(KVɐz���XF.|В��JUEP�rA��F���l��F�5K5@��0�qj�1�eK(.2a0o��($�4B�z�e���V��E��IߒR�i�BL��@2 j'OzP�_ź�FXƗ��D�u��ܚ /Os�#��;�h	'�`��pm�P^d{H�f��@r"9&cYm��I�\���AK�q�(�l�e(�v�Kڀ���������RԊ	Ć�%nL$s����+)�}J�C%�
�W��W���ה!�-v2�D�A۩�SPcW�K�8�Έp����Z�ԃٔF�d@~Ӈ�q�es99��s}#C�0�5G�a?�X�a��6��~���������IL�H����O�8G���i.�"C�*��+j�	2:u�iύ�K��$��5+KՂF̺qW$J�
o��Ȑ������v<I����O8��d�P�9a�So�;�_��o$�hP��=��əB\��j�6B_��uΝu�г1tX@���7N�E�]9
��fm�@%�r(��)�j��LX
C}��nhU���gACvvn�-h_0����������n����ٌ؜FtL�\��&r��
9`��h��pmkR��\c�.<u*����*Ū�i�E��������Ռ�YNl(�8�ĺ�(/�\'�H?�s���x_�WQ��S1GU�FQ�D�KT |JO��8V@~�[�#D�>����Jm%��ﯫ֭�Xΐ�^�O��������[7FUh��=6*o��@c��n$�|Mߣ��'�M@t�˜3����������uN�ߏ�
.�3�Rjk}5���	)xY��Q�x�MaT���~��ˡ�1��ܙ�@��������lU���o�.���HT��������dM�сQ�.�$	]M�G���\"��o�&Gu �����".��k�ԝvO�Ʃu��XM�n���4����h����v��S�FWV	�U-��Y,��,��Q9�t��Q:;�Ŗ7E�'�(�L꥟�P(ʼ��q�`���y��Bx�O��.&
�zf�n6z���7O����4H���[�:S�&u8� �g�L�'0,�L/"YAU����=9qO��ݨ;�F�ѵ��Fk➶[]w��l��rǁ��(�Ŀ]��Y��][S��)�=���V���O�0�#p������Q�H~���#7���{6~���]8 �	q<�|��u�����W��De�
�HD�e�{e�B�C�%�F(6QN���1~8���
>fmc$��N�9���N��=m��N��t�]�:u�t�m��l�ٻf���sw�l�O�Q��_!6m�h��~�[��k�^.i����D�
J�1��%�4�m�� ��h��ȁ?�K^��Jz�Hj��u)�D�����b�^~N�I�;�[��ew��i�՞����;�V�� ��B��7�B�����4q�߂��������+YhT�%�X�@����͠<oq`��D�94pI�UO���%����#��A\g��[jwEl�j	��n�2�(��C��@�� /��8a�����wԼU��]����1 ���p�H����y�H
=�q tJ[f� C�*��ԫ�U!����
���()3АNm�8���Z�W#P_���g�m5��'�}2=�N�'�^w�<�{M�u�6�ͿN?�8�
���܂�W����|b�[���w���vH7�ӷ�"Bv���~B�T���W��9��y�1��rG��'�� ���&� ����	�|��r���Z�N�S���lM�-�E��5�S�=�l��T�V�<��K��}1;[f�.�'�v���NXX6�����K�O��\n���F�^b�.,+ҒEZ�a�~��o�)�G~�ӂq�Z��i�ٞ�����:i�{06{��>m6��Z
��` �C����/f\ì7��oa��V��^p~����#���Jrm*ߐK������b�r�"��#�Ƞrd�;��rLa�`�b���W,q�1v�<e�ck�"��2Wدb���.U�K���i�L��ikb��'��is��Y��u��,߿Tv�1*|�+x� ����~g�m~c{D^�B�Dn�:�����ܕO�E&��G�H����"�>ͣܚOMM��u�S1ȗ�� [Bbu/ JsaP��Y���&0�ܖ�&~X9a�D�ͣT�v),&Q��o���[��;mvz�.b��F�}z�9�;v��Y�I���R�W�X�*�f��1ҟ�L�N(�Є�J>H��o���l�C��$xE����
��oʫ�E���NǶNڝF��xB�m�ؙ[��M���l�_����U������p���@D�w:�p��
�{}�����
d�6�����mşo�찢<V�]�G�c�:�����"�<�'�%ey����������n��.�Fȍ�T�y��qf uȧ�r�B:����	M�����lW��YlR�WH���M�/�p�~U��)�4����l�����p!�'�i��c�\Sq,�!j�d�aT:{����z����$���j��D
U�T�ĀJ�Mo�m<���d����	7���*�Đq�p�.s.2�6e��$��	Xq�l0�;"�t���i���Dp�+v+�/�w3��!WV�z)O��X_Q�C�e60�&29�jU9�ZUg�$���7-S*H��>�!1C숕,����f����ً^<Gţ�+:�P%*HG1��^�(6�M]��q%ZY���>s�S6?p�����و���2���C��96��&�3�+�(��^<ۼ"ڗ���<�Ӂ>cJ��8V��HA4�+�8@~�����DX]t�C�n8�����e�Z�/TvZ�-��:b����<���D��f%�2ۏI������u�|��0nU����\i`�{3n.ߤ��;��܍"�4C�NXҜ�#E�%H�y��a�eW'1��A��E|�;?wT���;WF~��+pz�����	n�qԵ�%�Ϲ>ix��ɷp.��QO:-3D��@��#_�¸p�������dA����-�T���-Q�$��܏:~�hE韔�*���P���=�����ec*JO_��d���?z,?��9�a�3�t̚ !�����9�;b�F]�ѓ��V��y�x�C?t�I(Px�����O(��x������<J�Sw�=�F��e�Y�wq��l�"�՚���D`�>�j�s3�;�\�z܍^�:~^G�M���P���	1���N����3��)V�$��5���OFJ[6�Kj�A������]��)�%/���׭�7ҧ� K��y�ǔ�<���Ku�V���*k��l���廗��k�ݿ�^���|{�;.��aW������Y�]�x�;Y��9�7���(�;�+��
������'Oq!-n�HyL�`�����}��w*���]�:�du���ߦM)$Yh�[2������Y��1�y�c�c�2�|��L�*|���@�����@u�aN{�ר�@u���o^���H@�2�����5�"+� apmj5>3R.���1��L�_p�>R$�?)DY���12	E�j!ظIzT6MJM?�-Hc��耂�8~aE0�Q$;tƤ
��"�&��Ӟ�&�jպ���h)�7A� 91��c� G��d���:`H:
�h�t�Y���`4�F�Y�F)�с͙{��>(�	�N>�+��G����Puk���i�U*�#��"3��O�-�Q7�����,,o�N����ҡ�In��o� �}:x�2(�h�a}p������ ��mA��M�X�90� W���4�!��rp���|��VHM$k��B��1]S QՋ���L�)�G5����3�fy݀�cU��%��R0H�5$t$���g:�h�bӯu���A~$܈S­$��C�	Lx�I��(aFQ4��Q���J���@଺���"�n�H�Hk�������/�hc�<�;O����OL-ȝ���Gs����s� ]&�cjp6h�X�b��CZ��uY	w��j�( �����X	&ʥ�*3�6��m��-rx�Z�nv0�eZ״Ų�^\(di����N��9�=�8����Z�2r���k	i4b�l{���B�/��"�)/o"l��+\�%�K�
,	x#�K-�jK��um$���^�y̴��z���4��35#������9�!hK($QLǀ���PC��,m������A g��o;!(���
�,J��֐X�l	/Ut�gɐ.��p�ePϢ�Y�x��+��R W�m��`��$��sm!8/� 5�>`)��R��qeӔ0kߤ+iG+"o��y���Æ�Mq�.(�QNX�MSO���3y��oO#}�fp�����~�X ���x�����,�+Q�Z�SC�����5�q]�.0����n�����*�qC����BmL��>d��I�'ӵ6��)�ۅ�\�J���B��!����z�(Fq	.<)�)��@#Fefys^��#\��h!��6/Z�w�W�i�De7��"m?���%��Kif�}@P��r�I�(�U�0e�#v�t(�jrq���ڌW~��s��>x�Ӹ��Ũ�� ���ߎ��B��G>@$��<��C��I���&��
?��	�[>�'P[p8q���".0��V!�:}�PY��)���=�-�ve7��"^�W��9�h:ܛ�rlftN䥋?s��$��j��ܨ��m�h���k륎 $���MP`��^h!?l5��T|��g���WlA7PC����7��e�0�TX�˘��(�%��iWD�ƍ|���q�s�y��yy���oC\���s�,�}����;�����MqO���R�������˅qĖn�B�F��Q��C萠:��k�	��#�$�:�~ �y�̟K��QR���j�4���r}&(�KE�f�]�w�P&
9׋re��j�N�"�1����d�(.�F	�u��ZQx�'g�j9\-����)��F�AaԶ#�e#�u��I'(!�L��8�P��/{P�q����>rD/I��&�"�d�K���Q\�ү�1u�2��%�Be���ٟ���[^�(U�pl!�4�)Sx�t�Ş�� G��7�*t���
�$j�W$h��4 o�e���g�D�e���5g����gv��U�Ka:"��`f�Kt,�p�t|B��_Ah�OTl�W?��DM��#�l�Gނ�kk�L#�2݊�&��Q�K�c��]U��N|�8�]�B�u���O��i�mV>�֕ɶ:��ǃ�>�_�(#�H��p��9���;22���'
-��e�h��n��*�%r�ie8�	c�ۣ=#������jܜ��26u�MzQ~j�%ʆ�bb�»ɜʋ���(Q����FB�'/�_2J��9���128[c�ɗ�����`I�Y�WL�/�T�z%H�Dq�r lA���!)���7�ӽ��v�{�n3J�O�qYv���n�;g�^{����I��_ٞG%��}c���{Aˡqm�2�`j�	L���k�ʲP�GY4�Aa(]����,h�Ń�-�<r�UF�b}c�^�$z�R��EU�C�5�2 C؂o��F
��
��U� �L��Uh\Զ�� ��S�w�������&��]��n��}Y������t����g�'��a�_,y��1�7�/�0hL��4�_^��*\` O�{ݲ�.)��iQ��2i9��ycpґťD>�����h�U�JX�U��UY���R���	��ɬq�1~3��$K��3���!���9���R�����e��?���W\��J�2��|w|���m@�o��jʳ"�`ѵ���G��������V�s���jD�O@��{�G#��ʸfaЊ.Ǩ����|6��n"1&'O�[-���+���ۻ�3H܉���Q��Oz'H��*�2�%r���x�� *���ԠS��o�𫌙l��+Ln���&���n��(@�
3�k	�=k�S�G��9x�Tn���a�yu~;��
|.��X����:g^�o�q-̈x����sP5��v���m|����Z�p7�a�XNI�d]��qQb4�΢T*����#9.���x������>���]�&/�a��d�n>F�ҮΙ+,3vM~1!0`���~H|̱Q2D�6�*�z8��9Y�cTf�j\�&��%E�����j}�=�3Y./�81jxƓ�O`|��8�ލS"뚞����"nOM[���=��.���2�}Nk�p��I���SW�,������� I:�����K��V��35�
�I�T��\�v�MW$�U� �y�T��f�a䂮��A6��u�J�5��ti�'��E�1P_���|�T6f��n˯T�]6%���񄊼���`�����b�UE)f�ֺ`�c���/����]�����q3	�ed�s���me�33060100010001088162maraton/.git/objects/5f/11bf60b6423c4c54596d4fc278b88814c07751x�}|Tյ����"��Ց��`��$�
5�N Hn(E�8I2�_/3�@��h� �</����U���O�-���X�J����>j��5m��6U�^J�w����}Μ3�?�}>��gf����k���Zk�Ϝ3����ٳK�K��je�|�*���:󏓘
&~� *�r�|��+�18�8I�� TYN�hs�	��Oy�D8�ȩ�Ґ ��U�$EA�D ��{�8��Y� )&�_|����z����y\OA�?�}��U�QQ�x�Ծk��ک�4���)���ꑞ�-y�X��y٥��WP��g[#�e%�mm��5���s]Oy�ue%ю�b�o�O�7޴\�DbH??>��$|�+D��C�Z�B��n|d�۟�Qޅ���޿P]�����w��?�]�?����o��nr=�9�����,_����~'3�;��.d�fy�y\n���?���~�_�����ƚ�f�$�*3Lsm[G����b�i��כuᵑh,ܵ�5����Yݰ�lw1�a��֎�pC��5,i�U7���#Q�1�T�GbUE���`O���v��Z#���B�\��ZK����و��ͦP���1��fu��>V4�4c-]w@r�jm�hB�����V����b�¢��S,i-*5k�_���9,t�c.5[::n���d�6i*�mj2�tVd����@��p��-LlMʢԉP,��q�k"�Սa#�j_$q���B�v�ƅ���ƍ5������x�J�K
�J��+WV.�6�
f��>��|�?�2d!�.S|�A�����*�k��p!e����B���{J����E���O���������r�����>2��yl�}H��!������h����
�E��?��fO�_0(~u��O���|��l��Q���!�ڠ:	�XeX�s����oq�&֟t�X��3~,p�T�c��WsU����y�PÓ,U�5<�R�*4<�^��>W	���4�JO>��m^σ-��0�{2'ؗ���o���2F���r�5FJ���i��=�
�y�<>4�2��t��Aq�-:�!?�/οA�d��{��}tN&=�G��C�d��;���tN�q|�8�H�d��⼋��E��&���9���Zq�H�d������~c�N��R�Nu��[���{��m�ٞ��'����
0<z22yꜚpEQ�A`p{6������7���s�O��փ��u�ꑡ5���d�5��,�C�?��ҷP�,��lf0>|:qC�w8���X>����R��i�w�ft_�?���C^l|�o�F�%.B�A|�>��	����ċ�O�F���o����[";s�D����c�F^p��S����0���%XAR��Ύ���� �sI�)�`�T9CU�IT #�<�,	�\^�P���]OĻ��	߄-�`�����ȈaL��Y�@\�{�o##���'����@_��l��@b� ��&�	ʥ`l��;���.�8H5^��l�v)�Q�Q%�:JE����ߪ���&�����`�u�������[�項}�@a7ɘ�yR�.I��i��"��݂g�a���ұR��&A͟�91'V�X�j'�.�:�L!�:�?JZeP�zo���r�ja�dȃԿD�$�08F�{8��cv�~v�5���G�=�������i����?m�NSm�JS�#u$Wɇ�	(� ����Q��0�>=����o�����L4������X.._:�[>��+(�kȚ}��pv��%��HL�Ǩ=�h��c�o��Ӣ22ieC0�J0�"qVP��Cy'�Hu��@��|A����"�c�T�)ޔ��7��/�*�q�^c�	>/�m��<]�9�=3A[2lN��[
��]�uT���߀V�t�Ɏ�>:��F�P�!<��r�`���b$3���4��+�u��@���@�{��*�P��;�9\�|
f)T��±e/����'�(b���,�D��h���>�s �)M����2ab`�����)����)�t�Q��g�8f����r�>:I��N�V�.C	��x<������e���®"�e1t�C� ����n/�X��mӌ쥴M�Aj���x �'ۤ��u#��&�n�p����c�;��
D��0�3�!|�4��3����]Y������ �م5X����s��$��q�J�Z�!�0(��"����(����'�� C��Tt?p��F%���A#p��Ƚ$��#'��6I��dI%��`-� M��𩑁�^əa/� 3�*��P�E���Z˅��x��ZaQ�v@k��tя�"v��)�ãS�n��d�V̟r�`Z�Q>M�zf��~�z �LΡ�Ͳ���/���E��t��rh�^)Y��,U��	4�<P�K�;��l4���ƑT� �+O��|�$����<͗�Q�{װ��A��t���2	Jͬ�c��e�1A��BeRM�C�Z�P}[��Cj'Y��p��@�Ge���wP��8/n�9G62���F&�>Z[$����'�����������Q�r�ɲ}�)�!s �5��Q���8"O|B{�c:u3��@�e����w))�v@_m\ේ� g�h���$Ý��_B�d[�n)*l�g��r([F��?��zFʵ�Z���į C�6�4o���>�t�G��.ִ�훶�%m%�W����Ȳ�`>��]��B���l�;A �,�nGk�`��J�t����m��X�a���n�����B�6ȁo��k���-��K�Ƅ�W���-Z�Z�u?T��煡�H#ζ�IKp]�rs���e<#��x_NkԸk| V����[>Q�&v-�� K��{&M�Z|��h��� qd��?�]�o��w�I�r�[��"9i�ԩD���bږYr>���}�SeΣH���zJ�4�"�kЈ]U�o$3���Œ�.'��m�>,R�'~I�'f��W@y�Yi�)��0���f�N��@b�J댦o���	Nˌ«������������A�]��h�6���4�ӅLjd@7���QF����d��B=-�:k��.�y}`x�}���cىc'!)e�� AK�IǱ�O�P�0�0슑쓓���?���^��|��H\roy5vuM�]�$��`��1�ߢ�&.����(�!c�씺Bi����U߇Nx��� (O�u�s���K�h����6I�����}R�fı�sr���L��0�K��0�S�i A��r!N���b���"9w~)�$oS�Ð-H�p�إ��4�?'V+bl���O�jy�K��cj������JEƉm,P�F�l0R�"�fUӼ<���G-&�$"�������8"�7�eZ
�GT;NYI5�>-����?IN^yB2���k+�%)՝���(�"M0)��U��3Ii,\���g&��~���4n���I-�'��9Sd2?%���Q�ce��:c����ٟ�t{B�RRf�X������k�g�*WT�G(/a���g�����T�]3���s�O�-3q��Ɩwb��W�~{M���U�02�X��Y_p�k�o#:rn^My���J�ٝ�����	B���A��`�i��i�������_�={���c&����A@a��##�q�p7[~D�+/�~�pp7�x�����OV�c�6�r�.����{ ���� ���;$� �Oҝ�4K~p/��A���À2[,��,�l �	�p/�3����RN�q�� X�	��E�M����{ �|0�`�ԌC��XA���p3�N���{_��=�;;A�B����wv>��=��DGH�x����Y�`9�[�+�7o���w��1)~������?� �)�m�� 7NA��\
��%�!�' ��{�8�`%�m�7���C�~�ÀC�[O�n��p:�~� � `�{�_��U�����0�1�<D���B���� ;���^�Wig�n\w���������+�M�S� �88�0��y��,\X�e�N�G w���),~ ���x�2`!�À��Ov����^��Y��"�逝�-�C�{���(��u��'�w���9;}c�>C�)Yķ;�a\����"�ܼE���'\xG�&�)�_;������U��@.B�*��-���52���y[3^4f)�)����6�1I��$�A�kA�T��Hҟ�⍑��:=�V0��c��JS�����/�
�4t���C�Կ&��-�Oݳ��g�^���f�B�Oŷ��F�������K�x�_��}���� �2��7n���ʸ� �M*:�;��6���xLw�~x-Y����}s��5�{�']��C��f5"��s�m�vvA��� ��Ӝ��=����$�:I?�A���h�+`!;�}t�~N�|� �1)QR>��8��� z?�W��W%�ǘ��׻@
����<���>�_�z��^�';�C��}#���!A+;gtK&�I�ș�9ޫ��e!>���>	t�~���G跒[ъ҃ƻ!��I�-_���i|���}�m_|��������菃>M�k~u����7��x��z�����Y���-^�G�4.à�A���0!��vY�v�A����.�OB�׸��(蕺�w�6�G@�+�^�<zt����5�D�w�.��I�%���%�����^?���1�C��=�n,|������ ��ϦgF�`�~>z1�Mz;�Z�c���T�w�6����t�~\���FЋ����qN��N�����~p�`筠�q�è��I�����͐s9�֔�-��I�#�_�[���@��z}-_�z!�W�t����@����@����O�_z;�^�x3�A/�ۏ$���Vн�{�.�g��ۓ���%��7@�н�1.��^��*���ۏ%ۯ� ��c�O3��	�W�͠��W�=�p�!������5��oA~HT~8)k=���a�͠F��75����١�/�~�^?���6�=�S?&��a�w�8+�����9)���<M;�@�5�^����{􅺞��h��Q:�9y�C��k�c��}�.?C.0H�.Я�5��~�@��A�2����YMH��N��3�e�fgp�S��^���W��K�*�c���f�A���fз�.�E����x�B����FП$]�93���]�\�������VߣI�8�D�%��G�N��t�3��Z>-=t��i �,ڟ��oJ�c��t��N��x�_��3��B��}�^���+��
�Š{��$t�
��z������N�{���Z�/�Qr�����.���o��@H�/���_�w�<2B[�Yw�K���
��x)����C�W��n���8*d�YHl���k	�dj����oFF&�ty9*��[A7P?L��y�� 7Gf ׿=kA��m���­c���c��Vt�W�V�N_�������}�3r�l���߅_�e��3�Ň���3dW��s��e�7�焣On>p�l�0��\ہ1F��h~v�oݸ�q71�V($ta�b��Z'՗��g|�%M.�/���k��oeG2���?.[�c|l��-����kT*�93�\�Ī�2��fBz���:��=�`�*J9���`�"J�X���������8ܦE��p��������Yq�`��E�gQ�~\5�����e�����C
*b$�7V��T�Tk��/��`�B<�$J!+��y|���s}6��>n�t���[(��R�-q��­;qN�����8��K����9v�*k� �nex?�����a�/3|��Ǩ�zx�T�x��s��U��H��_V��L�+*��n��]4C"�ŅEs
K��v����	P�>�Nϙ6(G���i��e����lC��?�P�mǏ�O��Hg"Z���L�]A��?�P�k�_h�8����l;�"��;K��k��A�e���<�b���ǙxbT��@�f�	s��бd�O���j&�NT��kd"��c�_b���Q�8��$�����7��z�L�~�$z�1��t�_j�tū�����a���$FQ>���S����}{�P>&�N�������E}FRO҃J=>>{n��y�x�l���2.��֯�%��*�����q�����(j�Q� 蚛
�uf�����E���'�<A����)�L4��6W�S�Om��	P.~N��������
�~��n�I�ۻ1Q�]���_�1��T�'Ŭy�?��
������_f�=�bo��F��B�3NEي������d|H~������-nf������������Sb�0�^d-ǄJ��y�q���~>��=��Y�^�7o<��.�Rh������:��h��'����;����m�?�v^����O3^�=���W8Ƌ�7H�cl�,���C�{�J����~�ƽv��ϟd�G�O��ߗ��Kl�Ɠ��_?�����UX�ɉ O�Z���m�2�2^�*��-��xn޸�8�s����d�뮔�T�>�w�'��N��)�~��j�mܧ1���bn7��B�h5�w+~vL5^C�w��D����3<^�/����~���w�x%�6��!g��p%q/5^a���o�"/�>��n���e_g�cl����g��^�ǆ� �H�3�T3�Z_V�X��lH������M��:���&fj�}F\��T ��c����q<B�(;ā?���Y���b�wS%iA��0N��F�������U��~�կ5��Y�6��2�lg9t/���>�d�s��4I6�����3���
��뙟�pW#A-�����{}�����]�wr�Q�p��U̯�m�B�8�닌��(��6�q��	���J��'�On�0��w3�VX�q���X��,�B�A�kA������O8�d-��v��=����*��O�ʭ�#5jw<ǝ��+���1.�oa�����X�|��ϒ%x������w^?����N�Y���x��KZ����an�x��6�L����]��*����W:��׌��E,g�H�s���x�|��x�z�^�G�_3X�;���)�Z�A�����tk����M\�A�O��R���Ì����!��|�<K�y��{x|�-�e�O���q���������8��>��w�o_g�nP�7�!=��f�v���g;�y������/�%�)�;��5��_P�#�q�#}^d*�d�s��?����0�c�/�t'�!Ƨ�/����-g� ���/�1~�j�[�w�� �O��X��I����K���xg~����C��n�1�S�o��k:W�/����p$ҧ��U����1��z���WR����u2����u�W�_*�����{aW*s%0�����?��Z�OBb�v��	R��*Ɠ=��u�=���R�U��O�g\d�	�T������%٘�H�BΫʯ1~"�;�?
�[w1�3?��q~+e9'?�K�������y��'��qq��e�b�s��'���ݖ�����|g^��ݨGE�y�_��a�#�?�vP�W����s�~3�O"oQA���5�;��?v���<ͳ��0Y.��i��<�Wq7�@�ǹN^��9��>�j��9�5�>�x��y�;�ˌ��X4ֽfMA�{�xa�YS]߀7M&_(i���&z�$^5i6w�k��P���芚�������57�͝S��d��3���`��c]�5]������ֶU�3�1kiaa����o�����팄��wD�a���=��n�Tn����Ӓ"�^��4	�z�#��2�^����01
��Rü�fق���n4�M�h�h-(m��)�%�Eu�Kf�*z�0�:��\�@��Uu��e��̆�5�d�[�!^�i�U_��ri�B��]�5/���;�M�YI+ޏY�UG����Oz�fQ�x�f�dƺB�X�,�&_�I5s-+VG�-!����b�����\ր�l�1���bI�\���-���C��ڪ����ԗB�G�_�}��m�]\�V\�����?�_F���Sث��%�dF��U�Ma���̄I����V8dlC'޺J�W�(s�kV�A�7���ծ�nZB�T��&����װ��N�XQ��^h�W���t�Ou����0;R�\-6I���B�U�5��H@�[6]˚�l�[ͷ�.�A���PssW8�X���pߺ���ْ�a���>V�>ܔ�w)rf��@�GZ0)�m|.�Ĉ��ӻ�l�r�E��(����VTho��	�uY�`�9B0�l9B�������K��6���P��X��J1��2a�����uy;���W}=^ <����@U����#8���|�0ۇ_'�6*57��f�Wj��ĭ5��K1��q��E�a�G�����t{��yh�Q#Wl�q)���=���Df~
�ѩ�����sKDeuʀqڐf��*A�D���O;] �¦�l�i�f��"�G�]���"7%r6��%˂���QDֶ#t��m��k0�Ћ�)�:'[�����@�
1����l���FW�˻�ʵ)�n�K�r�2G��:6��E�U��Ph.TkBo����l�ޖ�4s�~I#��\������e��4�Gi�1����!�5�)��u����>9S��R ����M�)n@�C��ޖI��"+��B�3c�\!�^���x�}w4��8�J��y����P�7�~xg�����q�&+����l�B�]�ԾWꙍw짍S7�}�pbi�G�G9GJ{��^��j��K�bZ���̛�}�V����:�bAM���mj�lQ�v��ZI� ��)ռ�\۝#/�k����<�;b*��5S��쎶�Y8�,�Q0Z��$�~>,�χpzo�zV��|MD��V��.�X�ɑ!��B���%c{�.�zTs<_���4�<���s^��bDf���-�	Eݣ�{l��,�r|6�VnWB2�h5a6,]�vXt�����:�l�v�-�ߡ�>]���J9�,Ъv	:�]%��"	�;#��Y�Ui��n�&��v�7�3h'��6$�5]w������6�CEe]ᶎ�aL*k��/�M�jLǁ�~�R�B..1�����A3vnZ[M�~U�j*�2S��D#lk�����[�P���Pu�[���j�2K��T�R����GX�̞����6�g�1��.unHnb���N^�M���VP�/��[L�P4 +���; �9�R9�}��Zިqo�ʹصr����@�FG� �}ڑ/���}�5�r�F�ֵ�KMVp 򺴑���:i��[��=}U��t�Ԓ^�Ȟ�H�Z�;#�����\�5e�s��l�F�k�4[������G�;:���zOnG)B
��S�����ҵ�"g xO�)�.`������>VB����l���h2�-���|�@ەC���@w3d��
�;[��S�oOUm��](e�E�9�'��|M���4(���I^K7����.�l=��i-}D�Ѭu��7'7��e���e�Tm�0��ub��(H���>un��^e���f�cd�U*�E+,E�ڊ �z�P�]�-����Ԙ�qN��9Z�\�Ҿ�l�}嘚�7��ޖX1h���=�f��7���v�y��o�L���r뇲�u-���wN��j�!�ĕ�~�z�j߰Ӿ������AjI�˨���r�b�\K��$�}�z��{HHSk8$6�\�a�9�X�$���V��ns�h6ڳݶ�W�WZˡK_�z��YG���`4��@���qNWD�N�yk�u�K&k��X��LB��>���NY@(e��t[?ZR���r&[�
���)����v�ꥅ`C����Zm0r�ɰ���Z�/���پu�^�Ƃ�M��{��-�e�2��`���Q���5����B��дW"�Pri�{���Ό�5�q�4��0��膶X�0�%a�:����Q���>�����~�P���G��:k	E[����'a�KR��Uq!j;1A�
���u�ƌ�(� �k;p�*�7�~L"��[�3-��� ��i
w�L�� B��1�����5�"�E�P�#FC�J.C����?Ց�/��~���|�d� �����ٞ��^�9<�b�Wϳ*�יq��Ph�}�^_=���U����~�x-o��7(���c@���[�	g�S0U?(8�:T���]�
�2���y[���`�i�[��g�U���l��E���O��Q���V���]7�V�����ҟ����l���|��ª}U_�3�_����
��ߩ>�T�Yp�ٗ��=���s<Iķs��������
�[5�����e�^_=���җ�-���C���yD'*Cqծ��mG}�\��(F������*t���o���9i���zq�?訯��V���-q��yG}�ܵ����q�l�U�距JM�ܪ��xg�U�
�uIEU_=���| Q�<K�+�� �����y�稯�����������x`U|�vU�v��޾z~��d�Xߪ��>T��~�[!A�ַ���8G}�<z'�w��=�P�d����ֿ��k����BO������vQt�bGg�_!�j���1�V[�[���S�C��|Af�B�ծ������_�?0��Q�qj�_�U�168931000100023maraton/.git/objects/f0330601000100064262maraton/.git/objects/f0/2d37dda7268e4c78cef2eedf9196b5e6709aa8x�TM��0�5�ӭ*���VU{齷�&��v����o�,K�JU���͛73�*�����7ꝱEլ97.DϺ^��]�k�ƻ˫C�/.!��-�j����^L���R�F2�9�`V��\h�6�C�c0��?���l��<G:4.�qH\NW�i��ݑ����[����JMn���{�^���m�'M[sdK�:r���'��6��R���{h'gE�������ƚ���6��=�T��RtT�$UuI��GN����aLߞ��.�ޅd���#RePo��c�L"D�-�f͞פE]J�4�H�*���m��Q ����Ȯ!g'Z��I�ml�O�	���4�;t?<�az��r�������LI�cg*�^��	,�������ѳ4��d�2Ad+l�^���r����Qڛ���!�� 2�AK�R�,;I���ˁjH�)�TK��ׁ�&M���n(%�}+���Yr ���Aߵ��B^ᚘ�)�Y�9�u�N0EA��5������-����'$Nˆ	��\Jx�s�C��$19 :����1Yu�J:= �K�t�O8O���������4C���k���-;��Y,�ʐ<�^.s�#�*��h"�rpM�sU�y Ж��:�L��o����168931000100023maraton/.git/objects/a93306010001000159462maraton/.git/objects/a9/9310a010481a3e55ea870a606670167adcc4e8x��yPg�T�TT-�bP�		�j�AD����J�I6a%ǒݐ�ʩRE�G�
AA������)�����#�q����43��>���~�o�	� �	�tw7�N��dN`83� � �I�3�k9aG[������U�q3�f0f�1sW���ٯ���UL�����~�,�x���ФB���]�9a��9#ԗ2�$�
_��+��Q����i�7Pv,+v���vB	�
0SC�-̔y�/����rT���V۾Upi�\�59rC�a|�{PY�,�4)� ���]i~8��i"o~���I]�8�(*���ֆ����F^�p9�~^U�M#z%��#�%��@���7u5{c�G�,���sʘ��r�X�R�..��vTq�+�5����c8g�Q]��k�:&�g2<�WwĆ~�j� ��1l���{\ujV��4o=�c�=�
�*�d�m	����Xis��wuO�r���RX� U��?�����]�������U����ȄQx�N�"��J�0IL~H���|��fز��Z�.R_��5mW�#8����e�����S��������ӾE�kp%%P$��hr����%Bm����z/���2܁bqi4A>�E��sc&	ygMBϧ�j=���2�kT�o,��!�d���[S��
H�z�T���N-lN3��:��=t�ٷN�p�Tj1&��s�KH�_�.^�Ys4��Y���z�V�4@\8Ԝ,_O:�rx��/�AKN^�113����ZW�=V}т�W�Jo�+���p�Ԫo4�d���F�O��Ha��Y[��H&��r��c�4%nD5�����B�kU]'�`%J��g�J\P��	H��^ƾ]�I̎5@$�5�+�޸�>{�cʂ���s��I�u��e���L�5��H�le�]�2sf�;�y��E�6��V��`����1E��ފ��kr&���+�U�1Z1���i��|��.����V�� 1|I�&7*7Y��{o�Y1��Ȕ�z�?���M����O��}^����&�� ��@|R�����Քj�/�um����sR�� <С�qdA�
r�L�V��f�5}���peH�O	G�EIG��s#�_#@��H.!�p`t�ͨ�g�]�5���<��̰�R7W�	r��P�Ͳ�m�X�Z���Ao���rۙd���c{��n��;�^��^��L#2��+qQy���߶Z6y����O�`Ϲ�<�}�"C\�ʁ�hd�氙53)��dXBY����PB) )��6R�8���f����T;I�� �g%�K@)W!(��w�Tl7qirױ��}���,c�!($�0��,Ҫ�_P�0n���@�Wmš$b�r��L��ؽ��)��{�0����WE b�� ^��qS�;��gs�\&�~�@ A�6"����~�g��qb��s\n"��9�)h�*Ta�D�=[�s6�9�����{�%������{��!�am{�Ej��3q�.�QU�"2P�~�a���
k� ��[��T�,&� ��2����2u���h������󨣮5��jM>�168931000100023maraton/.git/objects/9b3306010001000344462maraton/.git/objects/9b/0e5210127727c88cd941703401f59e33766091x�Yl��?�H1ܴm�z#�Z�i�q�	�mHҬ��o��׭c��.�
keJB�Bbt�4&cl���M��C��R��	�e�L�VD7J�D��|�g�����E/�>�޽�{߻���s"��k�׋o�:����)\�h�!����yJR/|�R�H,5b�(��	�Hhs�\�^��]n�J`eh�&����L��*%��
1���CjB'�)且�**g������ �8/�A2���ؤV`��u�mE�/�}��!�����wA�/��1�膼t~n�%	2���D���Dti"���3)�2e�})_�f��uЦı�A���g�}�v���[�^�x�}��7}��+@�A_9����Ur^�'.q>�[_��쥋B�����f�;�e.8礋���.��Q�����K0��-�>�o+뿡?W���7�ɗ7=���C6G�k�W��s����7b�	�?�*������p�xV+��&>�a�SI#c�Ӗa㎭FwlS<c��-�p&���w�������-�T2��OĔ���X�LG�UW1�i�J��V�#
u�my8������;"�F�g��ugD�WIe-�����PW[wO��)Q,MtD>��^�7 �XlY��T������d�j�m�P{�n��3���r��xR�r>��È�����]4�4��Xބ##[�����h�����cA;ھ��Ύ�c���Xku�媾~�������Np�T8���<+.��>oU��82��v[��n�3�\���,���9�?���/��i�?�08�d,soU���~	m�c���8�אc25����c�Zr܁��/b	9� y�=�Ӟ<�ɵص���B��{ª��,s�<�L��V�ѣ�Ѓ�l(,�LLVOM�Ka!gdRv�Ĝ�I�����34�!~Qb���?#1gl."��37�;%�
�F�!����x��\��N�%1=80,K�;F��;y������\�{ݞ����=nO~-:�/����,��o���+�/�������(�4g��۹��&�c�CU��79>f]/��E���9�]�8���|zU�>n͕��T��';��|Uv~%���^)�<���
�90���~�7Z��x��o��m��?Ԅ�
��,��uֺ���}Ӑ��ܕ;]��w�H�d�����$��X�D��͖��B��k/��~s䷹	��)�X�k?g.�p�5kr���LT->42��p�;�8��}`������(�h0�������a��{�+?OiHώ�9�=[����V|�c��w߳�ޱ���rI�~�#�|������s�+�A�'�ֆ�f#F��&��|�����-`lv����~�3(>�u_��ɟG�]��|�>]9��������Q���4&��������Y�
c��d��.X�KH�
���:�����|��ܡ�{6�N�y��c%��cr�׮��że|��,��c��6nz���b�^���\~��:�0�Y��M8�ը�8�w��c~�۽�>�Հ��ދ���i�V�1�r�=,n�wۍ�j��1�@��ޫࢵ�!VUU8�"4ە�fU�rfwT���a灃�'�G��[0���]�c����zv;���x�0�R���C>�Tާ�<�|���ޢ<���
z�$���\��/�m�.j�.	z���U��ष*x�[<��{1��k�-\��E\��E�_=�1��/��9��"1fD�%������/�k��=:�x'��z��������)�cs��6��N�=�u�
����W�.��cb=�e�	��1׀��qqE��D ξg� ��?~?�N�X�@���t=�����������/����&��o���Xڐ����_W�X	|�u�����o9g��m*����Vo��E��������W~VXzoi-�S��m���n���%=���0�q�_a>=��S�XQ�]�8���K~���	�]��\��ԣ4b?)�7��E(̧.ăE9���w�.�ԾSXE3V�K?W�@Ă�([ɹ�P���\rg!�S����G�7�l�?��/ψnp���=�C\%h��'���"�3F��g��XF����p�+0�j��g�����;���b���b��<O�
�8�����8�=WFL=]؟鰧����H���.9��C�y$�>G�i����m���)^��O�\�~^<��c����7�cf����w�>`~+���z��2n����%�>�L��ׁ�y��Cy�� ��o����ȁ�B�y`�l"n.���7�`� \��y�DN����Wa���}�o��+�eۿs�׊��������+��������d�Jܬ���|ۀ��*��.�wa�C�Oԧ<Y&�4���{׊i���+�s��r�Who.�
o�������~��;Z��Ύ�^d�>I:֠a�	�(#�26!�NQ+���찈��1+�߲�����x2n����6#�����@:<3����m�R�hZ3T��c�#CC2��h�u ��d��B>�-�p"�=lőU'�H�!Ǖ�H�ǅ��sms�]��F�!�@���\2BkZ���.�u$G�P�����]4����'�W��3�N3f�TTI�L�	���5��-ŔVS�L@�	��\�-Aj�i(;q�d���{�p`�0�)sfey7���.ˋ}2z�B��+��R��-Y>��<ǻp�ӈ������OÍ�M1����Mn���)T��u��l8#�I&�s�*mH��;N�E7����d���Cښ2�X�V-��	}�k��� ��ʣ�f۠��Ҋ��O"�<$�ɔ��;�Z�M6ڔ����q���
?�Θ�ݖ�=ŭ��l��38�3�Y:����%,�^���ߔD��yW@'%�Ꮩ��`FaB#�U]���o�@���� e�<Z�?������%�;���|5��W�50F�E���C�>��߄ 𡮋� ��C��c��L�V�z����coơ�C�mv�)����h���;`����I=F} ��'�V ~/被Рc~Ƴ0H-����O��7�zS�ۈ6��6΍�q�]��;�	�����Q�/��z� ������Q_���˹r�ߞ��u���݃��8��^�J��	ui=��;aX�4�΢��E]�1��ޣ\�]h�eH�1��ŢT�,�E���֣	�E��SQ�L��������R���z��?9.�1�z5l���;
������o� z�T�z����P�q�@��T��	uC=Ư��wr>3�1�o�g�60i��x���{b��8��ZO��x <�P�t����C�B�e��vΏq�J���.>�3ngs���[a��(#���tك��(�����l#a��{�h_��$�F����	�^I���O����168931000100023maraton/.git/objects/ef330601000100012062maraton/.git/objects/ef/98173894970ad72ce739b50bf8be80c62700d4x+)JMU040e040031QH�֎/I�-�I,Ie����竑����Z!�>01 ���Ă��Cri{�=gg^�w~'{k�-�i��������OH3|�yu��������
 l�/�168931000100023maraton/.git/objects/c533060100010004462maraton/.git/objects/c5/ad93354e111d1ede6ceac2a3e7f2d39b12b784xK��OR06`0V0��2P0�2T0�2r��3srRr2�R� �A�168931000100023maraton/.git/objects/b3330601000100015062maraton/.git/objects/b3/0765df6ab4056e6b09224482d9cb1faa957cbbx��A
�0F�s�\�2��@)���g�]�Ec�_�ݼ�۲��̷���D�$��GT�rʱR��k0T)Kq�mm>U@&�S��(�EKF�N�����m� ����cY^�1ݿ��,#�Y�w49\g��1�s��Z6w��@{330601000100015562maraton/.git/objects/b3/6f208f8b54a12de0474b015f10b415af33eef3x��K
�0D��)t��'PJ�"�2$up���&G���y3\�mi`�|kURF�=s5I�ָɧ<�ȬcQ;U�4��欉G������$Y��і��]*�T��Υ��kaZ_k��<��'h4��wt����M��sW}A� I�JN33060100010001611162maraton/.git/objects/b3/6b776d0393abc9c76207a13432641077976eccx�{�Ue�����Fm4R�Q�l��Q,�.
z�a������9s�5x��)23o��Q��J6**�C�t#���������r�>������i�g���Y�e=�Yk=�y��gW74W��L7��bx��@ ��#��V���GSJ�B�g4�Oq�"Ih�+��YH9sIr� ��R0$������8e��yǑS�;�������=���B�rծйt�Q�7�!9��)|Ir�Q����.��E���� ���9+hXNK�:�3���2�~��hKN)p>�P_����O7�7�/-jk.�iRV�3.����Y�)e8EvB����Um��''<P5��m/_���B;�S�/�psZU�I�8�'8��8:g�%������cF��4��μ��f]����9�� ��Cp���\�j���ʟ��=?'���i���pi�2^��ִ����`Z�?N��L���W���)��V~g}O�7�+C��w�s��6��薌�qH�E��[�wi/}��i�oC����6���A���5���(�x']���m�W�ƣQ'z�hYlQ}[<�:����-��DgỦ��ZMrŜ��M���ꆘ�e�|�<��6�<^RRSW���V���fՄ�e����j���6��[cU��j*���q��%5N�r�5��q�.-onhG���7�G��Z��*k���T�k�^_M6E
��aV͑5\�(������c���x]k�uцXӢx]4���ܪ�RM��Uq�P�����YM��i%�%����l�U�Ѫ����EK�F[b�m�MU��e�%��n�nq����.-�om�Փ��!�k[Sߤ��`�e0��D�d,K�he�u�H�,���b��Y�1µ���-V7w�5њ�k���� �ⱥ�q�1��ؼ���JF3�hw�ԩѱE�Όٳ�L��)*M^yi%Ec����M�2+*�*�yG���#0�)~Z�)����Ӄ��`�.)��D�ŗrF�\�Q�<[P�~C�����X�lӠK�|��:�����c�C�K���<_��ϮQ^��䏟}���4����+��#b��8M��ܓ���G�[ ����юx4�R�(�8��?���c�HJu�	�9΅��$��1	�	���8[�p�#�I�B�Ɏ3O�	�S�q �������q�:'�{���$vl]�)�#1.H��!�KJ���g�^�%ΐ^�	m_�¥�u"�}=
�^����o�¥�u���Q�H�n��.Ҩ+|��E*uoQ�H�n��.R��)xD�"�����.R��'x��Ezu/T�H�N:�/_�"ͺ���T�
~�}��֭|��E�u�ޫp�v�j�{.R��S��
�Y(tu����Η:�F*���%~X������}�+�����_����5b�?�q�����Zr�F���<���
ꄐ��ؚ��[[Vw��t6J�ʿ�PN�#�_?5��ԡ����OǏW�#��Ӻ���t�dY��uh���1�/�.G$�r%-@Wot�^W��O����F�����P$����N��٣��<q�ah�w(�}OB��pIOǁ��q�b0��v��F�V½;�����J틔�'ꔮʾ��ގ���*����*-��b4��t&L�o�{�ٰn�swל���c�����Gtn�F�$DT���M�b���r~w��-�i.�6�+�o��l{x����11�7�{&�=���N�T��zu�^�tI]�wv�{�s$Ѿ�G����C���"�P���X�q����ܶ-���;|����}��S*)o[�����/�~EW��'>]��ö��?`��f�o��D�K�ŏ����\������v_&z������e���˻û"�p]��[��+q:½�}bᝁ}[�Ŏ��q��+̐�!�u�KʕWϗa@�e���ވ;Ys�F���ʽeJ����l3��L�û���fxV�t���
��i)�R�b�<�&t]�w����y:A��/SI4ZewGi���������➉��a� �����UC�Rwa���չ�7�O2󘱷-�I%�Z~��"OGxO`�Qz:�0MOQ�Ө?U�_|/���1#�R%�])�ߧ;ѧ��k �îNrE��]�ݮ0:)J����j�l�+�%{U�5�C=R�N�`w�?�(H�+ƥF�_�����$K�������N)�CB��\ǊP�}�V�%��~R���4x�m0X� ��$w�rH��Z�Dj�q)�8�����\Q�9����oY��"��ʼN0�3��;]*yR��{�}�G�@�����+;��R��u��e�c��ߟ%�ݧO�B��TˊżD{�ۭ�3�M���o��!���C�>M�d�t/�5)�=3 /�;�:�����ɿ}�,ip�p����|]�$I��.Eo��di
��Dv�|���@ogX�"���3O����7�ݼ7'��*D�]�_?9�۱�Գ%w�[v\G�paJ�]��FB��T����H�t�K5��)�Ύ�=rAn���8HJ��j;���^&��{s%A�/�������.����s_R�4-ўOkwnU*{X�q��g^V�R������PIjx쑠��R�QS��I�f�-%��"ݍ��>��q4�:�}4���sL�"E��������o�kN��:/gt��*��'?|'���V*΂VeL�t�'�����ʔ���L8�NfJ�2���T��u�U��#
Dӈ�'@/ը/|�u��i�{��3Re��~K���0�������k61�	��߇|�Z�'+I�gʄ��j��8�d���?_�2A>��8�:��k]�G8��G��Z�L�o�C���QI�9�!#9��n�<�E.wב_���I��:j�8�Dw�������X���k��	�Rj����[]j�i�SBz��(˻[gI��co�H �<��j��8J�0B�L�y_��4[)645�He�`���L��IP.�Y�&M�9s5*1�M����:���}˶�-թ9�W|����z���-�'~f/�Ŝ���r7���??�A?��L�jP݇T�N����m~ir���,O�!%��HA��^��I��؂Z��]'i&j�0'�������k�;���2Tb��y�U�=���c��T�R�������rW�5��hw�}Vi�OORYF�5��L�(�5f�^}3��q�ez�����qh�8���C[�v���.���.�]���6�W?kҫt��[�ݶt��[%�_���h߫M��]�3�h
��*��Tz��y���(�י���u[�N�V�Q�Y�떰�U���v-"�j�"�j;Hx��XT�\k�:x��I= �ܣL?��j?i$/��W������G'}�.�#�����ޘ�oU}�=V7g�z��Af0��H|�	�C������+�9��)�r~��R[�� ]�B:*�aB}�v��iҔي���.j�ƭz��;�e:�(��~Qȋ�d�
�������dr�&	zܵG�O�2��L��Ma����c�N
���?$�3|���MZ�@~�a��"�W-��ὅ[��NR:B�S5����.�{���Ť:u��:îb2�ʶ��F&KZW⽾Έ贻�6���N$ґY�h�Y��`�
������j>Y��ɺ��rO��Pgy^*�O���q`���k>�{V��X���ӧS藸X���F�e��au۴����vU�4�9^&��U�Ŏ<�'M����Smk�!��c�����D��Te#p�)|�i�|%a�,�>g�I���:z�x�塔,Z'��٦��	��C�5,�]D�%c֔@%�3d��y:^�mM�B��3�q���u�iY��C����u�NU���C�5]��"!�� )i��U(�Y-Q��B��2mT�.�C�E�e��-��Ob_�qtYDd��Wz�œAǊ<'~E�X�+��#��qPe�׺+����/u����w��(����pĽ;��}R~6�:�k���Dql�N��6��
���d�$���w�WKPՕ~�~qJ�z��{�Iɓ��K5�r�'��nmI�x����<Wn�RFqM���1]��ۤ�S7��j~ SPf&��:s2^~So�"^~W�6���q�/�1�[�v��P� $��������0ю���X,�P�2��5m��Z����3|^�i��G��]�����؇^��[u^�����j9�B]���#�e����k$�pO�N�;�A%���o���;����q��2�oR�;�=]�MR�M��G�R���Թ]r�c1�V�_�v�Ŵ�1���?_~y�}��Zg�g�.P�VPF��{D�	w�&S��N�=��/t��p�ɠv��t��ۿ�p������2���N�'C۷��U��Ɋ(�S�M����9�2�\Q�µ����6�=OTPq}�ms.�\O�}N�J&���<Q%�`�>a�J��]U��NTy��Xra!�� ��ư��s�{��3���O��J��ETBq��k��P]��ֈ����-���F��k��l*wx��,vz/G�h��EW�=���m�Ϙ�����Z��˞��.��D�wږ7��C���5�ǝi������M�odh��5˓$����Z�ԥU�&�z��@=�JiU!�Ԕ���a��*w�~%p����ꌄ�=����C�\�?�.�c ��V.صY��i�L5Gb?["�� v�2 {rfU�dߝ��m@`Ul�w��lCh���N�L���������Jw8t��_�����
@��7r���л�q")ݱ�+��Z/\���Z[m�%���/���� �5Q),��w�8�7�	=go��VF��o����n1�ʂ������Vx/�k�%�S+�J�q`�);L���3����뭪�T�m���2x�����a�G,����E�8�t��B<qW冎GT�U�U���*/���L�����G�D���qGji�Pi[vg�XP�#���j����@�ݣ[Q��0M:����U�=:����Ǻ��֕�f!�U"�}�{s�y}N���>�M���=wW*�#�>���PKW�s�f�k�����d��}V�����wU�Ӂ��=[�M%�M�zZI�=z$"��ڣk�\LWe�
�P>�-�����4I��s=
&Z�E.�o��H���s�,�M]�qo6��P����ᕨ'���^����:ܠ����'h�+�&��e�\?s>����(?}��,Nm��y���h3W�c�����ն8�m
�sfp��"��j����V��n+�;�F�H%e�V�����F��+/&�졗hj�]�����C+����r���5�i�֖ V���2d�c;�2�N���G�[jS�A%./�dt|��O����h�w=`��?hz2F���u���ꓜ��x��/��|M�z7�.E|������0�d��3�F��o�����1�<6��>�GU������S��>��d���s�6��O��N処�N`w��	��cu։��}�$}A�#�MoH��3t��!]�)w7�Jpɵ"�N/wo��M�VsL1�����)S�~L��R������i;
��ηg1��G��������;xꯞ�7[M:H�*x���PC:A�^���kk!��fMr6�q�u��+��T�#��U9z8J[�@��U�U�>�l����dח�O�c2Z}9�f_�#7���l�v��ˣ:�__�j6��2U'e�KLXC����=[�|�ht���=&�h����h���+1��[ "t�B���rKYG&�69��M�ʬ3�g�b��s��C&���"�x]ܨ��m�wYF����V�N�����W��XD_��?�;�h\�7��S�q�:���b���Sfm0vƺBՉ��Y�S�[/���OvB�k���|;AO ��v���|;\�T/��:]���N��v�D5$v�8�����u������/ِ%s,ke�>L*R:�W��k�������ԣm�\�)��ҋB�5+g�Aq���m�ͳ>m����q�c�V,V�7�6�'|W'ZS͌�R�gx�s���>H��E+��icT"��;�.ۗV0�$�\�d�y���O����=zW�����e����t��=��҇�}�OIo�ϋ��a��X�� t�cE�z��>�$d�(��N�8��%���@�֔<�7}�fJ�VoCD����ꔻ+\�+�ڬx� ���u������c~�r�䮟3X�DE.[h��z(��u��<{�=uӂ�Q��[N5�I��`��3m�G�)�vaE�����?ȫ-����J�,770�Δ;�<71��MٵO�ؠr�x��Z�G�r���M�o�7&�Uc���7�=�K�_�Rȅ����]�v-�+�~ٕ�Z�Kv%����mUJ�N隿�;��[j��&�7�8�>�B�v�f���G)>����ɕ�0K��g�N�����0O��"��E�ј����_J^v&��r��$�uՑ|�TZa�b� �Uq,Y�Iݺ�S���&�#ʗ��*��uo��vQlG�������T+��Χ���(ф�*eڨ���߲�T���G� ��q�YĎI�]�3&<��u371��1y��UԦT���I��o�}nW��R�fL�q�I��1w�����TF���1�@i#���nҢ�h����S�D��u�#�����V�tn����t�rw�v�O��.���&�!5����j��F�d� ��Ԑ�V��u�M+�:7\Iu�a��"D�#�bNx�cT
�����^�+�પĕQF��˄#�m���ݮ9���ڕ��Y�G��dN�~�OH�y����V��P�(Oو��d�5|׼@Wh�v�A��o���Oj��[����#:�-3�+��0�������)�g��6cG?�go��~΍���(It�w����G�+ge���H���w��������$����żo2U���8q̼`���]���Y��7�^pAtNta}CC���-�7�V777|.�Hٓ�L��`�1���f�[hb8���jU ��0V��SZlf~9��`~�|��r� ����<�c��gg�X\� �l> \�\<�!�.��9�X<� 0���j`-p=�`/�N�A�C�|6�3������*`�a�j�.�z`��X�ʪ������z�$����;�+��k�;�=@w�d�.���X��m�y���K�O����`��^�9��(�W�Ӏ�k���\|�<�8� ���{O����_b<�������n ~�� ��X��R�K���-� ^ �+��[��ww��>,�=��K�ǳ+P<�.������{���/��.�@n��+�M�8p9�v�*���pᇀ3��y��#l4G��Xhǁ�o~��{�.�����!���6X
�X�
Vo.n ~��S`?�m��;��D�B��U�!줬� G{���>ශ!��}8x��p��
�V�����	|x ����y/mz?��� k�-�k���_��������w����ަ<���p5p?p=��w(<x���� '  ��
\
|x'0�]�x
p7�
xx8�u��C�>��	\
<���_�`xx�{�]��^(�_�'p�V�<s��;�N�a�`��9�$�Y<�0p6��ߴ�x'�I�N�n���S�73�� ���@"9ח9����y��-3�����ߎ\�����C�.��xp�s�I�3j��'q���g��Ѝ9S�͝�(���H>:�ѣO��+I΁�H=z�G_C�{O&tݣWz�������s����^��?�O���3!9���G)?	������o��_ }4�q~��}%��A���9UI��@_�3~�5^��C��&�?ϣ�.1�@噎�5��/�~/�O����W�$�wC/��}�-��:*��7�+��}���@�N��+��;Ы����T5���B�y)�E�g��k�+�/���������P�}do��Rd��o��1$gɣ[�H$�*�,!Oc�C��Σ�R���le��	�Z���	�Fq�`["�"08�Y~��_�������L6�}�Q�Crڗ����e�ɏN���.�V���m���7��9�e��Z�*���ɎD��/����wi*�2.���*�}��D�)ʤ��1/�J�,�����,j֒�v��6�z*4S�!��
�����T���򗙪T]�k+y�'�Ā��~�����2���Y\e�E����B�)2�.<���3��i+*̙��g�$��K��o�<[�sq��y��<K������z�<;
��@?�O��裡_ } ?=Ӕ�&����9�_�u��F+S��v�#o�ϋoN� =} ���Ń��}
�xm���2��N�uz����J���������������D�1����QH�^�WA�觋oY�醼��<U�<9����>fW"qW
�I�4�렫�w����k}���v��&WA0�����5��o�����}�����۽����vP��ҳ��=�(迃��o���|�A��p�+�Qj�o�~���Ы��6��>}_�>ʗ��-^����>��A��Q����A�}AO�o����E�S��o��O��� ��Bz��|���ot�Oǈk��Jy�֓�/��
}� ��A�
=�/��g5i?(�Y��t_�8
���L�ڿ���{�g�B��B���_l�&�l��H���yr���~��KE��ٚыQ4>:��N�~�Ϛ~󐛂�9q&�`��(�v��B����/��]��~Қ����e=b` ��u�}�����/l����=%�l��z?���
� ����� ��?��������iзA�~j��@O�����
�o�g���f�B�9��\'�h��g9�lx&㴓|O�o�?��N@�����N�H!iy(x-�8X,VL��!����ŷވ@_
} [h�� �@� |�>͒�c#y��C���+�_�:ɧ�{�y��a��������u�~��_Lt!�ˠ$���φ��/�Ӡ�-e�C�z6�/�~/�w�և�����luH{�e�m ېI��@�U}?�l�)����R~��������[�~���Vr�<���{�~�/��k�)��/��Ҝ_S~ �)��� �I��+���\����"��td%��@���@?�����G�v�O�>�ϧo��8z����h�Ӡ��G�q�	}�|\�)��o��Y����Ы��߾�]ҿ�{�O�ӿ���Bk������=K(�Գ�^���gC(��	�Z�����*��C�_���u�?��<�"��O���u�>�-��� �����;�=���4��K{�K�����*ʏ9W&��<�c�=��ʘ\=�@�.��:m}��I~��d~/��+�t�mm�~� ��>f����y��B��;��R�Z����,6�wz
/:-&m-u=o�
����1���E��^��F�S�{�H���}CJ�*�|7A_����ba'�:B�}��8n?}>������&i#�]�??I�<4��!�����<��#�ҡ��CGM:z��s'-�3�p�Ђ�[��O�64o����ɏ��֫�.��$̴G"���q>����'����O�O��ݘ�L[���1G'睝;ř��/��}1�\{�{~+����|���Y��'tl��g��bg\�S�\��!/��ұGr�x��@�QL0o��=
�~���R�D��sB ot�E��c��&����ɝ�{l���KOBg�8�I���_	�W���%�_	�W�I��j��ׂ�����%V���^�\���l=9ko��zq
xQ�;����:I�b���K�F���~�y�7/�����0�����t�B7up����`H�5������-� ������!�?��MX�v�O$��"=�:G�s����|[�U�|��(~	�D�39�sN�˹�s	�M�wp����6�g9_�|��(�z������O_P8����)�^8��������VrC����Ң���5�pLq�����j�����=���O~�_�::�%�+�:2�.#��C�:��qҸ��p��8�|�9k�j<4��<�����J@��e�Y�&�M�Sh�2����Y8�aC�C�L�����I\4��h�`�{�_��x����!J[��j\�K�ƍ����,@���Ur�׏u~�:V��q���j\�D�okk\�&ȥ:�����G�y3�$b�о��b䓃<��5>��ڬ�e�A��10@�r��# �Gֆ�.@���<���P.�!��ZL~T����������(~Cz*xz�!���?���\2���<��ӡ���/��<Hc6��x�&��_p�.�� ^c��j�3��BE���~
]~�y5��7���sW0$#+�__�� �����&.���C�m&����k��3
�dO@��������O�����b��g�P��_>��_~�w���[m/���u���P�׵�����?�@04������+?3\ɽN�?\~����N|$����O�O�����c�}������`�&�'$��Ky�m�B��i��70>V�{��B���.��-���$�� �RS����<�}4i�;�#i���"x��z~����E_�_�-�ɧ|#���^�7�ۣ�y���\�O��=���?!�)ߑ�ƿ�SD0���ϡ?�,�,��;��������_[9s�7���֡a�����E0b����ϯB��m�P��?x}K�;�=����#q��C������J�+�w��PbW�/�_Y��YL���c�W������pR�6�2�2�	�|���~�
��V����M1��Ł���Z~�ѧw������¿Շ����*�.X ]��POQ`�����4z�k�/L��E�5���TB����u&2�Rh�W�/��O�:�[�O�[��;���>܇�~=��9e���Ŧ������>��.��Lvտ'��Q��k>\�.���Gp�7^��c���"�Ob_�)��ko�`�g�o���9�{n��y-�1��6���~��
��\����|���Ô�M�'�N}�8��c�#�
�5xT:��R������s���?� �L�XW3��|+�]m�׀�烥�A��ړ���o����?�	>A�3���^����_��N3�}�?�����V���9����ǀ�1ޖ�k�/d����;�=D�?_��`h)�"��P�r���[|����s�/Q�%��%����"�j�5���<:��;��������G@v��9���c��o���$lK{_����_o��yX~�P�J�>6��������?�f��\>�!{Ң����秇����g���|%.~� ߊ�Y{	!?tK���k�7+�����vp�||<��m��c�x��f��pK��4l��������/����Y�\	�է?_��QV������J�?����6���_�f0t����X3�b�{5��?f�_OP��{�Od~}��o����i0ꏷ&�[}�'>��o��$��ֿ	�2�6U�_��Z���_�Ax���;��W����瑦�;����aR�?n�����"?�R�_���4�h���{�|>�ƣ��w�ϥ�(�� ��v/~||'�����B.�!�Y�3ޖ����x ^G�-��������0��_���l{O�������]��o�i�sLW0$���=�����
p|�[�f��;�r����*����C�;���/������g|j�+����V^ ?��Ɏ����!������pO0TM�[B?��? �>f�V�C���W�Y�@����ś�?/mi����]�����G���x��~�>�����R�E�=�9�Y>~���>	����w����3��ث��Tp�?\ n�)�o��i\����c�H���m�|6�^�;����Ş�.��=�D_�;G/B}[��ך�����:���W�_������{ �?�q6����������~��7���4�(����x��I�~�Դ���������Sˢ�g�W�5=�y�xc�F>��������E|9��!Z��mѪ��NMscKC,�-:o�VY3�dS}����j_���.s�V5Ƣ�퍍�(��x��>����yY���ֶ:>IWT���W���'D��͒��D}.�w�$���]_���U|T�6Ʒ��k^\�G�f̾l���i��Ί��E���&�	G×N�o	*Q�k>F�4fN+KVp����a��7y��J�\>V�KP�)t�Ӯ�t�YS�Cx��i��v�η�dlS�:���*�ʗ��WLgU�Wͪ��Sǘo��W�&M�!��3ߦ�o�U��]D}�o�.��_z}U��K�K�Ӂ��5���7��`:�0&m��닆�x���)eMsS[<*�\X�-���2�Œ���/k����(�>��&���!����%�����r��l�ʣe�T��W��E�pڲ,*_�V͚]]�4��Ŋ��",Y� mS� ��o�8:U�"z�)/�T�)-��Ѝ	J��J�M1G���#���"c�ꪈ������ �� �AD���$�y�Q�|� %�px��\����bM[�2k]N��)i}1�t�4�^KӉY�G�>ϋ�oZ��ص�ϢIc�s���V�,��p�wdF�D��ъ�ΔII%Y$��D�'.QWO5T�D9����V�Ksc���&�֖԰h�jQ���I�#��H�h}�i0>Z>�C�Iqm,i��Q�}\Kk}S���Z�d�|�S\@5.fV#_8��ԃz��MC=sA�Y�I��ꪚkp�|Yt�b� 0�d����,�b�8�Ox�b��Q=��{�t�{~�-�#.:aL�gЍ���$:����E��x��|J�������,R������_��O�6�Ĵ������i�C> ��UK�m��+�~�UD�ҵ֘iZ�w�]�����f0h�� �|���鳁XUqtVr2�4�Ʉ�me�a�Z5���_P��i��$-6k��F�Κ��J�$շE�j��Zg�,򒪆�XxIx<����2G��S�7�s����3W��M���lT�(F[�P��:��R�E����������a4��Ou-am����,b��w�$�n��O��D�cIK���LϟI�ɀ�v����<�[{T!Kyܧ6�s�.�)U���F���*��,3����W?��z���I�k8C�)?���L�3�u�8� �j#F����� V��M{ބ�\<2,�`Ri���P� ��1�iN����aS!v�,�1^�M��T�S8�ֲ���퇧�G��q�i^�N�J����/I{�|[b�4�#�9|�:�G�����ap�u�lo&I��f�3�DJi�������F��*%G�0uF.��0�8ђ	Y�,�1�i�8����dXu�������J8`�6m�؉����:j�U�l*+��h2�<�05�.g��|��f��>�4�R5��Ku�b#i�z�o�3��_�Ok`0-�F����;����*�?BQ�+�e�o��Zh֗�zy��/U��ͥ�����yafh)�P�-(�Aa�-mh��<�V����2Ղe�^��J��,���MsI�[�H��շ!��9Ses�BB%��ڪx����:i����HX+ߔm&מ%ݟ�V��������ʹ�a�ZO�G<B}0�̂�8$����]�,V��M�~ʖ�K��KMV7$���E�Z{�5�LT*�k�,�K����d��I��74��vA~�����-C�Y֪D�s���-���9 �Y:�R�Ƃ���qr��2H��[�q��̱�3��qd�A;@8o�OYjdh\ZL��y�5&�H�ASƺxBrQ7�.@u}��̺F��R*[�=J�p�Gjh�����Ɛp60�,�,U������bf6vd~�F��!�fe �,K�1,e2j�Wf�h��E���R�׵7]ST��S6_��2[/k|�	['$��J�|2�Mj^�I��9�F��e��O��]m�����t�?
I�H�k9��ތ�=c􍠲�pn�)M�dW�7XҊ����R��dgĄ�\P��m�v�쿋�P�VEm[s��-3���gZ|*gC}uMT6eCQeV�H��N�vnw�U���®YR��3�Qk�)�f����ԝ�H����f�f�9K�X������˘��2���z��f���i=��T+���p3�8�ߚl��5�Nm��1�4=�2�@ƺگ�Y�$*�w��zF��Y�]��Z벝e���M�{��.�O� ��1�
�}3������*��vO��A���=l��q�.�. :��z����B�e��g��K�&#R���5�=�{vb�.hS�V��'���_�����Y��tf?P՟��in<�VTy|,s��8X&t�&���'�:�����ʴ:ǮN��A�5o�����Y�0e�����F��ʆ��]�b�AjM���RSwMtaU}����*5��8NG��`�z�;��ze�2�G�K��}LYG���Hܲ0�W�����**ʕb�TAv�{�l�ˬ����O��E�.-�om��(���`�̛ݳm�M��j����/��F�!�U[mL���<}c'e�3�����DӉjGUǺ���b��-��~����u�\2��|��{I�D�E�7�A�޲�X�h�G�ؗ��b#2����<�2�^˃�e�ѲĖ��{�e�����o�.�x>�z�t'�he�q�����G"�WS��K�KB=D����{��644פ�eSj����2�L(^H�[R��'J��c>��;>U��&�7]��Zk��R��0��N���U�ڻ�5�8�Gxʦ�[ ��FsO��d��(y���Jt������T�I�jY�6�ٲ[5���L��ŵ
��r+7��&��]��,�
�c����=R��=�'%2MV=9�a��
Rc�j�s�'d,����.���Zۚ�x0*�,��8S�S�n�K��G5wA�~�[5�3�M��cVe���F��S�F��?���&3:�a����3��K�p#3�d�m�3یE���ߎh�=>���Z��HQ�T]�[�Y�S6BSwA�4�u+�<�P�TӚ����N����w�N/���i@�0�&��������F����sg#�R��,�&Ayj���t��xJjR�
�z�U��!H��^@c��~Eo��om�uM:�Ȉ��OY���$�׈"�_��GNQ۲�xU50ުa����Xk�S���M�2��<:e0��,�n�o��t}�S$X]U[�ST����4��j��O{� Qh��ɯ/Z�N��O*�hQ3h<����p*y���.�ՙ�Q�j��b�]S5� �`KU��T�u���5�ݪ���5ǥARd.(b����l#�����<9�;9���w��$������m�'��A(��As!���)��}q��|�N6�<�̧����=�u仐�\�S��y)'���\�s���yi ��W����C8�>y��~�] {H^9��w��4���GQ��m��.�5��[ r-�_E��\K�Ҏ�<O}���8@yf��'�B���o
g�纃iגO����n�Zx�v֒o-�N���ݛI���=xy�T}��d�H��|�
y�&�{��{H���{���{���ҿ� ��|��}Ђ�mi�������{����9/[R~?������Wa����[_>y/�E��'����.��v�}�	(F��#��{�ky�A�R���G1�,HJ��+��������AR��M��]ɧ�K�z4I�e��:�Co��;d�l>��N[��N��,�I�	_>�~���4{H9��{[���xՂ��J&i_�!�ג�X
���������H>yW�RD��8�La����4_}�R���=�]�8x�T�rJD�ņ��n��=�����	�~�168931000100023maraton/.git/objects/e733060100010002262maraton/.git/objects/e7/f0081f3f97b86898e9c041d1a74217abe61adcxK��OR0gPV�/JI� �R330601000100031662maraton/.git/objects/e7/f63e89b567c3abe9b11e2a4919ae089e3885cbx+)JMU066a040031Qrut�u��Max��C�~���/8^\�$������Ĕ���2��J�)��~,q�V#�W ��ڻ׊ʓ}����J��@���5�M�~�۹�;X"��L����(5=�� ��*�.�f���-o���?e�e7��F.T]f^Ai	�׻�ss͎,��̘r^\��� ���r2�RL�R~Ƕ�-��~}���s���QP�������Y\4a�C�_�)���L�ތ��+I-.I9g��OȪ 1�׫�Of�O�強'��<#��8/���N��ض"	�P���̬��S+�� �7��168931000100023maraton/.git/objects/0033060100010005162maraton/.git/objects/00/91c0ec1cee56e2f4eb3872c8c357c030f07faexK��OR0�`0S0��2P0�2T0�F\F
&@lʥ\��[���PR��� �
168931000100023maraton/.git/objects/14330601000100011262maraton/.git/objects/14/4dd043f88cf5322f2de9af2a540088a1de75e0xU���0DY�WX�*e�_��j-%r�	��)�x��]L%��1������ҋK5%�3tVm�rۏHY��w0mE���0��3�7.~�t�b���r���|V����o��-]168931000100023maraton/.git/objects/ad330601000100063462maraton/.git/objects/ad/4fa8937f4f5b0a44ff2f805b7ebef2f2e28af5x�;��@CQ�^�0 ���8v��������yO�����G��kȊ������O�C��<�%o��W���pO�*SY�V�r�O�U���T��գ^���֌&�85���<�W��Z֊V�x�������������]����n��}�?��c��Tg�,^��\�Ow�Z7�՝�Kw��W��7�Y_�U�Է�m}G1^rz���������d���ʽt�݋��|�3MA��44ME��t4!MI�"��9r��&�)j���&��j���&�)kҚ�&��k�&�)l��&��l2��&�)mR��&��mr��&�)n���&��n���&�)oқ�&��o���c`��a0�H
ca0���0�#x��<�G��#x�0��#x��<�G�ț�7�?͹7�o��T��~s���<�G��#x��<�G��#x��<�G��#x��<�G��#x��<�G��#x��<�G��#x��<�G��#x��<�G��#x��<�G���x��Q<�G�(ţx������ţx��Q<�G�(��Q<�G�(ţx�m��jޮ�Y6�{��훷p��y+��Q<�G�(ţx��Q<�G�(ţx������168931000100023maraton/.git/objects/623306010001000179762maraton/.git/objects/62/200cc64167fccbd293bfe233858753e7115ab2x��yT��T� � ʢ�^			� ����Z-�I2	c�13!�,�X�
b��"r� .�Bժ�"��h9��A-�
H�T��a2�r��ܜ������o~�&�׹�h4�B�D���R�� 2�I���!7���u����.A���7i�+�]�R�J�f�R��*�3���iW�y��B�s�5�t��l�6�=�ƕ4Y���H����:���M��ؾ�E7
E����%���6���îS�:����I�H��dxdn����=��f����s�����w�'�d!��~Y_�9��#yCnJ�w�ʊ1�����b)J����U�F���'��Q�Jk�U 6̦R��^��W)��rY3�'T������Vq80WKؽ��mܙ��R�����يG����݈| �]�7��f��Y�-��d���� a����)����A����� ��jA��^�:LW䰭���F��J,�#�RP���+�*��$n���-�E(����ںwr�_GE��FCn������o��ջ8��w�v�lx�tؾ����i>���A�l>$��x9˄�~�xcsjHV������Z3���H��L�i?i�����a����^f�� (HF�(�noZ;��מ��Dqо��H��"NѺ�57�7�LF�KI���>�d����wv�=�a�.y���Y�V=�sK�"T,�mm������Wץ���8�"@��$N���&��뜼�K.#=�����95�y�8���$�{_[[��z�G��ҿ�8S�?��KV{�r�*�zf�g�����p\@q �׀���Ɍ��,��5n�=�Ok�L8�%l���ye��"�
��:m����&f�v�g:=��� yD�Rc��0�T�P�1����+Ч��s�)Ht�j�F����w����/0n��w�ny ����W��s�&�l~��ӽ���'�H�t
�YǓ pe��+�N���L����$g���o*Q(�����K�&��sM^>Ή�V�~Y�6c�ƦBG������dÙ����+Gz�B��X��/�x�u����3�w��-�9�zt��")�� ���G}�5Ǝ�j�q�7�~=jwHky��5-�ok[]y����	��k�n�uz��Wz`.�LO9�3QFߙ{�F���� #��F<�.�Q���bx�|n�;�5 g\�/�W���T�}��-�o_T�ڧ�A[4g+�@,���'���*ʔ�=�F�]�G�!(k:t���(�TgU�1�8���e��갅
�{ɗ(���&�����.�H��\�h��Tng�Z�������|���|��76�]IfA�{~ӽ���Z��w|��)��ڜ� $a��T���T�iX����G�>�>[=����ĒXd�R̀�up<��qj�ӧ��5���"g�j��T��d!�W{V���9�	z���Qb� 2��T��B�A����+	�jf���ńCP��%Qo7i�̮�,�����0���sAP�Wv���<���%��Q�U�?��p�*��ԫ�~����g��D𹧷�\,���O��|�p�ySZhy�X$n���E ��M�s�FN;�_van���3����F`on���'�yKS��~Ǟ�*���y0V�0���#�ěEP	�+���OD��H�K�U�zQu��Q�����ߠ�3v�3dix�zڂ+�޽�D%n�� ("��|��K꿗X�כ��Y�˖�B�{db��Ϋ�/�{��*N>�:�tZy�[�7x�168931000100023maraton/.git/objects/a7330601000100010362maraton/.git/objects/a7/72f7759e9dc38b04cfcfa213389614690500d5xK��OR045b��-�/*Q(J�K��U���S��r�@b�y%�:��@��"���H#O�O�/R�T���OO
Z)pqB)�TA�D1� �Q[A	��)� �u/�168931000100023maraton/.git/objects/ba33060100010003062maraton/.git/objects/ba/c9587e87d674334172882d3d7b102e92f7eb2bxK��OR04a0�0P07�27T0�� :�_168931000100023maraton/.git/objects/ac33060100010001027762maraton/.git/objects/ac/536981ad6170d76b7880668eac8a55784f74eex�}�s۶���՞���0=�\�zK�eI�����'O잞;���"!��D�$e[I�?� ��%���og���| `w����,��a���_�'?�9����S1M��n��m���,g��@�>���Μ8X���Zb���%k(�O~�������ֺ�T�pc���[�$�:~�������������5X�]�T:�pw�j�����H� w�s�8:Q,���L�����;��?��������n8�8���L��������z��BP�3��F���ȋ-�A"�&</���g6	#?��+"^��U&N�U��έS'O+�܉]g�k���W�b�Là"��h�*��B�g!#�L��F�p1���G�,�T�8���AE�_�1��W�e�&~PKa0�t�z�Q��^ S����$�Ơ��/�h&7�;�K�O������"��O|gfӸ�Q�[5E�484��$��Nz���m�PP�P4�@�G=g���=K�'%I���t��f̌>ll}� ��u�b�b��H�67�ZF�\�i�,z����]��3�4��ƼT�ȟ�gr�j�8�od`&����nT]�m`<��� 
�U��\E��Knk�'�*� �ax��Ȣ��/�K��c����ؿ<�O���I|0_���@�-��6�<Qξ,�-��I���q:��d�7�H
$΄�楇����f��%6�S�FL#9X�h2Vůy�t���x���.A�,�����D�ڽ��C�8�;����d�5Kuf��'�@p��w��0������ȳh`�����Ӎ�*G�G�-���%���@u���t~�\����cg��V�7�_8A�k��6�w�� ��u��8Y�d<�"B���(X~ٌ�3��(��8�_����� 3�⟗�^vD<�!� ӰFt�C/$yD8�$D��a@��$��Քq�,=E�C:[�=��o�Z-�f�N�=�����S�x0'=�"����l;w2琭��Q\zU�1�A�ܹw��:2���H��֪���p�=��}�v5���>#��-����h�΍�oo�Ak�&M:;	�Qm��g^q@�b{+$��F��N2_�Pdǡ��h�֘T��sx���3��cuQ�?��u�$��o�+$>��x�9�Y-��d�Y�3r����8��IR��x>\���ъ�O]ڍj?L��T�z�=�s�ү1�fM7��5�¬�$柏�ݨ^+7"��۲�zDyO�Ǽ�#�)V�?�6���ګ.�Ex+��������V�%8�V���ϒ� �:�u���h`YtIU�W>^���:��$��������	���DO s�'e�z����nE1����z����H"?�T�Q8?ѵ��~���wLء��L�Q "t�i���/ë�a��0fP)I�Vy�[/� ����QB�i��t��Y&�px/щ2��t�DB5�V�.�"�V�YR��������hp5q���D&�Aق�������VT)W�z!�ޜ�be(?hN��~{��e�L�%/t���T>�~�$�!����KV�"����`�iYF��{ ?y4�k���Bo�$�e�����4��+[ubu<�5A���^'r��D��A��N=��##�5e�p�B�(�SO�pf�=���Nۑ?���<�O|=P��!��"����"?�<X3g�A�cK���U?��B��m�[/v>��U��X�_��1�f7S0(��ZJ�L}σ�+��`4W�sg��fK�`J��!=Z�Y&dM���k6X��T�Pf�:W˘� ��r�`��_�H���.'\�D4�m��0;�?D��6�=_�6�z�������,`��Qj���:sSӎ���!����h�$��m��h�Ѩ00J���'��
]s'Y��0�ǘ@�J��;v�رc���r��E���z�!���X����PWiZ?}Ǩ����1TV@��a-.YY􇂡/��3d��3@@�$�[��6&al�~��B�L�&X�7u�I{����w��]>��G�
��`zE��/����z"��̆�R6pnGNd���`DߟO���H�m۬7:RYPZ�L%I��h3�IU�O��BOu�y��K�́��t�$���!�2s1�$͡��%<X�PA���2��c0 ��������E
�2�l�[V��R���>V5P[�&�O��^c0�S�V�X�g�jJJB�)\z���S�0TUH�W��WȘ`��>�7C��eZ���" ��l�p�h"� �d�j�Ƕ����U�
��"R��,t� �Z��ǂ!	�X��c��<<�R��
rKn.a��"�7���u�|�
�����o߼xy��"�S�_��k���>����"���K�s%�
������/���G��Խ!�[k�r1�`z�����Fc�&7�$�ZK�	�m��E����8�8���k� �	��8��O޼�<��|j��>FƝ���N��+[��u%��a�s3��-��f
Si�
w����)���M�k��2ch�1�F�ؙ�P�`Q����2��l�l�V25��>��~m�`�yٯa��oSaD�b|�I��
/��.��E��7n���t�=Sb7Uf=��=L+����r�h�1��w��d��nuF�VowN ŝX�ƪ�)�VP���c�~7?0R���`h(P��!��bN��K�a�R�x:W��d��6�
�4��3k�^��3�	=*"Vt�Z�d�ْuXK��1aT��YוL3�qӜ5�`Y�-h9Z����a���Y0�s�T�4'��1Olk�ؼ�YL��*_݆���2&s������-����Q�IXy�bm�
�%]����S�������}�X���N�=f0嘽r��X��|,�!�a.]n��N,�9�{qC��&N�;G�]f߫����Η������x�^�)��qtie���k�HY�����ejz\�cɇ�;�֮��󋓳�W�y���Gg6�F_��%ҧ��N�Fq}~Vh�����Tlt�8���;�a��Jz�� �Qr}]�K	&Bm'�f��V�E�Xzu�B��,\�\oq�ROs��x�p����.XL�k�F3yAU��O���i� E��6��*@���k�{�$�sq��Iw4�O����Y�8L�y������ɤ��q&0��X����;��ڤ��j[�pvI�_����/m
�hޙPO;-k���*�)�(����DUm��&���lC��5�G��Ϟ����42,�䐝� ��O�2�f��2��wFf�5��8���"��?G����z	;v�~��#"71�Tpz�<�b����fd̄3�x=�	�~����.�z�H�Uq�S����6��0�c�I���$0��{��%���HrQ�#8=���MX��;���,agR��HBq#�B���VLPu/�j�gRR��b��W�r��o������Kt4���h�H�N��H�B�D1Nr�ICѥ�*.�K�h�9쩺,b~�oS1s�@0L�؉����'_���x!]N~�G۝o#TC��D��=��|�
��i�g/�B%H����ɽ{Р&	b�QH�T�- �¥p")&�H<A�&r�G�>�!#Fij�*~E��!�AO°�X����"adE!3S1k���۔נ�e�2����9(��gkxFn�~W�8.AO��c	�:3x[A$�1���!��1��e(:J.^$ȁ��"��A��w������
t
(���5��@?tr�Å���i��4_Z���&M+h��G��`9�Z	vR=��%7<��@L�rLF�5��E^�`C�t	�_/S'J|�G.r��5�H~"�L��*"b�(I���(�B3e:��*W ��S@9I��z�V?I�+	���Τ�R�:��;O8"[�8��s�����P�v��B4��:�	X8�w��|�͋HS������z�@�i?`��h���f���n��.�հ��03�L�g�����/p��sA��gPw��c������+����g>F�qH����MO�!�*t-+�Ș���>-rh�L��w�8�'��L[z�G�O,���r�O,�5� ��4/�z�z�
S�u��8��`�r��}�yc�i����ΖD�'l��@E�b頾�sH�b��W�-�m�fd�%�Gm��Qo�喃*�h��\2�|�=P��,��rgt��xj��b��[�����j��z�yCȁR�OX�( �G&>��Y�}�����z2=2.����bc�́�����!�9�l5�27(�x�(ч{�l����r\��P����#$��K1��}���oj?�j��/�FI��~j��9�i8h uBw�b����ְɈ%��gAkn���2h�n�[�ˠ�7C�|��fh�/�����ˠl�v�e�7C;�2hG��5�_�w#�40#���0�_���Nᑈ(x�6O���=��0H����U�3��0G��VQ��%QV�x��ʃ���U6$������W%�*��)��Rr&�)^�� <�#h���ґ�a�Q�s��D�C��|���2��3\r�o��$IT.��嘠?��f�A;�>�ؒ��!t^?AD���Pi�������\;����+uE�~:��*j��H6�qo��
�4)���K8�*zo�wŹ6 �F�wlr��.�؇��#�XlY�2�Sf~M���5�O��U	���a$�oưi���N#U'D�1eN�يl����2��y���Ã7�D�^��I�r��b/.F�	���x)�.��4��I>ȴg�K!P~�^���Rr[�4��"��S�5��t�vC����Cg��G�N��iJ�m6���A������F���O��Vڇ�����\�����T��$���l� �&��3��%����Mc�f�x�zC�{��v18t�Ȯ��Ƒh6{�F��U�u�N�1�lLa�C0�"X�l����I�!�-�Y.���M0����7Rtį�a;A��)rN
�pdVK�B����"�=�^y�J����0uB3����C#\��Lfj
}!�8�r(-E���3X+H���lLL8�(9d������_�!�w��i�4[�p�`C�e�#���V�_[0���N��͆<:jtZ��3�4�Ɲ�Ag|�n��纟͉�`�O�ԐQ�l����4lX����`�&8{��^��F�|~B�G֜��O���h����\x��d/��^z��o$P�S?lu�ց�h4;�ѡ{�i7�]��iz�M���)2�S�����/S�e7E���{��)s����H�g�
�A䛡�'5�t�NJ*EKhďH2�|�e���j@�F] G��|��iߺ�6���r��z�V�k���3�v��g$����9�l*o���0?8�ZC}�5H��v�}�����H�ox��5 �۫�{-�\'5�<�e�>>rZ��X��#�>괚�����gSc�[-'�<��<^���X�����Kv�ׂQ��4p;�%��`�Ѣ���c��/"�(�r%�vK�Z}^���\��]ٕ^�>jH�ެ���&�3�3n�?�XۧN���j�\$A&y��kP~�&�Q����Z)�7-[h
�A����9��������y�Q�4��F㖃�k��l�l�B���e7����0w�����u�k���Fr����;��!cI:�.a�p#�#UӸEL��-\�����9�n�3�	d��P�fuƇ��#��t;��vZM����.���g�m�d�c����Z�H�hlS:.������M��^!{��	$6!��O�7ӣ~tP�Z�Q����Q�C�s��ݣ��f�����(�k���:Ĩ1�����4b�!��w��!h�Dv8Š�D��)'+���A�$ĵ��v�c1C*�|E�W�[v�%T�H������ԃe��m�q�	y�8���t<e��(=�y�ڒ"�p���N�?�H1a��?�;6�}�-�0l��腭}��`��69��
��<i���t@�Y�n����r��S�ۀ�l�E����F,���Ā�.\��6���'�Y��si���#+6����؊��!Ǥ8M�;7K�5[+&[R�o�x�h�9	�_�/�m^�1�x��SK��$B���T�ʩ�o���:�p���y�hk��;vp����x \o��jd�>��[8v�Y��_m��x):��U��gs��n6�����zj�4bx�1\z���� i��g�$��k��T�@0�^�#H�A�Q;W�� ���>�V20����Q�G�Ԓ�c��f�q�Ȟp���H-�:%��$ug��h� ����4�^�����`W�����[��Y����5�r�@_Oՙ/VgH0�\f����䡪Se?lU�T��>��2��a������Yb���`��	$�� d�?[�O��� �� �D��wj�|��f���y���ne�ӗfg�g4LQ�|�i�k�"�g-�CT��6^���c~`�{��1<���׎�#� ��Of�<��D-��6�CZ���Ahn)�QE#�_��%+d"9��ܕO��%>�$���� C�T:g����r;���!���e���
�.8��ͥ��λ�ȥ�%a�卷qrz���yk��
��=�iI!�����4<��Y�<�>XJ�H7~!�#	��/U[BӴ��},��|ݜ	�	���#���+��n�D��:����:��s8c	�:x���}�= �rp��8}�r��# ,C۟PZm̻J!\N �}���D���H�4(؄.�}� -��t�Ho�Ӹ��J�kM??ç�����^� U�x0q��l]t�cu���|�>N����5#ie�����Dz���z���ṃ�n�9esagӍOV����������/Ҷ�v�u�^�� @�L��i�v>�M�/`�!^�V��K�E�Fn��$�����J��}��O*Kg�����K��󤣐�� Py|2���8�� d���!Ҏ��%"Fe:wg&~:����
"@h�*�C ��Z�>�,ΰE���R�{���Nq����ۗ]���ק�ؔ�	�oq2�2�sq�# �f��/|ǣ��x1B��wcL�:��z�}��0.)��1a0,�^��t��'�bk�2�4��L2�)|����(�����aYS�E5�֫6�?�o��T�Ep�w�\9cP����^�7*����t
)a��z �Ej�������|�\mW`0W�Y��Y��!�V�<�R^��n&X��,v"�%���HI��,�A��G]d�E�՘��O	�$�Tni}�6���
�#~�DP�4��S��@vF��ѡ�.jչ���h��D?�������8aO%�6���M*������Dh�Mֆh��P�׾�@��=��l��p��;x��h�w���*jXt�ee��̴��@K��p��x���/�б�;��j^(�ʷ�>e�����9}Ƣ0��gh ��x;�����t�ڂ����s�.I�����ܼ9t��N�W�|���X"1#YY��^ѱ`U3�����4[�@0E)���,?<Vs��H}�� �E\1���čE���LA�ô�<��kS%{��o	'�pJ�(k�:�P��f��p)~C�S{��8bGux�7T@p�"R��N�H���]��rA
{��?ԣ!P@�Q�$��<*6���'��qqC_40/�CC:&=C�YA�4[� LϪ�/�UY3w��z�h �6� ;��X	&̥��ނ��	r���k�cJM�%t�2�kZ�bU�L�=:T�LM����c~U��J`*	�5�:�ZR۹��F+6��[?C(�%��b8��M���|�qB��D�\f�F/��ݕ�HS$'�I*��7���kUC/T�B�Ҍ�3="����� �)�u�H��b�d4��n*fiA���U�5�-��A� ���Uh�eQ�}��$��K�:ϒ͕�Gs=��g��O֮��J�Ԩ�jX
�1�2�uN�����#ڗ&���T�An�
f��tm(E���/Ob8[��1�؞TF^=7L3@����"X��ϲ#i�G����衒~]U ���m�8����X�K"���-�j(8�8'�OTP�oQ�@E�������U�2K�y��
�k��I���A�����e�!C8Q+�څ��J~�Gt��:t�l�>�;=�侞(��!엊@����R��cG@�>���-X�a���yQ?�\gx	�,����2n�0̇
�(�'ɇ��T��C�k�*x�2'�X�eA���qOx�.gU�Z��ˀо���;E����'߆�p�B��F���.}�o�'�I"Q���dJ$���+ax�{�B�"���"*pu��|j�\b�sH�8��v���F��6��~>p	���T�,x�����DN��N#J08��3Us�/Ɉ/�	��N�/�{ � �(xX��>��.���G[b��5|~~�h	:�����Kij#)'R�&���01�78�k�3�RF�6?^���c��AU^,68Bα_�qW�'�ȝՖ�om����o�5A�4�L�Q�/E&���t�b6Vu�3�y�4j��u޿'��o�,ŋc�L}R7ܳ�?�Uz�yF�o�c���h;��<�ݝgn�X�}�9��PK��1m�x��j87�M�l㌎�	O�6�N|C�����N�M�`K>�V����1������I�T9��0M=��0�����#.�=�)���SO= lWN�^�T[lt����#|QK�3�Q%�]3AS	$_��1��k�#E?�ʎ��-3;;����2P���8ĢL΁ҭ�8��+vҨ��U�Н8I���[b��\����"]�ųg��2������[��@���`ހ�0m�Ǻ3q�%�sJ}����.���?Ah�+��>��u=4����>u&!f5��x+�0����f	�@�2|O<�<���@~tt��lQ�|<<�k�mCh���,d	�8i�������x����l�yCIlj�s����$.:x�mG�Ѵ=�Ғ9JS�k"��2u�]���RC�(Q�{�,��M�T����6�E���|n3
҃v�L�WZ��y�F���R�m�'�_i#G�����?.���Y�Cy��p^�����sE
�|_���oA��c��t�Tz����˳N����o��{�e@���u�&��绒���6\�í�U�8�	љu0�H���x����[7ՠ��/;�pt��}�W��`|MNL��{�i�X]:��Hs����gQ��Mr�8���.�A��I����:�B�"� �[�|
=�$�����*���]����H��~<���g�'ϼA��c��a8�I?�m��l4�CQ�/��Ʌ(B��Е,�����&�@�+,��3���c4N2�8��f2v�n�J\	+�JTq*���o��8m�9��gE�7�k��� :��~Я?�����2=���/����o�� �e<-#p���{*\��_r"(�
��C����U�/66d�:U�����rL��[�G#���8�NЊI����w�F;2���9����Ji���.���D �$ߨw��M���̪\I�����9>���
��+hTڌLߐį2b�"��0����N��x$} {�Jc!�����gC|J�Ȩ?��5h������iuz=�_:��	h��l�q��3�^M�/dBN�x�~z�{�V���t+��������u�fZC�q����&#%B�"�"�G)W�c��=��B0�ۿ~�0��uJ{�N���#L=��&�s�)�\�2U�gܚ���0 �����#�"�Ym�Ue��VH�\�d���������ǱQ�[�Fȭ��w:�3:3q�[�����(v�(�%�r��+�vM�I��H�WQ��ю�_gu�rBq��� ɧ��\��Bf���#v�$N�������,���"a���Ѝx��*���K���n�dλ�jd�KUk�Z.�*�d5R�x��}��+}��I^D���˪w<AUaF���JݤSr��,*�����/�(�_U|�F��`�c���/���]ºJ��v3�b u�rh����?P���330601000100011962maraton/.git/objects/ac/daf69443afe4a87daeb0d8572a28b35a54b2c9x+)JMU040e040031QH�֎/I�-�I,Ie����竑����Z!�>01 ���Ă���2��ۋ�,�o���=š"��Y�����p�	�c�/>�N�_��ב!�S%!.168931000100023maraton/.git/objects/fb3306010001000159162maraton/.git/objects/fb/9109d78a1f6d6d6136c4a37a896894cf172b0dx}���GCsv�����������Ү}XhF�HJ�������_�������o����篟>>�����8����l�\>�����or��bt�7���\zm?xߜ酳��`�	'�ދ����.^�{��<bz��0��F���|�}�7W�zh�x~�!����������]�J�~Sӫ���^�}�j�o�qg&������Im���N�wm��\���x��9��;Vo[��:�������|z��;}p�>jp�S��!9v@=���Xb��'�ٓ��/�_y�F�9�뽽p�_<�_/{ffg_ht�s�����>=��y��S�ԣ��֟���Ͻ�L��a�⥽���lo����\��3�ǻ}������{wk}�^����w���|b��K��_�uf�?3\�~SG��Ŀ��m2>�����a_�C�6G��o�3�����{l�'�6G�8{��ٙz��ۘ��7���E����zDt3_s�yP�η��rqo]zSÃ3�����wr���������������®�F���n��g��'���~������p6_c<g/��e/vc��NM�������0���D[�D׾̘;���\"�'�MlO�~��V���Q��e��{�7y��������n�G=|X�^t���7���wA��'_fع�Nv�<�CM?셝�q}���\<�u���?^��n�?|�/�Z�Y���x7��^{�>��{�o���0ˎ�މ���K>q��^s=W��~��3o�?s�>v��w���E����oo��רw����|0��s�ԉ��ި%�<ᥖ>j��qz��C�y0Ϩw��O�'�}�D/�D}�ӎ���^kÁO�����q��~n�������\�����#��߽�nύU��f��N���͋�������l��(��Ӄ����9�����1׳��c�D��e�;�d�=�A71|���N��v����g����zj̜�7|���'x�A���Dk��̽=�k=g�����O/,����7����n�9���|�{�W�~{��J��xx����u�K�.����hN�|G΃˹��q��g�7�����.ڗ���o���q���Z����ɅM��{�����h�������������{8��9�t��7":r�~v1���}����E����''X��>����~��O�~r�����^�m>�;���/�ɥ�}_�^�FsR{�1��e'�����b��y�ifco����Aob<��?�y=��3���浶���מ�OΫ�u<&�n2z����:���^�l����c^0��wy�%}�<���zǵ��?4���!:�۵����$�:�kx�B��7x���sf��m/?������ښ�繓�n_���ٻ{x��>�F�Yy#"F� ��g��<z����7@.��9OD�y�F]���N?�z|�A�����e��������/v_�֬É����x�덍a'rE������G��w�;�<�_۫��=���9�����~wNۿZ�����m���~��{s�9w<r'�%u���7�E�u�f.3�ms�k�7��b�9��}h���&6���&?�330601000100042062maraton/.git/objects/fb/5d5addbd744fbd6d1ee9c845425ba7cc7aee80x�SMo�0�5�F;�R:�v����v�*!@��B��IU���/�&4-j�����^�mUoa�xz�U�g�n��� z�]9ӵ*���*��ж� �<��\2�ޭ�R!5�J!�hG�96G^]����|�A�%��Y�B������{
j��V�)Tn���Kܠ�����̦`B����k��,G�hdIC�>����E��L8��C���}�;'��NA<D��`:���U�������8�w�!K�j�� �,`fZs�Y�Ǧè,������rn��f[��(���{2cG����:��/���!R��xg�'����,�[�w�'d��1_:�\Qx���)~�t,����g0��e�/@h�O�έT[~0�
}#g�r�η��a�Y6�Age��)�Q\�J�������168931000100023maraton/.git/objects/b6330601000100050162maraton/.git/objects/b6/41222242a67d246460be075ec08a5cdfaafca3x�S�n�0���m
�Ԗ!�����L7d��$ @��� H������{����7��3m?u��dus�)�����߆lg�rD�y����M���$eg&�z�C��ؘ��9.���Ԫ�L�g)�!Ek�*��m��̦���=R\���z��!ü�|n:��Hr>��ύ��e��Ozl��_M���=g;�aڶ3u>��B3?a'�i�����3ڊAm�;�|�ص�k�n�My�r�kH��yΕЁ���	�G��
�E��径H��1a��ò��당C�zK��΄z�y�Q9�q��R�@������ừ��tj���`�#����zp�W%U�v��?�ѝ�V��@����q�.�:q��1�CQ�J/-�2pq�b|�'s�������Vb���'˻��ks2��u��勢��Myzy�
�I�8;`����o 3�=ڇ/��S;���U��M~�2�?E��94�Ή�橪"���9��&3z����I�168931000100023maraton/.git/objects/54330601000100016062maraton/.git/objects/54/a9f1ac6c1ac73a24e1df5fae8a3050b2aa213cx��9�0 ����@ЮO,!���kg��%���<�n�Mn�\;hc}�b�LYR:o���]!<�F!K���ԛWY:��K�8ıN	c�V8[
Ddِ�?}j+<��<+�_�V8o��:�6 {{�����a@���������3oW��7G�330601000100069762maraton/.git/objects/54/e136bf36129d21fa1049724a516c765cd64a76x}TMo�@���F�h��JM�S.�����F�%��Y���:Q�{�,�n� <o�̼aY�%��_|� >�&�ׅ���J�T�4��j	��v�m��ݶ���^���NliT��B���f5m�u�l�Q�U��̐&�䚟j�����	�n�un�&�6���\#M��F��p��6�t2B%0��W���&[ɘ�I����$_��\�$��l�h�j�4�"p mf��/�ry��ؘzt��S�ZF�P�Ff�"\qLGs�����6�*#�|Վ�>_朆'a|4?�������ϸ��e6z�4�}�~7a:��O�� <&������n�ܖ�=xv��+���� �{�gvW��s��?�G������Dg&��������5��R��iN����q���a��A+��&
�8����A�NV#�tw�!i��	�/�H��ˡj�4FP\����h���"~��c�ś��Ɖ%�zmC�BF�̖O�E_�<�\/ʏؖ�8��=���N=I]:G��A����a2�<�>�u���;N,�o�>�߷[8u��:�A���5���	����f;���٠��g<<��7�)�%"��'��{����R���0�n�F�U�[�H8��}�.�Nڷ"�D��ZA�l+N8D��I��R]R�7��ă+�����$��[(�W��4��L�
5(�|168931000100023maraton/.git/objects/af330601000100036362maraton/.git/objects/af/6235616dae6b22bdec846047dc95e36c24eb9exeQAn�0��~�
��Ir���~���Y���P^�YB�^��ݙ�������!�m��@��F&I"��B[u����ķ )��rt:ў�7a�r�M���0���Sq��暲���AS\�؝�.]�POؽ�����D֑/��(]��y�L�J$`9DE������L�N0����\�:�l� ���1)��t4b��se]�W3KX�9r����hi�a!�%IJ�X�����͛��_ߒ/8�O��5 �#)���RT�*�wu��?J�]kn��������i�������I���{�T$ш'�[��l��U'@�>�C#�Ն�U=�9`y�Ju�D�%��
A�RǶ3306010001000236262maraton/.git/objects/af/8e2ad3f3b2cb33003f2ad757f0e46954d8fb8dx�Xmo�F��ԯ���Tt$9��[$��@���0T�"W�Z$�����K����%%���*�2�/3�3�<3�ei������O]�e[(:Z۬ٸ�d�4G�nx�|����]������R��rEXv>N��g�<�E��\Z�u��?���J^(Y�Z٬��$)MV,d/K����X�図0'ϋ�m�Z���U6���̺MV�a$7U�ȡ����<yC����pBYE��)=��w)�
��u۬|<N�m�S�����X9Z�SV�L�������&ݯ�i�}x]�\|��-��[�#2��xrJՏ��7�~2�3v;����fm�sqC��6���U;��8pp�W�w�Ʝrm�������%f[��6:��%��5�.T�N�1�"�z���5w�}�x��yE
a�����Z�p]c���Gt�)rUf��L�u���
^~[Q�X���M�~+Uk3��*�E��lY*�r��R2V��}������i]y?��*G�M��Ul�k��*�"�T����i=u,p��4,v���oW�]�/?������3$V��g��C��M�~���$�M=P:�L�v�[�����ޱ[�5-Nu'�������pc��.�)g4�g�^T#E6���^�b�\:�<H��ɛ�c�6�zCylk��}���(��	7HX���C�Jω���CV�/^�����>��g�ˮ=���nst����ò�`�.8���֌`�����v��n��\x�溞Ͳ�L�-��f�k��d �����:T|ؙ�e3����ކn���2N��t���z��ߔ���p~��%q@,����'�;f�E�d��EM���P�R�1ܔc�X���4��� (+nQ!�����[�i2HD����ذ{�螦w��i��i$�8Pt�f�K�bg����K�~F��G�e��2��kI4N�e+snf�bn � � ֕� ��	b��p;�MA�Lf/�z��K�D��z��3�hx;�X��X�H�V����� ă��������=��R���t<���B�]�?~HE��k�"�Ejw�ܩ����W9j h�
�ҵ��b��A�ĕG�3��_Ï�7)-A�4,tj#������/���V�TA��AW�y7�����ț?@O�G��z|��Q0�ZYɱ3���V���j�85Kc��n.X<.�{�j�"��� H
��2%�����5�s�`�`ڞeʋ��c~�>;|?��ӑ�%��p|�pf@�-��N*|@����?��L���e����l@�E���=_�|�~�����yc��~�]ݴ�i��8"H�s���{��2,�J�e�R4l���Ch'��/��&$5%�H	O2��)J����79D�����o$���e�Fl��${�'��3"�x*M����QH��@]"]�$E���a-s��v|�Ԅ�a��kX�d�����g��[��v<UC�k��~��v�2�ٜN��T��̂�!�5���1[��[�่�=�j���x�Il&��@�[��O K���82�w����z�/�x���ٳ0��S:g�0\���\6�o���*��٣y�nUz4驸A�I�/r�B��>��Y���_}�2<��?w^V�R[���l�ɪ�`��s�p�5p}�s����y�ĕ�'Y����ƣ�wF�+�g�҂f��nS���z�`��:�`�+��-���)�R�EV�-��Fڢ�!	5Z��>ٶo?�eA��Q�)���jU�8\.("x��Ձ�ش�a�(�bÉ���{t�����M��}F�bړ���rY���;\|Av�X\u��z�����ު������˾��C�Ö�Z��shpح��m����䤲5n�\Y�W0o�����W&���(��*,��Q�Ȭ����.θ.��N�t�蛤f w\��M �P��5!���"t&lR���p��JdLЉ�վE�q/�@ 0����3
S�����������=����G��"a���jYs4$�VW&$�u�iЁ�+����+9
#zJʢuUhh�L���;��fU�D*&	G�\�=_�[4Ix�n��t�WNw�����
7MdJ��:�>�-���}}�����=� wO���<��sq��B���E莸� �~x�D�NY?���?J�&[dC��Y�"$U��YcHiܮjQ&�yt.�$$Ґ�BT�k��rX$�K�
<��d���҃F��	�����"�W����ގ�K[�jҍ�yNymh�؃7b�|�t�X��BCl�� �:�c���d���|6q(|��e�ӣ��/�-�168931000100023maraton/.git/objects/46330601000100055262maraton/.git/objects/46/a5c85e4af38eb1dc91077c1a352c37385e980ex�Tۊ�0������d!�>9/��`Gֶ
�\${)]��{f,�-,�i4s�̜����L�/�_?}v�\��j��>غ=R1�`q�,�"��׭��jc)�́��sk��}Y9ߓ霏�jK箻���E�y�{�7�C�_g�ǧ8��D�Ǯ������՚��B�?�8<�pK@r��bY�-��o�}���U�d4"�f��W�A<�IT����p��Բ�d�h�тFhHh*�%Z�2X�����g�w(C��ƕ�;v�{�r%֎��Pq��=�*���}�f��v25o��i9�%�L)N%����s&@�B'�m��><B%)a�E
R�-��3�y. ߸d<���M����A ���a5/�f2��k}����֗��o�)�Jk�k�
�������q�Y�
m:B3H�,��MU�;��ϧ�P6�K�ʽ��$<O���K"��h7X�.�<ӉI�1	?s�x����9�Yy9��Q
+ϰ��7�)u��r��G�q}��0�j3�)�y2O�����'��\���㏜`S�F��~�"M{�H$�o�vj168931000100023maraton/.git/objects/94330601000100033462maraton/.git/objects/94/ef56f8a442967c1c8e7010e3d6eeeb2123934dxmR1n�0�*��
H)�H:HǾ���A��F�*�Ԧ�/)9�t�a���#�'?��e�x�#���sNBJ�<�%�����&_��� �����G6��> g'��l931��ҁ����(1� �w;���ꀥڴ5�lCO�OZɿTTPP����%����Z`�p\gp6���E�EL�h�1��?�r�mX	�n\��j�q0L��	V�H�Ht��=�1�$����ت��V�󸝧Y(��In���c]��8���LIz5�5��2{��q�4�`M�E������j�����gH{:O��X�)��,)
����gq�4�v�������~b�N168931000100023maraton/.git/objects/0a33060100010001013262maraton/.git/objects/0a/51de02d8170d81dde2392136e52355d8636530x�}{s����+U�;�t�IE�DR"E�W���U�rO�R���H�4�af����U�kܪ�/w>���̃"e;�n���y ������ND��k����go�/���b�,�����e��M�����ű�y4����8�<)<�-	�fÒJ#1x��\o��ee�w�=���'[�=�x��,������*/���PqA�X�܀eY�q̥�����X�^ 职ro���-���2�V��:)���>��K|9�x����.�%�E�ė�������uU ��0�{!��k��#7.	' 6!ze�dU��,��d���x^UU�8I/dT��7vU�?��wv��>����aU,��<�"ZM֨b/�.T?K�fn���ǅ��K��B?�U�4���FE�_.0�b�W�U�$^PKa�{:z�r�� @�N/���8;D	�Q��}���%����s��Е7�#-��
/���-�6k�R�@4Mb,�zX
g}�r�N�(0B(�f0����\�=�$������wO��V�Nlm~���u�d���k�P��j�"?Wi�$�~�~{{[���Nu �+n���-�59X�z��538��]-'�-��.0����[�s�j�Z�����%�6�9��9�f��5�����KC2B�%Yy7�ҏ�g�y�Xډ��A~�|(���~�j��)g]	�Ȼ�N"�4��j���H$���������f��&%9���Z�#9���d���y�t��x���A�J"A!����;K=#�"���}q���(��%��v,)�`w�s��0��������hX"x�I�*9�����x[SD��;��Y�|i/���؉�S{����ۥ/� �5�6�u���N��8Y�2�K	!���t�@�lF�K�(��x~�����r!5��_uD<� � հLt���${D8�$�D��a@��~��jJ�8r�%=G�C:[�	]��o�z��kf�N�
=�����S��`�/.���0Lb�_d³e��8\@��/ �'qU�)�\���q���@�$��Q��֬�ٳ��C)`W�_��3�ߟ�1��y����X����mҤc��p�'+�w���[!)�1��v�9�"�"+,G;����>��ێ@�E����EM��7!��a����d����g��Г�{-_�l���
Z���O�r����ꗕ���}��j֚���r�CO��B~n�]yu٪�V�^�u����G�n��a)7"����{D�@��y�G��X���/-��U頶�ፌ*��{�+��Cp���k�� �ؑ����hX*�5$U�^yx��/�Y2?�Q���!S���C�%���z�-���'G�6�b(�����*�Cq�D^0�M�pq�kW��J�����C#���@D�n��_���a��0|(�$pk��mQ�r��� �����H:Ў߮�I�
�W�D�zB�l"�C��Ye�
�Dk�,)
��%V���v�e4��6��D?���6�H��ъ*�*��������{����p/��WI��Ί�����_*�C����q��r�\�F��� �μ"���7 ���4�+�d0	�5t#��������,^ڎ<j���H�	��Vo�:���%�LZ�����9�X�Q��*��[����	}k�Z͖�uڊ��\�@}�녀�4!��a����aɅ�����@��4M�-A]�(/$���" ��b�^Q[�Ѫ�5��U8��nV+��^����$��s]عB)�F3���8�_AS�7����*!{�$]������2� ��b"���y���~�#�;+Ӝpa�`��V��xq�[i�|y}*ش�V�o�;����Gf��Rv_�N]L�
��i4�&�$�6�h�&��F��I��\9�WP����(X�ȢX��ٸ�;��T
ܩ-��{���# �>~LN���Y�F�h�cu?�B]�iU�l��Gr��PY�+6F���be�	��Z���e;C� ճl�ۘ���x�k�0U�`q�H��'�������t�h��*��Y���'_6+�O�Dl��+�l`�L�Ț������)|S�"۶�hv����\�K�B}�f��D�����B���=�5��I8�uC2ŷ�1�$͡�pI����R�aɔ2����F�MbK�KK)T��8��qY�F��mT����ښ5y|��������rŊ<KUSR�hM��[�ߜ�����B
��;_!c���l����i��o������C��<���Q_�i���7MQ����"R���`^�N��c����T,��1�h� �����ܐ��K��H:���|]�~�
�ғ����޿����������m�Rh����>ߋ��/iϕ�+���˳�>��4��{M����r&f�����?��ƴMn|I$�V�6�&C�,}+��?{yq��ş�&Ъ�#>�������P���12�e��u
-�XيW�#�t��a��J�q�0�jp'��.x���O��d���(3�S!mLm?�:v�z]�(L�A��d3d���A�p����+�#��AS5�
#���LReWx���uA%,(�l�qK�^��C��2��2뱬�aZ��5|7����P��݇������u���x��)n�R7V�Le����k�����zD�(CC�Zh��sbB�Xz�2����;�I�hi��p�A�y�F��f=Ӿ��`������sm�Ġ2�a�d]��hH`T�`�y%�R�i�4�`q�MhQZ���iK���[0�sU�47��1O���y`�ؖ�8��o�DN�;�IH6~f��臕RL�(�����<q�>B��.`jq ���D�tq���~P�n҇��+ᏙL9gǶ;�%[�c�NQ�v�2p_�_�2\���$߮�$��E�as �_=�ίa�FQ��W�)V%`�<�.����Px�/��#�P����u8�<8��y�*��]��|�7�_�~g��v������ �>���f�6��w/M��
��G�]83fؠ�W,����l�%��u��`&�gp��h�om9_�O�ח)����r�M��-�P�m.�/@6@���A��h&L"����y��<- ��r�F_h*6šύ>o�9�ۤB��P TA��n�	��, H�G�d�@�س��Fo=��C`q�6�py+O���Y-��aʭx���/�ucE}�ZoϨ��Ni�xK3�F����KC���"@��~���U63�����l�B���H�"A���-D�X-�xF�.�ˉD�W��/�0����e2�U7�,[*��ʹE���0A��EH�ƙ@<ؗ5���	�Z$!_꺪Y E@�u2��xn;s�,�B1(�@D��3�< �0�k�̇�h5�S���1A=��|��D�WQR/	:�pi~7C�b��QrU�V��(Ȱ�k*�znP�7Ⱦ�x�V��5e�u�{2A������^��U�!YpI��V�72��)`�|+���y�x�.�=�{Wxct�${L�Κx��)���"3�	I�5�E�������j�z�@��X-DVY�AHp��{ £�>qk��r���WG��Y,�>�#}$�1]C�|I�)�4�P|�|��%�ī �N�9�{�� �'cFU�gҺ�Q������+���0�T7 v�����j6��
�'� Tafb��Ѱ�Ѭ
w�q�@RJ#U�gU��j�W��*�>���|$�ek���T���8�J�DG�{S�өO{�L��4�f(%^NĿ���I2:��y_���d���oF5���t�\x�^D �,��]H�0
�5�)��,��Cz~g/��LYU���j�{̰}Ha���j���~���h�#�t�������^��������E~̙HB+Pޕ��XXR!�S��{�SV��D���$���]�6w�|-m�]�R�_����ƺ/XRw(��oTCV!ͪ����]��%DEd(��Î��%�N��8g�*ڹ6ܷY����h��q</���ѕ�ּ`�Dk66���!� �!Wo���N���b7c�DXe��ł���THa���O�n<��=W&�(:~P�D��?9M��y���S�
W�kG�Z��R-4�S�r�8JU)�t�0�M����F��hLRi�b̒��y�Z���Ap�m�]��ko����:��u� ��vp���vp'��vp�?��	S���<��4��*M̍�_2/�@wH��(x.v̱��{2#���e��K/�"����b	�J������J&���?6!Y�>���A��H�4�r���?~�Z&�L��P)�;!oѯ,d�U��Ɯ<�5�״}�A����$Q�L���GʏͲ�v�LfY�-D(�KDn�:�M�U���k��}W�:��RWc�ҋ痥�ڦ06����R�������϶��`�s8�DR�\鞚�o���NQ��=�n�~�]2a���t��n��܊�J��#w;�Mvw�!�5)Cp��Nd�����c���������P�f��;}�;��N0,�<�A��R�]Z ���Id�$��K��D�`�P�A�4z���S��89J]֛H�oNܓ�v��r�[�����6[N[M��4�O(��h6�*~�g��D��d���X�CWGOSݪN�f8Ԯƀ^�_+�T�B0P,\���b�W���UH|��v1@t�g5�V�#Z�~��?�����H�SpG/�J��<��~��
\Kk���p-�17,N�����W_1X�"Ʒ�$�y��zq;�=�
�O�企�l]&R�Ȉb���
�������	�;�f�h�>��;q]{ҒG���d*;��l�Kx4ۥփ"�,�uzc8�F���~d5�E��>��R���g0���B���_�n�5=���ӓ�}�=n��I�ۛ�N��8N�����=��p7[M�d��c�e5��y��`�A�ފ����IO����'��*Vn=����}d�����A6�Τud7;�F����q��인���9����=���n�nz�'��-&NF�V�<�>:8v$$W ��K8�(ww$�x�kq��4�:m��?�|s�u�oʲ����E6?KDr�+�
�� ��#E`��������c�qܑ��qON&v��i2᧭ƴ5��f$r�o�E�2��b�7�VK4���&�2� ��y�E�&���6�	�vH�L���d<qe�qԴ��I�i��c��#;����a6�{/�4���.�"4D��o����[�]���b�?i�$v:=r��9>�r�U�I�^�q�sJ�;�#�M���=����'X~�Ɖh���f����߰6��A�>5�R��������^��&h��fk�>iC�4do�p��gc~7�/�9���"��C�/��=�1����а�mр��귍GoS�^�k$3��;�� � �($�v���Z�V?͆���Pt0ۥ�3�0�R��ؗ�r�[���P8+Kxх;␠R�F�����=���8�����Y@���T���!T�)<��+�}0�B�RHl�B~s�	^Mqt�o�m7��n��4�'�vÝHy�h6�]���L��f���|��s�/�\��q��K9�ѣ��F�O�~�x�����?A[�w��h��@#!f@��*��D19�<�#���[)n<d�0oޏ e�9qC���C�Z�H�I$��:��f�@J,E�ݚb5�}9��CQ1�%�Qy&���9�ٻty�;���}8A���A��&�#���0��1Knʀ�ma�b�&*�pP��T���׊<����Ƥ� �M�G���ؽ�^�ۙ6�m��}
�<#n ����}�#������#�ᭋ;���7@�P��Y�02�Av����Z�� A}�1�:�"�xj��zGL���l�<�R�h��Zۆˁ2����:�A$�!�����ó�<��A]&76�#DIR[Y��� ��.�~^�u�ݻ76,��t9\�7���YR�IV�xc=�X�*�@��y^{�?�[���3���8��q�� ⟐��M��@Uj@��{�-i����u�s��f5Sw(�&�������\o��jd�?��[��n/e�6�B,����z���a?�3xl���P��1���3���!���NJ�s��fϞ~�8'��D��.��
p'�ϊ'f����Z�B�RKʭIX܄����b�}2p�I�-�*%��$ug��h�$@P� if�@�@L���>#;����|������_������.�o�/)����*:���\T�k쿬�e���'oZ���)~�]_�樒��;'X%ڗ�d& �'�����s�(� {�h/:@�)Y|�!�d��y���ne�ӗf��g4L�|�i60Eh�ZL��&u.�΂fX:tK��bBp�~
a�_��s�V��2a���w��gi��}E
�AT��A�7�'�w�8\6t�A>a6��˟�&����R�l�⦞��v ��~�r}U�"�4vNnsi$�~*ves�BV m����ț�a�&�.�^3�nd�������ҽ4H�H���j�]�����a�%��O#&��l�����a◰m'HDnE3���;���W�G�wH�}��ȍ����Y�u��	�q�m"C�ihG	����4v�q�P�G�I�j[��N��@iq��軥���N�X��#�+�����:�LC�� [�[��2����M�	z�=V�H��W`s5�/&FG�	-�3l�u�d�T&�ѓ���)��b�r�T�솴=UI��3������<;���T�Y�vU#v���Y�f�uts?�ֹ@�"��:0=�[���\`�f%�d���WB=`�+wt��p�NRר ���y�*N��' I7,�'�,�Bs����B����I�q@�L�h�*�O��q��j���Qq��3�����E|v�ۆ�e���B^V��H��A�B�/���&2�s���d	��҄��,վ}��图�ϐ���3ʸ�*�����<K��6�Yވ@�j�S�����Z�N5:��7��)���2*T��i��7MJD$1���C�5Rp���o����*�����ɗ�N=]�pS��>�J9/�h3�E��k�l�K�@�'Q��0FA�u���[҇d���5*ό�<j���@��kG��W4�7Q��@vF
\�D|��f��D]��o��D?�����{��U~@�2mR4I	��Ȣ-�:W�w���)��u :P's���3{�>��'��֎��B�>�;*t԰�t�"�*�L+�
����G���!8��R�J�yg�PK�e�@�.��� �}:xN�)a�����,n��s��@�.P[��s�"~N���8E%��yr�����������BbF�.f�~8���`U3�k0���&*	S;I�凧j����:�p�мc�H��Y�C�3�n�d3�M���^�%�R�Ap^P��s������C!T�FG8�Dux�7T@p�R��KH��n��Zk�$���4��ha�93��GŖa���	�u\����"�"��֡���b��b �fM.�ɺ��;GE=A4�z�wdg�Y�J1`�\ʪ�-��|V`t��k�cXhX��^Th^��frй4fjr����t(	tA�F�QgT+#j;W�X�M������t� �Nyzbk,_a�.9�0���Q�9p7VR i���&��r�,�B�af�V�P}<��F�Gd^���[ 2�����]Lۀ����M��,-������B�F��/[!h���E�"�����H�d	����5�$C:�(�8z��ri��`	Ø����X
���u2�{������
���ڝS؃kY
f��t*m)E��D0�c;[�`�)���v�
��4�������W�����|"	=����C��`������]���?Ĵ�D
h�[L5Q0�qHR����٢t%���$7A@��T��,G��k̯%�xt+
��&�P��tT�%�w�*'���3�AG��mBg����i�J�C<ʇj��"P�a'U��tH���p��M�0c`弨����X�7�ME�~
�s�C�V�>	?t�$�R��R]#/U�{�9��t2^
�fŞe:`p���k8�7�VH	��0X���n���RnV`���~Tѕg�Xp��>I$��j���H���J��N<��±��P[D��!՝grr� ҲrǖMq�%�o&��e�����ǖ�5��*˜���.�3�>�i���ܙ.	��ǁ���L�b�0���s�q���n��E���Huq�@��p$�F������Kйʐ��?����'1�Wrf#�]a^��s���g��uq)�EL�8�ܽ�Uy����xy7���B\��Qs�.�-u_<{��}�!U��3�%)��@�{�!u�XՁ�8��ӦP�ٸk6j�w_��7zL��)�Υ>��Y֟�*�@�<K�7�V4��V���y��{O�p�>��h�#��t�U,�K�g�5~M��8��>u@������OW��M��X�Gjci��	���+d�x��P�$}��FC�N``��pj9pj]0{��̟����S���LR���{�������%�ʞ����򮈃�������}Z0�����Be�Ү����K^@(ׂplå4�(��L���Wl�Qw>V�нU�I���[_��� /�e���'OD�e���G
v��SU����sa�"�uofWʴ��N��.���� �����"%R��#`�l�G��}��4B(�8h��oe55�P�Xe�����rg��r��kx�xژ���J���^C�l[�@�f���������tk���S��9Vd�C�P�-Ј�~���)K���Z�`�'����ю�̖e�C��1��X��7���RC�(S�{�,��-�T�����E���|n3
ҽv�L�%����o#��_�F�^�I�%m���6�Ss��������C��*:8'u�]�J����!@3��)�t�<Ri>�0s���;�{��з��p�ծ�=�Vg�1���d��o��p'h�4βAdf� LYR�)R;��(>T�J5�Q�qq�26\�OU��L����}��+�oח��R[pH�O���Y�1��\!N� 0�-��h.�A9��H����*�A�"oY �[�%:��N�A�Vx]�I�8�i��U=v�H��w���6���|����	�����޴�wA4�C��/o�,~�r���-�R��%��!M���WX&)g:a]�h�ddq*��d�.!2�zոVgըjW�y?���T�3���!0~;�� �?�S���!}��{�`$�T�i�~Y�����ǉ��yaB>V:>�P�2@�7�S���+�tx��A� .�b+aC&�]���y���Y���b'�h`��A�&\x[5���8�w5��-$K����V��p�]�<�yy��Dv���󸛍N�����x݁Y�+���$��S<^��X%WШ�����ʈɊ����
>V?�.�A\R��4�k���z6ħd���s�>�^��8�;M����WC�*йBO@c����Y�ͼ6�_]`���_yn��i����*��w>de�a���Pdl��f��B�P��1���Q��X"f����s��=�or��^�s䳹�S�z���H�"z���L���D"�>�o�D�A�j��)�g��&�u�����a�x�rx��L�����N��L\���(��;�Ķx��Qbϖtˤ]�s�4R8��P؜^8O�C��X�(���q-$E�ى�8U����y��;��9+�߿��41��«Hؠ; t+^���;�2<�(d��l>��A�g�\���r�<�Y��7^+�K��J�G��b�Q�п��z�Tf�l/˯t�m:%�k� @U�ν`��� �X~��W�0R=�q`]���,�~q����%��n7�,��)�6�v��� d��F330601000100080862maraton/.git/objects/0a/51995bcb9b12d7e337d821a3d0cae423d0de77x�U�j�@���WL	�V�M�˂@�Z(}*� V�:YGY	�:���-$y����Μ9ss^�9�>�>�;1���NL�|��m
r�����m:
*���h�nݘ����?�Hȃ3�
��ծQ���5HyRꝱ~^�ɾ����V˥�-I��)�h��Yﲊ���h�2����yH<���oZ���M	�<�@�����G/��╬�c ��3x F�U[u�h�:�Uq�3��)�B��QJI�=�c˷�J1dd$��2�#'ph1�x��^;�:��*
X#�l�i�.j[j�SK��ۈ�o�\_����~���� �f�2���J��4$RS�B��q7�A�G�xށ`\S��%��xN��)���,^Ao�?��Db<ӆ��+��[KǕ�uV�5�J1C���+��Ö㖒���r�h����pz
�@���gi��T���8�NG��,��c#?�ե���%��iDnuH���u1XOL_n[�HQ����nJ1���o���:�	M|�!��f������Sס<��OS�E&>����V��l�<i.9�}E}�>��!�u]��Ҿ��ൃy%�v�.����x"�A'��\cH���T"�4s a"w�r�`Eљ��7KX�>���?����t��\pg4	+j�n{���g��ü�ǞCy��0UO�wmm=m���9�σ�G�|��s��B>PH��塕��Ľ��7�P�����/y7�c0��0)ɶ�x="}�\,�ßzX�V-3�%4��UƓ�Fh�$	�I�����9�����H168931000100023maraton/.git/objects/4a330601000100013262maraton/.git/objects/4a/d55e28f900d612c1fbc9a32844c8a6d18c0ff9xU��
!E{u�b������_\Wk`wGAY��\���{�=�<]Λ-����o%'og��s�G��ǿJ��n���^��y���3Ζx�GX@�XE7�5��B9bc�Ӥ�C��*�\�q�_��T4�168931000100023maraton/.git/objects/81330601000100010262maraton/.git/objects/81/8ee0a5958a33a7d0873f010837d39fdc4cf493xU�;
�0EQ��*l�c���H&�O%��tb�8�n.l���@�b]�i�r$�W�,��p�)�U�T��.c	k=# KFoX��P�r��c�x]U%�168931000100023maraton/.git/objects/f6330601000100030962maraton/.git/objects/f6/d898dfb67897fd06870e35a6f06e0b0d41389dxeQAn�0��~�F�`H��}C�!�8bej,۴<���D�r�2;3���i������>Fp[�g��B�/�*Kh���A��y��c���No���\��9��?#NL�fN1G ���1ZT	�4-�����3x�4ӂ��Ͱ.�_��i;dF%�藕�f��lLQ%���{VR���e^k4�Lqa7'�A���xK7���]�{�������&����t����L7���WRd�=`��jyCd!���-1Sepҙ0~�lUp�=�� KM�T��=���F^�z{����,���168931000100023maraton/.git/objects/4c330601000100053562maraton/.git/objects/4c/49b8f26b754610cafa4532e9481b71653c27c8x�S�n�0�U�
���M�������>(�R�%C��u��}�d�	l�@��Ck�eOϟ>��ڡV筒��9�|�桹Yԯ���Zv���R@������X�+�������/O��4�?�'p?t�[�jeF��P[���7
����DL;x4��7f�%H��j{���`�l+���U�{�:�{;�z�BrN��,\T�w;>������/��+��O~=���:����j�L�Lo�D�DX:��Wv����)7�ZN����95�E��Rm	۩����AZU�G�G�UjXBF�&<D.���yXwߥSpW������PˢP�n'*��`5OB2ؓ���l���+p�2�wE����a��u����ĵY�9w!TK
/��5x�Y	�q��e�m<f��3����ɷ)��I�L�}P_�*٥��S��cX��l?���&LKP�њ�@�2��lF�ݍ~��ζ�ՠ���dnL$k�;{�S�4^�	8����t��~���j^�?�V168931000100023maraton/.git/objects/4233060100010001862maraton/.git/objects/42/5151f3a411f5e088d7753e7c8d016303b1b9d1xK��OR0f01� �a168931000100023maraton/.git/objects/04330601000100025662maraton/.git/objects/04/e7634e2d691b0cc31efa18667866c3bc812eebxE��j�0E����)���[��o&��e�eDc�؇.�{g�mAbf�=7��a��~�>��fX۠iZ��h���`]��эa�tM�%�5 ń��X�P��ɳ���:k}J�ʹ�t��+ģ�RסA���w��3�c+<��e�E�n���2\�6B�J|��~��ȀTDo��^��WR	�<s�uX�[�g��֟�^���=��d�6^6I�O�|���ɯp0����Ư%9I�,ib;췜CZ�/�� �k�330601000100034462maraton/.git/objects/04/28e1298d3d3b855a2b500c83c2d71e5b5afc0bx�QMO�0��
3.�:P{A��C����6�6�#��FHL���)lpC�R۵�{~i��s�r'��!�B7��4�n�iޡ{:�-y��&��6��N�6@�%H�:7 N�c������d������&-��xl�&)ȳ�Z���
rNH�x��y��%1��#&�}0)��Kh��M�^p¸��Jp���ਕr�Җ=C�C���5bE���,��߸��L�<��4&��a\�M�7X5?ۯ^W��p�#��2�[Ю��wJ�E�Q�vaV*�u�R����Ao��m���_��*y۷g�^�s�7R�+t�3�p_-/��}�P@�`BD3�2�@��\����Uîh3306010001000159362maraton/.git/objects/04/b8a53b4f254ed314037c3b378f378cb5a3db47x��{XLy�Yj[!ŦȤ&QF�LM����IB�ʒ4sf��4�v�9�L��i�(�P��6岹�r뉊.rW.�>ʨ�N��yv���u>�=���}��D	�vnT�'�F�N���hn4O� ��c[�9P�v?ZT�uћ�fM�M硦UW���O_�/��������g�,e��]Ħ�a��곂���Gi.f'd�ו�����4*Z����5z]���W���1̘U*�J P���o��̝x���?UcJ�k�u��"	;99&'C�K��[��T�l�Lő2��a� +��N?O��k�x �ԙ�� R}���0�n����?]�w�[Sxs�n\)��F*� �����]1�"*?&!ktgU��U?��(��*��4�����Y����V�rݏ8��N��ru�3��\���JzL��a�%b��f�Ѽ�'5'g&.N���N]�b�O&̊�,��*��*mN{мήi_osPI� ��W��T?���ҝ��:qQ�n� ��V��V�L��~�u�o�V��gK��ԅ�ko^��m/{e����U����{�����<W�R�_�lm#��T*#�\~���	AN�A׎��MrV�@�(k�A>�C"�
�'	�gL�Υ������6�+7��y�qb�e/�Y[Re�J� �f�-�	��ZҜf5�c�'#,�l��B��9m1.�������݇<s�6�;������hH4�J����Ʉ}у%�T@��*'�>"^r����+������<��?�h���O���|�/��ݞ�٬gN��Q%/�g��B�ŵ�lIO"��E
�ڣ�89vT-�w����B�mS_�$�C*�p{�Q��pU�60~�>)���?;V ǐB�P���-�YC���_x��@�ȸ]��%��c8�"@�շZ-+̝����m�mt�íƿ��uu�J�6����3��T��7
�t�J9���q��b���]e�6��6|I�"7�6Z�h��.��b��k�)%��$ZqŻD˕מ��)|rĦ��T��N)��2��;L�=�*��̺�)|N9������G������3�[�ך����ކ)CJ�?H-M�7zo�d�����M ��!�P�G����	6]��[
�K+%�f�MH==<���#e��X�����D+A��}��F���k۝?<��3Μ�ι�H�3b%G!� �ȁ�߷Y��bX�����2�9����W�j�p4rjw�Ĝ�B^2"���ve�~8��bHCR�8���fˬ��}disr0�R𤠌#����J&2���=��HԼ^n]G�1�`D̗�J�c8��69�.�_�4鰾u}���V��D|�`r��D���\`��v�}�����
ƪ"| 6Ѱo�
����kw��7�+�]"��t�5]zm@E��(ݍX>A$~�#�L�
� � ������v	#J�эGػmYA�
�2b@��;֤�}��~���f��k�Fx�T,�{T �� �3X�>���6��y��*Q��}1�@��+W��ս�PĤ0K2w�'���\���/�==168931000100023maraton/.git/objects/6833060100010005962maraton/.git/objects/68/58f2fc572520cd74fc5f39957c5813afda76c6xK��OR01e0U0��2P0�2R0�2rL����3srR��Kt���R+ҋ2� ?�330601000100055662maraton/.git/objects/68/859247b4564308a981a8d9fbdc154c513f5cb1x�T���0��l�IT6, ����
!8��d�ZJ�h����;3n���8Ċ罙���dٺ%ܼy���znl�nk���q��[�Z�����_����:��1V�j�L�DƆ���ϐ�n*!fA�K��T�smZL!�HI�kf��d\�p���"1I:)դ�6K������)S���^X��l��2�u�cb[�0]�x瘌�����Z���$�Vf��Q�h����y&C��{���zR�(�na���#���L�	������+�s ��>ж
[��i^bτԺ��/�wHgz3���KՖ�.x*�6��^t��@�.�{�����4��1Q����py	'��vQ^]_�c�D|a�$9� JpZ�3g�f3(�Z$��-[�h�#�N��Y�Zk��\cY��O{`���⌲G��w+/�m,��iUM� �y��K�����D��Bsu��� �PN)U�����`=��P�#7����S�D�	/|T�3v����[�w�t���G�0�q���?���F���xܐՉ?���J�	�l�����аl168931000100023maraton/.git/objects/12330601000100025262maraton/.git/objects/12/b8ea9dbc1a3a5a33582aeedf4ba555fca7b99dxu��N�0���Oa�ec0� �5͋ i�u��dJ�Jhڻ�`\�D����wc��e�z�@��s�5����� ���;��/���i27�O��nhf�?��)����:���(0N��z�pAP�I��R�����4��Zu(��`L�@cZN��A�i����Z��}w��[�2WQ�.�^Xx�@]e�·��]H\�ߖ�.��%�X�>���
���ř�~$�9�^��5��246MK
P���-p�O�#}�168931000100023maraton/.git/objects/83330601000100049362maraton/.git/objects/83/daa42707d9aea831493a149143568ecdc351c3x+)JMU055g040031QHJ+�K.(`�m{}Ƒ?��o��9�i.R�v+�*I��-�O��K� ���AtB�ɲ���$O�ϒ�2W��LI+�/JM++x�zci;�ü▨��˥��.B�e���0L|��b������u!zY���
��J��s��̽���z^�;�Ü"����6���Tfnj��4��u��������q���=n��6b؜]��<y���I�M�Rʧ睁�RP����?T~��$��
��v{�=�!��(�W�&�0�T�oT;�K��θ��a�'�/���&&g�'���Ƨ�%���L�̵Ю}��Q�	ы�f~vk^Ӑ__�XT�����V��[&��R�*��Ζ��.~U[��X�Z�WP�й!���5�.�ᩘ����ڙ������-��j�)�(��w�����Y�s.LM��^IE	�Z������\��7D�����Q�W�#�����%�8�)�Kh:ȵ�_, buܕ168931000100023maraton/.git/objects/d23306010001000344962maraton/.git/objects/d2/22990e9fed88ea6311965cd931ae5a74d443a7x�Y}pT���X5.F�k�Z�
��C�b�l�G�!f~Py����-nv�ݷ�(��ifR�8�h)��֩3e��eZ[� �:�ũ��i:�4�T�:mp����nX���?���99�wϹ��w��{�+���
��a�u����8�KM�=u��B)�~q��K�b1M���ȏ�2��A.P'p�N��t0�24[&���\*���Oʧ�BL�u{H��i�%��r'��瀾���� �8/�A2���ؤ&`����kƂ�r{H�BFR�; ��B�^t@^<?7Ʋ2>ߍ�D׍�؊d"��dӁi�})onۀ��9h��� ����Ͻ_ط���_?6k�޺���A�e ڠ��.����.�}r���/�s�sg/���j���F4_P\�l�y�ו`�Q?*K '�Uf�ڒ��Er?��K�0�gK�_����=��s�Bq5�/��?s��]��7���
-�	�	��
8��E֌Eo���R�zOo:�g�H��u�߾U��$�f<Ә�d���[:��x�n�\טL�❑�d\�f��6��)�{���dVk_�N�u�S�dK4lVWG�HF73���m�jZ�j�"�DTOg�L<��ҩwu-��-sU"�ա�kI%̦jm�L퍪=��j	k��h"e�r>	�"j��e=|K��\6�W��=b����N=�E�Xhnmih�k��Zu�V��K��e�S��Iε"矣�_����
�|������ݖ]���t���~r�'�j?��ǚ;�&[>�s?r���p���N �M��xQT���'�a[L���'ǈ��x�T�cF��i���x���{��S�Ba�Y6��=���ϗ�Mn�,,��?[K9�Փ�ZXʙ���0gd�N�0gf�'�oa����0gjT�Z�36�;,̙���,L�t�[����C�ϟ8���a�p���{ܞ;6����L>�g�G���W��7���:��2k��4
w��0�n�t�AAa<��Ƈc�#�u� [,�C�8�^;��%��_|b.����Ms����.{�){���+��ʎ/$��'sWXz����2�90D��o�7�f����F�
e�9���e�d�FZ+�x�� ��#z9��[���OL�6Α���m|�sX?4�yj�[J���S���A�ڥ�M�6�O�M�p�d�ڸ��sG�cE�x�6��a��p� M��䘎�!�m	9�v�<X��=�l�N���y�o;��qЄ��Ϩ�ab�bp��v�q�A8�v�h.'j�����s�,M֞��C��}�>��ݠ�p�:l탑�ٻ7m�w$25&W+?�q�jw�
B�ϟ.7|߅��ʖ�¶�h�=�[/,����c�-��0Sn����;7�'�c�W�@�.NV�G~����m�6���ߗ9��s�#siua�e>l���`V.'m(<�c��:`���s���oڬ�;���!�����v��s�}��n�̱ȵ��͊�҉��0�~�1�����j�|�� ��;�u�±��XT�v�A�m�A/��P��׳�[~���Lw��m���k*?�1�A7`�$���r�h��9sB��ʙ�|����>�3����8ah,t$�z#Ơ�� n�p�z���=�:�r�g�< 9�y���|-�^���iy�[��+���v����6�?�l�V5y����u^��"4����x�CG����^��C��l9i�b�聋�����#B84
���ZU�X��*�REb�༏.g�+�G�~e���O�w"E}�ħ��/E����ߕ ~S��|փ�}��wM��r{X? �{�|���δ�v|V��{|-0��u��Yuڈg�m�=	z�2�H�576~�_��+�2s��u����9U?T�2�TW/�M�zepe�շ�3?�6�u�wv���aϴ���������X~���B��%f[�~c�eyR�Wb\P�w��jr�%��a�l?����i�]��Lc���!w	\NP����]�͆���ڸ�Nc���o�.k��~�XF�%��J��K rA�m@ʹ�P���\֎��zsw����	Xm����������5�����Yr"#�s�^���Q�lE����08�p�x �g�����y���ǷY���}�o�3�P�������y�SO�G�)v=���|?��%�������.�A���X=OoX͟�X���[^���LC��`L�\� �*�ϔ���y��ə��{�������V	>	��ɓ�\�A`�� ao�8S����@v!>�%J�_(j g�O��,��g��s;��ȟ�����x؇�@��^�*0oN����0���������*�.0�J�0�Ìi�'^1�){e�ʞ����W�W�Y��Fa�S?P"o�]J��<e�	���-O��x���|�=���>�f̬���D�����Com	w"�u>y���z��+���XZ�A�7��cf:��#�~M��%�f<��o����D*�G2��6=�23�Dw&��c���m�R�th��V�T�	D����T�*]O��XW�3�d"�ŖD$�x �H*��a����	䳚[�7�Z�%ץ���S����t����<��������6uL�^�fMXC~-�Ъ���e"���J
���к���Z}���3_*ۗ(i.ʨ�$И6��k�l��+��Hv����V"�$Ȥ_��%ٻ�g��tb�����0oHՙӡz,bFd�ؿje�'n�}Q�4r��]�"�%DvU-�J���F�eӺ����LM�w�����+����ĳ�fma�-1T��-���9�;q>��Ҧ"���kF��͌䆪%R�8��@*m����f��F=�\�+������!�m)ؓ��H��x&�s�!�ēԗ���)���zҀH��?6t�֜q�>�F&�]噖=T}Kj%қ�bi���B�*"��K/�|a���1?3x��ߏ ��B˵ FtԳ~����*�F�T��cI�[*-����� ?��iƘ/B�m2���^R8#A���~z�0�MV��#�o����:����nF������?�Ը�t�q?�a赣�q��qY31�e� ��A٣? y�@�y�!�G�z�Wz�vr����{U���(H�1F���U��>Rz��ǡg}�lEU�H�1��j�P��˳ e��JJFƖx�/߱���8U�ScQS=cHڣc;�Nx+�(���A�1fOBo1���&��3���3��K�yC�cF7�������P�0�cl��'z' �Q�1&/=c��Y�8�'A��
S3��<�+ҳb\,�r��B�G e���r����S�c;���z�xP��9������w�]'����m��%\F.��.�JεU%	{��[�AC�π&�l�{׫}E���a,��168931000100023maraton/.git/objects/5c3306010001000170562maraton/.git/objects/5c/f07893162118cc438e20be6082c1510ab9fe5dx���	�0DA�V������`�7�x0����Y��y=Ǽ�9<	t�;��Ts �I% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,,��� 6U���T��결��J �T]X`S	 ����l*`SuYX`�M% l�.,���M�ea�6� ���,��n�[1168931000100023maraton/.git/objects/f13306010001000318462maraton/.git/objects/f1/89d8c46188a5c86a5f43bf4a16036c95cc7471x�Y}l����I��$���lC�:olC�|�H��I�Ĥ_$��om_9�Yw{�P"��`p�V��T���?R�"�*���Q*��
ZZŦA�@��_ov�yw}W*����X{o��}̛ٙ�y�x�O��pM����{WI  �ō���riU��KT�U�����(.e�K%��[�S�k�
�.��R� ~z��c������W:�Bh ;���*ɂj���~�IEَX��Svsʎ�
�)���FO����QaJ�Tz޶�T������L��˰�8��R������K��������5_�-������і���k�tRo��&���{�-�%Gż���s*�Z�Ty����c=���o������{�!d4����OpK�  m),��-���7�{��ǁkx��ƣP��������ޅ��X���_:l��ųJlGj4)��,����6k4f���Fc)1b�Rɔ�'Ӗ�S��= �#V�ش���#�-a���s ���cwKNʹI��p$�fW��`,m[��=��d����I{p8�Pڦ0o��ܯ���t�J;��www���Mz��]v���)E���K�'��̆�r���c��?x|�TeZ�����W}���T�&=��(�D^u���nڅ����G��2��+��.\mmR�����ש�� ��i.��3�:�{�\���H��cG�V��D�o�p��;���
�Di�rM���KrS���+�J���B�۲��[Q#~�D��9�-+��W1;%��˳�%�<uu���? ��8�#ɿK<����$�^��䏃�/K�{]�s�����[s=����A[�D�jIv>�Hrku�|T���$;cL����:od�6��C��E�ʝn/?������R/�����`������?�4�sƙ�����ƹ{��S�*g����������|��� ���v�qb�p3U�򌁟Cϖ�|�4�H)��IdV���7��R�ϒ��ԡ�VH�n��׌챙�~�8�9o��^md�EǢ�'��3��ɪ�h��aY�V�M��ư}	JƎg-�������9`sF����h��W��,�rl^d�|�,G�=v��f��8�0�������B7.��{�3O]����y�H�� � Չ�/S�T����z�yY?\n93�V�Q��>��·�1W�\����D=�]ُ���to��0�|�y�_�z�{���G~���w��w�Cn����ـ��O�wi�|�P�����yvrq�|��#��U��O$��R�uږ�
���hÏ%5l�V��L���]������ Bz ��y�R�[A�1ο�-�y�1��_����y�J���"0Z����b2P^C8���+IA���Bl������ˍ�n�fWh���+�7m���Wo�D0�w���
T![�wq',��������"r|����-�:
�����"�-T�PI[h݃�ΐ6��-T�@�j�������	��B-�PC8T�Ҡ��P���-������F�3|��i�´�a�T�S��f��]��'q�kb������}!�$��*�0R�[�Pլ8�&1�_tĂ��tN���!����C�x-<�4x���T�TÌ���8�9Gy�S�}l�?@�*����){lW���S�G���P|>n���E8���_��"E?�h���=�耢�Ϸ��ۯ��:��X$�5�W���-WF���ƭ�554^۰���m�� f-��u��&q~�Ń��	����|t��GK��Ћ���/�^�x����ŗ�g^|E~>z��u��+�/� (�Ĉ�=�8��<��ԁW^�^�F4�Bt	�bU�>��O�x����|���_#x���kqb�ܐ��E�)�_,8rV����z�S_�w����-��������F�h ��?~�?K0��|�<>��u���m:7����y9 ��y��3�x*��	�������U��?�~j�o�ੜ�ShHV��K$@<���g�������#��炬,��U�@��|�x-�_S󖷉��k��E������x�X��/a������K|麻����E���N������y���q�K�5�E_��d��}�E�����gM��n��Va`i�O����Z��<�[�OI?����/��?��ߪ�7)���ߺ�9�E�\[d�E�)�/ԯ�����㹿��ߔom�r1�Z�r��Œ�����O�i;30���F����fwׁ^���f�=l�>.Abf4i�?7����f$3*���#q˶�z�k�
+�-]̌�R��������"Ö����3�i{T�T�v+��:b)���=�f�����u�iT�_����-�D^�]��i��7�c�0ww�kw��v�:��k��ۺ;�y�؟��N��KE+�#������	G�U��{N/��"�/�F��K��W"�^i��t��$�t�ٵ�X���f��[���=�Ⴟ�tZ�#�S��Y�Q��S���j97�^�4q!˯�nj^�z/y���`/&���a;�j�:�5�%[��'����ۺ��Ƞ��/�? bQ�7I	=z4�S��&c,��0&d)+!U��B����&���(~i1@))'�n��?��Sg8\�f?��Ld8֏�6�B3O�:V�0V/���ҹ[(�N��2S�ϔX�r��x�H��|�f�A�.��3ֈ�۞��L7���~��#G����Δ�U���3��^T�H���U���م���4N|<��� 0��؞�T�/B�.��]����9?`z�R��Y��m�SN�<�L5e�_���}4�l��S�k�}��Q�m�!��LU8�Ә��Fc��	טr�Y(Vwɂq�s��ṱ�:����|��1�xٍ���Ϟ�&��wn���Qq���S�O`}�S�����6���~�����|˴�S�鲙���9�cz	]�?~/@F�7��>�������3}��.{�����AE晾�B��9��{ǛA��.�s�����V������<8	[w���NQ�P��e{��C�|�U��-�
�1���sУ��{a;P!�����#E�56T4��)����>�t��)�=G��N��5�/_x���oZ_�c���R��|ι]�]U������I����"�X168931000100023maraton/.git/objects/76330601000100015762maraton/.git/objects/76/55fe47c2557d5d98aa4b9b94ee01e8dbf4642cx��A
1E]���C۴���x�$͠0Z�Tϯ�\�o�������q7��$�(i�9YŐ<E�r�SɌURq/����l�Y�ea,��#�	)�#VC������:��ܡ��N�.My�,U��*���r�	3��'�n7��p�
�=�}i�I�168931000100023maraton/.git/objects/df3306010001000175662maraton/.git/objects/df/02b8f7005ccdea61aeb532485df6248fc1bdeex��yT��y
E�"`Y���B!"PA��"*�XI&�$����d�E��(.�B8R����U�"��Hy�H�
UQ�G)B�dFk�9/������ߝ��N0)-�����4�r��t�R9��5�E_�������,<�Y��D^t_2^�N��yg���K���n��
���B�1�[[4�=C���E��w������	ݷ]7��=v�eN)'�Xd�h�M0ʐ�\so�G����1g����0����jK�LO��#��_>�?�F����ׇRE\�����{zɪ�Ƽ�ܯҴ��ȗ�X
R%2`Z԰·���"��UV�}�"��r��7�"T��zW���G�E)�)۞���˕Br\�M��d�^r���/d��\��8��BT�	�Fc�C�a���جډ�܏H$U�T=)c3@Q�����tVx��!��|��AB�n�]	�/�n�+^+r]�T���/H%�P�$�!����ڎ�)��eN�m�L}������n��Ƣ�E��BC��nMz��m��k���?z�}��Ki>=��r4%�VB(9X�Ǳے=u�釀�蜰I�Pױ��	̡P ��d+d"D�w.�>�[��c�$B� Q1%8o��D��;s}�w��y�'-(檈�=x�ߘ
�$=�}�d�K-��?֘������)۞<�����.�w�5�$b\98����(y���Т�����v��	a9$U���<�mW�v�s�cO�rOn-� >_��II���vr
)Q/�~2I�����ɢA}&X}��}�{�U��#W���Ja.H�Vܔ9�]ޟc������p��Mǅx��Ym�hw�1���_�ySV%%����pN���r@��y� �ypF��D���D�=����^�λ��1?��ig�[�V�W_���@f�<�u?�n�a�W��M���g��d�Z��������j� uA+4�䑒e?�S���ň���.4��_V_��1m�dц�Ίr�m� S�B��z��������\�\�w����$�%�@�����r�mCנU���O���<�Ⱥ_�;�&-%����*��}�s���b�K�'Sx�6� ��������;�M�S�#�DP��D\r�l�mUO؁D�/[�=�R�����+n�#�jk�os��*�`�tl�ʇ��,��0~����՚�=1)����	r��QBz~���?[o_��u�{�ٻIeS��n�ҧ�?igig,�j��QU�4Ix<�F�Ӽ�����ZS7T�	���v3!���339��F��&�#��;"]V����`��������^8�ӕ �5���8�R����$*ñ��bo���|<'�cS�'~,��$�D���d��h�z��@���xʧ��j{��O�#�At�"��-��[X�f���8��ą�R�1�0��6"�i�cL����)V�H�1�P� )�ԏ�ׇ���KM�u�;�7V�U�uym(���\+����ךz愺i��M�c��U1�,���5�6.�9u��W� �����ǖ|�>ɺ��Xh���X�v���D��M>7�+�Vt�'��:���wF.C�X"��HЙ�=��T?�ɀ�6��������U�zwTb�����kt���Ϳ�0a�S�^J��?U$�*���L6s�Km-�L^�m��L�M��QH��wF�k<;H,?^x������ͩ� ���r330601000100019562maraton/.git/objects/df/0c909603c4489d40bf07d0eb02ee1ca4d0e20ax���j�0�{��b�+Hz(�~E���.��w��!�B/����7��������?��NdÒK"7��ź`7S�u���Է5��`�9��|�T���]��`ӪM���G/w%��k�7o�%�b{T�ʚ�z��Լ�Ȓ0�
N(Ꭾbp5B�d�T��V3�E&�&���|�|5b'qv��QW�168931000100023maraton/.git/objects/85330601000100046562maraton/.git/objects/85/c21e66bcfee70703a8fd9f89078572fc2a0896x+)JMU052b040031QH��-�O��K��K.(`��AtB�ɲ���$O�ϒ�2W��LI+�/JM++x�zci;�ü▨��˥��.B�e���0L|��b������u!zY���
��J��s��̽���z^�;�Ü"����6���Tfnj��4��u��������q���=n��6b؜]��<y���I�M�Rʧ睁�RP����?T~��$��
��v{�=�!��(�W�&�0�T�oT;�K��θ��a�'�/���&&g�'���Ƨ�%���L�̵Ю}��Q�	ы�f~vk^Ӑ__�XT�����V��[&��R�*��Ζ��.~U[��X�Z�WP�й!���5�.�ᩘ����ڙ������-��j�)�(��w�����Y�s.LM��^IE	�Z������\��7D�����Q�W�#�����%�8�)�Kh:ȵ�_, V�E330601000100015662maraton/.git/objects/85/7a0a0271a67fb66331c037d9196d8f3924d4d8x��A� E]s
.`3���2����P�����O�潟۶-C��E4D��!�l	�!9�L���re6T����]���h���H�[,;�@��$v�Y�ǳu���{�����ĵe^k���H�G�)�!$������!���ˮ�EII:168931000100023maraton/.git/objects/bf330601000100026462maraton/.git/objects/bf/66f03e5181c61f905efb0078bd9253e0976763x+)JMU0�4d040031QH�֎/I�-�I,Ie�\��/�P�,��/�}��0[�.-1�$>S/����+��xv����j͍�W�:�
������>τi�G<�:�g���̒��`�2���j���7��HFs}��dݙ-�a���&3�����)0����:�����2&3o�y����T!(ͻb2��g�ewo���/�����|��83�,lI~���1��q��hy��m;���U�槁U��a\�q}�s�#��}��2I	 ,s�168931000100023maraton/.git/objects/70330601000100060462maraton/.git/objects/70/eb4155d8a5870b409e73845a66dda71a8756d1x�Sێ�0�+��Q*U$�����
�7�E�1N��جmR���{g�\V�T	c����������|��A|4Nٱե�1-�
���Z�W�{S0nW]cZ%nC��N�iw>��'p1F '{�4�!k4�i�z��b	����VP��~	�%�淞�t��q�ɧH�VG�SXZ������EQ����NCVpJ��V��CN�
:����so 2�wK���[����)�
�_��K� ��F�����.��{~\�kW:z?<́ο����՝)?��d����Ԫ۔�fTqv�5h�ZX�,
!��ૅ��13�KVA�(�Cb��~��3`q\,p������k-C�Q�g��A'FA� '.��bQd":��1��?z��*��: �=����C�����+��w3H�<hH{N+��`jܟ~ka��c&�E֟9!b���n�d3%�q8���fs�B���'�岹�x!����?. �Q��V���n��Fn2�;Ҥ�Ė,�L�6�q��]<���Z*Ȗ��� ղ������N��n����+���Ƹ��H��vN�F��Ee
�) �oj���^FjR�K�'��p��o���
��[168931000100023maraton/.git/objects/60330601000100033462maraton/.git/objects/60/d977c489b413f3d876b88fca394a3e908ed86dxu�Qk�0��j~řP0tC�	���Cp*j����ޤF�V}��s��r�c����>�0��)���4ER���\
*�'zsQuja(��2jeTC�9՝k��T�+,u�P�i�� ���$�%���+�!{^u�����:An�_��0ЬX�v� Y�����8֌4���V�=�ˤ�NR(�/D�
�4��ѹ+H��5w_�<'��}�)���
�K8	GN�1�g���p�KbP6O��F)rW
�ͻ�A��7���x�w���m(Q��s���;J�8N�㢡+�yIwZS7u������g��V'YB���W��Ȫ���:A�A33060100010005462maraton/.git/objects/60/eff944dfb0fd37e439bb4fa10e5b61e697f3dbx+)JMU06g040031Qrut�u��Max��C�~���/8^\�$���� A�168931000100023maraton/.git/objects/5e33060100010008062maraton/.git/objects/5e/0661657aa796a5a303f8274de87edbc905ac6dx+)JMU0�d040031Q((�+�d�vc��m�����.�����h1��83�,�F�l�.�u5/,�:��Ν{��Z
 8�168931000100023maraton/.git/objects/9d330601000100025962maraton/.git/objects/9d/db2ff07b9e58ee20c309142d61b7cd83fbdc44x���j�0�w?�`0�.����/RBIc-S���?���';�Ơ�F��8�$G{���׻{2�6d}p�i	����֊ǰ.?"FdADOf �i�S�#���,ϖ��S�O��=�*f��a�2]s���Հ�bJ�L���^gmHV���#SV �\Ct��y�}�����Y���0�^��&o֕i:�x5I�w���ٲ����w�^�X���Ɯ���O�$s�=EOF�(�,e6,����v������"(����\168931000100023maraton/.git/objects/1e330601000100031662maraton/.git/objects/1e/22c455e077a6f59abae319c58abb4ab4567fd8xeP�N�0�jŪ)UZ( 84N8pn(��1d�ā����άyUEr�����7m�����#}�δSeS�G?ز��}��i�u����sv��(=��#Wvv|+�%��Z��ԕ�9�VR�D+�.�=�����{�ł�ԅ{����6*��	��(�V	q
��9m�S8�X�\$ ʂ�
��Gͭ��.��a1���q,#��.����Ȋ\�%2'Y�����ML�k2�<���;P�g��0L���b7����ol�O>MgO��4KC�� @w�R��P���RXW���i5X?�C�>H.�l168931000100023maraton/.git/objects/71330601000100016162maraton/.git/objects/71/67f9c50d785af070c66f0a842ea6f16b8af5d2xM�;�0EQZ�*F�!�S��F�c�H��S b��)��}�F���;س��x�R�dW���2�-x�y��e
��܎PR�Q�J�ia�~�� X2����#|@I<	yl�P��Wc���xs��\(Y��o
�C�^��W��iM��H�D�S}|~jEE�33060100010004162maraton/.git/objects/71/080875f7088d8b62954fc1c8ea513d57cf5dbcxK��OR0�`0U0U0��2P0b#.#.c.c � �^�330601000100019662maraton/.git/objects/71/f0fc7a4ec2ff296794321dbb1c676eecbf5f66xm��j1�{]=� �]%����������UZ�]9��B޽�J�E�of�p����b�S�r*5���?S��uK~)֔@+�����G�RG� ���,��w|V�Rq�,��p��Z�Jz�w�� t���_$�m�����O��"�s����|�0(9_ۗ���K:�j��Z�qZ�g�-nh����}Ko168931000100023maraton/.git/objects/a5330601000100046162maraton/.git/objects/a5/4b04d6842aee6aebe925ae9e314064cb947e5ex}S���0��|�T=,,�*�j�z굪"�8����5f[)ʿ��mȦ�F(�3o�=�ގ=}����㔝�1������{�*��#q��I�9�<�HN���,��)v��t�ƕ�B$�hGӠ��F��Q��0�P�u�"�v��م��� ���6�������]�mb9��P�S��GK1x=��]��W:����g� ���.s0d�Tjj[��~W��B$y���i��R=�����X��k��|am'MW��a�e�:�^�8�g�lK��y��	a�s�.���XM%Yf�t%?�/�h��<!��g���S�,YTt�8L5%T'OPK���T��+��	;Ĥg������T����LVb����F�Yo^G���I�����
���ء���n�d�����,Rhc�^?�G����	����ra�C���ᡅ���0{w�R�I5��168931000100023maraton/.git/objects/9933060100010001100062maraton/.git/objects/99/d3b2ebcad03cfa054841ed0b937224b851ba79x�}{�TՕ�~ bӴ
�@bIPA��7��v�]Zv�AEW��Jw56|�h����8Dј\���55|^��1��24>����)bCb���{��sN�)����<|�:g���^{���~�G-mj]�-...*7���ޜ��rd7tU7Hc*�P��O *�r�B��5�4�:[�4�BP�q�E��L�,��gh��b>��!A�����$Mh@K:��e]���)�#�Ԥ鄦r;��.'0O�1��Q�证�NX�������i��L���p8J�o��y�G3����첂�(ֹ�)�������ĦpKg�Į�e%���E��$�xo�=W�DbH?/�H�����P`T�����6�D�#?y�g��_>=���N���B�KRp�>��+]��J�g.�C.��]�y�v�S���V �N$���B6j�K�ς+U{w�����颏���Ǐ��*3Lsysk��	�GL�0g�4焖�;"����@GG��0kf��P;�fU5���K�B����`v}�<��a.t�JjZ�B�J����l�w���U���\l�#ZcW�\��Z��@�qcB-A�^P)�d����wAr�45�6�hruU��-w5����*Ƽ&�	��
K�Z��li�����Yfgˊ��;I]%וwxg]}�I�m�f����F���
sn�]a�aN���9Dl�b}jp �
GX�ea2�j��$>�Ls �b�RUe����L�2���K����+�ט���=>XJ�������n2�#2��U�����0Y��#�[�ؑ~]wͪ�(�������;G�/$9���Lp�����g�İ�e�2�q!�g��u��#P-��-���C�}j�c+�����O9�y��U�U�/ׯޤ��Vm�f��y(P�C��U�Ă��Ĝ�^�NY���s�Rc�Of�؂�x҅hrx-x��6ւ����u|+���v$�L>�<�DQ�,�!�8߂��c�o͗+,�K���}r��'{Q�������?���7po����>���^���\Y�3�^A�cG�q\���=t}P]��5�ı^u}]S({N]/�k2����z]�I�mR�s�Lyl���A��cm�z:]�I�-Q�7�5�α:u]D�2�*��OK�ƲM�VG��5���������k�ݘ}�rXa���]���-F��C��&�4�7f��w��/��ܕ�`���Gf�pQ��e��^�Ҳ�!W�W���nb�X� �N�w�鏞���������yd8�yXX���;孛��y��{�;%8�y�ϴ����1?�[�?{	�?$�s[������bpj�Q �1�Hd��E�~t���Gמ�v����o�G��Y����Ht���������B\����֣lyt��F����4�S���w����;�o<DT*ۊ0�O�;�����F�v �cD}�_�oz?��Gz�pOVF������m�P�P($u��Z������W0o ~O��G�
b7��!R�鿢d��������j��N�Y{U��M�	��/+��w��zN����u�ʹ�d�r{����=C�5ݻ&1�!�_H�n��/G�=gI�a�^���@�G�A��R/(�o������x����e ���D����um�����j������Gr�?��?�gb�_3�c��RЩ��Dͱ-�I}���4�^)0_�{�t�X:H)<�d�X.�<1I�u��h�x�O�V:R�9�Va��R����o�\X�H[�2�.j_�������h�)D�);f_r���Q�����Mָ�Rd)7�+�*���c��8�b����<������ D��r?]�>���B;�sp��(@9��)գ>�G�]s_�Gg���=k}�}�52X��g��>���e_���\~W�|�+U��Ua� �����/��T�{_��$�Br������2t
���;l<���K�U���B	7�K��v�ϰ���c����G`&hKf���T=��S��L�2���A�4T�i�П�I��X��%��y�s᠃~O��s���{^e{h/z�;I��~�D��/L���Tw$���9��*L�d-W�)������z7��3���O!A�o���U�������b��r�)�o7(N���L���/��?O�.����7QN�\�)�L�IY� 5&�E�p���8���:Ԃ�K�<��EF(����hL����:q8ނ�������bP���uA	�QG_l��X��q}��&;!�����Į!鮺��2P'��j���l���C�M�%�����
�t�G�
5��TC�R�/�E���=�g���
ā�;Z>n���g����w�����,�̄�D������?֞��B��X��n���j�+��/6FQ8����D��Q G����Q��'��/O��2�Te9��$�4Q}D1]g�q�ޚ��z+�Lpc�3TSJ�MQu�P�?"�O��l�p����Zo�V��L)|�b!��R$�	*�z4���f���@��d�b]�V/���@E׫���[e=Փ`	m����(�&�	k��T�Ć��*l��!��PK1@�d������5�:1J�!���n �^Q��X�q�#��K��4���(3�N����T���2�^M"y ~b}�Kw/��b������Z��TD�Zﳨ*-����S/i��~7N��kO�X6����T�lS}�ڮɒ��(wOX���Qm�#�ơ��˳��k���kO�˵DJ�Nqn��$U��)wP���j:9��aQ;(�a�p�����}�N<��(2|͓�+����NQ���g�w{-�]e>T�T@z�x�yJŪv_�#�(�L[�6�D���CQ�T�9�b*�e_����|45��I��O���Aʠ�q���2�S�d_�NZ0����EYޤ�UN�����g��#D��V���f$�B�'F�92��2*��䀡g�&.��cP����A�Nd�%e<��៬ǧ(���f���~t��I�(a�5�&i~Fjq�T'l$Q��s�p��x9ʜ�p��^��/v=�<QRמ����Uu� Dr�C�=�J�5��$������	D�?�Ǔ�w��Ev����>d���
�CD��1��;����*l1v�7x~N=�bQ��6�����<���IvKD^��Tv�����R�v���-ݯ�S�ӣ]�i��������u�D��]Gݽ�5M��0��=�ǆ��O�<QL��A���Uܒ�b�9�\���z-9�NSY�#��s��6����x��S�]�6��(�M>�7��y���%?�%c�;��ʮD�����3A�:�����'em��H�@"� �Z�<�-�"�Xf/�t�(��P[��N�}��؎�F�+��*w��Ҽ��Q���#���Ă�u�xM��k{B��Ŵk8�0��j�^���E���~���رS������<��FUX͆z����ƒs%��Z&a	��v	ڶ�.�bR5[f�P��xp��z�g8\�$���F���a�4K���uΠ��t�H~�o"#���bk�Ҽ/6bї�?�19l�o&N��\��k����o)@%7�UT��^��-�9��m	i�ǿO�H�J�J	��hg��UΫ��S�a�ɑ�G�q�3��5��j�oՎ�����͌��[2��o�{��^=^�����w���'���8r���QLU.�4�nJ���a/Y��.��r��32s�!LLW�ACQ-	��<
x��������V�,�#_�� �� �<C���,`|��$<�I�Z��� � n ,�H�� �݀'Kg�0���
��p3��� �N���(�i���k����T�r���� � �>x7�N� |	�,�I�QX-�E�
�`����/n|p`	�a����>`	��O�� /� ��0�<�+�o<��u�PܽX��B�'� ��q�Ӏ;ǟF{o �����c � �|0�6�z�����k�$�G�9�qxp�Ո�Z�ـM���n|� �A���� ���^R��k k� � Wn �
��s��ñw�Z����8p`-ೀM��� ��M��_< 8�$�<�����L| � F [ 7>�<��< x�w�C�z���T�-��\��8����#0�>8�,����p�u;�T�?.��ݓ5��>x��� O����� ' ~Xx�	�ib`�v�� �<	�)`�ͷ� \�x0g�~����cx��<#s.��sAH�(��>��O|�;?�+p�����^b�ͻ9w��!�5p�qӈ)��Mh*_��u��n?��B�U!�@}ܲ��{ �j��YP�D_��R��}F��8�c@i��K�w�GçX�+tB{V��*K\�]�5Fj{��Q�P���K�������x5!g�����-��}s�z�7��0I�P������f�}�G@/��G� bp9���/�<�Ft"i�-2��2���5��@'��
7/��iE������Z�зtW��I#�|Bώ��;p��}$ї��$Q�Nș�qV=��N��}>���y�"G�{���T/���G���?7ne���?�u���J�� :����	z�@G:N��9A��/�П�%�陹x���d���O��"�Y�s(�gƫ���Wd��(O��?d��� ����J OrBN�fn�\��4��A�=U;H���c�I���E��8iЪ_�T�/@|48
_�B��9����|	�*�C� ����7�ׂ�t��D�]ћ@��Vzc����_m�[�};�O��+=C'�? ���J����#i���|*�R��؀��~γ*0;��-�� 9e�7��=��4�͠�^im����0�( }��)ѣ]�P1��aȹ	|n�8z>�5T@d�-�@����|пn�ߖ��T�祑��jЯ��$ڱ�� }<�Yg0*�����9��g�3�Z1���@���ZO��8�(�;A/���tT>U����ƀ�z��<.����8yt�~�]�Sفʯ��w�6��K�m\~���(Q�>���[><�t�~��"���<�Ci������~�I?7�z�?�jk�,�~�'A_d�g�M���uX����(�c@w�ge�+_
z�U~8a�1����ՠ���Z�%Q>��4�׃^�[|m}�n��}�n�;
�t7�d!QMw)O���+@߅�,J��O)ｐhg-��=�<��&Џ����6���߰���X����������_g-o������|jg	��A�gݓ�h�s}�%�o���͞�������Ӕ��(�����L�lmg$�ߛ���|����Ӡt��C1��t�x*}�3��g�	�o ��@wm?����'��N��
z+γ�`�#�V�1sCVwv�!T���������QПw���gA�'��ǀ�	t���������۠W�����*���_�v��ZT�&������[�w$��@���?���!�摪��P��O��E�����߈uIV����x��?ٳ�Y�I-�4� ��w�}|nv}�OP�0* 2�����P>D��y��1=w����\�Ƭ�c7d�s��-�`VnE{nyenAe���^��z�@�~�¾��a�c;��=C�#�m�d��c������ޓ���������c�&� x�'{���!�P)�X�=͘��'0�*������7*e�o�g����"�}��	1U�3��a��l�do�0~��>�1�� ������_Y�+|e��,�7X@�'����}1)�.b���9:��|��TOK�F�S5u4�Ůa\��򞛚� �![j�3y���t�<�?W�H��o���V:�`zO� Ա��X��3�Ku�Mo:�\D���1;�G�WA�C��r[긜�|VP��|"z�3�t�Y��eZ5E7�E��nn��k������L�m#u��gQ��������a6��_d����?b�����^ðL�u�ߤ^�3z�wluhi8��-�����CK'w��oQAᤂ�Bu�Aʥ��fg���!�������{�to�y�[��V��*qk��Ƿ�!q`�4$~���K;~�!�k�_dH?��s�u�;~�Aۨ�#�ȍ��J�4����<c�h+F�g�MЦ��K�Z,��d��Sx5��?����w��ˌ�y�(u�i\��7��7�=[k�L�~��$z�1�hK�ilM�������i����F�Q>���S΀_�9�E���|>����<FBO҃�z�yR�s5�$_�!���yR��G��j�3�?�r<H��)<��	�?<��*P�������
�#yt0��/㤌T,�>�J�%�&G�MU�d�Sݩ����q~���?��ݵv��}�w��w���}v�C,`��2F�*�TQ|�'�F�>�զ�aLVTܿʠ�=��lO\�c�/F����F(~f��@%��p<�恟������?��xv���`|������}�.ft��s+X���r6a��u�p'㷲����.����x�~8_���|�K��3~��T4��\�ǌ_��V���2B�]g�';�L��1 +������hc2�~�FT2�^�oe����ʿ�y�ߘ�C�^�S��]���y�����h̏H��WiF��-f|�#na�����9�wr���zO1���W3�����:�3>�f�3>_b����3�������&���R��o2���ˣ�w���2�	����Əb�����c <�R�<�3�!g�p�3�X���x��ѳf$gO��a��+���3�w�㏫�fx����r�K<|�v��G�1Q�9��^-�:�'��b����_�T�C���;�oe?��������tgu�OrN����/.��n�\�
� ��b\��y��Uƅ������8�?����50.���|����i
�p��r<H�lf|����+�ϲ. ��3�Ō������w���>�9����e��ߍFI���;��w�ݫK{��1ֳ����I��p�72~�)�`2�A����re��y���2v3>��U�pQ�B�G�N��\�r���G�w0~$���g�����b�C�]�eN�2�u�?wcc8�'鳀�M�{�$'i���S�_����#���ɏ��q��UZ�k�2�O���xz؍� .��f�$��~�deG�/�zu1�Q���>��O�x�xG�V���8�La�WO�:�	Ռ��3���*9|a�b������,�����_c5ٸ��;�n��og�������@ؑ�w��>U�?�~C���'p����2����\�_�� ����'}F�>"��xg�/c��C�$���4�J������{�_��f#�?��9��e|�W�Ǘ��8���nƯfC��?1�i篣�T�Cl��[�}��������!�y�����֣����t)<��S�N�&��8���e�}lg��Ϫ�h_f��/��vI�_<���60�9�$�Һ���7�P�2�U�2�� ���̿«��40��<����S�m��ad>��r$_�<����Y��a|����LG}��Df������ܸ���|��>���|�$�G!N�(���=�_d{J{)/�>�8�Md�z�Sջ�7�q���\O}�x�<s$�H���jEf�>�1>��;���r��C��a;�|�<��߁x����W�;���?����Ҹ��A:�h`\ <ջ���G�w·�_�U�s���k�tȸ�<�W�ſ�0�9_���,��=��\�,�_(�Q5Ǭ��o��#�4#�f#}"��4���r|7�d#��f���hlmnk
EB���ɓ�R3��b���V���H�*cY{�9d;��W����g��ZZP�olk���#����¡��]᎐����i�l���Tn��V*�˒B�>�	7*�a�
#��q� >��rt]�fy�a�R{���Z��\j֘�Iͫ�@pU���Ʈ�B|�ѼyN�,��]M�T��s|������_='.�֛o��5���k}T�ּ����i�շͮ�USeT�]~{hY��76�A��2��� |aF��HGM}����G0k�>�or�R5�sfj��"����n�����S6vt*_����O�/eZ��YQ�>a��UIߧD��P�� �*,n	ݥ��Iz�@,���Z҄/uք�2)��>�̬/�._�|u���痬���R��"|�<��q�h�/���Elkea3�/��f*7��e&�Q�4!`#���S���H��3ɽ�*���P2��T}PU�4aJ�8}�U,ZX���GG�R>��ά�ASXqx�|u�@v��;�԰O%6]��Q���n&�J�[���PGG�2�`GPϩ/Va�0�-�8RJ��:��05�>R�2Ԙ6>�g�>_�K�2!;��9,�H�UEة:��ZB�\rĖ��@(L�>��_­��|>V�I���Y���M_��n�{g�w��)ot�����J�ͶH���H-�H��������[�mH�_�Ӻ��ýl�bo�N���JwӺ�՞Oץ��8���L[��ӁF��r�52��8"�+2�Τ>���G!?2?���S]����[�,Q	����9�ӌn[l��Lu5�qgg����k�K�(���[�͡楝ː���Ҕ����f_����H�s���?IMuZW�+C>4U�J�O�.�wU�[i�)ؚy���J�zt�f�Tv*���)��p��J�؅e�v�	��]�<-ݕs�S���Eicg�ﮧ3ir��,�6���$zU���ɂk��ީ�^s+��A|ɽ�#�Y+����S�/��4����yZ@&I��y3���ҩ2��]�o�k[�#�hg��)92Ф��xd�Ͻ�ޝ9��v1�urVD��塈9�>T�)n�eXH��Iy伃��/d�u�S�h�i=��z�ei�9TF5?��^��!$`�mw���n �n��"^��G�B�(�Xw��%�lC�ϗ<튏�����b!1�N�^´V���u�ٜ�Rw�rx+���u%z�jY;q�w][��hFM�VJD)�5��pKG�="��2eUC���&:EYM�"!�n-����_K0=.�,�rB�=�#���d�B�&6J��
�a+�����-�xB^����5���
l��*\�I���@�0�����R?�A[��c���jͱ*��:���`	��T������e��wڃ5�G����PX�jn]�H�?�������+��<��T����O�$��A
MM&��j�,*ڻl3<IS+���؁�3����@M�+�Z����d[�<�q,� �,,T\��}K��w�xy,�ckė�O�5aq`b�[&�ɖ�P;��V%v�+G�;�Du݅��^�m&��P4�qz�WUD�aT [kS���V��7�m�#Vv�y��TSS�� ���T���QT�-	�Фx��>�����0�"8m�DN7Ӄ)$�\�*M�(�H�l�Ι-�5E��i��$siGGb�f����uMgd�bK�z�JZ��T�2QMY]�3�-	��/�:�=E_4�m��j�do�zg�l�#�Q���e�
g�@�����H+)�т����t~SL0d�aE���3�8��+T��zJᒖ\7��hc���j����4a����ʉiQr'�>��̫v]�����c�������\oZG��U���l�o�ن�+$$lc�-��%U�S�-����oUnrOI�^��ނ���Zs��ç�%d�䡬/z��nzS�fJ�u���3 �Z��9��Gc]�$�z�[h!�$�KP����{�h դ�x�k�BZ��)]b�ǫ6H�["�,2��IHcS(���R�l�әU�O�DZ�I���^9��_if�]���i�I��Z�p�95�a7��il?�����|Έի獝T=Lp���j�TQ���eF�D(�*ڳJ�6�l�hN�@)�,P ��I�z��XC�so*�*{�+<箵�שz�}������zݹ�Ve�?S?�h�E��IZIv�_�V*ϱi"�r��_i�h_"��%�e�Ai���XX'�ה\w�T����X�	,��k�B��-��f䷴FB��1ˉ��r���K;��5�p�ȧ���F~pU�iiה��IQ�m&h��� ೶����v�q������M�OO���U�����Ɋ ���76����P[�D;������O�9��Qq�9܈r����^0�� L3���=���^7Q���)������?^���o`A�Vf��s���猬�#\^�ad�,_<>E�*����E����a;f���;�D�n� �Щ��ǿ�y�eZ������i���i���һ�R���*P����O��(O�>˵��*p��U��Mz���V�~&�Jyy�U�������=�R��,Pއ(�SyzD�Y�A�
�/�\�@~�U�?�e=������k�Z�q����!p3����=\��/��/��w���i�!��R���gGyy�W����������%�5�@~\0.�Y�'���@�]s�,��Q^�'X�h�Ӟ�9��{�_��:�xzF�b�yoS~?�Q}���oQ������>�S�HZ"^�U�Z���)/�;?w��"�N(����-�o/�g/�C�vmAYk�����7��5��/�zP�Zި�j�
�4��/�r����۸�#����y(O���[��os��o��rx-�t:��/pॼ<w,d�f��w����
}���	�X�z�Y�-���)����C40����Q_i[�9Az�6U�!�4��EQ}�|ŧ
�?��?168931000100023maraton/.git/objects/ea3306010001000178962maraton/.git/objects/ea/0d5b05e27325c69a7457ce179ba33f07853d7fx��yT��<ADAD* >Ɏ�SP@Q�ʢ�B2I&a�6f&$P�E+OQ�>e9R�A�婵"��h9(K�q)�R=Y�0�h��s����w�o�{'���t�F��a2�Өnn �ä�������#���,���ܵ�`����+��m+v>��M�A�G���oώj�5o�so�+|����a��0t�h��c��vk��W��g�r}�E7*U��uDС��7��z��z����F�I���`j��P�)��n���3΄���q�?Y�#������b���.'5��u����ܖd�%E0��Eæ�L��G&����T�'� \�K����W.R}[IY:�;T������N�x20Ws��̌�_���F����傣3Oʓ��^�| �1��U5v�4o���2F�8n��Th�e*;��x�h�`>A8 ��@|��G1N�I���|�W贱��烦�uJ*"�=rP��+��-��V�UO�٣{Է����r�?DGv�BCn�m������6%���s�E[���z�{�߱4���k<��+A�\!$�x>ǜ3���������q��e�溸��&Z�c~�K^5Yz��WZf��(HF�(�aWz+�SКU�>G�ױ�r Pg	/�h�b�����P�Sӟڴ�o�Ps���c��w�]��U���&�_��ᜒO�Jpek_����m����d�����N((��@Y���]���rS.P�B�|����
�0���M�_{{�b�
�GØ�2�֜/��e�ݡ�>P�p�=���� �#��b����^��c�F3˻����v��9��3�x ����,��uܑ��D ��e���ę51���=��	���s�H�����L	ˤ0ʈ��G.A_^���i�.?�����C�Y�Wߺ���<��a̟޿�z����34�$7������B�`z��,����J�T�\ �X�%U�,nʣ�QB��R�6�'�(HR������ɦM�T���kR�ͤFѬ�$����@�kAYMaBh��x��֊ݐ��,,�x!ճ�#O��^�o��lW��)��q+��$r6l�@���z,�̜�M�F����z�a��
�5-�kiYRq���ωcNcKo�vy�'�Wz�X���zPo���%�����O�3 F��F���A�km�b�|e�?�7&g����+~�{�ET�os��fU������z��ǋ �b�cʞ��J��;W9]��t��#AP�vH��lοPcS��}��w����ɰ�
��R.P+�J���=8\��������N��9mMˬ�����VTm�h��9���c����Je4�9��`e^��Ɨ/韖�$ˠ���w�t��z��;>��T�d�5�Hƒ�Y�4^{���NO���0�q�����V?I N�%Z,��O}�^�C^k�"]�4I�j�����S2H����l�ܵ�";��o��AԵ?�rD��%���>�X,0N�۞>x)1p��2pڀp
q��aa��!-[���2�y��|��}Ts.M����V��<On1�d�;������NT�nG�P���~]r���t���3�o~\,���+���8��2�����D�|�%T�@ś��[��-r^�,��Լ�e��>D&N���X�ŕ"�1�{@P6�u��D���T�Oκ��|Pje�������
Y�ܵ��+�wo&���*b��Jt���sj�Ȭ�N�3�W2BtvR��N�|��wg��^�'�؜a�,��9�_�N��168931000100023maraton/.git/objects/d83306010001000101762maraton/.git/objects/d8/fa176d670a81215186ebb27c47fe60d2ea9f05x�V�R�8�W�z���$@.SEmɶH�$��60�2��"1ؖג�����p��a򒪤/GݧO�,3t�9����T�Ru�1��Y(U~��������3c�����{aD�#�HD����74.ӳ��u膏ƅؾ�n�m\���won��!���m���s�����5"�pzI�m��4�\D��i4���p���iq�s�*�Ͽ����
#�[��ZES�;��j�ivF�![$�ݡE�s�ytDx��� �u��D�QU�;Z��W�D�(P��+�;�����J����uD�IG!�/,⸗Z���q�8�Q��M��J��z�LQdi���d�MQ�qZ$��,�?�T�(Na��1�u��䴿[�9?����e�w_�O��=��"��#�M�ߨ�P.��:�PƐYC�}d��n��tO��]i0qD!ڊ\À��p�`k�M&'m~4�ÑO"-p?j��7#k��ؽ��㵓��r�	���:b�aP
$�Z�m�^�*�q�*^�Kn�X�3�����I��Qo���������$p�f~��B2�A�Otv�M}����쬋��=�:3@�2��Eg�K=�3l��nt�wE-7�Պ�S� ��R�d�r���R���f0�1E{��B�7mE�H�5�Q���P3�l�=�.9R�/�c�s�C�T���י Q�Y�>=��H����=�z���ˍ[���Y��{l����Oڭm�;�cLV���Xt��<�sS��͔�q���Í���ё�Py�q��k+戎}kjA�5^�J��eo��)�Ǯ~�Nh������+�,$t��L��ur}��~ۆ��%�q��-%��W����Z1��<�H�����4�lɀ���5ِ��׿�x�-���|Sh�U��p01�sΊ�/�D�!z=����5HJ�W���>�V(XيK�ۭn�u���3!�e#U��;H�7��#~H�s8֌+U.��+JJ�J���7j�� $�ӷU��Z½:G9{L�:�O���yƱ���wDR168931000100023maraton/.git/objects/01330601000100020162maraton/.git/objects/01/83ab30b485a812a4c66b9ccf9f4ea0d9610030xu�M
�0��MN1���hK7�W��B1���!*�������~曗i���힞�Amf��]f!%�S��fUsޏ��p�y(ad��&�'�4�8�oh^�5���c/�{��?_Q�И��1�
\�Y��4ز����V�N`���5�d0R���{���;?�D�L����V�rD�<[�"�'�CBt]�B�$�d�rA`�330601000100014762maraton/.git/objects/01/acfec5abde5ba37617b796aeb6c6593de3b23cx����0@QΙ"�q�&B��8����)�S���/�<��/}S��7�$#2��Z�E0@54�*Y��{��	K��@�lP��$q��l�"(j����џ��Ed���0���Ǳ��G��#Ɖ� 8��u�ǸcY�̻��i<�168931000100023maraton/.git/objects/1a330601000100047862maraton/.git/objects/1a/4c13b7ff53e958e302ba4822b86a2ca6ebd739x�R���0���UU%�I��d�_D�n^ �k�����y6��U�H`3�73�c7����w��M7�T��uF���~�Yw�����-��;Q<Z���{e��F�;�c֎�~��|�T"��'V�P�dσqd��Jw�^����(G���Xi����[��'�e��v��r7C��Y')ůq�PI|����jv��T�c�Y�~��S�83����߰���DПh*KZm1%�d�?O`�jcc�|y\B
 �,�Z�\�20���`��Ié ���$��ｦ{��NN�<|O�B����&��m� ﭺ�F]3��(�(��B�S��&dC��������o�b�����۹q��.���LR����K�.>�I��2 >�)��Mz/�kYϮ!�?��p '��\X������D֊�vV�.j!Xjr��V��h�!T�&~0�V��v� n��l���)��n168931000100023maraton/.git/objects/74330601000100050262maraton/.git/objects/74/2be30a769be73b2daf16799fe205631f291775x}SM��@͵�WTV���%���0��[2��$�8����ӊ�˚a�{���0�*V�z�UU�+�|����{�ʲS�j]��}
W�W-]��B�i�,�9Sק�w��/`�n�\jh�J�sO��XO�g�PT�o���O�,,>noT�`��9�)a��
� �/hen�惺	?���B�֗�����B "��k��06� �l�e)������_�]�Ⱦ��|��{��:_=��c|�����sEx��c�pj��m��ے�(�h�R=��S�����9k����f�mq�G�_+�@m6��R�qv�@s����	�D�D�b�/ߵ��r���)��p�T�� !<��Jf
�Ԡ���%D1��;ЃM�cjyj��q0��
��x}]��\�9j�<�sc}dGW�ieN"����ڑh�4$�C��oaOZԠC������h�4��]ݵ��].oz5���嘰�	1��K��+!!��?I	��#'
"�|�p�[�168931000100023maraton/.git/objects/23330601000100019862maraton/.git/objects/23/16ed1337868d2d4fb4b337cc2c7a2cd66ad65ax��M
�0F�vN1���/�	�vjiF�P��A��y_�2��pܯ`�mkbGB���x�赽��#��l	}��6�(����D�Z�A��E?��i��	�B����٦T�@>a��i2�쒙�3/������	�a��>���-���\�o�Ϧ G1�E�	�f�m� �B�P�T�Btw���4o#ֺ^330601000100016862maraton/.git/objects/23/5886d473765767d491c737097d7f25ce2f8947xUα
�0��)�Q�8t�:�
�A��r�gI�T��Mi���>���u��i�C��v�Q[Bd�,��q�\��[I����ʲ��M��Ϣ裭�fC��*^d�����W'��_����qM�ሟ�j3�Ѐ�}c�M���-Db�?,Ch >�FLD�168931000100025maraton/.git/objects/pack168931000100023maraton/.git/objects/da330601000100039462maraton/.git/objects/da/bd1119823d9525335a82974633412b3c3f7a7cx�RAn�0��~�*�R�^����gD�r��Z��H�����I�R9 {=;3���^��}��X9��~�δ;�B��_L������ڂ�M�U�M��Y�0��|��e6����wT#�UBݴn���E
�Tևݎ��!Qy?�|NH3�3�a�.�{���@��oל�.���l�jԱi����'i�d\$\�X�3N�8�@RB��|,� gS����+�\I�/b	8g67g@x�S� �KA��ݚl�d��۰�8h���pa�u�*ܽӒU�Rk��į�S��0� H%����L
�$+(
�$|5&���A
נ�P-��9�o�l�U�lL}J���B1���Yį*��y}˔Y��玦��^Hg"���&#��bS��v�S168931000100023maraton/.git/objects/de330601000100025462maraton/.git/objects/de/b0a6e9eafffccca3674855c521fdf8c4f3a229xE�1k�0��ڿB�%�2�th!�@�zS�����
�Rbg:��+�-#�ӧ��n�:x}{��Hv\zgp
qv��a��c�Ai��;P�]�i���
�F�`y��R��V�J�o���C+���,׮�QJK�9e�ꚟg/�@,�0G8�������i��XV���9<�A��?��-�FB�}�D*��ma���+�A��`$$��Ο��L��ɔl��\��5ɰ�5vZ�1���lj5����P��/qj168931000100023maraton/.git/objects/983306010001000967262maraton/.git/objects/98/b650ccae47ef4def3a756b5fd7627b6848904dx�}ks�ƒ��U���9&�J%��:�����Rv�V*��!		 �D;���t�.)߲�Wq,\==�==}��8�Ƣ}�j��_��o�.���1K��p��ض�'"H��q$~��p'I�/�/���p:�dhE��o2���ﶝ��ۣ������ާ��NSI�����z�b�c@�1�Qj�r�m��1��7�ݡ����CAd,h�;��L�Μ8���Z��g���~���rx���/u7�[���q ��������P��V*t�r`]��m{�%�(Le�D�3�5��(��ټ&�EtUSm�4��qM���85q��&�:���Ɵ���X��Y�D����3ǻH�Z�73'��.?Y�}Ѵ&&Q��>���@/Nv5Y�n�G!���ѫ�G� :� �j���+�IMA5�_�.�Maط������]i�MM����N`Ӹ�UoZE�48t�����MO��������x����O��b�{����%�v�{��t�M3p���j	˾!�ً�D�����2
��tq�h�����{���4X�� �s�LT���w��tr� {#ۍ�p��'7����z�^�@��ᖛƚ�����f�|5�����K�1��-�X�7�������h�pR�W�|�b !�,|��<Sξ,�-�wi���i6��d�7�H�Δ�������f���B�6�S�Z�b9X�x2Q�G��e��X+�av��T(K����Xܸ��3(R'��w����a)�N��8tRPI����Ea����F�E���$�������X��%��"�$��	5�O�hHg�',�n�<�8s?X�,d���I�٬��.�?���fS����@&3)�"��@��C�fR�CeơLŋ�E��ՠ��A���|��P$3	:kD��d� �#��n ���x��� ����wy����Hbw`�)JrH��@�ȓ<��&l��2�f!:�_�~CA PX:�<�����D�Ei�uLt��[�Ds�����8�	�*�ː�ܹ^XHtCz${���;�V�̟��>Z��Z�
䇜�����H �t��Ί���w��M�&��F˸1^��W���)�Q���� �I�b1�B�5!����ݶ� ��#��3�.j����ㆹB:�3z�!���_ԃ�@O�_�~1����l%�O�J����ꏥ�W,}��n�[��|�J*���'�`�?��.��l7tK_/�:Lb��	܍�5�
#����GT���[<��`e�����>��^}-�W�Nww>�_�G��g�j��r� ��	@ �p�D;���E��TUz���O��������g<��p �
K�:�yZ��N	����p8�u�h��h�{��U,��"��pZ����L]�����S�5�e��C�f��_F��a��0���p�ĭ7Q�
��� �A���X����,�q���@�J��-�J�ưj�E��B��(K�Qp���2v�kFS'���2��̆ӏ�o�xE>������7X�����a�^�s-�jŋ�%-#uC�ߪ�}���i��U��V��G�}XwV�q���Ɵ"�����Ǒ��m�2����%Ǖ�&�:�՚��i�F����D��A��N=��#c�-��p�R�8�UKO�(���jZ��؟�T��Or=0�f��"J���"?�<x��:a�SK���U?��B��m�{/#�cE}�F�k�4�h2��v��pSKi���ypr�2rC�f;�$*X�S�7���eJޔH��[Л�$�����2!6�*��E�Ё�+i�Y��D����F`'��D��G�ǐ��S��Չh��t+:�}����Bp7u3(�+�d�鏗i
kN�&Y��>9���4�����Y�`��O�`��`������)&�Rh�N1q�ğ�6� �`�cr�	b0Ϣp:�� ;��>�B��U����?�S?��
h~�3b8��%��P0���p���b��F�`�`��&��m׏]xC��Tk�Ÿ����K�=4�ś>l�x^�j���+z^�|��,>�����|XgC�f���av@����T������f�P*J땙$-t"��d*�OF���â��%~��@-s�aM�ݐN	�E/IK�jl	^"LPj4�L+�H1��8�5��E�C%�Lb�5�T}�S���E�ǧX���ԲUhV�Y�4c%��n��{�)��j�ȫ�.~��N8�7C��e^g��"��@�|��h&���d|"�4.�m���W�~e*R�I9^�N�cŐF�L-��h� ����d��P��[��I6�M��|],߿���k&��wo~x���E.�d��k���$����H�`��a��\IU\\>������Dw���$qk�AY.fbVL��_љ��M,���v�z��h��oG���/�~��+0�c�*I1�7�/_\\>�,M�b�N.Kڦ�ڈ��d麒\�(tιX�U+Or���WG8�~���~c�&�5~G�	,؄i'`�	̱{T��&a���%�![��\�����M��D2¼�70U���2��f|�k��
/��.��%C��7���)��E��a��{�h�V(���d�h#0T�w�d��vu��WPo�N(ŭX��꜔��W0���c�~�802���`h(0��#��bN��k�a.R�zz��	��m�5n0hk�]�g�7*���J�k��F��Ò���tف�h0h�i��LL�td/X�qZ���c�t��w�Vp��)�Q���fk�ͬ�١�e<�&��(���N&��g�{w�%�a}?N�5)ת�R���>��8X�s*I3q/[��Wq�k�`�D�c�R!ّ��~�TD(�\����XDs��⚴�u�F����,������ޗ��}�+4?��P���ɥ�8���	rd�j4wef0�������w:k\%��g��p����ON�ᝯ�Vi�2��{Mn�Y��~{^ꊆ���TVt�$���;��|A*z����Q�q}�@0	�Ac��ﬁna���E�Tzu�A��-��SҀl1BY��,^�D�X���P� �s���?�a$��gm6��Z���	�r��qB
��lZ������E��E9�y*�Z�M�� ˳���R��Р 8δ�x�,r�V��''��|dWrF�^8���ӹ�/(4c��6eu���L	���5|b ��*�)E�'��"�D��|�M1Z*�y�~��ҬQk�ŪH-
���/���0�'�t��plq���C�I�F�JB��p06��b�;���..�I_1E��S"��d�t�l7�'��F���[�ε	��8q�B��;�,A S� |]��I��S :G8%�{�:t�@ �X"ڃ�5�|��x,��v��q;��vNZ�	���Ft#�؟Na�m@��H�"-��H��tb�I`�a ���av�O՘b*BPgD��D��Z�4�2�3�U1i=���d��L�l@�0r�.�T7T󘈚����dA��:5��<@
l#�d��804�Bih<`� ����[��LW4|��$\�I�W�E6BЀ�+�l��s-Y`��QD���� �
P���4�	� ,	�;���?!Ϲ.^�T�C�(�Q�9�(��;�M��x�����൫� ފ�+d5�[pT�ևZ��8U� T*�:C$�>ڣi�H��0���ȻM��	��P�d]<�@�r[�+ħ(GD�1�c�P�0(�G4�@8��o�L>@W��V�2� a��4�	�tJZ�INCbea"�P��7��e03�A	<I�JPF!�$�@	��T�H`�4i0�I����8���5 ,�����L*����e��D��L�\��~/��"��(�r�+a%����<�=|��*��>�m?��<�=x�k�x16�(|��Bs�#�{*`RZ�J�%xP��uC�D4�⦈&׼��W����(�~��X�c�z5*�?|o�>6͊����gY���جz9:�����r6�'�T�δ+������?㯏��5D\|T1X��m�8�b�7D,���!�*�G&�Y���`뽟�XaQ�E(�~`�7y$	"�蜭�܄�c� �A�ۧAz�-�*��@�1*��%\0�X�Jd�0��Ul����~Of-�*"��*tcf�Q�+�Id�LXr�Z{3���AC^ː�����A;����n���:h��Ў���fh��������o��j~8Lލ2��#��0^#=��#Q
Dl�X[$�锔A]11/T�r�)*���ߪ��y�%�j�7/]�����c��mS��O��)��
�{����j��󩆐�~}��AE$�M^�:����C�!_�K ������e����ث;iW+��B�v�Syb������Ɯ�"ܬ~���V�����\9w������Lተ~~qi��}m���ݷjo�z��^/�b�ܝW���6 ʐ�S�SS$|~������kގ�ޞ��%�p}���	)8X�O���AaT�n�����v�Q�!�	�0l%�����1��y����7TM�ު���r���A-,�<(��Х4��@sU���FR
j�N���	rA���w�,�h��(��P��s���l8݃��{x,e��i�N���:G��7=g�:x��O)]�l��*�g��>�W�,��|y:��SJ'��Y�V���7����0�fX\zG���l��C|��v1@ sl7�fW�N:���l`�*,D2W���8���F�����҇�%=�B��+ۓ��u�Ǉ�n�{�td�#[Gǽ���b���ݮ(?���5�5W%��X�Q>9^D���ڝ�t{�n�w�ƽ^��9�t[�N���;r{_L��b>��[f���fRw�NS4�N�'m��I����e�b��Y��x���K��$';�GBu�%"�zp4�|��L����1��hW�%E�ng(���9�w/+�z���)'���������L����a��Y�}���_�gQȎ5,��<m�E��yprh���+�>�X���tw�N��u�-�{|�y�n��=:���q�x�n�uS(vf� elN�DP�x��u,�͓��I^��Ʉy·0�� ��;9{m�������L����Ѹ���/&�vqOc
����X�Q4V��fڷ�v������z��{�stt�tz���M��㣃I��۝���ɣv�	�uɸ^&3�������ݲ[]�u�i~��!IxQX��?%�(v�Dd[�%>'O~�{��s��ö�n���lN���k:��i����+Ld���Ƞf�.��!=�	���V���I����� ����{��9�f��;8=�i%�n�=r��-����u
���A��~�����o�{�&-�ݓ&�^�~��Y��{!�Cˤ��P
��D���p&Ns,�G6ۓ�|�f�m���-��<��3c��_E!�i(��D�s���m6,LW�HP�	�B2U�Yv�ڏ I�aUƎ[��Q�*��@a*'nP�A	a�?��W����Jz�@��$A8��u �BSy]����_GCU�&�@��Eѵ/�Iª�ݧ�&@Q'�2�OP_ab\���:W������B�����/c�������c�����_�a�X"a�:���^����z@5=l������g3x�끭��M#FTåg�TbP��o��ж�6ۆ�$f��:��t#-�I�g_��>�24������G�ԓ�������9|O'G�
�2s�2�(J:�5G�� C�= �ʱ���#�6��o͎pe�������)" \_���?��)(�X#�b8����S��1���ޢ�$��I�PY���O}ɉWKl�,���0�	@���g+z��U?Ķ�P�EI��Q�B�n^p�
��u��lw���)�W�8Ca�RD���l�jR��L�����[��@6�q
a�6��>����h�Hﬣ/�-?BKKY4�+�8@~���oЉp�hCu�z���-$|�����a[��MP�|�~s?�Ju!녇*]��i�����5�yK �U�����p��FU�zTM�ɲ�?�R=kY�,x�77QJ7��G2:������diZ���}(�N�L���M(�)i�{q�U����9�4����ۉ�88��;�����̽����x�>z�wYQ�� !f�i��Q�-F�Qi[��Q#�@m�`�j�(ʄ�F�-�Sw:�w>hZі���:�売K�`�k�h6BV�q�Ա�>n3�CJXo����������I;IΑ�B~�[�P���'��h�`KI8?-=�����v�Q���_��1�Gdk)@*����#�Ny�f�;mr����ִ��=�@˿i%����ؚ����ʑ~(�P�+9���{�v�����L�������a�
AB�Pj����U��d1���h�T"��g�1l :a!?#H�Gd��h�*�O�bq���/�A6IN�稆�wT�y"Ύ�ŋw/�/����~�MT���9��g�u|�����8:��H.�xa�n?�������ψ�\*`���ax`���?fM�ʨ�Դ�[˳L�ڪx߰��Y�W0���Z�*}W�Ұ=���1K(�k�@|��, �����b�Oՠ2����� l*�M�����JQ�Q��M�n��*�krI��0�I�T-�� ��#�pф`�%{���[�@��=�w��)Ƒ��İ�4*�Cm �܆!w��gC�;7S���:�K�ƛ���c��q��I�K*?�G6�.�EV0M6�h��Q�k_¬,<��l��pG��ݭ��V��S(@���|��EP�m���+����G���8�j�
�ڼ3D��х�Y`u[��=�D���5 ����;�C�vx���/킋���mA�/�X�%0� ��pX���NT���䊉Of?��SVi��#�Q5���,��L�)�g��o�O՜�yV�t	�V`�+� Q7��ӡh�?b�)�x��ɓͼ6��ow�=Ἁ
���ԙ�ΰ��-���+��P�`����V�D�<�]�n�{��������^"�cS�/�hcԑ��H������	�q\��W̋n������7ڪ�ah�'h���b���Y�eUw��z�h ��X.PbB۞Q�΀�r����6�p��SDEuOR��S�
��J�֠D}a&��a�&��_~��O@
]ЭQx���eH}ZB��4��oi��̗RFД�7���^	ђ��
�U����v#�PkE�Le���^�cϵ�z������y�G[�n�Ȝ����(f}@�����2e�5d{����A�F��!h�;���**�g΀X�tG��jw��:j%�	G�<��g��5Uzo�R 
}���0�I����"p^�Af�=`i����Ҿ@�V0�g3iC+"o��y��ى��MpB%6	TQL�,��&���~ō䳉H��d�z���_7H���/���E2K!I��չ������$�DU���!�D�"���[�W-�:G��0�؄�U�z��5�R��C#pBJ��K�r!�@c�b6_kW:߁9��P�����!�W�@��D2˛wT�0�`��m"���e�p��I�u�j*��sظYb 0k�f&�Mq!�АB��U� Rb'�D+�"�(騳��2����^�����aw���8��mm�����j��m:�A$[S�6�m�#S-~ 9�#oq'Cma�{Q_�FP��i�3��"#�p���ўK�[�����(>EH�P�aN��(���t���,�DN�H18�"!���\�rl������K�ϯ�����*��� YP�G�!�d��=���
Un�������_ʩ�
]E	/sJ�'�l
Y\�x�{�.P�1��pP/�oc��q;�p��j˗Soo���߾CY�$��4�L%d&/e!���t\V>Vut'`x��4j5�Z�:�[�D��O�q�8�!����a�r|����"Yܻ�[h�D�	���a��<u���T\�j����;����&���k���$�cvb���䆊h�-�9��8��d+��"��ON��-��|�0ɞ�рb�Y0F�+�Y.�Y,���'Sǻy�T�О@S�YF�-�4���}�^ԓx�yF��vW��L�\��׼�_�[��|D�ι��c"�s�QF�k�Q�T����y������h� �4��(Sx��2����.��
��0�^p��c�U�e��Vv���(�L6������w|���w8h1d)�z��L�j���O��x�F������`5�)��x<���3�p($�iDP�[y�D�55+0ZXePS�m�O<����(����ɤ99��J����6�6�@��x�_��Rř;\&�&��q*����gX�U�y��>*M��G�`�r�������fڞz0�ғ9�,�;T�+-�����̨!<*���b�ƻ͜*����hQ���/�FA��OQ(�����}��������8I����Kj�:��b�~��>4��Z���)Pf&�Y�}�.)�Ҋ�f�=ө֟w�r���N'�pm��N�?�}��?5Z����d]D.�����6\Cí�U�8fi�u0�����d�l�TB�2ՠ�y4��A	(���?U5+Wx0����G�.�H~X]:�רp�q��5�dQ�JM
�����sk���$�`������� n1d���(�pSx�.�쉮�8S�Ќ޾l$3��n2���S���ޠ��<�cn���	4�Cy�/��Tp�eO�>(���K��cV7E��LZ� a_%�tdy*��d�.!r����զ�����{��*?s��s�S+ljJތ�0������-�}@��g�a$�T�i�~Y���?������ p��}�q��{Z/(����C������/626b�:uN�Z�(�����V����ǽ�-\��f*.jq�4����8�E��F~�÷j���˻�2(܉8��<l���v���U��1����7�]��\]AT
��A{*�_��W93ِ�g�^!����:Mg:s�pVٵ����#���OkW�=��*kf��Հ�*�JO�c�k3���Y}4��T:�KfW���Ã�a�6�JnN?�m�A���0d��f�)F�Ѹ,1��{�q&�Xb�t���{�W�&7�t���Ƙz��&�sE��t�3�
ˌ�P76�}����6*���f^Wn�xe������������QR�[*F(���w6�s>3sa[Ӓ�2��8q�c�؎�j:�
Y����,�q{乱��&p`�����<��R����Z����nN�Bg�ت9	�r�$�\��_^�uV�r�!�HԠB;t#]6/�\�<x�W��|�q��gq�璮R�A6��M�J�4�x����LL�"���7�U�x���L��m��n�ɦ�~���5u�3c�v����Ngac��g_����(~I��DuU����B���b����T��330601000100018862maraton/.git/objects/98/b8337588d7afe74bc478d0c3c93de12a649222x��=�0FY�SXe�H�ЈKp��qi�4F� qw�"$�v��g�O����l�mMT$4��H�^�Z9��˖�U#������B�rB�W�$�ǭ�g,��	q�K�J�<���*S/<߳K�x�o8u]�?�������p�����/̰��������n�aD+&�Bt�5���4ğ��330601000100031662maraton/.git/objects/98/2612557f4a5b5d38f703e40364858715be7c9dx+)JMU066a040031Qrut�u��MaH��vl�ry{���Zf.iް�=TQbJJQj�^A%Ô�a?�8M���+x|��kE�ɾPEɉy%�y E�����?�����,��s��Q_U���^Y�YU�R�p��H���7�v�������w#�.3������D��]򹹉fGWufL9/��kb 
�ii9�y��j)�c����D��s��Թ�?^A�((�O�I͍��,.a�
��ԡ�󌁯�S�{&y[oF@Օ��$��3O�'dU����U�'��'�r��US��XR��ZQR'�yl[��`(��~f������ $�9168931000100023maraton/.git/objects/2b330601000100049162maraton/.git/objects/2b/7f8f7622735adba3023803d8aefb095b94407ex+)JMU055e040031QHJ+�K.(`8��y��ͯ��͙��m�ݗl{U���[����ZV99h���e;I�ޟ%#e�U��V_VT'��n�|Ϟ��&YMg����1PE�y�%6z����7Cc=�~]�^�����������9so����N�0��n���Ϳ� ����*�M)g��4���h~\��)��z�!��6g��2O^}�x�B����yg��e悭���$Ik����h�x�gb 
E����%?�Վ�R�3�+h�8�I�K�)E����IE�%��i�Eɩ`#S7s-�k��|��CB�⹙�ݚ��4�WƗ'g$�@|x��i�ք��Ԭ
4������_CՖ$'��T2tn��t��ax*&hg�v���0E��%`K�v���G�*�8B��}率��SSd�WRQ°���z�h.����u�>}z�����$�C�d1E�3�}
��r�� ����168931000100023maraton/.git/objects/0e330601000100053262maraton/.git/objects/0e/621262fee7c8b93c854f9146fc1d4528f01c16x�S�n�0ݫ�l�b�N��1����%Uˁ,u���%�i�3�")��;O=>n��>+ݟ� K5���v�)Y}/�����e�i?�fi�D$nV�H��|i{I���$J[:��3���MC�ޚ:���,�St�c���We�*�s������5�!G�ip��Q��0��Y���$Pɖ����mYJ��'��:KJ�q2bG^&�ԏ=�u�4���S�%��#�E��f���|��Z�o\-]�߀P�uiC��V�Q�ܕW��#��6�~�|C�B .|$����3��U��������'^��s�<r��`�H�^��'�tl�N3J���2��yw4�y��-?� <RAG�]UՀ6_|?��
bT�蕮k�ƺNh�/.v�L�˞{��T�<ǤA��y+�������O)"�n�jߴڃ�&�0
h�W�,�ݎH� �174�k�t�׽��M�fD��É�*މ~�} 	��G�v��~� d��NyFܣpi�U�ɢi���=C�3306010001000928862maraton/.git/objects/0e/ae7c1570fa42759ab23dc59143e15447ebf02cx��}s�֕��_�S�Qf*�!%;�mweE�u[u�8;��x\H�""�`P�Ҵ�}�9���$�ݤ"xq_��s^.g�j>{��Ǐ�m��������i�^�r[4aV\_��r{��v>	y]�9_�p�(�bޖ��S���E�G����ռh����]]�gU}>��\]����o��~ؼ���uQ��f�U�/�z���<�(����|s���}���y�W�v2/��yQ��b::@�ԒM�!�'h+�B� ��y�h�M�-w�/d�~�l�T�z�q+6^���.�.�����q�����r{S��Z1߷�l])d�y��k� ��)��~p��SoV,+����:;z��ۗ�Ɵ��<���G�pSV���z�)�msrve�!���]�m(�pS��lS�m�8i�[�ⶨ7Ul!��-��l��6��u�'��:���|��~��w��^~�V/.<::9�w��U�Tq��X"����o��j��[��"#d��>���P�m%՝$wS-��.�{�����&Ϧ���K��[�<��v_o���c#:��o�u��ra��4�$�#4-O����S����?�,-��a��D�:r�����e0���9J�N�����VP�4֔���i�5�E�#͉��oJ�+º�^��9Q
	�~�rQ�b�XL�-�ɂ�����:_���hL��J��ہ�	ys㻖��!�Pd`�!#a��۱X1�T��6��g�$�Ȅ+dM�8?�q���.�J�I3��\��#������v�Ka\o����dq�n�&����4{�I�mS��j�vbQ�M����To�����k���� ��e��e2Pj���/����v��J�׬����"~��12�C���Lbe맡�2���n��C~�X#�t�b�s���$�}5�f��l�Ѵy��3?�4٢�$i�������a0��,+��b�{��{�'a��,L����fq�/��wo��_���s|���bJO��4�2o������iY��ط���X��bv��4��t;�K�]�����-f���<�a���n��8߸���J���O?����m�����g�s���'�E_cT��-��ۚ�����-�;�[����=��B4j=�f)a�q�ڻ��9r����d�w�����qP鍖�Pӗ�-	�0�pϖ�����pGE�@
�|�Tkl��]��7T��N�&��ON���T����b�ǧˏ���I���K�{Idgϰ/��ڕ���]6L��.�sȉ�㤁u�9��eٳ�˴��t^�!Xg�)d�n��$Gq^Ώ����*,��
&-�B�V�4c��ږ6��ܔ��5G���|bb�	 `MX����[��|�a��A׫0d_h��Θ���tG��E��a�wAfA1���� ������j&�{9iB��0.����}1�l���%8�4�~p�X�����g\j��+��ǿE[gE}^9支� x~<���{a7�f�/�K��痶^9���F������H�H�������|���.m��{�͓�x��i(�}���Օ��0����O�|�����ߞ�:�^�&lŞ�;@$5��{�Sq ��02�6r]ԧ��W�!��-*;��wU@��6���+:AxYKj`���܁e
�4��3M�i�Wfv�un��j��ǝ"K�ʚь�3Dإ����O�+c�-���o`q
���c�2v�f�cXWEY���\�y]�|_76%}��0��dA\��7���sG�&���z��#a�b��<x[ߟ�\����P�|:�\W���c�O�������%2�'ߒɔķ�u��c���y�/��-vb.��!p�Ũ|�}h��e}mU2��2�!�
a����� � ^�]�cX[�'�PS�&$��Al_�b�Ȅ�HY�I��	�2�3���%`Cx#voJ�*EWy�o��b��J�Va#�o�ԃIEqz}J ,@�_^Ξ�����ظs<��㶺�f|!��]ZS��Q;����O'a;�"ob��g��'.@���l�l���ՐM��Z�^�)��l�hw��Z��ѣ�遧�,(��5	?�8	��M���$\^�Y�ޕ|��΀@���n�!�6&瀸sH���^	&䳺�-Ũ ���85l�b}����:����<�,��(�~m�����	��'+r�:��z!=t0��joPd�wrT,��GI�;.�T��x��J�,���Q�0���=~j��^䡬k�ŭT��#� Z����Uy�f���c�d�qk��ހ�u�.�p�{!����y7sr�O�q�/V���<ף}�w2g],Y+�l���<��͎,��\��������
��Nl�#�5ɣ���lKH��%M�y���zc���,ہ���(��
�;�,�C�;:�Kx���1��-�%3L�@_q\6b���"�C��AB]����a�\Wy{R>������xx���;O��Ϭ�<Ze{����;�8�l�2�P�(�$\�����[��K�9�ɝ�FuRt����uu�`Y��E)f��{bf�u��������n�o��)dO�h"�L"�V\�v��\7��'gm91��%J$�����mNë��9�#���7,lRN� ���bmk�S���V�^�� ��>�ٻB#3���8��jO�*��o8�|�|'{9��^��M&���z!�Z)�9B��-p����$<z�fn=2z'���p})�b�8[kt�9D�6�)c}M"�.�]�#7<�4���s�@�Z�"�o��/7�e����Q�lE��{��Q���Mqd��%g5w��T�9֢�����c����Q�̚�k��rw�������iHߌK�: rK`����(c��P;���H~�6y�\|=��g�[g���m|�"�"�&)FB55�Lɨ4���
(`��u"���)�RΏzS�H�uYڿq�:<P�tKZ�)r��Q�?O'� ��í32^2��ZAZ�'�����5�cE�-�`�/�\y��01V�FZ�|��Θ���Q	 ��Qᢕ��-����/&�
\��6DF��%��{����c5���剁w&�:�	Wo��Xz�(�q�1%ᐰ�t�/�ȫ ق��I�AХ%��L�b�ߖ'MFj�9���ao�A!�b-݆v$D�\�xC�H��-�_C��j4��t���0����|���y���C)�.`���2˞�8vR��@�ͮ��L/g���
/�ON�h$G���?>����bz��ਭv�4h0��
9.qD��7�q��۪\��;�b�Ӯ����Sߤ\ f��2��	���=g#Ķnz4�A��4��?6������`�M�^`���k�J0˰Y��f�;�绡�!K�)K8:�<#�����N)�]��Ȯ���Ժ�HS�5,\��9��k�+���&t�2@ܫm��{��brd{$�kr	���	|cV�:�/��xCQ�:#�f�ؿg-��ު�F���@K���~�x:@:3�_Z�iP&C�6Ji�W��	7,�j(�{S��R��˲nj�,�� I?����ǧ�������F� �Ż~t6��|����p|?P���GT�>���)F���9Pま�F#���'jΈ�9�P���dlh��ȋ(�a�\�T:�f�;��L�o �Ԓp$Bqw�фEBS������|H��8&8R�+T���AZ�ӮXG���x������b�d�����Ӟ0��rv~ȫ�eUE�s,$JN�3H����̊�� Ij�Q�L!�Hx"!3�0H���@�B4��F����V]��d�f؆d��k��,�c[K	U7'�:��;j���� ��;|A=�\&��"��[r+Ӷ�R��4i�W)����s�=e�o4��(�^���(�MzJP�Q����
8BM�D�0��i��2���F�PӋ��W��>p�	�k�j�3����c��~kτ�~�|�������Ѓd&�q��hˁ��2k�x4�G�mFi�j&{�O����Q0�n��(�ۂ����4�C?���0�m��G����&k���Щf�>�3nc�n١��j�D�	�@�w6GZ#�<�G�✲B����m7�h�XN$��2����JJ�64�`�a0� ]$�B#�x*��.1X#Ju哘�av��b� ���4�X*dO%��iah�k�F���N9�5J�q�,�ސ��Gِ·�j�{���V�9�՞��0�{��eZe���(nd�۱���=y:��t��(��t_�,[��FSy~�YT0��n������(+�iߚ��U�Z+�g�'�%�HX<��T@�F�[��P/�򩍑��qtT�C�fػ/�ԛ�6�O��2���\�7��;��~��Ovj�1���3�z]��6�,`�-���������tծ�{�����cR\d$�_�0U6��2���z��K�1��^v�	M� 
�L��Be�L�)3q0�$�r���R�FŚ���/g���j*!0�b�]�1���H���̺��W�h�1	f�oF�C:%"1;��@��ڰ�~%����m� O�򈌓��I*e!����$i⌞��-r6��?�+P���A�[��S���U��%e�uiQA�W�缷���^K(K$ �ǘ���H�<��|��RLI��R��ܖp+����[r���$&6���z�i*@�Y�y��_\Zr�MV3;,���ͬ,oԘ�3
�A�N�����Z��1�N�zG�kKF:�=��s[K8r��gZ�6�fgg_*�1� &���'}'�K�`$%j,��m-q��ZT��. ��F���N�9VL�E����;%{
�牠��˨^�Fz�W�CϺ�į>��UG@�g���LkZ�/6C,0P�V	�r��HJ�n$Z1c���5�DmI�����\�QR{��^1�Q�~�o�"1_>A�M�C譞�S�#��������@0�	~$�1�7Aߗ�{g�� 4Ԣ�H�+VZ��@�PY���,eŐD,�
d� 3q�x���DiO���D�j"z�t4�B�F =����]��Ƒ��V�e�N5c��AØ�hp:|c'�L/ܣ�c%{�h�ܓ�6�1�L�qڸ�A���(bL �V$&��HGQ�����(^/�a��D%��h�3N�x��#`ұU�	�$���=���&���p�#i#�1yKu�m�gI���y�����=�� ���;OFҋQ��}�	sH��\9`�qsU�wMXUk�h+Xc���x�	���c1��s������5B�f;Ɖ5�R&J>&6�H�<�S�M8��I�N%����T���Q|���t�RE��x���]8��Č}��%_1z�E/��9�8o�oc&�P�)����UJh;���1��M��N]$҄\t�$Ê!7��/��YZ���C�+���
��]�H�n�\Z��AS֝�?��{Ri��X���>�xK�n��T���h�����0-5o�UD���}�Ƽ�Ce����h'Q@��>e� �0�?(7�2��� ��G�ѩ��h�NE�-!N�Bk��*��QQcN} �*����,�J<S��S�P*�{�[�s<����J=yʍ�@��{1-�_���{�5S@��6�V(��U�&+�	�u�F8��?���m������a�=�Z��CKu����Ȑ�Ǭ؇��_�y2�����S �K<�I���W��K���h��yJ΀�Ih��8T��o�1i+�g����'�D��aY�V\C�i>t15���8!��<�M�c�s���=� n JS�If�� &u8�gg��XWR�Ȝ��jަӏ��#��&I3�V�Z@y���X���}K�}!3�m���ͧ��x&���7����@����u��p	c��p���7��4��ҟ_�vF%���z��ZC�>&��V���Mp���j��\*�ʮ��e���JF����t�T�c[ʹ��r%�C<�h��#��,s|����(QƂ��UBE�X\�&��ZU(J{U�I ��j�1X��\�-D34��]L;w��4x`�u�x2V�4ydH)�v5Cĩ����X��z �R���:�J�θJC����t�C��ܜ;�^���RIv�8�Z=Q��]�H�5Zh��X9��w�D���~��w�Dv'�¯ ����jE3���t]��]k�%�{��o�"q�z�Ԍqpޫ�Vs���xf?��1~�=Qa�`�64j�<�y�@( p�e\/k}da�s?���X���Z�42�>u������Sv�inO�uRjjԓ�9���\䒁!!�T����X�}������h4�5'�{�R���������_b�cMSꑱ��ɡ
k�Z8�b���z2o��e}O�d�)��3aS������-���[�"��F_�6�aH��Q�._�@G���j^�0kh۠	@���+��4"�./M�;<'�a)e�g��"��3�[�7��GÎ�ᮘI�E�q٨��R��*̻��fpXn`xT�v�=�m���T5�Oy��QFaS(s�"�oAǩ_� ni��3wl�e;N1}��U0h�Y�^2;Dރ/H��;Ƌ!�������_�I!�L��~�\m�4������t턹�|����o]R�����h "�"�9�*��ǂ^��_����t?�K��6�X��j����@���~�%2���{���[���*�\���Fߒt&歿��e@��Z��+��'��w*�g\���5>��!35z�U׹�R��4��q;I}>�c��s�PW��g���(���]��.�!�+A%dT������K͜^�aʭ��~)��#uY ?��дO��1���De�V������?S�$���H�C��VJ��3��u��e]�O�� �J�$xwj��p�E�ZK�*��A ������̩�X��&c���b��?��=��ꩲɼ�'�6{*�\��Қ�{��(V��0LX�6S�s5G"��@��6!��1WT����.�p��}���Ѓ2i^|�TG@nL��$��6>z�Qcp,��h���ʏ��a�S�e@*�=�w��A��dpڰ��Q�P)������&��I���<�N��Zc�9_�ol�zD����s:��Kf�BL���$Z����y�	�(�W]V�`��~8���+Mq6m��K�_{y���y&�;���kҮQ��e��	[�Mj�ĕr���x	�ʫ{�����z�3>����v�KW���J�1f�&�ڭC�O�pga"��Ŕ��j��I�&���.����t�����C�|����]��#�!܍?K��;��:Ѳ.���Y2Aܬ��sbj�x�}S����7�j�\�}�Φ�J�4�惲~NJ�I[H&�ff�7�X�x����ؽ���Q�Q�TTv��B�'��rnubǯ3��F6%�O�����N��p�$I����pJ�:4-NI�1�($��v�������t"���bha=L��s�0v�0�I}�@@�z�i�|Z�D�ء��-�~B��#9����HM��pE�������m�x�������t���Z�t����6e��zV�ǂ�[����ь2ot7�Jʍ	|����ER��o	vo ���7���ZJ��T����8@^�v�]':��lP��%!�A�[�o&Ѣ�Seh��F���Q�TU 3�T<w�����
r��{j�'�(+u����ϵ�h�;��ἳ�2	��kj�_�����{+��o�IP�6<{���!�F�B�[�"Z��_�R�뛢8k
8��A�����+~�F��G	u��R��#�1/3�AuS�=sKp#pL�vDj�4V�I:j�Ҝd�rz<l�Y�uy8���R�����`c�{�M��I�M�J�-�k��,��,��t9�j]�a�gp��VH�tQ"�3sO�날~�c�l��tWa�t��T��5[�~䣍�C����PSz�F��5^U�6P!Y�U��=%��\�Śf�%f0�m��xj~AU\��9�v2���P��~���i����7��N���l���9�/�(�ǯ���j��(��)b�G�z�&�%ی�z'Ō���m���P���Vu�h~~����b����B� ���&ެ��z8�[P%�YPU��@D��;6w`��߁�5���8]��\i��w�8N�Z��[&7Dz6˾��CV�L6E�Xї�<{U.Y�XB��R]�V�bB�HN�*�6Q�?��|�����ʾ��������%�J�# ��$D
E��U�E6�5�{vV��{��t^�@1+����|�"�ݘ����A���t*����ϭ�+�Hk� 1�v��{Y��T�D{*���g���V�D�ZI�g�q-��4]��b���������N�9daPAb��"i�y%Mc�d?�@�����rK�Z3�$�Wm/�,`J�x�&z������*�jt��L畹k�gP�t�k��WC΃��� �)�����(!%��Q:��3�k<C��>��2;:/�\-��C�0))U�;�t҄Z1U=\]�P-9	wH+q��cD��e7�)�7/���H� �v@Ȁ[��`+�"�BJ����n�&�����X:I�����t�M&z4~/�/غ�
��=�'$�F
�Q7��A:EH�w�V������A�9��b>Cǲ&9s���W�
���(�i��4��L������N~�J���1O�EC�F�VZ�����|�� ��ʗ CH���C��j�)�i�vkf�$����iz�?S�i K�*�Qj��pB&�&c%w�jG1[��/֞)*S��t��/��Kx^ʢ�,~֞�`�c?U��{����rٵ���f"�t��D�'bӏh�H�F��ƒ�\w,�!�1�_�Q��~�L���������͋wo��z}����g_=���ئ��_`bQ�������غ���犭^��)���%�6�'��צ�m�А�.?�Aҏ�!��:�Ʃ���D�´���f,�K��Q�d�R.
�(T��ռ����b��II�`�%�(��̣�%�ŋd����ɬ��do`�`0�"�-�p��� PQ�330601000100040762maraton/.git/objects/0e/58cafeacb8649b83ab2feadc53d741788799c2xMQ�N�0�j�".���DC$.H\�T!�l�!�S�i�*�ήݗ�J��������p?�^\iS�C�Pj�C�U�m�֝#������fFu�{U#���	&����
�N
m[@M�s9RGm��x�~^��|fs����:������Q�ug#/��41��_�C|�bɂ�ޘtA0���X�@���ɡʸ�sv�;m���q��WڕT-�_UЯ�i	c�_��WG��%��;��~=������s�$����.��]~�r�b'�a�b�}�O<RT�i,�&o�եv�h,���3�%d'��S/r����@{���u��������~�����f/#��'�-�`����8��k���R6��xf)��O��c9�����G�W��vJ��RD���֞168931000100023maraton/.git/objects/5b3306010001000166962maraton/.git/objects/5b/9f2a1cebb836496ec65f108f69420e141569b5x��y8T{��U�е�(���K�5��*tKe��̙q��s��d�TJۍ)��]���JJHH�d�RI%-��D�;�9�����y�������{�{�gP1N���PHT
e���4*�� �`��8�f�����l���9�(�����:����_c�.X�W�w�f[���Wo��\�X!��k��z��NMf����-jۥ��K��2����#�ՙ\�2����o�Y�f�����'Y�&q�>��OL]8Av3->�x�"�5� ̢R���=e�Eo.�����C�Y����Pl����(V�C����ol�L�;y�@w��
� ���������{G���`�&�8 +�Y�# ����g,n=�ɟޓ�&��|[ͧ>Ĳ�Ԡw�ӭLK���;'�J$�!�0	(�@��㵊�#1s�K�Κ�a�bI��Ҳ�r{�Z�V��	L�+<�מ��|��g�YK��g����=#7��ʮ���@�,$�bX���~Zqy~��נ��e����IڹQ����$��,e����=�s�ަ�� �(HFe(iG��low� -.�?#%i�T�D�Bv޺�)G��.�R5��4z)��2l[�6Nm'f&/�����H9X�N;��"!�L�K�H�ߧ��9�,��'զ&\�A>�#TM��>s�-�˱}���&ۚZ�;�ˍ���HU�/����gGOg3�j�\KZ�qz0����YZ�=�ۦ�K�+]|�In���!6���U��69�5E#j��'�C��;6��mK��-�3샷��e�f=ad�k�u�ѹ�/����CVo%���^�b�b���7��os��6K��{���^�S�U_��RO�S9�i��mΟU�Ɣ�p�Bo��}j����~��D�B!W�<{́7g�N�G*i�61I&��"@������j�g�2#�3W���N̗@8@W�+�ռ����Knt���Z&87�÷�����s� ����v�+�jgj�N�evZl!,!����uu��o7��5`90Y�J�u�7
�t�P<�!~��7�Kӎ�S�wF���K��Y���R�׮P��5Zjo8������X�5����<+�U �͈�C�(��4Ab��>��x�PW$_ڸ"Ʊ�W�8L�I!����C��Ȓ��2��y�=����G��WÕ2����P�N�/����w� Qp$�p��]�����V���*�/噴R�?����q�H���#�n��{$�+�<Gw��)9�_oۑ|^��k����⁫�]巢g���� $��8tT������g��Ǹڬr]��P<��w���@��j��v��%[/׊+i4]<8�PbH R����'W�o��OM|�9bm�o���E��|P@�CJj0p5c�V$���Z<̨{���;�X<P�Е���&��Xyb���ڷ����N%ǆ�0�ʵt%���RM�O+�G����� �*�"E�$����M�ݕ�V��;��ʗ� ��������X;�(�5>�#�ܲ ��X�a���~%#V��v&�S���tn�%�,�9�X*Vv"����������*�}�#22����u՞��l c��F�ƕXr��4@!(C?�`8����H7Hch�h���2{��T$)��*]���	��w��#�c뉷[��(Sh�330601000100032962maraton/.git/objects/5b/9e804e944fe7d6f6ced1b804594f9c959c27adx��1O�0�Y�_�
)QRڤB�*ҍ�����^[ױ���sR	�������ξw�TS�~����Gآ��m,���8I����EX����
a �1��l�1'���f��tw̰%�U���&��Acq�e�ܗ��E��ǗgD�km\'i��W�<J�0 u&
\%��א�_�Ϙ8�7��@�5J5��{���N	�����"븋��"CO���lxq�&�X���z��8���9�i��ݔ���t�M�Q��P�`JK�a�^�>��пϙ�1��c���(N��,��r��`	Fx����l�j��l<0��_~�1��168931000100023maraton/.git/objects/ce3306010001000182062maraton/.git/objects/ce/1fa859c337420403e2d7e398da3417d2df7d26x��yT� �T@�� 
��DBa����,Z�!��!ۘ�,P�E��(V��r� .���SKE6�r��,E\
�R=Y:L&Z��s���������n��Ap����D�P\h�5T��3@f�0�?��%𖲷�V��p�����E���*��aaB�5+���v۞��*I��=r������הc�1��iQ���գ>aI�ѧ��GR��54��f����Eg
E��M��%��p�4���&����	�BuQmҧ,��j.�n�����f�-av�zo��K�I��7uU��mҗ�g'e���,Ő����,���Pع|L�������g�EzI�"
��YT
^�[_�rŷ��F��
�=����<S+6[Jq�(��KK����q�o$��K�/=9_�1�\QN��Ͱ��l���Փ'ϲש�8 c�,���,���������'H$��|ߍ�8��-������6[�>��V�D"�8 ���;����5/~��f��=���(jj?ʝp�.<��xG`>����|s��o?�q\�]�=i���!��|���T|�{,�x����%���3/nnL��2�[mL`��iIi�<�#ɾ�Q��y �dl��e

`>��dT������!�=ܶ�z�E���-��j�1D�朜�2U;)�Y���ie�?�֘�k����w�[^������9�]��"!��-kB~�������ڴ[�Ѓ��b�|H
�cTE�m��|���x�a�'��[~8��p �C���N��mi�S�X�f���S����S����`v�jR+�MtJoot�{�H���!6@��W�A�H/��Ў[���-⌺�	�9����t�!�Lk��C�����6n����x9�����@Z��	�{�T��/a��A1�����8?�Z��;�n{��$��ǣ��v�O�g�8��8��� ��yW�[���,~���<�&F��RH%4
�Y�pe�t*
O�7�:L:�Y$_��/*(
rE���C���'�7���^��if3��u�AB�
����e���A�zS��}�*��C.��Q�@�g]'��h���v���"�M�[{�!�6l� �ۺ�}F���f7j�A�w;~=juHm�����涶��x�u��I��Uڷ�ڽ���#=\!�HK:�1^J۞��D}Z�ӯ6B F��F��.�Q�~Ǣ��|��9��%�_�/�G���d�}-�-�o]P	x['�@��Tg+��C����oNm.{Z�(Uv�Ygs5,��}"�AAXU��Ud[��Z���N�,�-�	���F�$��"����:^�ó] �B ��@l�t{��Ѽ�t�9�DQ]EϬ�j:��s�{nl��v� G��������f���eG�1�w�����^���W�}�5Y}` 3D*�Q����(���mŗ:^��^�ݘ�'�DFXG$���i3`{�cCr��Wz����¦>U+1$ ��A�ӛ��,5�J������y�D�|P��CJ�\!��&X�J��?�l>�E8�X<P�0�	�!I�� V�Xw�Ց�#�r�ǵ��ǆ�0��k�1����v]�_[�_T�Gf�Q��Ǔx�@U/��7���:p����� ��)�z&���y4ż%*0�` �ܷR#A�"s9�ç�l׮�0�xtu��p��%C�-�)x����0�b�`����/��N�P*Ah�`���~ŋEP1�#��	^��E����f3����L,���x��/X����=�I��s�vy�xT����sŮXTwMl�4D{���V87S���W$	E�wN�+�xsރ�Q~����9�ݲ�3���330601000100022062maraton/.git/objects/ce/93d412d7d2488ee692ad8af1588bd0a2c4ad43x]P�n� ����M��I�,�K���	����H����4�vg�<�8�#>���CL��t�>�����-Z:/�;�Z���� ���;c�� Z99�6�e�D�0~evM�x�������"NJ���x=��2^�.B� �4�\�5���9[��{o�����-�jKT��f^�[��d3��LT�k"LN�e�+�ښ�'8ǢX0�o�<k�168931000100023maraton/.git/objects/e8330601000100015462maraton/.git/objects/e8/d17f8014d9fd5571e4c900c19211bb8de34d37x��[
�0 ��)r�f������P�ISϯ����0Ҟ�ǰ��4��MQ��C��\
�B	f���`���5,ϐb(5{Q#CF���%�J�CfC�XZ��u�ۏ�f���Mh��E�}��7�Br�]pў�96��0K[�|�H�168931000100023maraton/.git/objects/153306010001000175462maraton/.git/objects/15/0f53fe7f3ea5ba317cf3ec5e9c70a2e499d9ccx��{P� �E��ey(%H�������R�*V�M�	k^kv�,�PyY���HA[[
J�Ry	���i�T��*�:Jn��jm���ٿ�ߞ�o�w&��Vyz��:}���*��i\Z�"�k�;��zp
^�[C"O���߮0��)����}�\���ȏ�2�*�ѡ���p,��~�����0��T���av��E/�̯��L:ݐ���(4w׺WY'��Z�]�j#'��C�mŽ��2�Ƙf�Ϛ����Ӑ����<�񴥁wb�z3UkQz�7i��z��d�iR9�,�g���DoG6����{QED��A�z�zW�e�Ǌ�Ე���O��H��� ��$s���6���p��e�'�Y[z]!��Q�Fc�c�5QѢ���ӇJx�H������ŕBJ���찡�Q��b�p@Ax���x��@��?���lh�����sRI�B��[�`u���um��7EӋ*
�[� W�lj~#����;���z�ý���':���&����F}���5qϹ����8��� ���\!,�ؔcə����Fd~�}���{��R��ie�2,/:М���谉I�W�,#"�h�
��e����=��>K�{��<������=���XJ%�8=�}���Z�_��Iw����lQu=����O����+�I%�r�4����xR�����Y��kb���`$K4��}��:�&������ վ�F�AA"'%:�l�\�^�c�d1�s�w3e����`*��,�P���������`H�Z�>�S=�o��������uǃ���Qo�|o@��W�ޯC����듒�a�r���}u��*��ms ܶ8�~]"2)�@2"򾇧�O�]�_|�X�������%y�ǣo�T�H(5o���n7��A�kW��sm�{ady�c�Z��� JR���j}?լ�ktOɲ��)���%�����}.�j.Kښ�t�������!"�.P��]�R���
^x����ضr�K�o_�(����T��m��j4w���et�'|��׃N{I+@�;Xy��{y����N�v�^a|����/
�t�F��~p��J��EǼ�k�u�����I�!�����f'~پ��!߄����$q���]�-Qm\P9�k`���t�o�8Qs��gl����^��?*�9��F{���C�g�Mŧ��+ײ�����T5Md#��K��v�^�q����k%�� @'���Ga�at=)��|�n�35����Ih?İ�o���<?�Q����ء��ܷV��0�<��z��	X����Ս�|B��t)PsE�L#{aK�ga�Dö�謢o����{q�{l�G�l��$bG�v�����kv�ڌ8�'K��v�ͼM*,��A*#s:�YXf���:�����TR��D0��6b�I�cT����Yv�x�"¡�B2��O�6i�������d�*������P}�̦���l6��q�>c��)�!�b\ Y(��F涏�E�8~���Uշ���LEW|q}�}^����[s���
u+� Ë|fjW�3����ī�/S�n{���,,bq��|�5��L?���Ŗh�����]АzgBjK��/�y��r#�a����m�*����	�Ue��H���`�����"��E��E;*�H�R*��yU���� Z@���[����eWo��	C�m33060100010001013462maraton/.git/objects/15/fe810f9e2ef0bd401f0361e89df762ca7fc841x�]{wG���J��;��Y�b�� �WV�D�:������p���`������~U�=�+{��J0�]]]U]]�n���H�������=���������x1����o�D�cq�B��=z!�s'���'�'[��;��oI��ޣߤ�z��m;�����'�mo����i,	������g/�>&���Ķ'7`�v~3鸃�=�-��z CA���-d���	#��U<������{�\.���\a��0��B�������Oz�ͅ0�|g!�ֵ\��Yb����H�r��$��4�x�(�h\�T�(N>Ȱ$~vn��8}\�N4v�����>-��:�~I���]����R��2s�k9Ǉ�-�>���$&A�:B�3�(N�i��Ǳ�4R��=�^�\� h���$NN_�TBh"�i�x�v�a2Ӿ��x�w�7�6)	��bϙ�4/ٯ��V�@4Cb.�o�.S9��(@B(ΦP&���\=���p�Q���Z�f�^�H�������1�^λ�.4�^�p��4��e�R���-S��U�DUv�����J%��j)���&�8,/��.0��ơ�$>g����L�ɇ[n�n��rH�3��L	<�k���Ս��iD([���n�ֿ�_O��`�tb"��|��/!�,��z��eg_�Y˻�B��8Y�j���[�bg�@�jD��c����� ��x��r-f����m<���C_�2_D(�}+�a��W� P���#T2��rg�g$S�T��o/.�FQ�R@�y,C߉A%?�Ơ\�W������k�o��t��Ӄ�K���[�m(bK�P��4�s�,��yE�&���o��z��Q�Q�����?���ժF5��sͤ��P�2_ ��I}��2/�� ���\h"������C�<�%h6l-�-�Ւ�&������S2�v��� �^O-	�㾥W)I�!����F7~%W�5�a�
�*
i��
���dN/.��y�t0�2��vne,�a�P٣�$���.C��s7v���@�/�J��F�Q�U@��Yy����/C~������`^ib�*�}�{�{�m[4�\�8X���ʛ��	�ݣ�ߘ��8�r�!�clI;��!�>���ێ��E���F-��7!�bܰVH|��g�Bk�FP�����/f5d�%�$��ER�Tx=\���ᚥO}�k��c�\E���Ћ��П�`W^�A�+z�����V1��܍ַ23��-�G�{�[<�cs�xsiC}����2X72,��}�_I�_��p��_9�<�@ 
�_E;��-�>CS镇W^/*ϥ?�g��ӧ������Щ0IO�sN�wpL���/��~��j��/��Vo�W�x�q����$��w�Z�u�a(�U���k�?��e0ܜ�McÒn����&
PF�A�d4���1,�7�x�|�%�(&d��2l[�-R&�q�&ʒ�@\b�����é��S�Efÿ����E��N��!�����v���t{X���B��Xp�񊶑���o�S�k��i���P�j���� ��YQ���{�e�ԫ(�d�7
�5l#�������-Z:c٨����@�	��6o�>��-��������9�Zl�(/�[嚅��z�{:��µkuA��zә��$��A���,��Z6v����d�|yli��Z����0^H��g�����ȧX�X��*Ī0�S0��ov=�������4��s]x�B�>f3�[5_�S�7O����*&��$ݳ����D23 ��"b�2��`o�o��G�vV:��&��y������>Q=������X�{����Dg	�\S�R�=��N�LG�J�4��z�UÚS��V��G����(��o�r�`��珓`�`��.V���K�7p'��8v�M}� |�����DA`��t@�Av<V�{�BUZV���c��PN�&+�y����pWl,z��W�^��ng�) �z`�m��~�2��^8�7�L�&X��:�I�T�C��҃-.�3R��w�0�Dϳ�/]�٧z!6�
L��p�wnFNh��`DM�[L��iH�o[����^�I�B]�d��D?	r���J���=Z���q0�wC:e�,#xIZBUcK��a�R��eZ��@
&�G���%-��Ieڈ�����]=�j�M��b-��0�S�V�Y^f�k�J"�)�z��S�0L�H�W��vH�`���ܛ)C�2���[�"��@�tƈ�h&���d�jg続��hT=
�$*R��<p  �[#�Ǌ!��Z��c��2:���	rCana�&ɲ7A���u�z��ғc�X�߾y��ū�TN�^e�m���p�x��"B��K���s9Uqqyr�맍���t�I�6F��\� Ĭ�ޞ���L��&�DZk;aslr��ӷ=��g��^��1�UŘ��ח/..������q/�%mShm��V��%��?F8�o}[,<N��A�[�%/�R�������m&�`#j����3�`�ݣ��5	�mPo.�
�!��jP4\�d��*+d%��^K5�5QF�1i�RM�~�}Ι�9C��7����l�?S�0U�=�?L;���fr��#0����d��v}���Po��/ŭX��ʜ�)��0��:`�~?;12���dh*0��"�1ƚ�;�^�T�R�t�����mv5�0h�� ���όoT���*��J����y�s�l��R��.���H�����Uh�+륭=�Bc�A�tU8j9��c����y`�t��0�o�X��;�3H�}����8�=RL�0��ܫ,[�3�E�>���TN���ɶߊ#������MDC/�:�0��;AK�C9ۥ� (|-މe��o/�I�]Gqp�★w�݁p�y���5�����N	)����Ҧ�E��2=\�e�0��������w<�\E���ӳ�W������|>���_�9>ȤO5��&����Yn(����S)�}�����ԃ1(轊�<<1G����
Jp*S��g����-�
Ы��Em��z�
d�J��y��mb���]���D�b�h!�B���Y��;�`�r�F�]9h&/E�O��gub~V��2MF���D
�?T-�&�`�U������d6<�G���DZ٨�F�t}v�����-'� Q�kGx��7X��A�yD1�cn���U,���%�s&��$���w�Z�(@z�:{�V�Ss4@b�!�����,~�a��+ʺ��ʶ�'���;a 0�uOOi�9�)(�+�}�yU:_l�b���(�`�� `t�L�.��	�@��`4i"�[8D�8��(�@	Y  B7�l˹D�]5"�Yl�7�!�f<f���eq	',�"b�4#lD��nAY0!C)PP0�!殇➑-��FB�`����sf͜��>���p�h��*��7�����B
]� �i�. ϭ��,�I�	��@ O�R� �9,˹�Y�'C`ސ����IÖ��	cP=�An ��Lg���o�k��݀���
�W@j
8 �	R��b�W��'sy,^�?���"��H�Zg$$Ћb[@<O2���j����p� �X�eP���DS9-W�4�ԉ�$��D@�w�
���[#6y��*�`��^������ ��y���Y�"A�+�nYh��L�w�Q��/�`�	1s�I����7� �V��W�X!�m@%��O3`��<��C���)x��փc	��s�=�@�&>�
�m��L�nbm!`OA;��m8�4��1.8�U6_�=b�Nc�ۮAcհ�cv�q�x�$�DM�Q5'�b�q 5������>�����Rq���(���5@�Y�X�_�U٤��v�L"��^��!�fȏ,��[H8����^bDْK�$�зT��K��[�ΉEɝ�7{5"�4(񇃢O��F\[��>Q����sgӃ��t�3�����ID4o�k�"S+3f۶_C�T[��	����X>���\��� _9�m6�`s;��/x�`���<�b�G���`{;���lX�~1D,���S�zِ��[+�a+$ I�����+o�LIa$A�A�$�b��������lK��N_�����.ec���mSߤi�Y'y���{.0���d�TO 26�qX,pl�[��..d�u�r�8�-ޗǫ�,�K����8�z]��3�)<6��q�܌e�}���##Z-~(��VO[v���b�t�J}��YWX?���J�z�ƨ?�2�O����h���K8[:vgÛ�ܬ�ҧ"��͞]�����R��1�1�nJ]ʠl��A��� !�Ȋ�U9���S���)l��i�����T�Nb�(hQ0��I��Ϳ���V�`m��O��u�y�J �?�is�K�Z��uV~LL�=ۙ#��EJ�`��Krp�܌�n���+}��J�y4uZ���Q�sTo�GU9>���N��i7�Ϣ~����v�Z����zU+ń6����S���U��iT����c�R,�dK�j�Ԯ�נE�;����!D<|�j�0E�ӱ����Z���6�}��A:��06SH8�/���4�H�L�PN3����hҬv�ãj�SkO��zݝ���:G�f�u?���cQ���NzCk�_�grR�W;D�����|ۮ�m���F����aZl�<\uD"���H�!\L���ۋX���s�3��B�A�� ,��{�����^��ԣ�[	�0z�T���|Vz� K��k�+p#T�{(kuB��������R���oջ����)'��;nL�ҩ6�vs9q��a�u�wg��r�sI^�}X�7����բqd�:�v�%�]�U4(F�7�����"y� Gq�B$�I�bX�$��v�[$�	q�`��������
��(%Sa0*Ӎ�A2A�P9m�q���d��P�lLH�_'�1(�p�)���HEh3���x:�A��YtH�0b|k���(`���8���"��w�T1E>�C�M(�%��,��3���+�2�n�K(ǧ?�q0}��H��áC����+��aKV����l�뇘���i�:�N��m�e}�N�W^4�"�	�����|�%��n�֭�Y�*�?�w��)�<~%3�DwE�5i9�#���HQ�[���L�U�4bA~��A9��dy�n��3R$	5.��g3T������WI;V�Ҽ�>Ry�/�m�J}��UkP�G��j�ۀ�2�;wS���Qc27G�i�'��teU�v��%g��\8�N8iU��ZdZv��t����~E�J�3Ŋ����<ݚ��ǀmV�U(߿�=�֨:i��z�>!�ݨ�;���9�7����ە�����0ўA���PB߭���]&-jʶ�X[�cҰf߀#6�5�Ω!�����j��*���zn��b�4������������q�B�#B��	� 
���l���߹&�G�}�m�Z��R���؃**�ߨ���\�Z�t �A��8F\�}���c��P XD�U�MR�ke��U�ݙ�:k�|Ȝ�� pt2
�_�ד�d�r+T�f�y�8Z����r���H�,��QF�S�Y���(P���,eڦ�Ѝ�h{/x�H���t7��$�H���ǎ�&�"1��iZ�y���i����V��L��V[��F�%;���hv��q������n��N�/vZ� �����s��g�@�����M|6�w+�ƨ�vG�s���5��lWa<���q����e���f���߄�\ʥ�����&}ݮ�D�t�VG�j/R�$�H0���G�0GZ�p{�[�XVP1MQ�z=`�(��� Gs�n����_}�q:cD����F���V�Jc�c��j��$��15�ަ5��t�&��%����\�\'da9��56���i�)H�_�F%R�&fIF�i\{�����p�2qF�gSmK�x�D��.e.�z�cgֱ�;�dM&FI�L߾�k�K'��?��=���[�#�����aug)�����g ��*�)�����t�?�����f5o�1���.=é-���*�G����9��_ -L/6	��yh��~*�D�=d��o�M#_���Ai$�%*n�M'����g������{��FQ����9Z�� �Z�:`��g��J���2��w3�!WN��B��~�>�t�N��dv6PNdr��)sP��Ϗ)<	'oR�Ts)��S�P�ؒR X�=c6��'��N��27�EN���@�֨�3@>�B����W���N^��10�dNPؠ�=1��Zԙ�V4}���:F�.��FXAD����+�}�(Z��;�3��Aˏ�`����hW4q��f�$���w�Ƃlil��$Sn�ClW�%��$L?���T�t�cZի�U��ɕ�s�/�fU��g�(.�Z�����(9ތޫ7�r��}�l�F�N����$91�j�8XP(G��K�D�A:L��J2)���O7g�����u��?�^����b���p�+j\}�C��3d�nd�������O�$#����"��F�h&���4� >��J��>Ζ"�sk�-G[:.�E��3O�t��%�Z����RQ��~���1�Z��`+���D�Ї������l��P�)b���:*�'8��"�J3|�'��j��;\8���/���sP@�(v�B���"�Y��S��#���E��ʩ��h���t�5}8ٙ�����f��n�s����^��V���d��J�)����P��F���N�g*��;8��LD���5�z��OJDx�Ԝn_Aj:�oG�O@���
a�"�^2?�[�"eG�VyD��T�{����R�����wc�DP���U�)�� ^�]��h4��O�a������Og�߈����7�>�?��>/�~q	K����x:�i��s�?�e4����(����B�G%�8�r�ȡ��%MЈ'>Re�*��|��ǳ�]�Od�ࠐc�W�.�cj��/^�4�hV��i�+�zh�Y�-�o(��LF.��9!�;�ԯ�'=�{�O�I(�Q|��}�-*Ipu��o^g��Eޅ���7� �� a�m*>IQ,d�!'�)�sm#�������?�БUE%�� ��PdCH����!ǁI	�r?2il���ш��N�`Es��e� ��av��d�e�f**����q	<�����{�{8�~@�2cRIG��Mǁu�(LF��*��i����0S3���3��>��'`w넔�a�1\,c�V����,��i[ 2�
.��l�5p��s)Z�!�X7��qp�| X��?��"ۧ��j%Q`��+p ��q�?w����M?3)b���(�H\���Ҽ�8t��^"WL|r#p� )���[!��N�CT͢/G�?�L%�`��@�����X�Y^7`5���
8��u�����y���a�&/6��tI��eG�1\ҁ1�<V?*�s�����������pÉBt��#pZ�S��	�.Z�g8_�C��
!1�J�F����YRl���OL/ȭ�⁾hbt�����&�e*v���e�X�����@*�Z��2B8�À�r����6:A����V?��Q���R�uM{P�z��u@wژ�ɝ�>���A��B��(<BF�2��3-!�Vd��77���K
)�h�˛[f�
�h�u��BPM��A����
�J#S�I%�6C���7Sm����>�	��gd^� ;�n�ȜK�%��(&c@���Z�e�4d{���u� P3�Ꮽ�Ѓ[��[��3�O,y���yTku��}�)�	w#=	�g�"[����K�h�}C,�4�&�B�k �y%�9����ٯ�N��ڶ�Y�.YI[ZyS�˘��N9�m��eq̦��G�2ѭbj�a�+9C��i|��=��$�D��`��I�W��(}W�?$��DEm�GLQȪ�sN�P��Ѻ��H���Y��W�2��ƅ���k��!ݢ"�C�oޯ�[^p�Q��s]��B�!�H2�%h�<=.=��P�����(<USxZ�EX�.�I,ovH@~0��[�6�́m󼅞�9,������6n�̇�.��I�ASL�!ԤP��W.(�ƛ��2���Cm��s�����L��
� <p�VC��Qq���[�"z��ـ�j��l�=>��6�l�KS�.~ 9���������őJ����z]�|���k�� &�1�ķ�ە^`�}��
�x���h8M����ic:Չ;���\��	.w�������m�N�{�s雷, ��c���T]E����DK*��݂HAZ���[е�P���_�W�~L�3)��(J �RbNopҶ8ȥ|t��9���Au^.��P�C����y����=��2�������rp��i���D^�B�ٽ�~�t��]ܘ��EUhT��ժeܷ�	!�S��u�p�ĝd�DI�@=+��Ø| PI��i���ޓq�\�}�4��5zK�dE�� �[��(C}X2��[���?[��Lq�2
�Q�����<9�W z�E_a�<U��>^��2(�J|D�ƈ�]�x�,�L���┳� *�w��'4ǳ�<rD/I�tF�"�d�+�`%h.����8��hM�NǏ�һG������/`�~0tQ�ؔ)<P��"o���x��K���*t�އ�$z�W�t�\���2��œ'"�2����;���,���fT��0��7u�:L�SKLܧ?~`�OT��7!�"[O��#�l�G]
{��4"(�-?i����Z�5�28n���22t����?�T'M� �|<�T�ɶ:��ǽ�9��]�U�鸜���;�:�k���v ��� �T?9�&O8��I�Ys�c$s@]��#-��4]�]ro|b�PMB���Cl�xיSYQb���-J[��(H���
�׌��s��p�)�{cd�׌����`I�X�WL��aԷ\�H�Q��lA��?
T����rY\����O��Nw�$׉o�;:EZg���
��5�Z������<�Jz���tw�VC�2%dl6��"�ҿ����kD�e�A�h���M(q�?U50Wx0����K�.ڈ��/��k$q��o��!YT��ҕL#�� 0�-�@�iPc)�RC�cq��qQ�b �WL��p\�cx�c\�\�� �Ψ���J�ҝP��&�ż_{���g��'�R�������ϊ0hL��4�_^�5��=��s�d�,�������@�+*��3H�W'�_J�3�K���^)*�i),9���{��"Q�p��mkʙ�]a������[�{�~��g�a$��i�~Y���?�7���Y9G��::�P�6 �w�W&egWp��у�A\��V��X�̹�~�e%��ǋ�ģ���[�p�m�Tp��x>C�s��S�'���~�my�����]��� \�]��������ʴ��p����<���'�J��15��7�C5�*e&r?�"|�8e$�v�d.�"���W޳a>Ո�ܟ��q�
����I�ά<��ӯ���<V��8-處���u�S�?���n��l�J���{�!m�����!���MqK��y�1L<8�H��x�Os�`"�������&�����L�-�Xz��6���)�\�1WXf��ņ���Ϣ�>�1�F���,������j���T��_e@6�gGI��(?���^��BO��̅mMqb��G�#��,�v�8�*�Y����,�q{�7/	ܮ'��8,�S��v9��ZK�z"nN]��<*���r�$�\����/�sR��uU$jP���.�)��	��P��`��tE���A9��
e�<#�t�
�-n�V�N��+8�Ĥ(��2jk[���j̄��_��lJ��[%u_;c�v���b�U�?:��굎��BӬ�E��F�ETW�<n*!�`nP-s���?�ǒ168931000100023maraton/.git/objects/8f330601000100082862maraton/.git/objects/8f/551fbfc4622abde07066506ab8c6e02b98e10ex�U�n�0�U�
&�V��@�e=�Оz( �"1�2(�]�{�p�����p�����7�������{+U����d�-�u�g[Q�V燃��F�߱N'L�S�K2�ܔͲ��<�#OU#��t9c��ZrU�E�)+�;SO9c�V��E��Kٌ\$�o� �s��O�;�G�GқM��2���5���o�҈EY�4^��Mʑyf�@�	�O!��\�� 8ŹF�NP��A}�	�E"nڲ�f���TܜrAh�^0sХT�1g;Β�t.u�y�R�cq�EEr�R�5�*��_A�J�C��R�<����V*�H!���#�)gwS.3��d2�`
9�3�����,�~��8�#�`V����7YL��<ˮ���qB��,���Zq8a{�i[�8c�����\�D
�|�	�Z�
���3+e�ӧ�t��S#r�#[�>Ϸyn���~^l�n{�?����6��spa
)�X��>E=t?MPwT��AF���
�f��ޤ�]��ʯ��:sd�I�1oVh��������?��̃`S(e�+jۊ�V�k��ܳ�"�����Zr[c�|���6��m1葙W�
(S�(d &+s�M܉���KA=J8J�R���'ɡ�g	�#�bcR��
�q�C��|�X 	ڰ���CS'.��h���I�e(?��*�`KB3ٹ�@��wΠH�BK�T��fT9�j#�Г���_ꤨ�f!�[�= *�����3\��mLT�0;�
�����̬��G��[ +�\�#,9w0	s�`����;�a�xC�Y^	9b&`�jC�r�{ӆL��cᣠ330601000100015962maraton/.git/objects/8f/e4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5x����  P���Ի�+mb�� =�� u~7p����J�S�iv-v�B��e�β��nޘne���޾K�:�%�il=�.`����E���d�?�uc����6~#\>r��ђ�E�����M��(�+�*��\�z��1r�C},�A�168931000100023maraton/.git/objects/7e330601000100050262maraton/.git/objects/7e/1e8b073c03de3f04e0b21d1429432086a9275cxURak�0�W�W��,�mӴ��@a�.�}�\In�l9�k��w����w�ww�sQ>��/�>]+�FiJLY�Jg��s�vʔ��Ũt�ҕP���}!��u}Ȥ&�c�/�΍���\	Q^V�XG&���$���Cz�j������F�
BFT���b�YMn�2X|��F�!ԡ ���=h��2�B��-�v�ס�:k���-<�����==���Z��������y@�ۭ�����>d��n=�7��_����QW-�9����jv5��Ҩ���gρ_�3�7D��l}�)J� x���L�I(�HOcՆ�����}�Ƙ,�$*I&4	���611��㇯��иHg����Ѯ�&MUH�7��D[U����P_�{� ��]ɦ�)A�Ү�,�����x�.$����y'�l<ǁ�]h��I}}�j2�6�����`�ǋ��x!�Q����pM{�6�Ǯ�=lc�b�2���ό ������}��330601000100017862maraton/.git/objects/7e/44f2bc1df11ef47d535e4e16b672a01f342528x}�Aj�0E��)f_j$K#� ��k�ȓ�P�F��}������u]*�|Ԣ
o�)%��c�$���>��j(�#�,��E"R�ȓ��b�s�q0�N��
S�hv���9\��9c?�`l���lE��g_�ܤ���1�)y�2ޘ����K�i�?m�W��>q�h3I+168931000100023maraton/.git/objects/7c33060100010003062maraton/.git/objects/7c/6b753dce69bfeec74f8fcade0f51924ea2e6bcxK��OR02a0U0�2P0�@.(�`� m�168931000100023maraton/.git/objects/5d33060100010005462maraton/.git/objects/5d/0e7b5fe1fea79d8222c252bae3e9675e520559x+)JMU06g040031Q(�L-K�K.(`x6���M�9{wk�+��q�IO�D md330601000100084462maraton/.git/objects/5d/86ebcc410f573a4ea1bb9cc7a229a2237b4674xuT�n�0���

���a@�\��E��L�Ė2KJ�������C�ClS��#��em���m��˵Ҳ�Bi]��h3��bSƺE��X���,�δdʯ+\)��������ǟO�0繷J�A��^H�5!�T*�f�"�#�F�h=(��og��4���D�]4�1X~0���ޱ������́^`�F;��<�����<[���N�ؖ�����L*=����@!���F���0�)��c���|��-Kl����ϸ��zܐ�V�2)`S��/?�ĉ�@��'�+ف�!&�V�������8��e��v�X
�+v�Թ��i�J۔@h%�����:v�=2�c�N#fU�yq���1�" �Ӣ󭎵ey��Dm��d
���.�z��0Q�$S�N���ĤNe�gJ�^���p~J�B���B]>�Ľh�<K'��o3Q�F
:�A��I���}�uz�js�P}�S��bʪ<{�S�rus��	#0Q��MԊ��tЪ#��B�U:i�ဗ�����J�5ƁY�re/(l�'}�%��N���8)��n����+�4*���F�X@�'����tls'��r�ReK�n�	�$��4��wՒ�Y�t��/���i��7�E�Ői��5���!�x�
��d�`�^&��������� �k�+{�:Z�h�Is� ������n7�n�h:�X�.����m�Z���A!��hׂ�V��v\F��|H�M0��\�7j]��������C�6.a��<���d4�,`������J�Y���"�x��ui�+��\>�%�����xB;���!�168931000100023maraton/.git/objects/e1330601000100016862maraton/.git/objects/e1/b1c81ac631e8f3ab64bf7bf1fd4ac4c8547995x+)JMU0�0g040031QHKL.���K.(`���,��*���Zsc�����"�*���3a�����/�fz'���#.��̤|��+�M�9��\�5Ywf�d‪)�L-K+ʏ�P1�u7��-Ͻ�:�mǙ~�����4�*e����m���[6��ѩҹ�u-
 ��Fa168931000100023maraton/.git/objects/563306010001000953362maraton/.git/objects/56/3465d814f00fa90fe93ef1fe3e5daa4aa8c20ex�|xTՙ��d���`������?bB�5�\ ��1	��^&��ȯff0�Xр��E�Z�����صO�ew��|+�� ��M-*��+�E�F�*mSg?��c�f2t���ٛ���y�s�{�_�ܹ�܆����Ғr�^s���e�#��5��=���V.��r�g�gL��ˌsPDZ������<��q��^�����y��bq��,�m�d}�+�ņ1���ó	�q�_�s ��������p����a���7�j�<5��N���e��M�Ź���[@�����{�t�|��'��5E�kj��)��(��O�4�%}�"�T��m�p�n!N���U��3���詵������O�vN�A]���^ ʾ�c��=��u༉��
�̟��f�Iw_beu\�3wQ(u�N����ŗ5H����e��e�g�_��^ā����׉���3���������d�wf�5��r�-���3��hh�7�+���M�;�.�q{m\j�}��n�W�����W�Q������Ŋ��1�2���X����h,�>�)����US��j�������Z[B������e��^k����JK��@�kDbњ�i֢��!���h�=h�	�[f��??hX�Wl��p����)j���ֵ�Y&dv�PK�Ăa�7@�]��`h�	�]��V}	�������ˊ��[ﶚB-+ca+����.�]��UH���F-#T^��U��kD��t�F+����Z��a��ڣ�-��Hl����-w����l�Vc��MJ%Dh������Jkq��h�6�7�H*���k6B%�h�=ô��V0��Z�4)�b��H�h57���-6���9i1�Ξm��s�̚mM..O]��J�ˌ�K�Vͪ�x)X�.E5&kdM�vy��53�%9(�Y�6�Ev!'�]��1��9������pLT1�B{o*z%腑��h%���W�y��G�9��:U?=�s�/~�B���Mڂ��1�P����� �Oyc�s�e���)$��"��%<���"BH0�	�B�����F�(ØI��T��B� �Gx�a, ���'��;B$�Γ����oW eu&��M=�<{
;�{��Ũ呜�F��x��$9��
���TK���¤�8G�z����C����>���ч'�,pj!\B|����0�4��	�Z	W_.pj'<��_��R�O�R��Vx)��Sk���}����q����pqC��f��x��(O��7?"pj7��>�S����{N�XA\�����V��~}m�y:��nY������0�b��/1��׉���k��_�s�\����t�w��y�0LB��s���?�n�]i�f���{*�k���������إ?_�](*z���k�&+v�@�7�DF���c��
�̅.Vl�m`x	���y'�^c�v?������qTC	<�(az�̣�����2J{:O�'�GmΔ��%���&���S��[W�6��d��)=�.��į�zU�WeݮC��vԸ9aM,�]�~��o�5�L�9��>�ѽ��$�2H�n�<�*M�y�od�ݦ-ڼ�ܟ/ı��c��d0��y�8V�	�Z��;�E�(Z��I���#�������߾�ʂ:���4���ߞ)��SG�g��3^��vrx��v�h�I�9�u��u���U{/�����;����ޝ�x\����O&#~��������r���a�+��E�����ʫ\�w����0����,;�G)ڑ1Y��ք�%�k/
~'0x�-�~{�$iι=1��W����7�Ap���{"������<��z;:���L��*���d�:�����]~��+᭰%��o_�/|�U��~:�M�����|s.t&%�u	ƽ@�K�Su��'a���5j���Ǡ�i��	��7��]�?�>�כ�Gm���3j�?���f��igJ�ns�.�/�@k=���d�p2��~@��$�]�6���i�]B3�R&�Q��.(�k�I����p;B�s='&��#]$$����{��b�.���G�.�\9:�q1��1���G�|o����.��K���U]�\ڠ����-���6��ک�<������%���Yr�%�/'��R�qJ=�H�(9-�{��t�C��Nҙ�P�Jds�h��L,���Ĉ/J��:���X��6�F��PqW➣���b �q�u'�^��Tn�(��E?;.E�e������`+ҬhM���!X���ߔR�Ps��sg�+�T�~�
B)eZ6���ߗ�w$��WO����S���̃	�Ч3Ke�̃"�Gm����=o0ET����2�"�f_��QU�&����Sj�	?�_�#lN{���&?#Q��Ѯ������~��f?�LS�pIx�wE����aL7�g��L�y�>L:+ua?�E�'�7a��~�8��>��?cVD�x�<"ɠ��u�TM(�eK������G�	��#��*T��;U� Y������Z0� �A!��"�Ȋy�"��6#���#9�� �Bh��K�.׉�`bq?�	�a3;C	�+0l!���{�#~y��0�E
}R�[����3��sS�
�(��j%b�1��굿I g���rHֿ�o�K�?~g��A�^*��fQ�\�#�#QΡ(Qm�<��sj�˩�t�C�I�`.B�2/��=�2�����Rb�]�JG�YC-��9:x�H-�~;&gP,E!J~(���@2^�Dao���>���M�5H2~�G�������@�j*��O�=�F�"]�����L�:��2�u�~e�ΓJ����m�?����d���˄|�1��·�H6�E�+�� w�(X'џ9d*�& ��'����c�H\Z�z@�b�Y��{IN��U��'U����2�x^��}Օ�W�|.���eG����%5?	��r�?E��j��97�؛���Fr�G���#3Dj��K<5԰�Ba�n��ďIŹ4�=j�eU��Q��"���I������+v��>b�������dŨ�]�)\�3=�oOW��C"�D�O��_o�����rD(�zUѯdщ\L��Xf^��G ��jJI{����R�|��dRo�!,�t%�/#���S��[Q2E�y��D�iiMȺ)��'�0���8�<9���kH�Y��nڱNP4�]�#�$e���	K������S��u�O��#����+�]���צϷߗ8D�
�|�=${�E�<#���r��� M�����f�������X(�b��k�W"I��]
�6���%�D�!1��4\��(�23�s�XYU�R�O	�_��J_���ka�(q%L�Ĝ�x`	�o��$Z׷K>1n��<�	c��h.z�DU�*Cy�]�9D�)���$���7�e�h�}���k�}��8��ϝK	{|E����(�)��f]�c ��w�<���$G��zwМ����&��lBt�:k�bYz��/�_���I.z�qg$,���Sh����)Hω0�<����^�����i4?�5���U�����O'x7��u�����+ad�K-�c`E�P/9́�{�������moG'��H-5��>m���Lr2��O����zC�C\�jU�1��Vw��7�����e^MEу
�Qt��U����Q$��8�_G���~}ty2?�T����A�#�Ǒ|:p9���Os6}_����h�X�5<'��<y:_rA#�?���L*nB�{�z���e��2���1����g�	c��3fX�HK4��J�x��4����[���8��_��JT\/j����ὀE��4P~�Y�O_l� ?� bIR�a2YX��
p#������~ ���(���~�J���:z�y�*�g'�x?���wN �ڃ�y�� w ~�� w�}�L\8 � �<�Xxp)��; ���I��݀�� ������N�x%��F����u������?'�G��n<�(,\X�(`#�EX�<x�@�U�n�����a ,|��5��%䭀7 �\
x08�p,�{<8�9�e�?\�:�V��{ χg8�%����p&�̀� � ��n���Y�À���3����gF��\X�P�
8p �C���j��ˀ�����ZWk��{\���!E�P6��c�p��3� ��Q���ƍ�\��q�W�|�=��QU�ٔ3낼�ъ��b�:������c"hE86nj ��v�=�6:s;��9s_�mU���i�w<�q�o5����ˉգr��xss��Q��^P�z�^��ʔ��9r�L�Y/�;p�t�|��޵J�V9�_����j+�[4v����!� ��s�}�ݙ�{cNoՁ���dע���@����"� l �1��~B�^��s���G��荨�~k�؂c�B�䤑�����K��,I������Ր���Iz9�
A� ����Y�r;ݹ��؛;�Ul4QK���ѳ��*֙��.K���6��G��~��6��@i\�`�Ż�sjD��Dз�NL� �}��@'o��4��@�&���w�~/��c�-�ޖb��lx�q���I��<��Aн���L�X�X���(����9��p���l6��N9跀>�Y��3�]	�X
���I�7�N�H��-=�'A� }$��z+��dd��@_�xg��t��@o=�?�Pg�ƥ��n�3��L�1̑}��e����t�)�RQ�� ��0�O��iv�r;x��'O0=>���t}�I���+7��"н����/��4�j�ݠ����٨��re�������^�_������A']䋜u:M��W�w�F�I��t�v��Wm��|�G��<'}�RN���r�=>���1�zз�>���@t���cVZ�_�m:���%��I���[�+��X�~��Z��N��i:�e���g�>����2�)�H~�t�oG��V�k@2/:�r�׃�͞��0襧��>t�s�;��:����4�@G3i;:�>�@�#��H���#��U�G���m�I�à��4�*�H�Ebۏ�Ӝ㋦�c&���IϹK0��~��m�#}=�����Q��Cڗ���z9�K��e@�~t�7����3�h�z��9�Y��u��Hv�=��dr���������Aϖ���F�Ǣ�;S��
�̭*�>�*(��[T��UL�.����da�onAaUo���@A~�K��ܘ�Q�m��-,wRG2���[�7��a@���	sY����{�e,^���p��ɐ?)o�Q���$�*o�q;�q$��Kw�ƻ9�v�]?�-5�_��o������H_ryG�`J�,������x������.����۳�#����c\��5�Vը������ϓ��>:�VdLg��?~�l݁���i:�"����pj���s���KY���=��'q�~��S�<���z ��ߡg��Mn�r�����V{���t��y]�	��;8�� �7p��1�s����8��9��Kp����8����?ĩ��{�3|7�[bqߔ���k��V��ҩ�%�ť��$�7��tj�Ԓ�n&�^��
��~�ˌ�P�.4k��N�H[H��6������\��ʃ:�t9�B�|p�FYZ���ii��I��S+���(�ǂ0���8�c��^>�q(��խد��\�%����cnI%��"}U����ĕ*��b�)$]�j�Y)qqw.|U�bV4��w%.f�^��Ū�����]0cJn�äЈj߅�٢W�c��*x1p��WoI��]����u�� � d�w!Ҟ�:(��q�7�('��	�Z�Y���> sGJ<s<y(ت���N �e�W7��R������:��Ȓ��d�+}��������pp-?�&�:v]��Kj{����{�t{|hv�}����V8+y ��!C����m�ߐ9����P��/�!��狁��u�ɟȠ?��㲛A���yJ�6�'!?��Aҹ&��5��8�7 _���1�8�u���iT8_��y����	p��2g/�!�a�p^��O�0� ��3�Ќ��q�3������A�������S�0>�"�����3���JF{og�lx�nB~�.�
��)|�	��Ny^��{�1�����^�N��O�M������E�)��>W(���?��~�����˥�{v~���[�eQ�gԁS�����L��w�y�o@g5�/���y4>�)؏��� p��ߤ�� ���~K�:|���ǋ�9)��K����^��}���n ~�&���EL��|z<%��;�����G��+���|x�#�.@�t��Z&P�7��9�l��uIy���}�W���WՁ�s.1z��{��R�GHG��=�v�W��7�u�v�1��[(`�� n;��K�?B}�on�����z�_	�<�Oۯ��B��-��_����`>8��j:�i�i�2��5�z��t��ՠ;��:�߯���{Ѿ���A��6���5�+��9��Z�_X�7w��[��b<z��~�������?�w��Va���=� �:�E�?�š:(߳�����&�3�����om�)��;��Q6�^>���?׬����;O�n,1J`�
�
�*���9B����KPiO<�~����Ƞ������|U��l����ߴ���G���g"�u|��^t����k{l��W/ ��xƫ�> ���%��os�w1���+��{k}��*�w�j���P��	�����p��=���a�o��~������ ���F�����M��w/��a��N�tg~y�b�s�j��Ǣ�����h�4��ZPSW��鍇V��
r�!�$Z���J�*4Y�x�Ϙ���mM�X��x�d��2Y+"-+��X������Ɗ�@s�j�77�E���<�v��B�Xq��Ml�[PaY�V� -/�b��Ȓ6���"�Y�&�F�k�^���7ϪZ�*���B�� �	Ω�ZhZ�j��j��ؤk��ü��T#7ϙSgbcլ&+�� b��aU߶�ja�l1�ҊxKJ��V����Y4;[�������-����t�B�v�~�.6U>诉�j"&��f�z��ʪ�.7T�N��fV%k����2���2��,-�-[��m!�n��]����E+0�fAC���D[TWj�w������Y7��
�����ҹ��[1cQ5�ٺ�.�JM�n=����4�@iZc��ɱKU�=��` ���)c]�M���_d������Tt ,'�VfA����m�r��j@��SmF�"�����&e��e�՜f�	'1���Q�KĻ$�y�����ŒƐ�X�uj-�*�-�Uhl�ڎlm��`(My��4������z�@��"�Zu��z�����U� �U�dTA��R��z����hd]����l���0����&(iE��=r_q��8�V��[WD�GL���͈�2l�V��'�Zq�t��3t�4w:e��O�*�>l�{2rN:k4����c'�p��������uN�zz=��gl�N��|��*tAFD�Z��D���Ӟ���4zg��C����;s̥Ҡ�\��9�ai7����]�a�anUZ�-��:�� "g��T �2FO���s|��ő��3��&^�#^W�bV}[:��O�3�K m����Η�p+���)B�TD�r:���r"e��3W�4V����A;d�N����2��LrdIr.3�$�\z�FG\��U�^�8�A7b:�߸����`k�\�1��b��Gj��3�C�l�.���"*=�gƖ�J�[�`�%�g�V��OUH�α�`�Lh�!�=���2����^"�MRP߾��foC�ꨘZ�Xi������<���'��,S�y���ӫ~2Ī_8[/�32�J����s&Y��gY;|N���l�w!pc��
c9�O�d��P�B|+$�/��(�*�E�3u�E]�#�X�
SZ�+ҷgj.k�;�E�f��9�U��D7E|$F-U��X����g�X���0�:_h>�}H�Ƿn��nO~\��f�h	w�rI/"?OV��I�D��as���JL�b�R4��;M�YK'��� sW����-��Gx)�ljq<�Ji�A��Fu�ݠȶ�fp��h͞iU��i������>�d1�yv�Q�$��:��2,�jVAL���T�7���W�d.M-���=����Q~����V���m3&F��y�O��U��-�'>Kb�f%3#�c�����8��N���"uC����6!`�x�^���1F�+�-���-cjIp&_�����h���Gf���9�l��,}��vf��vF���ؕq;ۡe����ǲ��r��t&ɲ���~x����0�rQ'���>;�9X�ز����&�?V8Bώ/�eh���tx	��:Zg�g��K/��bJq���-Sr1��N��?<�ޓ��ҫ�!O����Dr�XANo�G��*�ZN�C�@v�s����k���*V�����.�9[��\ϰrB�~;C��7�i�P��7��l��/�Ni��X�o
�C�G_d�
�H5��k�c��X��a}i�"��(ni����ݹk����suqC<��`F�bb�@4l7�mA{��%e>ć�� h��&�ˋ���Q,lŸ,^�
_��>B O����PX=47�	���`�R?�bXp����ن�^DE�h�Q�5�Q�)�dm��F3�V�a�Y|n�G1xw�a�^��9q	���v<Z|���������(ũ�����	������b�[+���P�x\�k���x.G΢_��v|�p��!���#Jc	N�� ���� |�M��qN��F߫�~=g�,�'�g�5߷�7���=�u��#zQ��a� �q���:�,@���||��||�����ܔ���X=�y����}���sm _�$h���[|=x.؃N��6�������n�����]���x���{$�� �����?*>��������
�����)��'����������Q:�:4�K�5�;�v^��L��ƣGaK�����j]�]�k>r����� �4E��q�~�'ޯ�.Mc���1�S>������S�L�Q�'p�����`���f��'��*��|��<<��n��,_������+/�f\�ç.��Y��3Z}�����Na\=�u�KB�ٍ'��ؗ�e����8kBǀ<���~X�̢���[��168931000100023maraton/.git/objects/79330601000100015162maraton/.git/objects/79/c4b9b1f94d15e6ecf49475b0fee0de02fea20ex��K
�0 P�9��Ke>Iڂ�W�̤袶�����x�l]�W&���Vł.��"�f�Egg���e�B6���蔴D�\�,��3���Mђ�4�)=�s�����F�'�)=Σ\?��2Kd�1"��Z�Ǆssm�
�u���>?168931000100023maraton/.git/objects/3333060100010001018862maraton/.git/objects/33/9242c28b04a0cad985650b065c7038145d3aa3x�]�r�ƒ޿R��a�TD�.J�H�dYq���Z��s*�R����D J�?���G�ۯ{fp�H�:�V���AOOwOO�f4��C��?l�����廓��?�d6l������HLqv*��o�=�ԉ��K�ˎ%�N0�[2����Wx��7��^����W�{��߃/�['�?���i��t�c@�1ab�r�m�1��7�ޢ����A7d$h�[��L�N�(�I�Z$#�����-��?�����w?W�p&l�>
�S9�~�����i��Z��X��dߺ���0�bK�a�� ���g,+���O&�����UE����BF�s�T�ɳ�x�Į3�5��ݭ��2��AED���83<կ���e���r�����>
��"Fa�D^� ��^��j����)�~ D�� 4������7����j�7�����ܰo}/��=y���/�~�;S��%��jݪ(����K�%Y��p�e*�@n戂#��kd4�:����Y�R�����~��i�!��bm��9�,}�xfϧ]M�s�[�h�{i�$�n�v{{[��I�j@\��T�ʟAnr�j�8�kd�ƣ�X�nT��M`<��?'.�U������\7��O�%���lJ��[���Om<4<#:����ӷ�i�rl��������Ӿ�h� �{�DM:��ȹD�%5҂G�WS^�^�"]�8c��!b{�ȏ�8���=L�k1��o���H5��-�EDrڷ�	f��H��D���ŵ;[�#�"����p~���(�k��LN*)�����raPC�ݻđgR�"x?J�)U�;�/9?�n񺮈-1�wD��0O�3�c�c7�93�쿛�`��	�n�^�����wP�kT�d9��DJ�	�+�P����gP�Q qz7��46��Ao��Oo^�x�C+A�a���"^�I��p�H�-(_=$#�jI<�D��)!���[z����l=P7�$4�	jI��Y���W��WSH	�P0O�ǃ99?�a����P�Dg۹�q8�~M@a��kSN��gΝ�ա�D_H��7j�j�ڨ��ٽ��G+PW�_���3�����`^k��:w�����{���4�X�$\D��z��ͽ�_�j?�r�#��.�TZR���mC`�,d����EM��W!�b�0WH|E2`�Bs�Q=��d�Y�3rx]�Qn�$)�j<�~_�h�ҧ.�F����/Wq�01�${ ,��*؅_c�͚�`�k��Y�I��wc~��܈@�������	���gX�G�T�Pk�:�ፌ�;G�[��#}��$ZΓ7�?M�r�p�D"��ю/��e�54U��x����T�dr����5�VЇN�=z�s����#�h�|9�Z�6��/̓���(�}q�D~0���pv��.�����Q�F2YD�������_����آaLaV�­���D��?Ӄ���n#��>~�H��"�^�2aB�l"aòu�e�
�DK�,
D�9Vˋ�q�eԿ;I�r,}�l�l�'�����W�R��%��{}z���|�;�6�?��")���]�2R5� ���؅���6�.Y��h��;��g�u'eE;�@l��'S������0�����"^&z�c�xU'Q�݁Zt;m��u"��Hr6h]�����}dd���\ nUh���f�N�g7���i;���9I�Ӄ\�̧I�5c,���-��YvE���<��s�`����k���ދ�gXQ_��*��0�*��7���A{?���R�g�{\]��� ����[5]�S�7���EB�H��[���$�����ELl U\9	�pE��/��mg�-lb\7xK����g?�B.��;W]�����Ft����15(e�����t���DH�i�7\$	�9śx1���8*
�@���ɑ���F�_&�̉�%�]����&�R`��1r��6b������DD@`���x@�Av�V�{�BU�Vş�c��H��&+���Έ��l,����^��ng� �zb����z�2�]?r�k S�	�F��~R,���x��`�G���T#���Wt??��Y���'b���lX)g�f�D��v@����X�૆���zcO*J땉$-�mf1�J�������0��xI�ߣ%P˜n��cx7�S��<���%T5��/&(5�[����HRu�\ڢȡ�TƑ����\���U�֢��S��+rj��5+�,����Ek
�^�=��?�G5R�U��2!��g#�f�P�������8�11B4��C(*u�����-��+�U��_��b4�VG���bH�y�r�Xx�L�NӔ�d��P��[��I:�M��|�/>~�9��k&���^�>}s�ɩ٫M��^
]N+��XĈ\�~I1Wz��*�/�/~�������5I�JoP��	��Ӈ��3:�>��%��Z�NX�-���P�������?8&���#>y������a�Ei��2Y�6��Fll�ו亇��p�u���\z�L��*�I��K���+[7���ڌ`���H;#g��GE�.j�ˠ^\��AZ�ՠX���}��HI����j�k���Ŵ_d�*��]L�������l�?S�0U�=��?L+���&r:o"0����d��vyF�Po�N ŭ��Ϊ��)�0���a�~;?02���`h(0��!��bN�k�A&R�zz���1��m65�1h�� �\}��oT�OH(ň��bߓOu�Z�|�ߒa��uя��0,(�w�Բ�������>�*-���i݋���'��Tjq��c���
�y!`���e8��	9�dL>!9����]` �J1������	CL����I��`#��.B���)�^���,e*:{�x��d��DT�3^�b��⣘�3����u����(�,×���/���K4s?�䝒U���ɥ-:� ��1Rf��r��,b��q�%��dR��k��'ggo�������tG}%�Jc|�I_�k|3N;����BW4ćǧҤ�$���؇1(�%�r=<0G���uq%�	�1"�����[�O�#��E
ɢ��S��Q�����x�j�bdD]�����-�a{y�7i���5�U��(� Mg�(�2�'M�� �e�lHyʅ*�Z�M@�`�T�?BA�Ɋx�9&��2Y�/=R��~(�B��7�$g>Ld$�[���&��*r�0�c�jo�V�@�A���v8��|uD<�bR.��/���d[:xI�s��&�x&#(KQF"�;xtJM�����@�3F0���O�_LI��iwO�A���0
�S��.�Ү��~��E�p0�aB�SQI�Rbt���'۠������Ih�X���o#�F$!
�k����"�0�2>�xB %�/�H0ϑ�y�};��D�����D\�#8Ci��U���,x!���$	&6��{������#"�xɏ�lC��V�x���?;h6���8t����~>u��\�Ll���o�3�����<�z�T@;�D��S����&�"�2ro~�񁜥8���Fy.&Q���: 9�q�h�:�w�)�N
B�'k��!�k)�3���d�����p�� �!���%N [�����,��C�K�3Ӵ�3�W�czq�da
̚ 	F�(�3<rP50��1�0���
pqa5�QA��P(���gC�El�.������ �̡�� �A�X�j���#��J�&���%�t,#H�1�%`Ν�i�dځ�)��"�h�q�5@�E$�9-�5gD��6}0��6�[����~pNo��3Q��rS����~5Z�PS%�q��xу�8�a����G>�:2���e�#�K�FB.�|O��­�)#[�A�И6#�2C���R��� ޠ��'�*�B�]쓈�o��H���HӍ�H�1���WOe������%bE�4�H(� �d�:�<�9����`qST��`�~�/��8e$�eD��#H��D��:`���X�0"��:H!���c����ΙͧR�@�����8T3����6E���^�.����A_��5�o(PH��%�x��V<;ĝ�.��5�j�{]���R��}�}���'��졤�qQ�B�2)�40��
<��L<A�h�h�D=b�v��9��E{���� x��b�l��PiۜmxcӸ$ &��U�=�:X�_F`Qw�q6 �\,A1Ot�d]|�C�d`���e<�ȣ��*fn���2�m2�CtH��\�-Ke.���o�b��6
�<h�)�ӷTR���"���Q�:�~�L^�i}@�����H#�=ԇZ��`�
Zy��Ѭ� ���ix��j�8��r�A�7���&2�+�K�/Z�&��B.���\����C6r~P�:��H������������܃�M�x�E7�HRZZl��ܞ�I ӈ�������VQmD����@nQ�%�j�8+w�B�s��c��mSу�i�T)~�L� �;���"q�(V3ADq���\�@$��&�_���K�"��S�e��y�]DT��Gv�X��r��(A|Jό�C?N@��,
aZ�	������Jm���s�ܕ3��Gꊲ�]a�:��*��6�Q��elw�
��7h����������s"�DPE�wdʋ����{��Oo�D|�u)ݴ��u�{��P,��}^y|�¨�]Oa����H��!�E�
�=l$������2�������'T��ڪ�N�r��
��3�"#��&/�.U�l�\ի(|����3EN������^/MX��<
��ӹ�".�R�5��ٓ���^c���nx#������n�9t����sJq������Y�V@4����]��Λ�kz�R�q�3)F�/H�tS��@yp=0.؋����&���x����`�@�Ю���w{ݦY�H��2�� B�9w�9"�"MT! ��D:��n���Aֽ�a��4@��s�/��F�� �q[�f��l��],�-���N�t��=k�^~3/�v}_4��vc3/ޫ?x�I�0q�}�!G��aM��[{�T�?!��:""YЦk����3����M8p79���b���B w����%�0B&EnR_���9���)� �p�U��㰉�` �L��K搜�q���s}�T�X�z,
��)p��
b@u�(�HS�j:�	?��r��98���δ�dP7�f�)��ѣ%|���
�h�C�X��ͥ���O^��mr~�*3��F�[ow�Pl�����n"b�C��<�B$����
ҩ�1�Y�/�����u5EuN��Cil
���(�-5͚�^��9�o�u����a��l�X@G�z�k����f�fU5kzH���73�n7�HA���\���;A��q�,�jZ
�*
��9�b�Z� ƪZ���t�c��q(Q�����:�K1��v�֑�:�;N�Y�������������>��'h �כ'Ak��ܗoer�c�����(h�70��q1,м|�������룃���zk5[����l�{��G�|�T���c�j�t��o�w�nt̯v��>�@oL�e��;�e�r9��"���!T�QRH�/Vk������4�}�T��`�j}��p�j>���22ޓz�d��̌�݄	V�B�տJ��B������d�4H%q��Jʏ��"xXPH� {��{�
1���ا��_��=�����a��j8��&�꽽=L)����m����Y.�pD��8��ll��~w��fÜ�a�"�R#[&�M9�0�)�d.�Z�yN!eC�t'ҽ��/����[u���̪{��^�H\wq�?o�[:�0��73�a7;��y�mb�&�Z���ݡ>��y*4���0ُ�?���T�U@�]�H��i�����v-��iI$h���I�}0��^�s���A��2�y����x�@}��o�}��pƞ�w�{�nkS,CY.���S�<@m$u8u��/�"�Y��)�_GFUL�&`Fk�I^���X�)9'��d�\LE���^4�[��*�=��6�YG�� ��'�ݾ��K;�?��=�z�Z�F���E�m��\�!e�k@�PE{Ҷ?og�e�-np�Ըi�c�t���>*�TX�C���f�~�%��H�A7��;�+��*��Gkq`�M=_���N�'EI��*�l�>�J�}���(�wE�^��KEIBg��h�`��Dx�A�t���~3|�ނ�tZ��j�oE��<��T�~�<�X���L]>JKd��S�b�6�PxN��L�,R���J�X�&X�c6��'��F��	�~�n�3�JT��:䳐(y��<�~ZY��������)9��8Ea�RD���t�jR���h�֮�ka#Ө�F�AD�Wf���ѾD-��v�!���� gp� �M �Z�HQa�D��t�@�z5���ҹ��̱a[��M�ڼ�~s?�
�H�"f��*�pt����s��չ���#�ܪPH�Ը
�FU�jxX=ɕ�5Ͳ�� �Y	�ӏ����X�I8����������7���*��1d�gS�-7zX�&�����ِ͟_����#	�h��d<}<Ci�������_����ϡ/\S��;��6j��e
�pƂ�Q#�D@��c(μA��Ŋ����J��Mg=�6 M+J|���ƣ�B�������	i�8�$<�5@��zZ��%Jo�/��י����#����1��R1
Y����t�Ӿ�x��'t�F��I/�����?#�:����	�:R T�8��%2tT��s�5��jk���#l��ީW�V�X�}E���V�B�O����Kn�o����bW��V�����Ɂ�78�nJ*�b��5��y�'#����a)H�A����!2�(�8Y �Q��F���A��C�L�h�*�N��q������NqF�c�?�;
8w�����s��Ogo߉��^�⬅����xQ}{z�my�8�g�]3������b�q@SQ�%�9��D�V���iB#0R�K*��h1L։/N_����(��*ƥR�IL����˴)�O���%kzC�j��}s8��0ҭ\���c�aQ��P&J�p���	B��a���/�C��������|���(�a0�T���u ,1�M��[ʥ�֣}6�y�m�g�1�.)R�����[��Y��"�;�l��79xC)9U�DF"���C��1��p"��m��Bՠޢ	���@|���܌EM�4�� .���qx;�wTY��^@�T��hش=WW���`4�x�Q�F)�=T�}��������['
 ��r����y��5,:�
zmDf^�Ѡ�[T8� ��*e��]���!B5	ϕ�[��:Ad�z�\c!9��|�@�=B�c���.����4�ܠ�~��Q���$��yq�H���T����,Pr%?Va�蛗���j&}5^���f*)���~[�y��,���R�� n	v�u�;�:y1枂��)�<��c�J�t+�l)�����=������T[@8qD!��;*8+�(�8�{$�c����A�c��/�h cԙ1�;O�5����'��qqG�����b��8Ig�� ��ؠ�V�l�,�Z�s\�D���b���2��-Ā�r����6<�e��0�{�Z}�V0X#e�״��3�v�35���ݜ�7�R肾�GȨ^�w�%�ъM������|� �Myza��_��-�t0Wk�I�9hw�� 
l�1e�����ë̴�z��� 4z="��6�]�9�!hs($QL����5�]��,m�������@�d���B�:@w�]vmY�j?8}b��9�Kl�:x��鬢'�U�<J���8پF.v��7�R0Lm�)���Wb��s�_��jsLa7�m+���ә���7��<�i��zC�F8�ʨ���iH_�Yo�F��^���Ҙ�TZ���$�������"��@&�6��cj�BVM4�p��*���� F"<��� �-����Y�/���^���++-���[t���1���«\�I��g������[�w��E���(��!얊@��;���	��F�~
�&B�1�m^��s'y�D�3��"m����%��Lkf�}@�T�r()�(�U=eQ%=���b�1��l/�U��� J7������Uf�=�}\�1Z�_�����ߦӬx�D�|�9�Le�����0���x
��\'��/�#�KB5�ӗ�"���;�l�,i�2�-�ve���"��'���B1����E��� 9���gI08�S��q�/��/�	�Ǆ����{M� �D�����ң����@�B�Y��X���g��C��ʭ��oF)KEa���A���B�%��G�t\`�'o�<Gg1��A�<��	�����]����.7�9��њw_�|�A�!�F�i�T^�B�ٽl���[�`���QhԨ�5�U젷�����u����N����L�`hz��"��N�{��D�1N}�ano=w���H��㞱��:�*���P�ʏQ��ͯ���#oh���*�X$3DFQ�Z�>6�aiED�9��#l�����$���H}���dP�������M�,�L����#����P�q�Mf���9��$^;C�U��s04�pA�5���ES>c�KA��,P����~���j^:�(�B,�(�YC��W�Qߦ�W�C�>Wh�Z�����y�ȋp�����sQx�z�i�������pRi�R���c�;��e$�)3��b��+m}EG��Ʉ�3�����XVǣié�l�A�n�A�>���,�h`��J��<���3@(����٨>j�a����a]�lkp�}0�ݛ#��� ?s����8����+����E2�
d:ǔ�s"�kp��͚�q�����قXg�E���9cQߧ縧F�Q�49(�[4�M�T^�X���E���<��^?y���^rp����o�#�s���$��>rpt,�9��ˊi���)�����5X���..)����ӱ�_w.9rΝ���,�i�L��gf��c׵Z������d����p#h�5N5B�f�L-2�)�;��'>�S[� ��x�s (���?U�.W�1����G�.͈_,/��[����_�A���*�F\�`[p
7Ҡ\��$RC�#qW�qQ� �W��Xn�U�	<\']��U���Û.߿�����n4�M����'ϼ~�Oj<G�$��ӿi�|0h��4X_�ұ�8
���c�dY�����^Q���A¾��9���T"���]Bd��+q%��+Qũ�v>���^q��1���;��w�+��[?:��~����F"K��V��������p28�S�H*�	����
�9��_}�~E\��S�Dw*q�k2c�*����#��/��f�G#��wʷp��ۊ�Ө�����M��n#1�O�[-����*���˻��C(-a܉8Z����������unU�%�%�G����u�WpuQ�54�m0�?Ï2f�!�S�\!���z��&6�@R�'���5�=�S%H��	x�T��{�ǝ��L���>}�\�;�����Y�Τz9�:G0Ћ��&W���/��^�2��o�{���N?\�k2�WR3ٔ�Dh\��ĝ�(��t,�G�[��ݫ{7�R:
t�b8�a��d��E�ҭN�+,3nM}�!0`��M���c�b�YmfU����p��Q�a�D�Wd���()�U&���;�������)N���a숧0>KT]?���Ⱥ���di���C��ۼ"p̝��ā=�S���i-TT�_̉�9�
��c��h*�$I犖�����Ӣ����"Q���@еt!L�'p�@-WK��{�ɂw;�0�6ᗪ|�=z.�*d3Z�D�8�X�x����LL�"�)8mm[��'�j̄Yߖ��lJ�ל�_Q�3l�t�*�F��@Ia���/���:��*��~3	�b���B%70���75��168931000100023maraton/.git/objects/f933060100010008562maraton/.git/objects/f9/202f8126c6ba22083e338e7080919ee489e940x+)JMU07e040031QH/J,�(��K.(`Xߧu�����Z��?<����,713�f�R���e�e=_��h��7� �!l330601000100029562maraton/.git/objects/f9/4578147d80b52f1aeff469a37e3d7e5df6c4e5xmP�j�0�U�
�AI�vKa�A�N��X9؎��%�p��P�@(�d����'��W���r�����n�a�FvWl�?�n!o�!���*t�3Ï��]"c֍�I��م����/��.�A��`�t?VaA�[n�V���'ۚt����2C��B
���i�����7T˫��Ȃr (Z�;:^���v�
�NQ؅FIc���$oIT�y5�H��	����c����?�zZ�a7��򼤄B�c�1�]C�H�"�i�Y0rF՜'�pN�4�iC����8y�yeiy�168931000100023maraton/.git/objects/f8330601000100016962maraton/.git/objects/f8/0e1ba0d4ff773cd58d675e7d3cc32231b12c7fxM��
�0�w]�"(-*�W;�^ߠ�u4��9�����X!_�_2-�MS_r$�Dc%n>8��ˍ��,��ȱ$��8>�PRjE!��C��~��U�9��� ��<����k��,z�'�Z�)m�Ӧ�B�)�� վ1�1aF�Bo1H��Ӳ!:�t�}���@i168931000100023maraton/.git/objects/75330601000100051762maraton/.git/objects/75/8c45adea4d7789aee720b53baa7b086d9e7195x}�Ko�@ �{�W��JX�+HI0�];���x-��2,��7mz�:�OiF3I�4%����C�	f�(������3�W�X 31��LRd§1M���$��Y� |R$q�^�1�Ƕ���=�%-��1隟�EE�� �/��f0K��<����ז��X���4��8�Gp¦���c��`�<j����FUm��&�.07����J8\�Ϫ�"�U�c��nr݂�bж����8׭���k]{� �eѡ�@��D�(�8=g�IU/#������M�F�F�a�Չr��9䴝��dDC�U�|Wm*��GCF�V}��s�ed�!L�)�5_�/�g@��Z�1'9���D����&N��b�Jxb���B��oQ\:��Uw�W9��뷷��W�g��,�k��Ftl�KE�͝�!��;馀�����Űa ��ć�e��䰓9�܋�_/.�8��i:/m��5�NM\/]mLD�"�j~a�:����f���{1�%-�|���{3306010001000181962maraton/.git/objects/75/27aadf1ae25fc2f9bd08da690ca70303bf99e0x��{8T� ��I�"%6�%���+B�Tl����̙q��iΙ�V.m~���+�<Y�eE���&��Z����eQ![�&��q�L�ݞg�y���������Πb\���L'ѨTg:}%����Y0L�˪k���i�����ͱR:���E����M�jE�����"���_'ku@nL<�����l��~����O����@��{b�o��^����`Ì���D��6��p;�c��tޠ�y*_c	a�iΪMzE��M��!5�V���%�N�M�}�6�𶶒}�������e�rqrZ	�E�J;��������_\����`����G�$��
���?�������OՊ��R\͋c���6}~g��k���kƋ��Vp)G���}#�?K�wdN���3�5j$��)e:�����Q~�'������P���?��yGj3���^�ͦ��_�S+���0�I@1"�8�h�MX+��,�D�)*%�}�5��8�s�-0���?���Oqn�lK^�j�ЀuI͓�x"!���X<H���B�!s�y���)��f>6#+�	̲�#-,�3�ǽ%Y��k26�������@A�P���Q����VD��ۚQ�2/~�u3吟�BvQ:Ŝ��;C&�i'�>1k��<�`���i�ػ��[��M����2����	qenY��M֏��j�n����� �CRP�*rw�ԥ��줋���v/���*\n�ƪ:�����wQ�*v�Oڑ?��Q^�(��z"�SV}�|�X����7�c��q 1��Z}�#���˺3��;�uq�<��g±Aa�n/Zv����c؁S��^v�7��͎�Y�Vn��2 ����7 ����gKX,�aPLD>8z���}���y	oZ99
?���۶\͓�4��8l6����~�ƕ��t���_iit�(����b:���8���H:�����r(㔠���su�K#EB�{=x(�nu�~8���i��f6��5�{��Th����-�)�Jқ(���Z>�r{)������co��[�>�]ȵIqmk%6䁀P����Dp[��ר�����Jk4��n�o���-Q_Ӓ���e��;/�7n3�\����Qx�K���ɇ5FK�[�riO*��j#`�l�{�6���{$���Wz��]r���I<�W��7�>O�yN�e���nP�� �1I��ޞ�X��8�Dѱk�͕�����8BaU��+Ȗ��5f%뢎9�_� �t*x��������b��ky9��w$*�D�U��MV{�
ӑ��c����<�n��L�MQԅ��ԙ��:��R��H��/ܾ����s��Ow<���[���  1C�a��U�o�F�]n�K���i��5J�8���h�D5?5m�l���K	��R/���<<lb�Z�!H�R��x�{�Qfj_�����`��%b�A�!(�c|����h�#u�r��TT��-�!(��b��M��I���ĺ����6X����|���T}-;B�w;�U���c�����33���ݎ8�Ľ�|Ux��W���n}X�M��3\��É���|��BQ�=� 5/2�c<x���vՊ����W����P1�]2�a����+�s-����w�{����J2X"d�_�bT��H�o��2���P��,`jNe�!���?�'���`���57��9wo%���Ge� �A9:S��y�W�&�B�'�jhEpO����d"��Ψ<�˷����e������[|�k���߫�168931000100023maraton/.git/objects/89330601000100014362maraton/.git/objects/89/b0554c494553dd0831ca5c52b98dd687028fd7x}���0D���L	mQZ1!�OXP$�Ti>�b ���;�&��<⼤\�Oic����\�m{k-�XK�l`��Kn��B�=J��6�2n�\=�����s�N,����_�A%�la�ixՕ���7XDG168931000100023maraton/.git/objects/9c330601000100040262maraton/.git/objects/9c/6616ea97e1a529241c54a9ff0def1c9de3fb5dxu�OO�0�{]���%8TՆ���+B��vGd�+ۡ���ޱ�i���XϿ�<�g3�|������u�aH9:��A|�)[ͮ_H/���cB��Km0�f��:�����A��Dʀ���#��o2c�wb��{q��"gH� M^�|�'_Ό"�'�TVw�3�Cھ�&Q&ppM�Wm��8{*�G2R�ë���fxUNs�*��h�aL�m�%�5���c$��w޳�z��8V��kc��T���ۧE�M���9-7	9�8hu4���%��Ms�6x99U�9������#>}�zy�]���%�ɂŽ����$ Ɯ=
�e>̵k@'ܒ6Ŧ�WV�K����5uj�[|��4�~����4zp�����ǭ#��oE��330601000100027862maraton/.git/objects/9c/6f9b9b07b95acf6c9a05def002c2fa929f642axmQ�n� ����C%p�TU+YJ$���I�L0�8��`�!�`��X���N����`n~
�o}�9޳qQ�(�d
z�(�D�>s?A�E쀒�w�S5��m�([;]T+�d�T�DKՂ_$�̙#?�Y�u=r��#o���:ׂ�Kpw�,D�A�O�7��j��1�P1�˓je]\��Y�z:�[`V�ou��%��S`��8��ú�5�f�� :��Bu�+�
ܡ=�@��?M�6S�M�v��V�܆A�0��t�>�wKa�&Vz�168931000100023maraton/.git/objects/08330601000100015662maraton/.git/objects/08/b4a39747a6cc9c2ffa2f53f021838f06088b31x+)JMU0�0e040031QH/J,Ȉ/I6d��v��"_��׼�xs�����d�1];��OPV�^ΫC���<[h{�"c�B�����IS��xh~>v�"���ȼ{��Eщ��>ԯCSdʐ��O���ْ?�Sk"���*; !N�168931000100023maraton/.git/objects/d633060100010002862maraton/.git/objects/d6/a0045c67afc5a37a53830cfca35242d4b4eadcxK��OR04b0�2�2T0R0V0� 0��168931000100023maraton/.git/objects/02330601000100055462maraton/.git/objects/02/590e5d95cf786c874c4a77e66096c47e24ba27x}�ˎ�0 E��+��&�`�f��� y	y���2&�|}�N�U��HG���Te�s�%�o(�U	*
f(V%�5�E�"QV��hXR���
u���S�1�)e�D©"+QIMTcQb2�
Ԅ�㧪��6n��DQ�Ue�>��6��R5���Y�O]2&U�H��B�2/"E�I��9m��s�K��_��ZVgm����1m�[����s��&
�?\ �[���aN#0�)���3	�>hu��7���<óB.��0��m�E]�\S�*�g�uh<��}�l}�W4����%p���<������£��8]��, ���#v�kw�.�lF��Lw�|ʒUC�;�hF@�xZA�����<��5� ���TT(ky2$Uq!y�O�������jv7;qk�\�;���L]:��q��y'��|1i�J�:��Y��pk5��K�]����nE��^�ÕC�~�ޖ��W�:��s����n����O{]��wz�v�8���)��<�~,;Â�C����YJ�w�c���g����cBT�1� �ka���D�'168931000100023maraton/.git/objects/ae330601000100046362maraton/.git/objects/ae/9cd2d219b4cdd9acd17cfa28fa1a07bc9f2bf2xmR�n� �+|�T�P,;URu�J���>EQ�1��:8\9��w���,c�3g����^?p��X5L��������=�Cg��~��*���c��	=%2>yc�`�A��T��΍p��"1Tj�@G2-m������%g�>;��?-ڕ�7Ѳ��	"0�\mJ0�u��<���jR�q��{+�_~kv@���2?� "s��Ɗ���ӶY% �3�P��( �v:L���6�6;�o�/;���omsl��l'�lRR@R{�}j�Yӓa�K�	G�P��m���YN3��"��z]���� �9%\aX�nƮ.]Y�d�K�@���\�� �޸U��֨�������t�5.�V��fn�s4��'̮���S����v���5���.����t����m�d1稙%���t�$6K��<�� ,d�i�Y�BU��88U�s1P�����:������e168931000100025maraton/.git/objects/info168931000100023maraton/.git/objects/40330601000100030262maraton/.git/objects/40/df56a5d889c22fb51d4efe02bf81e6eb6f1822xmP�J�0�5��ZZ�|j��6MdK�J��Xο���9"�!�ٙ���2�K���{�v�F�pIyu}0p���an��9�l�� �����:Hy�@J�1C�1%�]�� |�:),Fc�1�������� "h�O	�\Qv ��+ 	���#��D�ͱ�/��_x(��=:p�l1���y�Ԡ��_V(B�t�J�)��J�),�����p8���s�*�4v0)���=�uz��-I#v6%[TU�%B\h�д'�+ϬhX�3�2��ޠ�ni ҇/[V�J�8�l�����fI�o#��168931000100023maraton/.git/objects/e9330601000100037462maraton/.git/objects/e9/b2143ae567d47ba899b826e05c4072dfd6e61fx+)JMU010b040031Qrut�u��MaH��vl�ry{���Zf.iް�=TQbJJQj�^A%Ü�ٳ�wF�ϙ�z�ӡ_��hA%'���E�k����ڷsw�D�ϙ:G}-TQjzzeAfUU"H]���#�[�?�(�����nBߍ\��̼����9�w���&�Y\ՙ1弸6/TA^j9î�u��J��:tm��&}��..I-(Y�ؼ�`K�
�%ǲ真��f"���(䧥�d�2�����mw[����Υ�S�6�x5��(?)'57>'���!+h�R�*�3��SL���m�UW�Z\��my���ysw��?�H�b�H&+�U���Ē�Ԋ�:q�cۊ$C���3�ƦO�0�g  �m�=168931000100023maraton/.git/objects/29330601000100016462maraton/.git/objects/29/9b2f0c31020438435c5ab38df64cc1cefb40f2x���m�0@ќ5HAR�(E�Ud�Erpl�R�O�z������s �^��Q�j)ي��j��TE�R����ʨa���t�-�X3ESZj܉�F��\~�I4u��v@k��|�\���>����o@��)eMpń������0�^�C�s�~~
�l����}oS�B�168931000100023maraton/.git/objects/cd33060100010001012362maraton/.git/objects/cd/cb18d47cf8631d40c5628986c734d0930c8f65x�}ys�Ʋ��W��w�9&	�I��<[Vr��E)�[y)IH$� �;����=3X(���Q==�==��h�'�ѭ�j�g�������>?�d������T,��L�?Fz ܅�C˗K,�`6�d`�����2����������Oz�������-�I���zT~qv �1���0�}�˶��K�����b����24Ƚ�R&�p�N�dh���ݵp?��Ortq�旊.�-Σp��K����_��5��h,��8K9����my�%�0Hd �D�3�G�Y���O��#�«#�&N��_��H�>>�N�:\����X�'�08�zr�W�%���c%#|�;�\�b��+���E8;�0J"/��r�q�'���7�Àz
�� ѫ�G� �:� �����W ���j�7��]��ܰo}/�=y���/G���w6�K땚U%PM�C�Kr?��Y�����!
������Vc߳��<i6��N��i� �@bk��+�X���^-��*�綷��"��<IV�j����B�8U5�����������`U�qrW��̦wU08�ݨ�
f��x2v#E<��T*�?�r�`c?�cz9ٌ����F=��xhXFd��k�fh�����}.WN�C�r�_�%��oۛ�j�ٗE�%�.��
<I'������)�ę1м���ݬ=~r �a�4�a�\�y$�CkO���8�����Њ��:�	p�2&W�lu�$����׋��]Fq\�Pg��(pPI��/|��*��-!�<����IJO�9�ɿ�D���ۺ"���)5���p���ʏY��8�q�,�����J�N����Q�w��1���j�8�_�x.%���(X���L�P�Q qv�Z��5��Ak��]�z��܇N�V�2ѱ�"^�H��p�H(-�^=$#�j=��"�Ԕq�-=GIB�[�=��o�j��k�v�
�
���	��x0�}�,��
��l;�2�Ю���I|$�.C��s�zAeb �R$�j�Ҭԫ�ev����
���#?���g�D`0���Y�;����߃޶M�t,v���d�/�����^H�o�j��d�ȑȎC��*m��~�趣0g2�������I1n�+�>��z�9�Y=��d�E�3rx]�
Qn�$)U�<��\�螥O]��J��/Wq�01�$� X��M�k�� U���������}wc|�܈@�����������X���B�Pk렲
Wፌ�'�{��W��o�it�J^9�"	�1@ �`XC;����E��Tez��?�+̒��x��x{�:��)t�Ӥ��F{����h�mvZh���7�'��Q$��"��`V�F��T�]ˍ���5�d��|M�'�Ǜ�أa,`T�­���D��?�j��F҅u�f�L�u�e��D�8�]�5�"�d(WX-/#ǽ��p<s��x&}�l�l������W�R��Jؽ>���P~Нn��_�p��K^�i�z��VIB]�L\��ґ�v@��Xw^�Qt��ƿ<�U��&�w�,�eb��7�;�W�+�5u��5A���^'r/a�$W����<0��GF[:���V�fQx�n���^zv�!h��#6W=��D?��R�|���_�0��΋����,����@�X����`����x|m�{�+�0Z�X�_��)�f7R0h�+�ZJ��}σ�+��`4�ȹ� Q�5l0e�>���Nȟ�I�YgzۛD2�!�3^��Pŕ�p?th��[�vV�9��&��q������!Q}���	���D�k���?Nv����Gn�A)�^@�n�c�!M���d�$��o��d�ۨ(0I��mON�56��8	�N�(�c6��N0�0�wꈩc��,���?&'� ��,f#z���>�B�Ҵ*�c�Gr��0Y�/vF���fc�	��^�Έu;C� �Գl�ۘ�����oX�jM�7Ru��b����;�e [>Z�G���azE��/����z"��̆�r6pn&NdO�`D�_Δ�iH�oۨ��RyPZ��%i��h1��T���Lu�y��K�-�Z�t�$���!��pV1�$-���%<x�0A���2��m ��*�����E�2�lD\�ѥ���X��m-�<>�Z��!` ���\���ҫ)+�P��p�-�ClN��0}T#E^�;�B&{�l����y�~�B:f#F�F3yE%��P�8?���tE��^�H!��Ё��ju��+�$\�j!��G��H�K&�����?���ބp�����[�+_�f������˳W���������%��<�E���s��
������o���G��Խ&����r5��b����~�δOnbI��ְ6�&G�<};��?qq��ŷ� �	��8��O߼�<���0Ԣ4}��{�,i�Bk#6���Jr���E8�zh}_.=���A�[�%�R�������m��`cj������a�=��^5	�eP/.��!��jP$\���k�#��AS5�5UF�bڌ/2M�]�A���&a��e�{��w
6tޟ)q�*�K���x�ws�X5�����~�}{Fo��n�@�[�ҝU8/S��ÈC��-�����<"W����,4�R�d��91�g��F�He��\��c�=Z��j\e�.�Qz����ߨȧ�T�*�&c����tW�j� &C]���C��a|І� �vK��gkt�j���*��"�-��
�ds/*��TQ2�xk�����c���M��Ix'cr�������b���𣔳�g2�Iأd�\.ND���.r�8�UN.`-�JE�caSAڱ�cɞ�tDp��^�B���X�Kx����u����(�,����֗��}�h*V~��;%�?&�6�x�(��ț��+�0�a��U�|��y�
����/^�˫��?9����F����A&}z���,���/
]�?<>�*�'�xz��|�c��^�(��sT�\_W^��P�! <��[X���|U:Q�^]��,j�p�̟V![�Pu.�/.BvD���A�|�B>�D0���{ZQ�h��r�
�T�
���3}� a�t^�ɤ4� �B�QՋ�z_0س"�%����L)hP�$gV��劂u��]yO�1yҮ众�r"��gK�P �$7m��h�ޙ�uk�8� W�W	BD1�� �(z�v��o}Њ�>f��������е�N��Z������o62�Ho��yY�i��jt9��i��pu�)R#��Les^9ˋ�}�S��sP?	��KE��@L֔	[ ��D0�  �.���13(�r'����5�"��M�ȁ,��p�?F~	 ����{X�T�A<�gk�F�� �x�T��fr��PJ�~,����by��'&�u)��'N��c�F���5F3���L=`��Z��ֳ9.�6:f1e8���<�1��(K"���;������/fv���w���k��\�2F�')&�YB���#����\W&�D�i���]QS�q��5c����w��Ԃ�X�J���EpF��	�dkV�;g,�g$�a�Bx��T�Z}�S":X��E<BP�1%v
T���(�<��[HBB�na�D$���B$3�V��9�D(��"^�` ���lCB�-��2
�x���^�6�-%M����u K($��=�.�W4�	?lJ5~bAYVf�]��̅X4��t��� D ��b+��#��:g�S����H��2OJ���f	�\Bp"��ރ�y"@L��6|В�@<�qY�SX�zYo��5�N5�H�0��1$�X���E�c	��j�Ѱ�j�d���B�b��ЭbM=p�-hƂ���7j󉉪�=%8�{9_�ER��U!���A�ȇ�P�x����!�K)R��Uo̛�.F��������c��Q�B�X�T�)��PF��#��I(��lF~΀�>JAR^ ��mH�����%�B�Q5��4�"�w�� k� ԓ� &��f�BD��K>ѪN�U֕��'+�����p���娇�T�|�*�T�����,"̉4%���!,�< �[�"�LyV�Em�Պ�9lϔO��VM�u�O_|���~��FKԿ�o5�]q�n�V�-�{��n_�W�����^���Q�$a઀a��+X�X�Ә�
�?�LH4D8�C�}�#a�C`��H��ںXS0�{y��~�7^Wl�����Lz쓜$�Ǒ��sw��$D�+�p�3**ӅcQ�.l�22��8�ɊĔԖ!-��6;��Hw�b2O�80����1߲T*l��vVI��/����d�,��)4�9�a�e�ƍ��|uJ�as��"9IMZ��@�s(F2�6� #?���(����i���秾���s���QE�}J�Fc2��Q�)K!����������݆]�����k!��vp�/�����o��Bp���z_��\����0���JsC�$ͼx�Tu
��E!�c�5vʓ)�4�h�(��Rl�ё˷S-��BK��������/�����G�M�<�X�B������|���L)ČPy%���O�*�8*S�R^��K�"�P���a��󊻎",)���;�8I�K��D�'����,;��	(�#��BX)~���Z������
x����s�ܕ3��G���}a�|vi=x�4Fr��=��ް���zy�T���w6�X\�a��T�;1E�/.���n��ݘ�LF?�.�Q��נn>7HH��2�J��
��|;�M�w#�.D2.��Il%�ʆ�es����'TZ�٪��I�r��x.I�	���R�]�ߢ���S�S��Fde��E:����xStJLD)o������e՝�h�;E�F�� m��3�����i�u;���1�jO(w_��;�$E�je����r�F�8�tA@j[U�v"�.gQ��#jo��kR/}���8�Vzx\��o1C�
�����N�����]k�������n��e��@EFI��xzJ>}�<l���UR�Q�y~a�?�&���P �%�t��
3��Z�k��z��5;N�9�L��V��M=��5?��}�#�%"5�57��u��%~5�v�+���F�_����p��ѕ����D�! |P�+�����S�y��蟧�LF/)��@��s]6aN�F��&�f�Ӏ�Z;��q��j7��vON���:�l��Dk��#�y��8��5*|�j&6l�Ej�~��o�F������'�v!�(mN���:�����U�g��0\��W�3�`(ba�}�%GQ������E�?�Ij���_@E	���s��M��&)鸚�6̷�SR�f��aV����0�;SY�w&w2%��lI�=�o�k
�c��������7���~��V!��P'��J.&(�Ct��5ā�)��j������V�����j�� �u��ө�j5g
k���?�;�mN��P���7`F�#M���7w�X��=3S�M�Sa-����qYw�Bƿs�s��z�y,;�F�m��~��\�!�δј:�͈�ӂ�
�6a.��u���N�X�P��I�����|��#$RH�3f��K|�봺�I����B�v���Ƥ�6ݞ���[��&��Y��:�Q����xC@��o��W���y�-x��|�:.vH��jX��u�>q$�D��l���N�Փ�z�{�h6z�i�[N�g�z��T���̩w���{��.kP��J��ڀ]я�;���v%v��s<=�z^�ud��b9�t�Z��M�I�Ӛ����o@�Z�ĸ[|ע���v���7��ú��|A`��dAg�u���V�b!��z���;�Ԏ�?����i8�;�H}~ݻ�ZcךP��o��ܺ�Qk��!��t-�OA�B�	��� #�؄�U�N�G���"�~*ܷ*S�C҇�	\�� ���A����UrT��o�'�i^��_H3��^��eX��v�zʄ�p�W*\s�Lo�:�p<o��K`1�ͻCa��(����}x�YdFG_֨=q��LË/五�t����w������l�}|(�R�#p���=l"����R!F�h��m���P�`�@z����~(� �tL�}1@�A�������zRa'��&�l�>��8C���Ț��"s�R�(J:��5G˖ C� Rϰ���� ���M6���-X/E�nf�6���# \����g�/(�kRq,�����ëN��J��M�I8��25��O��_���cYbKl�`Y���L ���>;ы�!�����w�*Q�7
��B��;7t��Uhe�Ӈf{�gtL	�|�)
�"�g=�CT��vϨ\��[�C��:A�����F�AD���y�+�}�(Z��;��3��Aˏ���R�&��,դ�"t"�0���ͅn29�\~����������+�{��T���2++V=!B\������F�1o�Rq�{��3�6j�7���I��/���o�	����4@�w3R
;ݾ��{.)��6��ii����P� 
0���_~�\5�t��s��s)�����t�MpV�����o���9<����V���	o��|�at���W۫�)�q�	��FRI��	5�FW��C�1����ʦ�7��[�4�(���Z�|�H*���>�|�� ھ6������i7�mu������-�$�H��`�ra���sT��l��/��`��'S��Jf��#u�A��ٲk��ޚ�o�*EAM�N;f�(<���&"��5d�:n�A~��b����K�U�|��nv^=|	'_y�S�
E��B�P�� ��d�rUs:��趡5� !�����h��oY������1��A��ub�*>�ԧS����4�8t��_qt	�+����s*�;[��MҟG!2GK@2CA/��#��QG�_*1ʀ�L�1�%�`(�gg?�x��
��`Ƈ�h)����j��~�6��o��i��HS�jC�Cs8��,Rg�+a�L�@��Q�������@�c�dB�$q��6���{$�Q���ś��,�*!g0c��2��oa����6�*o�(��j�v�ؔ�����Q��p7|aRt*��1��E6W4!�jIor=)+UDF��gX���?s"����U�ɼ]��y�[�+~H�Zqnf�*��M��C���x |�m��-�'��.i߲i��$���h��C�4�R\�c2w{+8����v�ND��>��G5ۑyE��#��F���Wph����SJpL��&�yf�PI�N�ᘓC�|2����sq��@Y�|�
�?܏a��v�E[ ]ච��E,��e�rpX�w��M��K劉O�>Uʢ|�*�}sL[�!�f�WP����X�B0M���'j���Ǻ6pK���`��H��H��1�t�L���f�W��{��p�L	'{ p@yt��H6�,�	�sP�S�X���@�,i_NgH�(��N^{�"s��!�a4	�1�`�̓b˰�|`zBnw�E��[�;���^�T�P�4+T�p_�㢞 H�*�+���΋u�0`�\*��)�Oi��8�ꞤVߦ�X��(Ӽ�5(Vo��u@ᘩ�/�_�A���B��(<BF�2��s-!�Vl�=�0~�P�K)�h�ӛ[a�
W�h�e`��1M^�A���("��<��*�l�B��g�V���x� �^��<ĭ`�@d�e�

�p`�>��`A-uW�2K�=�o}u� P#��ϭ�Н_��Z��ΐX�d��x��8�#��$J��*�غF*�<4�R0Lm�)Թ`
|WB�s��4��F��N_�V0�?��hK+"n�y���q��Mq-��Q#U��������ƍ���H����t��4H���/�U� ��0$��*�cj�BRM,�p��*\��� &"���� �-����Y�&�8��1����A�}M]��~�`���i�«\�Ga��*��������w�q�~R:TC8,�"�K��v7�# �>���)D�a���y�>�6fd媬����6n���#J�*�'�M� !�p�B�T��Qb�(��;��8���zQ�YÉ���@����W�E�6�6��mi�+�/�ȇ}TӵoӁ[��`�b"��ͱc*��$G�����#(-lu���".0���O#��|�X��)٤]�ķ�ӕ�y���(����Q;�9�q=�}U䗋�r'�$L���ԗۄصA����C@@�6����0Q�+����Q�h�����`:�����?�,�����3�ǊXf�X����-�q)�%�N�@1�^^���?�#��q��y�cR�w�9�Vіw~~��x�����g����@�{ۑx�X��8d�Cg[�Q�vW�U���&�7zL��	�%���,�'�J/� /���Y�KHI��\j���7\ݟ�} 5m]�_�h�'yp(�O�@�g��1=����VrC��?��%�8�i�!��Ҋx��9�G�z�*Lһ*�4��h��Q��薋����8c�d� �����})ً���Ŷ-w�?�ыz/�	ψ
Y�9�	�K� ���]�g�)��dD�(X�Ȩ����Zv\)mh��۾t�Z�*A8vO��X�)8P�nv����=�9�oX�С{�$���"��@8��|�W��.�<������$���n����,�i�<ֽ�S.��@r�	] OAh�+ڣ͇'"ڨ����W6ǣΑCD��4"(ӭ8h�ܻ���%u�2ؒ�{��12t>	É�?�֦-�$�|��մɶ�рۃ������uLqN���W=�X�U�|��>Mc����
S�v�9hs*��D��u�����u;�)u�h2u�Cz�|jԐ�/Q��[4��T^�X��E���|n7
҃~�B�5���<�#'�_�G�A�I�5}���>XRs�������XT�Ņsu��̞����@uiH!{��5=ӝN�����tPz���3�u.��_bXzO��j}�;i��C��dg�o��p'h�5��A�f�L-�ޝNp&�<����(��x�{%(���?Uu*W�1����Gν.����_:�רj��ؿ���dQ��Kr������"n�A�(�H��'�*�@�d ��2����(�px�(�B�P7 K��_Vc��z|7�,����/�a��~<��>��yx��_!a�ei������Q[O�eR��%��>����WT&-g���btN:�8��g2~�m���(<�EG������{�g�x���W+~3�� K����!��믜�Hd)��ʟ����_��/_��2�|�u|���ۀ?`뒠�*�
<^ zxpD�x���!3֩p�|X?A�����d��x40���|.�=2UG)q�<o8��8YI��j���f/�B�ʠp'���z�];Fɫ]�unU�eD^$��6�����+�J��15h�(�]~�1���
�+D8.�DqZ���v��N�"���W޳a>�qdܟ����x�#��j�ye~5�_>��x�>��8+��W���PP"��_��[�v�h~���ﳶ�0��k2�WR3��Dh\��ă�(��t,�GrX��ë7�R:
t�R6�a��d���c�*s�
ˌ[U_l��c|3$>�بbV�eE�=�{{���Qoaj<��d���()�E"���;�������i�Ci�x;���lG9���Ⱥ���di���Ӊ4R�8�O�S��X�(O���!�p���ӫ�Y>v�N��A�t.H��//�:�I�{�*5���J���W$�T� �N]��Ys��sAW�� ����&j�6Ps4]Y��	&&E�\l���V=�	�3a���G��6���5~�H��X�]Ŀ��XUP怑����ey���N���*5��LB��ܠ���F����a168931000100023maraton/.git/objects/d9330601000100079062maraton/.git/objects/d9/758c18b8d7468d6867db590c04f1660a2e8eaax�T�n�0�U���N,'5P�EC�+z3C����M�d�I��!i�I��;;;;���p'�/�?��`l��Z������Zߙ��~�/u�\�gy��.��k�V��mo%ύ���U뫺��h%me��N!x�R��q������'0}�ot�r�]�/�"Y�կM�����u�"d�;�m7��������y�*k����Ⱦ��̳�ز�e~q�����!�X�
������)���[i���3�Nhe�F�@F�U���7�w����z]��!�O��۰A�����Y����b�G:�����ckD���c}�,?
�t��yy�����J	Ji�e�p��T�A0��7\�7�8��l±���T=���	�� U���]Z@W\�ܲ���HH6,̫^B�ZT(_=��A�PI��䃍��b]H�Nn�3X*3�2�q����ĈiMN����p0R�l�L．#;KO.x�хĘ	��L�f��(0f۳�휤6#|�#�sg5�n�HDӐ7W����sυtIH��ࠀ��JM�L��<�gW7�M�J|o�'����@^=���޾/xC��4�%�`k:�Wa�@u|��S }C���N�CV�\V�t��R�[k�؍�`|#JRN�R:ϸ7P��N�
X����f��n��/����y�%v��}�����F34�?���ݦ�
i�����p�����P�'�~h���[�%\o���2Q�ծ#B�mF��T�M*�I��&ծ
��� -j��|V$��܂�O�_ �,P168931000100023maraton/.git/objects/6f330601000100032562maraton/.git/objects/6f/581824330d47338ebd5b1f0ba87b6886b8cc8fxMP�n�0�5�
O��+� �S?�zi��6ݒ������!%�������0�h�[�o��0wN�Spf<�?S��G��&�@�9���	0�e
�zQ*�$y3��i�#(6��w��]�>Qt6�I�+�C��@��#_�떌�o���<u��ZjmK{�PV�EF6���(Ki�M��{Й���WH�� V�B�+���D|�r��^!U�^��r5��~��p�4w:��Z+�\<L�8bn4��<�|���� ��p4���7�̄�2��>�$���x� �e;h%��%���c
 �Pv���9���ݰ��M�B���@���9168931000100023maraton/.git/objects/9e330601000100049962maraton/.git/objects/9e/b0edf6a73d2e3db198a0e21da2602b13cddafex}S�n�0�_�=]ɑT�b@9�zt����X&S�n���.)�a��ܝ}�,��tP?�/��n����t=��n��(�����y��}P�KȞ��Ks@�ሽWFC5�=�J��+=����I��F�v��Y�\{?���$\��-�����B�j�kY��1��m�w�R��)�U"�ۮ��<+bo�9o��QDL�8�~�Đ/�ks?w�z�:ab����)_�ܡU8q}�P�D���S_S����"��r�"�+ROķ��#����~4�)!�2������E#�<�Vp)�����'��Q'1N�����G
k�4JG�~���,hQ�HƘ�������d�d�8j��'J��m���� ���U��9��U�P�K?�x(� >�o0��I������v:��i��A��iv!e�x��R��Y"�kTP�?Q����h�L�:E��u�%��+�@�B۵"1h�B6)���Hf���^�V
�l�J0330601000100013362maraton/.git/objects/9e/164c54aa50163cebaa83c96a47901d09debc56xm�A
�0E�fN�	�vl7r�S	�II���M�Eg�߼�3�8�����%��t�8�(�~ù2r�'n�ZR�kNM04ń.T�)��@J�߂��r�;X����ӧ�����W�����y�>|��7;168931000100023maraton/.git/objects/803306010001000182162maraton/.git/objects/80/758a0d36a20ffa1896f0c82ad3a2ecf5c0a15dx��yTW �T@QQ�
��,�OYPT��hAH&�$���̄J��b�S����)j!(�T��D�AY�Rĥ�
H�Td���DK�9�9����{��wT�+��$��L���Q�� 2�I��u�Aוݍ5:����9V��j�@sQ!�us�/[�w�{���6s��d��ȍ��ݞјc����nQ��ՃaHcy{���ӫ��6D�0���M,:Q��M�!��ߘ+���=�:N�k,!�3�Y�I��h`pz����)��b���3�����q�/Y�!q������S_^����}��|C.NN+�X����`������)��s�U�( fӨxA�|�K�TR��$�'D��~�V���ռxv7=m��G=��../�b�(s��cI���k���Z=#s��3Os֨�$ c���K��7_$3����V���� �wxe�������6�~9��N��b>��+%��;�����T�ژ��2Kt��T�W]�I������7Ѡ�B�z_���Mq����q��G�k^��.ͣyq�%D}�ra� ��x8^�2dM=���>%(�o���fd�1��vv����F�4��{MƆ������((� 
�Q9J�ڕڊ���fԹ�S�n��W[@ĉ%J��ss~g�d4���'fm�&���2<�{�ӷʛ_����_�38��#B�"\�[V��&+z��c�����a��	�P(�U��a��UNN�y�`Wp���@V�@/���T�~���ҧH����I;��ݽ�&
���`vȪV,k��z��-��hz��p\@q �V�����������Nk]\�N���p�K�Λ���w?n��������zϸ��11���>����������]HŊ���a���^���r���E^�ÛևN��Oz<���W_�~��L��뿨��q%�>]o���WZ݃ib�},�TL�b��<	 G3P6I����QS.e�<b�td��iD�h@�c�֭N�o�ܽ��̦ze���D06�k����'�M��i�T�=@���x�q����s��w��*�٤�>j%6䃀H���m���a�Q��-�ɕ�h����Y�W[�����--�*�u\�%~�f|����v����H��J�ӓi��ҷd�r�=���U #�e#�C�����6��Ѽ_��������M���#�(���y�Ms*o��H�Su��X�"]�|{lCٓbE��}��K�!�qD
ª
)���y�k�J�1�:�[� �l*d������Ԋ�b��k���O�w $*��\.qT��Mv[�
ӑ�ģ���|�.��L�MQ�E��ԙ����:��B��H�/ܾ����{��O��r�*���k ��!�2Pq�*�7�F!�n�K���e����|Gd�u�P����6}���ץ��}��T�f>1_�$���)Jo�Ե�(+����J�u �����!���>�T��M�؞:t1���2xZ�p
���a`�c��-��r���o{��{?�)IQ���e��
��[t)���?i�?��B�����Kݛ�[�ꂎ4��o�<��ƇU ��{=c!E_?�`^�盖���w��DP��\�����B�U+BJ��8��>Rm$ v�p#�eD�N���۠S�X���h�v�����"4d���L���"���P��ް���U�J���9���M,��a<A���@{�T���	Wνs#�<D<*�PD�љb�Ϋ�,1Y�=yDC+�w\���W$���wF�)_�=�Nv/?�����n�Ω�~��168931000100023maraton/.git/objects/0c330601000100019462maraton/.git/objects/0c/a6835bbd6ea0bcfaf7887e3b946fda818b09b3x��Kj1D��)t�VK�n����'h}+c{|�_��*x���r��aQ��X[���\䩔\1�<5�^H�|c�H3�?]�}XJ�kؙ�	+IR��9�1b�%�x!VP@v���w<��R�2����*F㲬�|���nf]��ڞ�4t,��X��m�CJ��  ���5���[��S���j���U�168931000100023maraton/.git/objects/b9330601000100053162maraton/.git/objects/b9/7367d97846f33866ca74fd703f0cd997a00314x]S]o�@��ݯ��Ň���|T���5H�E��p�9#�܊F��56�H��ݝ���;��|MI�~�q^g��4vy
��$/�2�wӫ��C^ %���-�to�C�-<B��؍�fs�#��r>���#rc�W�A���goa��2v0��}c��_]fLX�',��tD�N�Fu>�N�����K���B'�@�p<X��Ө����)M)5ǌF�2菻������'��q"e��W�U�j4���CZX�����ZakÝ9b��;tUpKD/R���԰/���e��2�rn��V�B�k�I��B���V�U�����U{ MH/;�mT;�Y�dB��p�B��K4�s���n�e��xO�����
,����>���Q"�mLz�+�)�R���M&�L�#3Y�\��$����+�X�hW��CU�V�T�V�W�海�cn�oj҇4�gq�Wo�R@�ݹ�*�qr�K�K�����klY!��W:�G\����_�}9'g��h�
�%��?��$�330601000100015962maraton/.git/objects/b9/2fc60df57e5a2bb09724eac4171113b147cdfax��K�  ]s
.P�(�_b�[מ��)6-���mzw3�ɤ����Q�7fI!h
�+�l�w@�u�����j�u�1�K�1.�<�2�b���$�����k.ۻ��B���~ڣS���ץ��R��1!@ �����D�vA9s?��G�168931000100023maraton/.git/objects/7733060100010002353462maraton/.git/objects/77/05bd4d229979ff88156f5e78d194ba168dc732x�{`Tյ�O�	�1*ZT�F�_i"�;<AG��BH0$1� ���A%�Xl�ת���m��Zj��Hۨ�����X���{��r+������8g�+��gG�u�^����k���cN�4��)5�bd�w{lʄ��<�~�O�5_�D+����)�^�w�7�?�"Ih�K�÷��-$-·��t��wD��=\�B#Y}�GY����<�Jy�X����y�?U��
m��T�B�ы|����= ._�Kڐoeh[����ki�?%��$l�}�k��'_K�J�Y>R?�{Ӡ��і|�<��\S��5՝���ܱ�����BӤ��/�:�u?���Rv_����s��}���O�m�5��z���c��I|��R.nN�R i'��$���_=��=��s��#b��2���q7O��YH)���9��Tj>��w.��O	��P�i��M���4��4��9��GZX·���~����\�V�i�̴�z��[�����4z~O��ߐ���?<�}�g���_RR]��1�����*�8�q>��I)#�����
�o�VrJa�^��?M�s�{�d{�����D!Gy�ļ-͉�dM[2���/LL���؞�o�T��^��%&M�"QW�f��_1����~z͜�zM�N��:��>�:Y^^�PӖH��4&�'��b�H9����6�Ҟl��Y0�vz"V}n">��KP����#���ꖦ�X|´��D^k�$���5����btb�*��O��ϩi�i��O�miKԷմ��i*���RW����i��TU6�N5;�UR{Ӥ�C�zzbz|��2��8?ऱ��q��i�Ԝ�T�%;RCY"�lhk�)�T�</�@�ZڔP�m���Zs�UW_�V���9��%���Ɩv���I͍��居���l�sj�5MM-��-J�ַ��4�45&oN,,#w�M���nl�mO�.�l��ӍO�nlk�Mk$K]S\�3���Y��oe�W[�h]-�3�ojD����;���(�+��:F�����Q���7$��46���I�/jLz�,hY��&���jh��q�#K˼˦L;.QQZ<�i�#�q�f�;)!�*�Y���,�~�(L�21q�����B�B�x��o_�/�S��4��ǖ���~�y���Gݿ0�*�C��`8t)S��B����n<\f��AyiM�x�����ƛ��3��_���4�?dN��T��"~��S�q��QQ�@�"�2C2!x�R�p�p2B��w�@&�2�E�{�h�G{�E�P��c����&
$��"�I2.�x��'x�,���k�O
�yu����y՝{��:pǋG���uw~���wWO����΍�k^��΍���(����N�^7���]d�;Mz� ��[.Rh�a�ݣp�F�{��(\��P"�*��tF�B�"��2��(\��0Z�V������p�^�D��
)6��R�H�a��e
�6��D�"����b���Z�.�nX$���H8M�ްD�]
�7,|��eVޣp��_�p��U��R��N���P��R���(\F�a��
m�+��O����z��w_|���5̏q��jf�Sݑ��S
쟻���{��]|�MTN�:Zx�������S��!B��ڹ��g￸by�to�������z��w>����ɓ׫�ےǪ��q]r�.)�o��dYr�j���8N���"�M���GsW���^w�]�:
�|e�B���W�P�OU���b˧���?�6���νS�!1cW����so��XO܏app��-q��F��V���(b"K����ؚ�4�N鞱�;��sodZ\�u�2�b�6�#�w�7ǔ젝[���ݱuԦs$�u�߬��3�.o�몥��������X�}��Cw��+t���N�J97c{C�%Q]sL�[���/�m�>����$�A<�?	3WuD��,q�I�m����$��y?�Y{N�Ί�ݨ��x8�ގ�+z�G%���gl׋*L��3��7I�l��"Hb�~`��X�/�]6|-����k��ny͇/2�x���X�+�ݎ�~3�~�����;VĈ-��O��ul��e��!��u�ͱ]ҥ�خcE��쾮�G���l���U����E:c�����9֫�^+>z�] ��Ѻ��\]ډ.�OI�IyB�t�vv���a�}�r��*-���c~W~g�7oO�����k�����Y��_�NJ�u�L�쎽���F���l�c�]w��!M�w�)����������m����������i�t�k��9�*~���|W��JZ�I$=�[=J]6�L3"b�w*rޞ_J�w��'k�6qlJw�����U�U�|�X���j�gcܿ8�g�b{yle��eso��"��eq�O��$J��5�E
�u�J���2��J�VR��꠴�E5���Cߣ%�<�*�O8Z�I{$m�V�uW̨�H,v꧲��n���c#���8J|�"Q���gBPΎ�+�~�n�՚P���}�8EF��`4n?�FCqH�/��M�V3�(��KF#v��?F���t�� �Su� 	�֚\#LAd�aZA�rqZ|���dx�ѩ]�_Q�_IW��>�f&��D��^���.������Ю��t6�|��1_)�1Y{�Bwz��ư�qc�=��=K{�^�C]D���O�:��R����c�?��*mr�N��3��G����/�T��Fv���-�y�L�b�[�s����屽ƫ�u �O�.�4�Ξ�����C��fb�G�&�� �[�P����q�-�b[S�-�])QoܿP�)^�:����m[[�ؗ�>��F�N6Qn
]��A}�$=�w[W�wal�я�`ηm�"=�z��K����o�L]�}�f��3z���JE)�=��t��u_�G��a������;����Ѽ��w,.��q&7|G&�}��9EZ�KTb�lj��ҔA������_q�g"dd���B������sGꧮXt�CbQ@dL"<�����Zׂ�m�6�':S�X����I�K��>r�a$g����b�01��J�dl�Cfj[�(��X]Of�����9�m�Wf��S�^�ă���pXD��E<bܟ���Y���~��9�茭]/.��S
��HhSq���c��r�ν�Ҕ��fFj�7�uXw����Q����R�r,y�T�ݝ��ù�-�>ů1컜.��A7�+����s}����_��k5�ګ�T����x����q`Ȼ��ն�Z�P%�f"��H�_�;$QOoW<�v�3ZOh�&��V=��W|�H�	�͡��Rݘ��,Ӱ���N/��,������}*���l��r�i�`���˿��^^�?a/C��S�3�j��+�e��������y����y��w���F�W����@GѲ��y=y[�ߕ���UQ��bw$�{�U>+�^V��N��>H���G���A��H��,D��4j}�:�0]��M�dԩ��N���4�{���g�q�	ćq��=
�BMvD�;��鞱Kϧ̥�ڦ��ja"��D���I6T�Hƞ�JGQe�7�v��s�czy!�$hz��$Ӏ��)ܤ��Y�V�*����|WW�<���3���끿�b$Cd�!��u�Ќ]��vQd�L%��T�c�خ.ѭT�G�m����buv��|b��a�l�H�P�LF�����x'&�3^���Hc�SO>��ICe���(UM�f���):w<,�����%V���lxo�M�l��B?��s=2��/gr}{
׉?��A."��H����2JE�9S����V�� ��uq��~昵�UQ��"�N�SL-�kd�I��ȚC�JR�Kqܿ���a��Np��
��b����A\ѹ7�֣��4�D�&�U�jQ��Ǜ���{B��>d�R��+|���ѳH(�st	k��U"
$s�Ϊ�x�Np%S�"�c��ǓLi���b:r�WI���M�TQoݝS2��6>O����9��;:C�6�k������{�����H������.�*��Q$k��\\�%/S�"�BM�e���6c�ghbWl8�%:����Xў�����n$c���3m����MM�۩U�����Z���M�g�W��:V��3��4u��(2Suc����_J+�O�\��[nM�ݙ��Քܭ6��g�!t�+>�����R��J�2������-����`s~�?E�B��({��+~Yu+�ܧb�^�	�l2�g2��3���
��jlc&��
���U���	�Ho�	Oj�լMSK��T+�XI^�roU����ܛb��b_���j�]~]/A喫t�"��m��?�g�?��-�sΦX/[)��e����������[�mO���7	b�"�9�Dֱ�򩨢��g���I�λ2�U�)Zm�p�7�¿�5G������7kr�-���<l�"��$��:	���\�˄�B���P�P����� ��};=�̠(�|���<��FS�I�896Ȕ���.E�펎x�*��ۨv�z\�\\��T6����h1�����6j�c=2�ngk^��Ƹ�ee�:�.B�8�Xɱ�h�l�I-*f�L����b��aƊY�nT������ݓ"��?�����{}��U�"]���{F��ױ���XK�vHԻ|�,�SD�I�o�?�Sl�*�A׷|�h�*z���Q��>��3t��߱uE����؊�^�'S|!�0D�Z~�vٗ�NQɊO]곦���,B)��3ڳt{���9�mpU%���c[�v[İ�ʭ։��e�mo��m��U���߭Ix8g��U\�����!���۫zJq��Ӧ7l����[ݝY�&)�OY^t�X�^����e�nusl���b��b2ۨF�э��n��d��g�F� �QΓ�b]�.�w'�!�C1�`��f�d�>�Ԡ~�dԬ҉�d�Vj������FŜ�{�>ݓ��dܩ��_>$�������ҙڷ��:��:�SH%	X��ȋ�ְw���B�N����(q��:���8ם��I��X�OZ���q�_��������.��D�������HqgU���x�F�vM���Z��dT�0i��vPzC3e�c��<����'՗u��)�A�����з[nO2�2Pn��D��2��ۆ�+�M�m�����7>��^���yl�r�k����w夓Lf�P�����+,�ՙ�H}���cX�-��	v_�ڸ��R��io`ƌ�,��_Fw��ޡ�z�R�ﱏ#�Yr����힨�m��H���v���|�Uq����sr�^+&�$j?�������!c�26��N����&�6�|��=˓N�g�o��N���ӯ���~a�x�2�"����Q���\K�1S
7$Ұm��m�79�np-�1B�%?��l��}�V?CWy�^�%�%����>~��y��+���x{���nFE��M��I��D}��]��1�ɟ��!V[�E��^��)?ߣk��A���p�;M���3����*?��>j��q�0/��"SM��_�3i2�0�W�����iN����m�4I֔��ז$��V]QNw���$u�vq���[��"ʃ���2�0窌��D�"_�p�&2�R�K����B�F��;qfl�9�m1����(?�`����	��Lz���2���v�}��2`V[H��r2#�ӯ���V���-<� �
�B�D
�H��>a�{�"[j�1�v��6WA��	�l�d�E�G)�]���ẢJ�Q��
۴>~�.NQgiE��Gڎ�TVB��?����eyh���4�z6`����#v�.e���N��Vlr@��mN���s�,c��t�)�W�wص(���ђS]V"�G5��^�P�*G��#�Yq�����V�q�r���3��������K+����L�*oE+Q@��1��3����X��^Qi���Ԓ�G�_t�9�SKx�y��
��a�g9��(�g��*��A>���_f�.�Ld�B����rgD��0.�X�kj��'z�pz'����V09�A_	�9��}��p��ܦ�p˞l�3u%��o�]3eCҴɆ�&���0�
]�goZ��[F�J��0�.��/h�b�����J���#��A.��`|�:�ɳbݷ)�f^��^r������������=����e�7�,~�K�2M�C�=��]��o*��Sr>O_6PE���%j��RrՓ��s`H�܄W�_�:3 �*��f0Ѯ*v�!є��Fm�n_�;v����ž���K��.�F+49}S�K۵*��S���;�f_F��2����T��Cݽa��z�D_N�u
W@�.�����8~���k�s�`�h7[�����c�H%�"ޟ����a�$��Bu�sY콥o��EEGF�*�Dw-�G�~6�z�C-_V�Jy.9���<�a;�z��;\.\Ȝ�]��H���D�����ѧ ZV�w�R嘁��ͯhMM��`Ny�bs���ћ7�ɑo�D	9�/�d�I��9-ڳCOd�6F#���ȸ{l)mł<A4A�T��R#,����96��vp
g�Δ��s���W���_I!�����d�HC�ʯY#L�@�v��ii%��xP�d���EӅk�G�}X�X+��E��D$���b���ӫԫ�wg��E����'G���V�"�^�ɨ7�{���վj�Yk�����.�ן��^�w�q��{u>�ڵs��o�I{
pD);��s��Ʉ�0�C�?��tjCU�B�#��C�CL�:S��>�XN9<M[�����4q�.�bz��d����>��l�q�8�o0),��t�N2��ߟ��9)��Tj��[h����=O0K�+>ط�\K��gY�_�i���o��Bڵ�!��yLQ#�(����:죻�p�&*�z�'X�1���6Ř�^R8�H�X[���-j������."�n�8+�+�J�����紨2M?T�2�X�{z�+�E�2��M&���g�jQw�����Y]�zH�ǵ�{tR�E�a"�E]�W�XO�#ƫ��:��=�n���8� �����Eγ����s�]&S.c��nA.�����-�W3��U����x���
SH�骷�Y������"�����Ot�c�Z~�R��ɘ8��BU􌦪x��b�s"�@l�P])���Br&��	��}J>��b�1��jz����lɔ��Y�~+"������$������v)ʸp�j۽�V]��n|��7+��}��?�.�7�\�������Gk��	e����p���A��R�w_�r3��]Qv����w~���^r�o��<����%�щ���p�'*���1d���z9@����$�&=������7��ơZFTMv�'s)-���t�͞��ޔ/��6;/�Y�/�SG�$�S��B��J�������vS�WỪ������.����!Ӕ,���O���k:YNH�D��n&��b��1U߻���^4�������u%r����A%)�ſ򖾱d�kޒ��<��*��?F��s�bPtp��>�@�,��\�.b���&N�F�jY�ݏ��ϧz��^v�R�	���d	ȓ��[f+��	J���/���&�",�u�fū���>F��p��OI�,�p����c��J�k��D<�K�F���,�ۤj��Ri��?�9�����e�MYU��x�N����`��*�1e�u��eoX�0����Ʃ~&�k�zhځ���iM2�d(p]�閬,�Pf|�U��F��c}x��ɗR�A�bl6ۓ���"�ZUh/D	dju�&�4�R��4����d�
�:�{��X��U�ˏ/��c��0�-W�:�	�u{jXՙJQw�ı3�qqC��w��<�4���?�W�{N��,٪�#M�J�xI]1	�;m/P]�"���ȡ�]����]�B��S�(�a�h/��n:�^?۰�xx
����4C-$�����T����S6�ڪI�M�-j�	�'�>���Я�=o�֯:F@a�Q���[5�y��Qڞ��u/���u,OQ5[_��RM�I��vH��*M���u6���۪չ��Ӱ'��+�.!�r{�E����%���ޯG�SU�ztD����������uJ���✫�YS�m�����3_h	�jT�"�;N����L�o,�ꀄ�E1׵S�݌��H�7^Y-�'��R���:lǳ�|�p4 �L�2=�'��f���k��YSt�\�W+�B����bE�%P"�e��+GݾS�[�9W�U�F���dNg�GiY����jb�ޔY�Te�80��P���5��`8Y�f~�֘k�����3Y�t���*�O,#�L���{&�[sal��K#�,]X��Ӯ�c%ε����c;�0��{?�V2Yï�-�On�)q���6��k�&]��T�V�����9]����4��ý�c���J����@�w�7��8����ڵ~��Y:�~Ct��;��k�.7�,{Y����6�F�ؔ�jYI�V��5�K*	l�)Sm
�[�Ut���L˱2���%Z({:�k~��������kJ{���C	AFX~Wt�.B%����b���V֤kԱ���Ѧ&�C����X-�H����)*���^�9���"�_�rN(+D,E|�l}V5�߿I���DƗ�Q�sAQ^����
�bV\��D��u)���Yy��oP+�m�gV\� ���Y5��.Ci~���Г�2e��RE~7�S*�+��}O��Աf0������3�u�����g�j��ݲ���b`�f*��ʿ[�ϋ�+������������.�U-ߔ݃�U��ܜR�v���f�ZO�+���X��"dǋ<��^��!��X��(T��K�Am�u���7@�
���I��Mo>��KFMf��)S��=z��ؗ�"��ж.#��e��ݭ�1c���I�,g$���C-y�V�a�#}ܡk��Nj���j�7�r��S��Q�K�����P���.��hB��5� ��ϬWZ�����ǐ5����MF#��>��u.(�S�t�_����������D`�d��Ck��������tG3W���b"#�"���a�tM�'A�ND��F���_b�7�G�{��7�ǰ{�S���_�k�k�Z�S�\7{ՙ�%��3f�/�t8ZE�Kz���"E��՝���a�
�K\��JȻ�7X=��u$�#H��yQU�~�az�"�q"��8����x�c���Zn�\#�9���FzҰ��ky�bPp�� ��B�DUh���$()��Ե�2�!���P�B/d��g>tEU�?�qZ���ICM���:fH���0����#�/�j�DM0�FvU���v�^иaf���DM�Ϗ�7j��;*
��P~��4��gUw�-���:�su-��w��*׺-[��W6Ԙ~Yu3�sW��AL��7w���)*4�n^���� ��� �u���M���ߒ���-W�f��}��g�wF���$O��<�x�$ Q�yx?��/��X}F�1NڐW1!���|��kj���r��Z��RR�T�;����&[�.� qEbncSSB���"^���a�x4�����U�`�aq;�U,��ӆA?����Ӿ�%��	����{�C8�\�G��Ŕ{X�0�'T�(wp��| ��4��s�c_�����{���X�j����w�Y�{���� ��[L�g���8�8����
,�N�P6���N&�M�-�{�oW?n����^��P.�-�>
�\\�|8�g}}�� {���n����J�x�3�:�^�R���&?���sGk=�x�q���V`)pppp)p'p;�C�p��q��
xp�Z�����G�ۀ�� w��S>N���9��|�����
`/p�c��
<�8X̏Z������_� ��5�a�[���}�Y�bB�6`�N`�Ü�x �������
���(��p�m�D�߀�~Ky���'����op�N���],^�N�..�\��􁻀�����I(��C����K�w W� ��z�5^�&�s�U�-�ق�Ey`3p�V`�!v����޻��2��vǁ���
\< \<� w+pp�z`1����� Ɓ� [��+�;�k���ہ'� g ���x/N�|��%������=�m�]��=����۴|n���/��	\� n6 ��{7/~˧]�K�%�? W�����v��#�������^�xy�ើ�$p:p%����v��{����!��]�� 7g\��A���2�� w o .-A.���ǀ��끋�=������<�}����%�x�<`�>�l���%�׀��{�=��>��N��3�%���ね�:��2-�\����N�r���n.�\L`�� ��zÑ�x+�
x'p6pp	�	�*�����]�|�x�4�X���^\\\|����z�3�B)VGg�� �W� �.��>��,r�o�e1x?��5�2�z��A�;��#�)�;������� �?>��;�X��=�wSG g��v���ˀˀ_>|�2p=��=���O__%�!�t�Z`8�C�|��p�=`�,��7�s�����:������ �b� ���'�C���+���#}�<�x&p-��V��^� q��w�4/��h��E�Ȳ<�;J*��]����N\t��G&#��KO��̊�
����8Q�7fp����G��Zt��$?	}�Kҗ��:.#,��������ХX�-�)����k�m�����qO��C�����x��ˊ�;����AŃ�;n-.��XTWZ\���硏yq̦1/��N�"^ߟ~�I��#�ggAsiq�G/��7N�<�S&��tݟ2����6�?���~��uYg�B(�+-��F��T��:��~_ߕ���������y�Uռ�����ھ>��l�gAa�p �%rh����%����%�)}�SZ|��֍|츟�VQ�C�����*��eԵ��?�9���΂�������i@$
�LղE��b�WC����N{JV��\+.�_E��u&k��K�6c���y�7�<�n��e�C+�����F�L�,aպ�2>��y*��<G�tx��i�#�p��+����uI��6	��"���ð�f�]z�M*������a��ayy���]z�6~)+��~�@/Z��s����7@���r����vB�D�>#,�!�
��d-�+�B�f�2K(*��<G�K�ƴ�h���䍺�8~r��s����B�����/���׳�K_�ׇRy�M�u�z>ys�*��Ӡ��u:�)�s�=	}�S]Y\��J�"�\s�ZS�|�|GX~;t�5a`��ׄ����s�o�a��l�T���e����ȷReyMi�|�GΦ.�Օ./��3�cK��	=�B�<����tɛ͆{�?=�Rf�rХ/��]����r6��"o��L��z��4	����˽�e8�^����\z�Ŕϥ{��@��lDdUt8a�\6v6�A���c���)�/�~�K�L��7�74���#?qd=V���;���j�'���;a�t���?���6@_}�K����p>�%<�����g��I���k�ճ��9���Ƥ
����g��s��%�O�|��_k��*�@�5&=�+�w����>
z��=����K����*�"�\�φ^�O�K�K����Ȥ�E��0�D�;:���|b��J�Vq(#c��z��<ϕK{(��'B��ҝ�Y~��=_R�h��C/q�;>|���j􅔿�-�U[�� t�����:�w���C�V^�z�i���CG��)�;�Y��D�GD�`7��I�ˎb�᥾�ϻ|�� M�q��2E�>�Y�B�t�#��
�}ԟ���;��r���u+�����	�w�}����=�MЯv���P����q�{)���V�;��������k�_�^0
[���O�}�_�Ζb(2*��7Im��|���)��tY�sD�C���z����Y�S��]��k� K��@�������Կ��_�g��o��B�t��M�t�k��9�� \��5T5s�O��~��͏�,��1�סgkO�/�~o?�U�o��K�{�ρ�k~��j��?��UA�S�@�z9�� �7y���~ڗ��L��%����U���Q��z��\�?b�&����<�����#,��A�&����~�[�6�L�g"yN"υiy�>�\�<Rǽ�K���VG��a<#g!r���;�ErF"�ϺuԆ�%g'���A�S���>��2���_�g%���c<G�;�����xZJ�k�H��YB}u�=�jo��g���~5����K�s�!�FX`7C�9��gB�w���t>��ә��˽З@�w��s�/��C�&/I����E1gU�+��J�֟�ʠ��]�t���C�N��3��S�`�סgsѡ������Gf��P�X���P��O�o������/�^��Sm�'g%�d��-.=?���á�e_�M)��x��C�)�������Rw�Bf��MNicy�^ɽ�x�\���=R�}&�ϸ<&�1��_��K�#��	]�
�����=�<� ]�˛}=��@�f�B��~ʿ��~�����S>ʢ��s�o��#Ɛ7��g"�á��O�k��x��|g�G�^���s��5�O�^B�`�u�VC�5��L�����M��ԟ�^]�k����(/<�Bσ^��-4:��J�&f��PW�B�@gi�'hzIC����M�9���fms}iq���^���bg$m������surϿ^5*�6�(��ҟ��s��2�#�L֐ob�z����/�>������O�^���)f���Kʠ_=����ˠ�����
]�6B9:{�+�W�S��'A��n�>z.?���O���m�y��_~,g�Cp4�s���n�?(��.w�=�@�V��N����[��ڏ�
}�s]��T��}�}��_�`� =e�w@;�)��8t��ĥ;��j��gt�_��k�n��;��V�[������w���?ř6�]��a�ʠ����8�]�Ǹ�;������Mt�Y��w
�J�|��z.>v@��([y��@?��|��i�c����{Tg�M�?}+wG�������⤍�d\��8i#o.JBo�Δ���+�'����Z��)�z�l1���4�c��o�xH	��e�٘=UH��Q�@���s@���0�E�_�'��.��*��n�^���_����A=�(m�~��s�@�t�ka�}�p7z�1��Щ&,o�sI�@�-<GO���R�e)u�/���ً}�%�Ot��SڊB]�#�!�-�'4�������mp�ʟ��b믠g�%�)��K���{����<$�L5A�z@�I过~�K�[\�G�4�Sb$g�e-����&�;�?C����Q}����m}}��t��u��#��|�d!�\���z���:��K�K�|������У.]/ߔ<��e�tq#�e�s�$�Л����;�4Bg���V�C�=���C������R���(�[
}�_�7fp�=c�3xHg���%����<b���.�bp�e���yqp�M���l���{7��J]#�+_�2�������`����_��^��~^���;����A���-������}xn�����<��{w��-V�7�Kޛ�?�ފ��
�o�~��ے_�H���z~G��=(y-(�������z~��K
�HEE��A���3
�z�y�Bv|���'yޯ�t�̔��s�)�-+���6�g�����#zj�ٞ�P6���sH�;��y���e>\
��$�}>�̻��a���J�[%�����;k��U�9��v���Pؕ�����<�`�χA���{��5��W��pp�5�K����zN�<���y�uo��5��
/��r)�����4������z���roI}��/Qxi���j�f'���Y8&o�Q����M[�;1���s��]sT���t���$�/	�K����$�/	�K����$�/	,�DW��DgEN���,����"��e�(׏����YK��TaT����?��;K9�?�kY}GDV���׺y>��Q�a5"�˲�Sg$@�<��0*���̵O��Φ]y����<��U��l�e�=�� �Ա8��"�.ʝΟ��wߙ|��]��n����g�n���o���A_�DO�{:�Q|'��w.߅|��� _��e��]P2bƜ��dGɹ���e��PX�m�J�*K���Є����Qe��ηe��t�+ij�أp�*{�����Hz�1=>�Q��q�3�Y�x\:�#r�t��si������΄�����yi\����F.�hw�\�>Rz'������
,P���v�����;-�v	=����(����quZ��W�F+�>xj�Ƴ�Q��}袑|�_��i�\�xK\��IV�)`��,c��ҧ$b�ϣ}�q��G�7ؓJ��
^
nmX���O)�j[>٫�����-@�}�%��@�g��oʃ�?O�,����c���c�R��@�#�S����G�J#�<�X�h���,�H{'݌�xu���/i��n�#�b��_�p;^y�׍���G�R���'{�v|J�^;�/{E�'��dd�V���]
��'#Q��������^l🁿��o��0��D��|�)߈D�^������"Q���w�=�c|��5����#�X����U���K�f����vM��f\v��"щ���Ma}+�G�	�����D?i�K��_�� �C��?+�1�~����B���?���&��s_D{�	��.E� �o�󛑨ܛ���Ӟ(����y v�i�w$������Z��d�/#�[ʏ.	����+���o*i�m|З#Q��䟌�����7���1>���:���%�M�nC�>���W�&���@���	~���A���n%�w���ː�>����Ћq ���O1�ې�m�f�r�?�wY�x���,4�o3�����a�螇"Q��B?\�1Å�{�࿣6�U��#cP~�C~���>�H}_?��HT�w~ |���8�)a˖H���?�tҺо7���Rh���!�SM�O����~��u�+���{��?�C�9���}�Q\��w$���c���ޭ~O�`�|���i�W�7��h��Ø�vP�Շ���"ѷ�f�3i5Q�ׁkC$�Ѡ�w�G}J�?�����Cy�;�P�Y�)��h�Ù���z�Y���S�|�����}��8�)֕�zʥv��������O�����#�g���=��=�����~H��������*x3��g��ᨷ|?�{�R>���H5Q�W����V�πo����*8t����n�&����}��L�? ������+�pu�m�������m��x[�}��o>��/F����0<���5���=�xL�},l��j�E�(�o_e�3����z(��}E7T�v��� ���R^ޅ1��[ĳ��9����m�_	�����z�Q������{>���������__O�a���3�A��|7|�Ė����-�����6��ᯢ>[�5�o�Ob�ҟ���`����}�p��p��6�o�7��}5�3_)�
x�3^:bW��0l�ߑ�ː��Y��w��Ǣ�������tK����>���)V�������.�?������?����RG��8�xus�/��_~���[���oO�_ |`��	��G�����/5���'>�>��P�{�T��S1�Q̯W�e��_k?�<܁=���Qp�l�þo7�ˇ��ؓՇV���j��_>}����i���p7>� _���_ܱ����?v<~��C�v��+��O��w}Q�ױ���fpןu�ۏ���������,�u�����g�����~����j�+�7��ƞ���9"Uߧ�Wb�V߿���o��z�+��W�ħ�w�i�J�Y��w��o��i/a�r/�%��"��;/�?��e��$&�"���/?}���n�x���
��/���m���"����LyyWH�Y}��q�;����Ӊ��}��~	�o��^G~�Q�ħ��n��(���>����'8�XXt�	�-~���V���ο����;���rJij�ť�������ߎ��~�9�c��|#����c���"�	ċV���-�c�gp���#���	�s.���m}[��G��M�;��$�zƫ��Gܝo�?���~�V���;�{t�s����}�q��m�������#y7�@�������]���G#��&�'<��_�%U����ƿ[�z ��^�4�m��/0c��G�~�����J�!N|�U𿣿���'��Я4�x�wi���Z��Ƕ�
x�OJ�f���n?��P��Y{3x3�/_�;�����σ����������$g>9a4򥾙�%������G9����G��܍��F1n��AФ�σ������D�������3~v�rA��NE�a�����#��	��Krl����}��;ȯ���O�%�+[߷����ࣙϭ~������L��w��!p�~�����~��N�c�y�żc�)��ﰇ�)+�����Ux	�'�g�s,�t����]?>�)��������%����7�ϧ>�B���;?��	��j�#�Ñ�D������W2,�����t�?��������m?��2l��$�����������t�G�k������O�@���	c�����ĳ��~������K:�����|�g������'����'M}g����o�����z�]�o>��1�S�5T����_~"�߶��Y���3�"��D�W�CN�?>��1���]�?�2��;�U����V>u೉��'�g5x�o����� F��߬=�^��ׁ��E���믟��0~2m	��I�w~�ী�~�f�����f�п��u��@������g�V��/q���?�~����I��O�_J��|p'��n��s�)���ܱ|0�h�+��G�7O��Y���o����`
�s��UPV�u�b�M��O�?���E/�"U�������]���|�3���O��^/���_���1�}�O2~���\�e���#�������?�>��|�9����
~�}~H�S�����d~�z>�i�7�y(�#�x��3������� ^���G�{�w���jے�Ɏ�sKk�D��q�S&UOO$�����y�����DrA�������u-�yM-sj�u���=QӱȫmY��T���+=��S���x�osc������D}s��fon[͂�D]ǂ7S��x�oc2%kk[����V/quur��D��E�V�'�ɚdc�*�X��xXKs���.QWߞl�UxYc���lʕc�L�HǜĤĂ��f��0m��Dl�xz�E`�/�:#�h2L?-���	�c��ǌ��B)ץ&�^�����1WL�S�O$�5w$j-Z�8)^��_}<���fRc,V]��T=2¿1>S���%�-m�{#CR��'�~Y"V~n]�ܹVsm}"ysk}l���1����u���a[�#��oJ�45�Ԫ���F/�Y�ho��>�PIzdmcsU�eS&�7kVbdi�J-��,�U���KԶ��<��S6V�3���c�`zB�=_�; nMW�c��5�����ObNM{�$�Z�,/O\�MGb#����+T��H�T/���38��`DƗ+Q��Ĵ9�d[}��F:x~bR�ݘ��a�NV6շ�˓�q20�JS�T�PrK,hYX����4eNY�c�p�hK��z�h��rQ��"Q�C��iV�%Ɇ���M������������tEЕ�k�Y� }(��Aeu-׉l*�-D�2H��ym8v�^à�G�q�h�����(�^�f�5�K 9�5m2R�ª�ն4�'CSk�����������+�f��?m�d1f�`�Ŭ6:��]�8P͚�d�$Q�t/�����64��2���ע�^����mj�#^G�Em����c�H�hij�5��[ur$�Ju=�z�Rq����V&1,@Y��-8ҊĴ`����N��c=�@G]�e�NT'��5$U�����ʓ0�.�I�$�5&M���#��-O���R^�P�Ш��?m��P�Ě��6�O��,����H�US��Dm{����x����1.���e�I�vU9��}VW;���U�wSj��8��q��2�Lu����Q�u⺹����I����� ßEd/>�ˌ�<�r�����ڈHZ$jjk���$�5�bD4������d��G%�I]k�T�g��U=�nY�_vcx��sl$ܓ�D���@5�K���t�@Ė9����|z=�>����8vJ#*H�J�5ZBm��Y�Y�
�*Uh�G�k���;�)}��4�q�"����,�๴���"Fm�Y'�oF��*d�u���o8�4�S�}0= u��?���e����X��&��Ǹ���vYmd�`�=�ف& ̚5��2J�*�h����P�3�����D�M��l3��E]S|a���z�4�o�I���ofF�R�3�$!�K�L���]�(��W:�d�u ��DA)NE�9���1�J�ܘ�UxX.A[��H�+պl��1��e�	�*ӂ>+�X#��>Ft��#F%���d\9����Ħ1p|�u)Sh�OH�m��֏C�����x������Y���z����b�8f�D�nliW�{�$��"�tk��]�H�@��Č[�\3��>�8w�,&�6=7�'�kk�jX)3G,�i�`m�G�h�z�	1ܥr�`�h8MƱJ���i��Q�kҩm���AVU�^e�� ��,z��>�O[~2[<7���!���&�8a��M-7�ڻ���W�Q&J�0k�,#��\1��3{jS{�M5muD�b��]\�����,�Zڌ�A�N�����}��p���-��B�;��e����\��n=i(�b�f�桊�;+�{�Ү��m�_@-#&��S֞i��#���1͢2c���\�4�H?��"0[��!�z?a���` �+O�We:.��p�XF���	�C�?pr��0�Q�`6d
v�d��a��D�U�����A��;��-�Lcf��!,W��Y�[d)��ɍ1�S�Y��i~K���@r��ʪ�R3��+\סJ��z�@��%�r/շ�����K�"��"#{H���F���pJ�OtW%��ג=�_��t֝�,Sal��su�]+���L��$rN��n���{�.��V@앭5�m8��TqN�s1m�49d@2��d.�U'lR*��$Rb,�G��=���L�e�lʴ�7�E�`�&�["W,��@V�����c���_1N��K���MlX��R�P�ѓ���%F&m$���f�����j	�Q���7��Y���]C�q&��J;�����u7���'��S�͓�dI[�؜�h�� ��l����i՞U�%,0�+��,Fa�����t�JS�\�N��ȭ�ً����ܐrUp4�]	G8)�J�`�����S=d��*$Ȓ�p�:�a�kcY-�1C�L����	J�)8���.�R����&2�̩�ȉi��e��2@��9��~e��^#������\L��n�:��r��9�x�8�q>fjO�l噫"����ttmMkM-'w�[�	0S���1����bU��\aYf9TR���(6{(b��A�e'��^#c�qz�)�`P�tv�`˼Fo�)���,���&?��J�k��ͱ�-��Џu��:�c���Vzf�����y�sk��k��S�8�Ԩ4m^ʩ`a>��D�kzƔS���d;M�U鹝��7�Y罌*lPh�@���xB��w`m)5�\|����ZS79�H���6ɲN���	��
E�.��\�S�*�_�
��	Ш���s�W������0U-����1�t�,'�rYF�[f߾	<Na��cs�02
Nlq�S��WS���8�C�lNHv��>�r�����Q���U;�V�Z�� 5w��,a%��I�P2�*�����eH���=�/=�T��Z.�t4�P:g���F����x�0�m��IX���φR�{������:'�9x4^�v9s�u���e�Y�"{�կ���~�m`N��p6�`fG���l֨.�7 �g��UB1�)��wC[G�5M������d�l�bfT쬥�fƬ�`9k��m֙�+T���ږ{Ĺ[��Z�E���2_��{k)u��x8a�����r[��]�G���g��xs�1�m� ج�u@��0۝:u=%�Sw�u�-�nc����ޗ1�s�F��8�<cY�\��u{�뼏�Os�� K��E��VZ �Zp�1��Q���qڼ��"�[x��\�u��V.�Ԥ3���\�ֿ횸�Lnr�a�W�^1��f�M�B'�T7�J�)C���Z�ETs�t} vr���a��Cޗ4�g�%4':RJ����A���RmJ���6C�ҷH���=�5f�m6Μ��+uٔ;}�=�a�ug�`j\�e6�\���fYH�8_�q��!v�98M� 5�Z��xW�X�xW���^��2���E�{�#��֛>Ԋ��r�����Y���G��q�3|�9�[a�3c�{`ګfF|U�3�r�V�>����;TڻV�f}M!�^}�5�K3gs��1��	��rI<�������i�d�`w$P�� 6���+�u;%���C��i��v�����A�ڶd��7�=}�Y�^��jq����}!e7���T>*T}�+�%����<v\fF=iTW���P;�W#;m--�-���A��LΫBH#�vM��F=�=�5Dg@9oy2�0���C�)�4�J��a̞����&Po�Ă���2�AǮT�ݓ
W��&�,c/6rg��N^ʯm�6߀�V��\�K�i羘����󝍈��6n񃲶z~�V�/���0L��iՉ�9�u��I�Qpj�4Ղ3�.���*����#*��G��V�6ӱ����f6L�4���Ni	`>=蕃=��8µ�2���]�kF��5?��Q��]m���5�M�}�=��\���=��fvÔT���^c� ��T�d�f�]H;�עP�\y�N�o���d��\�GN����_O�?M*�͚�*ؔ=p���v�����_�׻�0���C�K�miӿ��a~YlO�2���Ȯݬ����w9�� ��e��dT�����JYb���â������/VmA_i'����dT��*n��r�<>����[e?`li����Uv��FN�?'�rΙE���ҀD*�erg���O�B+�\}i#�N�x8��A��TO���Vip"���}0<�
¤	����O����]7���\�?��ζ{�.���fmA�1�p��˛n��Gx�����1���F��kZ�Y�^F#XD�N�����ް���_�wH�A�˝C�����Yz�^>�����Lt�u\��*������hX6Pwu(�~%�fG�t�,1Ξ�fFUr.����Q�=�I)u�L1�3��wK�ٜ���]���;���i�-ՉXz�:����A)�4��x}��Α=���j����cs�M���1���&f���׆��=��X�-0�*^ᮿ���EESݷdj�xWȇpIk`b'�M�P�����[��(�m�T抋R7�����6Pp��$�����R������֎��/�_&��K��چ��&b�e�Y]�\]u��Έ��7%��g)�f^���R�3��;r�\�B�z����3�ҝ|�-H�Nl��{�pv���N�Y�(%�Ɉ%��ˋ-�Vd��٬ރbw��XxV��΁tpr.�3��q5�(]ӤZq�ج��B(�ᕝEe{���ԗ:�'ԕt��<��������hå柶*�k���X��m�NЎ�aI������dj�Үwe�����}h��ܛb��_e:�����(��F�l�ĥ������;�x� ��Ts�y�%Z���[�y�Q���²4���i��n˦�Hc��R���ed�Lv��^���X�����=��1u�3r�͝0�ڕQӅ��i�t�"�C��b��1�*�;�����752�L�o�X ���q�8I��b0mahx�d�*7cIfO�z?��YBݏ��r\]J�J��<�7C��c;YV6?�����gaI��L	n����iT�de�*#9ל��H�&�Y�s�+"�}�п<� ��\j�_�!\u��>PyY������4�`���t��/di��%����qx�цs6n�����wRm-����=�W"��g�
d��r(Q�ݜ�X (��2/����[]����}T��62�V��g�T�nf�#I��k�7�e[ ������=\��/m�yA�f0٦a�}jl�;�^isK���W �û~���J�t46՝�X�
�P�������L}&�4e!�;o4LA���$�~hmJz��U)���Z@y��ʋ�Ӣ"����ņ:��u��&�K��7�Te�-���<����[����r-Ii�	lJ9D�Jy��\^QyHyw0����S�n�;xw.�qNI���3|�+��o��ߒ*��~"�Aލk���V[F>y_���|�I��N꓿���|���+4%�|yŧ��x��'�O>aB��*�����L�|U�N���Գ�+�����œ|��D��l϶]I��|�����R�-%�
��]�Vڕ�-|�+��o����Cy��I>yah'_�7�����I��Y����m�{y^�y��^�}�g����C��'3���W�NB�H�/;�V�n�U�lV����0	�>�skȗ//z5�O>��k����Y[-Y,�X��m�\�o �L>y���|�%A�|�o�M���)�l��l��߰[{-�&.�����j��߶{��WU���u��|e,�o���/U.��?A?�䓿��!�,����/<K�R��n_
i�d����@��[o�0i6�t���>��zf�O��s򩿵��6�f?�G�Q*����0i"�#怿�d�t����$�ʤ���x�������_)"�c�*��|���aN}�Q�3L�j�[Ës?M:��W�ņ���}��D���?��~�330601000100061662maraton/.git/objects/77/8d307d39984b0a2f914529b0f83107ad629955x}S���0�����J�D�T�B���BU�kN;�n�������������̼��͖���~��|4�����M�|��SA�"�����ձ�"~���E���I�<iז�&�w+J�m��d���9��u*xʍ�Eٶ?��V��V��4��`	(ל4`G���Sil�QrNTPG���f�(FTMo�z���djM��z��	 UelQT+R�SZ�zM�'�Vj-Gƽ����Vw'Ԇg`+�g��7�0�&�W���YVd2������=���.p �D����ЌP.T�
%�J�Z��E��гJ];Mgƾ��f:��Ky=�!�ʋ��>�r��(g��B{�乶��	�i�}�Y³�8�����%�5��=�/���5�S0�ܙ?:͘dl�c@�e�4q!8קֿ���4���Ϝ2�<<P��`�:Ν��-߳(�����m����4h�w��פ�3�K�������7���]�ԝ����ĸ�z���Ϧ�y�K�(T
cr�2��z<��
�GhX�1ǝs���jǉ����-vyd�a�l�(n���%�LPt_B��P�=��O�_0:g�O��ć���rs�}���p��s�!�*�330601000100051162maraton/.git/objects/77/4f8ecbb3dc11159986e1e3ff2b236cdc875542xm�ݎ�0�{k?ŬzK6
U{���A�`�V�0�1)���U޽3�"�{>sfR�������7�me�Z������#F��u�\�o�GJ�n�n�Е��U ��	9��.z��J�����Τ��duh]�������O������m�AJ��B� ?��K���湣�I���7W$ ���vPҹc�C��	`J��=13�e��@��[�@�ĻQ2�|p[��m.��k����.�:�����R��fR瞲%�m=��LT-�nti���Eύ�|�����{���r9�J�Q�vco��K�ni]׿ٯO%�4/i|�_qj����M�G�~<��T1�Ӂ}�G!��00�Ao���Z61ob:-�x���A��۠��Rjݟ�6�4��ĳOd#٨���XR��;c�}>3�N2�.��,
8|�"��+n�4
~V�9Y��ds�	��FT��x A��43K�t/n��:�{��s`�(V1���[{w�&�OT-�168931000100023maraton/.git/objects/35330601000100033862maraton/.git/objects/35/2664fb5d8746a30e4c5bebdcd2e3959d83f8eax+)JMU017c040031Q��KI���(��a0k�b�+�����Υ<?���� ��J�ЀaMpf��Ă��i}k�B+�K�aQh��x��8o��G��fO�Co$�`*4e��-��:����J��'UgxL��Tg���r�ɜ��!޲'��L~�^n:��Μ�\��̃g�q�-�0;s�l�Lu�o�y�]5������퀵�&.�Tg��_��՛�cvGu����W��W"�3���$�C�,N�lM�f�)���Z��������1	�~�t��`+�p�&�2c�2�����>�u�gN|1�{ҩ����L �Ξ��R�#Y��hRg�q��y�S����168931000100023maraton/.git/objects/63330601000100051162maraton/.git/objects/63/9dd738df4e91617856b10b100061588700a87dx���n�0�w���h/1�sh�8�a��++�`G.d(��GR��f���}�?�OR�m�*{|�ro�n����o�sRȱ����l��J�zRZ7���V�ԝu��� o��7q��_&�[W'��\Y�J@^� �a/���ŀ|�1�q(Ɂ��������yA�=�=�z���,���Ν��s�i�\�B���st�CL�ǖ""|	�O�G�b�7�nO�(@qB\�	���}*ل)�*��UG�7�L�����JiDq�k�@�,Nw��w߰Cp���Z��eS�quK�ʛa��#q�ٮS�%g �&R`�#>�϶��zO����G�U�V%�9:&_��*���۴�&-+��6�U9�?� �}�@�(o ��:�`��ut�N�2G�@��@|7u�Ź����O���}wE�8b���xV�"�ǝ��Yp��.\�M]����x����a��_=�8S8�#�{�-���D��i���!���kN33204100010009523maraton/.git/FETCH_HEAD0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3		branch 'master' of https://github.com/cccsar/maraton
168931000100017maraton/.git/logs3320410001000147322maraton/.git/logs/HEAD0000000000000000000000000000000000000000 02590e5d95cf786c874c4a77e66096c47e24ba27 cccsar <15-11295@usb.ve> 1556284989 -0400	clone: from https://github.com/cccsar/maraton.git
02590e5d95cf786c874c4a77e66096c47e24ba27 8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 cccsar <15-11295@usb.ve> 1556463241 -0400	commit: d-update
8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 79c4b9b1f94d15e6ecf49475b0fee0de02fea20e cccsar <15-11295@usb.ve> 1562342087 -0400	commit: update to c++
79c4b9b1f94d15e6ecf49475b0fee0de02fea20e d03c383a613971bb1c2d12873953e28f65115392 cccsar <15-11295@usb.ve> 1562345394 -0400	commit: new update
d03c383a613971bb1c2d12873953e28f65115392 299b2f0c31020438435c5ab38df64cc1cefb40f2 cccsar <15-11295@usb.ve> 1570614674 -0400	commit: update despues de mucho tiempo
299b2f0c31020438435c5ab38df64cc1cefb40f2 01acfec5abde5ba37617b796aeb6c6593de3b23c cccsar <15-11295@usb.ve> 1570614732 -0400	commit: uno mas
01acfec5abde5ba37617b796aeb6c6593de3b23c b36f208f8b54a12de0474b015f10b415af33eef3 cccsar <15-11295@usb.ve> 1571095116 -0400	pull: Fast-forward
b36f208f8b54a12de0474b015f10b415af33eef3 8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 cccsar <15-11295@usb.ve> 1571142406 -0400	commit: 15/11
8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 b30765df6ab4056e6b09224482d9cb1faa957cbb cccsar <15-11295@usb.ve> 1571219955 -0400	commit: pusheando
b30765df6ab4056e6b09224482d9cb1faa957cbb 0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3 cccsar <15-11295@usb.ve> 1571260795 -0400	pull: Fast-forward
168931000100022maraton/.git/logs/refs168931000100028maraton/.git/logs/refs/heads3320410001000147335maraton/.git/logs/refs/heads/master0000000000000000000000000000000000000000 02590e5d95cf786c874c4a77e66096c47e24ba27 cccsar <15-11295@usb.ve> 1556284989 -0400	clone: from https://github.com/cccsar/maraton.git
02590e5d95cf786c874c4a77e66096c47e24ba27 8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 cccsar <15-11295@usb.ve> 1556463241 -0400	commit: d-update
8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 79c4b9b1f94d15e6ecf49475b0fee0de02fea20e cccsar <15-11295@usb.ve> 1562342087 -0400	commit: update to c++
79c4b9b1f94d15e6ecf49475b0fee0de02fea20e d03c383a613971bb1c2d12873953e28f65115392 cccsar <15-11295@usb.ve> 1562345394 -0400	commit: new update
d03c383a613971bb1c2d12873953e28f65115392 299b2f0c31020438435c5ab38df64cc1cefb40f2 cccsar <15-11295@usb.ve> 1570614674 -0400	commit: update despues de mucho tiempo
299b2f0c31020438435c5ab38df64cc1cefb40f2 01acfec5abde5ba37617b796aeb6c6593de3b23c cccsar <15-11295@usb.ve> 1570614732 -0400	commit: uno mas
01acfec5abde5ba37617b796aeb6c6593de3b23c b36f208f8b54a12de0474b015f10b415af33eef3 cccsar <15-11295@usb.ve> 1571095116 -0400	pull: Fast-forward
b36f208f8b54a12de0474b015f10b415af33eef3 8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 cccsar <15-11295@usb.ve> 1571142406 -0400	commit: 15/11
8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 b30765df6ab4056e6b09224482d9cb1faa957cbb cccsar <15-11295@usb.ve> 1571219955 -0400	commit: pusheando
b30765df6ab4056e6b09224482d9cb1faa957cbb 0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3 cccsar <15-11295@usb.ve> 1571260795 -0400	pull: Fast-forward
168931000100030maraton/.git/logs/refs/remotes168931000100037maraton/.git/logs/refs/remotes/origin332041000100017442maraton/.git/logs/refs/remotes/origin/HEAD0000000000000000000000000000000000000000 02590e5d95cf786c874c4a77e66096c47e24ba27 cccsar <15-11295@usb.ve> 1556284989 -0400	clone: from https://github.com/cccsar/maraton.git
3320410001000126144maraton/.git/logs/refs/remotes/origin/master02590e5d95cf786c874c4a77e66096c47e24ba27 8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 cccsar <15-11295@usb.ve> 1556463255 -0400	update by push
8d15ab43e2e0cc46b00df13d4f0bc94c5cb58f55 79c4b9b1f94d15e6ecf49475b0fee0de02fea20e cccsar <15-11295@usb.ve> 1562342102 -0400	update by push
79c4b9b1f94d15e6ecf49475b0fee0de02fea20e d03c383a613971bb1c2d12873953e28f65115392 cccsar <15-11295@usb.ve> 1562345406 -0400	update by push
d03c383a613971bb1c2d12873953e28f65115392 299b2f0c31020438435c5ab38df64cc1cefb40f2 cccsar <15-11295@usb.ve> 1570614686 -0400	update by push
299b2f0c31020438435c5ab38df64cc1cefb40f2 01acfec5abde5ba37617b796aeb6c6593de3b23c cccsar <15-11295@usb.ve> 1570614741 -0400	update by push
01acfec5abde5ba37617b796aeb6c6593de3b23c b36f208f8b54a12de0474b015f10b415af33eef3 cccsar <15-11295@usb.ve> 1571095031 -0400	fetch: fast-forward
b36f208f8b54a12de0474b015f10b415af33eef3 8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 cccsar <15-11295@usb.ve> 1571142417 -0400	update by push
8fe4c0e58186c02fc65e8c6ecdad9cdcab9f4bc5 b30765df6ab4056e6b09224482d9cb1faa957cbb cccsar <15-11295@usb.ve> 1571219965 -0400	update by push
b30765df6ab4056e6b09224482d9cb1faa957cbb 0ca6835bbd6ea0bcfaf7887e3b946fda818b09b3 cccsar <15-11295@usb.ve> 1571260789 -0400	fetch: fast-forward
168931000100017maraton/.git/info332041000100024025maraton/.git/info/exclude# git ls-files --others --exclude-from=.git/info/exclude
# Lines that start with '#' are comments.
# For a project mostly in C, the following would be a good set of
# exclude patterns (uncomment them if you want to use them):
# *.[oa]
# *~
332041000100033019maraton/factor2.cpp#include<iostream> 

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d, &c, &cc)

#define MAX_STR 1000000
	
int sg[MAX_STR];

int prefixFunc(char *str, char *s_str) {


}
int main() 
{
	cin>>sg; 





	return 0; 
}
332041000100063328maraton/farida-propper-2.cpp#include<iostream> 

	
using namespace std; 

long long farida(int coins[], int ind); 

int main() 
{
	int t; 

	cin>>t; 
	long long resp[t]; 

	int aux, n; 
	int monster[10000]; 
	for (int c=0; c<t; c++) {

		cin>>n; 
		for(int r=0; r<n; r++) { 
			cin>>aux; 
			monster[r] = aux; 
		}

		resp[c] = farida(monster, n-1); 

	}

	for (int k=0; k<t; k++)  
		cout<<"Case "<<k+1<<": "<<resp[k]<<endl; 
	return 0; 
}

long long farida(int coins[], int ind)
{
	if (ind == 0)
		return coins[0];
	else if (ind == 1)
		return max(coins[1], coins[0]); 
	else 
		return max( farida(coins, ind - 2) + coins[ind], farida(coins, ind - 1) );  
}	
33204100010001017maraton/README.md# maraton
332041000100039920maraton/whatsnext.pyimport time

beg = time.clock()
result = []
b = True

while b != False:
	k = input().split()
	k = [ int(x) for x in k ] 

	if k[0] == k[1] == k[2] == 0: 
		b = False	
	elif k[2] - k[1] == k[1] - k[0]: 
		nextT = k[2] + (k[1] - k[0])
		result.append("AP "+str(nextT) ) 
	elif k[1]//k[0] == k[2]//k[1]:
		nextT = k[2] * ( k[2]//k[1] )
		result.append("GP " + str(nextT) ) 

for x in result: print(x) 
332041000100046717maraton/addrev.pyimport math

n = int(input()) 
resp = []

def addrev(t:int)->int: 
	k = math.ceil( math.log10(t) ) 
	rv = 0
	u = t

	if t != 10**k : 
		k = k -1 
	else: 
		return t//10**k

	if k == 0: 
		return t 
	else: 
		while k != 0: 
			rv = rv + (u%10)*10**k 
			u = u//10
			k = k - 1
			
		return rv + u
			
for i in range(n):  
	arr = input().split()
	t1 = addrev( int(arr[0]) ) 
	t2 = addrev( int(arr[1]) ) 
	resp.append( addrev( t1 + t2 ) )
	
	
for i in resp: print(i) 
	
332041000100072916maraton/test.cpp#include <iostream> 
#include <stdio.h>
#include <vector> 

using namespace std; 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)

typedef vector< vector<int> > adyl; 


adyl perico(100); 


vector<int> func() { 

	vector<int> hola; 
	FOR(10)  
		hola.push_back(i);

	return hola; 
}


int main() 
{

	vector<int> drogas; 
	perico[0].push_back(3); 

	FOR(perico.size()) 
		perico[i].push_back(i); 

	cout<<sizeof(perico)<<endl; 

	FOR(perico.size()) 
		cout<<sizeof(perico[i])<<endl;

	//test values of 2nd dimention vector in nested vector type
	//test vector asignacion as return value for a function using = operator.. it works.. is if eff?
    

    return 0; 
}
332041000100040239maraton/vus_the_cossack_and_strings.cpp
#include<iostream> 
#include<string>

using namespace std; 


int main() 
{
	string a,b; 
	cin>>a>>b;
	int count,neven;
	int diff = a.size() - b.size(); 
	
	neven = 0; 
	for (int i=0; i<=diff; i++) { 
		
		count = 0;	
		for (int j=i; j<b.size()+i; j++)  {
			
			if (a[j] != b[j-i])
			{
				count++; 
			}
		}	
		
		if (count%2 == 0) 
		{
			neven ++; 
		}
	} 

	cout<<neven<<endl; 
	
	return 0; 
}

332041000100030324maraton/pair_of_toys.cpp#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int main() 
{
	long long n,k ;
	cin>>n>>k; 

	if (n+(n-1) < k) 
	{
		cout<<0<<endl; 
	}
	else if (n+1<k && k<=n+(n-1))
	{
		cout<< (k-1)/2 - (k - (n+1)) <<endl; 	
	}	
	else { 
		cout<< (k-1)/2 <<endl; 
	}
	
	return 0; 
}
33204100010001213maraton/input1
4
1 2 3 4
3320410001000187422maraton/knapsack-2.cpp#include<iostream> 
#include<utility> 
#include<vector>
	
using namespace std; 

int knapsack(vector< pair<int, int> > &v_s,int n_objects, int size, int resp[]); 
pair<int, int>  max_pers(vector< pair<int, int> > &v_s, int prev_sz, int current_sz, int size); 

int main() 
{
	vector< pair<int, int> > knap; 
	int s,n; 
	
	cin>>s>>n; 
	knap.reserve(n);  

	int val,sz; 
	for (int k=0; k<n; k++) 
	{
		cin>>sz>>val; 
		
		knap[k].first = sz;
		knap[k].second = val; 	
	}

	int r_sizes[n+1]; 
	for (int l=0; l<n+1; l++) { 
		r_sizes[l] = -1; 
	}

	int max_sum = knapsack(knap, n, s, r_sizes);

	cout<<max_sum<<endl; 


	return 0; 
}

int knapsack(vector< pair<int, int> > &s_v, int n_objects, int size, int resp[])
{
	
	pair<int, int> aux_p;  
	int max_val, acum; 
	max_val = acum = 0; 	

	resp[0] = 0; 

	for(int c=1; c<n_objects+1; c++) { 

		aux_p = max_pers(s_v, resp[c-1], c, n_objects); 	

		if (aux_p.first+acum >= size) 
		{
			break; 
		}
		else { 
			if (aux_p.second != -1) 
			{
				resp[c] = aux_p.first; 
				acum += aux_p.first; 
				max_val += aux_p.second; 
			}
			else { 
				resp[c] = resp[c-1]; 
			}
		}
	}

	/*
	for(int r=0; r<n_objects+1; r++) { 
		cout<<resp[r]<<" | "; 
	}
	cout<<endl;
	*/

	return max_val;
}	

pair<int, int>  max_pers(vector< pair<int, int> > &s_v, int prev_sz, int current_sz, int size) 
{

	pair<int, int> resp; 
	int k, ind; 
	k = ind = -1; 

	for (int i=0; i<size; i++) { 

		if (s_v[i].first <= current_sz-prev_sz) 
		{
			if (k < s_v[i].second) { 
				k = s_v[i].second; 
				ind = i; 
			}
		}
	}


	if (k==-1 && ind==-1)
	{
		resp = make_pair(-1, -1); 	
	}
	else { 
		resp = make_pair(s_v[ind].first, k); 
		s_v[ind].second = -1; 
	}

	/*	
	cout<<"The max value returned is: "<<resp.second<<endl;
	for(int p=0; p<size; p++) { 
		cout<<"size[p]: "<<s_v[p].first<<" value[p]: "<<s_v[p].second<<endl; 
	}
	*/

	return resp; 
}
3320410001000101017maraton/1217a.cpp#include<iostream> 

#define FOR(n) for(int i=0; i<n; i++) 
#define ROF(n) for(int i=n; i>0; i--) 
#define rint(c) scanf("%d",&c)
#define rints(c,cc) scanf("%d %d", &c, &cc)
#define rintt(c,cc,ccc) scanf("%d %d %d", &c, &cc, &ccc)
	
using namespace std; 

#define MAX_QUERIES 100

int resp[MAX_QUERIES];


int pairBS(int str, int intg, int exp) { 
	int a,b,c, count; 
	a = str + exp; 
	b = intg;
	c = exp+1 ;
	
	cout<<"a: "<<a<<" b: "<<b<<endl;
	while (a>b+1 || a<b-1) {

		c /= 2;
		if(a>b) { 
			a -= c; 
			b += c; 
		}
		else { 
			a += c; 
			b -= c; 
		}
		cout<<"a: "<<a<<" b: "<<b<<endl;
	}

	return (a == b)? str+exp-a: str+exp-max(a,b)+1 ;

}

int main() 
{
	int nq, str, intg, exp;
	
	rint(nq); 

	FOR(nq) { 
		rintt(str, intg, exp); 

		if (str > intg)  {
			resp[i] = (intg + exp < str)? exp + 1: pairBS(str, intg, exp) ;
		}
		else if (str == intg)  
			resp[i] = (exp+1)/2;
		else  
			resp[i] = (str+exp>intg)? pairBS(str, intg, exp): 0; 
		
	}

	FOR(nq) 
		cout<<resp[i]<<endl;

	return 0; 
}
332041000100048518maraton/acpc10.cpp
#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int main() 
{
	string XX[1000];  	
	int v[1000];
	int count = 0; 
	int a,b,c; 
		
	while(true) { 
		
		cin>>a>>b>>c; 
		if (a==0 && b==0 && c==0)
		{
			break; 
		}

		if (b-a == c-b) 
		{
			XX[count] = "AP"; 
			v[count] = c + b-a; 
		}
		else { 
			XX[count] = "GP"; 
			v[count] = c*b/a; 
		}
				
		count++;			
	}

	for (int c=0; c<count; c++) {
		cout<<XX[c]<<" "<<v[c]<<endl; 
	}

	return 0; 
}
332041000100078420maraton/eggypizza.pyn = int(input())
pizza = [0,0,0]
 
for i in range(n): 
	fraction = input() 
	if fraction == "1/4":
		pizza[0]+=1
	elif fraction == "1/2": 
		pizza[1]+=1
	elif fraction == "3/4": 
		pizza[2]+=1

if pizza[1] >= 2: 
	if pizza[1]%2 == 0: 
		pizza[1] = pizza[1]//2
	else: 	
		pizza[1] = pizza[1]//2 + 1


if pizza[0] >= 1 and ( pizza[1] != 0 or pizza[2] != 0 ) : 
 
	if pizza[0] > 0: 
		if pizza[2] >= pizza[0]:
                        pizza[0] = 0 
		else: 
			pizza[0] -= pizza[2]

	if pizza[1]%2 == 1 and pizza[1] > 1: 
		if pizza[0] >= 2: 	
			pizza[0] -= 2
		else:
			pizza[0] -= 1
		
 
if pizza[0] > 0 and pizza[0] <=4: 
	pizza[0] = 1
else: 	
	if pizza[0]%4 == 0: 
		pizza[0] = pizza[0]//4
	else: 
		pizza[0] = pizza[0]//4 + 1

total = sum(x for x in pizza) + 1		
print(str(total)) 
3320410001000162921maraton/traverseDir.c
#include <stdio.h> 
#include <stdlib.h>
#include<sys/types.h> 
#include<dirent.h> 
#include <string.h> 



void cat(FILE *fd) {
	
	

}
//tal vez serviria empilar o encolar los DIR* en una estructura para recorrerlo
void dirTraverse(DIR *dir, char *dirname) { 

	struct dirent *current_ent; 
	DIR *ith_pointer;
	char path[256]; 

	strcpy(path,dirname); 

	//primer print

	while( (current_ent=readdir(dir)) != NULL ) { 

		if( strcmp(current_ent->d_name,".")!=0 && strcmp(current_ent->d_name,"..")!=0) 
		{
			// primer guardado de path; 
			char first_current_name[256], buffer[256];	//fcn,modificacion de path sobre la marcha
			strcpy(first_current_name, path); 		//temp de fcn
			strcpy(buffer, first_current_name); 

			strcat(first_current_name,"/"); 
			strcat(first_current_name, current_ent->d_name);	//modifico fcn 
			printf("%s\n",first_current_name); 

			if (current_ent->d_type == DT_DIR )  
			{ 
				
				if ((ith_pointer = opendir(first_current_name)) == NULL )  //Cierro directorio	
					perror("opendir");

				dirTraverse(ith_pointer, first_current_name); //esta llamada cambia fcn
				strcpy(first_current_name, buffer);		//esto recupera fcn, con el temp en buffer ;
			}
			
		}
	}
	closedir(ith_pointer); 								//abro directorio
}
int main (int argc, char **argv) { 
	
	
	DIR *dir;
	struct dirent *entry; 
	char *local_path = (char*) malloc(256*sizeof(char));

	strcpy(local_path, "./"); 
	strcat(local_path, argv[1]); 

	if ( (dir=opendir(local_path)) == NULL ) 
	{
		fprintf(stderr,"error opening directory"); 
		perror("opendir"); 
	}

	dirTraverse(dir, argv[1]); 

	closedir(dir); 
		
	exit(0);	
}

3320410001000224720maraton/knapsack.cpp#include<iostream> 
#include<utility> 
	
using namespace std; 

int for_christ_sake(int val[], int sizes[], int ac, int stop, int total_s, int current); 
pair<int, int>  max_p(int a[], int b[], int size); 

/* Wrong Answer
 *
 * 	This failed cause I was only using a greedy aproach, this is, at every step of the algorithm I only looked for	
 * 	the maximum object value and added it up, not considering that this might not work in spite of the nature
 * 	of the problem (the size has a bound, but sizes and values are not directly correlated, and we wish to maximize
 * 	value). 
 *
 * 	A simple counter example for my solution is: 
 * 	10 7
 * 	10 2
 * 	10 2
 * 	10 2
 * 	10 2
 * 	10 2
 * 	24 5
 * 	30 5
 *
 * 	... The greedy approach would take 30 and 24 and then finish since the bound was reached, but taking the first
 * 	5 given element would give 50, and 50 > 49
 *
 * 	The proper approach involves consideran each "state" as the maximum sum for a set size k, such that 1<=k<=S. That
 * 	way we force the inclusion of the two elements value and size, rather than using the size as a stop condition.
 */

int main() 
{
	int s,n; 

	cin>>s>>n; 
	int val[n], tam[n]; 

	int p,q; 
	for (int i=0; i<n; i++) {

		cin>>p>>q; 
		tam[i] = p; 
		val[i] = q; 
	}

	cout<<for_christ_sake(val, tam, 0, s, n, 0)<<endl; 

	return 0; 
}

int for_christ_sake(int values[], int sizes[], int ac, int stop, int total_s, int current)
{
	pair<int, int> something; 
	int aux, total; 	
	total = 0;

	if (ac == stop)
	{
		return 0; 
	}
	if (ac < stop) { 
		something = max_p(values, sizes, total_s); 

		if (something.first != -1 && current != total_s-1) 
		{
			if (something.second+ac <= stop) 
			{ 	
				ac += something.second;
				total = for_christ_sake(values, sizes, ac, stop, total_s, current+1) + something.first; 
			}
			else { 
				total = for_christ_sake(values, sizes, ac, stop, total_s, current+1) ; 
			}
			
		}
		else { 
			return 0; 
		}
	}

	return total; 

}
	

pair<int,int>  max_p(int a[], int b[], int size)
{
	pair<int, int> ret; 
	int k, ind; 
       	k = ind = -1; 	
	for(int c=0; c<size; c++) { 

		if (k < a[c])
		{ 
			k = a[c]; 
			ind = c; 
		}
	}
	
	ret.first = a[ind]; 
	ret.second = b[ind]; 

	a[ind] = -1; 
	
	return ret; 
}


332041000100092725maraton/books_queries.cpp#include<iostream> 
#include<vector> 	
#include<cmath> 

using namespace std; 

int main() 
{
	vector<int> shelve; 
	vector<int> resp; 
	int q; 

	cin>>q; 
	
	int l_count, r_count, r, run_l, run_r;  
	l_count = r_count = 0; 
	int aux; 
	char e; 
	bool s ; 
	for (int c=0; c<q; c++) { 
		
		cin>>e>>aux; 
		
		if (e == 'L')
		{
			shelve.push_back(-aux); 
			l_count ++ ;
		}	
		else if (e == 'R')
		{
			shelve.push_back(aux); 
			r_count++; 
		}
		else {
			r = run_l = run_r = 0 ;
			s = true; 
			while (true) { 
				
				if (shelve[r] > 0)
				{
					run_r++ ;
					s = true; 
				}
				else { 
					run_l++; 
					s = false; 
				}

				if ( abs(shelve[r]) == aux ) 
				{	
					break; 
				}	

				r++;
			}

			(s == true)? resp.push_back(r_count - run_r) : resp.push_back(l_count - run_l); 
			
		}
	}
	
	vector<int>:: iterator it ;

	for (it=resp.begin(); it!=resp.end(); it++) { 
		cout<<*it<<endl;
	}

	return 0; 
}
332041000100035017maraton/nsteps.py
n = int(input()) 
resp = []

for x in range(n): 
	arr = input().split()
	x = int( arr[0] ) 
	y = int( arr[1] ) 
	if x%2 == 1 and y%2 == 1 and ( x-y == 2 or x-y == 0): 
		resp.append( str(x+y-1) ) 
	elif x%2 == 0 and y%2 == 0 and ( x-y == 2 or x-y == 0) : 
		resp.append( str(x+y) )
	else: 	
		resp.append("No Number")

for i in resp: print(i)
		
		
3320410001000128722maraton/farida-def.cpp#include<iostream> 
	
using namespace std; 

int farida(int coins[], int c_case[], int size, int ind); 

int main() 
{
	int t;

	cin>>t; 
	int resp[t]; 

	int aux, n;
	for (int c=0; c<t; c++) { 

		cin>>n; 
		int monster[n], help[n]; 
		for(int r=0; r<n; r++) { 
			cin>>aux; 
			monster[r] = aux; 
			help[r] = -1; 
		}

		if ( n > 1 ) 
		{	
			resp[c] = farida(monster, help, n, n + 1); 
		}
		else { 
			resp[c] = farida(monster, help, n, n-1); 
		}
	}

	for(int k=0; k<t; k++) { 
		cout<<"Case "<<k+1<<": "<<resp[k]<<endl; 
	}

	return 0; 
}

int farida(int coins[], int c_case[], int size, int ind) 
{

	if (ind == 0)
	{
		return coins[0];
	}
	else if (ind == 1)
	{
		return (coins[1] > coins[0])? coins[1]: coins[0];
	}
	else if (ind == 2)
	{
		return (coins[2] + coins[0] > coins[1])? coins[2] + coins[0] : coins[1];
	}
	else  {
		if (c_case[ind - 2] == -1) 
		{
			c_case[ind-2] = farida(coins, c_case, size, ind-2); 
		}

		if (c_case[ind - 3] == -1) 
		{
			c_case[ind-3] = farida(coins, c_case,size, ind-3); 
		}

		if ( c_case[ind-2] > c_case[ind-3] )
		{
			if (ind > size) 
			{
				return c_case[ind-2]; 
			}

			return coins[ind] + c_case[ind-2]; 
		}
		else { 
			if (ind > size)
			{
				return c_case[ind-3]; 
			}

			return coins[ind] + c_case[ind-3]; 
		}

	}


}
332041000100060624maraton/keanu_reeves.cpp#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int main() 
{
	int n; 
	string s; 
	
	cin>>n; 
	cin>>s; 

	int z, o; 
	z = o = 0; 
	for (int c=0; c<n; c++) { 
		
		(s[c]=='0')? z++: o++; 
	}

	int aux; 
	if (o != z) 
	{
		cout<<"1"<<endl; 
		cout<<s<<endl; 
	}
	else { 
		int rz, ro; 
		rz = ro = 0; 

		for (int i=0; i<n; i++) {
			
			(s[i] == '0')? rz++: ro++; 

			if ( ro != rz && o-ro != z-rz ) 
			{
				aux = i; 
				break;
			}
		}

		int tam = s.length(); 
		cout<<"2"<<endl ;
		cout<<s.substr(0,aux+1)<<" "<<s.substr(aux+1, tam-1)<<endl; 	
	}
	


	return 0; 
}
3327710001000820412maraton/out2ELF              ��4   4      4   	 (      4   4�4�               T  T�T�                    � ��  �           �  ����D  t             ���   �            h  h�h�D   D         P�td�  ����T   T         Q�td                          R�td�  ����          /lib/ld-linux.so.2           GNU                        GNU 3��R����R�K��ߧ���            #          s��K��!��	(E�L�C                ;             y                                                        �             3               i              O               h             '             E             �              2  @��     Y  ��     �   ��       �   @�       �   ��      libstdc++.so.6 __gmon_start__ _Jv_RegisterClasses _ITM_deregisterTMCloneTable _ITM_registerTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc _ZSt4cout _ZNSolsEPFRSoS_E _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ _ZNSt8ios_base4InitD1Ev _ZNSt8ios_base4InitC1Ev _ZNSirsERi _ZSt3cin _ZNSolsEi _ZNSolsEx libc.so.6 _IO_stdin_used __stack_chk_fail __cxa_atexit __libc_start_main GLIBC_2.4 GLIBC_2.0 GLIBC_2.1.3 GLIBCXX_3.4                             O     @   ii   �     ii   �     si	   �                  t)�   �      ��  @�  �  �  �  �  �  �   �  $�
  (�  ,�  0�  4�  S���  ��+  ��������t��   ��[� �5��%�    �%�h    ������%�h   ������%�h   ������%�h   �����%�h    �����% �h(   �����%$�h0   �����%(�h8   �p����%,�h@   �`����%0�hH   �P����%4�hP   �@����%��f�        1�^����PTRh��h �QVh���O����f�f�f�f�f�f�f��$�f�f�f�f�f�f��C�-@���v�    ��tU���h@��Ѓ���Ð�t& �@�-@����������t�    ��tU���Ph@��҃���Ít& ��'    �=l� uU����|����l����f������u듍v �    ��t�U���P�҃���u����L$����q�U��WVSQ�순  e�   �E�1�����tc�������c��Ph@��w��������c�������c�������P�   ��о   �    ��k�)ĉ����������c��ǅ�c��    ���c��9��c����   �����c��Ph@�� �����ǅ�c��    ���c��9��c��}3�����c��Ph@�����������c�����c������c�����c��뿋��c������P���c��P��   �����c�����c���ىT����c���Q���ǅ�c��    ���c��9��c��}z���c�����c���Ћt����c���x��h��h���������WP��������h��P���������VSP��������h��P���������c���x����    ��tc���u�e35   t�����e�Y[^_]�a��U��S��4�E�E�e�   �E�1��} u�Eԋ ��   �}u�Eԃ����u�P��   ��� ��h�E����P�u��������E�U�E����P�u����������ӋE��    �E�Ћ ��ډE��U���E�P�E�P�   ���P� �]�e3   t������]���U����}u3�}��  u*��hm���������h<�hm�h@��Z��������U�����h��  j��������U��E��E� 9�}�E��E]�U��S�E��X�E�P� 9�9�|9�s�E��E[]�f�f�UWVS��������  ���l$ ���������������)�����t%1���    ���t$,�t$,U�����������9�u��[^_]Ív ��  S���c�����s  ��[�     Case  :     ;P   	   D���l   ����   ����   ����<  ���\  *����   E���  t���|  �����         zR |�         �����    FJtx ?;*2$"@   @   w����   D Gu Fupu|uxut�� A�A�A�A�C     �   +����    A�BD����    �   *���    A�BW�      �   %���+    A�BA�e�A�    �   ����B    A�B~�       ����    A�BV�  H   ,  ����]    A�A�A�A�N i$D(D,A0M GA�A�A�A�     x  ���                                                                                                                                                                                                                                                                                                                                                                                           ����p�             O     ̅   ��   ��         �      ���o��   �   ��
   �                   �   X            t�   \�            ���o�����o   ���oԄ                                                    �        ��&�6�F�V�f�v�������        GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609                        T�          h�          ��          ��          ��          �          Ԅ          ��          \�     	     t�     
     ̅          ��          ��          ��          ��          ��          ��           �          ��          �          �          �          ��           �          8�          @�                                ��   �          �         0�      .   p�      D   l�     S   �      z   ��      �   ��      �            ���   m�     �   z�B     �   ��                 ��  ��        �                   ��'  ��       :   �      P  �       a  ��       t  �        8�       }  @��     �  �+   "  �             �             �  ��       ��      �              �                ��     �  ��                   9  ���     F             c  @�       �              �             �  ��     �                8�        ��    5  @�     A  ��     X  <�     e   �]     u  @�      �  ֊   "  �             �             �             \  p�      �                ��       H  @�        ���    o  ̅       crtstuff.c __JCR_LIST__ deregister_tm_clones __do_global_dtors_aux completed.7209 __do_global_dtors_aux_fini_array_entry frame_dummy __frame_dummy_init_array_entry farida-propper-2.cpp _ZStL8__ioinit _Z41__static_initialization_and_destruction_0ii _GLOBAL__sub_I_main __FRAME_END__ __JCR_END__ __GNU_EH_FRAME_HDR _GLOBAL_OFFSET_TABLE_ __init_array_end __init_array_start _DYNAMIC _ZSt3cin@@GLIBCXX_3.4 _ZSt3maxIxERKT_S2_S2_ _ZNSolsEi@@GLIBCXX_3.4 __cxa_atexit@@GLIBC_2.1.3 __libc_csu_fini __gmon_start__ _Jv_RegisterClasses _fp_hw _ZNSt8ios_base4InitC1Ev@@GLIBCXX_3.4 _Z6faridaPii __libc_start_main@@GLIBC_2.0 _ZNSt8ios_base4InitD1Ev@@GLIBCXX_3.4 _ITM_deregisterTMCloneTable _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@@GLIBCXX_3.4 _IO_stdin_used _ITM_registerTMCloneTable __data_start __x86.get_pc_thunk.bx __TMC_END__ _ZSt4cout@@GLIBCXX_3.4 __dso_handle __libc_csu_init __bss_start _ZSt3maxIiERKT_S2_S2_ __stack_chk_fail@@GLIBC_2.4 _ZNSirsERi@@GLIBCXX_3.4 _ZNSolsEx@@GLIBCXX_3.4 _ZNSolsEPFRSoS_E@@GLIBCXX_3.4 _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@@GLIBCXX_3.4 _edata  .symtab .strtab .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .init_array .fini_array .jcr .dynamic .got.plt .data .bss .comment                                                     T�T                    #         h�h                     1         ���  $                  D   ���o   ���  4                N         ���  0              V         �  �                 ^   ���o   Ԅ�  &                k   ���o   ���  `                z   	      \�\                  �   	   B   t�t  X               �         ̅�  #                  �         ���  �                 �         ���                    �         ���  �                 �         ���                    �         ���                    �         ���  T                  �          �   �                 �         ���                    �         �                    �         �                    �         �  �                �         ���                   �          �   8                 �         8�8                    �         @�@  0                       0       @  5                               '  
                               x  `     2         	              �  O                 3320410001000116621maraton/eggypizza.cpp
#include<iostream> 
#include<stdio.h> 
#include<string> 
	
using namespace std; 

int reusable(int n) { 

	if ( n>=4 )
	{
		n = (n%4!=0)? n/4 + 1: n/4;
	}
	
	return n; 
}

int main() 
{
	int quarter = 0, half = 0, t_quarters = 0; 
	int n;
	cin>>n; 
	string aux; 
	
	for (int c=0; c<n; c++) { 
	
		cin>>aux; 
		if (aux=="1/4") 
		{
			quarter++;
		}
		else if (aux=="1/2") 
		{
			half++; 
		}
		else {
			t_quarters++; 
		}			
	}

	int response; 
	if (quarter>0 && half>0)
	{
		if (t_quarters>0) 
		{
			quarter = (quarter > t_quarters)? quarter - t_quarters: 0;
		}

		if (half%2 == 1 )
		{
			if (quarter%4 <= 2) 
			{
				quarter -= quarter%4; 
				half++;
			}
		}
			
		half = half/2; 

		quarter = reusable(quarter); 
	}
	else if (quarter>0 && half!=0 && t_quarters>0)
	{
		quarter = (quarter > t_quarters)? reusable(quarter - t_quarters): 0;
	}
	else if ( (quarter==0 && half>0 && t_quarters>0) || (quarter==0 && half>0 && t_quarters==0) )
	{
		half = (half%2 == 0)? half/2: half/2 + 1; 
	}
	else if (quarter>0 && half==0 && t_quarters==0)
	{
		quarter = reusable(quarter); 
	}

	response = quarter+half+t_quarters + 1;
	cout<<response<<endl; 
	return 0; 
}
332041000100072020maraton/delivery.cpp#include <iostream>
#include <vector>
#include <queue>


using namespace std;


struct edge
{
	int to, cost;
};

const int maxN = 1000002; // Actualizar este valor
const int INF = 0x7fffffff;

vector<edge> g[maxN];

int cost[maxN];

void dijkstra(int s)
{
	priority_queue<pair<int,int>> pq;
	int node;
	int weig;
	int no;
	int we;
	cost[s] = 0;
	pq.push({0,s});

	while( !pq.empty() ) 
	{
	    node = pq.top().second;
	    weig = -pq.top().first;
	    pq.pop();

	    if ( weig > cost[node]) continue;

	    for ( edge e : g[node]){
	    	no = e.to;
	    	we = e.cost;

	    	if (cost[no] > cost[node] + we){
	    		cost[no] = cost[node] + we;
	    		pq.push({-cost[no],no});
	    	}

	    }
	}

}

int main() 
{
		

}

3320410001000179519maraton/candy-2.cpp
#include<iostream> 
#include<stdio.h> 
#include<queue>
#include<string> 
	
using namespace std; 

int isDivisible(int candies[], int size); //if it is ret quotient, else ret -1
int movesCount(int candies[], int size, int comp); 

/* This program tells for a given amount of candy bags n, and the amount of candies on it arr[n], the minimum number of
        moves to make all candy bags have the same amount of candies. If it is not possible to have the same amount of candies
        it returns -1. A move is considered as taking a bunch of candes from one bag and moving it to another one.
*/

	
int main() 
{
	int c = 0; 
	int resp[10000];
	int n;
	int equals; 

	while (true) {
		
		cin>>n; 
		if (n == -1) 
		{
			break; 
		}

		int arr[n];

		for (int i=0; i<n; i++) {
			cin>>arr[i]; 
		}
	
		equals = isDivisible(arr, n); 	
		resp[c] = (equals != -1)? movesCount(arr,n,equals): -1; 
	
		c++; 
	}	

	for (int i=0; i<c; i++) {
		cout<<resp[i]<<endl;
	}		

	return 0; 
}

int isDivisible (int candies[], int size) { 
	int sum = 0;

	for (int j=0; j<size; j++) { 
		sum += candies[j]; 
	}
	
	return (sum%size == 0)? sum/size: -1; 
}


int movesCount(int candies[], int size, int comp) {
	
	int counter = 0;
	priority_queue<int> cup; 
	priority_queue<int> water; 
	
	for (int k=0; k<size; k++) { 
		
		if (candies[k] < comp)
		{
			cup.push(comp - candies[k]); 
		}
		else if (candies[k] > comp) 
		{
			water.push(candies[k] - comp); 
		}
	}	

	int p,q; 
	bool brk = true;
	while (!cup.empty() || !water.empty()) { 
		if (brk == true)
		{
			p = cup.top();
			cup.pop(); 
		}

		q = water.top(); 
		water.pop(); 

		if (q >= p) { 
			q -= p; 

			if (q > 0) 
			{
				water.push(q); 
			}

			counter++; 
			brk = true;
		}
		else { 
			p -= q;
			brk = false; 
		}
	}
	
	return counter;
}
332041000100081324maraton/farida-def-2.cpp#include<iostream> 
	
using namespace std; 

long long farida(int coins[], long long c_case[], int ind); 

int main() 
{
	int t; 

	cin>>t; 
	long long resp[t]; 

	int aux, n; 
	int monster[10000]; 
	long long help[10000]; 
	for (int c=0; c<t; c++) { 

		cin>>n; 
		for(int r=0; r<n; r++) { 
			cin>>aux; 
			monster[r] = aux; 
			help[r] = -1; 
		}

		resp[c] = farida(monster, help, n-1 ) ; 

	}

	for (int k=0; k<t; k++) { 
		cout<<"Case "<<k+1<<": "<<resp[k]<<endl; 
	}
			
	return 0; 
}

long long farida(int coins[], long long c_case[], int ind)
{

	if (ind == 0)
		return coins[0]; 

	else if (ind == 1)
		return max(coins[0], coins[1]); 

	else { 
		if (c_case[ind] == -1)
			c_case[ind] = max( farida(coins, c_case, ind - 2) + coins[ind], farida(coins, c_case, ind - 1) ); 

		return c_case[ind]; 
	}

}
3320410001000109627maraton/books_queries-2.cpp#include<iostream> 
#include<stdio.h> 
#include<deque> 
#include<vector>
#include<string> 
	
using namespace std; 

int main() 
{
	deque<int> shelve; 
	vector<int> resp; 
	int q; 
	cin>>q; 
	
	deque<int>:: iterator f_it; 
	deque<int>:: reverse_iterator r_it; 
	int aux, r_count, l_count, i, j; 
	char e; 
	bool s; 
	r_count = l_count = 0; 
	for(int c=0; c<q; c++) { 
		cin>>e>>aux; 

		if(e == 'L')
		{
			shelve.push_back(aux); 
			l_count++; 
		}
		else if (e == 'R')
		{
			shelve.push_front(aux); 
			r_count++; 
		}
		else {
			f_it=shelve.begin(); 
			r_it=shelve.rbegin(); 
			i = j = 0; 
			s = true; 
			while (true) {
				
				if (i < r_count)
				{
					if (*f_it == aux) 
					{ 
						s = true; 
						break ;
					}	
					f_it++; 
					i++; 
				}

				if (j < l_count)
				{
					if (*r_it == aux) 
					{ 
						s = false; 
						break ;
					}
					r_it++; 
					j++;
				}
			}	

			(s == true)? resp.push_back(i) : resp.push_back(j);
		}

	}

	vector<int>::iterator fin = resp.begin(); 

	for(fin=resp.begin() ; fin!=resp.end(); fin++) {
		cout<<*fin<<endl; 
	}

	return 0; 
}
332041000100038716maraton/616b.cpp
#include<iostream> 
#include<climits> 	

using namespace std; 

int cost[100][100] ;

int main() 
{
	int n,m, u_b, l_b, ans;

	cin>>n>>m; 
	
	int i,j; 
	l_b = INT_MIN; 
	for(i=0; i<n; i++) {

		u_b = INT_MAX; 
		for(j=0; j<m; j++) {
			cin>>cost[i][j]; 

			if (cost[i][j] < u_b) 
				u_b = cost[i][j]; 

		}

		if (u_b > l_b)
			l_b = u_b; 
	}
	
	cout<<l_b<<endl; 
					
	return 0; 
}
332041000100053618maraton/canton.cpp
#include<iostream> 
#include<stdio.h> 
#include<math.h>
#include<string> 
	
using namespace std; 


int main() 
{
	int t;
	cin>>t; 
	long den[t], num[t], req[t];

	long c, acum; 
	for (int i=0; i<t; i++) { 
		
		cin>>req[i]; 	
		c = acum = 0;
		while(acum<req[i]) 
		{
			c++; 
			acum += c;
		}
		
		den[i] = (c%2==0)?  (acum-req[i]) + 1: c - (acum-req[i]) ; 
		num[i] = (c%2==0)? c - (acum-req[i]) : (acum-req[i]) + 1;  
	}

	for(int j=0; j<t; j++) { 
		cout<<"TERM "<<req[j]<<" IS "<<num[j]<<"/"<<den[j]<<endl; 
	}
	
	return 0; 
}

3320410001000100010maraton/tcheeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey
