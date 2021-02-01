Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C869130A96C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 15:14:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 998E53C759C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 15:14:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6CF043C2EEF
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 15:14:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E4E2A600823
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 15:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612188886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhkHpYSzaVKok9dVJne/qhJpJ0+mWHl7MflXQRSsBb8=;
 b=BT/jV7Ky/afeuu4FDRCJ8HguOqeJJsvc+vkjcKhxQ0zdKxEnz5ruRavrBMZynG4sL91rgt
 GyBvi1OdK1EE0OtY51QZom/cbIg3Pk/PbSRoE9GiPXs7vaCrLJEtrSEquecPRG8PWMG5Ll
 4XGHuGNhj8mKxTf70Fy6GTXPMW4Bji4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2PFOcqFkOFCTQbL3bAEhvw-1; Mon, 01 Feb 2021 09:14:44 -0500
X-MC-Unique: 2PFOcqFkOFCTQbL3bAEhvw-1
Received: by mail-yb1-f199.google.com with SMTP id v7so2082634ybl.15
 for <ltp@lists.linux.it>; Mon, 01 Feb 2021 06:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhkHpYSzaVKok9dVJne/qhJpJ0+mWHl7MflXQRSsBb8=;
 b=uZgkzepI2hVJSpDIw1OsDTB6vsuC3zZYDG4Ynv+noLQ+ZCEzA3ck0mjDvXOiQTcoOv
 kEYh8YNAYDLCoYZqt6hctib7uzYK6oLgtax/YKAVO+VhLWFNnaBWtKA149whHZn7Bilq
 eoGbr8n8kV7XzftWHy8d9fBxAUMnOYVKAc6snp7LKdvR0frT0d/xSd2zXqemba9Ucff7
 9ZWQC2ZSnlzEuo0W+fTvutoizmlLL5vqOLeI9qLWBPJc7yhlZVftyWmy7jeFZAZDCLlb
 HS6rNBe9Pbu5JTjCQy0sjd5SNqjVIf6IoUC4YuFwI435oAPgpkDiqfALg2E5WerAlp9x
 E0sQ==
X-Gm-Message-State: AOAM533lskOyHYPdHgDVn4iRwuZzBDq2yZztcyVVMkEUzgfpNfQlIsNK
 QLkWjARwcjDXAV/FA5pbI/wHVEcDoSvOmTm96pxALMraH/DxaNwOh9VHM9eEgMiDB9VcG/ptD+b
 xcrCY9sD3xm0iM+x7+l4w7u44aoY=
X-Received: by 2002:a25:8203:: with SMTP id q3mr25345121ybk.86.1612188884031; 
 Mon, 01 Feb 2021 06:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTxuekTLd5Apbez6VBqecPup31Kw8KQ0KHuMKtCmaiOmFfw1eSmtWCoQvBcD1peO/vmbvtCIkszEyNdhG7u9Y=
X-Received: by 2002:a25:8203:: with SMTP id q3mr25345078ybk.86.1612188883742; 
 Mon, 01 Feb 2021 06:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20210201133106.26970-1-liwang@redhat.com>
 <YBgGSRNMXU58+cTw@yuki.lan>
In-Reply-To: <YBgGSRNMXU58+cTw@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Feb 2021 22:14:31 +0800
Message-ID: <CAEemH2ee1wH9YtxF=FUTUwG1iaL+Qo8ZfbphhpT207aY+fwnMg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lib: enhancement of tst_pollute_memory
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
Cc: Xinpeng Liu <liuxp11@chinatelecom.cn>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1151353973=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1151353973==
Content-Type: multipart/alternative; boundary="000000000000ba094805ba46f906"

--000000000000ba094805ba46f906
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 9:45 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> >  lib/tst_memutils.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> > index dd09db490..af2178a9c 100644
> > --- a/lib/tst_memutils.c
> > +++ b/lib/tst_memutils.c
> > @@ -15,6 +15,7 @@
> >
> >  void tst_pollute_memory(size_t maxsize, int fillchar)
> >  {
> > +     unsigned int ori_overcommit_mem, ori_overcommit_rat,
> new_overcommit_rat;
> >       size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
> >       void **map_blocks;
> >       struct sysinfo info;
> > @@ -40,6 +41,25 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
> >       map_count = maxsize / blocksize;
> >       map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
> >
> > +     /* Only allow to run on systems with less than or equal to 128GB
> of memory */
> > +     if (info.totalram  >= (137438953472 / info.mem_unit)) {
> > +             tst_brk(TCONF, "Skip test - totalram (%lukB) is larger
> than 128GB",
> > +                             info.totalram * info.mem_unit / 1024);
> > +     }
>
> This is completely wrong, attempt to dirty memory only increases chances
> of reproducing the kernel bug but it's not strictly required.
>
> It's okay to limit the memory or completely skip the rest of this
> function but we must not exit the test. The test is valid even if we do
> not dirty any memory, it's just less likely to fail on buggy kernel.
>

I thought dirty memory is a strict requirement before, so avoid test
on a large system.

Ok, I'm fine with removing these lines.



>
> > +     SAFE_FILE_SCANF("/proc/sys/vm/overcommit_memory", "%u",
> &ori_overcommit_mem);
> > +     SAFE_FILE_SCANF("/proc/sys/vm/overcommit_ratio",  "%u",
> &ori_overcommit_rat);
> > +
> > +     /* Disable the memory overcommit to prevent test invoking OOM
> killer */
> > +     if (SAFE_READ_MEMINFO("CommitLimit:") >=
> SAFE_READ_MEMINFO("MemAvailable:")) {
> > +             SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
> > +     } else {
> > +             new_overcommit_rat = (maxsize / info.mem_unit * 100) /
> info.totalram;
> > +             SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_ratio", "%u",
> new_overcommit_rat);
> > +
> > +             SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
> > +     }
>
> And I do not like this that much either, I would be happier with
> attempt to dirty only half of the available memory instead of depending
> on specific kernel behavior like this.
>

The reason I come this way because I noticed that Xinpeng's system
has NO swap-space, that's probably the root cause to make 'CommitLimit'
less than 'MemAvailable'.

Then the system will prefer to use OOM (with overcommit_memory = 0 by
default) when allocated-memory reach to the CommitLimit.

[root@test-env-nm05-compute-14e5e72e38 ~]# cat /proc/meminfo
> MemTotal:       526997420 kB
> MemFree:        520224908 kB
> MemAvailable:   519936744 kB
> Buffers:               0 kB
> Cached:          2509036 kB
> SwapCached:            0 kB
> ...
> SwapTotal:             0 kB
> SwapFree:              0 kB
> ...
> CommitLimit:    263498708 kB
> Committed_AS:   10263760 kB
>


-- 
Regards,
Li Wang

--000000000000ba094805ba46f906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 1, 2021 at 9:45 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt;=C2=A0 lib/tst_memutils.c | 23 +++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt; <br>
&gt; diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c<br>
&gt; index dd09db490..af2178a9c 100644<br>
&gt; --- a/lib/tst_memutils.c<br>
&gt; +++ b/lib/tst_memutils.c<br>
&gt; @@ -15,6 +15,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void tst_pollute_memory(size_t maxsize, int fillchar)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int ori_overcommit_mem, ori_overcommit_r=
at, new_overcommit_rat;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t i, map_count =3D 0, safety =3D 0, blo=
cksize =3D BLOCKSIZE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void **map_blocks;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sysinfo info;<br>
&gt; @@ -40,6 +41,25 @@ void tst_pollute_memory(size_t maxsize, int fillcha=
r)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0map_count =3D maxsize / blocksize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0map_blocks =3D SAFE_MALLOC(map_count * sizeo=
f(void *));<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Only allow to run on systems with less than or=
 equal to 128GB of memory */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (info.totalram=C2=A0 &gt;=3D (137438953472 / i=
nfo.mem_unit)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;=
Skip test - totalram (%lukB) is larger than 128GB&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.totalram * info.mem_unit / 1024);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
This is completely wrong, attempt to dirty memory only increases chances<br=
>
of reproducing the kernel bug but it&#39;s not strictly required.<br>
<br>
It&#39;s okay to limit the memory or completely skip the rest of this<br>
function but we must not exit the test. The test is valid even if we do<br>
not dirty any memory, it&#39;s just less likely to fail on buggy kernel.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I=C2=A0thought dirty memory is a strict requirement before, s=
o avoid test</div><div class=3D"gmail_default" style=3D"font-size:small">on=
 a large system.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ok, I&#3=
9;m fine with removing these lines.</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(&quot;/proc/sys/vm/overcommit_mem=
ory&quot;, &quot;%u&quot;, &amp;ori_overcommit_mem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(&quot;/proc/sys/vm/overcommit_rat=
io&quot;,=C2=A0 &quot;%u&quot;, &amp;ori_overcommit_rat);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Disable the memory overcommit to prevent test =
invoking OOM killer */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (SAFE_READ_MEMINFO(&quot;CommitLimit:&quot;) &=
gt;=3D SAFE_READ_MEMINFO(&quot;MemAvailable:&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quo=
t;/proc/sys/vm/overcommit_memory&quot;, &quot;2&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_overcommit_rat =
=3D (maxsize / info.mem_unit * 100) / info.totalram;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quo=
t;/proc/sys/vm/overcommit_ratio&quot;, &quot;%u&quot;, new_overcommit_rat);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quo=
t;/proc/sys/vm/overcommit_memory&quot;, &quot;2&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
And I do not like this that much either, I would be happier with<br>
attempt to dirty only half of the available memory instead of depending<br>
on specific kernel behavior like this.<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">The reason I come th=
is way because I noticed that Xinpeng&#39;s system</div><div class=3D"gmail=
_default" style=3D"font-size:small">has NO swap-space, that&#39;s probably =
the root cause to=C2=A0make &#39;CommitLimit&#39;=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small">less than &#39;MemAvailable&#39;.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Then the system will pref=
er to use OOM (with overcommit_memory =3D 0 by default) when allocated-memo=
ry reach to=C2=A0the CommitLimit.</div><div dir=3D"ltr"><div class=3D"gmail=
_default"><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div><div>[root@test-env-nm05-compute-14e5e72e38 ~]# cat /proc/meminfo</div=
><div>MemTotal: =C2=A0 =C2=A0 =C2=A0 526997420 kB</div><div>MemFree: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0520224908 kB</div><div><span class=3D"gmail_default"><=
/span>MemAvailable: =C2=A0 519936744 kB</div><div>Buffers: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div>Cached: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A02509036 kB</div><div>SwapCached: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00 kB</div><div><span class=3D"gmail_default">...</span></d=
iv><div>SwapTotal: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 kB</div><div=
>SwapFree: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 kB</div><div><=
span class=3D"gmail_default">...</span></div><div><span class=3D"gmail_defa=
ult"></span>CommitLimit: =C2=A0 =C2=A0263498708 kB</div><div>Committed_AS: =
=C2=A0 10263760 kB</div></div></blockquote></div><br></div><div><br></div><=
/div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>L=
i Wang<br></div></div></div></div>

--000000000000ba094805ba46f906--


--===============1151353973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1151353973==--

