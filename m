Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FB7845F
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 07:17:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E555E3C1D1B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 07:17:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2A9A53C1C8A
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 07:17:39 +0200 (CEST)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EC15E200C84
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 07:17:38 +0200 (CEST)
Received: by mail-vk1-f196.google.com with SMTP id s16so11722242vke.7
 for <ltp@lists.linux.it>; Sun, 28 Jul 2019 22:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fcCv9MHNIF4hI0relbpOiFS7M9UJhROw7Nzfv6sRNyY=;
 b=gSCJ+2cmGM2GgpFBXscrJHqQg6wjCOwkUSce25p42iBkcnulhK0WY8TYcgxwC0Pi9e
 uu5wIPUE2SSN9bQrLCVZXjL8wK2wSlh5D2NzzFkDgvh/BZcELsyg5VVQLjGF39mGNvlG
 BwpFBGaOvkY2jy32e5VVTn7NTHxGJ++qxujpmnwXwaO7hVvPYK02tG6of0Pczy4P4EdR
 P9PZaEaTWfFEaIhyZrbw5IFYtD75/wu6h3sV7voy/zc1mSywo6LU8tqu6Pyc29r8gjvR
 rI5RSSDIv1mOTW3prsbC/8Cm+ZgM7OjRCIh/QTcvdWT96Kof0oYDpa+uSS8V7pIGdVY6
 GuYA==
X-Gm-Message-State: APjAAAVcRpb2Ol5N1DQ/cZ5mJddqxcBKdtd4OFNB1sRKMb9hgJIInItE
 CuL4ZPHe5KwPW9/ANl6xq62TO+4wIizhlOGrLQwWZA==
X-Google-Smtp-Source: APXvYqx2I1JxcgzwrYX7T6dYEg9Pz76lPdDf0MccfC7TFcONppQXR3mBKv1aYlv2uDv5cXvBFit+fGSpSlBAImdVNRQ=
X-Received: by 2002:a1f:2117:: with SMTP id h23mr4058435vkh.91.1564377457785; 
 Sun, 28 Jul 2019 22:17:37 -0700 (PDT)
MIME-Version: 1.0
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Jul 2019 13:17:27 +0800
Message-ID: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
	=?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2Zm?=
	=?utf-8?q?lined_hugepage_in_background?=
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
Cc: xishi.qiuxishi@alibaba-inc.com, mhocko@kernel.org,
 Linux-MM <linux-mm@kvack.org>, LTP List <ltp@lists.linux.it>,
 mike.kravetz@oracle.com
Content-Type: multipart/mixed; boundary="===============0070651855=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0070651855==
Content-Type: multipart/alternative; boundary="000000000000aa9fe5058ecb0227"

--000000000000aa9fe5058ecb0227
Content-Type: text/plain; charset="UTF-8"

Hi Naoya and Linux-MMers,

The LTP/move_page12 V2 triggers SIGBUS in the kernel-v5.2.3 testing.
https://github.com/wangli5665/ltp/blob/master/testcases/kernel/syscalls/move_pages/move_pages12.c

It seems like the retry mmap() triggers SIGBUS while doing the
numa_move_pages()
in background. That is very similar to the kernel bug which was mentioned
by commit 6bc9b56433b76e40d(mm: fix race on soft-offlining ): A race
condition between soft offline and hugetlb_fault which causes unexpected
process SIGBUS killing.

I'm not sure if that below patch is making sene to memory-failures.c, but after
building a new kernel-5.2.3 with this change, the problem can NOT be
reproduced.

Any comments?

----------------------------------
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1695,15 +1695,16 @@ static int soft_offline_huge_page(struct page
*page, int flags)
        unlock_page(hpage);

        ret = isolate_huge_page(hpage, &pagelist);
+       if (!ret) {
+               pr_info("soft offline: %#lx hugepage failed to isolate\n",
pfn);
+               return -EBUSY;
+       }
+
        /*
         * get_any_page() and isolate_huge_page() takes a refcount each,
         * so need to drop one here.
         */
        put_hwpoison_page(hpage);
-       if (!ret) {
-               pr_info("soft offline: %#lx hugepage failed to isolate\n",
pfn);
-               return -EBUSY;
-       }


----- test on kernel-v5.2.3 ------
# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:251: INFO: Free RAM 194212832 kB
move_pages12.c:269: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:279: INFO: Increasing 2048kB hugepages pool on node 1 to 6
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:185: PASS: Bug not reproduced
tst_test.c:1145: BROK: Test killed by SIGBUS!
move_pages12.c:114: FAIL: move_pages failed: ESRCH

----- test on kernel-v5.2.3  + above patch------
# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:252: INFO: Free RAM 64780164 kB
move_pages12.c:270: INFO: Increasing 2048kB hugepages pool on node 0 to 7
move_pages12.c:280: INFO: Increasing 2048kB hugepages pool on node 1 to 10
move_pages12.c:196: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:196: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:186: PASS: Bug not reproduced
move_pages12.c:186: PASS: Bug not reproduced
--
Regards,
Li Wang

--000000000000aa9fe5058ecb0227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi <span class=3D"gmail_default" style=3D"font-size:small"=
>Naoya and Linux-MMers,</span><br><br>The LTP/move_page12 V2 triggers SIGBU=
S in the kernel-v5.2.3 testing. <br><a href=3D"https://github.com/wangli566=
5/ltp/blob/master/testcases/kernel/syscalls/move_pages/move_pages12.c">http=
s://github.com/wangli5665/ltp/blob/master/testcases/kernel/syscalls/move_pa=
ges/move_pages12.c<br></a><br>It seems like=C2=A0<span class=3D"gmail_defau=
lt" style=3D"font-size:small">the</span> retry mmap() triggers SIGBUS while=
 doing the<span class=3D"gmail_default" style=3D"font-size:small"> </span>n=
uma_move_pages() in background. That is very similar to the kernel<span cla=
ss=3D"gmail_default"> </span>bug which was mentioned by commit 6bc9b56433b7=
6e40d(mm: fix race on<span class=3D"gmail_default"> </span>soft-offlining )=
<span class=3D"gmail_default" style=3D"font-size:small">:</span> A race con=
dition between soft offline and<span class=3D"gmail_default"> </span>hugetl=
b_fault which causes unexpected process SIGBUS killing.<div><br>I&#39;m not=
 sure if that below <span class=3D"gmail_default" style=3D"font-size:small"=
>patch </span>is making sene to memory-failures.c, but <span class=3D"gmail=
_default" style=3D"font-size:small">after </span>building a <span class=3D"=
gmail_default" style=3D"font-size:small">new </span>kernel-5.2.3 with <span=
 class=3D"gmail_default" style=3D"font-size:small">this change</span>, the =
problem <span class=3D"gmail_default" style=3D"font-size:small">can NOT be =
reproduced</span>.=C2=A0</div><div><br></div><div>Any comments?<br></div><d=
iv><br>----------------------------------<br>--- a/mm/memory-failure.c<br>+=
++ b/mm/memory-failure.c<br>@@ -1695,15 +1695,16 @@ static int soft_offline=
_huge_page(struct page *page, int flags)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 unl=
ock_page(hpage);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D isolate_huge_pa=
ge(hpage, &amp;pagelist);<br>+ =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info(&quot;soft offline: %#lx=
 hugepage failed to isolate\n&quot;, pfn);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;<br>+ =C2=A0 =C2=A0 =C2=A0 }<br>+<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* get_a=
ny_page() and isolate_huge_page() takes a refcount each,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* so need to drop one here.<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_hwpoison_page(hpage);<br>- =
=C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 pr_info(&quot;soft offline: %#lx hugepage failed to isolate\n=
&quot;, pfn);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
-EBUSY;<br>- =C2=A0 =C2=A0 =C2=A0 }<br><br><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">----- test on kernel-v5.2.3 ------</div># ./move_pages12<br>ts=
t_test.c:1100: INFO: Timeout per run is 0h 05m 00s<br>move_pages12.c:251: I=
NFO: Free RAM 194212832 kB<br>move_pages12.c:269: INFO: Increasing 2048kB h=
ugepages pool on node 0 to 4<br>move_pages12.c:279: INFO: Increasing 2048kB=
 hugepages pool on node 1 to 6<br>move_pages12.c:195: INFO: Allocating and =
freeing 4 hugepages on node 0<br>move_pages12.c:195: INFO: Allocating and f=
reeing 4 hugepages on node 1<br>move_pages12.c:185: PASS: Bug not reproduce=
d<br>tst_test.c:1145: BROK: Test killed by SIGBUS!<br>move_pages12.c:114: F=
AIL: move_pages failed: ESRCH<div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">----- test on kernel-v5.2.3=C2=A0 + above patc=
h------</div></div><div class=3D"gmail_default" style=3D"font-size:small">#=
 ./move_pages12=C2=A0</div>tst_test.c:1100: INFO: Timeout per run is 0h 05m=
 00s<br>move_pages12.c:252: INFO: Free RAM 64780164 kB<br>move_pages12.c:27=
0: INFO: Increasing 2048kB hugepages pool on node 0 to 7<br>move_pages12.c:=
280: INFO: Increasing 2048kB hugepages pool on node 1 to 10<br>move_pages12=
.c:196: INFO: Allocating and freeing 4 hugepages on node 0<br>move_pages12.=
c:196: INFO: Allocating and freeing 4 hugepages on node 1<br>move_pages12.c=
:186: PASS: Bug not reproduced<br>move_pages12.c:186: PASS: Bug not reprodu=
ced<br><div class=3D"gmail_default" style=3D"font-size:small"></div>--<br>R=
egards,<br>Li Wang</div></div>

--000000000000aa9fe5058ecb0227--

--===============0070651855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0070651855==--
