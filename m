Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2203B3E64
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 10:21:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3D503C6F19
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 10:21:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 684C23C1DD5
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 10:21:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3B80963B7CF
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 10:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o59qJv6rLEf3j3W9niqmkaA73tmSCI5TSFvPWrHi/74=;
 b=dCvhwKJiV2DECzSUkHcV8jb9UTOBLtVsTAU+bwevIWlYkm4nlqCV5r0+0fatNnYiA/p8ZI
 b5vfhBmMxdmjQ3ODYGtxVHizDOKF2j5txcMH/+775Tnsm2HhxDWrpsSpPicJFid+dIRaUC
 aEH6RaQNbbhBqDmsOkwISd9yUHKBpPw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-a18EDx86ORqZmQnIR2pvjQ-1; Fri, 25 Jun 2021 04:21:42 -0400
X-MC-Unique: a18EDx86ORqZmQnIR2pvjQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 j190-20020a253cc70000b029054c72781aa2so3222980yba.9
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 01:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o59qJv6rLEf3j3W9niqmkaA73tmSCI5TSFvPWrHi/74=;
 b=jUEE+tv/xcIkmKzuF8A9X0V3TACHC6rxOawyYt9ZM6Vq/fhMoxokIoIIF7ltV4dl5M
 fY2O4L7OSG2FlSdx5MB70xtKW9EhnQHtsY4Lc9VAOKyfU8frV/vwvfP1aJh/ZCXO7711
 Oi4FvVH5EvmSzBCXpRmIip6qNEIQNWP3GYhDdu8ysNwbXh6v+vamYuynRVyBgJQQtBQ5
 2buYAuiLycqv39gtCMkGubKcN+p1PrtO2y2vEcbkJqxPhD/zaj+YdqAO5EJuj6J06r0R
 HaXq453mEtuy32qQ55vYTtrwBh1/HNSxs1DdWXdzXbFFZkjHuvmE8hTese/8a7l4MOaO
 iF+A==
X-Gm-Message-State: AOAM530PqtLuVL+g146ysgsV/bn1CJ34+A9FDEV2pF/ldrz6fafefwhn
 a9kAorwr+MyMeu5XxsyMmT6iWnPa6GoPhQSgzqL+/93bMnpXROGUU3b6KtJ0srbSSfJ5+kBMUUf
 GCUIJP2r5bcUDN77SMjqakcWT0bY=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr10597911yba.110.1624609302027; 
 Fri, 25 Jun 2021 01:21:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBwMDj4iMP+sZ6QgfHOD+3AwRX8p2W2fvkZGsILWFSshBhXtjgefxxHYvXcPS4Dd1Lni9/GDu4S4yUd/wgJyM=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr10597892yba.110.1624609301730; 
 Fri, 25 Jun 2021 01:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
 <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
In-Reply-To: <bd56facc-55a3-4e8a-4e9d-304d5177462d@canonical.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Jun 2021 16:21:30 +0800
Message-ID: <CAEemH2dqM29Y5s5U2QbeONH30h6aR1B4DZxSnSdowWKSXzfgYQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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
Content-Type: multipart/mixed; boundary="===============1925208082=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1925208082==
Content-Type: multipart/alternative; boundary="00000000000054284d05c592d4ae"

--00000000000054284d05c592d4ae
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 25, 2021 at 3:31 AM Krzysztof Kozlowski <
krzysztof.kozlowski@canonical.com> wrote:

> On 17/06/2021 09:07, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > This is a resend of previous Github pull:
> > https://github.com/linux-test-project/ltp/pull/830
> >
> > The patches fix several test failures we are hitting since months, see:
> > https://bugs.launchpad.net/bugs/1829979
> > https://bugs.launchpad.net/bugs/1829984
> >
> > Best regards,
> > Krzysztof
> >
> >
> > Krzysztof Kozlowski (3):
> >   controllers/memcg: accept range of max_usage_in_bytes
> >   controllers/memcg: accept range of usage_in_bytes
> >   controllers/memcg: accept non-zero max_usage_in_bytes after reset
>
>
> Hi everyone,
>
> The patchset got positive LGTM on the Github. Any further comments for
> it or can it be applied?
>

I slightly agree with Richard that we need an explanation/investigation
on where the 32*PAGE_SIZE comes from. Otherwise, we are very possible
to mask a counter bug if only to make the test happy.

Forgive me pour cold water on the method though it looks good in coding:).

-- 
Regards,
Li Wang

--00000000000054284d05c592d4ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jun 25, 2021 at 3:31 AM Krzysztof Kozlowski=
 &lt;<a href=3D"mailto:krzysztof.kozlowski@canonical.com" target=3D"_blank"=
>krzysztof.kozlowski@canonical.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 17/06/2021 09:07, Krzysztof Kozlowski =
wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; This is a resend of previous Github pull:<br>
&gt; <a href=3D"https://github.com/linux-test-project/ltp/pull/830" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/pul=
l/830</a><br>
&gt; <br>
&gt; The patches fix several test failures we are hitting since months, see=
:<br>
&gt; <a href=3D"https://bugs.launchpad.net/bugs/1829979" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.launchpad.net/bugs/1829979</a><br>
&gt; <a href=3D"https://bugs.launchpad.net/bugs/1829984" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.launchpad.net/bugs/1829984</a><br>
&gt; <br>
&gt; Best regards,<br>
&gt; Krzysztof<br>
&gt; <br>
&gt; <br>
&gt; Krzysztof Kozlowski (3):<br>
&gt;=C2=A0 =C2=A0controllers/memcg: accept range of max_usage_in_bytes<br>
&gt;=C2=A0 =C2=A0controllers/memcg: accept range of usage_in_bytes<br>
&gt;=C2=A0 =C2=A0controllers/memcg: accept non-zero max_usage_in_bytes afte=
r reset<br>
<br>
<br>
Hi everyone,<br>
<br>
The patchset got positive LGTM on the Github. Any further comments for<br>
it or can it be applied?<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">I slightly agree with Richard that=
 we need an explanation/investigation</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">on where the 32*PAGE_SIZE comes from. Otherwise, we =
are very possible</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">to mask a counter bug if only to make the test happy.</div><br></div><di=
v class=3D"gmail_default">Forgive me pour cold water on the method though i=
t looks good in coding:).</div></div><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000054284d05c592d4ae--


--===============1925208082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1925208082==--

