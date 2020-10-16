Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D751290515
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 14:32:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD8433C57CE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 14:32:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0B97D3C23F2
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 14:32:22 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 98B74600209
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 14:32:21 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09GCUTrB116350;
 Fri, 16 Oct 2020 12:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=nJV+gQI4qzXq576knw9nxwiP3UJZegXnk8nKQmAH++g=;
 b=B1IsXzAJiZybFNZxhhbwkFScvibIJmENWZZ67xFyUSdq7/XtRHO5ApAZF6Z/+4VXJ4sW
 1BGeg5Fp6FjaRQ5sODIzJwen4n/qAzLYJPO0/VnVsV3NRPh4pmwk7vGWESTgtVDO1RCT
 WLs1dzhtESwsXGA0MjUThYR4U+VIhJaPh4Vr4RqqNIWj/rm5dcO/D3mCkprbodJzSy7X
 o3LVcD9jrn/YKoSxKjKXkN710B5keih4343J0ZppH3MUFr1vwMSIlzYRJfMrYrfBeKme
 0hJhhsn5e/YMmZBTmpCCEtT/DPJohsUpr5joFT60uAVA8joKmlO9K/X7Sn1qpZ9iOzcg MQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3434wm1gnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Oct 2020 12:32:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09GCOgtc179620;
 Fri, 16 Oct 2020 12:30:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 343pw1saed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Oct 2020 12:30:14 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09GCUAYw022169;
 Fri, 16 Oct 2020 12:30:13 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 16 Oct 2020 05:30:10 -0700
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1602834345-24019-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
Date: Fri, 16 Oct 2020 15:30:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602834345-24019-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010160092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010160092
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16.10.2020 10:45, Yang Xu wrote:
> This case sometimes fails, output as below:
> 
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> 
> From this output, we don't know which subcase fails(tcp,udp,send,sendto).
> So add some message and make this clear.
> 
> Now this case fails as below:
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> send02.c:124: TINFO: Testing TCP send
> send02.c:87: TFAIL: recv() error at the 776 times(expsize 17): EAGAIN/EWOULDBLOCK (11)

recv(..., MSG_DONTWAIT) can fail with EAGAIN/EWOULDBLOCK at any time,
so it should be a valid error... why it is a failure in the test?

If we expect some message to receive, we should call recv() again
for EAGAIN/EWOULDBLOCK errors. And with MSG_MORE case, just return
immediately, i.e. something like this:

       while (1) {
                TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));

                if (TST_RET == -1) {
                        if (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK) {
                                if (expsize)
                                        continue;
                                else
                                        break;
                        }

                        /* unexpected error */
                        tst_res(TFAIL | TTERRNO, "recv() error, expsize %ld, it %d", expsize, i);
                        return 0;
                }

		if (TST_RET < 0) {
                        tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
                                TST_RET);
                        return 0;
                }

                if (!expsize || TST_RET != expsize) {
                        tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
                                expsize);
                        return 0;
                }

		break;
	}


> send02.c:124: TINFO: Testing UDP send
> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
> send02.c:124: TINFO: Testing UDP sendto
> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
> send02.c:124: TINFO: Testing UDP sendmsg
> send02.c:87: TFAIL: recv() error at the 1 times(expsize 16): EAGAIN/EWOULDBLOCK (11)
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/send/send02.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/send/send02.c b/testcases/kernel/syscalls/send/send02.c
> index 5630230fa..719e86a90 100644
> --- a/testcases/kernel/syscalls/send/send02.c
> +++ b/testcases/kernel/syscalls/send/send02.c
> @@ -71,7 +71,7 @@ static void setup(void)
>  	memset(sendbuf, 0x42, SENDSIZE);
>  }
>  
> -static int check_recv(int sock, long expsize)
> +static int check_recv(int sock, long expsize, int loop)
>  {
>  	char recvbuf[RECVSIZE] = {0};
>  
> @@ -83,19 +83,20 @@ static int check_recv(int sock, long expsize)
>  			return 1;
>  
>  		/* unexpected error */
> -		tst_res(TFAIL | TTERRNO, "recv() error");
> +		tst_res(TFAIL | TTERRNO, "recv() error at the %d times(expsize"
> +			" %ld)", loop, expsize);

It's better to have a single line message, and arguments on another one:
tst_res(TFAIL | TTERRNO, "recv() error at step %d, expsize %ld",
        ...);

>  		return 0;
>  	}
>  
>  	if (TST_RET < 0) {
> -		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
> -			TST_RET);
> +		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld at"
> +			" the %d times(expsize %ld)", TST_RET, loop, expsize);
>  		return 0;
>  	}
>  
>  	if (TST_RET != expsize) {
> -		tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
> -			expsize);
> +		tst_res(TFAIL, "recv() read %ld bytes, expected %ld at the"
> +			" %d times", TST_RET, expsize, loop);
>  		return 0;
>  	}
>  
> @@ -120,6 +121,7 @@ static void run(unsigned int n)
>  	struct test_case *tc = testcase_list + n;
>  	socklen_t len = sizeof(addr);
>  
> +	tst_res(TINFO, "Testing %s", tc->name);
>  	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
>  	listen_sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
>  	dst_sock = listen_sock;
> @@ -139,19 +141,19 @@ static void run(unsigned int n)
>  			dst_sock = SAFE_ACCEPT(listen_sock, NULL, NULL);
>  
>  		tc->send(sock, sendbuf, SENDSIZE, 0);
> -		ret = check_recv(dst_sock, SENDSIZE);
> +		ret = check_recv(dst_sock, SENDSIZE, i + 1);
>  
>  		if (!ret)
>  			break;
>  
>  		tc->send(sock, sendbuf, SENDSIZE, MSG_MORE);
> -		ret = check_recv(dst_sock, 0);
> +		ret = check_recv(dst_sock, 0, i + 1);
>  
>  		if (!ret)
>  			break;
>  
>  		tc->send(sock, sendbuf, 1, 0);
> -		ret = check_recv(dst_sock, SENDSIZE + 1);
> +		ret = check_recv(dst_sock, SENDSIZE + 1, i + 1);
>  
>  		if (!ret)
>  			break;
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
