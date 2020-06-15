Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CF1F9040
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 09:47:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D575F3C6020
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 09:47:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1B6823C2D46
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 09:47:51 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D3BD162E840
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 09:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592207269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=su2o6VjctvNMzQAJPj6Inm4mbg3blS6OZ7e26AwGIzQ=;
 b=dl/wGYSBpmsu0atfP0q01Xtp+ONW8LEakf5luG0YDOGVv11r/OqSEt69FVEqRy6yuJyu5F
 ZvUUiDzoqObSQAgcyAX9uQUfKr6v4aZLcxRSA2REC7v/6kKoLS0r4Rkj993Dmz2nO13bek
 rR4cvlaPXnDwfYbuBJix0TbKte4uHSs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-L260rsRBNY6in5u1zRk7-w-1; Mon, 15 Jun 2020 03:47:45 -0400
X-MC-Unique: L260rsRBNY6in5u1zRk7-w-1
Received: by mail-lf1-f72.google.com with SMTP id a17so4793260lfr.9
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 00:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=su2o6VjctvNMzQAJPj6Inm4mbg3blS6OZ7e26AwGIzQ=;
 b=hiDacpqWqmmILh1jeqFsa0e7vB9TdFeVc4eFTkS1s8RNw/OJxhhA3oK+lI1DvNmWke
 JbH3H92Ver3Zap/J7rAH6OdqC60ivQ6y+qh8/v4tLlXBj8BVOMYcZGhtnr4byRU0XuXC
 ri0jV3IOtT9QOU3eghCfD5TRBrAeKGcnB0oI+g0aVBCCXKrP40dGQQLx3R/q+FUj3e1L
 poyiA3RlMSB0846Ykz0uhPskVcX9p25nBcZSPdRJIJFqErsL8tIpiWDpx/lwnaIviugZ
 zEmOy/sVEiteBD3OHPu70qwG6xtPvmtaCIjyLyKfRgjVmAmLoD2iuuFblGyUmGIfg215
 qXWQ==
X-Gm-Message-State: AOAM530bG5nWX+vYTEF0450SlNJcXK6ANLECjVcsV8Ha9qh9FEnUd+Az
 7cAgWH8ZJGLRfYqpaqA9lmhPi7h/9saG+hlq9XC3A7+NfQOks7f6UT/IKAFA2am670Q3tPn1cf2
 WlIoIYs+ZUnGhcCER587uLL059KQ=
X-Received: by 2002:ac2:4a87:: with SMTP id l7mr12740548lfp.171.1592207263079; 
 Mon, 15 Jun 2020 00:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr958O1Vm/O7/J6xor/s6XjYxJiI+3IngoclMfZ7akqGoClIExxd6SUmkuK8uxyQ6WJLZFwPNAAtT7QfMxOok=
X-Received: by 2002:ac2:4a87:: with SMTP id l7mr12740537lfp.171.1592207262914; 
 Mon, 15 Jun 2020 00:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200610072928.1331-1-rpalethorpe@suse.com>
In-Reply-To: <20200610072928.1331-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Jun 2020 15:47:31 +0800
Message-ID: <CAEemH2fyJKyKwKzF4W35tM_sjbYQAf-Gx7-Vrhv6r+QdLE8+Bw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Wrapper for Syzkaller reproducers
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0035073502=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0035073502==
Content-Type: multipart/alternative; boundary="00000000000050ae2d05a81aa418"

--00000000000050ae2d05a81aa418
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 10, 2020 at 3:29 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> Allows one to run the Syzkaller reproducers as part of the LTP.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Pter Vorel <pvorel@suse.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

+
> +static void setup(void)
> +{
> +       tst_taint_init(TST_TAINT_W | TST_TAINT_D | TST_TAINT_L);
>

My only concern is that the limitation is too strict for syzkaller.

Because if one of the tests (near the top of the name rankings)
trigger a WARNING in SUT kernel, the syzwrap.c will be
skipping all remaining test cases.

Maybe we can just use 'TST_TAINT_D' here, and I wish to
hear more opinions from others.

-- 
Regards,
Li Wang

--00000000000050ae2d05a81aa418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 10, 2020 at 3:29 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allows one =
to run the Syzkaller reproducers as part of the LTP.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
Reviewed-by: Pter Vorel &lt;<a href=3D"mailto:pvorel@suse.com" target=3D"_b=
lank">pvorel@suse.com</a>&gt;<br></blockquote><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:l=
iwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_taint_init(TST_TAINT_W | <span class=3D"gma=
il_default" style=3D"font-size:small"></span>TST_TAINT_D | TST_TAINT_L);<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">My only concern is that the limitation is too strict for syzk=
aller.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Because if one of =
the tests (near the top of the name rankings)</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">trigger a WARNING in SUT kernel, the syzwrap=
.c will be</div><div class=3D"gmail_default" style=3D"font-size:small">skip=
ping all remaining test cases.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Maybe we can just use <span class=3D"gmail_default">&#39;</span>TST_T=
AINT_D&#39; here, and I wish to</div><div class=3D"gmail_default" style=3D"=
font-size:small">hear more opinions from others.</div><br></div><div>--=C2=
=A0<br></div></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000050ae2d05a81aa418--


--===============0035073502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0035073502==--

