Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4CBD990
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 10:09:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 994903C2082
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 10:09:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 40E833C17CE
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 10:09:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8208A60020C
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 10:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569398939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dc2r7Iw2UnZKefF2CkU5E9ZnkCHMbFxjeqn8mHFKysQ=;
 b=LtXsdaQOumbO41XJlufZtGonnlcMoocFvEY2uecShVHDgCwH9Gg6+hKudgZgbOVRgNK10d
 f+xCLh+DuP6kHmZfS1ydwFsAJ0VXFqOHpBl5hecgJPWL3rhcrcxIId6jqxn/6xe2WVOFqX
 kCx4bnCWKO1QWfDizfbHbE6mfqx28U0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-s7nhuH5vPgqvdCIQ8H8_UQ-1; Wed, 25 Sep 2019 04:08:57 -0400
Received: by mail-ot1-f69.google.com with SMTP id 9so2758249otc.21
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 01:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKWR5OCFzmSyRhno3TgLIJGqN6RQwPwq5DVqyQuqNVQ=;
 b=Rrus+xdSMzf+Wza1s+7tv424IkP8UPKNJG48w0hP7RTww9b9ddqPcGENhW0X158kj1
 E1zAbHuwxjYDIHdIQJZYDB8grT7bhVzjr0v6EvswIxGrEZD/d5nb8+luCnEtiHXIDif/
 xbK70BIh6aFRUejrFRRCpWWrQZJNxMOArLlelWHVIEYcEZZk6BhlPnkbebdYHuF9QJeA
 qtvpR0wWYBGAbm4c19vqUkPDr4psftYWpAeSI2hCpw69Dhdjtdt2mkH8LjYQXLEVj6Td
 f6wDx6FvUipxAkDPdVJkdLyg1FIvLd9evjkeVlgsEYMyDoDYGJg2yxfLaVSitvJ83BG6
 B58Q==
X-Gm-Message-State: APjAAAUdB8Z78w3EcI6FbbHvippL0q97ER0PQE6MdnnDbWkhlOZ1ArlP
 YvM6Wu+qrsIfRNzbTJKnDNQ/7mHAjO03Cfp0fNu22wM9+TLQu+ZoUCh/7fOrRNwVOtqiDBNskPu
 qpFI4WWpsFrnjJMWFUwHk6SdTsFw=
X-Received: by 2002:aca:4a0b:: with SMTP id x11mr3460023oia.138.1569398937231; 
 Wed, 25 Sep 2019 01:08:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycgTykIqgy6LkGiPDqNvO1qDlev+CtySXa9wLRutnPRhK00eq0wxHZxvIaCdb1IOIDHU6WOxVZJ7H4n1fKXTw=
X-Received: by 2002:aca:4a0b:: with SMTP id x11mr3460012oia.138.1569398936901; 
 Wed, 25 Sep 2019 01:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
In-Reply-To: <87wodxkgr4.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 25 Sep 2019 16:08:45 +0800
Message-ID: <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: s7nhuH5vPgqvdCIQ8H8_UQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1853472851=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1853472851==
Content-Type: multipart/alternative; boundary="0000000000002565ae05935c2aeb"

--0000000000002565ae05935c2aeb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Tue, Sep 24, 2019 at 8:42 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> ...
> It can just be
>
> if (!pair->exit) {
>    ...
> }
>
> We want to join the thread and set the func pointer to zero regardless
> of how we exit.
>

OK.


>
> > +                     SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
> > +                     pair->thread_b =3D 0;
> > +             } else {
>
> I suggest still setting pair->exit here and maybe sleeping for
> 100ms. This gives thread B chance to exit gracefully. It is possible
> that if thread B is in a spin loop then the thread won't be cancelled as
> asynchronous cancellation is not guaranteed by POSIX.
>

Good suggestion. That'd be better to give one more time for thread B
exiting gracefully.


> > +                     pthread_cancel(pair->thread_b);
> > +                     pair->thread_b =3D 0;
> > +             }
> >       }
> >  }
> >
> > @@ -271,8 +276,11 @@ static void tst_fzsync_pair_reset(struct
> tst_fzsync_pair *pair,
> >       pair->a_cntr =3D 0;
> >       pair->b_cntr =3D 0;
> >       pair->exit =3D 0;
> > -     if (run_b)
> > +     if (run_b) {
> > +             pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> > +             pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
>
> These need to go inside thread B unless I am mistaken. Which means you
>

Right.


> must wrap the user supplied function. You can create a function which
> accepts a pointer to some contiguous memory containing the user supplied
> function
> pointer and the user supplied arg pointer.
>

Since you have fixed the function format of thread B as void *(*run_b)(void
*) in tst_fzsync_pair_reset(), which means we have no need to take care of
the function arg pointer anymore.

So just like what I did in V2, the wrapper function could steal the real
run_b address from pthread_create(..., wrap_run_b, run_b) parameter.

--=20
Regards,
Li Wang

--0000000000002565ae05935c2aeb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Sep 24, 2019 at 8:42 PM Richard Pale=
thorpe &lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail_default" style=3D"font-size:small">...</span><br>
It can just be<br>
<br>
if (!pair-&gt;exit) {<br>
=C2=A0 =C2=A0...<br>
}<br>
<br>
We want to join the thread and set the func pointer to zero regardless<br>
of how we exit.<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">OK.</div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SAFE_PTHREAD_JOIN(pair-&gt;thread_b, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pair-&gt;thread_b =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
<br>
I suggest still setting pair-&gt;exit here and maybe sleeping for<br>
100ms. This gives thread B chance to exit gracefully. It is possible<br>
that if thread B is in a spin loop then the thread won&#39;t be cancelled a=
s<br>
asynchronous cancellation is not guaranteed by POSIX.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Good =
suggestion. That&#39;d be better to give one more time for thread B exiting=
 gracefully.</div></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pthread_cancel(pair-&gt;thread_b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pair-&gt;thread_b =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -271,8 +276,11 @@ static void tst_fzsync_pair_reset(struct tst_fzsy=
nc_pair *pair,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;a_cntr =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;b_cntr =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;exit =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (run_b)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (run_b) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_setcanceltype=
(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_setcancelstat=
e(PTHREAD_CANCEL_ENABLE, NULL);<br>
<br>
These need to go inside thread B unless I am mistaken. Which means you<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">Right.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
must wrap the user supplied function. You can create a function which<br>
accepts a pointer to some contiguous memory containing the user supplied fu=
nction<br>
pointer and the user supplied arg pointer.<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">Since you have f=
ixed the function format of thread B as void *(*run_b)(void *) in tst_fzsyn=
c_pair_reset(), which means we have no need to take care of the function ar=
g pointer anymore.</div><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">So just like what I did in V2, the wrapper function could ste=
al the real run_b address from pthread_create(..., wrap_run_b, run_b) param=
eter.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--0000000000002565ae05935c2aeb--


--===============1853472851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1853472851==--

