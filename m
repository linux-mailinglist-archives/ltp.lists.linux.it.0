Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D52317F6
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 05:14:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A13E3C26B4
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 05:14:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 119513C12A0
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 05:14:26 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 7B23E1A00784
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 05:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595992463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5EVpdDpym76A4kPCGjNxwFTF7CfjDHk/eRG0/DnoFDM=;
 b=DaTsBZ1kDRcBPwydUQ/JCL4RlYXmjPTkjVeRo5KZfitfcCQ8o0IG7R7Sh0TzuDYHtQF0nT
 J4zIj+l5h5fEA1B76dgQOb42CVwSLrtQwOu2gdhR4v0peRiaTQD3pcGd5R8KC2jAFVoNeY
 b4ePQtJqq5s1g2wN6G/atorUaTonp08=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-kvdzpGcnOPqQXKyRIXYc7g-1; Tue, 28 Jul 2020 23:14:21 -0400
X-MC-Unique: kvdzpGcnOPqQXKyRIXYc7g-1
Received: by mail-lf1-f70.google.com with SMTP id m13so6219121lfr.18
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 20:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5EVpdDpym76A4kPCGjNxwFTF7CfjDHk/eRG0/DnoFDM=;
 b=fjfv6FswHwtLJgmIfcBSSHe6gkbV751QoNyt+iGwdfpfPWXbjKkqkFPB8jIaBj4JFF
 y9fyx4XfQc3HoUOhk+/d/FsQ9hB0otnepoQ4TZ6/VJkz85N0IkVqSNCI4qr5c6EMpKib
 04CCHy97ywQf8EaD6Q/Ic4SfEeZV3xTSqUsuSHIyFusSF4nbKLfiMPotKwjehtqzcMzH
 vg9pwYbUfjSZQVq9RCI6r/ms5IKolsf/Q91IoR9ITZezd+wQfMyJB6s7IoiZx6KG94eO
 JXOG6DgY591Q5G3nhE+CaunU2bcUQRKZTEEYzWDLT6WVVjrLIz0U08dTyw6QaG92V6ON
 CFzg==
X-Gm-Message-State: AOAM533ThMrD/W+WXFIisL8A+sA3pq9/qS4JaFPlBLDpKZgIlTARWGU8
 WZ2XfjV55GcFLiv9Cg5rGvDdlrtQjbHj+ZWpetJSUlSVA8HHcfmgugyBX+3x1sZPbh7LxX/COci
 yJ0nFYwAQzK7FyCfQCDlw/idTwAE=
X-Received: by 2002:a2e:7010:: with SMTP id l16mr14225339ljc.353.1595992459969; 
 Tue, 28 Jul 2020 20:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6MrDm5Dwtz/zhztacpr4xl5bOCoxbdPtd62Iqd6+F78odpBpXEILy2Hd23iTsXFy7zcS4yFFBu9g0+9bp5Wk=
X-Received: by 2002:a2e:7010:: with SMTP id l16mr14225333ljc.353.1595992459733; 
 Tue, 28 Jul 2020 20:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200728162207.332109-1-ernunes@redhat.com>
In-Reply-To: <20200728162207.332109-1-ernunes@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Jul 2020 11:14:08 +0800
Message-ID: <CAEemH2d+EOzF8aKAkpsnUO1GqgPh3J40RBDXyBg0E5NC8nrSuw@mail.gmail.com>
To: Erico Nunes <ernunes@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============2018075867=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2018075867==
Content-Type: multipart/alternative; boundary="000000000000a0bc2405ab8bf3de"

--000000000000a0bc2405ab8bf3de
Content-Type: text/plain; charset="UTF-8"

Thanks Erico for patch V2.

On Wed, Jul 29, 2020 at 12:23 AM Erico Nunes <ernunes@redhat.com> wrote:

> Some syscalls are not available if the kernel is booted using the
> 'lockdown' feature. That can cause some tests to report fail, showing
> a message like:
>
>   Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7
>
> This patch adds a function that can be used by tests to check for this
> case, so it can be handled accordingly.
>
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
> ...
> +int tst_lockdown_enabled(void)
> +{
> +       char line[BUFSIZ];
> +       const char *lockdown_path = "/sys/kernel/security/lockdown";
>

I prefer to add a macro definition in the header file instead of this ^.
    #define PATH_LOCKDOWN  "/sys/kernel/security/lockdown"

Considering some distribution's LSM feature has not aligned with the
mainline kernel, so I think this method is enough to detect the lockdown
status at currently, if some new changes happening then we can help improve
the function as well.

Anyway, the whole patchset looks good, if nobody has objection I will help
merge it one day later.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000a0bc2405ab8bf3de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Thanks Erico for patch V2.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 29, 2020 at 12:23=
 AM Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" target=3D"_blank"=
>ernunes@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Some syscalls are not available if the kernel is booted =
using the<br>
&#39;lockdown&#39; feature. That can cause some tests to report fail, showi=
ng<br>
a message like:<br>
<br>
=C2=A0 Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7<br>
<br>
This patch adds a function that can be used by tests to check for this<br>
case, so it can be handled accordingly.<br>
<br>
Signed-off-by: Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" target=
=3D"_blank">ernunes@redhat.com</a>&gt;<br>
---<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+int tst_lockdown_enabled(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char line[BUFSIZ];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *lockdown_path =3D &quot;/sys/kernel=
/security/lockdown&quot;;<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">I prefer to add a macro definitio=
n in the header file instead of this ^.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0 =C2=A0 #define PATH_LOCKDOWN=C2=A0 &quot;/s=
ys/kernel/security/lockdown&quot;</div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Considering some distribution&#39;s LSM f=
eature has not aligned with the mainline=C2=A0kernel, so I think this metho=
d is enough to detect=C2=A0the lockdown status at currently, if some new ch=
anges happening then we can help improve the function as well.</div></div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Anyway, the whole patchset=
 looks good, if nobody has objection I will help merge it one day later.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a=
 href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&=
gt;</div></div><div><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a0bc2405ab8bf3de--


--===============2018075867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2018075867==--

