Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2811A3F8
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 06:38:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7B1F3C1840
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 06:38:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7F5C73C0EAF
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 06:38:29 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8BAF8601403
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 06:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576042706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlW0LNhGcStmTwAnVZxxAVvbYVSla77co0rbDpoWmj0=;
 b=c4aEP7Oi+EPsgAYKVI3Kg9A4PWdZuJli/O83nBM2COaNUMi4KZM6gEkyQPB1ohZOUnz1I5
 2SbG8DbNTBM3DNxGzAVAcjdbbtxteEG/SeHk7HvhN2sswVDqivTRXF0+GoSACyWCARuMxJ
 +sFzNlAHqzmDzqiQaBn9Igno4Z++GVQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-VbvcoWcaOwaVrMpytFpzxA-1; Wed, 11 Dec 2019 00:38:23 -0500
Received: by mail-oi1-f197.google.com with SMTP id 21so7717925oiy.15
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5p5qdI0NcQU+P2ViOW0wCLNmAcnSz2cjx/1ubQgS1jQ=;
 b=g4J2IVYl5F5W4MiHXyVi0JSthp1WZHKYa8YgAh6m3zdfULA1up3bx7vRfK9O3OpHya
 F7awqbzUCp8G4LF5eBQcVte19VSUOpSocflMNjjdy+YqImIv98hkRg8ty4P5qgjyPX1N
 5GDCsFU8OjpDm7oI9zfpaA2ddWfpeSz5vBv3gCdRm9lPmZCgmgiWVOg2aG5+YJ4iXCb7
 lN6RdIB799BrbFtJXMCGlxiU1PXXT+AvoWDSK1sQCL0/7TvVTC6jhR+xq9vKQKVkz+/i
 7gIQx5qasd9D/qSsY4k0UanjbgiqkRbXSLneGi2oPt+40oj8CJm8wpVaoWZoM67U9jX8
 Vrcg==
X-Gm-Message-State: APjAAAVllH2ZZwwVzw0Jfv2s+Lxt5pfyBlA1VTPSTq7U3oBi6ean1Bcx
 Ht5KyCKx/8mWq7nlvADqzPqW7E5Q56kcozzkRNzm8du4IaTCyGeV2Oktf7b9Y6MSR6HgeTEuIs5
 8uggys+f6XrWSQMTnFPVYpzbi1cU=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr1095165otq.17.1576042702803; 
 Tue, 10 Dec 2019 21:38:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbpd1OvJ/rwNeLxaFWpiL4fWLKMt7BRzjCjCKoBoFkUKu+rPjRwtXfBzX6h4HMsQNV5QvA8jcu0cMeiR3zPhM=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr1095153otq.17.1576042702443; 
 Tue, 10 Dec 2019 21:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20191206145517.3415-1-chrubis@suse.cz>
 <20191210140146.GA1124@dell5510>
In-Reply-To: <20191210140146.GA1124@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Dec 2019 13:38:11 +0800
Message-ID: <CAEemH2d2RLfE0Ki=WOqdAhPNVhJX1h2ZGkr1BhtquV+WdLo8ZA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: VbvcoWcaOwaVrMpytFpzxA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl01: Cleanup & convert to new library
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
Content-Type: multipart/mixed; boundary="===============0071143879=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0071143879==
Content-Type: multipart/alternative; boundary="0000000000006e28fc0599670943"

--0000000000006e28fc0599670943
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 10:02 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Cyril,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> BTW (not related to ioctl01.c), is it possible to get rid of (false
> positive) this warning?
>

With -Wno-missing-field-initializers flag in GCC option can disable the
warning. But not sure if we really need to do that.

--=20
Regards,
Li Wang

--0000000000006e28fc0599670943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 10, 2019 at 10:02 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Cyril,<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
Tested-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blan=
k">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_default=
" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwa=
ng@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=3D"gm=
ail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
BTW (not related to ioctl01.c), is it possible to get rid of (false positiv=
e) this warning?<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">With -Wno-missing-field-initializers flag =
in GCC option can disable the warning. But not sure if we really need to do=
 that.=C2=A0</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000006e28fc0599670943--


--===============0071143879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0071143879==--

