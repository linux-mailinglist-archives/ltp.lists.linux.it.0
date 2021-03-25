Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06906348BF3
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 09:56:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A82333C5F2E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 09:56:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4A4863C27F1
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:56:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2FD0B20004E
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616662594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I372nfEEscKwp79wN7EsA4YvULaXknjL0VranNkU780=;
 b=X0GkgmibNJw2v9UYhkAPjHeBls6jPI49N7UrBaJpqbsqLekfiFgk/xE0OTkuzboeq7lgzC
 VGIODVqN3BiikaCCmrlMo+wd8jf60qTQHlujVktdM0CWGvMyU+kwJPWH3rv/ga3s91P109
 U/AmU0/UxvggEA1uF1gk58y5ZhDG3jE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-z5BMBA5CMA22pwHa_lwvew-1; Thu, 25 Mar 2021 04:56:30 -0400
X-MC-Unique: z5BMBA5CMA22pwHa_lwvew-1
Received: by mail-yb1-f197.google.com with SMTP id v6so5515245ybk.9
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 01:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I372nfEEscKwp79wN7EsA4YvULaXknjL0VranNkU780=;
 b=EVtS1SEbP931xnV2lhMOGU6QBwQjc/Q97I5Qb+C1IJoDbHmPn4phbA867DtmZSCX7K
 MPdTqBz7qrNnl/TXYwalGcvun1ptzV9blf5Z51y89gl9k2SZ3JzWyiS6mGvDA9S2Z2r3
 ex1npG+kPftJo7pgQesF0AG8vVNvU0HWC1iQ7echGBOxQLipxkb+lh9MYkeZobqFdgVz
 s00qo92O8ydanZ2q3Xc6ql60N6DeN3kUYMa2mf/xE4+SLXI0xW+XW9TDCX1HP1yW9lO5
 NH5egW037+V2fgHrRnW1QUqTVwhcsm73F0DTVxuH9PMB9NG/D7hujoan9BdDRFaC0md8
 MDPA==
X-Gm-Message-State: AOAM530UQyKFqI+9QR4B2rrUXfAs0ByzjKHwWP9v2+5onU8NRDYnjoqC
 wyVkc9N48t10wOh930wYtY+0KyeGhhKyw5PhBYEm4ycjeHRzd7ACBFWCIwZ+KIsO3a+hrqlRNFK
 uAenWGmL4aPAO4f2frOTsOV8tQfQ=
X-Received: by 2002:a25:3417:: with SMTP id b23mr11054817yba.252.1616662589753; 
 Thu, 25 Mar 2021 01:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsDnuRGzB6K8Xu7Pwi6LiDovKplBgmPKgGG0qwgoEHZBy4A2F/uqs1nbj2d3Hj/HS4O3QAbPg8olo1jvoZOKE=
X-Received: by 2002:a25:3417:: with SMTP id b23mr11054810yba.252.1616662589598; 
 Thu, 25 Mar 2021 01:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
In-Reply-To: <20210323215819.4161164-1-hca@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Mar 2021 16:56:18 +0800
Message-ID: <CAEemH2cSk=doHL51uD5Qu6uCRRTCgYd0EN0iij=X+538J53XsQ@mail.gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
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
Subject: Re: [LTP] [PATCH 0/3] s390 vdso fixes
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1968384225=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1968384225==
Content-Type: multipart/alternative; boundary="00000000000060095605be58978f"

--00000000000060095605be58978f
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

On Wed, Mar 24, 2021 at 5:58 AM Heiko Carstens <hca@linux.ibm.com> wrote:

> Li Wang reported that clock_gettime(CLOCK_MONOTONIC_RAW, ...) does not
> work correctly on s390 via vdso. Debugging this also revealed an
> unrelated bug (first patch).
>
> The second patch fixes the problem: the tod clock steering parameters
> required by __arch_get_hw_counter() are only present within the first
> element of the _vdso_data array and not at all within the _timens_data
> array.
>
> Instead of working around this simply provide an s390 specific vdso
> data page which contains the tod clock steering parameters.
>
> This allows also to remove ARCH_HAS_VDSO_DATA again.
>
> Heiko Carstens (3):
>   s390/vdso: fix tod clock steering
>   s390/vdso: fix arch_data access for __arch_get_hw_counter()
>   lib/vdso: remove struct arch_vdso_data from vdso data struct
>

Thanks for the quick fix! I confirmed these patches work for me.
(tested with latest mainline kernel v5.12-rc4)

Tested-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000060095605be58978f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Heiko,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 5:58 AM Heiko Carsten=
s &lt;<a href=3D"mailto:hca@linux.ibm.com">hca@linux.ibm.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Li Wang reporte=
d that clock_gettime(CLOCK_MONOTONIC_RAW, ...) does not<br>
work correctly on s390 via vdso. Debugging this also revealed an<br>
unrelated bug (first patch).<br>
<br>
The second patch fixes the problem: the tod clock steering parameters<br>
required by __arch_get_hw_counter() are only present within the first<br>
element of the _vdso_data array and not at all within the _timens_data<br>
array.<br>
<br>
Instead of working around this simply provide an s390 specific vdso<br>
data page which contains the tod clock steering parameters.<br>
<br>
This allows also to remove ARCH_HAS_VDSO_DATA again.<br>
<br>
Heiko Carstens (3):<br>
=C2=A0 s390/vdso: fix tod clock steering<br>
=C2=A0 s390/vdso: fix arch_data access for __arch_get_hw_counter()<br>
=C2=A0 lib/vdso: remove struct arch_vdso_data from vdso data struct<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Thanks for the quick fix! I confirmed these patches work for me.=
=C2=A0</div></div><div class=3D"gmail_default" style=3D"font-size:small">(t=
ested with latest mainline kernel v5.12-rc4)</div><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Tested-by: Li Wang &lt;<a=
 href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><di=
v><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000060095605be58978f--


--===============1968384225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1968384225==--

