Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C437026A08D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:21:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CB9D3C2B47
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:21:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D6C393C1C7A
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:21:02 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4EB326009EE
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600158060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/0ojotmekEvHMjfqoysg0iVikSmda/QnW0rYGVXeg0=;
 b=OI/6++QwkDS65bS0WOnKxzCWw6xfzdeR6SEFRjzGMizZ7BCdLb4+nKJSFq00SbCIiu2PLZ
 z4VcXOeZXEDTMgkr2pfeJ2umru/dFpcnfr7VHEDd3dykAPIwfyfc6h/SMw8iJr8nf6RK0q
 7FN3lSyRlpaaCWaF16GPoo7rsWRKUrk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-UvK975GDPgKyqH-04WrBDw-1; Tue, 15 Sep 2020 04:20:58 -0400
X-MC-Unique: UvK975GDPgKyqH-04WrBDw-1
Received: by mail-yb1-f200.google.com with SMTP id u18so2705699ybu.0
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 01:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/0ojotmekEvHMjfqoysg0iVikSmda/QnW0rYGVXeg0=;
 b=S1TGzHrtJ8Kekz/exSrPt5gY9GaVgimLDtMY34WH5X7MZVTqx7gtQFZSGyPuPEXTaK
 Z/LFN0/ieSDpyAfVV8JGCAsJvMBFbZ+hknL6TUKHqnmqpIxLPgopWPWqJ4/T3D3sixPr
 lG3B7YqIX6NM03rfE8hSK9h7dk/jTPc1mX0P7XoJR3aHnXMrJe/BaDuKfYfmLlpsM4+3
 Jp9Pu0R3Wp9PPrcjkRX3UJr+Sbtvzj+0maEFiRqGV46biVm4e4z2thWny1GAiKwgjViu
 YJnVYnm9quJCGwQgBCXOTlBpc97eGXMvZcQWugotNXXVc2IAM+07VLF/XQ/N+eGj4FWn
 YLXQ==
X-Gm-Message-State: AOAM532iNvyatq4V4xf+DrLtjPduHZZvm3r78LaHEP/IBv7mND3hrCNo
 2K6Sgwzu/8GpAdj+qLup8VpXTRI4wCmcSIX2Xd8/GMcyJliIvOW1Mw3E002bey8pFUzafa8JLvS
 bSFJ0uJ6Uy52Yx/re0ExC3idEgk8=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr10873268ybc.243.1600158057990; 
 Tue, 15 Sep 2020 01:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIMCn2SNMeN4GRkCzeUcDb/nFYe/vr469o3AntOc1K8VyqyZmqnXsP1iPp0p0fs7VMYZ2Vxna0iy3Srg4aeeo=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr10873246ybc.243.1600158057671; 
 Tue, 15 Sep 2020 01:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200915031402.26519-1-liwang@redhat.com>
 <20200915081032.GA8111@yuki.lan>
In-Reply-To: <20200915081032.GA8111@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 15 Sep 2020 16:20:45 +0800
Message-ID: <CAEemH2d4SehT7xV9sa1t5tZDtVRQKf4MaE3VokWYhE5gwk_jGA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: relax the time diff in VM
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1157955616=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1157955616==
Content-Type: multipart/alternative; boundary="0000000000009cdbdb05af55d47b"

--0000000000009cdbdb05af55d47b
Content-Type: text/plain; charset="UTF-8"

> od, but I think that the implementation could be better.
>
> Why can't we just call the tst_is_virt() in test setup and if we detect
> that we are running on virtual machine print a TINFO message that
> maximal expected difference has been multiplied by 10?
>

Sounds good.

-- 
Regards,
Li Wang

--0000000000009cdbdb05af55d47b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0<br></div></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">od, but I think that the implementati=
on could be better.<br>
<br>
Why can&#39;t we just call the tst_is_virt() in test setup and if we detect=
<br>
that we are running on virtual machine print a TINFO message that<br>
maximal expected difference has been multiplied by 10?<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Soun=
ds good.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--0000000000009cdbdb05af55d47b--


--===============1157955616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1157955616==--

