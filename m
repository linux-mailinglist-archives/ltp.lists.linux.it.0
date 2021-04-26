Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2F36B022
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 11:01:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60F413C6749
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 11:01:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF4213C2619
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:01:02 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5286E1400242
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:00:56 +0200 (CEST)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id B85951CE0
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:00:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.88] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P31919T139684407629568S1619427652253749_; 
 Mon, 26 Apr 2021 17:00:52 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f77a0cf1b8f937b4bf5fe9d6799ec49d>
X-RL-SENDER: sujiaxun@uniontech.com
X-SENDER: sujiaxun@uniontech.com
X-LOGIN-NAME: sujiaxun@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 3
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: sujiaxun <sujiaxun@uniontech.com>
References: <20210426074812.27798-1-sujiaxun@uniontech.com>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <4b724549-4623-b7c8-72eb-7f7d309274ad@uniontech.com>
Date: Mon, 26 Apr 2021 17:00:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210426074812.27798-1-sujiaxun@uniontech.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

Please process the patch below.


> The mips architecture gcc does not have a built-in __arch64__,
> you can also use "__BITS_PER_LONG == 64"
> 
> Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
> ---
>   include/lapi/msgbuf.h | 2 +-
>   include/lapi/sembuf.h | 2 +-
>   include/lapi/shmbuf.h | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
> index f3277270d..873902e95 100644
> --- a/include/lapi/msgbuf.h
> +++ b/include/lapi/msgbuf.h
> @@ -17,7 +17,7 @@
>   #if defined(__mips__)
>   #define HAVE_MSQID64_DS
> 
> -#if defined(__arch64__)
> +#if __BITS_PER_LONG == 64
>   /*
>    * The msqid64_ds structure for the MIPS architecture.
>    * Note extra padding because this structure is passed back and forth
> diff --git a/include/lapi/sembuf.h b/include/lapi/sembuf.h
> index 4ef0483a0..66579d294 100644
> --- a/include/lapi/sembuf.h
> +++ b/include/lapi/sembuf.h
> @@ -24,7 +24,7 @@
>    * Pad space is left for 2 miscellaneous 64-bit values on mips64,
>    * but used for the upper 32 bit of the time values on mips32.
>    */
> -#if defined(__arch64__)
> +#if __BITS_PER_LONG == 64
>   struct semid64_ds {
>   	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
>   	long		 sem_otime;		/* last semop time */
> diff --git a/include/lapi/shmbuf.h b/include/lapi/shmbuf.h
> index 28ee33620..ad71d9431 100644
> --- a/include/lapi/shmbuf.h
> +++ b/include/lapi/shmbuf.h
> @@ -27,7 +27,7 @@
>    * data structure when moving to 64-bit time_t.
>    */
> 
> -#if defined(__arch64__)
> +#if __BITS_PER_LONG == 64
>   struct shmid64_ds {
>   	struct ipc64_perm	shm_perm;	/* operation perms */
>   	size_t			shm_segsz;	/* size of segment (bytes) */
> --
> 2.20.1
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
