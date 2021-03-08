Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B02330E9C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 13:46:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72F1F3C5576
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 13:46:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BD80A3C176A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 13:45:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 1BA0210004BA
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 13:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615207555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mz4Q4UX6hgposowKtWNJdDYGRd0R+ATgO8gNs6UGFG0=;
 b=TI3F4Y34Dpw5SDsYMGK7Ceyl9Qno4NLozW9WAjazayowbS2VUMQCAzVRC2eozCgX4RlXHJ
 IbHnL9sPUM4Ka/0N4KG/QWbyoULdoZ3yMRdNixRTQZ8eeuA4An+7gBd9p14zLtFE5xOMJP
 kY06ITGuicK/Uu92EbStBOuOA4qn7qo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-2YGAx541NqCazXLjfTkMCA-1; Mon, 08 Mar 2021 07:45:53 -0500
X-MC-Unique: 2YGAx541NqCazXLjfTkMCA-1
Received: by mail-yb1-f199.google.com with SMTP id l3so12698311ybf.17
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 04:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mz4Q4UX6hgposowKtWNJdDYGRd0R+ATgO8gNs6UGFG0=;
 b=pN5h7vkzm0svF3OyWP5gTlZza7flfM0f0FU7tkaoa7igbF4tFHH3pp69W+S7tYpGta
 N+kAE64Ach5xEuF7hAK8fCplKtOQpMIOW4UqTsVQHGIkqr20pe0BzAY85ufBur1e3AUO
 1VTX0Ru8g4xmRfQvdWEhi7qwJdCOLpdo6PF0McSmqj3v4b66qUhSxSaI22E4jee7YPx3
 TWKnd2rCtQs2ogAIzfINaLbWUajaENSE2MHtEXBTFyaWA6yrHxf4Lp9rrMryMEJYyfX5
 nLVM07F284QtCmUAMV03ok4RUUAqFgdt+l62lKwYVp6npbYV/X+/PPeEsqwz3QT6X8DC
 y2ZQ==
X-Gm-Message-State: AOAM533C88BmQC7jT68t26DCVqwsZm1Va+qzBdIoSFiZvBNX0sxUaZGQ
 i7VSLfx3Zu8ZH3iwAPLWXfPRQKmsOOOwW4OToKaCthcNeJxAs7DfQl7X1ocTLMY5k0ghJvOMtqG
 enUDAFzeIcnYMXcoE+qIQfMb1r7s=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr32303430ybh.110.1615207551851; 
 Mon, 08 Mar 2021 04:45:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7yLj32vlI+y9KJe3y0qhkuBDL72ZqBpAFVpebFlA+pmwHbqGVTFni4OWBeNB9NxM8ZSBd1ZSMjKVQ/VHvC+Q=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr32303406ybh.110.1615207551636; 
 Mon, 08 Mar 2021 04:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
 <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
 <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
 <CAEemH2eKkGokVY2ZBs=U9eqDrDZVB5qKBVUApULrdL65tfnmLQ@mail.gmail.com>
 <20210308114859.tskerybpt6xtyffa@vireshk-i7>
In-Reply-To: <20210308114859.tskerybpt6xtyffa@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 20:45:40 +0800
Message-ID: <CAEemH2cKX4Gh1tO2WL27WrnF7KLFu33rksFf+LWRZz6ZNExAOQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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
Content-Type: multipart/mixed; boundary="===============1348930088=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1348930088==
Content-Type: multipart/alternative; boundary="0000000000005abd4005bd05d0b2"

--0000000000005abd4005bd05d0b2
Content-Type: text/plain; charset="UTF-8"

Viresh Kumar <viresh.kumar@linaro.org> wrote:

...
>
> Option 3: Same as option 2 but different formatting
>
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> successive readings is reasonable for following variants:
>         - vDSO or syscall with libc spec
>         - syscall with old kernel spec
>         - vDSO with old kernel spec
>         - gettimeofday

Any other option here ?
>

I think no.

>
> For the FAIL messages, I think just adding tv->desc is good enough.
>

+1, I prefer to go with Option3 + 'tv->desc for FAIL'.

Would you mind formatting a patch, or I can do that?

-- 
Regards,
Li Wang

--0000000000005abd4005bd05d0b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lin=
aro.org">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><div dir=3D"ltr" c=
lass=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
Option 3: Same as option 2 but different formatting<br>
<br>
clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between successiv=
e readings is reasonable for following variants:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - vDSO or syscall with libc spec<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - syscall with old kernel spec<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - vDSO with old kernel spec<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - gettimeofday</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
Any other option here ?<br></blockquote><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I think no.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
For the FAIL messages, I think just adding tv-&gt;desc is good enough.<br><=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">+1,=C2=A0<span class=3D"gmail_default">I prefer to go with Option3 +=
 &#39;tv-&gt;desc for FAIL&#39;.</span>=C2=A0</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Would you mind formatting a patch, or I can do that?</=
div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--0000000000005abd4005bd05d0b2--


--===============1348930088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1348930088==--

