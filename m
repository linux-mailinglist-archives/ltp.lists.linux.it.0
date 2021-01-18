Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E128F2F9BC0
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 10:10:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D2F3C30F8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 10:10:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 42B733C25EF
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 10:10:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 237A4140006D
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 10:10:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="103578215"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Jan 2021 17:10:24 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 9DFFE4CE603F;
 Mon, 18 Jan 2021 17:10:20 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 Jan 2021 17:10:23 +0800
Message-ID: <600550A1.3000605@cn.fujitsu.com>
Date: Mon, 18 Jan 2021 17:10:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20210115151910.3592-1-mdoucha@suse.cz>
In-Reply-To: <20210115151910.3592-1-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9DFFE4CE603F.AEEDA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] semctl09: Fix heap smash
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

Hi Martin
LGTM, pushed. Thanks.

Best Regards
Yang Xu

> semctl() expects pointer to a buffer as its fourth argument, not pointer
> to a pointer. Passing&un.buf results in heap smash that corrupts internal
> LTP data structures on some archs.
>
> CC: Feiyu Zhu<zhufy.jy@cn.fujitsu.com>
> Signed-off-by: Martin Doucha<mdoucha@suse.cz>
> ---
>   testcases/kernel/syscalls/ipc/semctl/semctl09.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> index 131bfbc07..d36ba62e5 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> +++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
> @@ -51,11 +51,15 @@ static union semun un;
>    */
>   static inline int do_semctl(int semid, int semnum, int cmd)
>   {
> +	struct semid_ds info;
> +
> +	un.buf =&info;
> +
>   	switch (tst_variant) {
>   	case 0:
> -		return tst_syscall(__NR_semctl, semid, semnum, cmd,&un.buf);
> +		return tst_syscall(__NR_semctl, semid, semnum, cmd, un);
>   	case 1:
> -		return semctl(semid, semnum, cmd,&un.buf);
> +		return semctl(semid, semnum, cmd, un);
>   	}
>   	return -1;
>   }




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
