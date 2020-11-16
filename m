Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F712B3EE1
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:41:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8762E3C4F42
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:41:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 04AF13C260E
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:41:20 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id F234F200AE1
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:41:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605516078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlwqnCTKU5wU1n4LCJhHo88PN9HRtPTTo2UNGkSpVUQ=;
 b=goZlrL0Mt6RU3Xhi+VQ8GaBL3RAEUh5hBJuVIKfz91oeONAOaG3kyE6gfx8p3adOxao5e0
 DRMYWHLJnYenoVTp5Cz4AyRIwGK8RPWpKMCV19ONt7gRDcAxmbk6qFT5I1ityDCtCXSGRO
 nXPaVAG32g16dlTyJCNeXF1PfRrG1xY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-pI2PcAPNOfuPmiWVioZk9w-1; Mon, 16 Nov 2020 03:41:14 -0500
X-MC-Unique: pI2PcAPNOfuPmiWVioZk9w-1
Received: by mail-yb1-f197.google.com with SMTP id h6so20011429ybk.4
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 00:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlwqnCTKU5wU1n4LCJhHo88PN9HRtPTTo2UNGkSpVUQ=;
 b=M/5WrGKyEhajt6ZNbk3jmoZT8aAEoe/UkbqM8JnNv27wNM2Shi9LDJpCWJ6NasnSal
 gPXJABgjId2Qchkov4kPkR1uWkspJAFvfd5dwY4zaUpwBDbwNTAAi7lthQdwxAhrdg/4
 DukVb7/RGqZnyb11tVVSTXKrOaMMB9thhgYGA/vaYUVQ9njy3+I/i+qyb9lMJtjkdnph
 +m/+pitJC+G7GgOzbIMvssD5DW36jDZ3Xs3wUr3/ZxN0AJzavFfyebkVRjG0H2hwfign
 84w83yJmmIZXHlmNihMJ9g7xGg8oHK6ygHKw2cq16iscoFlUR0N9A59Crg8sLbOO0NZ4
 8MjA==
X-Gm-Message-State: AOAM533/bXea/LDW1WgLOTJWC+2SAY09RkAlqtquvVjGiu6Xk2l9Mqel
 oA5lxVQRakExyA8DnsqCzlyDwWngwQoozIF3ZfOjvWFqBTX7a0JrHvr+xPtQ1JuBhOxIbVcvI5M
 2sYACPJi6T9p7d48/29o65JPEr1s=
X-Received: by 2002:a25:e088:: with SMTP id x130mr19023015ybg.97.1605516073686; 
 Mon, 16 Nov 2020 00:41:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcgDA8UMuok8VD/SDGgxxJXVGwc7C+cyZPNZeYTr4BmGMT6G3kHBF4HPpt+1vyzXINYZlxtzeD6S/wF7110sQ=
X-Received: by 2002:a25:e088:: with SMTP id x130mr19023000ybg.97.1605516073448; 
 Mon, 16 Nov 2020 00:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
 <20201113202828.GA2229@pevik>
In-Reply-To: <20201113202828.GA2229@pevik>
From: Li Wang <liwang@redhat.com>
Date: Mon, 16 Nov 2020 16:41:02 +0800
Message-ID: <CAEemH2fXD-gFF_7PogAPB1txUrgQmmzeK8p=MaMSn1zam0YeVg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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
Content-Type: multipart/mixed; boundary="===============0854487289=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0854487289==
Content-Type: multipart/alternative; boundary="0000000000003d532b05b435570d"

--0000000000003d532b05b435570d
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2020 at 4:28 AM Petr Vorel <pvorel@suse.cz> wrote:

> > In order to simplify common return value checks.
>
> Great improvement, thanks!
>
> The only concern I have is for tests which does not end 0
> as it's not obvious from the output (without looking into the test source)
> that everything it's working, but not a big deal.
>

+1
I agree to add an expected value check for TEST_PASS(), e.g

#define TEST_PASS(SCALL, EXPECTED, ...)


> FYI I plan to send a patchset which runs tests in lib/newlib_tests/.
> First I thought simple check for 0 would be ok, but with non-zero results
> it
> might be good to not only check expected return value but maybe for whole
> output (the same approach we have unfinished in patchset from Christian
> Lanig).
>
> Kind regards,
> Petr
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000003d532b05b435570d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Nov 14, 2020 at 4:28 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; In order to simplify commo=
n return value checks.<br>
<br>
Great improvement, thanks!<br>
<br>
The only concern I have is for tests which does not end 0<br>
as it&#39;s not obvious from the output (without looking into the test sour=
ce)<br>
that everything it&#39;s working, but not a big deal.<br></blockquote><div>=
=C2=A0</div><div><div class=3D"gmail_default" style=3D"font-size:small">+1<=
/div><div class=3D"gmail_default" style=3D"font-size:small">I agree to add =
an expected value check for TEST_PASS(), e.g</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">#define TEST_PASS(SCALL, EXPECTED, ...)<br></div></div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
FYI I plan to send a patchset which runs tests in lib/newlib_tests/.<br>
First I thought simple check for 0 would be ok, but with non-zero results i=
t<br>
might be good to not only check expected return value but maybe for whole<b=
r>
output (the same approach we have unfinished in patchset from Christian Lan=
ig).<br>
<br>
Kind regards,<br>
Petr<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000003d532b05b435570d--


--===============0854487289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0854487289==--

