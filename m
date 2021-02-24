Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F328323845
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:04:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 044B63C4E71
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:04:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7D7D73C2656
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:04:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 419BE200D4C
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614153883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gT5GFuWre43b1JPlBqiTDxRzdfGq8uBWSg6CYBU2kkk=;
 b=gYIA6G9wMLGUxDr2FJym12taxrnva3679ZYu32tzqM1k7fxpgE/z3cUmbYI4+qjCuzcdFj
 Vffd1Eb4s6bhnaJxn3AGJdY8McfBSj7deK5pN5WEt12xV4VfiSQ46f9igUWjZ2Qh3go3oh
 vD4ai8Ae1KYYUBTsKF5z5sayd/Wx7w4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-QIhQN2vUNayU4NCvKZg55A-1; Wed, 24 Feb 2021 03:04:39 -0500
X-MC-Unique: QIhQN2vUNayU4NCvKZg55A-1
Received: by mail-yb1-f197.google.com with SMTP id g17so1570747ybh.4
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 00:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gT5GFuWre43b1JPlBqiTDxRzdfGq8uBWSg6CYBU2kkk=;
 b=Vs51/tTBJ9PBFLBve0JiKxx/vWarUFLyh8vQiMowRaKUyTQtld8TjbpyW1UPzNQGfJ
 btxd3q4Xop0Hef5ST9R0WdF42XCWa7Hr5uQ8jwF01o0w2w50fwlnLkyka2MgrkQdyupy
 7l5zF2h6ef6Z9Sz97v2bLU9VWZ86Ox95yKIscnzOhtPodipzvrbin6Tzgg/CHiru7qEi
 A6Emo1YYlAJ3pCjS1YTktqR+Ulbz7sS4K4GL+QW/UlKxNFPfAy3pIu0XQ+5gadbXxamm
 irb9yo29J3CycJMl+TZ6j7E5EMWNp7GwvOocCpGrSNNEQMPb9B62YL3rw1XqiOGYa6Mr
 G3dA==
X-Gm-Message-State: AOAM531nBKzudI8h/QlrJ+FteF0nhDZfA6Fokc7uh/ih8sDpUOGI14kn
 +jhgfXe/U3ZrNKuJ+u9kd0Wf8CdRu/MxHBGI6v/NLU9F7XgdWouWaBWB6z4Oi0utw+0ITUr4SkT
 f47N7Np4dIvAu7gkFQcJhzIQCBN0=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr48353699ybd.243.1614153878696; 
 Wed, 24 Feb 2021 00:04:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVCeqskIWLcVBMITfjnu/8VIwQYgR/7Xt3p3ZdrYa+tEAWfpZBP4FIkimPxcXOlLvx1jSfsRWOtUgtR4/yGEk=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr48353670ybd.243.1614153878423; 
 Wed, 24 Feb 2021 00:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20210125064747.26759-1-liwang@redhat.com>
 <20210125064747.26759-2-liwang@redhat.com>
 <YA7i/eQagkj0Jxsy@yuki.lan>
 <CAEemH2cSwtVXi2fXam2aKG0XOEd3-hfZGgQ+o4K2_vyThMrTEg@mail.gmail.com>
In-Reply-To: <CAEemH2cSwtVXi2fXam2aKG0XOEd3-hfZGgQ+o4K2_vyThMrTEg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 24 Feb 2021 16:04:26 +0800
Message-ID: <CAEemH2fVTtYP-5KwAU8O7Nr8NQawMb3p6_qo4e37Hxahnay8VA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 2/2] swapping01: check memory swap usage per
 process
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1133890055=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1133890055==
Content-Type: multipart/alternative; boundary="000000000000895d8c05bc107c96"

--000000000000895d8c05bc107c96
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jan 26, 2021 at 1:25 PM Li Wang <liwang@redhat.com> wrote:

> Hi Cyril,
>
> On Mon, Jan 25, 2021 at 11:24 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> > Since previously swapping01 read the system FreeSwap for counting
>> > usage of swap-size, that's not precise on system especially with
>> > eating-memory daemon??in the background. Now, we try to check the
>> > 'VmmSwap' in proc/PID/status??per process, to get rid of??the potential
>> > influence from??other processes??which easily leads to false positive.
>>
>> I've been looking for a while at the kernel commit:
>>
>> commit 50a15981a1fac7e019ff7c3cba87531fb580f065
>> Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
>> Date:   Sun Jul 24 10:47:59 2011 +0200
>>
>>     [S390] reference bit testing for unmapped pages
>>
>> For which this test seems to be a reproducer and as far as I can tell
>> this fix is not correct.
>>
>> If I understand correctly what we are trying to test here is that the
>> kernel will not attempt to swap out unreferenced pages, so we have to,
>> by definition, look at the system counters not the process ones.
>>
>
> Thanks for point out this! Seems we were all working towards
> making the test robust but neglect it's a reproducer:).
>
>
> As we have discussed many unsure things will take side effect to
> the system swap-counting, that's what we do NOT want to expect.
> Maybe, can we encapsulate all of the means in a process to avoid
> involving the whole system swap-counting. e.g.
>
> Child:
>          to touch unreferenced pages (via
> alloc&write&free 1.3*MemAvailable) [1]
>          alloc&wirte 1.3*MemAvailable
>          raise(SIGSTOP)
>          ...
> Parent:
>          waiting for child suspension
>          check child's VmSwap to see if heavy-swap occurs in a process
>          ...
>
> Does this make some sense to the test or, any else suggestion?
>
> [1] As to perform alloc&write&free, the system pages will go through a
> completed life cycle from buddy-system to active-list to inactive-list
> then back to buddy-system, which reflect to a page status is theoretically
> like:
> "inactive,unreferenced -> active,referenced -> ... ->inactive,unreferenced"
> so that might helpful to produce what the kernel target commit fixed
> situation.
>

To verify this assumption, I run the swapping01 with/without my patch-V2
against an unfix-kernel(2.6.39). Seems swap out unreferenced pages also
could be occurred in a single process, which gives me some confidence to
send out my patch V2.

-------
Reproduce the bug easily with an unfix-kernel

# uname  -r
2.6.39

# free -m
             total       used       free     shared    buffers     cached
Mem:          2006       1559        447          0         22       1359
-/+ buffers/cache:        178       1828
Swap:         4031         12       4019

# ./swapping01
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
swapping01.c:110: TINFO: available physical memory: 1896 MB
swapping01.c:113: TINFO: try to allocate: 2466 MB
swapping01.c:148: TFAIL: heavy swapping detected: 1905 MB swapped.

-- 
Regards,
Li Wang

--000000000000895d8c05bc107c96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jan 26, 2021 at 1:25 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small">Hi Cyril,</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25, 2021 at=
 11:24 PM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_bl=
ank">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi!<br>
&gt; Since previously swapping01 read the system FreeSwap for counting<br>
&gt; usage of swap-size, that&#39;s not precise on system especially with<b=
r>
&gt; eating-memory daemon??in the background. Now, we try to check the<br>
&gt; &#39;VmmSwap&#39; in proc/PID/status??per process, to get rid of??the =
potential<br>
&gt; influence from??other processes??which easily leads to false positive.=
<br>
<br>
I&#39;ve been looking for a while at the kernel commit:<br>
<br>
commit 50a15981a1fac7e019ff7c3cba87531fb580f065<br>
Author: Martin Schwidefsky &lt;<a href=3D"mailto:schwidefsky@de.ibm.com" ta=
rget=3D"_blank">schwidefsky@de.ibm.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Sun Jul 24 10:47:59 2011 +0200<br>
<br>
=C2=A0 =C2=A0 [S390] reference bit testing for unmapped pages<br>
<br>
For which this test seems to be a reproducer and as far as I can tell<br>
this fix is not correct.<br>
<br>
If I understand correctly what we are trying to test here is that the<br>
kernel will not attempt to swap out unreferenced pages, so we have to,<br>
by definition, look at the system counters not the process ones.<br></block=
quote><div><br></div><div><div style=3D"font-size:small">Thanks for point o=
ut this! Seems we were all working towards</div><div style=3D"font-size:sma=
ll">making the test robust but neglect it&#39;s a reproducer:).</div></div>=
<div style=3D"font-size:small"><br></div><div style=3D"font-size:small"><br=
></div><div style=3D"font-size:small">As we have discussed many unsure thin=
gs will=C2=A0take side effect to</div><div style=3D"font-size:small">the sy=
stem swap-counting, that&#39;s what we do NOT want to expect.</div><div sty=
le=3D"font-size:small">Maybe, can we encapsulate=C2=A0all of the means in a=
 process to avoid</div><div style=3D"font-size:small">involving the whole s=
ystem swap-counting. e.g.</div><div style=3D"font-size:small"><br>Child:<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to touch unreferenced pages (via alloc&a=
mp;write&amp;free=C2=A01.3*MemAvailable) [1]</div><div style=3D"font-size:s=
mall">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alloc&amp;wirte=C2=A01.3*MemAvailab=
le</div><div style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra=
ise(SIGSTOP)</div><div style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0...</div><div style=3D"font-size:small">Parent:</div><div style=
=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0waiting for child=C2=
=A0suspension<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check child&#39;s VmSwap=
 to see if heavy-swap occurs in a process<br></div><div style=3D"font-size:=
small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...</div><div style=3D"font-size:s=
mall"><br></div><div style=3D"font-size:small">Does this make some sense to=
 the test or, any else=C2=A0suggestion?</div><div style=3D"font-size:small"=
><br></div><div style=3D"font-size:small">[1] As to perform alloc&amp;write=
&amp;free, the system pages will go through a</div><div style=3D"font-size:=
small">completed life cycle from buddy-system to active-list to inactive-li=
st</div><div style=3D"font-size:small">then back to buddy-system, which ref=
lect to a page status is theoretically like:</div><div style=3D"font-size:s=
mall">&quot;inactive,unreferenced -&gt; active,referenced -&gt; ... -&gt;in=
active,unreferenced&quot;</div><div style=3D"font-size:small">so that might=
 helpful to produce what the kernel target commit fixed situation.</div></d=
iv></div></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">To verify this assumption, I run the swapping01 with/=
without my patch-V2</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">against an unfix-kernel(2.6.39). Seems swap out=C2=A0unreferenced page=
s also</div><div class=3D"gmail_default" style=3D"font-size:small">could be=
 occurred in a single process, which gives me some confidence to</div><div =
class=3D"gmail_default" style=3D"font-size:small">send out my patch V2.</di=
v></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">-------</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Reproduce the bug easily with=
 an unfix-kernel<br><br># uname =C2=A0-r<br>2.6.39<br><br># free -m<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total =C2=A0 =C2=A0 =C2=A0 use=
d =C2=A0 =C2=A0 =C2=A0 free =C2=A0 =C2=A0 shared =C2=A0 =C2=A0buffers =C2=
=A0 =C2=A0 cached<br>Mem: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02006 =C2=A0 =C2=
=A0 =C2=A0 1559 =C2=A0 =C2=A0 =C2=A0 =C2=A0447 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 22 =C2=A0 =C2=A0 =C2=A0 1359<br>-/+ buf=
fers/cache: =C2=A0 =C2=A0 =C2=A0 =C2=A0178 =C2=A0 =C2=A0 =C2=A0 1828<br>Swa=
p: =C2=A0 =C2=A0 =C2=A0 =C2=A0 4031 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12 =C2=A0 =
=C2=A0 =C2=A0 4019<br><br># ./swapping01 <br>tst_test.c:1263: TINFO: Timeou=
t per run is 0h 05m 00s<br>swapping01.c:110: TINFO: available physical memo=
ry: 1896 MB<br>swapping01.c:113: TINFO: try to allocate: 2466 MB<br>swappin=
g01.c:148: TFAIL: heavy swapping detected: 1905 MB swapped.<br></div></div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000895d8c05bc107c96--


--===============1133890055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1133890055==--

