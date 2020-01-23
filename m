Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0351461F5
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 07:21:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E1CA3C249A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 07:21:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 945143C0EB6
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 07:21:21 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1CED2140173D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 07:21:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,352,1574092800"; d="scan'208";a="82509386"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jan 2020 14:21:16 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 1170750A996B;
 Thu, 23 Jan 2020 14:12:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 23 Jan 2020 14:21:15 +0800
To: Jorik Cronenberg <jcronenberg@suse.de>
References: <20200122134239.28844-1-jcronenberg@suse.de>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a8618b2e-067c-9a66-02e7-3feceec1ff9c@cn.fujitsu.com>
Date: Thu, 23 Jan 2020 14:21:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200122134239.28844-1-jcronenberg@suse.de>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1170750A996B.AEEA4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add timeout to TST_PROCESS_STATE_WAIT
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


> Add the possibility to add a timeout to TST_PROCESS_STATE_WAIT.
> Like checkpoints add TST_PROCESS_STATE_WAIT2()
> for specifying a timeout. The original TST_PROCESS_STATE_WAIT()
> works the same as before. Timeout can be specified in milliseconds.
> 
Hi Jorik

We have tst_process_state_wait2 since commit dbf270c5 ("lib: Add 
tst_process_state_wait2()"), this api has same functions as 
tst_process_state_wait but only return error instead of TBROK.

I think using TST_PROCESS_STATE_WAIT2 is confused and we can only expand
tst_process_state_wait make it support sleep specifying in milliseconds.

Best Regards
Yang Xu
> Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
> ---
>   include/tst_process_state.h | 12 ++++++++----
>   lib/tst_process_state.c     | 19 ++++++++++++++-----
>   2 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/include/tst_process_state.h b/include/tst_process_state.h
> index fab0491d9..27a8ffc36 100644
> --- a/include/tst_process_state.h
> +++ b/include/tst_process_state.h
> @@ -47,9 +47,13 @@
>    */
>   #ifdef TST_TEST_H__
>   
> +#define TST_PROCESS_STATE_WAIT2(pid, state, msec_timeout) \
> +	tst_process_state_wait(__FILE__, __LINE__, NULL, \
> +	                       (pid), (state), msec_timeout)
> +
>   #define TST_PROCESS_STATE_WAIT(pid, state) \
>   	tst_process_state_wait(__FILE__, __LINE__, NULL, \
> -	                       (pid), (state))
> +	                       (pid), (state), 0)
>   #else
>   /*
>    * The same as above but does not use tst_brkm() interface.
> @@ -65,8 +69,8 @@ int tst_process_state_wait2(pid_t pid, const char state);
>   	                        (pid), (state))
>   #endif
>   
> -void tst_process_state_wait(const char *file, const int lineno,
> -                            void (*cleanup_fn)(void),
> -                            pid_t pid, const char state);
> +int tst_process_state_wait(const char *file, const int lineno,
> +                            void (*cleanup_fn)(void), pid_t pid,
> +			    const char state, unsigned int msec_timeout);
>   
>   #endif /* TST_PROCESS_STATE__ */
> diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
> index 7a7824959..32b44992c 100644
> --- a/lib/tst_process_state.c
> +++ b/lib/tst_process_state.c
> @@ -28,11 +28,12 @@
>   #include "test.h"
>   #include "tst_process_state.h"
>   
> -void tst_process_state_wait(const char *file, const int lineno,
> -                            void (*cleanup_fn)(void),
> -                            pid_t pid, const char state)
> +int tst_process_state_wait(const char *file, const int lineno,
> +                            void (*cleanup_fn)(void), pid_t pid,
> +			    const char state, unsigned int msec_timeout)
>   {
>   	char proc_path[128], cur_state;
> +	unsigned int msecs = 0;
>   
>   	snprintf(proc_path, sizeof(proc_path), "/proc/%i/stat", pid);
>   
> @@ -41,10 +42,18 @@ void tst_process_state_wait(const char *file, const int lineno,
>   		                "%*i %*s %c", &cur_state);
>   
>   		if (state == cur_state)
> -			return;
> +			break;
>   
> -		usleep(10000);
> +		usleep(1000);
> +		msecs += 1;
> +
> +		if (msecs >= msec_timeout) {
> +			errno = ETIMEDOUT;
> +			return -1;
> +		}
>   	}
> +
> +	return 0;
>   }
>   
>   int tst_process_state_wait2(pid_t pid, const char state)
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
