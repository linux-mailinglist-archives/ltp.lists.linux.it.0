Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29813292A82
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 17:33:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B47993C31E4
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 17:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8D2243C25D3
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 17:33:49 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 84F2C20039B
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 17:33:48 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JFEqvs164077;
 Mon, 19 Oct 2020 15:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Ul8/F3N1ZY4PRHHjGXg1kDYNbH4o96WSPe+Yh7x0/FU=;
 b=ebdhFxEvKJNILS5nX8D3dt3ylO0wOlMBZvDMAsJz/dsk7IxzIk7tsb/1HFPQnO1d7jt9
 5BORFj0DsrwLMEhpNfLO4LYLQDHmByBKFD2gAKfUN/Xq+Sr81hm09fUAF76+CSyhzwxy
 DViJlrqL6I/OCRuR4ufRXVoYhQD2i1+8uoLdDcLMf245V1mHXanwm0bT4E7hq/EX9P3T
 wWHpzpLpmQCpIqH+TAs7yZEhROiWaiL+O0dS3iuX1rlv4eoiVBbRYm37M6D8JBhEg2rr
 cGbEWKCkVhq0aun10bQ1FoArb3Z7OOtrbUp/wTTY5Z9ryvGjgJgYIpmyvPnT5eCTTu1n 8w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 347p4apbuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Oct 2020 15:33:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JFUDmX101199;
 Mon, 19 Oct 2020 15:31:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 348a6m1nyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 15:31:23 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09JFVJvr004869;
 Mon, 19 Oct 2020 15:31:21 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Oct 2020 08:31:19 -0700
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
 <1603107373-20807-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <8a4dec7c-92c1-10c9-ecfe-40678ace1ad1@oracle.com>
Date: Mon, 19 Oct 2020 18:31:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603107373-20807-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9778
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9778
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010190107
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/send02: Ensure recv() succeed when
 not using MSG_MORE flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19.10.2020 14:36, Yang Xu wrote:
> In this test, we only check send()/sendto()/sendmsg() calls
> with MSG_MORE flag whether get EAGAIN/EWOULDBLOCK error immediately.
> 
> For other flag, we just call recv again when meeting EAGAIN/EWOULDBLOCK
> error.
> 
> Also, improve message and make this case more clean when failed.
> 

Hi Yang,

Fixed quoted strings and applied, thanks!

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/send/send02.c | 65 +++++++++++++++----------
>  1 file changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/send/send02.c b/testcases/kernel/syscalls/send/send02.c
> index 5630230fa..b2ab3b79c 100644
> --- a/testcases/kernel/syscalls/send/send02.c
> +++ b/testcases/kernel/syscalls/send/send02.c
> @@ -71,32 +71,41 @@ static void setup(void)
>  	memset(sendbuf, 0x42, SENDSIZE);
>  }
>  
> -static int check_recv(int sock, long expsize)
> +static int check_recv(int sock, long expsize, int loop)
>  {
>  	char recvbuf[RECVSIZE] = {0};
>  
> -	TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
> -
> -	if (TST_RET == -1) {
> -		/* expected error immediately after send(MSG_MORE) */
> -		if (!expsize && (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK))
> -			return 1;
> -
> -		/* unexpected error */
> -		tst_res(TFAIL | TTERRNO, "recv() error");
> -		return 0;
> -	}
> -
> -	if (TST_RET < 0) {
> -		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
> -			TST_RET);
> -		return 0;
> -	}
> -
> -	if (TST_RET != expsize) {
> -		tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
> -			expsize);
> -		return 0;
> +	while (1) {
> +		TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
> +
> +		if (TST_RET == -1) {
> +			/* expected error immediately after send(MSG_MORE) */
> +			if (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK) {
> +				if (expsize)
> +					continue;
> +				else
> +					break;
> +			}
> +
> +			/* unexpected error */
> +			tst_res(TFAIL | TTERRNO, "recv() error at step %d, expsize %ld",
> +				loop, expsize);
> +			return 0;
> +		}
> +
> +		if (TST_RET < 0) {
> +			tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld"
> +				" at step %d, expsize is %ld",
> +				TST_RET, loop, expsize);
> +			return 0;
> +		}
> +
> +		if (TST_RET != expsize) {
> +			tst_res(TFAIL, "recv() read %ld bytes, expected %ld"
> +				" at step %d ", TST_RET, expsize, loop);
> +			return 0;
> +		}
> +		return 1;
>  	}
>  
>  	return 1;
> @@ -120,6 +129,8 @@ static void run(unsigned int n)
>  	struct test_case *tc = testcase_list + n;
>  	socklen_t len = sizeof(addr);
>  
> +	tst_res(TINFO, "Tesing %s", tc->name);
> +
>  	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
>  	listen_sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
>  	dst_sock = listen_sock;
> @@ -139,19 +150,19 @@ static void run(unsigned int n)
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
> @@ -163,7 +174,7 @@ static void run(unsigned int n)
>  	}
>  
>  	if (ret)
> -		tst_res(TPASS, "%s(MSG_MORE) works correctly", tc->name);
> +		tst_res(TPASS, "MSG_MORE works correctly");
>  
>  	cleanup();
>  	dst_sock = -1;
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
