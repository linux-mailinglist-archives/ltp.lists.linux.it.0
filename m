Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0BC10C53E
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:37:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 582F33C22CB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:37:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 752373C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:37:24 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 018AC601068
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574930242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HfVbeHZHBmjXbHDnfv5RGGxQ3548f4gFIYIHAq96sWU=;
 b=flr5KWjhAihMhdxGSggZqBiTaxHMaTOfijud/eEiLk6Ncll00ij67tX3YX6jUDV+/rzp8K
 KfrvsY6atBfS0FCF5nkkfj7qX5Kd33hJg3m5R8BoIJjkqdlHkCcoe9q+fZyuR0xe4caata
 cf5GLJS/94asSZ8+6NHp64GtI+9J1X4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-dKdo9z2-NxeDcYlmIXlJHA-1; Thu, 28 Nov 2019 03:37:21 -0500
Received: by mail-vk1-f200.google.com with SMTP id o144so11748709vko.13
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 00:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6piA86TFX1xwRN2HGIs26MOR9ipyp2EwiEoHCQ3P5WM=;
 b=MBJS1r2uEeBnar/+KMEAOx4e99vybWOr23KHhcCgwnHgJiFRtlOEI7pb4qhchHU1wN
 f9wLZKwx6y6ui01BTFiEzskNnOKD+8Unl6buXrwvlzRMjjC6OeCcbVMhyWlxbxL7QyU2
 kIxT4ljYCrspwCR42eqTCictyhEoYiSuzok9YdU6zPzTSg82GUqUBcZ0cC3dMSm82XoD
 2HXamiGOj4IpAthvxBBs85ZDFkenp29xKWywpJAKLHd8oGJZlYQkAJl3/pDJHeDHd5lw
 OauLi8IZfpzr4iOlMzHNK3HYdp26cLRQvrwW5WgENMD8hjCBlcNvIzvNCtv+pX0jL40L
 4Gaw==
X-Gm-Message-State: APjAAAXkJOKP8AaCSW6VAFaNcJw8ok8Vve4iC1/+ZVwJrRwmeZy71RZw
 s+BTerR4G4fEiHPxwT8D+IiBuxU63BSxCQ4PnBDewuooep6JwUzOiGTlCn3AfejA+NmG8I970Bq
 pvwjQzaS/iNE2l3798ri9mJd7tdk=
X-Received: by 2002:ab0:2716:: with SMTP id s22mr5589972uao.86.1574930240444; 
 Thu, 28 Nov 2019 00:37:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqynq3v+Guo8A8G/e04mRZV422f2AqddaCtPY1On+L9XUR8dtBi01lYViljqWmkmq6FiowixEM7wiFgrYCvBsOQ=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr6434662otf.118.1574930239112; 
 Thu, 28 Nov 2019 00:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20191128082945.6495-1-liwang@redhat.com>
 <1766813779.14211710.1574930105928.JavaMail.zimbra@redhat.com>
In-Reply-To: <1766813779.14211710.1574930105928.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 28 Nov 2019 16:37:08 +0800
Message-ID: <CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: dKdo9z2-NxeDcYlmIXlJHA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED PATCH] mmap1: include lapi/abisize.h header
 file
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
Cc: Zhijun Wang <zhijwang@redhat.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1402676878=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1402676878==
Content-Type: multipart/alternative; boundary="000000000000730974059864058c"

--000000000000730974059864058c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 4:35 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > To get rid of this BROK on i686:
> >  mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOMEM (12=
)
> >
> > Reported-by: Zhijun Wang <zhijwang@redhat.com>
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  testcases/kernel/mem/mtest06/mmap1.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/testcases/kernel/mem/mtest06/mmap1.c
> > b/testcases/kernel/mem/mtest06/mmap1.c
> > index c5417444f..5c7d3df2f 100644
> > --- a/testcases/kernel/mem/mtest06/mmap1.c
> > +++ b/testcases/kernel/mem/mtest06/mmap1.c
> > @@ -30,6 +30,7 @@
> >  #include <stdlib.h>
> >  #include "lapi/abisize.h"
> >  #include "tst_test.h"
> > +#include "lapi/abisize.h"
>
> This sounds familiar:
>   74d9fe32fda9 ("mtest06/mmap1: add missing lapi/abisize.h include")
>

Ah, sorry I was blind for missing this commit. Seems I just git pull&push
my patch.

--=20
Regards,
Li Wang

--000000000000730974059864058c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 28, 2019 at 4:35 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; To get rid of this BROK on i686:<br>
&gt;=C2=A0 mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOM=
EM (12)<br>
&gt; <br>
&gt; Reported-by: Zhijun Wang &lt;<a href=3D"mailto:zhijwang@redhat.com" ta=
rget=3D"_blank">zhijwang@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 testcases/kernel/mem/mtest06/mmap1.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/mem/mtest06/mmap1.c<br>
&gt; b/testcases/kernel/mem/mtest06/mmap1.c<br>
&gt; index c5417444f..5c7d3df2f 100644<br>
&gt; --- a/testcases/kernel/mem/mtest06/mmap1.c<br>
&gt; +++ b/testcases/kernel/mem/mtest06/mmap1.c<br>
&gt; @@ -30,6 +30,7 @@<br>
&gt;=C2=A0 #include &lt;stdlib.h&gt;<br>
&gt;=C2=A0 #include &quot;lapi/abisize.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;lapi/abisize.h&quot;<br>
<br>
This sounds familiar:<br>
=C2=A0 74d9fe32fda9 (&quot;mtest06/mmap1: add missing lapi/abisize.h includ=
e&quot;)<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Ah, sorry I was blind for missing this commit. Seems I=
 just git pull&amp;push my patch.</div></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000730974059864058c--


--===============1402676878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1402676878==--

