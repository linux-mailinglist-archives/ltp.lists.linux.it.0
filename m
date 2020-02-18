Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B09C1620A9
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:07:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE0FF3C25A0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:07:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D79F13C2360
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:07:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 7A9021A00E2E
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582006026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6K4dizgsQWpCJwxOrj/ap0TSTVuTTXruYWtzW8McJA8=;
 b=YvEAdMUXZipzRdzdY+xQQ8ogN+acvJCPmCWX8YMpwKSDRZzlI8o61fWkDC4pTeLxrSS64W
 hDx9QMEqX+gnySPd8tSrlPURg9Kr06gRbY76XfYpzJXeJfhAwZq3GkZAk/ICF+e0z0yrrB
 oJV89uwNEqhrxJ470ZqHJfvC7UVE/uc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-6P0pRRR0NiKsAsaJRaJbSw-1; Tue, 18 Feb 2020 01:07:02 -0500
Received: by mail-oi1-f198.google.com with SMTP id a74so9491346oib.2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 22:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rZUO5QqlcaQbl95CsTDCUBHqNBaE7vJet8AwD3KgaA=;
 b=OIBDQ78sQVD/hEF+qkXi6OZHgQngh+3E2pbeH1W4+Muh1q/tYYVQhpXxNwTH9reX/c
 b+3tLJp57JnJic2tXZiObU1NjaPnm3iZ5lMasCkfU3YzHSEgeCKuboOzDGGkKjS7bbgG
 wjgdS0WX8c6s31y9F5sNstK1UciC082DqKh1NTqBV4QQZEPiAN/kGTI6R5mY3hGW+tv5
 wL3j50wC3W29Fu2Z6WeNcncG6t41odVTkylKV7yKBGj4LybqBIkfot62sEf6Wsg2cU9C
 Jm5OTF+EwmIFOQ4sRSYjpS394kCRIUHEkoswuhtzjzy6GgTGkFTFjO85TjUU89BOxey/
 EZMQ==
X-Gm-Message-State: APjAAAWvYhY2fqzRuoU57GSDfCCzmLZg16csiBdtot9pi+9oTz+ZDjGa
 qP4L6vE7f+LkUFJTlu99XVWz3SD56IovI5nAJpZ2598FhJSO2RLj1H8ziUD2YoMUKeOw8b62CPx
 P3/OVwlhxk/r0YS63a0dkOUQ3y6M=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr286523oie.96.1582006021674; 
 Mon, 17 Feb 2020 22:07:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfBDt37b0IJ93Z1VTqmZRFXnJyBHiNhJkqyfxDdMJBNRSiX1detpshThd80lpW8XMMCpmYKkCFua9v/7ygfvo=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr286516oie.96.1582006021475; 
 Mon, 17 Feb 2020 22:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20200208092014.24824-1-liwang@redhat.com>
 <20200217160830.GA6482@dell5510>
In-Reply-To: <20200217160830.GA6482@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 14:06:50 +0800
Message-ID: <CAEemH2d6byWZ7_LxKqA0VUO93wiRTL0w5JMsq0-4Tb_RcHXgVw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: 6P0pRRR0NiKsAsaJRaJbSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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
Content-Type: multipart/mixed; boundary="===============1715503319=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1715503319==
Content-Type: multipart/alternative; boundary="000000000000f1689e059ed37a1e"

--000000000000f1689e059ed37a1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Feb 18, 2020 at 12:08 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Code looks good.
>
Thanks!


> Minor issue: doc has broken formatting.
> ...
> > +'tst_hugepages' will be set to 0.
>
> I propose these changes (+ strip this formatting from comments in C sourc=
e
> - include/tst_test.h).
>

Thanks for this advice, I have done modifications in my local commit.

Before pushing I would give a bit more time to Cyril for a review, in case
he has additional suggestions.

--=20
Regards,
Li Wang

--000000000000f1689e059ed37a1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 12:08 AM Petr Vore=
l &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
Code looks good.<br></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">Thanks!</span></div><div><span class=3D"gmail_default"=
 style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Minor issue: doc has broken formatting.<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +&#39;tst_hugepages&#39; will be set to 0.<br>
<br>
I propose these changes (+ strip this formatting from comments in C source =
- include/tst_test.h).<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Thanks for this advice, I have done =
modifications in my local commit.=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Before pushing I would give a bit more time to Cyril for a r=
eview, in case he has additional=C2=A0suggestions.</div></div><div>=C2=A0</=
div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000f1689e059ed37a1e--


--===============1715503319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1715503319==--

