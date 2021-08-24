Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 500713F5915
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 09:35:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD8A43C31CB
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 09:35:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 583F43C30C8
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 09:35:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 74D5B1000D2B
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 09:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629790536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02Q057LLr7drVKcmILtOeCIMTQNgbGXF93UJ1TmynnY=;
 b=J1FhKxl1ySsSySC9Mu6dzBFHaK99WDkMhnpEWWFh0BWtMjnja5fr5dv/vC0wp3HH/HmoQt
 fyc8aaXIebgGlArB/90QgYY6+O4ifQiUAR4kgXWWe8zVzqBCvy5eLhkRF2lrFqDBUWgqk6
 AmT5qr9j+SrRe6tFQcFb4KjVp4do2uY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-TraiewElMXOJQ7FNSVKnxw-1; Tue, 24 Aug 2021 03:35:33 -0400
X-MC-Unique: TraiewElMXOJQ7FNSVKnxw-1
Received: by mail-yb1-f198.google.com with SMTP id
 e137-20020a25698f000000b0059b84c50006so697778ybc.11
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 00:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02Q057LLr7drVKcmILtOeCIMTQNgbGXF93UJ1TmynnY=;
 b=jwW2v/8VL0UbJCsLTKMO7JyJastilLaPoNM8LNyz6UqCWSeBknmjDZcAzYWa07cBzR
 jOEkEUOHT4pR+OsnwOhkoRyhkvzF7agPI7iNplds+8WavVMHvlhaTDyxIORusEOd7RLK
 dA/l/dNmqTBvd/XywNOn096Egf9yWEIzq+TQWHmKBM+QADnWlNncyvWIO1J4KgnRbZhF
 Ns/TA+258/GpXDm2f2tsBa2Uzyc0RjR+kKOwSdy16VEC1I/9ygd/F+wTNE9U1u3IdWm8
 mM1LUnsKbrX1pzbEj7uPyErompqeo1iEthiGz8ALuDERb2Xa2hJ4J/zhEHU9h2q8xhjU
 6xrA==
X-Gm-Message-State: AOAM5304g4tKk8/9WQOXJ3SWaTuXYUKPLldoo0JHw2sBmnrW+penGt1d
 wVRJ8GNoPKA/ug4vk0V5tObiWnCj8/ourtZGuhSa7pS9VdzcbnBQXSNkRHKhJlzwIs0GQd1iAqG
 IUojHtJJew+Y1qfbRJ5hN1QZ2BAQ=
X-Received: by 2002:a25:9d83:: with SMTP id v3mr46968081ybp.97.1629790532749; 
 Tue, 24 Aug 2021 00:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlSu3vTj+ojCuUsqvDofLvpGwDIvCpvVGX9G3NzMdP2kxaC2S5ydk0oiui3g/BM7MD51mRwK3W6gMEvxr2vAU=
X-Received: by 2002:a25:9d83:: with SMTP id v3mr46968062ybp.97.1629790532526; 
 Tue, 24 Aug 2021 00:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210823150520.25614-1-chrubis@suse.cz>
 <20210823150520.25614-2-chrubis@suse.cz>
In-Reply-To: <20210823150520.25614-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Aug 2021 15:35:20 +0800
Message-ID: <CAEemH2dYcF=N3F=MZXPVLgBHBa3Xt=iT8ACeQ4_9THXu-kyYtA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/3] tst_test_macros: Fix TST_EXP_*() default
 message
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
Content-Type: multipart/mixed; boundary="===============0081262829=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0081262829==
Content-Type: multipart/alternative; boundary="000000000000bff9d105ca492d3e"

--000000000000bff9d105ca492d3e
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 11:05 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> We have to erase the last comma because otherwise we pass down one more
> empty parameter to the TST_EXP_*_() macros which then causes the FMT
> string to be empty and we end up with an empty default message.
>


Patchset looks good from the code layer though it is a bit complicate
in 2/3 stringify handling, but that should be acceptable.

My only hesitating is about ##__VA_ARGS__, because it says that is still
as GNU's extension but have not got into standard C.

So I especially run with GitHub CI and got pretty compiling results, then I
have
a positive attitude on applying these patches unless there is someone who
blames it broken something in a general (but I guess the possibility is
very little).
https://github.com/wangli5665/ltp/runs/3408080506

Feel free to add my reviews:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000bff9d105ca492d3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 23, 2021 at 11:05 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We have =
to erase the last comma because otherwise we pass down one more<br>
empty parameter to the TST_EXP_*_() macros which then causes the FMT<br>
string to be empty and we end up with an empty default message.<br></blockq=
uote><div><br></div><div><br></div><span class=3D"gmail_default" style=3D"f=
ont-size:small">P</span>atchset looks good from the code layer though it is=
 a bit complicate<br>in 2/3 <span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>stringify handling, but that should be <span class=3D"gmail=
_default" style=3D"font-size:small">acceptable</span>.</div><div class=3D"g=
mail_quote"><br><div><div class=3D"gmail_default" style=3D"font-size:small"=
>My only hesitating is about ##__VA_ARGS__, because it says that is still</=
div><div class=3D"gmail_default" style=3D"font-size:small">as GNU&#39;s ext=
ension<span class=3D"gmail_default"> but have=C2=A0not=C2=A0got into standa=
rd C.</span></div><div class=3D"gmail_default" style=3D"font-size:small"><s=
pan class=3D"gmail_default"><br></span></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><span class=3D"gmail_default">So I especially run =
with GitHub CI and got pretty compiling results, then I have</span></div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmail_d=
efault">a positive=C2=A0</span>attitude on applying these patches unless th=
ere is someone who</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">blames it broken something in a general=C2=A0(but I guess the possibili=
ty is very little).</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><span class=3D"gmail_default"><a href=3D"https://github.com/wangli5665=
/ltp/runs/3408080506" target=3D"_blank">https://github.com/wangli5665/ltp/r=
uns/3408080506</a><br></span></div></div><div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Feel free to add my reviews:</div><div class=3D"gmail=
_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mai=
lto:liwang@redhat.com">liwang@redhat.com</a>&gt;<br></div></div><div><br></=
div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000bff9d105ca492d3e--


--===============0081262829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0081262829==--

