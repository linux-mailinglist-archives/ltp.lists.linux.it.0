Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED03DB738
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:38:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0ABD63C8EBD
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 12:38:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3F3C3C56BF
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:38:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 123E31400993
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 12:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627641513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rfDvZ8iiZfrwOp0IA/MyYSYnF7QAs9bq6uwYo8B7Pk=;
 b=hlDS4KrN727ujAt7I8qCbsXt3X8z3P375LYVEQptsAUS1hCM6Dfv5ZPvTuMH/HYp+418ll
 lAKF1BVv7bepIHdOU61nTOJD9G+b8eIfRlz4UdBmLF/n5CuC6KefCX7cFEo5PlL27LZTwV
 xQ7cg9Ls0bF5wzqIvMfrl83Le4ga098=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-tZ8ZuJdJMtOM1xHV-Mrd3Q-1; Fri, 30 Jul 2021 06:38:31 -0400
X-MC-Unique: tZ8ZuJdJMtOM1xHV-Mrd3Q-1
Received: by mail-yb1-f200.google.com with SMTP id
 j9-20020a2581490000b02905897d81c63fso4350419ybm.8
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 03:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rfDvZ8iiZfrwOp0IA/MyYSYnF7QAs9bq6uwYo8B7Pk=;
 b=HTE1JwoM187Qy4cBNFFYRBKR01scrgtdwcokCoO5z5Iecr6drccTIayxGZvcWonHWh
 lwmblW+XvU98ydq8mktkppelU9TJV/1+IGIKlDpRtg9b06YIIAWvc+v/vPZoPtzMgujR
 xQkIInhmrN2kjpucsWBne7ld0Qsb0kT+vsmAVHgyRWF3yZrmZleM72kmQ/buFpQQVNTX
 y0i4+tVqskCVcxABHtZYygbAVhiomw+Kmv+HZ9PjOeK2ZQyatrHTklLeDRQ9nRaFJACB
 fRowwJeKJ57VxqcF9MlYQyvMrw4xWuhIfGzW31xi9nRBgU+xaT5/UyUhyOx3+Ra/3fox
 xJjw==
X-Gm-Message-State: AOAM531ktsz1Zk5tmmsXSKyR3672LaD1TNOfsQDEn6Dta2pL2TqkvjkN
 lKa1WIE1cmNVfPGkw+fVmOuFN9szFdPRkFcajSGYuMqZs0+4UZcpL25YJHCNnX1TrH1XDGUR7OD
 QaBXyUEVac/lJdEyNPgRz5EuQdkY=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr2350261ybn.286.1627641511513; 
 Fri, 30 Jul 2021 03:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+DQ8I9yopBOvqYp2eGzLxoXk+xByBW3wtZOC5eqtXnEjy+0YtKnTpxFV5EOCH0Cs22gDfW7tQbaHaB8tbWaU=
X-Received: by 2002:a25:a2d1:: with SMTP id c17mr2350241ybn.286.1627641511207; 
 Fri, 30 Jul 2021 03:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
 <YQPCcew5Are2VrDh@yuki> <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
In-Reply-To: <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 30 Jul 2021 18:38:19 +0800
Message-ID: <CAEemH2d8sHSWCAst9-q6KiKfJTSULYS8-KivWHrS04mR6ZXjzQ@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
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
Subject: Re: [LTP] [PATCH v2] crypto/af_alg02: thread termination fixes
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
Content-Type: multipart/mixed; boundary="===============1704597042=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1704597042==
Content-Type: multipart/alternative; boundary="0000000000001905fb05c854d254"

--0000000000001905fb05c854d254
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 5:32 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi
>
> On 7/30/2021 11:12 AM, Cyril Hrubis wrote:
> > Hi!
> >> On musl, pthread_kill() doesn't return ESRCH if thread id is not found
> >> (POSIX only recommends to return ESRCH). Use tst_atomic_store/load()
> >> instead, when waiting for the thread.
> >>
> >> Also, the thread's resources wasn't properly freed after the run(),
> >> so adding pthread_join() should fix that.
> > I do not think that we even need atomic operations here as we do not
> > have competing threads setting the value, it should work fine with
> > regular assignments as long as the completed variable is marked as
> > volatile (which will prevent compiler mis-optimizations).
>
> +1 Using a volatile variable should be enough here.
>

I have no preference for atomic or volatile methods.
Both should be fine.



> If only pthread_timedjoin_np was not _np... This is exactly the function
> that could be used here without any boilerplate.
> But is the custom timeout handling in this test even required? Does the
> default timeout using SIGALRM not work?
>

The default timeout obviously works.

But with introducing the thread_B (custom timeout) can get a fine-grained
report when the read() was stuck. That's the advantage I can think of.



> The thread was introduced, because SIG_ALRM was apparently not able to
> interrupt the read call on linux < 4.14.
> But even there it should be possible to interrupt pthread_join. So just
> replacing the whole loop with pthread_join should be enough.
>

That should work but no precise log to indicate where goes wrong,
so I vote to go the loop way:).

-- 
Regards,
Li Wang

--0000000000001905fb05c854d254
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 5:32 PM Joerg Vehlow &lt;<a=
 href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi<br>
<br>
On 7/30/2021 11:12 AM, Cyril Hrubis wrote:<br>
&gt; Hi!<br>
&gt;&gt; On musl, pthread_kill() doesn&#39;t return ESRCH if thread id is n=
ot found<br>
&gt;&gt; (POSIX only recommends to return ESRCH). Use tst_atomic_store/load=
()<br>
&gt;&gt; instead, when waiting for the thread.<br>
&gt;&gt;<br>
&gt;&gt; Also, the thread&#39;s resources wasn&#39;t properly freed after t=
he run(),<br>
&gt;&gt; so adding pthread_join() should fix that.<br>
&gt; I do not think that we even need atomic operations here as we do not<b=
r>
&gt; have competing threads setting the value, it should work fine with<br>
&gt; regular assignments as long as the completed variable is marked as<br>
&gt; volatile (which will prevent compiler mis-optimizations).<br>
<br>
+1 Using a volatile variable should be enough here.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">I have =
no preference for atomic or volatile methods.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Both should be fine.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If only pthread_timedjoin_np was not _np... This is exactly the function <b=
r>
that could be used here without any boilerplate.<br>
But is the custom timeout handling in this test even required? Does the <br=
>
default timeout using SIGALRM not work?<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">The default timeout=
 obviously works.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"">But with introducing t=
he thread_B (custom timeout) can get a fine-grained</div><div class=3D"gmai=
l_default" style=3D"">report when the read() was stuck. That&#39;s the adva=
ntage I can think of.</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
The thread was introduced, because SIG_ALRM was apparently not able to <br>
interrupt the read call on linux &lt; 4.14.<br>
But even there it should be possible to interrupt pthread_join. So just <br=
>
replacing the whole loop with pthread_join should be enough.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">That should work but no precise log to indicate where goes wrong,</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">so I vote to go the lo=
op way:).</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000001905fb05c854d254--


--===============1704597042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1704597042==--

