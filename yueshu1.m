function f = yueshu1(x,x0)%����(������)���޷��ձ���
global S  p%Ͷ���ܽ��,���ֹ�Ʊ�۸�
miu0 = 0.001;%���׳ɱ�ϵ��
%x0  = (S - 100*sum(x'.*p))/S; %�޷���Ͷ�ʱ���
C0=miu0*x0*S; %�޷���Ͷ�ʵĽ��׷���
k0 = 5; %��Ͷί�з�


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%k1:��i�й�Ʊ��������Ϊn(i)ʱ�Ľ���Ӷ��
miu1=0.003; %Ӷ��ɱ�ϵ��
%kl = [];
for i = 1:size(x')
if(100*miu1*x(i)*p(i)<=5)
    k1(i) =5;
else
    k1(i)=100*miu1*x(i)*p(i);
end

%k2:��i �ֹ�Ʊ��������Ϊniʱ�Ĺ�����
miu2 = 0.001; %ÿ�ɹ�Ʊ�����ѵĳɱ�ϵ��
if(100*miu2*x(i)<=1)
    k2(i) = 1;
else
    k2(i) = 100*miu2.*x(i);
end
c  = k0 + k1(i) + k2(i);%��i�ֹ�Ʊ��������Ϊniʱ�Ľ��׳ɱ�
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%cz = sum(c) %����Ͷ�ʵ��ܽ��׳ɱ�
C = C0 + sum(c);%Ͷ������ܽ��׷���
%n(i):��i �ֹ�Ʊ�Ľ�������Ϊ
%p(i)��i�й�Ʊ��ÿ�ɼ۸�
%r(i)��i�й�Ʊ��������
global r
r_w = 0.0385;%�޷���Ͷ������
global yuqi_shou
%R0 = 0.1;%Tʱ��Ԥ��������
R0 = yuqi_shou;
f = S*R0 + C - r_w*x0*S -  100*sum(x.*p.*r);

end