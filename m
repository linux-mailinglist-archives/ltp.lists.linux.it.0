Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71DBEFB5
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E923E3C2315
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2B3B53C2400
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D45431001426
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 09:52:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70D58AED6;
 Thu, 26 Sep 2019 07:52:36 +0000 (UTC)
References: <20190808054513.31041-1-liwang@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it, liwang@redhat.com
In-reply-to: <20190808054513.31041-1-liwang@redhat.com>
Date: Thu, 26 Sep 2019 09:52:36 +0200
Message-ID: <87a7arxznf.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Reply-To: rpalethorpe@suse.de
Cc: Michal Hocko <mhocko@suse.cz>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> The test#2 is going to simulate the race condition, where move_pages()
> and soft offline are called on a single hugetlb page concurrently. But,
> it return EBUSY and report FAIL in soft-offline a moving hugepage as a
> result sometimes.
>
> The root cause seems a call to page_huge_active return false, then the
> soft offline action will failed to isolate hugepage with EBUSY return as
> below call trace:
>
> In Parent:
>   madvise(..., MADV_SOFT_OFFLINE)
>   ...
>     soft_offline_page
>       soft_offline_in_use_page
>         soft_offline_huge_page
>           isolate_huge_page
>             page_huge_active
>              # return false at here
>
> In Child:
>   move_pages()
>   ...
>     do_move_pages
>       do_move_pages_to_node
>         add_page_for_migration
>           isolate_huge_page
>             # it has already isolated the hugepage
>
> In this patch, I simply regard the returned EBUSY as a normal situation and
> mask it in error handler. Because move_pages is calling add_page_for_migration
> to isolate hugepage before do migration, so that's very possible to hit the
> collision and return EBUSY on the same page.

We also get EIO (on aarch64) and ENOMEM (on x86). From looking at
migrate_pages, this seems normal, although the behaviour on older kernels
is different to newer ones.

On OpenSUSE with kernel 5.2 the test completes without any problem, but
on SLES kernel 5.12 we get the other error codes.

TBH I'm not sure what we are testing when checking the return value of
MADV_SOFT_OFFLINE? The bug is not reproduced if madvise always fails, so
the test should pass right?

>
> Error log:
> ----------
> move_pages12.c:235: INFO: Free RAM 8386256 kB
> move_pages12.c:253: INFO: Increasing 2048kB hugepages pool on node 0 to 4
> move_pages12.c:263: INFO: Increasing 2048kB hugepages pool on node 1 to 6
> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 0
> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 1
> move_pages12.c:169: PASS: Bug not reproduced
> move_pages12.c:81: FAIL: madvise failed: SUCCESS
> move_pages12.c:81: FAIL: madvise failed: SUCCESS
> move_pages12.c:143: BROK: mmap((nil),4194304,3,262178,-1,0) failed: ENOMEM
> move_pages12.c:114: FAIL: move_pages failed: EINVAL
>
> Dmesg:
> ------
> [165435.492170] soft offline: 0x61c00 hugepage failed to isolate
> [165435.590252] soft offline: 0x61c00 hugepage failed to isolate
> [165435.725493] soft offline: 0x61400 hugepage failed to isolate
>
> Other two fixes in this patch:
>  * use TERRNO(but not TTERRNO) to catch madvise(..., MADV_SOFT_OFFLINE) errno
>  * retry mmap when hugepage allocating failed with ENOMEM
>  * retry numa_move_pages when hitting ENOMEM
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>
> Notes:
>     Hi Cyril,
>
>     Since the SIGBUS problem has been marked as mainline kernel issue, and
>     Mike has worked out a patch[1] to LKML for solving that. So we have no
>     necessary to mask the SIGBUS again for move_page12. Here I take your
>     suggest to retry mmap while hitting ENOMEM in the test looping.
>
>     And, after the patch[1] merging in linus kernel. I'll help to note the
>     SIGBUS issue/patch in test#2 code comments via a seperate patch.
>
>     [1] https://lkml.org/lkml/2019/8/7/941
>
>  .../kernel/syscalls/move_pages/move_pages12.c | 30 ++++++++++++++-----
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
> index 964b712fb..5d7afad8e 100644
> --- a/testcases/kernel/syscalls/move_pages/move_pages12.c
> +++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
> @@ -77,8 +77,8 @@ static void *addr;
>  static int do_soft_offline(int tpgs)
>  {
>  	if (madvise(addr, tpgs * hpsz, MADV_SOFT_OFFLINE) == -1) {
> -		if (errno != EINVAL)
> -			tst_res(TFAIL | TTERRNO, "madvise failed");
> +		if (errno != EINVAL && errno != EBUSY)
> +			tst_res(TFAIL | TERRNO, "madvise failed");
>  		return errno;
>  	}
>  	return 0;
> @@ -111,6 +111,9 @@ static void do_child(int tpgs)
>  		TEST(numa_move_pages(ppid, test_pages,
>  			pages, nodes, status, MPOL_MF_MOVE_ALL));
>  		if (TST_RET < 0) {
> +			if (errno == ENOMEM)
> +				continue;
> +
>  			tst_res(TFAIL | TTERRNO, "move_pages failed");
>  			break;
>  		}
> @@ -121,7 +124,8 @@ static void do_child(int tpgs)
>
>  static void do_test(unsigned int n)
>  {
> -	int i;
> +	int i, ret;
> +	void *ptr;
>  	pid_t cpid = -1;
>  	int status;
>  	unsigned int twenty_percent = (tst_timeout_remaining() / 5);
> @@ -136,18 +140,28 @@ static void do_test(unsigned int n)
>  		do_child(tcases[n].tpages);
>
>  	for (i = 0; i < LOOPS; i++) {
> -		void *ptr;
> +		ptr = mmap(NULL, tcases[n].tpages * hpsz,
> +				PROT_READ | PROT_WRITE,
> +				MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
> +		if (ptr == MAP_FAILED) {
> +			if (i == 0)
> +				tst_brk(TBROK | TERRNO, "Cannot allocate hugepage");
> +
> +			if (errno == ENOMEM) {
> +				usleep(1000);
> +				continue;
> +			}
> +		}
>
> -		ptr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz,
> -			PROT_READ | PROT_WRITE,
> -			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>  		if (ptr != addr)
>  			tst_brk(TBROK, "Failed to mmap at desired addr");
>
>  		memset(addr, 0, tcases[n].tpages * hpsz);
>
>  		if (tcases[n].offline) {
> -			if (do_soft_offline(tcases[n].tpages) == EINVAL) {
> +			ret = do_soft_offline(tcases[n].tpages);
> +
> +			if (ret == EINVAL) {
>  				SAFE_KILL(cpid, SIGKILL);
>  				SAFE_WAITPID(cpid, &status, 0);
>  				SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> --
> 2.20.1


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
