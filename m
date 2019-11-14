Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CBFC1A1
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:37:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 170333C1CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:37:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 780EC3C183D
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:37:06 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 85327100454D
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573720621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGN9qd/9wWiIKKdibZIE4w5/TCap5VXmPsHdvYmfxso=;
 b=MyQ1dSiY6Wkd7Wa5ZfgspQ99bqb5ZFD8fs9+vipMiwy9lX8VMY+M4g3JO5WRDDGCR+WUvV
 HAaAaWWFnk/7h1Y4X9Y9X5hHa4wq/IALuCOaC9HrAWlU97oZhHPU+XAWTMr7xjXsi5T8Sr
 615nXPaZ5TvBfw3L6VVM/45tnLuk24c=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-rQPqSQSOMYeyd5ERZLoRpA-1; Thu, 14 Nov 2019 03:37:00 -0500
Received: by mail-ot1-f70.google.com with SMTP id l17so2835110otp.13
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 00:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCOKdguwGrqFOMdRZfn0RF3FIXu0W70d/q6TN/gbbgI=;
 b=nyge9WZPgQvK7RDVrKuwBhIyYf7ICay0D3QcqbtqyUgYBnECYGQriELo7DrBGk1d18
 5FR9EIzO/yFa8sGOFldXZeB7lwjb88BOz9LVo2Frm+QKW0HKjVbgQxkZkJ57xzk0Ganq
 BiVZmwgojXknnepSREyLLwDmxBky4HSK3sCnTfhxLair1+YlGtDCx7jpwSEiiTdmYPyj
 +5PrQTDpsAzL+Fd+v8bnWxx/TepGgzH8dFeGfwSJ9nta2GRG6khsCmk8La+UA8xE1BFA
 Ym1YD5uIGhLvP09EnaM6Ge+ky4IqbwWQRnxJfP+Q8XGQXuPReFtHYT7K5728g47afCHe
 L6Hg==
X-Gm-Message-State: APjAAAVJQb2DTgUVaQQ3SHVwZAqxcCFFjtGC9M/2eVuvoYlceBl2PiOK
 BEj70thIfUVkeRJLSOooKRzcMK9sW6EmyXAj4UHjYbhG3iDb4nWCKmuDSWTnl87D/4bD6lRhEfC
 DsbLlDiJJo1g7RN64jhn7rsITuZo=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr6757810oto.264.1573720619532; 
 Thu, 14 Nov 2019 00:36:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqznGQmrouSdkeTST7ElVOUDYQoAsqIbd/XtRILqV//x80GMOGBjrrK7NNx26Ogt3B1PXjcSz73wvvaXqtGwNeQ=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr6757798oto.264.1573720619256; 
 Thu, 14 Nov 2019 00:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
 <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
 <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
In-Reply-To: <1c4d8fb5-58e4-5483-26c7-7ab38b5fbd9c@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 14 Nov 2019 16:36:47 +0800
Message-ID: <CAEemH2dPwqX1FtNvF7=hxbAfVMz7i_u+TpUBaU1mqKhY-G0Vig@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
X-MC-Unique: rQPqSQSOMYeyd5ERZLoRpA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0316335736=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0316335736==
Content-Type: multipart/alternative; boundary="0000000000007ca90705974a629a"

--0000000000007ca90705974a629a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 4:09 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> Hi,
> >
> >     Defining AC_ARG_WITH within an if to express dependencies does not
> >     work.
> >     ./configure --with-realtime-testsuite set
> with_realtime_testsuite=3Dyes,
> >     even if with_bash=3Dno or with_python=3Dno. The check is removed
> >     completely.
> >
> >
> > Or, maybe we can make use of AS_IF here? and I noticed there are many
> > places that use "if test ..." in the configure.ac
> > <http://configure.ac> file. That looks tangly...
> I left a TODO in there so it can be fixed later, maybe together with
> other errors. I think this does not block merging this patch first?
>

Well, I just saw adding new #TODO here and hoping to solve this together, a
simple way I was thinking is:

+AS_IF([test "x$with_bash" !=3D xyes || test "x$with_python" !=3D xyes],
+  [with_realtime_testsuite=3Dno]
+)

Of course, It's fine to fix that in a separate patch!


> The python requirement for realtime-testsuite is outdated/wrong anyway,
> if I remember correctly. A colleague of mine recently
> investigated the python requirement and we came to the conclusion, that
> it is not needed for running the test.
> I think it was used only for manual test result evaluation.


> So there seems to be more work regarding dependencies between configure
> options.
>

Yes, thanks for investigating this. Looking forward to more patches :).

For this one:
    Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--0000000000007ca90705974a629a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 14, 2019 at 4:09 PM Joerg Vehlow &lt;<a=
 href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Defining AC_ARG_WITH within an if to express depend=
encies does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0work.<br>
&gt;=C2=A0 =C2=A0 =C2=A0./configure --with-realtime-testsuite set with_real=
time_testsuite=3Dyes,<br>
&gt;=C2=A0 =C2=A0 =C2=A0even if with_bash=3Dno or with_python=3Dno. The che=
ck is removed<br>
&gt;=C2=A0 =C2=A0 =C2=A0completely.<br>
&gt;<br>
&gt;<br>
&gt; Or, maybe we can make use of AS_IF here? and I noticed there are many =
<br>
&gt; places that use &quot;if test ...&quot; in the <a href=3D"http://confi=
gure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> <br>
&gt; &lt;<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blan=
k">http://configure.ac</a>&gt; file. That looks=C2=A0tangly...<br>
I left a TODO in there so it can be fixed later, maybe together with <br>
other errors. I think this does not block merging this patch first?<br></bl=
ockquote><div><br></div><div><span class=3D"gmail_default" style=3D"font-si=
ze:small">Well,</span>=C2=A0I just saw adding new #TODO here and hop<span c=
lass=3D"gmail_default" style=3D"font-size:small">ing</span> to=C2=A0solve=
=C2=A0this together, a simple way I was<span class=3D"gmail_default" style=
=3D"font-size:small"></span> thinking is:<br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">+AS_IF([test &quot;x$with_bash&quot; !=3D xyes || test=
 &quot;x$with_python&quot; !=3D xyes],<br>+ =C2=A0[with_realtime_testsuite=
=3Dno]<br>+)</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Of course, I=
t&#39;s fine to fix that in a separate patch!</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
The python requirement for realtime-testsuite is outdated/wrong anyway, <br=
>
if I remember correctly. A colleague of mine recently<br>
investigated the python requirement and we came to the conclusion, that <br=
>
it is not needed for running the test.<br>
I think it was used only for manual test result evaluation.=C2=A0</blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So there seems to be more work regarding dependencies between configure <br=
>
options.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Yes, thanks for investigating this. Looking forwar=
d to more patches :).</div><div></div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><div class=3D"gmail_default">For this one:</div><div class=3D=
"gmail_default">=C2=A0 =C2=A0 Reviewed-by: Li Wang &lt;<a href=3D"mailto:li=
wang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--0000000000007ca90705974a629a--


--===============0316335736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0316335736==--

