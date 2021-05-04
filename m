Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 568EE3724CF
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 06:09:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAF343C999A
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 06:09:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C0ED53C17CE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 06:09:03 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E12E760083D
 for <ltp@lists.linux.it>; Tue,  4 May 2021 06:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620101340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rlsPKkp3KadM7IxIhRSA6j0iGUL/HbKTGiBlduwl1do=;
 b=IzTb6C2MqMVXdjDTG+cTNEGUCZVy807gESLz1qNBcV/K/v1PJquC/F3yt4ZzFj4gUfJ70T
 kHkFW/veABPeB/hM8bTJHizBtax+x8d913MKMS1HE+dKDczw2lTbfXroNDvKP9kCzDaWZc
 S48m+mOE8fVEm+PzFc3jv6GjoZHAXF0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-pEM8SdASO8KDyX6A_q_fMQ-1; Tue, 04 May 2021 00:08:55 -0400
X-MC-Unique: pEM8SdASO8KDyX6A_q_fMQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 s9-20020acadb090000b0290101bacefaa4so4306152oig.2
 for <ltp@lists.linux.it>; Mon, 03 May 2021 21:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlsPKkp3KadM7IxIhRSA6j0iGUL/HbKTGiBlduwl1do=;
 b=d2VzziDGgueS2++8EbScqu8OqSjUL67qNYl3MxH7lnLxvzWMZrZMJ8pfWjMrkzLO1h
 5GCUj2A3ag9aputX+SUQTNu8okkHLHYc7+DGWEFL4V1aE7Dv25dUYnk5A3mTaWTns7x4
 sT8pK4dImtxbb/zjJeQzVLt/dFRM/D0K3Ep1yylOquml2ZzljHd9e9a70FccGx+ClE5g
 /B9FJIMq+RPbNm4p47Df625lhIUSbYOEw4ga9AQGH2odA9nFGSygv3DjPU+KXeuXxAJ4
 Qjw4G1HHANfVgJYRpcVyGhn8PZVRuHqhV3gy5CQUBloYOaTEqKBF4b3PnWfr6JaCvk+T
 qM2g==
X-Gm-Message-State: AOAM532DqOQkfOlpWvQS2ngV/rDRVJOV7pTpNv8ZgF+9LyIJhDBpBoIm
 v0PYSCOqleqzFJg29XAW/PBvR8qcacEzKFcJFg3YVAfQRMOcfx1SOWlQGoveFyIjR6n8ZXTrZXP
 xDJlNOXUw6f3iQbCtq6MScUGRyjs=
X-Received: by 2002:a9d:2ae1:: with SMTP id e88mr16658726otb.265.1620101334255; 
 Mon, 03 May 2021 21:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWLmb32OguHksu0POPJzYbORWs/rk/n37QiA2sf3+M9wA2Yq3ANzRFUp7EXsIlqw8GCU6tAz8gc65y+9ePYfA=
X-Received: by 2002:a9d:2ae1:: with SMTP id e88mr16658715otb.265.1620101333998; 
 Mon, 03 May 2021 21:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210429115021.24128-1-xieziyao@huawei.com>
 <YJBJB/S1ThSsNvCk@pevik>
In-Reply-To: <YJBJB/S1ThSsNvCk@pevik>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 4 May 2021 06:08:36 +0200
Message-ID: <CAASaF6w3xihoQRakDsBB52jnTimexy3V6eoj2wVbtT43Yq9iCQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] syscalls/aio: Convert libaio wrapper function
 to kernel syscall
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1861166299=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1861166299==
Content-Type: multipart/alternative; boundary="00000000000083773c05c1793ca1"

--00000000000083773c05c1793ca1
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 9:03 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Ziyao,
>
> > Instead of using the libaio wrapper function, the system call is changed
> to be invoked via syscall(2).
>

I probably missed some discussion. Why are we replacing it with syscall?



> Generally LGTM. Major thing for me is to replace <libaio.h> with
> <linux/aio_abi.h>.
> Do you plan to transform other tests which now still use <libaio.h>
> (testcases/kernel/io/aio/ and testcases/kernel/io/ltp-aiodio/, which are
> BTW
> problematic on mainline kernel)? I guess it'd be good to keep some test
> using <libaio.h>.
>
> FYI if you don't prefer put your copyright, I'll update it with LTP
> copyright.
>
> You also mix more things in single commit: using kernel API instead of
> libaio
> API (that you mentioned) with both code and comments cleanup. But commits
> are
> quite compact thus LGTM.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> For whole patchset.
>
> Kind regards,
> Petr
>
> > Xie Ziyao (3):
> >   syscalls/io_destroy: Convert libaio wrapper function to kernel syscall
> >   syscalls/io_setup: Convert libaio wrapper function to kernel syscall
> >   syscalls/io_submit: Convert libaio wrapper function to kernel syscall
>
> >  .../kernel/syscalls/io_destroy/io_destroy01.c |  49 ++------
> >  .../kernel/syscalls/io_setup/io_setup01.c     |  94 +++++----------
> >  .../kernel/syscalls/io_submit/io_submit01.c   | 110 ++++++++----------
> >  3 files changed, 86 insertions(+), 167 deletions(-)
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--00000000000083773c05c1793ca1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 3, 2021 at 9:03 PM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Ziyao,<br>
<br>
&gt; Instead of using the libaio wrapper function, the system call is chang=
ed to be invoked via syscall(2).<br></blockquote><div><br></div><div><div s=
tyle=3D"font-family:monospace" class=3D"gmail_default">I probably missed so=
me discussion. Why are we replacing it with syscall?<br></div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Generally LGTM. Major thing for me is to replace &lt;libaio.h&gt; with &lt;=
linux/aio_abi.h&gt;.<br>
Do you plan to transform other tests which now still use &lt;libaio.h&gt;<b=
r>
(testcases/kernel/io/aio/ and testcases/kernel/io/ltp-aiodio/, which are BT=
W<br>
problematic on mainline kernel)? I guess it&#39;d be good to keep some test=
 using &lt;libaio.h&gt;.<br>
<br>
FYI if you don&#39;t prefer put your copyright, I&#39;ll update it with LTP=
 copyright.<br>
<br>
You also mix more things in single commit: using kernel API instead of liba=
io<br>
API (that you mentioned) with both code and comments cleanup. But commits a=
re<br>
quite compact thus LGTM.<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
For whole patchset.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
&gt; Xie Ziyao (3):<br>
&gt;=C2=A0 =C2=A0syscalls/io_destroy: Convert libaio wrapper function to ke=
rnel syscall<br>
&gt;=C2=A0 =C2=A0syscalls/io_setup: Convert libaio wrapper function to kern=
el syscall<br>
&gt;=C2=A0 =C2=A0syscalls/io_submit: Convert libaio wrapper function to ker=
nel syscall<br>
<br>
&gt;=C2=A0 .../kernel/syscalls/io_destroy/io_destroy01.c |=C2=A0 49 ++-----=
-<br>
&gt;=C2=A0 .../kernel/syscalls/io_setup/io_setup01.c=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 94 +++++----------<br>
&gt;=C2=A0 .../kernel/syscalls/io_submit/io_submit01.c=C2=A0 =C2=A0| 110 ++=
++++++----------<br>
&gt;=C2=A0 3 files changed, 86 insertions(+), 167 deletions(-)<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div></div>

--00000000000083773c05c1793ca1--


--===============1861166299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1861166299==--

