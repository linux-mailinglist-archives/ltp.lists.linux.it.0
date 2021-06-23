Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92B3B1192
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 04:11:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5256A3C870A
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 04:11:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1DBAB3C4D3C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 04:11:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3C93E1000A2F
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 04:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624414270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F54OXoXwR70UsmUMPD/yKEo6/VdT0h7kCGQqz5X1/pE=;
 b=gQpTRXKZrnLxjPtDvBGK4onSbhE3X8S8vY2KwPeLcRGG/8QUxho+05luSpwZ4QTNeKVePo
 Ux3zqySLxcm26rBkMsWZEP2qFWL12WF4F5+GudXN+wU92FiJvunoAxXQW10CkkOMP9xqmD
 CbONcO4crUcBKI8gFtTnx6LaMPD4PVo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-RF9u_KHANEiwVOT_3lTaNg-1; Tue, 22 Jun 2021 22:11:06 -0400
X-MC-Unique: RF9u_KHANEiwVOT_3lTaNg-1
Received: by mail-qk1-f200.google.com with SMTP id
 e13-20020a37e50d0000b02903ad5730c883so665534qkg.22
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 19:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F54OXoXwR70UsmUMPD/yKEo6/VdT0h7kCGQqz5X1/pE=;
 b=J/K30QEfFPjNXjLmPncwSD64pi8lD9Ef/n8bPZhRG3oqlWMEY/6joZv2QJwe+t/E1s
 gCV2bro1K9mTq0UqhSLMgWj90TsWjJm3K4QX6FcDKoSqY2iRf9O+0P3NHzUrCixAe4UE
 d5SapILa2Uh+7nIzka+bssRgHBCA8Z6PhKNIDvhxUwNhsxNqrr+qQ27z+ukdJYmfn2ea
 ao18/w7qgabHTzUz/S46rBxvB7PWKJfRy2GcQZmR7f7PQW27I59DleSnbOb7huJZh4PF
 wbGkQgj8pdQHoy+jpMER3TYAz1WB0ac3ZdISgA5DFPkuh5HxaPKKjlrhuEI0Oc7NwDV7
 MdJw==
X-Gm-Message-State: AOAM532tT9DomXiIdLfr2VE54gpFrEjYonMkiyej5wcoAvIXVC/LK5Aj
 A4UhZ8LfaV2iWD8PwaEreXnkRxpNu6LkFjzsvy5CeGNt7y87cwNckew8eVunnCNS9xt06u9qXuJ
 2W6W+tyAvA2GzIlFuhO5qVU6wy1k=
X-Received: by 2002:a25:6986:: with SMTP id e128mr2022051ybc.366.1624414266099; 
 Tue, 22 Jun 2021 19:11:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2YVBT6oOYwRB9bnl8FpMbM7MgLsfb80Tq/aiYRq7ZKa5AVjdNvUCbRuYb2edX10SNMEC2hpQdqz31cpByqbg=
X-Received: by 2002:a25:6986:: with SMTP id e128mr2022033ybc.366.1624414265809; 
 Tue, 22 Jun 2021 19:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210622122538.402907-1-liwang@redhat.com>
 <877dim56go.fsf@suse.de>
In-Reply-To: <877dim56go.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Jun 2021 10:10:54 +0800
Message-ID: <CAEemH2d-XeK48WftdyYCiLhBWTnM=8X7Dd+abCa3894123N8TQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] mem: child alloc memory should larger than
 memory.max + memory.swap.max if lite==1
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
Content-Type: multipart/mixed; boundary="===============1565018277=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1565018277==
Content-Type: multipart/alternative; boundary="00000000000048370105c5656b5c"

--00000000000048370105c5656b5c
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for the review.

On Tue, Jun 22, 2021 at 10:17 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> Hello Li,
>
> Li Wang <liwang@redhat.com> writes:
>
> > oom03 often gets fail while setting 'memory.swap.max = TESTMEM' in
> CGroup V2,
> > as in that scenario (lite == 1), child_alloc only start a single process
> to
> > dirty 'TESTMEM + MB' anonymous memory for testing:
> >
> > testoom(, lite == 1, ,)
> >   oom(, lite == 1, ,)
> >     child_alloc(, lite == 1,)
> >         alloc_mem(TESTMEM + MB, )
> >
> >   mem.c:224: TINFO: start normal OOM testing.
> >   mem.c:146: TINFO: expected victim is 80466.
> >   mem.c:38: TINFO: thread (7f411c69d740), allocating 1074790400 bytes.
> >   mem.c:64: TINFO: swapped is 25546752 bytes.     <------- swap occuring
> -----
> >   mem.c:164: TFAIL: victim unexpectedly ended with retcode: 0, expected:
> 12
> >
> > TBH, this can not really test the 'memory.swap.max' as expected, since
> in the
> > kernel side mem_cgroup_out_of_memory split OOM margin into two-part, one
> for
> > memory.max limit, another for memory.swap.max, if any of them get
> overflow,
> > then invoke out_of_memory to kill victim-process.
> >
> > Theoretically, alloc_mem(TESTMEM + MB, ) should work while 'memory.max'
> is equal
> > to TESTMEM, but Cgroup v2 tracks memory and swap in separate, which
> splits memory
> > and swap counter. So with swappiness enable (default value is 60 on
> RHEL), it
> > likely has part of memory swapping out during the allocating, upon that
> the two
> > limit loss effect at the same time. Unless disable swap completely then
> memory.max
> > will take effect in precisely.
> >
> > To get more opportunities to reach the swap limitation, let's scale down
> the
> > value of 'memory.swap.max' to only 1MB for CGroup v2.
> >
> > But for CGroup v1, the memory.memsw.limit_in_bytes disallow to less than
> > memory.limit_in_bytes, so we'd better raise the child_alloc to the
> > twifold
>   ^twofold
> > of TESTMEM.
>
> Ah, this means "memory.swap.x" and "memory.memsw.x" are not really the
> same thing. This seems to be common pattern, so maybe we could translate
> V2 values to V1 in the library.
>

+1
We can consider doing that in a new separate patch. And better to check
more parameters to guarantee we have the correct understanding in use it:).


> If I understand correctly `memory.swap.max = memory.memsw.limit_in_bytes
> - memory.limit_in_bytes`? Also "max" can be mapped to ~0UL or maybe
> ~0ULL when -m32 is used.
>

From the definition, yes, the memory.memsw.limit_in_bytes parameter
represents the sum of memory and swap.


>
> This is not important for the current patch.
>
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >
> > Notes:
> >     v1 --> v2
> >        * add comments for explaining why set 'memory.swap.max' to 1MB
> >        * Scale down the value of 'memory.swap.max' to only 1MB for
> CGroup v2.
> >
> >  testcases/kernel/mem/lib/mem.c   |  2 +-
> >  testcases/kernel/mem/oom/oom03.c | 17 ++++++++++++++++-
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/testcases/kernel/mem/lib/mem.c
> b/testcases/kernel/mem/lib/mem.c
> > index 9f946b5c9..ac890491c 100644
> > --- a/testcases/kernel/mem/lib/mem.c
> > +++ b/testcases/kernel/mem/lib/mem.c
> > @@ -78,7 +78,7 @@ static void child_alloc(int testcase, int lite, int
> threads)
> >       pthread_t *th;
> >
> >       if (lite) {
> > -             int ret = alloc_mem(TESTMEM + MB, testcase);
> > +             int ret = alloc_mem(TESTMEM * 2 + MB, testcase);
> >               exit(ret);
> >       }
> >
> > diff --git a/testcases/kernel/mem/oom/oom03.c
> b/testcases/kernel/mem/oom/oom03.c
> > index 939413744..89d7711a5 100644
> > --- a/testcases/kernel/mem/oom/oom03.c
> > +++ b/testcases/kernel/mem/oom/oom03.c
> > @@ -46,7 +46,22 @@ static void verify_oom(void)
> >       testoom(0, 0, ENOMEM, 1);
> >
> >       if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
> > -             SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
> > +             /*
> > +              * Cgroup v2 tracks memory and swap in separate, which
> splits
> > +              * memory and swap counter. So with swappiness enable
> (default
> > +              * value is 60 on RHEL), it likely has part of memory
> swapping
> > +              * out during the allocating, upon that the two limit loss
> > +              * effect at the same time.
> > +              *
> > +              * To get more opportunities to reach the swap limitation,
> > +              * let's scale down the value of 'memory.swap.max' to only
> > +              * 1MB for CGroup v2.
> > +              */
> > +             if (TST_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
> > +                     SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu",
> MB);
> > +             else
> > +                     SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu",
> TESTMEM);
> > +
>
> To be consistent with V2; should this be TESTMEM + MB?
>

Yes, that should be better.


> >               testoom(0, 1, ENOMEM, 1);
> >       }
> >
> > --
> > 2.31.1
>
>
> --
> Thank you,
> Richard.
>
>

-- 
Regards,
Li Wang

--00000000000048370105c5656b5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Thanks for the review.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jun 22, 2021 at 10:17 PM Richard Pale=
thorpe &lt;<a href=3D"mailto:rpalethorpe@suse.de" target=3D"_blank">rpaleth=
orpe@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello Li,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; oom03 often gets fail while setting &#39;memory.swap.max =3D TESTMEM&#=
39; in CGroup V2,<br>
&gt; as in that scenario (lite =3D=3D 1), child_alloc only start a single p=
rocess to<br>
&gt; dirty &#39;TESTMEM + MB&#39; anonymous memory for testing:<br>
&gt;<br>
&gt; testoom(, lite =3D=3D 1, ,)<br>
&gt;=C2=A0 =C2=A0oom(, lite =3D=3D 1, ,)<br>
&gt;=C2=A0 =C2=A0 =C2=A0child_alloc(, lite =3D=3D 1,)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alloc_mem(TESTMEM + MB, )<br>
&gt;<br>
&gt;=C2=A0 =C2=A0mem.c:224: TINFO: start normal OOM testing.<br>
&gt;=C2=A0 =C2=A0mem.c:146: TINFO: expected victim is 80466.<br>
&gt;=C2=A0 =C2=A0mem.c:38: TINFO: thread (7f411c69d740), allocating 1074790=
400 bytes.<br>
&gt;=C2=A0 =C2=A0mem.c:64: TINFO: swapped is 25546752 bytes.=C2=A0 =C2=A0 =
=C2=A0&lt;------- swap occuring -----<br>
&gt;=C2=A0 =C2=A0mem.c:164: TFAIL: victim unexpectedly ended with retcode: =
0, expected: 12<br>
&gt;<br>
&gt; TBH, this can not really test the &#39;memory.swap.max&#39; as expecte=
d, since in the<br>
&gt; kernel side mem_cgroup_out_of_memory split OOM margin into two-part, o=
ne for<br>
&gt; memory.max limit, another for memory.swap.max, if any of them get over=
flow,<br>
&gt; then invoke out_of_memory to kill victim-process.<br>
&gt;<br>
&gt; Theoretically, alloc_mem(TESTMEM + MB, ) should work while &#39;memory=
.max&#39; is equal<br>
&gt; to TESTMEM, but Cgroup v2 tracks memory and swap in separate, which sp=
lits memory<br>
&gt; and swap counter. So with swappiness enable (default value is 60 on RH=
EL), it<br>
&gt; likely has part of memory swapping out during the allocating, upon tha=
t the two<br>
&gt; limit loss effect at the same time. Unless disable swap completely the=
n memory.max<br>
&gt; will take effect in precisely.<br>
&gt;<br>
&gt; To get more opportunities to reach the swap limitation, let&#39;s scal=
e down the<br>
&gt; value of &#39;memory.swap.max&#39; to only 1MB for CGroup v2.<br>
&gt;<br>
&gt; But for CGroup v1, the memory.memsw.limit_in_bytes disallow to less th=
an<br>
&gt; memory.limit_in_bytes, so we&#39;d better raise the child_alloc to the=
<br>
&gt; twifold<br>
=C2=A0 ^twofold<br>
&gt; of TESTMEM.<br>
<br>
Ah, this means &quot;memory.swap.x&quot; and &quot;memory.memsw.x&quot; are=
 not really the<br>
same thing. This seems to be common pattern, so maybe we could translate<br=
>
V2 values to V1 in the library.<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">+1=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-size:small">We can consider doing that in a new =
separate patch. And better to check</div><div class=3D"gmail_default" style=
=3D"font-size:small">more parameters to guarantee we have the correct under=
standing in use it:).</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If I understand correctly `memory.swap.max =3D memory.memsw.limit_in_bytes<=
br>
- memory.limit_in_bytes`? Also &quot;max&quot; can be mapped to ~0UL or may=
be<br>
~0ULL when -m32 is used.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">From the definition, yes, the memo=
ry.memsw.limit_in_bytes parameter represents the sum of memory and swap.</d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
This is not important for the current patch.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0v1 --&gt; v2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * add comments for explaining why set &#39;=
memory.swap.max&#39; to 1MB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Scale down the value of &#39;memory.swap.=
max&#39; to only 1MB for CGroup v2.<br>
&gt;<br>
&gt;=C2=A0 testcases/kernel/mem/lib/mem.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 testcases/kernel/mem/oom/oom03.c | 17 ++++++++++++++++-<br>
&gt;=C2=A0 2 files changed, 17 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib=
/mem.c<br>
&gt; index 9f946b5c9..ac890491c 100644<br>
&gt; --- a/testcases/kernel/mem/lib/mem.c<br>
&gt; +++ b/testcases/kernel/mem/lib/mem.c<br>
&gt; @@ -78,7 +78,7 @@ static void child_alloc(int testcase, int lite, int =
threads)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_t *th;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lite) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D alloc_mem=
(TESTMEM + MB, testcase);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D alloc_mem=
(TESTMEM * 2 + MB, testcase);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/o=
om/oom03.c<br>
&gt; index 939413744..89d7711a5 100644<br>
&gt; --- a/testcases/kernel/mem/oom/oom03.c<br>
&gt; +++ b/testcases/kernel/mem/oom/oom03.c<br>
&gt; @@ -46,7 +46,22 @@ static void verify_oom(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testoom(0, 0, ENOMEM, 1);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (SAFE_CGROUP_HAS(cg, &quot;memory.swap.ma=
x&quot;)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINTF(cg=
, &quot;memory.swap.max&quot;, &quot;%lu&quot;, TESTMEM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Cgroup v2 tracks m=
emory and swap in separate, which splits<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * memory and swap co=
unter. So with swappiness enable (default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * value is 60 on RHE=
L), it likely has part of memory swapping<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * out during the all=
ocating, upon that the two limit loss<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * effect at the same=
 time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * To get more opport=
unities to reach the swap limitation,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * let&#39;s scale do=
wn the value of &#39;memory.swap.max&#39; to only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1MB for CGroup v2.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_CGROUP_VER(cg=
, &quot;memory&quot;) !=3D TST_CGROUP_V1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SAFE_CGROUP_PRINTF(cg, &quot;memory.swap.max&quot;, &quot;%lu&quot;,=
 MB);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SAFE_CGROUP_PRINTF(cg, &quot;memory.swap.max&quot;, &quot;%lu&quot;,=
 TESTMEM);<br>
&gt; +<br>
<br>
To be consistent with V2; should this be TESTMEM + MB?<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes,=
 that should be better.</div></div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testoom(0, 1, EN=
OMEM, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.31.1<br>
<br>
<br>
-- <br>
Thank you,<br>
Richard.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000048370105c5656b5c--


--===============1565018277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1565018277==--

