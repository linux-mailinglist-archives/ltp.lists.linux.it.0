Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C69883B8D8D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:58:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92AD33C8607
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:58:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50E843C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:58:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2FC8A1000362
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625119096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YP4f2IGPNEbGmfrwf3Sc3jYXHoIb18V5j2/UT03BjDg=;
 b=cdz3RpTdMdbiSCwTIIOOaKUGTU8RHSrq1VtuDuR3dH+Hx9OYNiXfgejv4g70I5p2au1cYQ
 516M54+5AUP/9wHEFj8rfeH7OuE69JQHgeQ7t+FoOSMs+EPriAWC36ImnLVNmbQSf4VQPe
 t954RyaanPEOlUO2Iass9+Y/psVL+B4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-iX1NQOdsMiaqb5EjIKnpLA-1; Thu, 01 Jul 2021 01:58:14 -0400
X-MC-Unique: iX1NQOdsMiaqb5EjIKnpLA-1
Received: by mail-yb1-f197.google.com with SMTP id
 v184-20020a257ac10000b02904f84a5c5297so7257980ybc.16
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 22:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YP4f2IGPNEbGmfrwf3Sc3jYXHoIb18V5j2/UT03BjDg=;
 b=btYZ9mLLPVHX18CGYLPQrWEHR//Rusvt5sLead44W6kBu99+LUvkiPtOK0zk/zJuUq
 LaozM4ZWIet4N7HEGrpUl5GO/wcDNpznrYouXZFkqGosOl9G0KyJECrrfE2bh1cVjjSv
 Z0UDWLCsMrfQdWvDRz6iLly0aup2i3DfI2W9XocokaFKzVTM+iKDlcVYZ5FPF5euRGP9
 DPj436xE9Veihq5YzyJm/g3cnlzcLTC/67hTvCuy/l34lYyCIGn0cV7zsDp3EDy+byX7
 Fqnt0t9R4dJKoVI4D5cfvOjj7AcsPI+qQQKWgUFAZovBIsIr/jy7wUQb351FpYvXaFht
 UbRg==
X-Gm-Message-State: AOAM532Kdi3c0i6Dlj8YUq0+i4WRMDKRpxU2x7vt0KvKnEqvlFnd5WXT
 GXfRdH5sImuyyQSob15z/z3ApOR31MLuDZRPScPF6nphdBLlAhUdAwInOroQ0Vse62xpzgPdOYD
 0O6gwX75XnwHdgmp0uijsw16ox94=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr17187657yba.243.1625119094228; 
 Wed, 30 Jun 2021 22:58:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXDofJTShi5FXCXemaS4tngsBW2Xyj21V+1znLpRH2+v1JNOB38eBZlaqUz/DrYGF9MoUVZ8VUb4aHXIXf5M=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr17187641yba.243.1625119094028; 
 Wed, 30 Jun 2021 22:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2da0dOeKpnZZ6+A696gFL+nDAiP7UL9tqm68JH8KO-Qkw@mail.gmail.com>
 <YNw3ePbVhio3s9JX@yuki>
In-Reply-To: <YNw3ePbVhio3s9JX@yuki>
From: Li Wang <liwang@redhat.com>
Date: Thu, 1 Jul 2021 13:58:01 +0800
Message-ID: <CAEemH2dQOWgBMc8H+oY81B-ppbr9wRVPey46-xFLvAyW7nG7vA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Limit the tmpfs size on mounting
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
Content-Type: multipart/mixed; boundary="===============0380603343=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0380603343==
Content-Type: multipart/alternative; boundary="0000000000005154de05c60986b9"

--0000000000005154de05c60986b9
Content-Type: text/plain; charset="UTF-8"

Cyril Hrubis <chrubis@suse.cz> wrote:


> I guess that appending '-o size ...' to the mount flags in prepare_device()
> is reasonable, but instead of hardcoing the value we should do the same
> as we do with the loop devices and the size should be
> MAX(tst_test->dev_min_size, DEV_SIZE_MB).
>

Yes, dynamically setting the size is better.


> > /dev/loop0                             tmpfs     126G   23G  104G  18%
>
> Also it looks like should pass something as "ltp-tmpfs" instead of the
> "/dev/loopX" string in a case of "tmpfs" filesystem in order not to
> confuse people...
>

Quite good proposals, I have sent two patches for achieving the ideas.

Thanks!
-- 
Regards,
Li Wang

--0000000000005154de05c60986b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@s=
use.cz</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><div>=C2=A0=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess that appending &#39;-o size ...&#39; to the mount flags in prepare_=
device()<br>
is reasonable, but instead of hardcoing the value we should do the same<br>
as we do with the loop devices and the size should be<br>
MAX(tst_test-&gt;dev_min_size, DEV_SIZE_MB).<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Yes, dynamically=C2=
=A0setting the size is better.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; /dev/loop0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0 =C2=A0126G=
=C2=A0 =C2=A023G=C2=A0 104G=C2=A0 18%<br>
<br>
Also it looks like should pass something as &quot;ltp-tmpfs&quot; instead o=
f the<br>
&quot;/dev/loopX&quot; string in a case of &quot;tmpfs&quot; filesystem in =
order not to<br>
confuse people...<br></blockquote><div><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Quite good proposals, I have sent two patches =
for achieving the ideas.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks!</div><div class=3D"gmail_default" style=3D"font-size:small"></div><=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><di=
v>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005154de05c60986b9--


--===============0380603343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0380603343==--

