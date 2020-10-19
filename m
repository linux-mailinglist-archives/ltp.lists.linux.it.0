Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCB292369
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 10:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 789EF3C5723
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 10:10:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 960653C2512
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 10:10:05 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5D4AD60004F
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 10:10:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,394,1596470400"; d="scan'208";a="100290058"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Oct 2020 16:10:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id ACC454CE34D2;
 Mon, 19 Oct 2020 16:09:57 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 19 Oct 2020 16:09:58 +0800
Message-ID: <5F8D49DC.4060606@cn.fujitsu.com>
Date: Mon, 19 Oct 2020 16:10:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Alexey Kodanev <alexey.kodanev@oracle.com>
References: <1602834345-24019-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
In-Reply-To: <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ACC454CE34D2.AF777
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/send02: Improve message
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey
> On 16.10.2020 10:45, Yang Xu wrote:
>> This case sometimes fails, output as below:
>>
>> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
>> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>>
>>  From this output, we don't know which subcase fails(tcp,udp,send,sendto).
>> So add some message and make this clear.
>>
>> Now this case fails as below:
>> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
>> send02.c:124: TINFO: Testing TCP send
>> send02.c:87: TFAIL: recv() error at the 776 times(expsize 17): EAGAIN/EWOULDBLOCK (11)
>
> recv(..., MSG_DONTWAIT) can fail with EAGAIN/EWOULDBLOCK at any time,
> so it should be a valid error... why it is a failure in the test?
I guess  it only sends a small data and works well on most machines, so 
we think it is a failure.
>
> If we expect some message to receive, we should call recv() again
> for EAGAIN/EWOULDBLOCK errors. And with MSG_MORE case, just return
> immediately, i.e. something like this:
>
>         while (1) {
>                  TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
>
>                  if (TST_RET == -1) {
>                          if (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK) {
>                                  if (expsize)
>                                          continue;
>                                  else
>                                          break;
>                          }
>
>                          /* unexpected error */
>                          tst_res(TFAIL | TTERRNO, "recv() error, expsize %ld, it %d", expsize, i);
>                          return 0;
>                  }
>
> 		if (TST_RET<  0) {
>                          tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
>                                  TST_RET);
>                          return 0;
>                  }
>
>                  if (!expsize || TST_RET != expsize) {
>                          tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
>                                  expsize);
>                          return 0;
>                  }
>
> 		break;
> 	}

It looks ok. This test only checks MSG_MORE whether can get 
EAGAIN/EWOULDBLOCK erro immediately, so for other situations, we just
ensure it can receive message sucessfully.

>
>
>> send02.c:124: TINFO: Testing UDP send
>> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
>> send02.c:124: TINFO: Testing UDP sendto
>> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
>> send02.c:124: TINFO: Testing UDP sendmsg
>> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   testcases/kernel/syscalls/send/send02.c | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/send/send02.c b/testcases/kernel/syscalls/send/send02.c
>> index 5630230fa..719e86a90 100644
>> --- a/testcases/kernel/syscalls/send/send02.c
>> +++ b/testcases/kernel/syscalls/send/send02.c
>> @@ -71,7 +71,7 @@ static void setup(void)
>>   	memset(sendbuf, 0x42, SENDSIZE);
>>   }
>>
>> -static int check_recv(int sock, long expsize)
>> +static int check_recv(int sock, long expsize, int loop)
>>   {
>>   	char recvbuf[RECVSIZE] = {0};
>>
>> @@ -83,19 +83,20 @@ static int check_recv(int sock, long expsize)
>>   			return 1;
>>
>>   		/* unexpected error */
>> -		tst_res(TFAIL | TTERRNO, "recv() error");
>> +		tst_res(TFAIL | TTERRNO, "recv() error at the %d times(expsize"
>> +			" %ld)", loop, expsize);
>
> It's better to have a single line message, and arguments on another one:
> tst_res(TFAIL | TTERRNO, "recv() error at step %d, expsize %ld",
>          ...);
OK. Will do it in v2 patch

Best Regards
Yang Xu
>
>>   		return 0;
>>   	}
>>
>>   	if (TST_RET<  0) {
>> -		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
>> -			TST_RET);
>> +		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld at"
>> +			" the %d times(expsize %ld)", TST_RET, loop, expsize);
>>   		return 0;
>>   	}
>>
>>   	if (TST_RET != expsize) {
>> -		tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
>> -			expsize);
>> +		tst_res(TFAIL, "recv() read %ld bytes, expected %ld at the"
>> +			" %d times", TST_RET, expsize, loop);
>>   		return 0;
>>   	}
>>
>> @@ -120,6 +121,7 @@ static void run(unsigned int n)
>>   	struct test_case *tc = testcase_list + n;
>>   	socklen_t len = sizeof(addr);
>>
>> +	tst_res(TINFO, "Testing %s", tc->name);
>>   	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
>>   	listen_sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
>>   	dst_sock = listen_sock;
>> @@ -139,19 +141,19 @@ static void run(unsigned int n)
>>   			dst_sock = SAFE_ACCEPT(listen_sock, NULL, NULL);
>>
>>   		tc->send(sock, sendbuf, SENDSIZE, 0);
>> -		ret = check_recv(dst_sock, SENDSIZE);
>> +		ret = check_recv(dst_sock, SENDSIZE, i + 1);
>>
>>   		if (!ret)
>>   			break;
>>
>>   		tc->send(sock, sendbuf, SENDSIZE, MSG_MORE);
>> -		ret = check_recv(dst_sock, 0);
>> +		ret = check_recv(dst_sock, 0, i + 1);
>>
>>   		if (!ret)
>>   			break;
>>
>>   		tc->send(sock, sendbuf, 1, 0);
>> -		ret = check_recv(dst_sock, SENDSIZE + 1);
>> +		ret = check_recv(dst_sock, SENDSIZE + 1, i + 1);
>>
>>   		if (!ret)
>>   			break;
>>
>
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
