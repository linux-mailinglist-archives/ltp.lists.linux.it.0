Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8C2FA089
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:57:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF31E3C3159
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:57:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EB6CC3C2403
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:57:23 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5472A6008AC
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610974642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GpcsbyDMjaHsg+X6aGBvp+PoGM9oYJPbdyyriONUKgg=;
 b=N01vFA2nvEczJlstiwt4KRJmy3nV7zacPn8wkyJOpvhOfi2P9blZABcjcfDIzjyCsmvQvS
 TZqKHBwCfTz4rqoDE4JTP6ZjBsPKDyd/P4ZJS3H1dzahDlvtmUxXtBT5iO7LrAfUIJmH6W
 FSDd1j6lCXlTZ9UKO3XSdLkgvG7vXYo=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-grY5oIo7MTSfnBXSumyYIg-1; Mon, 18 Jan 2021 07:57:19 -0500
X-MC-Unique: grY5oIo7MTSfnBXSumyYIg-1
Received: by mail-yb1-f197.google.com with SMTP id w8so20699528ybj.14
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 04:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpcsbyDMjaHsg+X6aGBvp+PoGM9oYJPbdyyriONUKgg=;
 b=KGFavC2xUGP5h4sWIC7SNYfMT8kuNh/BeBznOGhVdqjqC9acf3oH6nNDza3l+mD6tL
 mD888fZ+ORYz4SMLB7+eiPx6Dy2J3sb/ju5nlrheU9ZGh60ZQT6lspoMFOM/EN9huFPu
 o8F0RLE6iuB9O+Rffu+tha8kl4Y3k33K5k8Y1kn+aq2ZvascxyVcg8OeuTUdNFArgULj
 TrGVZCNhm3nIjOjKYqjsR7fim583W5JJ43C3z0O+AW7mfB1FxWx1uNacEPpA7dK+Z9WU
 eqaN9iXKlEquFH10kP/co3+QDqScYzfL6HI6YIBDW1D2Wym3y5zQK3MTDCEf7IZK9Z/6
 t4Cw==
X-Gm-Message-State: AOAM533x5hzWWmE01cbUJ1Z52jNsLR6s/TrJh2Ph+BdFJ4a/RYgXesVK
 +bsZPkKfnAl/Oaz8xH6cwXZyYs2jWDEMhrGEoylLRNMu4/sWwufdWnSSm9CdHNBmx//VKRBG8Wt
 Y7aVaM6MEB/L2ODNRIRbtkJhOY9s=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr36008604ybe.403.1610974639129; 
 Mon, 18 Jan 2021 04:57:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvYPZITAV+H21jO/kG8diiYNBMxT5sWEKXCIYjtjon9m/KtvusRHN4mbIwc/3tKblyC47BlNzuc/Oq8BekdqU=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr36008587ybe.403.1610974638912; 
 Mon, 18 Jan 2021 04:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
In-Reply-To: <20210115143246.369676-1-egorenar@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 18 Jan 2021 20:57:07 +0800
Message-ID: <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Content-Type: multipart/mixed; boundary="===============0486168578=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0486168578==
Content-Type: multipart/alternative; boundary="000000000000184eda05b92c4398"

--000000000000184eda05b92c4398
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> ...
> swapping01.c:106: TINFO: available physical memory:* 7348 MB*
> swapping01.c:109: TINFO: try to allocate: 9552 MB
> swapping01.c:112: TINFO: memory allocated: 9552 MB
> swapping01.c:140: TINFO: swap free init: 25019 MB
> swapping01.c:141: TINFO: swap free now: 20484 MB
> swapping01.c:149: TPASS: no heavy swapping detected, *4534 MB swapped.*
> ...
> swapping01.c:106: TINFO: available physical memory:* 7318 MB*
> swapping01.c:109: TINFO: try to allocate: 9514 MB
> swapping01.c:112: TINFO: memory allocated: 9514 MB
> swapping01.c:140: TINFO: swap free init: 25019 MB
> swapping01.c:141: TINFO: swap free now: 17697 MB
> swapping01.c:145: TFAIL: heavy swapping detected:* 7322 MB swapped.*
>

Looking at the memory status from the output, it only detects available
memory 7318MB in the fourth time (< 7348MB, second/third time).
But memory heavy swapped in the third and fourth time(7323MB, 7322MB
swapped).

Obviously, the last two tests influenced by the first-three running.

How reproducible of this FAIL? And, Could you help verify whether the
following cleanup works?
(Also, provide /proc/meminfo or kernel version will help to locate the
issues).

--- a/testcases/kernel/mem/swapping/swapping01.c
+++ b/testcases/kernel/mem/swapping/swapping01.c
@@ -81,6 +81,7 @@ static void test_swapping(void)

 static void init_meminfo(void)
 {
+       SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
        swap_free_init = SAFE_READ_MEMINFO("SwapFree:");
        if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
                &mem_available_init)) {

-- 
Regards,
Li Wang

--000000000000184eda05b92c4398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexander,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Alexander Egorenkov &lt;<a href=3D"mailto:egorenar@linux=
.ibm.com" target=3D"_blank">egorenar@linux.ibm.com</a>&gt; wrote:</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default"=
 style=3D"font-size:small">...</span><br>
swapping01.c:106: TINFO: available physical memory:<b> 7348 MB</b><br>
swapping01.c:109: TINFO: try to allocate: 9552 MB<br>
swapping01.c:112: TINFO: memory allocated: 9552 MB<br>
swapping01.c:140: TINFO: swap free init: 25019 MB<br>
swapping01.c:141: TINFO: swap free now: 20484 MB<br>
swapping01.c:149: TPASS: no heavy swapping detected, <b>4534 MB swapped.</b=
><br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
swapping01.c:106: TINFO: available physical memory:<b> 7318 MB</b><br>
swapping01.c:109: TINFO: try to allocate: 9514 MB<br>
swapping01.c:112: TINFO: memory allocated: 9514 MB<br>
swapping01.c:140: TINFO: swap free init: 25019 MB<br>
swapping01.c:141: TINFO: swap free now: 17697 MB<br>
swapping01.c:145: TFAIL: heavy swapping detected:<b> 7322 MB swapped.</b><b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Looking at the memory status from the output, it only detect=
s available</div><div class=3D"gmail_default" style=3D"font-size:small">mem=
ory 7318MB in the fourth time (&lt; 7348MB, second/third time).</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">But memory heavy swapped i=
n the third and fourth time(7323MB, 7322MB swapped).</div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Obviously, the last tw=
o tests=C2=A0influenced by the first-three running.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">How reproducible of this FAIL? And, Coul=
d you help verify whether the following cleanup works?</div></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">(Also, provide /proc/meminfo =
or kernel version will help to locate the issues).</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">--- a/testcases/kernel/mem/swapping/swapping01.c<=
br>+++ b/testcases/kernel/mem/swapping/swapping01.c<br>@@ -81,6 +81,7 @@ st=
atic void test_swapping(void)<br>=C2=A0<br>=C2=A0static void init_meminfo(v=
oid)<br>=C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(&quot;/proc/sys/=
vm/drop_caches&quot;, &quot;3&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 swap_f=
ree_init =3D SAFE_READ_MEMINFO(&quot;SwapFree:&quot;);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (FILE_LINES_SCANF(&quot;/proc/meminfo&quot;, &quot;MemAvailab=
le: %ld&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;mem_available_init)) {<br></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--000000000000184eda05b92c4398--


--===============0486168578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0486168578==--

