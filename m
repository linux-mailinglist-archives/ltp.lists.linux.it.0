Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFA164418
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 13:21:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 719EA3C24B8
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 13:20:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AE9603C1840
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 13:20:57 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2C9511A0154C
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 13:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582114855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDh57Hus0RNT73iqU/pPJAUV//pz1weQ/TvQip+y048=;
 b=HahA7xtF19D0nrLBXT69+XBAz9rMZsKd/PkCibcIXxLUJgjaxnvwe8Eo2ZA90cfg63XPXe
 7ohlhL/AZpqgQK2tb6GXaudKC8yva2u8e9ApLAmm8KlBeAd8XcUehayoSjeW9RPlBeRHEF
 1cAm6GKTJB8b23l4R3tpnJCXDd2PBJs=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-YJqk-lbtP0yC4-IIUoXi9A-1; Wed, 19 Feb 2020 07:20:51 -0500
Received: by mail-oi1-f197.google.com with SMTP id w205so1956180oie.13
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 04:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clkxYC/1z9yfKXnN7fWZFQnqFZiiU5RI6UWXGAB1Tv4=;
 b=he/uKEjMqJtL4m5D6l22IgTZVxcjiOoKwJ4f+uieKt/4TFquqQ+CNlKyd2DrbqpQIN
 65VKDVj33807MXtHeggalGyotfPr5TqPLrXRmO7ZKY8sNJh1BiaqPSXwtfNwbU/KwO59
 grCc11okFeRs/oPvOc+3V9HfT82Nhq5JLHOIrsWRlLj8cNkZ0BHOWmz4WqLMdixwcru/
 i4BUJaOEDkyJXig7q6Nb7ksKIDkmY8bAQ/Pqz/GTJ8BXKIiHqCKBXI3f9EGuycdgSyUR
 owwkTHnhiHj8nSSRchpBaNnqCHIHsy614kXNFGYecPZ6Wrr4lqGL1+drewo0akxipnmv
 FM0Q==
X-Gm-Message-State: APjAAAU9rwpec0pZ/yXTAQD0uOlBs2WwVXx7zym3TdpixNaGKz6ETHO0
 nhYKxf9CHokq0vXpKTJX+rSItRnfHhozGt71sIbwdFAIVQfb/ETAUJI0XbTgADoeVvH3ZD1k1+3
 JsLr6CIbYoHq1eYdLot75JpGfPhQ=
X-Received: by 2002:aca:330b:: with SMTP id z11mr586094oiz.96.1582114850425;
 Wed, 19 Feb 2020 04:20:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXNlSm6kwq6G7jPy6jEr48JTlg2Pr4Q/CUQwOxS6hCaOggVl8tV81FYfMfIMOMMquXrjs0me36Ek1yXOjkMQ8=
X-Received: by 2002:aca:330b:: with SMTP id z11mr586087oiz.96.1582114850191;
 Wed, 19 Feb 2020 04:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20200218115918.32203-1-liwang@redhat.com>
 <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
In-Reply-To: <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 Feb 2020 20:20:34 +0800
Message-ID: <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
To: Xiao Yang <ice_yangxiao@163.com>
X-MC-Unique: YJqk-lbtP0yC4-IIUoXi9A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Content-Type: multipart/mixed; boundary="===============1272870410=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1272870410==
Content-Type: multipart/alternative; boundary="000000000000a3d643059eecd140"

--000000000000a3d643059eecd140
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiao,

Why don't you avoid libftest.o as well if you want to build test by new
> rule?


That should be generated because it is the local library. In LTP Makefile,
the sequencing is to build the library first then compile&link to the
testcase. We can avoid dumping the testname.o since it only exists in the
last phase.

And, I don't want to change too much for LTP build rule(I think it works
correctly), especially in the case directory some of the local libraries
are reused.  e.g The swapoff test needs linking to ../swapon/libswapon.o,
that requires libswapon.o is in the correct path.

Or, did I misunderstand your words? if yes, please correct me.

--=20
Regards,
Li Wang

--000000000000a3d643059eecd140
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" st=
yle=3D"font-size:small">Hi Xiao,</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Why don&#39;t you avoid libftest.o as well if you want to build test by new=
 rule?</blockquote><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div></div><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">That should be generated=C2=A0because it is the local libra=
ry. In LTP Makefile, the sequencing is to build the library first then comp=
ile&amp;link=C2=A0to=C2=A0the testcase. We can avoid dumping the testname.o=
 since it only exists in the last phase.=C2=A0</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">And, I don&#39;t want to change too much for LTP buil=
d rule(I think it works correctly), especially in the case directory some o=
f the local libraries are reused.=C2=A0 e.g The swapoff test needs linking =
to ../swapon/libswapon.o, that requires=C2=A0libswapon.o=C2=A0is in the cor=
rect path.</div></div><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Or, did I misunderstand your words? if yes, please co=
rrect me.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000a3d643059eecd140--


--===============1272870410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1272870410==--

