Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 103386B929
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:27:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB7EB3C1D1D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:27:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C48833C1C81
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:27:30 +0200 (CEST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D92B10009AC
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:27:24 +0200 (CEST)
Received: by mail-ua1-f41.google.com with SMTP id g11so9379415uak.0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 02:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wI9H/WfOnwxgzLWwOjRIBv0JxIxgn4/j2KTRsPC8UJg=;
 b=QbbmHq28ljhLPLEhiLgzkE4hp4ITMf5Y11I37Nzdq/dxcjKsPvqoSwhPq1zSiFzKnc
 OYpIu7fKONFEcnHCPIclsdL3Qq7ps9lG3ChbHSY5FOi1zzBrPZI7vz/yXNFMeyh2/TQh
 neCDFNSSPxehkiLtDo5njDeO0YZeXc39cJx/6EL0NY0Juv6wMy1EPEHHrcaM50i2r1o5
 9lH+TlWl8DWJH7zdThlSCbyMkDs1yfDDx8M+19mSkBlL4Kef7VANM+LR4IQU90hOmid+
 3jyIIBf4djRA9xg6eN0biXl++4Im/e+qNp5NQhdmJxQ74KblzlF6b8cW4i3+4ARefDFW
 nP1Q==
X-Gm-Message-State: APjAAAXAiouCGq3p0QXurRzk29ROBJFEVkX/LI6IX73V8UTSZfnpXO3l
 MQkdAB8SQLWdVfJ6INjwR37jBrZz5VhlvVoNO/PUctv8
X-Google-Smtp-Source: APXvYqxew/eOab0SNHmJDDnLNctP0YKtQfnS7+9bYYH1H/CNdqDeV8A45YTK44Hmt3G2x7aZo0uGUMkqWIDhbACemSY=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr23289888uaq.106.1563355648464; 
 Wed, 17 Jul 2019 02:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190717072109.7077-1-liwang@redhat.com>
 <20190717090326.GA25480@rei.lan>
In-Reply-To: <20190717090326.GA25480@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Jul 2019 17:27:17 +0800
Message-ID: <CAEemH2fUztKu5uY7MJTJV7EGGLasWmCHMuvhWXVZM7pa7ZpgSA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] snd_timer: check if file /dev/snd/timer exist
 before opening
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
Content-Type: multipart/mixed; boundary="===============1116530807=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1116530807==
Content-Type: multipart/alternative; boundary="00000000000015bc56058ddd1a4e"

--00000000000015bc56058ddd1a4e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 17, 2019 at 5:03 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > 1. check if /dev/snd/timer exist
> >
> > 2. add tst_fzsync_pair_reset(&fzsync_pair, NULL) to reset variables
> > needed by fzsync. Especially for pair->exec_time_start, we use it to
> > control the test time in case that the execution loops timed out on
> > slow machine.
>
> This is obviously OK, acked.
>

Pushed, thanks.

-- 
Regards,
Li Wang

--00000000000015bc56058ddd1a4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 17, 2019 at 5:03 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; 1. check if /dev/snd/timer exist<br>
&gt; <br>
&gt; 2. add tst_fzsync_pair_reset(&amp;fzsync_pair, NULL) to reset variable=
s<br>
&gt; needed by fzsync. Especially for pair-&gt;exec_time_start, we use it t=
o<br>
&gt; control the test time in case that the execution loops timed out on<br=
>
&gt; slow machine.<br>
<br>
This is obviously OK, acked.<br></blockquote><div><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Pushed, thanks.</div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000015bc56058ddd1a4e--

--===============1116530807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1116530807==--
