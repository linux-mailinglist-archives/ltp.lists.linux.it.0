Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F93239C5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 10:45:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04E8E3C5987
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 10:45:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4C8403C2656
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 10:44:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2F1D51401138
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 10:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614159896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=91EYJa+HhX34DFh4Tn9FTmEfZLTa+LvLC1bebwYvnqs=;
 b=b4uKXHDtTd0MtecepdG8tKlxHzDF5FQk1vY4U2keS+4hgLpTZMWzclBHUGiWcNkv7eQMe3
 wGpKO/jho2nnNuzdqRX2/wi36GDsTdTIGPLQ9YKXxmrtHtDCRwxGxMbrOlXqYfMgg9Zd90
 wI2FJBLQRkOlnqBkN6MGkkaNC/xel7Q=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-SJVXgg9gNaiGFB6K-fSsQQ-1; Wed, 24 Feb 2021 04:44:54 -0500
X-MC-Unique: SJVXgg9gNaiGFB6K-fSsQQ-1
Received: by mail-yb1-f198.google.com with SMTP id v126so1761497ybc.13
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 01:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=91EYJa+HhX34DFh4Tn9FTmEfZLTa+LvLC1bebwYvnqs=;
 b=gS5xNKVljjrxmm2Yu2mTbH0uilZHAJm5EKgfFHPq5oYLHjQbB7hgNYElwl4pac0D9L
 CJGFsZiB9QNTd9NA4q0f5gP8sJpppZmwosSNOb3NqDuK2kfQN85tn+eM5d3RARaOWAvP
 fN3YM9oU409NZ/2MSjRFiwrzvLwRr9b/6D/4LSzKii7yUq30xay6MFAXt5GMnbkAgaa7
 P5SxhhL1rP25gAfWwI8UY9V1htcv0gzOTk2a5KLU1TF+tuSSJw8tY4k2sKz2YlT+i/cE
 BmnpmnAHjEhL1BXDCNdVfIfX0/MuoiKfZUCSp+sNSe5Fj0o1JcNTY7xbWl683fC9Gove
 VDSQ==
X-Gm-Message-State: AOAM5325ADFVShonoT1CMUOHqwlcNV78eysVU4ph6vo0vKs+9s/fNQmX
 lb9eonDMSt+3IqbgCHmrm+2bIoTvCg0V53a2Zu+yn//cF0Ke23lUoqy+QSHSlEBVYGHoXkOe+3m
 f+uW34vY7vyjsLsPFaYPIKG0HWyo=
X-Received: by 2002:a25:af05:: with SMTP id a5mr597909ybh.86.1614159893429;
 Wed, 24 Feb 2021 01:44:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy39pdh/JempS2ohQ7OiT30xG6mr1zNvg7xoEhf23BpF0whsj3eC/YtzPXu+tZ2yty0VYEDzaNeTLPkpkrD5g=
X-Received: by 2002:a25:af05:: with SMTP id a5mr597895ybh.86.1614159893261;
 Wed, 24 Feb 2021 01:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20210224082500.18106-1-liwang@redhat.com>
In-Reply-To: <20210224082500.18106-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 24 Feb 2021 17:44:40 +0800
Message-ID: <CAEemH2cJfUnDz7ZF3X4=xACsEhHLk+ywgTD_F8eZP-VnNyS=wA@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] swapping01: check memory swap usage per process
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
Content-Type: multipart/mixed; boundary="===============0923401177=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0923401177==
Content-Type: multipart/alternative; boundary="0000000000000c86a405bc11e302"

--0000000000000c86a405bc11e302
Content-Type: text/plain; charset="UTF-8"

 Li Wang <liwang@redhat.com> wrote:

Issue:
>
> Currently test swapping01 read the system FreeSwap for counting usage of
> swap-size, that's not precise on system especially with eating-memory
> daemon
> in the background.
>
> Improvement:
>
> Considering that swap out unreferenced pages also could be occurred in a
> single process. So that we encapsulate all of the means in a single process
> to avoid involving the whole system swap-counting. Then only try to check
> the
> 'VmSwap' in proc/PID/status per process, to get rid of the potential
> influence
> from other processes which easily leads to false positive.  e.g.
>
> Child:
>          touch unreferenced pages (via alloc&write&free 1.3*MemAvailable)
> [1]
>          alloc&wirte 1.3*MemAvailable
>          raise(SIGSTOP)
>          ...
> Parent:
>          waiting for child suspension
>          check child's VmSwap to see if heavy-swap occurs in a process
>          ...
>
> [1] As to perform alloc&write&free, the system pages will go through a
> completed life cycle from buddy-system to active-list to inactive-list
> then back to buddy-system, which reflect to a page status is theoretically
> like:
> "inactive,unreferenced -> active,referenced -> ... ->inactive,unreferenced"
> so that will helpful to produce what the kernel target commit fixed
> situation.
>
> New reproducer works well with unfix-kernel:
>
>   # uname  -r
>   2.6.39
>
>   # ./swapping01
>   tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
>   swapping01.c:110: TINFO: available physical memory: 1896 MB
>   swapping01.c:113: TINFO: try to allocate: 2466 MB
>   swapping01.c:148: TFAIL: heavy swapping detected: 1905 MB swapped.
>

BTW, to be on the safe side, I tried on kernel-3.2.0 (with dropping that
fix commit), it also could be reproduced in such a single process way.
But after adding back the revert commit, swapping01 gets PASS in 100 times.

I think it can prove that the patch makes some sense to swapping01.

# uname  -rm
3.2.0+ s390x


FAIL on kernel reverts that fix-commit
----------------------
# ./swapping01 -i 100
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
swapping01.c:110: TINFO: available physical memory: 1895 MB
swapping01.c:113: TINFO: try to allocate: 2464 MB
swapping01.c:148: TFAIL: heavy swapping detected: 1905 MB swapped.


PASS on kernel includes that fix-commit
----------------------
# ./swapping01 -i 100
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
swapping01.c:110: TINFO: available physical memory: 1876 MB
swapping01.c:113: TINFO: try to allocate: 2439 MB
swapping01.c:152: TPASS: no heavy swapping detected, 593 MB swapped.
swapping01.c:110: TINFO: available physical memory: 1919 MB
swapping01.c:113: TINFO: try to allocate: 2495 MB
swapping01.c:152: TPASS: no heavy swapping detected, 650 MB swapped.
...

-- 
Regards,
Li Wang

--0000000000000c86a405bc11e302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">=C2=A0Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" =
target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></div><div dir=3D"ltr=
" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Issue:<br>
<br>
Currently test swapping01 read the system FreeSwap for counting usage of<br=
>
swap-size, that&#39;s not precise on system especially with eating-memory d=
aemon<br>
in the background.<br>
<br>
Improvement:<br>
<br>
Considering that swap out unreferenced pages also could be occurred in a<br=
>
single process. So that we encapsulate all of the means in a single process=
<br>
to avoid involving the whole system swap-counting. Then only try to check t=
he<br>
&#39;VmSwap&#39; in proc/PID/status=C2=A0per process, to get rid of=C2=A0th=
e potential influence<br>
from=C2=A0other processes=C2=A0which easily leads to false positive.=C2=A0 =
e.g.<br>
<br>
Child:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch unreferenced pages (via alloc&amp;w=
rite&amp;free 1.3*MemAvailable) [1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alloc&amp;wirte 1.3*MemAvailable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise(SIGSTOP)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
Parent:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0waiting for child suspension<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check child&#39;s VmSwap to see if heavy-=
swap occurs in a process<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
<br>
[1] As to perform alloc&amp;write&amp;free, the system pages will go throug=
h a<br>
completed life cycle from buddy-system to active-list to inactive-list<br>
then back to buddy-system, which reflect to a page status is theoretically =
like:<br>
&quot;inactive,unreferenced -&gt; active,referenced -&gt; ... -&gt;inactive=
,unreferenced&quot;<br>
so that will helpful to produce what the kernel target commit fixed situati=
on.<br>
<br>
New reproducer works well with unfix-kernel:<br>
<br>
=C2=A0 # uname=C2=A0 -r<br>
=C2=A0 2.6.39<br>
<br>
=C2=A0 # ./swapping01<br>
=C2=A0 tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s<br>
=C2=A0 swapping01.c:110: TINFO: available physical memory: 1896 MB<br>
=C2=A0 swapping01.c:113: TINFO: try to allocate: 2466 MB<br>
=C2=A0 swapping01.c:148: TFAIL: heavy swapping detected: 1905 MB swapped.<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">BTW, t<span style=3D"color:rgb(51,51,51);font-size:14px">o b=
e on the safe side,=C2=A0</span>I tried on kernel-3.2.0 (with dropping that=
</div><div class=3D"gmail_default" style=3D"font-size:small">fix commit), i=
t also could be reproduced in such a single process way.</div><div class=3D=
"gmail_default" style=3D"font-size:small">But after adding back the revert =
commit, swapping01 gets PASS in 100 times.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">I think it can prove that the patch makes some sense to s=
wapping01.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small"></div><div></d=
iv># uname =C2=A0-rm<br><div class=3D"gmail_default" style=3D"font-size:sma=
ll">3.2.0+ s390x</div><br></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">FAIL on kernel reverts that fix-commit=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small">-----------=
-----------</div></div><div><div class=3D"gmail_default" style=3D"font-size=
:small"># ./swapping01 -i 100</div>tst_test.c:1263: TINFO: Timeout per run =
is 0h 05m 00s<br>swapping01.c:110: TINFO: available physical memory: 1895 M=
B<br>swapping01.c:113: TINFO: try to allocate: 2464 MB<br>swapping01.c:148:=
 TFAIL: heavy swapping detected: 1905 MB swapped.<br><div class=3D"gmail_de=
fault" style=3D"font-size:small"></div></div><div><br></div><div><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">PASS on kernel inclu=
des that fix-commit</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">----------------------</div></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small"># ./swapping01 -i 100</div>tst_test.c:1263: TINFO: =
Timeout per run is 0h 05m 00s<br>swapping01.c:110: TINFO: available physica=
l memory: 1876 MB<br>swapping01.c:113: TINFO: try to allocate: 2439 MB<br>s=
wapping01.c:152: TPASS: no heavy swapping detected, 593 MB swapped.<br>swap=
ping01.c:110: TINFO: available physical memory: 1919 MB<br>swapping01.c:113=
: TINFO: try to allocate: 2495 MB<br>swapping01.c:152: TPASS: no heavy swap=
ping detected, 650 MB swapped.<br><div class=3D"gmail_default" style=3D"fon=
t-size:small">...</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"></div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--0000000000000c86a405bc11e302--


--===============0923401177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0923401177==--

