Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F28579B0
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 04:50:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 157DF3C1C8F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 04:50:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 61D9E3C1045
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 04:50:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D6A75601351
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 04:50:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,422,1557158400"; d="scan'208,217";a="69601010"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Jun 2019 10:50:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B3B834CDDD30;
 Thu, 27 Jun 2019 10:50:32 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 27 Jun 2019 10:50:33 +0800
Message-ID: <5D142EF6.6030402@cn.fujitsu.com>
Date: Thu, 27 Jun 2019 10:50:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190610032754.GA7114@hori.linux.bs1.fc.nec.co.jp>
 <5D0C7204.9020704@cn.fujitsu.com>
 <CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com>
In-Reply-To: <CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: B3B834CDDD30.AF15D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0681909365=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0681909365==
Content-Type: multipart/alternative;
	boundary="------------020202060705080100030801"

--------------020202060705080100030801
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

on 2019/06/24 10:43, Li Wang wrote:

> Hi Xu Yang,
>
> On Fri, Jun 21, 2019 at 1:58 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com 
> <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
>
>
>     > Hi Li Wang,
>     >
>     > Thank you for maintaining the testcase.
>     >
>     > Recently (since 4.19) we have a semantics change on the return
>     value of
>     > madvise(MADV_SOFT_OFFLINE), and we see -EBUSY when hugepage
>     migration
>     > succeeded and error containment failed:
>     >
>     >   commit 6bc9b56433b76e40d11099338d27fbc5cd2935ca
>     >   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com
>     <mailto:n-horiguchi@ah.jp.nec.com>>
>     >   Date:   Thu Aug 23 17:00:38 2018 -0700
>     >
>     >       mm: fix race on soft-offlining free huge pages
>     >
>     > , so we don't have to consider this EBUSY as error, but a good
>     report
>     > for application. Your change meets the change.
>     >
>     > Feel free to add my ack:
>     >
>     > Acked-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com
>     <mailto:n-horiguchi@ah.jp.nec.com>>
>     >
>     > Thanks,
>     > - Naoya
>     >
>     > On Fri, Jun 07, 2019 at 05:52:13PM +0800, Li Wang wrote:
>     >> The test#2 is going to simulate the race condition, where
>     move_pages()
>     >> and soft offline are called on a single hugetlb page
>     concurrently. But,
>     >> it return EBUSY and report FAIL in soft-offline a moving
>     hugepage as a
>     >> result sometimes.
>     >>
>     >> The root cause seems a call to page_huge_active return false,
>     then the
>     >> soft offline action will failed to isolate hugepage with EBUSY
>     return as
>     >> below call trace:
>     >>
>     >> In Parent:
>     >>   madvise(..., MADV_SOFT_OFFLINE)
>     >>   ...
>     >>     soft_offline_page
>     >>       soft_offline_in_use_page
>     >>         soft_offline_huge_page
>     >>           isolate_huge_page
>     >>             page_huge_active  --> return false at here
>     >>
>     >> In Child:
>     >>   move_pages()
>     >>   ...
>     >>     do_move_pages
>     >>       do_move_pages_to_node
>     >>         add_page_for_migration
>     >>           isolate_huge_page   --> it has already isolated the
>     hugepage
>     >>
>     >> In this patch, I simply regard the returned EBUSY as a normal
>     situation and
>     >> mask it in error handler. Because move_pages is calling
>     add_page_for_migration
>     >> to isolate hugepage before do migration, so that's very
>     possible to hit the
>     >> collision and return EBUSY on the same page.
>     >>
>     >> Error log:
>     >> ----------
>     >> move_pages12.c:235: INFO: Free RAM 8386256 kB
>     >> move_pages12.c:253: INFO: Increasing 2048kB hugepages pool on
>     node 0 to 4
>     >> move_pages12.c:263: INFO: Increasing 2048kB hugepages pool on
>     node 1 to 6
>     >> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on
>     node 0
>     >> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on
>     node 1
>     >> move_pages12.c:169: PASS: Bug not reproduced
>     >> move_pages12.c:81: FAIL: madvise failed: SUCCESS
>     >> move_pages12.c:81: FAIL: madvise failed: SUCCESS
>     >> move_pages12.c:143: BROK: mmap((nil),4194304,3,262178,-1,0)
>     failed: ENOMEM
>     >> move_pages12.c:114: FAIL: move_pages failed: EINVAL
>     >>
>     >> Dmesg:
>     >> ------
>     >> [165435.492170] soft offline: 0x61c00 hugepage failed to isolate
>     >> [165435.590252] soft offline: 0x61c00 hugepage failed to isolate
>     >> [165435.725493] soft offline: 0x61400 hugepage failed to isolate
>     >>
>     >> Other two fixes in this patch:
>     >>  * use TERRNO(but not TTERRNO) to catch madvise(...,
>     MADV_SOFT_OFFLINE) errno
>     >>  * go out test when hugepage allocating failed with ENOMEM
>     Hi Li
>
>     Your patch can handle EBUSY errno correctly for soft offline.
>     But move page  may be killed by SIGBUS because of  MCE  when we
>     soft offline concurrently.
>     That leads to move_page failed with ESRCH.   Also, move page may
>     fails with ENOMEM .
>     Do you notice it ?
>
>
> I didn't get this failure, it seems not related to this patch. Two 
> questions:
>
> 1. which kernel version do you test?
> 2. can you reproduce this without my patch?
Hi Li

I test it on 3.10.0-957.el7.x86_64  kvm(my machine was not support numa 
and i enable it on kvm. as below:
<cpu mode='custom' match='exact' check='full'>
<model fallback='forbid'>Penryn</model>
<feature policy='require' name='x2apic'/>
<feature policy='require' name='hypervisor'/>
<numa>
<cell id='0' cpus='0' memory='1048576' unit='KiB'/>
<cell id='1' cpus='1' memory='1048576' unit='KiB'/>
</numa>
</cpu>

Does it only exist on kvm and doesn't  exist on physical machine?  I 
don't have physical machine that supports numa.

And the fix patch has been merged since  3.10.0-957.el7.x86_64 .
Yes,   I can reproduce this without your patch because MCE kills child 
process and move_page gets ESRCH error.


>
>
>     I think ESRCH error can represent the soft offline bug not
>     reproduce because it don't trigger a crash.
>     What do you think about it?
>
>
> Maybe, but it needs to check details on your kernel.
>
>
>     err_log:
>     tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
>     move_pages12.c:236: INFO: Free RAM 119568 kB
>     move_pages12.c:254: INFO: Increasing 2048kB hugepages pool on node
>     0 to 83
>     move_pages12.c:264: INFO: Increasing 2048kB hugepages pool on node
>     1 to 94
>     move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 0
>     move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 1
>     move_pages12.c:170: PASS: Bug not reproduced
>     tst_test.c:1141: BROK: Test killed by SIGBUS!
>
>     Summary:
>     passed   1
>     failed   0
>     skipped  0
>     warnings 0
>
>     move_pages12.c:114: FAIL: move_pages failed: ESRCH
>
>     dmesg
>     [ 9868.180669] MCE: Killing move_pages12:29616 due to hardware
>     memory corruption fault at 2aaaaac00018
>     [ 9990.049875] Soft offlining page 50e00 at 2aaaaac00000
>     [ 9990.052218] Soft offlining page 50c00 at 2aaaaae00000
>     [ 9990.060395] Soft offlining page 51000 at 2aaaaac00000
>
>     Kind Regards,
>     Yang Xu
>
>     >> Signed-off-by: Li Wang <liwang@redhat.com
>     <mailto:liwang@redhat.com>>
>     >> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com
>     <mailto:n-horiguchi@ah.jp.nec.com>>
>     >> Cc: Xiao Yang <yangx.jy@cn.fujitsu.com
>     <mailto:yangx.jy@cn.fujitsu.com>>
>     >> Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com
>     <mailto:xuyang2018.jy@cn.fujitsu.com>>
>     >> ---
>     >>  .../kernel/syscalls/move_pages/move_pages12.c | 33
>     ++++++++++++++-----
>     >>  1 file changed, 24 insertions(+), 9 deletions(-)
>     >>
>     >> diff --git
>     a/testcases/kernel/syscalls/move_pages/move_pages12.c
>     b/testcases/kernel/syscalls/move_pages/move_pages12.c
>     >> index 964b712fb..c446396dc 100644
>     >> --- a/testcases/kernel/syscalls/move_pages/move_pages12.c
>     >> +++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
>     >> @@ -77,8 +77,8 @@ static void *addr;
>     >>  static int do_soft_offline(int tpgs)
>     >>  {
>     >>      if (madvise(addr, tpgs * hpsz, MADV_SOFT_OFFLINE) == -1) {
>     >> -            if (errno != EINVAL)
>     >> -                    tst_res(TFAIL | TTERRNO, "madvise failed");
>     >> +            if (errno != EINVAL && errno != EBUSY)
>     >> +                    tst_res(TFAIL | TERRNO, "madvise failed");
>     >>              return errno;
>     >>      }
>     >>      return 0;
>     >> @@ -121,7 +121,8 @@ static void do_child(int tpgs)
>     >>
>     >>  static void do_test(unsigned int n)
>     >>  {
>     >> -    int i;
>     >> +    int i, ret;
>     >> +    void *ptr;
>     >>      pid_t cpid = -1;
>     >>      int status;
>     >>      unsigned int twenty_percent = (tst_timeout_remaining() / 5);
>     >> @@ -136,24 +137,37 @@ static void do_test(unsigned int n)
>     >>              do_child(tcases[n].tpages);
>     >>
>     >>      for (i = 0; i < LOOPS; i++) {
>     >> -            void *ptr;
>     >> +            ptr = mmap(NULL, tcases[n].tpages * hpsz,
>     >> +                            PROT_READ | PROT_WRITE,
>     >> +                            MAP_PRIVATE | MAP_ANONYMOUS |
>     MAP_HUGETLB, -1, 0);
>     >> +            if (ptr == MAP_FAILED) {
>     >> +                    if (errno == ENOMEM) {
>     >> +                            tst_res(TCONF,
>     >> +                                    "Cannot allocate hugepage,
>     memory too fragmented?");
>     >> +                            goto out;
>     >> +                    }
>     >> +
>     >> +                    tst_brk(TBROK | TERRNO, "Cannot allocate
>     hugepage");
>     >> +            }
>     >>
>     >> -            ptr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz,
>     >> -                    PROT_READ | PROT_WRITE,
>     >> -                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
>     -1, 0);
>     >>              if (ptr != addr)
>     >>                      tst_brk(TBROK, "Failed to mmap at desired
>     addr");
>     >>
>     >>              memset(addr, 0, tcases[n].tpages * hpsz);
>     >>
>     >>              if (tcases[n].offline) {
>     >> -                    if (do_soft_offline(tcases[n].tpages) ==
>     EINVAL) {
>     >> +                    ret = do_soft_offline(tcases[n].tpages);
>     >> +
>     >> +                    if (ret == EINVAL) {
>     >>                              SAFE_KILL(cpid, SIGKILL);
>     >>                              SAFE_WAITPID(cpid, &status, 0);
>     >>                              SAFE_MUNMAP(addr, tcases[n].tpages
>     * hpsz);
>     >>                              tst_res(TCONF,
>     >>                                      "madvise() didn't support
>     MADV_SOFT_OFFLINE");
>     >>                              return;
>     >> +                    } else if (ret == EBUSY) {
>     >> +                            SAFE_MUNMAP(addr, tcases[n].tpages
>     * hpsz);
>     >> +                            goto out;
>     >>                      }
>     >>              }
>     >>
>     >> @@ -163,9 +177,10 @@ static void do_test(unsigned int n)
>     >>                      break;
>     >>      }
>     >>
>     >> +out:
>     >>      SAFE_KILL(cpid, SIGKILL);
>     >>      SAFE_WAITPID(cpid, &status, 0);
>     >> -    if (!WIFEXITED(status))
>     >> +    if (!WIFEXITED(status) && ptr != MAP_FAILED)
>     >>              tst_res(TPASS, "Bug not reproduced");
>     >>  }
>     >>
>     >> --
>     >> 2.20.1
>     >>
>     >>
>     >
>     > .
>     >
>
>
>
>
>
> -- 
> Regards,
> Li Wang




--------------020202060705080100030801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <pre>on 2019/06/24 10:43, Li Wang wrote:</pre>
    <blockquote
cite="mid:CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size: small;">Hi Xu
            Yang,</div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Jun 21, 2019 at 1:58
            PM Yang Xu &lt;<a moz-do-not-send="true"
              href="mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;"><br>
            &gt; Hi Li Wang,<br>
            &gt;<br>
            &gt; Thank you for maintaining the testcase.<br>
            &gt;<br>
            &gt; Recently (since 4.19) we have a semantics change on the
            return value of<br>
            &gt; madvise(MADV_SOFT_OFFLINE), and we see -EBUSY when
            hugepage migration<br>
            &gt; succeeded and error containment failed:<br>
            &gt;<br>
            &gt;   commit 6bc9b56433b76e40d11099338d27fbc5cd2935ca<br>
            &gt;   Author: Naoya Horiguchi &lt;<a moz-do-not-send="true"
              href="mailto:n-horiguchi@ah.jp.nec.com" target="_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
            &gt;   Date:   Thu Aug 23 17:00:38 2018 -0700<br>
            &gt;   <br>
            &gt;       mm: fix race on soft-offlining free huge pages<br>
            &gt;<br>
            &gt; , so we don't have to consider this EBUSY as error, but
            a good report<br>
            &gt; for application. Your change meets the change.<br>
            &gt;<br>
            &gt; Feel free to add my ack:<br>
            &gt;<br>
            &gt; Acked-by: Naoya Horiguchi &lt;<a moz-do-not-send="true"
              href="mailto:n-horiguchi@ah.jp.nec.com" target="_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
            &gt;<br>
            &gt; Thanks,<br>
            &gt; - Naoya<br>
            &gt;<br>
            &gt; On Fri, Jun 07, 2019 at 05:52:13PM +0800, Li Wang
            wrote:<br>
            &gt;&gt; The test#2 is going to simulate the race condition,
            where move_pages()<br>
            &gt;&gt; and soft offline are called on a single hugetlb
            page concurrently. But,<br>
            &gt;&gt; it return EBUSY and report FAIL in soft-offline a
            moving hugepage as a<br>
            &gt;&gt; result sometimes.<br>
            &gt;&gt;<br>
            &gt;&gt; The root cause seems a call to page_huge_active
            return false, then the<br>
            &gt;&gt; soft offline action will failed to isolate hugepage
            with EBUSY return as<br>
            &gt;&gt; below call trace:<br>
            &gt;&gt;<br>
            &gt;&gt; In Parent:<br>
            &gt;&gt;   madvise(..., MADV_SOFT_OFFLINE)<br>
            &gt;&gt;   ...<br>
            &gt;&gt;     soft_offline_page<br>
            &gt;&gt;       soft_offline_in_use_page<br>
            &gt;&gt;         soft_offline_huge_page<br>
            &gt;&gt;           isolate_huge_page<br>
            &gt;&gt;             page_huge_active  --&gt; return false
            at here<br>
            &gt;&gt;<br>
            &gt;&gt; In Child:<br>
            &gt;&gt;   move_pages()<br>
            &gt;&gt;   ...<br>
            &gt;&gt;     do_move_pages<br>
            &gt;&gt;       do_move_pages_to_node<br>
            &gt;&gt;         add_page_for_migration<br>
            &gt;&gt;           isolate_huge_page   --&gt; it has already
            isolated the hugepage<br>
            &gt;&gt;<br>
            &gt;&gt; In this patch, I simply regard the returned EBUSY
            as a normal situation and<br>
            &gt;&gt; mask it in error handler. Because move_pages is
            calling add_page_for_migration<br>
            &gt;&gt; to isolate hugepage before do migration, so that's
            very possible to hit the<br>
            &gt;&gt; collision and return EBUSY on the same page.<br>
            &gt;&gt;<br>
            &gt;&gt; Error log:<br>
            &gt;&gt; ----------<br>
            &gt;&gt; move_pages12.c:235: INFO: Free RAM 8386256 kB<br>
            &gt;&gt; move_pages12.c:253: INFO: Increasing 2048kB
            hugepages pool on node 0 to 4<br>
            &gt;&gt; move_pages12.c:263: INFO: Increasing 2048kB
            hugepages pool on node 1 to 6<br>
            &gt;&gt; move_pages12.c:179: INFO: Allocating and freeing 4
            hugepages on node 0<br>
            &gt;&gt; move_pages12.c:179: INFO: Allocating and freeing 4
            hugepages on node 1<br>
            &gt;&gt; move_pages12.c:169: PASS: Bug not reproduced<br>
            &gt;&gt; move_pages12.c:81: FAIL: madvise failed: SUCCESS<br>
            &gt;&gt; move_pages12.c:81: FAIL: madvise failed: SUCCESS<br>
            &gt;&gt; move_pages12.c:143: BROK:
            mmap((nil),4194304,3,262178,-1,0) failed: ENOMEM<br>
            &gt;&gt; move_pages12.c:114: FAIL: move_pages failed: EINVAL<br>
            &gt;&gt;<br>
            &gt;&gt; Dmesg:<br>
            &gt;&gt; ------<br>
            &gt;&gt; [165435.492170] soft offline: 0x61c00 hugepage
            failed to isolate<br>
            &gt;&gt; [165435.590252] soft offline: 0x61c00 hugepage
            failed to isolate<br>
            &gt;&gt; [165435.725493] soft offline: 0x61400 hugepage
            failed to isolate<br>
            &gt;&gt;<br>
            &gt;&gt; Other two fixes in this patch:<br>
            &gt;&gt;  * use TERRNO(but not TTERRNO) to catch
            madvise(..., MADV_SOFT_OFFLINE) errno<br>
            &gt;&gt;  * go out test when hugepage allocating failed with
            ENOMEM<br>
            Hi Li<br>
            <br>
            Your patch can handle EBUSY errno correctly for soft
            offline. <br>
            But move page  may be killed by SIGBUS because of  MCE  when
            we soft offline concurrently.  <br>
            That leads to move_page failed with ESRCH.   Also, move page
            may fails with ENOMEM .<br>
            Do you notice it ?<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size: small;">I
              didn't get this failure, it seems not related to this
              patch. Two questions:</div>
            <div class="gmail_default" style="font-size: small;"><br>
            </div>
            <div class="gmail_default" style="font-size: small;">1.
              which kernel version do you test?</div>
            <div class="gmail_default" style="font-size: small;">2. can
              you reproduce this without my patch?</div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Li<br>
    <br>
    I test it on 3.10.0-957.el7.x86_64  kvm(my machine was not support
    numa and i enable it on kvm. as below: <br>
     &lt;cpu mode='custom' match='exact' check='full'&gt;<br>
        &lt;model fallback='forbid'&gt;Penryn&lt;/model&gt;<br>
        &lt;feature policy='require' name='x2apic'/&gt;<br>
        &lt;feature policy='require' name='hypervisor'/&gt;<br>
        &lt;numa&gt;<br>
          &lt;cell id='0' cpus='0' memory='1048576' unit='KiB'/&gt;<br>
          &lt;cell id='1' cpus='1' memory='1048576' unit='KiB'/&gt;<br>
        &lt;/numa&gt;<br>
      &lt;/cpu&gt;<br>
    <br>
    Does it only exist on kvm and doesn't  exist on physical machine?  I
    don't have physical machine that supports numa.<br>
    <br>
    And the fix patch has been merged since  3.10.0-957.el7.x86_64 .<br>
    Yes,   I can reproduce this without your patch because MCE kills
    child process and move_page gets ESRCH error.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            <br>
            I think ESRCH error can represent the soft offline bug not
            reproduce because it don't trigger a crash.<br>
            What do you think about it?<br>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default" style="font-size: small;">Maybe,
            but it needs to check details on your kernel.</div>
          <blockquote class="gmail_quote" style="margin: 0px 0px 0px
            0.8ex; border-left: 1px solid rgb(204, 204, 204);
            padding-left: 1ex;">
            <br>
            err_log:<br>
            tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s<br>
            move_pages12.c:236: INFO: Free RAM 119568 kB<br>
            move_pages12.c:254: INFO: Increasing 2048kB hugepages pool
            on node 0 to 83<br>
            move_pages12.c:264: INFO: Increasing 2048kB hugepages pool
            on node 1 to 94<br>
            move_pages12.c:180: INFO: Allocating and freeing 4 hugepages
            on node 0<br>
            move_pages12.c:180: INFO: Allocating and freeing 4 hugepages
            on node 1<br>
            move_pages12.c:170: PASS: Bug not reproduced<br>
            tst_test.c:1141: BROK: Test killed by SIGBUS!<br>
            <br>
            Summary:<br>
            passed   1<br>
            failed   0<br>
            skipped  0<br>
            warnings 0<br>
            <br>
            move_pages12.c:114: FAIL: move_pages failed: ESRCH<br>
            <br>
            dmesg<br>
            [ 9868.180669] MCE: Killing move_pages12:29616 due to
            hardware memory corruption fault at 2aaaaac00018<br>
            [ 9990.049875] Soft offlining page 50e00 at 2aaaaac00000<br>
            [ 9990.052218] Soft offlining page 50c00 at 2aaaaae00000<br>
            [ 9990.060395] Soft offlining page 51000 at 2aaaaac00000<br>
            <br>
            Kind Regards,<br>
            Yang Xu<br>
            <br>
            &gt;&gt; Signed-off-by: Li Wang &lt;<a
              moz-do-not-send="true" href="mailto:liwang@redhat.com"
              target="_blank">liwang@redhat.com</a>&gt;<br>
            &gt;&gt; Cc: Naoya Horiguchi &lt;<a moz-do-not-send="true"
              href="mailto:n-horiguchi@ah.jp.nec.com" target="_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
            &gt;&gt; Cc: Xiao Yang &lt;<a moz-do-not-send="true"
              href="mailto:yangx.jy@cn.fujitsu.com" target="_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
            &gt;&gt; Cc: Yang Xu &lt;<a moz-do-not-send="true"
              href="mailto:xuyang2018.jy@cn.fujitsu.com" target="_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;  .../kernel/syscalls/move_pages/move_pages12.c | 33
            ++++++++++++++-----<br>
            &gt;&gt;  1 file changed, 24 insertions(+), 9 deletions(-)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git
            a/testcases/kernel/syscalls/move_pages/move_pages12.c
            b/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
            &gt;&gt; index 964b712fb..c446396dc 100644<br>
            &gt;&gt; ---
            a/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
            &gt;&gt; +++
            b/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
            &gt;&gt; @@ -77,8 +77,8 @@ static void *addr;<br>
            &gt;&gt;  static int do_soft_offline(int tpgs)<br>
            &gt;&gt;  {<br>
            &gt;&gt;      if (madvise(addr, tpgs * hpsz,
            MADV_SOFT_OFFLINE) == -1) {<br>
            &gt;&gt; -            if (errno != EINVAL)<br>
            &gt;&gt; -                    tst_res(TFAIL | TTERRNO,
            "madvise failed");<br>
            &gt;&gt; +            if (errno != EINVAL &amp;&amp; errno
            != EBUSY)<br>
            &gt;&gt; +                    tst_res(TFAIL | TERRNO,
            "madvise failed");<br>
            &gt;&gt;              return errno;<br>
            &gt;&gt;      }<br>
            &gt;&gt;      return 0;<br>
            &gt;&gt; @@ -121,7 +121,8 @@ static void do_child(int tpgs)<br>
            &gt;&gt;  <br>
            &gt;&gt;  static void do_test(unsigned int n)<br>
            &gt;&gt;  {<br>
            &gt;&gt; -    int i;<br>
            &gt;&gt; +    int i, ret;<br>
            &gt;&gt; +    void *ptr;<br>
            &gt;&gt;      pid_t cpid = -1;<br>
            &gt;&gt;      int status;<br>
            &gt;&gt;      unsigned int twenty_percent =
            (tst_timeout_remaining() / 5);<br>
            &gt;&gt; @@ -136,24 +137,37 @@ static void do_test(unsigned
            int n)<br>
            &gt;&gt;              do_child(tcases[n].tpages);<br>
            &gt;&gt;  <br>
            &gt;&gt;      for (i = 0; i &lt; LOOPS; i++) {<br>
            &gt;&gt; -            void *ptr;<br>
            &gt;&gt; +            ptr = mmap(NULL, tcases[n].tpages *
            hpsz,<br>
            &gt;&gt; +                            PROT_READ |
            PROT_WRITE,<br>
            &gt;&gt; +                            MAP_PRIVATE |
            MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);<br>
            &gt;&gt; +            if (ptr == MAP_FAILED) {<br>
            &gt;&gt; +                    if (errno == ENOMEM) {<br>
            &gt;&gt; +                            tst_res(TCONF,<br>
            &gt;&gt; +                                    "Cannot
            allocate hugepage, memory too fragmented?");<br>
            &gt;&gt; +                            goto out;<br>
            &gt;&gt; +                    }<br>
            &gt;&gt; +<br>
            &gt;&gt; +                    tst_brk(TBROK | TERRNO,
            "Cannot allocate hugepage");<br>
            &gt;&gt; +            }<br>
            &gt;&gt;  <br>
            &gt;&gt; -            ptr = SAFE_MMAP(NULL, tcases[n].tpages
            * hpsz,<br>
            &gt;&gt; -                    PROT_READ | PROT_WRITE,<br>
            &gt;&gt; -                    MAP_PRIVATE | MAP_ANONYMOUS |
            MAP_HUGETLB, -1, 0);<br>
            &gt;&gt;              if (ptr != addr)<br>
            &gt;&gt;                      tst_brk(TBROK, "Failed to mmap
            at desired addr");<br>
            &gt;&gt;  <br>
            &gt;&gt;              memset(addr, 0, tcases[n].tpages *
            hpsz);<br>
            &gt;&gt;  <br>
            &gt;&gt;              if (tcases[n].offline) {<br>
            &gt;&gt; -                    if
            (do_soft_offline(tcases[n].tpages) == EINVAL) {<br>
            &gt;&gt; +                    ret =
            do_soft_offline(tcases[n].tpages);<br>
            &gt;&gt; +<br>
            &gt;&gt; +                    if (ret == EINVAL) {<br>
            &gt;&gt;                              SAFE_KILL(cpid,
            SIGKILL);<br>
            &gt;&gt;                              SAFE_WAITPID(cpid,
            &amp;status, 0);<br>
            &gt;&gt;                              SAFE_MUNMAP(addr,
            tcases[n].tpages * hpsz);<br>
            &gt;&gt;                              tst_res(TCONF,<br>
            &gt;&gt;                                      "madvise()
            didn't support MADV_SOFT_OFFLINE");<br>
            &gt;&gt;                              return;<br>
            &gt;&gt; +                    } else if (ret == EBUSY) {<br>
            &gt;&gt; +                            SAFE_MUNMAP(addr,
            tcases[n].tpages * hpsz);<br>
            &gt;&gt; +                            goto out;<br>
            &gt;&gt;                      }<br>
            &gt;&gt;              }<br>
            &gt;&gt;  <br>
            &gt;&gt; @@ -163,9 +177,10 @@ static void do_test(unsigned
            int n)<br>
            &gt;&gt;                      break;<br>
            &gt;&gt;      }<br>
            &gt;&gt;  <br>
            &gt;&gt; +out:<br>
            &gt;&gt;      SAFE_KILL(cpid, SIGKILL);<br>
            &gt;&gt;      SAFE_WAITPID(cpid, &amp;status, 0);<br>
            &gt;&gt; -    if (!WIFEXITED(status))<br>
            &gt;&gt; +    if (!WIFEXITED(status) &amp;&amp; ptr !=
            MAP_FAILED)<br>
            &gt;&gt;              tst_res(TPASS, "Bug not reproduced");<br>
            &gt;&gt;  }<br>
            &gt;&gt;  <br>
            &gt;&gt; -- <br>
            &gt;&gt; 2.20.1<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;<br>
            &gt; .<br>
            &gt;<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020202060705080100030801--

--===============0681909365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0681909365==--
