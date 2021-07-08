Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819D3C1456
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:35:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 134523C7931
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:35:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B1CA3C681B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:35:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8D2CC1A0153F
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625751325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/mObDvuRfW6hkwI0i/bmDhtGSww7TKA9L6DHW1+2e3A=;
 b=G0QPejyGUz8j6JItBRHC/I1P+qSsQga/L6YDRfOcvmwGwGbqhVacneDvLFX091LCaWnJ50
 fkDw3OOpyyuz0oIkVla4vSHKo3ztkq7lRA6+2t/tIGMqJ8xiFxP+jiKTTwoOWQTYPN5IhI
 Ue1nQf/aUDiXUePod8E6k8nvuSym2wY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-qlfM1fl-PsOaRNK0oRse8Q-1; Thu, 08 Jul 2021 09:35:23 -0400
X-MC-Unique: qlfM1fl-PsOaRNK0oRse8Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 v184-20020a257ac10000b02904f84a5c5297so6917035ybc.16
 for <ltp@lists.linux.it>; Thu, 08 Jul 2021 06:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mObDvuRfW6hkwI0i/bmDhtGSww7TKA9L6DHW1+2e3A=;
 b=DcUkzy5UUj4zeVcHeCsQ0onWKwaoN2+k4Z64M6lq0OF3vG+xmGjuxw6H8viOsYe7Kh
 9JtGLSME8LCtJ6ffOHesdK/qKdGPMG7xQqa+GIV2yng2ofsaOVk/zEarMeYQVjdSmdGR
 LLBkHImCv5psNqw0eUJxEdfQbx5yI+N/njTkDT0arQ8SQqqhRJnEhkMs2LMxOyC8HwMM
 pYtljW1w4uw5r58pdC/a+D8rcAJ9jWMmshuzN4bHoZx9bYx93KlTjX/bVlPyO8ZGV9B7
 V2MGZd4ccQ+1+kLkk9b60xlFuSuuibbv16A8kQTIxde13CXJrB/4vh2ktQ9mLdR4R7A1
 KG+w==
X-Gm-Message-State: AOAM531Hn64BRhvtjrPaeePhinwycCutQKJJhmgkxQ4yFex8yIUL4ZuH
 DIexWypp/ZEFY1occJDx7ByISR8iXB3s+o6Z+hjx7rIlvBzI3HkQC1Sley5ZtVRZna3uz5nizg2
 gtuiBZgWnaCq+OnfyzlITiUSxs0w=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr39179783ybi.366.1625751322901; 
 Thu, 08 Jul 2021 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgzPbnpPefXE7lIUvpI+l4Q1Sxp+mWW+GMrU39hymwW6n4RJ6gRO87fqZ+Ok0cIbRm6HMJCyMAHbLadxw98M0=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr39179771ybi.366.1625751322726; 
 Thu, 08 Jul 2021 06:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210708130602.970689-1-liwang@redhat.com> <YOb2ddFMEW1aniyI@yuki>
In-Reply-To: <YOb2ddFMEW1aniyI@yuki>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 21:35:11 +0800
Message-ID: <CAEemH2ej5BBxppxOLnL-+QTRSChj+M8bVX_Abk75bUULrHpovg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] gethostid: skip test if sethostid undefined
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
Content-Type: multipart/mixed; boundary="===============1190673115=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1190673115==
Content-Type: multipart/alternative; boundary="00000000000015abac05c69cba2a"

--00000000000015abac05c69cba2a
Content-Type: text/plain; charset="UTF-8"

> > --- a/testcases/kernel/syscalls/gethostid/gethostid01.c
> > +++ b/testcases/kernel/syscalls/gethostid/gethostid01.c
> > @@ -26,6 +26,8 @@
> >
> >  #include "tst_test.h"
>
> Shouldn't we include config.h here?
>

Yes, merged with including. Thanks for the quick reply.

-- 
Regards,
Li Wang

--00000000000015abac05c69cba2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/testcases/kernel/syscalls/gethostid/gethostid01.c<br>
&gt; +++ b/testcases/kernel/syscalls/gethostid/gethostid01.c<br>
&gt; @@ -26,6 +26,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
<br>
Shouldn&#39;t we include config.h here?<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Yes, merged with in=
cluding. Thanks for the quick reply.</div></div></div><div><br></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<=
br></div><div>Li Wang<br></div></div></div></div>

--00000000000015abac05c69cba2a--


--===============1190673115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1190673115==--

