Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A91A04E7
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 04:31:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE2613C2E0B
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 04:31:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C6B733C2216
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 04:30:59 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D6ADD14004FE
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 04:30:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="88590562"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Apr 2020 10:30:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8519550A9996;
 Tue,  7 Apr 2020 10:20:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 7 Apr 2020 10:30:50 +0800
To: Li Wang <liwang@redhat.com>
References: <20200406132932.12951-1-liwang@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c95f2855-1e16-69c9-1eea-d88c66caffe1@cn.fujitsu.com>
Date: Tue, 7 Apr 2020 10:30:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200406132932.12951-1-liwang@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8519550A9996.AD640
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlb: move nr_opt to tst_hugepage.h
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

Looks good to me,
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Best Regards
Yang Xu

> This is to get rid of the following error:
>    # ./hugemmap01 -s 2
>    tst_hugepage.c:29: INFO: Requested number(128) of hugepages is too large,
>                       limiting to 80% of the max hugepage count 28
>    tst_hugepage.c:40: BROK: nr_hugepages = 5, but expect 22
> 
> The root cause is that hugetlb test hits TBROK if the system can't satisfy 80%
> of .request_hugepages(default: 128), it doesn't get a chance to set nr_hugepages
> with specified page number via '-s xxx'.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   include/tst_hugepage.h                                 |  3 +++
>   lib/tst_hugepage.c                                     | 10 +++++++---
>   testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c     |  5 -----
>   testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c     |  5 -----
>   testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c     |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c   |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c   |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c   |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c   |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c |  5 -----
>   testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c |  5 -----
>   testcases/kernel/mem/hugetlb/lib/hugetlb.h             |  3 ---
>   17 files changed, 10 insertions(+), 76 deletions(-)
> 
> diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
> index 8600b3adb..30e00a377 100644
> --- a/include/tst_hugepage.h
> +++ b/include/tst_hugepage.h
> @@ -9,6 +9,9 @@
>   #define PATH_HUGEPAGES	"/sys/kernel/mm/hugepages/"
>   #define PATH_NR_HPAGES	"/proc/sys/vm/nr_hugepages"
>   
> +char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
> +char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
> +
>   /*
>    * Try the best to request a specified number of huge pages from system,
>    * it will store the reserved hpage number in tst_hugepages.
> diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
> index c75fb264d..34fd27ede 100644
> --- a/lib/tst_hugepage.c
> +++ b/lib/tst_hugepage.c
> @@ -19,14 +19,18 @@ unsigned long tst_request_hugepages(unsigned long hpages)
>   		goto out;
>   	}
>   
> -	tst_hugepages = hpages;
> +	if (nr_opt)
> +		tst_hugepages = SAFE_STRTOL(nr_opt, 1, LONG_MAX);
> +	else
> +		tst_hugepages = hpages;
> +
>   	SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
>   	max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
>   
> -	if (hpages > max_hpages) {
> +	if (tst_hugepages > max_hpages) {
>   		tst_res(TINFO, "Requested number(%lu) of hugepages is too large, "
>   				"limiting to 80%% of the max hugepage count %lu",
> -				hpages, max_hpages);
> +				tst_hugepages, max_hpages);
>   		tst_hugepages = max_hpages * 0.8;
>   
>   		if (tst_hugepages < 1)
> diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
> index eecbe93f8..891c42e46 100644
> --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
> +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
> @@ -81,11 +81,6 @@ void setup(void)
>   		Hopt = tst_get_tmpdir();
>   	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
> index 4a4b5680e..c0dbb60d6 100644
> --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
> +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
> @@ -128,11 +128,6 @@ static void setup(void)
>   		Hopt = tst_get_tmpdir();
>   	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 1, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
> index 74a90c01a..5fcbe2789 100644
> --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
> +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
> @@ -99,11 +99,6 @@ void setup(void)
>   		Hopt = tst_get_tmpdir();
>   	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing!");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
> index 0e6e64d3d..807d1c454 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
> @@ -154,11 +154,6 @@ static void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
> index cfc18a795..febe03d12 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
> @@ -79,11 +79,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
> index ea784da70..42965e4d7 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
> @@ -74,11 +74,6 @@ static void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> index 84321d94c..1e84fec59 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
> @@ -288,11 +288,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
> index 9d835394c..69db058d1 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
> @@ -77,11 +77,6 @@ static void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> index 739b57f95..fedc22246 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
> @@ -106,11 +106,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
> index f0947e703..066f34d1c 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
> @@ -119,11 +119,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
> index d77f4ae97..e1f8fec5a 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
> @@ -54,11 +54,6 @@ static void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
> index ad81c979c..ebe6f0bcd 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
> @@ -72,11 +72,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> index e08ed9f42..226985d53 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> @@ -51,11 +51,6 @@ static void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
> index 4c175d59a..506d1df06 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
> @@ -66,11 +66,6 @@ void setup(void)
>   {
>   	long hpage_size;
>   
> -	if (nr_opt) {
> -		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
> -		tst_request_hugepages(tst_hugepages);
> -	}
> -
>   	if (tst_hugepages == 0)
>   		tst_brk(TCONF, "No enough hugepages for testing.");
>   
> diff --git a/testcases/kernel/mem/hugetlb/lib/hugetlb.h b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
> index 7c03a317c..88890ebfb 100644
> --- a/testcases/kernel/mem/hugetlb/lib/hugetlb.h
> +++ b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
> @@ -40,7 +40,4 @@ int getipckey(void);
>   int getuserid(char *user);
>   void rm_shm(int shm_id);
>   
> -char *nr_opt;
> -char *Hopt;
> -
>   #endif /* hugetlb.h */
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
