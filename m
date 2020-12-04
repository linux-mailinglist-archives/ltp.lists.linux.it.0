Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B83732CE66C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 04:21:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70CE23C58FD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 04:21:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 793AB3C4CAD
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 04:21:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1559B60055D
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 04:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607052099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MI2Q+CkjHlzAYLXYjN7G4XsCZTOa0ifi6ttQWH7B8E=;
 b=caVee8HOEVFAohJs/kIRon13u+QVjt9T5OKU0PWgryqQko06/PXBZKPWULi0lqyVzlPThN
 gEx4ug0rb51weCdooZmH8BYALBkEceR4sFj22zSxkmRTtxQat3q5ExyAjgfRz7Vu8U4/Si
 RKVj5euMn/P6DknPwcqlmCuSgsoTn0s=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-fgOdKuemO8Wpr-HpV9vfjg-1; Thu, 03 Dec 2020 22:21:37 -0500
X-MC-Unique: fgOdKuemO8Wpr-HpV9vfjg-1
Received: by mail-yb1-f199.google.com with SMTP id v13so5140064ybe.18
 for <ltp@lists.linux.it>; Thu, 03 Dec 2020 19:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1MI2Q+CkjHlzAYLXYjN7G4XsCZTOa0ifi6ttQWH7B8E=;
 b=T7wdaCrBXMpQpv7muIsD3jderw4M53uiOWWDiQDDBk69PSBzUYodI/l9SzJIU+0Tvg
 wO1PrVW5PD97lE3KVTEUtjlGbDVvvAUOyIpKLWwvvdznF3l4voAZdKjJoKWM4UkLHpCk
 aY9W9sp3bAbKuJowaH+sIvWOyBRyBEhWAhrRqz8zowxmz1Hm6oxMxQOS4/aHT9iF2dhW
 OjkWYn+0dyrqsuv0GNHQW7a6wp7qT/T2L/fCaLcLRaOMY5CJISoHP3GTxCiq2IRWXXw7
 AgbF4PFK7X6ITFjr988mY6n6JYxQOYA/kJ2pXFAqtG2RyqvXE8S/AS5qg3vpYn+RuU2U
 ykXA==
X-Gm-Message-State: AOAM5302f/bCDI974HsdrJOBn2pbbgEUKcDrSTcelAe37xHhYrRO9H6M
 s/xS9yiz7ld5dexahiCV4a5+4A10e5EcBT4pxxTg3EcJCSdegKxa9W3SSS45ewcbXbV8hNDa+uB
 GpkzSDnGKn8fIsSQwKONShPdWxM8=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr3317759ybs.252.1607052096507; 
 Thu, 03 Dec 2020 19:21:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpMwjGHDp+PRWVr4A5UguaxDdH9d45uKVUzXAxw4hySDQ2O2RInsAQYhTrMWJzdwSKzE8nms6coKLiqNDBApU=
X-Received: by 2002:a05:6902:50e:: with SMTP id
 x14mr3317744ybs.252.1607052096311; 
 Thu, 03 Dec 2020 19:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20201203152804.846-1-chrubis@suse.cz>
 <20201203152804.846-2-chrubis@suse.cz>
In-Reply-To: <20201203152804.846-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 4 Dec 2020 11:21:24 +0800
Message-ID: <CAEemH2dY2ZJhJ6iqA7mUDSyPO5t+i06rC4iZ6HJhs33DxXM74Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] libnewipc: Add get_ipc_timestamp()
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
Content-Type: multipart/mixed; boundary="===============2106686219=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2106686219==
Content-Type: multipart/alternative; boundary="0000000000005630d905b59af9bc"

--0000000000005630d905b59af9bc
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

On Thu, Dec 3, 2020 at 11:27 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> That returns timestamps that should return values comparable to the
> stime/rtime/ctime.
>
> From Thomas Gleixner:
>
> > Due to the internal implementation of ktime_get_real_seconds(), which is
> > a 2038 safe replacement for the former get_seconds() function, this
> > accumulation issue can be observed. (time(2) via syscall and newer
> > versions of VDSO use the same mechanism).
> >
> >      clock_gettime(CLOCK_REALTIME, &ts);
> >      sec = time();
> >      assert(sec >= ts.tv_sec);
> >
> > That assert can trigger for two reasons:
> >
> >  1) Clock was set between the clock_gettime() and time().
> >
> >  2) The clock has advanced far enough that:
> >
> >     timekeeper.tv_nsec + (clock_now_ns() - last_update_ns) > NSEC_PER_SEC
> > The same problem exists for CLOCK_XXX vs. CLOCK_XXX_COARSE
> >
> >      clock_gettime(CLOCK_XXX, &ts);
> >      clock_gettime(CLOCK_XXX_COARSE, &tc);
> >      assert(tc.tv_sec >= ts.tv_sec);
> >
> > The _COARSE variants return their associated timekeeper.tv_sec,tv_nsec
> > pair without reading the clock. Same as #2 above just extended to clock
> > MONOTONIC.
>
> Which means the timestamps in the structure we get from msg* calls can
> be 1 second smaller that timestamps returned from realtime timers.
>
> However it also means that the _COARSE timers should be the same as the
> SysV timestamps and could be used for these tests instead. Also these
> timers should be available since 2.6.32 which is old enough to assume
> that they are present.
>

Sounds reasonable. From Thomas's analysis, it seems the *_COARSE
can work for us, so I'm OK to go with this way to fix.

For series:
Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000005630d905b59af9bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 11:27 PM Cyril Hrubis =
&lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Tha=
t returns timestamps that should return values comparable to the<br>
stime/rtime/ctime.<br>
<br>
From Thomas Gleixner:<br>
<br>
&gt; Due to the internal implementation of ktime_get_real_seconds(), which =
is<br>
&gt; a 2038 safe replacement for the former get_seconds() function, this<br=
>
&gt; accumulation issue can be observed. (time(2) via syscall and newer<br>
&gt; versions of VDSO use the same mechanism).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 clock_gettime(CLOCK_REALTIME, &amp;ts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sec =3D time();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(sec &gt;=3D ts.tv_sec);<br>
&gt;<br>
&gt; That assert can trigger for two reasons:<br>
&gt;<br>
&gt;=C2=A0 1) Clock was set between the clock_gettime() and time().<br>
&gt;<br>
&gt;=C2=A0 2) The clock has advanced far enough that:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0timekeeper.tv_nsec + (clock_now_ns() - last_update_=
ns) &gt; NSEC_PER_SEC<br>
&gt; The same problem exists for CLOCK_XXX vs. CLOCK_XXX_COARSE<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 clock_gettime(CLOCK_XXX, &amp;ts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 clock_gettime(<span class=3D"gmail_default" style=
=3D"font-size:small"></span>CLOCK_XXX_COARSE, &amp;tc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(tc.tv_sec &gt;=3D ts.tv_sec);<br>
&gt;<br>
&gt; The _COARSE variants return their associated timekeeper.tv_sec,tv_nsec=
<br>
&gt; pair without reading the clock. Same as #2 above just extended to cloc=
k<br>
&gt; MONOTONIC.<br>
<br>
Which means the timestamps in the structure we get from msg* calls can<br>
be 1 second smaller that timestamps returned from realtime timers.<br>
<br>
However it also means that <span class=3D"gmail_default" style=3D"font-size=
:small"></span>the _COARSE timers should be the same as the<br>
SysV timestamps and could be used for these tests instead. Also these<br>
timers should be available since 2.6.32 which is old enough to assume<br>
that they are present.<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Sounds reasonable. From Thomas&#39;s=
 analysis, it seems=C2=A0<span class=3D"gmail_default"></span>the *_COARSE<=
/div><div class=3D"gmail_default" style=3D"font-size:small">can work for us=
, so I&#39;m OK to go with this way to fix.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-size:=
small">For series:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_b=
lank">liwang@redhat.com</a>&gt;</div></div><div>=C2=A0</div></div>-- <br><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--0000000000005630d905b59af9bc--


--===============2106686219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2106686219==--

