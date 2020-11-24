Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7472C2B73
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 16:37:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 437093C4E9A
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 16:37:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 208F53C2E61
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 16:37:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7F1D71400125
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 16:37:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4372ACA8;
 Tue, 24 Nov 2020 15:37:46 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:38:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201124153837.GA24470@yuki.lan>
References: <20201123083137.11575-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123083137.11575-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls: avoid time() using
 __cvdso_gettimeofday in use-level's VDSO
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
Cc: Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
[CC Thomas Gleixner]

Thomas can you please have a look? It looks like we can get the SysV IPC
ctime to be one second off compared to what we get from realtime clock.

Do we care to get this fixed in kernel or should we fix the tests?

> This shmctl01 test detect the time as the number of seconds twice
> (before and after) the shmget() instruction, then it verifies
> whether the 'struct shmid_ds ds' gets data correctly. But here it
> shows 'ds->ctime' out of the seconds range (1604298586, 1604298586),
> 
> The reason is that shmget()/msgsnd() always use ktime_get_real_second
> to get real seconds, but time() on aarch64 via gettimeofday() or (it
> depends on different kernel versions) clock_gettime() in use-level's
> VDSO to return tv_sec.
> 
> time()
>   __cvdso_gettimeofday
>    ...
>      do_gettimeofday
>        ktime_get_real_ts64
>         timespc64_add_ns
> 
> Situation can be simplify as difference between ktime_get_real_second
> and ktime_get_real_ts64. As we can see ktime_get_real_second return
> tk->xtime_sec directly, however
> 
> timespc64_add_ns more easily add 1 more second via "a->tv_sec +=..."
> on a virtual machine, that's why we got occasional errors like:
> 
> shmctl01.c:183: TFAIL: SHM_STAT: shm_ctime=1604298585, expected <1604298586,1604298586>
> ...
> msgsnd01.c:59: TFAIL: msg_stime = 1605730573 out of [1605730574, 1605730574]
> 
> Here we propose to use '__NR_time' to invoke syscall directly that makes
> test all get real seconds via ktime_get_real_second.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Chunyu Hu <chuhu@redhat.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>  testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c | 5 +++--
>  testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c | 5 +++--
>  testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 5 +++--
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> index 5c1e317e9..6fdc47dc3 100644
> --- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv01.c
> @@ -10,6 +10,7 @@
>  #include "tst_test.h"
>  #include "tst_safe_sysv_ipc.h"
>  #include "libnewipc.h"
> +#include "tst_timer.h"
>  
>  static key_t msgkey;
>  static int queue_id = -1, pid;
> @@ -25,13 +26,13 @@ static void verify_msgrcv(void)
>  
>  	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
>  
> -	time(&before_rcv);
> +	tst_syscall(__NR_time, &before_rcv);
>  	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, 1, 0));
>  	if (TST_RET == -1) {
>  		tst_res(TFAIL | TTERRNO, "msgrcv failed");
>  		return;
>  	}
> -	time(&after_rcv);
> +	tst_syscall(__NR_time, &after_rcv);
>  
>  	if (strcmp(rcv_buf.mtext, snd_buf.mtext) == 0)
>  		tst_res(TPASS, "message received(%s) = message sent(%s)",
> diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> index 5f5da52d2..9101f2668 100644
> --- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> +++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd01.c
> @@ -16,6 +16,7 @@
>  #include "tst_test.h"
>  #include "tst_safe_sysv_ipc.h"
>  #include "libnewipc.h"
> +#include "tst_timer.h"
>  
>  static key_t msgkey;
>  static int queue_id = -1, pid;
> @@ -29,13 +30,13 @@ static void verify_msgsnd(void)
>  	struct msqid_ds qs_buf;
>  	time_t before_snd, after_snd;
>  
> -	time(&before_snd);
> +	tst_syscall(__NR_time, &before_snd);
>  	TEST(msgsnd(queue_id, &snd_buf, MSGSIZE, 0));
>  	if (TST_RET == -1) {
>  		tst_res(TFAIL | TTERRNO, "msgsnd() failed");
>  		return;
>  	}
> -	time(&after_snd);
> +	tst_syscall(__NR_time, &after_snd);
>  
>  	SAFE_MSGCTL(queue_id, IPC_STAT, &qs_buf);
>  
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> index 3a39a4d74..f5b8eaef9 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
> @@ -19,6 +19,7 @@
>  #include "tst_test.h"
>  #include "tst_safe_sysv_ipc.h"
>  #include "libnewipc.h"
> +#include "tst_timer.h"
>  
>  #define NCHILD 20
>  
> @@ -240,9 +241,9 @@ static int get_shm_idx_from_id(int shm_id)
>  
>  static void setup(void)
>  {
> -	ctime_min = time(NULL);
> +	ctime_min = tst_syscall(__NR_time, NULL);
>  	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
> -	ctime_max = time(NULL);
> +	ctime_max = tst_syscall(__NR_time, NULL);
>  
>  	shm_idx = get_shm_idx_from_id(shm_id);
>  
> -- 
> 2.21.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
