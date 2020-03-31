Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B2198FEA
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 11:07:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F9443C30BC
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 11:07:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 649FC3C30B0
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 11:07:37 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7C53B601642
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 11:07:36 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id a23so7896110plm.1
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygI72jJo0DQ8x5y/VZnoiF3ZZ9msXvT7X/mjh4JW2r4=;
 b=GN0N4UnW4olPlsLTP4Yz/fUXNKq3K+aMNRylyCOUgPzsMtZmI56dpaNZKvwVDm+6Bs
 909ETyKrPL1NOvqZGwU0VyUkfAYmCK1iUZk1EaSD02pnM9hgI+wAigBF/D5fuS6cWVJW
 hvvQKZCIwXH5ZpDc4ztBLVQkdu5eSKC2a8YlHs0EdDCudpXorzHbV3Xfn4Q60Gtyfknr
 M966rsU43xlHGjbeDGVQmV+rhR2tegY58FK29G03M+iK3dv5XD9bpT+DtFB1mHr9dvgT
 xAyqHMfAP++iYleee6bT2XPHTEEwgGHrnJDuwz3UF4wkEfMVaN8+nu+tk5jBfX9FXVoR
 /M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygI72jJo0DQ8x5y/VZnoiF3ZZ9msXvT7X/mjh4JW2r4=;
 b=CeLUN0jlqNW/muFf6elMU/g4Sltf34XKvmhsILx64vxOfORB2rLtCJagfE32eHOKMD
 VWmWGVBWOxw74s1D4gpcll3NuKvO0euIFsJJhmi4A/1YsUR8zGjtNFvyaCs2ArAr6I06
 BXuCr5vBKSng7i3t+E5BJc8qMSpHh7oX9myxOlysl5lGbFH36TuY/7R2cTCVEKv/XU+B
 hsBKYxrF/+WQt4nSNgqmliA5zdzsyRT/qE3s3HvIUJckEqDfCY7IqAfj8yAg/flxJ9zA
 uBaBSnYEPBQ9pbsZWV5NvRoTecfFazzEHBaJFeAglyJ+00EGD5FQ8HxxuSuZ/9u8vF+f
 Bw0g==
X-Gm-Message-State: AGi0PuYERPcL088mk2ike2qHL/iIIMHcGqIbkup0q/ZsYoVFsaLluAHw
 D6uoqROUMLQ/8eywQplXLeXs/jLHaNXPA8EMePI=
X-Google-Smtp-Source: APiQypIfSlqE8+Eq6rGNKW2yl0Q66so+lL7ieh8ElOn7xC+LEwqpQlo3/HtV/Ra4kgD6WjIgb+QPprH6HCHaJH4Vps8=
X-Received: by 2002:a17:90a:7302:: with SMTP id m2mr2636182pjk.7.1585645654770; 
 Tue, 31 Mar 2020 02:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200331065442.28591-1-gengcixi@gmail.com>
 <20200331074154.GA23091@dell5510>
In-Reply-To: <20200331074154.GA23091@dell5510>
From: Cixi Geng <gengcixi@gmail.com>
Date: Tue, 31 Mar 2020 17:06:58 +0800
Message-ID: <CAF12kFv9+Bu5q9XxbeUUBuSCWKgSt6dYEwmaepsCUP9qX8OxaQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] uart: add uart testcase in kernel
 device-drivers
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
Cc: Orson Zhai <orsonzhai@gmail.com>, Carlos Hernandez <ceh@ti.com>,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============2009662239=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2009662239==
Content-Type: multipart/alternative; boundary="000000000000fe083905a222e526"

--000000000000fe083905a222e526
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr:
I hope the ltp test devices have a more convenient way=EF=BC=8C
like auto detect if the machine have these devices
and can run the device test.
Now we only test the uart device,we can export PORTxx for the test.
but if we have to test dozens or even hundreds devices,
the way to set device environment variable needed test is very trouble and
time consuming
So I don't think add need_devices is the best desirable way

Petr Vorel <pvorel@suse.cz> =E4=BA=8E2020=E5=B9=B43=E6=9C=8831=E6=97=A5=E5=
=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=883:41=E5=86=99=E9=81=93=EF=BC=9A

> Hi Cixi,
>
> thanks for your patch and effort. While we appreciate it, I have to admit
> that
> Cyril's version is IMHO much cleaner and more adjusted to LTP style.
>
> So I'd vote for him to add the loopback and merge his version.
>
> Kind regards,
> Petr
>

--000000000000fe083905a222e526
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Petr:<div>I hope the ltp test devices have a more=C2=A0=
convenient way=EF=BC=8C</div><div>like auto detect if the machine have thes=
e devices</div><div>and can run the device test.=C2=A0</div><div>Now we onl=
y test the uart device,we can export PORTxx for the test.=C2=A0</div><div>b=
ut if we have to test dozens or even hundreds devices,=C2=A0</div><div>the =
way to set device=C2=A0environment variable needed test is very trouble and=
 time consuming</div><div>So I don&#39;t think add need_devices is the best=
 desirable way</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel=
@suse.cz</a>&gt; =E4=BA=8E2020=E5=B9=B43=E6=9C=8831=E6=97=A5=E5=91=A8=E4=BA=
=8C =E4=B8=8B=E5=8D=883:41=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi Cixi,<br>
<br>
thanks for your patch and effort. While we appreciate it, I have to admit t=
hat<br>
Cyril&#39;s version is IMHO much cleaner and more adjusted to LTP style.<br=
>
<br>
So I&#39;d vote for him to add the loopback and merge his version.<br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div>

--000000000000fe083905a222e526--

--===============2009662239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2009662239==--
