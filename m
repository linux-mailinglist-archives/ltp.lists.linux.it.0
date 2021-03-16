Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80B33D19C
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 11:15:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28D6E3C59D3
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 11:15:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0B2EA3C2D4C
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 11:15:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A25891A01137
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 11:15:31 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ASKakwqNQN/51q8BcTiGjsMiAIKoaSvp033AA?=
 =?us-ascii?q?0UdtRRtJNvGJjszGpoV+6TbYqhY0HEshl9eJJbWaTRrnmKJdzIENMd6ZMjXOl2?=
 =?us-ascii?q?elIYpr54mn4xCIIUfD38FH06MISclDIfnRKXQ/ssrg+gm/FL8bsby62YSln/3X?=
 =?us-ascii?q?wXsobSwCUdAC0y5DBgyWElJ7SWB9bPJXKLOn+sFFqzC8EE5nDPiTO39tZYj+ju?=
 =?us-ascii?q?yOvJfnTDpDPBQ/9TSJ5AnC1JfKVzSewTcSOgki/Ysf?=
X-IronPort-AV: E=Sophos;i="5.81,251,1610380800"; d="scan'208";a="105742061"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Mar 2021 18:15:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 866694CEACD3
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 18:15:26 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 18:15:25 +0800
Message-ID: <60508553.4010108@cn.fujitsu.com>
Date: Tue, 16 Mar 2021 18:15:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
References: <1615888254-31940-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1615888254-31940-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 866694CEACD3.A05E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pidns13: Use getpid syscall directly instead of
 glibc wrapper
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

Hi All
I guess the following commit message is more clear.
"
From  glibc  version  2.3.4  up  to  and  including version 2.24, the glibc wrapper function for getpid() cached PIDs, 
with the goal of avoiding additional system calls when a process calls getpid()repeatedly.  Normally this caching was
invisible, but its correct operation relied on support in the wrapper functions for fork(2), vfork(2), and clone(2):
if an application bypassed the glibc wrappers for these system calls by using syscall(2), then a call to getpid()
in the child would return the wrong value (to be precise: it would return the PID of the parent process).  In addition,
there were cases where getpid() could return the wrong value even when invoking clone(2) via the glibc wrapper function. 
"(For a discussion of one such case, see BUGS in clone(2).)"

Because of the aforementioned problems, since glibc version 2.25, the PID cache is removed: calls to getpid() always invoke
the actual system call, rather than returning a cached value.
"
On old api, pidns13 doesn't fail because we use clone and getpid glibc wrapper, now we use clone3 syscall directly and use 
getpid glibc wrapper, so it fails on older glibc ie glibc-2.17.

> As clone(2) man-pages said "GNU C library versions 2.3.4 up to and including
> 2.24 contained a wrapper function for getpid(2) that performed caching of PIDs.
> This caching relied on support in the glibc wrapper for clone(), but limitations
> in the implementation meant that the cache was not up to date in some circumstances".
>
> Because of the stale-cache problem, as well as other problems noted in getpid(2), the
> PID caching feature was removed in glibc 2.25
>
> To get the truth, always use getpid syscall instead of getting value from cache.
> It fixes failure on centos7.
>
> Reported-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/containers/pidns/pidns13.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/containers/pidns/pidns13.c b/testcases/kernel/containers/pidns/pidns13.c
> index 12aee917b..c27ef51b4 100644
> --- a/testcases/kernel/containers/pidns/pidns13.c
> +++ b/testcases/kernel/containers/pidns/pidns13.c
> @@ -54,7 +54,7 @@ static void child_fn(unsigned int cinit_no)
>  	pid_t pid, ppid;
>  	int flags;
>  
> -	pid = getpid();
> +	pid = tst_syscall(__NR_getpid);
>  	ppid = getppid();
>  	if (pid != CHILD_PID || ppid != PARENT_PID)
>  		tst_brk(TBROK, "cinit%u: pidns not created.", cinit_no);




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
