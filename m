Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA74FF80
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 04:44:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98AAA3C1914
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 04:44:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C8DEC3C1832
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 04:44:07 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 064F11400765
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 04:44:04 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id v24so10962987ljg.13
 for <ltp@lists.linux.it>; Sun, 23 Jun 2019 19:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkgY0fJWE3lKhuNhaNFmuWx5GYZF8grbOrCQldjFiyo=;
 b=QcEp8tt0g6QHeo9i/Ua6qJ2ctty1+3pMtEWcIW0XJEvuusMlJFP0k2BGw4WgXj/JQ3
 blZhhJtW9eJzbOELG9fSXfde490EXSjXtXU54qcTPrq/1OFrtbxMAAX80UTEnOCyoENL
 hqh+d/m2xwavm7gEPRnyIQkETP4dhNPlXSvDKaG9Hr6/kpvz6PWYwyc6e2huYH5SXayo
 Pb3Jbzvj5+GA1TnndWgYGtqyE0yTpXMWw4pkw/GL7qxPH4wbWBIbALTX8vsjsD9AM588
 nzrvF1UVTOV+8VrRuCXXxsGYWrU7VqkkPJrhM3v0F22sPyJUoXPXs2uuuUcT9ND9hUKv
 pywg==
X-Gm-Message-State: APjAAAVvOSIRKGKE/dZD7d8JH14y+G6jY3/Il/qCQ0EFoXECndZErTMP
 nS5g6Ec9Y9AYaaNV7SYSctQ7u6YDmDIwtbxBFj15/Q==
X-Google-Smtp-Source: APXvYqwSexIEsO9OHEpuk97ipjJSrFibyh2SFWYIkGodl2kCkMLjhntawLAskYax2Nyh7tcT9iWmhhBeOVAOyAFYb2E=
X-Received: by 2002:a2e:551d:: with SMTP id j29mr71171286ljb.213.1561344244342; 
 Sun, 23 Jun 2019 19:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190610032754.GA7114@hori.linux.bs1.fc.nec.co.jp>
 <5D0C7204.9020704@cn.fujitsu.com>
In-Reply-To: <5D0C7204.9020704@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 24 Jun 2019 10:43:52 +0800
Message-ID: <CAEemH2c+CWAOmAH=1WT+GR-iZ=5RoDcCmD=-zBpc63PHg6xXyQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
	madvise(..., MADV_SOFT_OFFLINE)
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1996666652=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1996666652==
Content-Type: multipart/alternative; boundary="0000000000000e7c46058c08c913"

--0000000000000e7c46058c08c913
Content-Type: text/plain; charset="UTF-8"

Hi Xu Yang,

On Fri, Jun 21, 2019 at 1:58 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

>
> > Hi Li Wang,
> >
> > Thank you for maintaining the testcase.
> >
> > Recently (since 4.19) we have a semantics change on the return value of
> > madvise(MADV_SOFT_OFFLINE), and we see -EBUSY when hugepage migration
> > succeeded and error containment failed:
> >
> >   commit 6bc9b56433b76e40d11099338d27fbc5cd2935ca
> >   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> >   Date:   Thu Aug 23 17:00:38 2018 -0700
> >
> >       mm: fix race on soft-offlining free huge pages
> >
> > , so we don't have to consider this EBUSY as error, but a good report
> > for application. Your change meets the change.
> >
> > Feel free to add my ack:
> >
> > Acked-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> >
> > Thanks,
> > - Naoya
> >
> > On Fri, Jun 07, 2019 at 05:52:13PM +0800, Li Wang wrote:
> >> The test#2 is going to simulate the race condition, where move_pages()
> >> and soft offline are called on a single hugetlb page concurrently. But,
> >> it return EBUSY and report FAIL in soft-offline a moving hugepage as a
> >> result sometimes.
> >>
> >> The root cause seems a call to page_huge_active return false, then the
> >> soft offline action will failed to isolate hugepage with EBUSY return as
> >> below call trace:
> >>
> >> In Parent:
> >>   madvise(..., MADV_SOFT_OFFLINE)
> >>   ...
> >>     soft_offline_page
> >>       soft_offline_in_use_page
> >>         soft_offline_huge_page
> >>           isolate_huge_page
> >>             page_huge_active  --> return false at here
> >>
> >> In Child:
> >>   move_pages()
> >>   ...
> >>     do_move_pages
> >>       do_move_pages_to_node
> >>         add_page_for_migration
> >>           isolate_huge_page   --> it has already isolated the hugepage
> >>
> >> In this patch, I simply regard the returned EBUSY as a normal situation
> and
> >> mask it in error handler. Because move_pages is calling
> add_page_for_migration
> >> to isolate hugepage before do migration, so that's very possible to hit
> the
> >> collision and return EBUSY on the same page.
> >>
> >> Error log:
> >> ----------
> >> move_pages12.c:235: INFO: Free RAM 8386256 kB
> >> move_pages12.c:253: INFO: Increasing 2048kB hugepages pool on node 0 to
> 4
> >> move_pages12.c:263: INFO: Increasing 2048kB hugepages pool on node 1 to
> 6
> >> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 0
> >> move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 1
> >> move_pages12.c:169: PASS: Bug not reproduced
> >> move_pages12.c:81: FAIL: madvise failed: SUCCESS
> >> move_pages12.c:81: FAIL: madvise failed: SUCCESS
> >> move_pages12.c:143: BROK: mmap((nil),4194304,3,262178,-1,0) failed:
> ENOMEM
> >> move_pages12.c:114: FAIL: move_pages failed: EINVAL
> >>
> >> Dmesg:
> >> ------
> >> [165435.492170] soft offline: 0x61c00 hugepage failed to isolate
> >> [165435.590252] soft offline: 0x61c00 hugepage failed to isolate
> >> [165435.725493] soft offline: 0x61400 hugepage failed to isolate
> >>
> >> Other two fixes in this patch:
> >>  * use TERRNO(but not TTERRNO) to catch madvise(..., MADV_SOFT_OFFLINE)
> errno
> >>  * go out test when hugepage allocating failed with ENOMEM
> Hi Li
>
> Your patch can handle EBUSY errno correctly for soft offline.
> But move page  may be killed by SIGBUS because of  MCE  when we soft
> offline concurrently.
> That leads to move_page failed with ESRCH.   Also, move page may fails
> with ENOMEM .
> Do you notice it ?
>

I didn't get this failure, it seems not related to this patch. Two
questions:

1. which kernel version do you test?
2. can you reproduce this without my patch?



>
> I think ESRCH error can represent the soft offline bug not reproduce
> because it don't trigger a crash.
> What do you think about it?
>

Maybe, but it needs to check details on your kernel.

>
> err_log:
> tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s
> move_pages12.c:236: INFO: Free RAM 119568 kB
> move_pages12.c:254: INFO: Increasing 2048kB hugepages pool on node 0 to 83
> move_pages12.c:264: INFO: Increasing 2048kB hugepages pool on node 1 to 94
> move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 0
> move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 1
> move_pages12.c:170: PASS: Bug not reproduced
> tst_test.c:1141: BROK: Test killed by SIGBUS!
>
> Summary:
> passed   1
> failed   0
> skipped  0
> warnings 0
>
> move_pages12.c:114: FAIL: move_pages failed: ESRCH
>
> dmesg
> [ 9868.180669] MCE: Killing move_pages12:29616 due to hardware memory
> corruption fault at 2aaaaac00018
> [ 9990.049875] Soft offlining page 50e00 at 2aaaaac00000
> [ 9990.052218] Soft offlining page 50c00 at 2aaaaae00000
> [ 9990.060395] Soft offlining page 51000 at 2aaaaac00000
>
> Kind Regards,
> Yang Xu
>
> >> Signed-off-by: Li Wang <liwang@redhat.com>
> >> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> >> Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
> >> Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> >> ---
> >>  .../kernel/syscalls/move_pages/move_pages12.c | 33 ++++++++++++++-----
> >>  1 file changed, 24 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c
> b/testcases/kernel/syscalls/move_pages/move_pages12.c
> >> index 964b712fb..c446396dc 100644
> >> --- a/testcases/kernel/syscalls/move_pages/move_pages12.c
> >> +++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
> >> @@ -77,8 +77,8 @@ static void *addr;
> >>  static int do_soft_offline(int tpgs)
> >>  {
> >>      if (madvise(addr, tpgs * hpsz, MADV_SOFT_OFFLINE) == -1) {
> >> -            if (errno != EINVAL)
> >> -                    tst_res(TFAIL | TTERRNO, "madvise failed");
> >> +            if (errno != EINVAL && errno != EBUSY)
> >> +                    tst_res(TFAIL | TERRNO, "madvise failed");
> >>              return errno;
> >>      }
> >>      return 0;
> >> @@ -121,7 +121,8 @@ static void do_child(int tpgs)
> >>
> >>  static void do_test(unsigned int n)
> >>  {
> >> -    int i;
> >> +    int i, ret;
> >> +    void *ptr;
> >>      pid_t cpid = -1;
> >>      int status;
> >>      unsigned int twenty_percent = (tst_timeout_remaining() / 5);
> >> @@ -136,24 +137,37 @@ static void do_test(unsigned int n)
> >>              do_child(tcases[n].tpages);
> >>
> >>      for (i = 0; i < LOOPS; i++) {
> >> -            void *ptr;
> >> +            ptr = mmap(NULL, tcases[n].tpages * hpsz,
> >> +                            PROT_READ | PROT_WRITE,
> >> +                            MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
> -1, 0);
> >> +            if (ptr == MAP_FAILED) {
> >> +                    if (errno == ENOMEM) {
> >> +                            tst_res(TCONF,
> >> +                                    "Cannot allocate hugepage, memory
> too fragmented?");
> >> +                            goto out;
> >> +                    }
> >> +
> >> +                    tst_brk(TBROK | TERRNO, "Cannot allocate
> hugepage");
> >> +            }
> >>
> >> -            ptr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz,
> >> -                    PROT_READ | PROT_WRITE,
> >> -                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
> >>              if (ptr != addr)
> >>                      tst_brk(TBROK, "Failed to mmap at desired addr");
> >>
> >>              memset(addr, 0, tcases[n].tpages * hpsz);
> >>
> >>              if (tcases[n].offline) {
> >> -                    if (do_soft_offline(tcases[n].tpages) == EINVAL) {
> >> +                    ret = do_soft_offline(tcases[n].tpages);
> >> +
> >> +                    if (ret == EINVAL) {
> >>                              SAFE_KILL(cpid, SIGKILL);
> >>                              SAFE_WAITPID(cpid, &status, 0);
> >>                              SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> >>                              tst_res(TCONF,
> >>                                      "madvise() didn't support
> MADV_SOFT_OFFLINE");
> >>                              return;
> >> +                    } else if (ret == EBUSY) {
> >> +                            SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
> >> +                            goto out;
> >>                      }
> >>              }
> >>
> >> @@ -163,9 +177,10 @@ static void do_test(unsigned int n)
> >>                      break;
> >>      }
> >>
> >> +out:
> >>      SAFE_KILL(cpid, SIGKILL);
> >>      SAFE_WAITPID(cpid, &status, 0);
> >> -    if (!WIFEXITED(status))
> >> +    if (!WIFEXITED(status) && ptr != MAP_FAILED)
> >>              tst_res(TPASS, "Bug not reproduced");
> >>  }
> >>
> >> --
> >> 2.20.1
> >>
> >>
> >
> > .
> >
>
>
>
>

-- 
Regards,
Li Wang

--0000000000000e7c46058c08c913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu Yang,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jun 21, 2019 at 1:58 PM Yang Xu &lt;=
<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
&gt; Hi Li Wang,<br>
&gt;<br>
&gt; Thank you for maintaining the testcase.<br>
&gt;<br>
&gt; Recently (since 4.19) we have a semantics change on the return value o=
f<br>
&gt; madvise(MADV_SOFT_OFFLINE), and we see -EBUSY when hugepage migration<=
br>
&gt; succeeded and error containment failed:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0commit 6bc9b56433b76e40d11099338d27fbc5cd2935ca<br>
&gt;=C2=A0 =C2=A0Author: Naoya Horiguchi &lt;<a href=3D"mailto:n-horiguchi@=
ah.jp.nec.com" target=3D"_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Thu Aug 23 17:00:38 2018 -0700<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mm: fix race on soft-offlining free huge pag=
es<br>
&gt;<br>
&gt; , so we don&#39;t have to consider this EBUSY as error, but a good rep=
ort<br>
&gt; for application. Your change meets the change.<br>
&gt;<br>
&gt; Feel free to add my ack:<br>
&gt;<br>
&gt; Acked-by: Naoya Horiguchi &lt;<a href=3D"mailto:n-horiguchi@ah.jp.nec.=
com" target=3D"_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; - Naoya<br>
&gt;<br>
&gt; On Fri, Jun 07, 2019 at 05:52:13PM +0800, Li Wang wrote:<br>
&gt;&gt; The test#2 is going to simulate the race condition, where move_pag=
es()<br>
&gt;&gt; and soft offline are called on a single hugetlb page concurrently.=
 But,<br>
&gt;&gt; it return EBUSY and report FAIL in soft-offline a moving hugepage =
as a<br>
&gt;&gt; result sometimes.<br>
&gt;&gt;<br>
&gt;&gt; The root cause seems a call to page_huge_active return false, then=
 the<br>
&gt;&gt; soft offline action will failed to isolate hugepage with EBUSY ret=
urn as<br>
&gt;&gt; below call trace:<br>
&gt;&gt;<br>
&gt;&gt; In Parent:<br>
&gt;&gt;=C2=A0 =C2=A0madvise(..., MADV_SOFT_OFFLINE)<br>
&gt;&gt;=C2=A0 =C2=A0...<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0soft_offline_page<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0soft_offline_in_use_page<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soft_offline_huge_page<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isolate_huge_page<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_huge_active=C2=
=A0 --&gt; return false at here<br>
&gt;&gt;<br>
&gt;&gt; In Child:<br>
&gt;&gt;=C2=A0 =C2=A0move_pages()<br>
&gt;&gt;=C2=A0 =C2=A0...<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0do_move_pages<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_move_pages_to_node<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_page_for_migration<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isolate_huge_page=C2=A0 =
=C2=A0--&gt; it has already isolated the hugepage<br>
&gt;&gt;<br>
&gt;&gt; In this patch, I simply regard the returned EBUSY as a normal situ=
ation and<br>
&gt;&gt; mask it in error handler. Because move_pages is calling add_page_f=
or_migration<br>
&gt;&gt; to isolate hugepage before do migration, so that&#39;s very possib=
le to hit the<br>
&gt;&gt; collision and return EBUSY on the same page.<br>
&gt;&gt;<br>
&gt;&gt; Error log:<br>
&gt;&gt; ----------<br>
&gt;&gt; move_pages12.c:235: INFO: Free RAM 8386256 kB<br>
&gt;&gt; move_pages12.c:253: INFO: Increasing 2048kB hugepages pool on node=
 0 to 4<br>
&gt;&gt; move_pages12.c:263: INFO: Increasing 2048kB hugepages pool on node=
 1 to 6<br>
&gt;&gt; move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on no=
de 0<br>
&gt;&gt; move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on no=
de 1<br>
&gt;&gt; move_pages12.c:169: PASS: Bug not reproduced<br>
&gt;&gt; move_pages12.c:81: FAIL: madvise failed: SUCCESS<br>
&gt;&gt; move_pages12.c:81: FAIL: madvise failed: SUCCESS<br>
&gt;&gt; move_pages12.c:143: BROK: mmap((nil),4194304,3,262178,-1,0) failed=
: ENOMEM<br>
&gt;&gt; move_pages12.c:114: FAIL: move_pages failed: EINVAL<br>
&gt;&gt;<br>
&gt;&gt; Dmesg:<br>
&gt;&gt; ------<br>
&gt;&gt; [165435.492170] soft offline: 0x61c00 hugepage failed to isolate<b=
r>
&gt;&gt; [165435.590252] soft offline: 0x61c00 hugepage failed to isolate<b=
r>
&gt;&gt; [165435.725493] soft offline: 0x61400 hugepage failed to isolate<b=
r>
&gt;&gt;<br>
&gt;&gt; Other two fixes in this patch:<br>
&gt;&gt;=C2=A0 * use TERRNO(but not TTERRNO) to catch madvise(..., MADV_SOF=
T_OFFLINE) errno<br>
&gt;&gt;=C2=A0 * go out test when hugepage allocating failed with ENOMEM<br=
>
Hi Li<br>
<br>
Your patch can handle EBUSY errno correctly for soft offline. <br>
But move page=C2=A0 may be killed by SIGBUS because of=C2=A0 MCE=C2=A0 when=
 we soft offline concurrently.=C2=A0 <br>
That leads to move_page failed with ESRCH.=C2=A0 =C2=A0Also, move page may =
fails with ENOMEM .<br>
Do you notice it ?<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">I didn&#39;t get this failure, it seems =
not related to this patch. Two questions:</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">1. which kernel version do you test?</div><div class=3D"gm=
ail_default" style=3D"font-size:small">2. can you reproduce this without my=
 patch?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
I think ESRCH error can represent the soft offline bug not reproduce becaus=
e it don&#39;t trigger a crash.<br>
What do you think about it?<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Maybe, but it needs to check details=
 on your kernel.</div><div class=3D"gmail_default" style=3D"font-size:small=
"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
err_log:<br>
tst_test.c:1096: INFO: Timeout per run is 0h 05m 00s<br>
move_pages12.c:236: INFO: Free RAM 119568 kB<br>
move_pages12.c:254: INFO: Increasing 2048kB hugepages pool on node 0 to 83<=
br>
move_pages12.c:264: INFO: Increasing 2048kB hugepages pool on node 1 to 94<=
br>
move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 0<br>
move_pages12.c:180: INFO: Allocating and freeing 4 hugepages on node 1<br>
move_pages12.c:170: PASS: Bug not reproduced<br>
tst_test.c:1141: BROK: Test killed by SIGBUS!<br>
<br>
Summary:<br>
passed=C2=A0 =C2=A01<br>
failed=C2=A0 =C2=A00<br>
skipped=C2=A0 0<br>
warnings 0<br>
<br>
move_pages12.c:114: FAIL: move_pages failed: ESRCH<br>
<br>
dmesg<br>
[ 9868.180669] MCE: Killing move_pages12:29616 due to hardware memory corru=
ption fault at 2aaaaac00018<br>
[ 9990.049875] Soft offlining page 50e00 at 2aaaaac00000<br>
[ 9990.052218] Soft offlining page 50c00 at 2aaaaae00000<br>
[ 9990.060395] Soft offlining page 51000 at 2aaaaac00000<br>
<br>
Kind Regards,<br>
Yang Xu<br>
<br>
&gt;&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" ta=
rget=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt;&gt; Cc: Naoya Horiguchi &lt;<a href=3D"mailto:n-horiguchi@ah.jp.nec.co=
m" target=3D"_blank">n-horiguchi@ah.jp.nec.com</a>&gt;<br>
&gt;&gt; Cc: Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" targe=
t=3D"_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
&gt;&gt; Cc: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" ta=
rget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../kernel/syscalls/move_pages/move_pages12.c | 33 +++++++++=
+++++-----<br>
&gt;&gt;=C2=A0 1 file changed, 24 insertions(+), 9 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b=
/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
&gt;&gt; index 964b712fb..c446396dc 100644<br>
&gt;&gt; --- a/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
&gt;&gt; +++ b/testcases/kernel/syscalls/move_pages/move_pages12.c<br>
&gt;&gt; @@ -77,8 +77,8 @@ static void *addr;<br>
&gt;&gt;=C2=A0 static int do_soft_offline(int tpgs)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (madvise(addr, tpgs * hpsz, MADV_SOFT_OFFLI=
NE) =3D=3D -1) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EINVAL)<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tst_res(TFAIL | TTERRNO, &quot;madvise failed&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EINVAL &=
amp;&amp; errno !=3D EBUSY)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tst_res(TFAIL | TERRNO, &quot;madvise failed&quot;);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errno;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; @@ -121,7 +121,8 @@ static void do_child(int tpgs)<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 static void do_test(unsigned int n)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int i;<br>
&gt;&gt; +=C2=A0 =C2=A0 int i, ret;<br>
&gt;&gt; +=C2=A0 =C2=A0 void *ptr;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 pid_t cpid =3D -1;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int status;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int twenty_percent =3D (tst_timeout_r=
emaining() / 5);<br>
&gt;&gt; @@ -136,24 +137,37 @@ static void do_test(unsigned int n)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_child(tcases[n]=
.tpages);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; LOOPS; i++) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D mmap(NULL, tcas=
es[n].tpages * hpsz,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT_READ | PROT_WRITE,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETL=
B, -1, 0);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ptr =3D=3D MAP_FAIL=
ED) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (errno =3D=3D ENOMEM) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Cannot=
 allocate hugepage, memory too fragmented?&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tst_brk(TBROK | TERRNO, &quot;Cannot allocate hugepage&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D SAFE_MMAP(NULL,=
 tcases[n].tpages * hpsz,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PROT_READ | PROT_WRITE,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ptr !=3D addr)=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_brk(TBROK, &quot;Failed to mmap at desired addr&quot;);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(addr, 0, tc=
ases[n].tpages * hpsz);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcases[n].offl=
ine) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (do_soft_offline(tcases[n].tpages) =3D=3D EINVAL) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret =3D do_soft_offline(tcases[n].tpages);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (ret =3D=3D EINVAL) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_KILL(cpid, SIGKILL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_WAITPID(cpid, &amp;status, 0);<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MUNMAP(addr, tcases[n].tpages *=
 hpsz);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ma=
dvise() didn&#39;t support MADV_SOFT_OFFLINE&quot;);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else if (ret =3D=3D EBUSY) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MUNMAP(addr, tcases[n].tpages * hps=
z);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; @@ -163,9 +177,10 @@ static void do_test(unsigned int n)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +out:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 SAFE_KILL(cpid, SIGKILL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 SAFE_WAITPID(cpid, &amp;status, 0);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (!WIFEXITED(status))<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!WIFEXITED(status) &amp;&amp; ptr !=3D MAP_FAIL=
ED)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &qu=
ot;Bug not reproduced&quot;);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000000e7c46058c08c913--

--===============1996666652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1996666652==--
