#include<windows.h>
#include <iostream>
using namespace std;

const int   SIZE_OF_BUFFER = 5;//缓冲区长度
int ProductID=0;//生产的产品号
int ConsumeID=0;//将被消耗的产品号
int in=0;//产品进缓冲区的缓冲区下表
int out=0;//产品出缓冲区时的缓冲区下表
int count=0;//缓冲区中的产品个数

int g_buffer[SIZE_OF_BUFFER];	//缓冲区是个循环队列
bool g_continue=true;	//控制程序结束
HANDLE g_hMutex;//终于线程间的互斥
HANDLE g_hFullSemaphore;//单缓冲区满是迫使生产者等待
HANDLE g_hEmptySemaphore;//当缓冲区空时迫使消费者等待

//生产一个产品
void Produce()
{
	printf("生产了一个产品：%d\n",++ProductID);
	g_buffer[in]=ProductID;
	in=(in+1)%SIZE_OF_BUFFER;
	//输出缓冲区当前的状态
	for(int i=0;i<SIZE_OF_BUFFER;++i){
		cout << i<<": "<<g_buffer[i];
		if(i==in)cout<< " <--生产";
		if(i==out)cout<< " <--消费 ";
		cout<<endl;
	}
	cout <<endl;
}
//消费一个产品
void Consume(){
	printf("消费了一个产品：%d\n",++g_buffer[out]);
	g_buffer[out]=0;
	out=(out+1)%SIZE_OF_BUFFER;
	//输出缓冲区当前的状态
	for(int i=0;i<SIZE_OF_BUFFER;++i){
		cout << i<<": "<<g_buffer[i];
		if(i==in)cout<< " <--生产";
		if(i==out)cout<< " <--消费";
		cout<<endl;
	}
	cout <<endl;

}
//生产者线程函数
DWORD WINAPI Producer(LPVOID lpPara)
{
	while(g_continue){
		WaitForSingleObject(g_hEmptySemaphore,INFINITE);
		WaitForSingleObject(g_hMutex,INFINITE);//检测handle事件的信号状态
		Produce();
		Sleep(2000);//指定的时间间隔挂起当前的执行线程
		ReleaseMutex(g_hMutex);//放弃指定互斥对象的拥有权
		ReleaseSemaphore(g_hFullSemaphore,1,NULL);//增加信号量
	}
	return 0;
}
//消费者线程函数
DWORD WINAPI Consumer(LPVOID lpPara)
{
	while(g_continue){
		WaitForSingleObject(g_hEmptySemaphore,INFINITE);
		WaitForSingleObject(g_hMutex,INFINITE);//检测handle事件的信号状态
		Consume();
		Sleep(2000);//指定的时间间隔挂起当前的执行线程
		ReleaseMutex(g_hMutex);//放弃指定互斥对象的拥有权
		ReleaseSemaphore(g_hFullSemaphore,1,NULL);//增加信号量
	}
	return 0;
}
int main(){
	//创建互斥信号量和资源信号量
	g_hMutex=CreateMutex(NULL,FALSE,NULL);
	g_hFullSemaphore=CreateSemaphore(NULL,0,SIZE_OF_BUFFER,NULL);
	g_hEmptySemaphore=CreateSemaphore(NULL,SIZE_OF_BUFFER,SIZE_OF_BUFFER,NULL);

	const int PRODUCERS_COUNT =5;//生产者的个数
	const int CONSUMERS_COUNT =4;//消费者的个数

	//总的线程数
	const int THREADS_COUNT =PRODUCERS_COUNT+CONSUMERS_COUNT;//生产者的个数

	HANDLE hThreads[THREADS_COUNT];//各线程的handle
	DWORD producerID[PRODUCERS_COUNT];//生产者线程的标识符
	DWORD consumerID[CONSUMERS_COUNT];//消费者线程的标识符

	//创建生产者线程
	for(int i=0;i<PRODUCERS_COUNT;++i){
		hThreads[i]=CreateThread(NULL,0,Producer,NULL,0,&producerID[i]);
		if(hThreads[i]==NULL) return -1;//CreateThread（）//该函数创建一个在调用进程的地址空间中执行的线程
	}
	//创建消费者线程
	for(int j=0;j<CONSUMERS_COUNT;++j){
		hThreads[PRODUCERS_COUNT+j]=CreateThread(NULL,0,Consumer,NULL,0,&consumerID[j]);
		if(hThreads[j]==NULL) return -1;
	}
	while(g_continue){
		if(getchar()){//按回车终止程序运行
			g_continue=false;
		}
	}
	return 0;
}