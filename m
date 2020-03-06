Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9217B40D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 02:53:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50D593C6529
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 02:53:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A28203C64CE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 02:53:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 05A431A009BA
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 02:53:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,520,1574092800"; d="scan'208";a="85919148"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Mar 2020 09:53:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0B30450A9962;
 Fri,  6 Mar 2020 09:43:26 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 6 Mar 2020 09:53:18 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20200305171844.24020-1-pvorel@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <cd067b8a-224d-993f-8668-e8f7b70f59bc@cn.fujitsu.com>
Date: Fri, 6 Mar 2020 09:53:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200305171844.24020-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0B30450A9962.AC73B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] hugeshmctl01: Fix reset stat_time when
 looping with -i n
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

Hi Petr

> c7a2d296b didn't reset stat_time, thus uninitialized set_shared was
> assigned to test variable and test got value from a null pointer,
> which leaded to segfault.
> 
> hugeshmctl01.c:279: PASS: shmctl in func_rmid() failed as expected, shared memory appears to be removed
> tst_checkpoint.c:147: BROK: hugeshmctl01.c:152: tst_checkpoint_wait(0, 10000): ETIMEDOUT (110)
> mem.c:817: INFO: set nr_hugepages to 0
> 
> dmesg:
> segfault at 7f73f8c00000 ip 00000000004051e1 sp 00007ffef375f9a0 error 6 in hugeshmctl01.master[404000+13000]
> addr2line -e hugeshmctl01 -f  00000000004051e1
> stat_setup
> hugeshmctl01.c:139 (discriminator 4)
> 
> test = (stat_time == FIRST) ? set_shmat() : set_shared;
> 
> /* do an assignement for fun */
> *(int *)test = i; // error here
> 
> Fixes: c7a2d296b ("hugeshmctl: Use loop from the API")
> 
> Reported-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Suggested-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Xu,
> 
> I'm sorry for introducing a regression.
> Thank you for a report and fixing the test.
> I'd personally prefer to keep .tcnt = ARRAY_SIZE(tcases),
> but maybe others will prefer to keep loop in test_hugeshmctl()
> as it was before my change.
> 
> BTW it'd be nice to have something like setup_i() and cleanup_i(),
> which would be called before/after each run of whole test, when run with
> -i n.
Sub tests have own clean and setup function. They only reused  a System 
V shared memory segment. IMO, this is a question of coupling.
> 
> Kind regards,
> Petr
> 
>   .../mem/hugetlb/hugeshmctl/hugeshmctl01.c     | 27 ++++++++++---------
>   1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> index e6cf8bf09..3b7e14363 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> @@ -75,6 +75,20 @@ struct tcase {
>   
>   static void test_hugeshmctl(unsigned int i)
>   {
> +	stat_time = FIRST;
> +
My description may confuse you.  stat_time should not be reseted every 
time, it only needs to be reseted when next loop. This value will be +1 
  when call stat_cleanup.
struct tcase {
         int cmd;
         void (*func_test) (void);
         void (*func_setup) (void);
} tcases[] = {
         {IPC_STAT, func_stat, stat_setup},   //stat_time = FIRST
         {IPC_STAT, func_stat, stat_setup},   //stat_time = SECOND

As you do, the first and second case are same. it should be added into 
the "if == 0".

ps: I personally think old case is more cleaner. Let's hear from others.

Best Regards
Yang Xu
> +	/*
> +	 * Create a shared memory segment with read and write
> +	 * permissions. Do this here instead of in setup()
> +	 * so that looping (-i) will work correctly.
> +	 */
> +	if (i == 0) {
> +		shm_id_1 = shmget(shmkey, shm_size,
> +				SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
> +		if (shm_id_1 == -1)
> +			tst_brk(TBROK | TERRNO, "shmget #main");
> +	}
> +
>   	/*
>   	 * if needed, set up any required conditions by
>   	 * calling the appropriate setup function
> @@ -296,19 +310,6 @@ void setup(void)
>   	shm_size = hpage_size * hugepages / 2;
>   	update_shm_size(&shm_size);
>   	shmkey = getipckey();
> -
> -	/* initialize stat_time */
> -	stat_time = FIRST;
> -
> -	/*
> -	 * Create a shared memory segment with read and write
> -	 * permissions.  Do this here instead of in setup()
> -	 * so that looping (-i) will work correctly.
> -	 */
> -	shm_id_1 = shmget(shmkey, shm_size,
> -			SHM_HUGETLB | IPC_CREAT | IPC_EXCL | SHM_RW);
> -	if (shm_id_1 == -1)
> -		tst_brk(TBROK | TERRNO, "shmget #main");
>   }
>   
>   void cleanup(void)
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
