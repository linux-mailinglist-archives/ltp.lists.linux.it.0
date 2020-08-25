Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72711251328
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:28:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DCDC3C5686
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:28:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A7B4E3C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:28:18 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9EC5D200B19
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598340496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WN9xs2/C4j7tRi27gYGuKAmsRo3PAWXFwb2SsidkM2A=;
 b=ikBrkuwxu5UvyTLVP5tYvi51yHAMWiiUE+JoXaBb7RXfadBcth9DcblzpgUjbl/ylda/2K
 gn91H6xXaZuF/fDyP0X5UhGQC41TJId17tBt/AXdXOC+pJerbbTPYJbi0R2s8oTsM3MZpE
 U6T7aoXThAdSt+3xE4OPYw19SC8PcfA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-L7O2wir4M_OY6q2t3n7Ikw-1; Tue, 25 Aug 2020 03:28:11 -0400
X-MC-Unique: L7O2wir4M_OY6q2t3n7Ikw-1
Received: by mail-yb1-f198.google.com with SMTP id o8so13806761ybg.16
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 00:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WN9xs2/C4j7tRi27gYGuKAmsRo3PAWXFwb2SsidkM2A=;
 b=N4rWqqhxwCstqmmhGeuGlK3V4104gwUh7Vg/oCT0KKkDKia656pXoNSKua+o5kd05n
 PnduXfmhwapy7igNDjhET6LQZzdfhSCPHG8GX9Kf2fNumDipDFJ5S4rTQwUU1iCzqagb
 meViqyrVJ4mqWtoANlZxvSbx3xjwS/vQvJiEKyLUHBtPVuFkJ3OLQb5YzUReSuf+ZrZO
 CVklNSb4Pp+w9g0XK7BvuogVCr+wMTjgkEUY5bXtjb9twzkPHD6FrNnzpU+NMg3jh5jh
 /QT4MhY0bMzEIj43gKfBQiL08ILzaxWprI+tFj0Z+uk5k2HcXuYRkykA3pzMKT32k+5Q
 ngXA==
X-Gm-Message-State: AOAM533TQdf8HmVfSaAvIfd/kOsI8QLCgQqicOZj9r320dzLKNfs4Clq
 xmOxPcoWB4uu2KevnILh4hSSJQmF1xsSaOmzZXd64/nrFFI9gkuUwvhVReVcR2SJZjN4U92IvjZ
 kU3Gf/r7omkzf8FWtn4mnn7atw2E=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr12635241ybc.243.1598340491199; 
 Tue, 25 Aug 2020 00:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxmPtZejoNnTLeKGxL5l7wuW1B+JgPEgLtJV18kBW82jY0VUNSPMSvyVvqFXdBCMP+F1LN6pQpGmlXeZAKJpk=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr12635230ybc.243.1598340490984; 
 Tue, 25 Aug 2020 00:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200819110406.25099-1-mdoucha@suse.cz>
 <20200824174145.GA21133@dell5510>
In-Reply-To: <20200824174145.GA21133@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 Aug 2020 15:27:59 +0800
Message-ID: <CAEemH2f8qED6Z713qiEmEhK13jAkT-_Xf+sm_EsiokLKmTY-Ow@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taint check: Use TFAIL instead of TBROK in
 fork_testrun()
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
Content-Type: multipart/mixed; boundary="===============1511331168=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1511331168==
Content-Type: multipart/alternative; boundary="000000000000321bd205adaea5f0"

--000000000000321bd205adaea5f0
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 25, 2020 at 1:42 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> LGTM.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Pushed, thanks!

-- 
Regards,
Li Wang

--000000000000321bd205adaea5f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 1:42 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
LGTM.<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Pushed, thanks!</div></div><di=
v><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000321bd205adaea5f0--


--===============1511331168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1511331168==--

