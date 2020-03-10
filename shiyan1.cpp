#include<windows.h>
#include <iostream>
using namespace std;

const int   SIZE_OF_BUFFER = 5;//����������
int ProductID=0;//�����Ĳ�Ʒ��
int ConsumeID=0;//�������ĵĲ�Ʒ��
int in=0;//��Ʒ���������Ļ������±�
int out=0;//��Ʒ��������ʱ�Ļ������±�
int count=0;//�������еĲ�Ʒ����

int g_buffer[SIZE_OF_BUFFER];	//�������Ǹ�ѭ������
bool g_continue=true;	//���Ƴ������
HANDLE g_hMutex;//�����̼߳�Ļ���
HANDLE g_hFullSemaphore;//��������������ʹ�����ߵȴ�
HANDLE g_hEmptySemaphore;//����������ʱ��ʹ�����ߵȴ�

//����һ����Ʒ
void Produce()
{
	printf("������һ����Ʒ��%d\n",++ProductID);
	g_buffer[in]=ProductID;
	in=(in+1)%SIZE_OF_BUFFER;
	//�����������ǰ��״̬
	for(int i=0;i<SIZE_OF_BUFFER;++i){
		cout << i<<": "<<g_buffer[i];
		if(i==in)cout<< " <--����";
		if(i==out)cout<< " <--���� ";
		cout<<endl;
	}
	cout <<endl;
}
//����һ����Ʒ
void Consume(){
	printf("������һ����Ʒ��%d\n",++g_buffer[out]);
	g_buffer[out]=0;
	out=(out+1)%SIZE_OF_BUFFER;
	//�����������ǰ��״̬
	for(int i=0;i<SIZE_OF_BUFFER;++i){
		cout << i<<": "<<g_buffer[i];
		if(i==in)cout<< " <--����";
		if(i==out)cout<< " <--����";
		cout<<endl;
	}
	cout <<endl;

}
//�������̺߳���
DWORD WINAPI Producer(LPVOID lpPara)
{
	while(g_continue){
		WaitForSingleObject(g_hEmptySemaphore,INFINITE);
		WaitForSingleObject(g_hMutex,INFINITE);//���handle�¼����ź�״̬
		Produce();
		Sleep(2000);//ָ����ʱ��������ǰ��ִ���߳�
		ReleaseMutex(g_hMutex);//����ָ����������ӵ��Ȩ
		ReleaseSemaphore(g_hFullSemaphore,1,NULL);//�����ź���
	}
	return 0;
}
//�������̺߳���
DWORD WINAPI Consumer(LPVOID lpPara)
{
	while(g_continue){
		WaitForSingleObject(g_hEmptySemaphore,INFINITE);
		WaitForSingleObject(g_hMutex,INFINITE);//���handle�¼����ź�״̬
		Consume();
		Sleep(2000);//ָ����ʱ��������ǰ��ִ���߳�
		ReleaseMutex(g_hMutex);//����ָ����������ӵ��Ȩ
		ReleaseSemaphore(g_hFullSemaphore,1,NULL);//�����ź���
	}
	return 0;
}
int main(){
	//���������ź�������Դ�ź���
	g_hMutex=CreateMutex(NULL,FALSE,NULL);
	g_hFullSemaphore=CreateSemaphore(NULL,0,SIZE_OF_BUFFER,NULL);
	g_hEmptySemaphore=CreateSemaphore(NULL,SIZE_OF_BUFFER,SIZE_OF_BUFFER,NULL);

	const int PRODUCERS_COUNT =5;//�����ߵĸ���
	const int CONSUMERS_COUNT =4;//�����ߵĸ���

	//�ܵ��߳���
	const int THREADS_COUNT =PRODUCERS_COUNT+CONSUMERS_COUNT;//�����ߵĸ���

	HANDLE hThreads[THREADS_COUNT];//���̵߳�handle
	DWORD producerID[PRODUCERS_COUNT];//�������̵߳ı�ʶ��
	DWORD consumerID[CONSUMERS_COUNT];//�������̵߳ı�ʶ��

	//�����������߳�
	for(int i=0;i<PRODUCERS_COUNT;++i){
		hThreads[i]=CreateThread(NULL,0,Producer,NULL,0,&producerID[i]);
		if(hThreads[i]==NULL) return -1;//CreateThread����//�ú�������һ���ڵ��ý��̵ĵ�ַ�ռ���ִ�е��߳�
	}
	//�����������߳�
	for(int j=0;j<CONSUMERS_COUNT;++j){
		hThreads[PRODUCERS_COUNT+j]=CreateThread(NULL,0,Consumer,NULL,0,&consumerID[j]);
		if(hThreads[j]==NULL) return -1;
	}
	while(g_continue){
		if(getchar()){//���س���ֹ��������
			g_continue=false;
		}
	}
	return 0;
}