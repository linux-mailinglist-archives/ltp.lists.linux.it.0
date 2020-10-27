Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E729AD08
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:18:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7C273C55F4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:18:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0F0003C23B5
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:18:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 85111600C16
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:18:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D18D8AD76;
 Tue, 27 Oct 2020 13:18:01 +0000 (UTC)
References: <20201026121605.20100-1-rpalethorpe@suse.com>
 <CAEemH2d8+5qLLKWsuf5WJeLHdv2VfPZiyM9-oW=WyH4m==h=8g@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2d8+5qLLKWsuf5WJeLHdv2VfPZiyM9-oW=WyH4m==h=8g@mail.gmail.com>
Date: Tue, 27 Oct 2020 13:18:00 +0000
Message-ID: <877drbvmd3.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise06: Increase reliability and diagnostic
 info
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> On Mon, Oct 26, 2020 at 8:16 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> When memcg.limit_in_bytes is set to PASS_THRESHOLD it's unlikely
>> swapcached will increase by more than PASS_THRESHOLD unless processes
>> in other memcgs are also increasing it. Additionally MADV_WILLNEED
>> must remove pages from memory as it adds more so that the first page
>> may not be in memory by the time the last page is faulted if the
>> amount exceeds the memory limit (which it does because CHUNK_SZ >
>> PASS_THRESSHOLD). Worse if pages are faulted in a non-linear way, or
>> the process must access some other pages, then there is no guarantee
>> which parts of the range will be resident in memory. This results in
>> spurious test failures.
>>
>> To solve this we can set PASS_THRESHOLD to 1/4 of CHUNK_SZ and
>> memcg.limit_in_bytes to 1/2 of CHUNK_SZ (MEM_LIMIT), then mark
>> MEM_LIMIT bytes as needed. That way the amount in the SwapCache will
>> easily be more than the threshold. Secondly we can run madvise again
>> on PASS_THRESHOLD bytes and check that dirtying all of these does not
>> result in too many page faults. We also run the second test on every
>> occasion to ensure the test code itself is still valid. If the
>> original bug is present then both tests fail.
>>
>> Finally this prints more diagnostic information to help with debugging
>> the test.
>>
>> While debugging the test a kernel bug was found in 5.9 which effects
>> CGroupV1 when use_hierarchy=0. This is unlikely to effect many users,
>> but a fix is pending and will be referenced in the test when
>> available. It is recommended that you set use_hierarchy=1.
>>
>
> Great, we could add the commit info as well after patch merging in the
> mainline kernel.
>
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>>
> Reviewed-by: Li Wang <liwang@redhat.com>
>
> This improvement makes sense to me apart from a tiny syntax error below.
>
> One additional comment, I found this test now only run with CGroupV1,
> and maybe we could make use of the LTP-cgroup new library after we
> updating that(tst_cgroup.c) to make it works well with CGroupV2.

+1

Also we may need to run tests with and without use_hierarchy, plus other
configurations.

>
> ---
>>  testcases/kernel/syscalls/madvise/madvise06.c | 107 ++++++++++++++----
>>  1 file changed, 84 insertions(+), 23 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/madvise/madvise06.c
>> b/testcases/kernel/syscalls/madvise/madvise06.c
>> index f76f3f6aa..3e70da37e 100644
>> --- a/testcases/kernel/syscalls/madvise/madvise06.c
>> +++ b/testcases/kernel/syscalls/madvise/madvise06.c
>> @@ -19,6 +19,23 @@
>>   *   Date:   Thu May 22 11:54:17 2014 -0700
>>   *
>>   *       mm: madvise: fix MADV_WILLNEED on shmem swapouts
>> + *
>> + *   Two checks are performed, the first looks at how SwapCache
>> + *   changes during madvise. When the pages are dirtied, about half
>> + *   will be accounted for under Cached and the other half will be
>> + *   moved into Swap. When madvise is run it will cause the pages
>> + *   under Cached to also be moved to Swap while rotating the pages
>> + *   already in Swap into SwapCached. So we expect that SwapCached has
>> + *   roughly MEM_LIMIT bytes added to it, but for reliability the
>> + *   PASS_THRESHOLD is much lower than that.
>> + *
>> + *   Secondly we run madvise again, but only on the first
>> + *   PASS_THRESHOLD bytes to ensure these are entirely in RAM. Then we
>> + *   dirty these pages and check there were (almost) no page
>> + *   faults. Two faults are allowed incase some tasklet or something
>> + *   else unexpected, but irrelevant procedure, registers a fault to
>> + *   our process.
>> + *
>>   */
>>
>>  #include <errno.h>
>> @@ -28,8 +45,10 @@
>>  #include "tst_test.h"
>>
>>  #define CHUNK_SZ (400*1024*1024L)
>> -#define CHUNK_PAGES (CHUNK_SZ / pg_sz)
>> +#define MEM_LIMIT (CHUNK_SZ / 2)
>> +#define MEMSW_LIMIT (2 * CHUNK_SZ)
>>  #define PASS_THRESHOLD (CHUNK_SZ / 4)
>> +#define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
>>
>>  #define MNT_NAME "memory"
>>  #define GROUP_NAME "madvise06"
>> @@ -37,12 +56,39 @@
>>  static const char drop_caches_fname[] = "/proc/sys/vm/drop_caches";
>>  static int pg_sz;
>>
>> +static long init_swap, init_swap_cached, init_cached;
>> +
>>  static void check_path(const char *path)
>>  {
>>         if (access(path, R_OK | W_OK))
>>                 tst_brk(TCONF, "file needed: %s\n", path);
>>  }
>>
>> +#define READ_CGMEM(item)                                               \
>> +       ({long tst_rval;                                                \
>> +         SAFE_FILE_LINES_SCANF(MNT_NAME"/"GROUP_NAME"/memory."item,    \
>> +                               "%ld",                                  \
>> +                               &tst_rval);                             \
>> +         tst_rval;})
>> +
>> +static void meminfo_diag(const char *point)
>> +{
>> +       FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
>> +       tst_res(TINFO, point);
>>
>
> Here is a syntax error, to fix it as:
>     tst_res(TINFO, "%s", point);

Thanks!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
