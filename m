Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AABFFBDB4F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:43:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AE333C207A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:43:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B17303C14F6
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:43:22 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2D3731A00FB0
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569404599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVrLAkE9YbIZz9cUtj1EFfOTH+w1tAWEzAEmnKLaUzU=;
 b=gV+pqizn9c+pbpZ2DbSgzZ939LPLTvDVzmRt97lTJDdEwBQmcrghO8Te+uC2kAjCXLHv7R
 +1luVctB0bHMANzxphH84yO9WpXUO7feQB1pWRaVs6xp0X6jK0+fhFVKcwBNQNbUg2AnFI
 A3SBTzFdd/o6179wmzgeblg+MT5zpYk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-w2SHgav6MG-9Mg-C-lX0Sg-1; Wed, 25 Sep 2019 05:43:17 -0400
Received: by mail-oi1-f198.google.com with SMTP id x125so2750788oig.7
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 02:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWCvYrv5X8t99AnrmE/GI21N1xIDNrCC6Bd9jllSSIY=;
 b=BXtT2ujyFeoL0JfZq6NpJ9SMPoDv23Ir4uZl7p9WAk3TnvBYTlmeyNDyCfV0jR/KgH
 IIIIls2Sk92nLIiuTvlhLX5tPac1CqAREcgNbmkIiVderdqdro63HeMH7JzFaMlHwzkK
 4Uh8GUBTevksmwKGSTc0244R0XH3h+tqhtk/NyuPvebS9Fi9VngW8dWkG1s7kvZbAFUm
 VAN51dsAP9P8uFpS40z9/wcUKDfO9JbDHhfvO6P2DxyfjXuRO6hgaSN5K8tTtVY1oDsN
 iqSdVhi4R6snIMwZH4tLlc8B1RvscuQg8F30HOYROGNlnqKa2WAXHhYw+suhfgqFfx9E
 X4Vw==
X-Gm-Message-State: APjAAAXds94k9hQx6gfGRjQXX9gr98+x78nsjHvyhSlK0El9CwILrsPT
 62jY0GnjDeHo3d81bQCcPIBj7gEp6JbVz5Kxdkvfsod7ld0v+ReV7qP51Sbz5e9itrTmTH5YKYN
 vr+E3za+zu/IacLq7SWteXa45hKQ=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr5455094otm.264.1569404597003; 
 Wed, 25 Sep 2019 02:43:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8XbHznAwZLGF0/dKX/MnoiRGEMGX3SmzxJdrksOkRmhUmil0V9wzZKwkZt0a4JE5inmksDmtLY62qzgTHecU=
X-Received: by 2002:a9d:7841:: with SMTP id c1mr5455080otm.264.1569404596777; 
 Wed, 25 Sep 2019 02:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
 <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
 <87ef04ycxv.fsf@rpws.prws.suse.cz>
In-Reply-To: <87ef04ycxv.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Sep 2019 17:43:05 +0800
Message-ID: <CAEemH2fmTHzWh=dnzFfPCrJ8-3WuXUHa_VheGj73WjcJfuiwKA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: w2SHgav6MG-9Mg-C-lX0Sg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] fzsync: revoke thread_b if parent hits an
 accidental break
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============1725343347=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1725343347==
Content-Type: multipart/alternative; boundary="00000000000080138005935d7b98"

--00000000000080138005935d7b98
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Palethorpe <rpalethorpe@suse.de> wrote:

>> must wrap the user supplied function. You can create a function which
> >> accepts a pointer to some contiguous memory containing the user suppli=
ed
> >> function
> >> pointer and the user supplied arg pointer.
> >>
> >
> > Since you have fixed the function format of thread B as void
> *(*run_b)(void
> > *) in tst_fzsync_pair_reset(), which means we have no need to take care
> of
> > the function arg pointer anymore.
>
> I think the function pointer signature would be 'void *(*run_b)(void)'
> not 'void *(*run_b)(void *)'.
>

Hmm, but at least we should respect the pthread_create()? It requires the
function prototype is ''void *(*func)(void *)'.

       int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                          void *(*start_routine) (void *), void *arg);

We could unuse the arg in thread B, but declare the function prototype with
parameter "void *" is no harm.


> I doubt any test would need the arg though, because we only use one
> thread and can store parameters in global variables. So you could remove
> it and update the tests.
>
> The user might need that arg if they are starting many threads, but for
> now we don't have explicit support for that in the library.
>

Maybe we just need to note that in the lib document.


> >
> > So just like what I did in V2, the wrapper function could steal the rea=
l
> > run_b address from pthread_create(..., wrap_run_b, run_b) parameter.
>
>
> --
> Thank you,
> Richard.
>


--=20
Regards,
Li Wang

--00000000000080138005935d7b98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@su=
se.de">rpalethorpe@suse.de</a>&gt; wrote:<br></div><div dir=3D"ltr" class=
=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;&gt; must wrap the user supplied function. You can create a function wh=
ich<br>
&gt;&gt; accepts a pointer to some contiguous memory containing the user su=
pplied<br>
&gt;&gt; function<br>
&gt;&gt; pointer and the user supplied arg pointer.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Since you have fixed the function format of thread B as void *(*run_b)=
(void<br>
&gt; *) in tst_fzsync_pair_reset(), which means we have no need to take car=
e of<br>
&gt; the function arg pointer anymore.<br>
<br>
I think the function pointer signature would be &#39;void *(*run_b)(void)&#=
39;<br>
not &#39;void *(*run_b)(void *)&#39;.<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Hmm, but at least we =
should respect the pthread_create()? It requires the function=C2=A0prototyp=
e is &#39;&#39;void *(*func)(void *)&#39;.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div>=C2=A0 =C2=A0 =C2=A0 =C2=A0int pthrea=
d_create(pthread_t *thread, const pthread_attr_t *attr,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 void *(*start_routine) (void *), void *arg);<br></div><div>=C2=A0</div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">We could unuse =
the arg in thread B, but declare the function prototype with parameter &quo=
t;void *&quot; is no harm.</div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
I doubt any test would need the arg though, because we only use one<br>
thread and can store parameters in global variables. So you could remove<br=
>
it and update the tests.<br>
<br>
The user might need that arg if they are starting many threads, but for<br>
now we don&#39;t have explicit support for that in the library.<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Maybe we just need to note that in the lib document.</div></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; So just like what I did in V2, the wrapper function could steal the re=
al<br>
&gt; run_b address from pthread_create(..., wrap_run_b, run_b) parameter.<b=
r>
<br>
<br>
--<br>
Thank you,<br>
Richard.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000080138005935d7b98--


--===============1725343347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1725343347==--

