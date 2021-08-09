Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E123E3E9D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 06:03:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E84E03C73C5
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 06:03:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64E363C19EF
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 06:03:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EBCFA200AD7
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 06:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628481810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7KpQ8d/UsjQDn0BnaXKVgjW/bZmOpOte7AZzRJI+hWo=;
 b=asQMxyPipPZ85/rABlb/sNcP6M47QwMeLWuq23QXSjVRwD2Ax5+bvEbVKvU/uUuwdtN5J2
 Jp+vKJ/S6C5yrfOK52QmMq+X6AGVRw3ayYhf998eRqcz5AP6KJiwrq/cRnoIzEyHkRTcGf
 r5FKHBe99I4OoI+S/Cz0UvZpsbBINV8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-YpJ1-O-4NVibD0lS12ptBw-1; Mon, 09 Aug 2021 00:03:27 -0400
X-MC-Unique: YpJ1-O-4NVibD0lS12ptBw-1
Received: by mail-yb1-f198.google.com with SMTP id
 c19-20020a25c0130000b029059337c4e310so9170474ybf.3
 for <ltp@lists.linux.it>; Sun, 08 Aug 2021 21:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KpQ8d/UsjQDn0BnaXKVgjW/bZmOpOte7AZzRJI+hWo=;
 b=SHoGlqjdtUnMeGfUvdZvBir5Trdw2v+X52IStntp4Gup0XnCRuPKbwJVOU4HUvayKt
 TPj9pwKco9DE+j+rQHNeyhmLf62RhcWGrOg5daYptpHb2S0IhxlTYcHEyHK8tAjARjq3
 xiqWHr1p7Dc0gNt/wbjHPSh6aiTbyEtkzAcKOwq9Z/iBvViYphmSDHbuZ86A179HQLu5
 QBNPHXO+TgKTnC0qi8VrC3ObvwvtFralQGEvXdqCzinJFW0chkEzj9jl7e1xLNAWPgau
 TYYlJKG0Ww5xZM0+AC0LR/n4o/J9l3cF4r7cq+XTnbrXDMU9S50ubAGrdTqha/3TZQTL
 pKPw==
X-Gm-Message-State: AOAM531uJGYL2bjKVAa65M8C3J4bDFoAOHcnpOaxL66IFMocpsZyVeeu
 laRVC+sLVyCqY9EEb12KbMJjImrFIJUXYZyug/rqILa9NirThUeMMSVXk73WmmoW4DPt537Bwn8
 wctptszVYb8tZRY0Y10uFzC+zgJ0=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr28315506ybc.252.1628481807165; 
 Sun, 08 Aug 2021 21:03:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7rdJOAeIJ1i64Aw41vkvSc7IbNf11Dh+bUNCZuqN0pbPxmJv/zMDwRf9y03tADvQ3b7t8Zm6lMTfkp2q2vIQ=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr28315488ybc.252.1628481806911; 
 Sun, 08 Aug 2021 21:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik> <YQzOxg35JjpDOj7X@pevik>
 <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
 <YQ0C1givEZ8/H7hN@pevik>
 <CAEemH2eCbTeTziGetR-mBRP9rB=0S2CvZNuDv-3DehksKUyu8A@mail.gmail.com>
 <874kc2n8tx.fsf@suse.de>
In-Reply-To: <874kc2n8tx.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Aug 2021 12:03:15 +0800
Message-ID: <CAEemH2dXGdWoA1CLoxYnVkkN1pNL3mZzU4XU=zwX_1dvpK9RcA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
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
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Content-Type: multipart/mixed; boundary="===============1664649948=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1664649948==
Content-Type: multipart/alternative; boundary="0000000000009fdfd605c9187798"

--0000000000009fdfd605c9187798
Content-Type: text/plain; charset="UTF-8"

Hi Richard,


> >> I'd be for adding it there, with comment why it's there. We can prevent
> >> problems
> >> with failing another test in the future. (+ remove it from both tests).
> >>
> >
> > I'm OK with this fix.
> >
> > @Cyril, @Richard, what do you think? any other thoughts?
>
> We need to clean up our headers, which is a bigger problem. Most tests
> do not need all the stuff in tst_test.h. It is just a load of unecessary
> work.
>

Yes, I agree. It benefits for long-term maintenance of LTP.
So maybe a good start is to be more strict in review new
patches especially on the includes header check.


>
> Cleaning up the headers is a big challenge. It would be easier if we
> know what will break older distros. So I suggest adding something like:
>
> #ifdef _X_H
> # error "You should include X before Y ..."
> #endif
>
>
Hmm, it's right, but I'm afraid we have to define that in many places
because include headers are sometimes dispersive or singly.

I.e.

We need to define the above hint duplicated for everywhere if includes
the <netinet/in.h>, to avoid include <linux/in.h> before it. This will
look a bit messy I feel.

$ git grep netinet/in.h
lapi/netinet_in.h:#include <netinet/in.h>
old/old_safe_net.h:#include <netinet/in.h>
safe_net_fn.h:#include <netinet/in.h>
tst_net.h:#include <netinet/in.h>
tst_safe_net.h:#include <netinet/in.h>


> to one or more headers.
>
> Otherwise I'm fine with the above solution as a "temporary" fix.
>


-- 
Regards,
Li Wang

--0000000000009fdfd605c9187798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><div class=3D"gmail_quote"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; I&#39;d be for adding it there, with comment why it&#39;s there. W=
e can prevent<br>
&gt;&gt; problems<br>
&gt;&gt; with failing another test in the future. (+ remove it from both te=
sts).<br>
&gt;&gt;<br>
&gt;<br>
&gt; I&#39;m OK with this fix.<br>
&gt;<br>
&gt; @Cyril, @Richard, what do you think? any other thoughts?<br>
<br>
We need to clean up our headers, which is a bigger problem. Most tests<br>
do not need all the stuff in tst_test.h. It is just a load of unecessary<br=
>
work.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Yes, I agree. It benefits=C2=A0for long-term maintena=
nce of LTP.</div></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">So maybe a good start is to be more strict in review new</div><div class=
=3D"gmail_default" style=3D"font-size:small">patches especially on the incl=
udes header check.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Cleaning up the headers is a big challenge. It would be easier if we<br>
know what will break older distros. So I suggest adding something like:<br>
<br>
#ifdef _X_H<br>
# error &quot;You should include X before Y ...&quot;<br>
#endif<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Hmm, it&#39;s right, but I&#39;m afraid we have to define that =
in many places</div><div class=3D"gmail_default" style=3D"font-size:small">=
because include headers are sometimes=C2=A0dispersive or singly.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">I.e.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">We need to define the above hint duplicated for everyw=
here if=C2=A0includes<br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">the &lt;netinet/in.h&gt;, to avoid include &lt;linux/in.h&gt; be=
fore it. This will</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">look a bit messy I feel.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">$ git grep netinet/in.h<br>lapi/netinet_in.h:#include &lt;netinet/in.h&=
gt;<br>old/old_safe_net.h:#include &lt;netinet/in.h&gt;<br>safe_net_fn.h:#i=
nclude &lt;netinet/in.h&gt;<br>tst_net.h:#include &lt;netinet/in.h&gt;<br>t=
st_safe_net.h:#include &lt;netinet/in.h&gt;<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
to one or more headers.<br>
<br>
Otherwise I&#39;m fine with the above solution as a &quot;temporary&quot; f=
ix.<br></blockquote><div>=C2=A0</div><div><br></div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000009fdfd605c9187798--


--===============1664649948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1664649948==--

