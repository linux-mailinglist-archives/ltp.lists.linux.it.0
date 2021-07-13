Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2043C6A3E
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 08:08:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECE903C6659
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 08:08:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 887AB3C245D
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 08:08:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C6BD21400C64
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 08:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626156509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YPYLg9uCiHZPLFzDlIG62FOsJl3BjrllY5zlrUT30U=;
 b=Zehn/7qn8TGcf/QGQcZbs8t4tJ6upzDOa/7dKo1PgRdEfFhevDPedFi6uEvK6bFf7Ita87
 JOjPY3BRjQXx6KUtMk3ueUZ2zklloptJ4IGOOcvetGasYubT4KZ40SAr6vCzipAL92ObHA
 WEFG/pfih8KbRTV1ZWNcIaM9RNmEkr0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-Mmx9fIvZMRGQT5reuui8kA-1; Tue, 13 Jul 2021 02:08:27 -0400
X-MC-Unique: Mmx9fIvZMRGQT5reuui8kA-1
Received: by mail-oi1-f200.google.com with SMTP id
 w2-20020aca62020000b029024073490067so14674342oib.21
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 23:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YPYLg9uCiHZPLFzDlIG62FOsJl3BjrllY5zlrUT30U=;
 b=r3Zhh0B7qJ2+4+15bQDSA2JIJStLTKguZFdKOcmVj/mxwdeySV2ZdC7UwIJErdYERU
 mqL+/2MFdTpUMifYYYt2NhzI3IfI8nHhC8KCnb8s5qYBQ1FyapwJ7KvSr15hj9dNmt5t
 4Vj85PU773H3g4FJM8ReRXw0SZlHAvKtNkCocVPDOltziOafnpJ3pqld0fivNwNw7Zku
 Zjbo8Audn7raw6pNHR2dxh0qg+e29cBm21P8TLZPubYz7QYILF2WNxuP+Pezffo22fR8
 FpfnJu2qAyQKVP3mrJh69j9aJA3FAUiNpBziuT3azjCCE7qMOWESMYEogXQW5BoCypnP
 ZcMQ==
X-Gm-Message-State: AOAM5320i8WShU2j8iNF8exwl9ua053zMfsRDIQ321nCTWuAbovwdZXv
 2tx0QXvqVqaM22BRp3Onwhcy2eLqL18zYxUk5f0bZS+h1CkYwIfXd0rGnK92xARNm7WBq5CwqVI
 IL13zwDUPEV73uxXaTyKlot17dJ4=
X-Received: by 2002:a4a:2242:: with SMTP id z2mr2189674ooe.90.1626156506730;
 Mon, 12 Jul 2021 23:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOlZkc8JOBzYb1hO5YwRz3V0YGjZ/AS06CwF+ZsETVeMqI0+6Nzvfpi78U7uov6UbmQljJYXjH3fDM6kB8Fpo=
X-Received: by 2002:a4a:2242:: with SMTP id z2mr2189653ooe.90.1626156506470;
 Mon, 12 Jul 2021 23:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <YOx1pir0UuBNM+4w@pevik>
In-Reply-To: <YOx1pir0UuBNM+4w@pevik>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 13 Jul 2021 08:08:11 +0200
Message-ID: <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] tst_strstatus.c fails on Alpine
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1329384594=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1329384594==
Content-Type: multipart/alternative; boundary="000000000000eaf0f605c6fb1042"

--000000000000eaf0f605c6fb1042
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 7:02 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi all,
>
> I see failures of lib/newlib_tests/tst_strstatus on Alpine:
>
> tst_strstatus.c:31: TPASS: exited with 1
> tst_strstatus.c:31: TPASS: killed by SIGHUP
> tst_strstatus.c:31: TPASS: is stopped
> tst_strstatus.c:31: TPASS: is resumed
> tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff
>
> Any idea what could be wrong?
>

I'd start with definition of WIFSIGNALED on that system.

printf("%d\n", WIFSIGNALED(0xff));
should give you 0, but it does appear to return 1 in output above.

--000000000000eaf0f605c6fb1042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 7:02 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,=
<br>
<br>
I see failures of lib/newlib_tests/tst_strstatus on Alpine:<br>
<br>
tst_strstatus.c:31: TPASS: exited with 1<br>
tst_strstatus.c:31: TPASS: killed by SIGHUP<br>
tst_strstatus.c:31: TPASS: is stopped<br>
tst_strstatus.c:31: TPASS: is resumed<br>
tst_strstatus.c:29: TFAIL: killed by ??? !=3D invalid status 0xff<br>
<br>
Any idea what could be wrong?<br></blockquote><div><br></div><div><div styl=
e=3D"font-family:monospace" class=3D"gmail_default">I&#39;d start with defi=
nition of WIFSIGNALED on that system.<br></div><div style=3D"font-family:mo=
nospace" class=3D"gmail_default"><br></div><div style=3D"font-family:monosp=
ace" class=3D"gmail_default">printf(&quot;%d\n&quot;, WIFSIGNALED(0xff));</=
div><div style=3D"font-family:monospace" class=3D"gmail_default">should giv=
e you 0, but it does appear to return 1 in output above.<br></div><div styl=
e=3D"font-family:monospace" class=3D"gmail_default"><br></div><br></div></d=
iv></div>

--000000000000eaf0f605c6fb1042--


--===============1329384594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1329384594==--

