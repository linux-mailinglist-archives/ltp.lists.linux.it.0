Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CE231E11
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 14:07:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C60C63C2628
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 14:07:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5F8453C13DC
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 14:07:30 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0E28220144E
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 14:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596024447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dA6VBcWcAozCQIEqNWsDkwPLTisP8Rb3sl7/8BCr4MU=;
 b=d/IX2J++IE6QOV7BXLR4qNC0OEvS6YblM47VvvfCdDUl1w/pHPJQycHhEBmU52tqg16S4N
 l0Gh0SPHKOkbRzE1s5X1dbn5yjurJv9rcd5cHCC6YDQzd5jn1X0k/fpi5Smyk6L4bRu8AC
 6NYaBQE0Myi01wHI86QrZfCs+BNL/oc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-avRyu5wTPRmjRYmfMT7zjA-1; Wed, 29 Jul 2020 08:07:25 -0400
X-MC-Unique: avRyu5wTPRmjRYmfMT7zjA-1
Received: by mail-lf1-f71.google.com with SMTP id p192so6753596lfa.0
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dA6VBcWcAozCQIEqNWsDkwPLTisP8Rb3sl7/8BCr4MU=;
 b=nBVAENPuV41EGqU/PHAv7WV5QW2RcpDeXrjtAyUCWw8Pvoli5dXF075hC/BdPZDdCd
 yICdaj800s2le8MtjMPt4NNCgvOuoJW0NJgNbIpCTyt0l6Hs+6vC6OnULgXpDdVfuqvD
 Z5wJEPo119Zv3do9LArMM2NCmXZ27hetPtrLocqLbCHrRpF9lNzvhR6O2DhnYkBZaAoX
 6eZpP5tFxPayRaEZeCN+pybncdllnGO85bAB2+JOEnkfR8Me05Zcc6eK9TRu6trw+m6Q
 jn/qv0QZHgQtpMZtOtxncMtqqoEA3CLS4QEtWbtrdEIhIBv9VjwRDGaAcrIGsjDTetBR
 8yHA==
X-Gm-Message-State: AOAM532U5BMI/YlK5jkpWjYncd09713c0WhEdJ/uKOMT1jxNcUyYE5b7
 jeVSqNRCksCjmFx+1nOMJWXvvUXMvMj1T9GiHzpQftomwhbruqtV3k8dsb218kB9M3XmCh6pEoV
 A4IsauaBJQfXchrE8bx/Q4ieQvfM=
X-Received: by 2002:a05:651c:106e:: with SMTP id
 y14mr14398578ljm.49.1596024443754; 
 Wed, 29 Jul 2020 05:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgIAlwjFIhk8VrGEWxH1JG3VjAMQ6KZC9kJPrZQ8Kz0ERm5kPSSz7G0k3LO1mEO8WhGrwJc3NmZ2u85m4bQW8=
X-Received: by 2002:a05:651c:106e:: with SMTP id
 y14mr14398566ljm.49.1596024443467; 
 Wed, 29 Jul 2020 05:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200728162207.332109-1-ernunes@redhat.com>
 <CAEemH2d+EOzF8aKAkpsnUO1GqgPh3J40RBDXyBg0E5NC8nrSuw@mail.gmail.com>
 <678ed5c9-d678-6673-666b-05b999567977@redhat.com>
In-Reply-To: <678ed5c9-d678-6673-666b-05b999567977@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Jul 2020 20:07:11 +0800
Message-ID: <CAEemH2d3Ji_oPT2O2sgdwvzMGc9YE_C3OLcR-h=zJivrLFnJdg@mail.gmail.com>
To: Erico Nunes <ernunes@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: add function to check for kernel
 lockdown
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
Content-Type: multipart/mixed; boundary="===============0579733867=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0579733867==
Content-Type: multipart/alternative; boundary="0000000000000191da05ab9366e6"

--0000000000000191da05ab9366e6
Content-Type: text/plain; charset="UTF-8"

> > I prefer to add a macro definition in the header file instead of this ^.
> >     #define PATH_LOCKDOWN  "/sys/kernel/security/lockdown"
>
> I'm ok with that, do you want me to submit another version like this or
> can you change while applying?
>

No needed for a new version, I can help do that.

-- 
Regards,
Li Wang

--0000000000000191da05ab9366e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; I prefer to add a macro definition in the header file instead of this =
^.<br>
&gt; =C2=A0 =C2=A0 #define PATH_LOCKDOWN=C2=A0 &quot;/sys/kernel/security/l=
ockdown&quot;<br>
<br>
I&#39;m ok with that, do you want me to submit another version like this or=
<br>
can you change while applying?<br></blockquote><div><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">No needed for a new version, I ca=
n help do that.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000000191da05ab9366e6--


--===============0579733867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0579733867==--

