Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C006730EF0F
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 09:55:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8893A3C7112
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 09:55:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CD5C43C4F41
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 09:55:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 673B6200D2C
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 09:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612428908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GOlRV2Qwobt6Ry24bkdceo9yazdVVOKDy3MSmPBMjyY=;
 b=eWM8AzBEVWcqNI0oQx1I7GSOy5nAcc3l0xjBsTAKqojuRAHeT9siL8PKzjWov/ILXXok3I
 1F3uKJkpaJ0Pis3BmfCZ9rkqPA/7nUmqU1YhJwEd/0aaN3NpEu4u/xF7+XeoVcvPAwX9Ti
 ZSGsfGxXdRMhWT2xG1fuUq89BbI5xXE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-2pFCKg_3MsGn6bs-3IOLtg-1; Thu, 04 Feb 2021 03:55:05 -0500
X-MC-Unique: 2pFCKg_3MsGn6bs-3IOLtg-1
Received: by mail-yb1-f199.google.com with SMTP id k7so2706640ybm.13
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 00:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOlRV2Qwobt6Ry24bkdceo9yazdVVOKDy3MSmPBMjyY=;
 b=Sxx/qCC5XSQBJQFUmtoNWj8H+N1re8hcVWl/4uG0c8D3pVHtQP3f+o7rMNO3HqGj7d
 af3R0HmpedAZs18t1s3GQbVO0x1JVU4EU4tM1QSKr/q57v8b8XJsE/aFcU4LFZfbjoi9
 zK3PNRlrMKi7U5Cc8OxI5QxjPMzdTeeyqYW2nZEugKQ+yP0fqBVvAsuthQGpNbmHCJkw
 J5Ja3dLnMq2YIoOi65qjWFjdfEcO1n23GfjiAlzAYGd2NT3gcjJhI30ba6eY0Sqy1rVq
 CaTSN0Lu89GO5w7yeqMHYJQE38vBr8REvAezmNDvGT+/PFK/JbHbc2kNaDeh6/LLvHbx
 wH3Q==
X-Gm-Message-State: AOAM532kdPTve8HPMYp1lDpEZVgJ/Hs/ofjpNWTpnKsf/AkVabRMig0G
 FRafnv1ZDDOOPogmL8l7DhGGyva/OLh79wrOJfMpcfqCYIKq+UnslkpQKxwBlzYK12kyrcm7QgU
 nDV6TBQ+/TJMj2uxjZG8xqYqE22M=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr11034848ybi.243.1612428905079; 
 Thu, 04 Feb 2021 00:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoODxkm8xjq2MUfv1P7j2al08Eivhd07tbBYdh8J9LtzPmKfl1m+zujg1BI0glabY7mG5Vc2RHhq0pNUUquyo=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr11034824ybi.243.1612428904859; 
 Thu, 04 Feb 2021 00:55:04 -0800 (PST)
MIME-Version: 1.0
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 16:54:53 +0800
Message-ID: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] syscalls/mallinfo03: Add an overflow test
 when setting 2G size
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
Content-Type: multipart/mixed; boundary="===============0462814658=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0462814658==
Content-Type: multipart/alternative; boundary="00000000000019a0dd05ba7edcbb"

--00000000000019a0dd05ba7edcbb
Content-Type: text/plain; charset="UTF-8"

Hi Xu,


> +void test_mallinfo(void)
> +{
> +       struct mallinfo info;
> +       char *buf;
> +       size_t size = 2UL * 1024UL * 1024UL * 1024UL;
> +
> +       buf = SAFE_MALLOC(size);
> +       info = mallinfo();
> +       if (info.hblkhd < 0) {
> +               print_mallinfo("Test malloc 2G", &info);
> +               tst_res(TFAIL, "The member of struct mallinfo overflow, we
> should use mallinfo2");
>

TPASS?


> +       } else {
> +               /*We will never get here*/
> +               tst_res(TPASS, "The member of struct mallinfo doesn't
> overflow");
>

TFAIL?



> +       }
> +       free(buf);
> +}
>


-- 
Regards,
Li Wang

--00000000000019a0dd05ba7edcbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div class=3D"gmail_quote"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+void test_mallinfo(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mallinfo info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size =3D 2UL * 1024UL * 1024UL * 1024UL;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D SAFE_MALLOC(size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D mallinfo();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info.hblkhd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_mallinfo(&quo=
t;Test malloc 2G&quot;, &amp;info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;The member of struct mallinfo overflow, we should use mallinfo2&quot;);<b=
r></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" style=3D=
"font-size:small">TPASS?</span></div><div><span class=3D"gmail_default" sty=
le=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*We will never get=
 here*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;The member of struct mallinfo doesn&#39;t overflow&quot;);<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">TFAIL?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
+}<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000019a0dd05ba7edcbb--


--===============0462814658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0462814658==--

