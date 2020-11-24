Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B72C1BC3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 03:56:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AD463C5E9B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 03:56:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D43163C252B
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 03:56:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 16322600067
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 03:56:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,364,1599494400"; d="scan'208";a="101680874"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Nov 2020 10:56:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 14ABB4CE547C;
 Tue, 24 Nov 2020 10:56:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 24 Nov 2020 10:56:27 +0800
Message-ID: <5FBC765A.3020102@cn.fujitsu.com>
Date: Tue, 24 Nov 2020 10:56:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201123083137.11575-2-liwang@redhat.com>
In-Reply-To: <20201123083137.11575-2-liwang@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 14ABB4CE547C.A1AD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls: shift to time() if __NR_time not
 support
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

Hi Li

I have seen this patchset, Can we use a function to check whether kernel 
supports time syscall (like time_supported_by_kernel()) in setup
and then we use time() - !return value in verify funtion?
> On some platforms(aarch64) __NR_time is not supported, if that happens,
> go back to invoke time() and relax 1-second in low bound for comparing.
>
> This also to fix:
>    TFAIL: msg_stime = 1605730573 out of [1605730574, 1605730574]
>
> Signed-off-by: Li Wang<liwang@redhat.com>
> Cc: Chunyu Hu<chuhu@redhat.com>
> Cc: Cyril Hrubis<chrubis@suse.cz>
> ---
>   testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c | 14 ++++++++++++--
>   testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c | 14 ++++++++++++--
>   testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 14 ++++++++++++--
>   3 files changed, 36 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> index 6fdc47dc3..9dc778ca7 100644
> --- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> @@ -26,13 +26,23 @@ static void verify_msgrcv(void)
>
>   	SAFE_MSGSND(queue_id,&snd_buf, MSGSIZE, 0);
>
> -	tst_syscall(__NR_time,&before_rcv);
> +	before_rcv = syscall(__NR_time, NULL);
> +	if (before_rcv == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		before_rcv = time(NULL) - 1;
> +	}
> +
>   	TEST(msgrcv(queue_id,&rcv_buf, MSGSIZE, 1, 0));
>   	if (TST_RET == -1) {
>   		tst_res(TFAIL | TTERRNO, "msgrcv failed");
>   		return;
>   	}
> -	tst_syscall(__NR_time,&after_rcv);
> +
> +	after_rcv = syscall(__NR_time, NULL);
> +	if (after_rcv == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		after_rcv = time(NULL);
> +	}
>
>   	if (strcmp(rcv_buf.mtext, snd_buf.mtext) == 0)
>   		tst_res(TPASS, "message received(%s) = message sent(%s)",
> diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> index 9101f2668..27464e79f 100644
> --- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> +++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> @@ -30,13 +30,23 @@ static void verify_msgsnd(void)
>   	struct msqid_ds qs_buf;
>   	time_t before_snd, after_snd;
>
> -	tst_syscall(__NR_time,&before_snd);
> +	before_snd = syscall(__NR_time, NULL);
> +	if (before_snd == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		before_snd = time(NULL) - 1;
> +	}
> +
>   	TEST(msgsnd(queue_id,&snd_buf, MSGSIZE, 0));
>   	if (TST_RET == -1) {
>   		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
>   		return;
>   	}
> -	tst_syscall(__NR_time,&after_snd);
> +
> +	after_snd = syscall(__NR_time, NULL);
> +	if (after_snd == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		after_snd = time(NULL);
> +	}
>
>   	SAFE_MSGCTL(queue_id, IPC_STAT,&qs_buf);
>
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> index f5b8eaef9..356513726 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> @@ -241,9 +241,19 @@ static int get_shm_idx_from_id(int shm_id)
>
>   static void setup(void)
>   {
> -	ctime_min = tst_syscall(__NR_time, NULL);
> +	ctime_min = syscall(__NR_time, NULL);
> +	if (ctime_min == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		ctime_min = time(NULL) - 1;
> +	}
> +
>   	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
> -	ctime_max = tst_syscall(__NR_time, NULL);
> +
> +	ctime_max = syscall(__NR_time, NULL);
> +	if (ctime_max == -1&&  errno == ENOSYS) {
> +		tst_res(TINFO, "__NR_time not supported");
> +		ctime_max = time(NULL);
> +	}
>
>   	shm_idx = get_shm_idx_from_id(shm_id);
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
