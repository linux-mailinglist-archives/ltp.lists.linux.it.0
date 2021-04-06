Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D9354B0D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 04:54:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B714F3C194D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 04:54:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04D603C00FC
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 04:54:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id AE62E1A00241
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 04:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617677665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9nmDXGSHglvQ4KEEa1PfomAVbkpkvuH2yOBEgoogyAc=;
 b=AzX6268UYI70Uyo11YE+ryXbP/+BN9uiPGHMnWx+YBQcwX0oHjnpaW9zeziAn3CWdsm+5V
 slceXfl+jZAxmcJA/EjMa/GTHqLm2J1W9ygs4DELWSGhb51lpOOdWVuB+uAtYql1t+CduF
 rNKESHW90ohb1xpR/zpzGF1ThW8DEyA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-0QiTAPp0M2eYe3zYcASsJQ-1; Mon, 05 Apr 2021 22:54:22 -0400
X-MC-Unique: 0QiTAPp0M2eYe3zYcASsJQ-1
Received: by mail-yb1-f199.google.com with SMTP id w7so19128885ybq.4
 for <ltp@lists.linux.it>; Mon, 05 Apr 2021 19:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nmDXGSHglvQ4KEEa1PfomAVbkpkvuH2yOBEgoogyAc=;
 b=Qkcc/r0I22ofYV0pCRnz8my/fKfOT7C66QkFCalq74H52N3E/QDKnIB4ofuEmjTsxu
 sQFi0QMnomApuzi6g/B3PtmdTvjbuk8xZ1nAfxPyKJHLW+lUcQ26jS9Ka8DWjPOH93mq
 2ioIIe3zntMSwbPoFKc+8w/8OwjqsJFmgGOqfO7lR97L8XAGoOyfW6Lm3EYqGMOubqX4
 g9qJSK4+NU6LQdCd873LbP5oKoh8q2WPtKPpE2QpG7x6DGuSv9WpxiithhXP3OljqSm2
 6lPsps/XC+DwRPGfRze4g3eMqeLJnMAycaiuWs7qSXpkK7X0T26yL/eGpzW8Dkqs43Bu
 JUmg==
X-Gm-Message-State: AOAM530l8tNQZ6Ka41X68DNOl8M3E4sepWcW8t2bl/eJ8Y8tegq9IMAV
 ntqnVlrmj1jYPyoo3Zauu5TSWYJV9l/ZhN9r4k/wtQ2+nEOYuqzwg9b4QjrytdyJg2e/MvXjqUD
 GFTQ5p1a92G4RujQz3kVdVqkY6/U=
X-Received: by 2002:a25:af05:: with SMTP id a5mr42177878ybh.86.1617677662290; 
 Mon, 05 Apr 2021 19:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkkQcIwtPzRA+cNDqUMCruI1OqVIIiZ7s9IyArIAtddftiNCw4i8w2YggMjgkmOetxf/TBMnrskdAuQmXxnpE=
X-Received: by 2002:a25:af05:: with SMTP id a5mr42177866ybh.86.1617677662068; 
 Mon, 05 Apr 2021 19:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210405122322.23134-1-bogdan.lezhepekov@suse.com>
In-Reply-To: <20210405122322.23134-1-bogdan.lezhepekov@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 6 Apr 2021 10:54:10 +0800
Message-ID: <CAEemH2cXGOZorAbRzEMXPWFgGU2o=eitwYsHNKGe+t8Dvrp=qg@mail.gmail.com>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
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
Subject: Re: [LTP] [PATCH v1] openposix/mmap/1-4: correct a typo
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
Content-Type: multipart/mixed; boundary="===============1877630889=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1877630889==
Content-Type: multipart/alternative; boundary="00000000000068bf8905bf44eeea"

--00000000000068bf8905bf44eeea
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 5, 2021 at 8:23 PM Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
wrote:

> A typo in the name of the temporary file:
>      pts_mmap_11_5 -> pts_mmap_11_4
>
> Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
>

Good catch, pushed.


-- 
Regards,
Li Wang

--00000000000068bf8905bf44eeea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 5, 2021 at 8:23 PM Bogdan Lezhepekov vi=
a ltp &lt;<a href=3D"mailto:ltp@lists.linux.it">ltp@lists.linux.it</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A typo in=
 the name of the temporary file:<br>
=C2=A0 =C2=A0 =C2=A0pts_mmap_11_5 -&gt; pts_mmap_11_4<br>
<br>
Signed-off-by: Bogdan Lezhepekov &lt;<a href=3D"mailto:bogdan.lezhepekov@su=
se.com" target=3D"_blank">bogdan.lezhepekov@suse.com</a>&gt;<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Good catch, pushed.</div><br></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--00000000000068bf8905bf44eeea--


--===============1877630889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1877630889==--

