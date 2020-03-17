Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF47187B98
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:54:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 747C83C55F6
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 09:54:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7B39C3C04FD
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:54:15 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id EC57B1A01162
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 09:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584435252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXmT4LfsdKzTM3Bn80+FXql12Vr34sLdkWeP7iL57XM=;
 b=hLxikTC3lCWSZeXMYQeBTLrhOBzGmzPKRdUlk/OSJWN+NCQ7a0ISxMh8ByTtHqtIWe7VDN
 lZTBKuLyUqmEiLP37JCe3XHvRtAJ1F4Fc0IOshlniAaKsIL0+Ft0W8GPulDDcw9nCj+sNP
 lA1X+wCHafUzKA35Sp7c4KNj2K7o2rE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Lbzgy0ahOW6T1wOM-BBlWA-1; Tue, 17 Mar 2020 04:54:07 -0400
X-MC-Unique: Lbzgy0ahOW6T1wOM-BBlWA-1
Received: by mail-ot1-f71.google.com with SMTP id z62so13422414otb.0
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 01:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZuijfuEKT9UwZEeAOf4XXBUjGhTmuyG/NBJ6wNcb28o=;
 b=tIjwcOQSY8AsDmOslJ/wl54DNXV2yC/l5b9Kms2KekhQ11K1NgtHI2YMNpamxY3bIu
 k9Am6LAie3q8RW/wX7hoc7lMFcBleJ/duYVGqn13j9ItQGyiPFIcl+UjwmjDS0jvHwB7
 9V0lyejDWPp82fIrGCBUjKMw3AzpamGSNaHl2L2v1xqk7WtjWzp0mMGjhWofslJSPPsw
 Lm/1y6cw/9F0ZEuzgQWXHvBv6WpVNQZC18lntOcB0DFGyWVFj0Pfxsb82gNcQ/97MOuD
 diCar0cJN9wR68vaBVS2avOMG9cVa5gAI6VzlHU5UxasQ/0igPqzeOZr0YVAqsgEC8uq
 GriQ==
X-Gm-Message-State: ANhLgQ1gwSSmqtxsPTHPhYS2HMVc3l5fs8QCflYyKPOFSyHRMdUPTSc/
 RoGyx74i2vcJmVujdoAaJunhVlHgEPHNBpMuKg2L8SuFAfwu/dRj4TekodWL/2SC5hnqSQA9R72
 Cy5nzQNg6DdDe3ypeXhaW4yrzP9s=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr2916800otb.17.1584435246056; 
 Tue, 17 Mar 2020 01:54:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs3vkhtM9vi45zmU7y3VEKhDiviAHX76ch/slkpn6w153aNLz05pGtkvhNAn6Of7GQAdQrFhojHQgHqhd4VgCQ=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr2916786otb.17.1584435245755; 
 Tue, 17 Mar 2020 01:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
 <20200317081547.GA15989@dell5510>
In-Reply-To: <20200317081547.GA15989@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 16:53:54 +0800
Message-ID: <CAEemH2dCckuUw=x-yKpBe4FpjTdovytSqpOoRSTFiR96_ECeDA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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
Content-Type: multipart/mixed; boundary="===============1175552676=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1175552676==
Content-Type: multipart/alternative; boundary="000000000000fe45ec05a10913e4"

--000000000000fe45ec05a10913e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Mar 17, 2020 at 4:15 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > This is a good topic, thanks for kicking off this initiative!
> Thanks for your input.
>
> > > I'm sorry, I've raised this question in the past, but it got lost.
> > > I remember we talked about 2.6 something.
>
> > Yes, the past discussion is still valuable to us. see:
> > http://lists.linux.it/pipermail/ltp/2019-May/011990.html
> Great, thanks!
>
> > > It'd be good to state publicly the oldest kernel and glibc (or even
> other
> > > libc
> > > versions) we support.  This would allow us to remove some legacy code
> or
> > > force
> > > support for legacy code.
>
>
> > Maybe we could also state the oldest GCC version too? Though I haven't
> seen
> > any conflict or supporting issue from my side, it helps avoid some
> > potential error in cross-compilation I guess.
> +1
> Not sure if we want to specify also clang.
>

I do not use clang often, so I hope others can advise more here.


>
> >     i.e.  kernel-3.10.0 / glibc-2.17 / gcc-4.8.0
> This is for RHEL7 I guess.
>
Correct.


>
> The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 =
/
> gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to have
> this
> older dependency, just to make sure it builds.  But code would be cleaner
> for
> sure if we drop it.
>
+1
Sounds good to me.

>
> BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 /
> glibc-2.11.3 /
> gcc-4.3.4 - older glibc and gcc), but this is not even in travis.
> But for testing these distros we use older releases (the same mentioned
> Jan [1]).
>

Agreed, we can explicitly declare that(in some place of Doc) from a
specific LTP(e.g ltp-full-20200120) version, we don't provide code
supporting for the older kernel/glibc/gcc package anymore. If people who
are going to test old distros, they can just pick up an old released LTP
version and hack it by themself. The latest branch of LTP doesn't accept
that patch for old things.

> I wonder if there is really somebody using 2.6.x or 3.x < 3.10 on master.
> If not, we can drop some lapi files which mention 2.6.
>
> Kind regards,
> Petr
>
> [1] http://lists.linux.it/pipermail/ltp/2019-May/011991.html
>
>

--=20
Regards,
Li Wang

--000000000000fe45ec05a10913e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 4:15 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; This is a good topic, thanks for kicking off this initiative!<br>
Thanks for your input.<br>
<br>
&gt; &gt; I&#39;m sorry, I&#39;ve raised this question in the past, but it =
got lost.<br>
&gt; &gt; I remember we talked about 2.6 something.<br>
<br>
&gt; Yes, the past discussion is still valuable to us. see:<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2019-May/011990.html" r=
el=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/201=
9-May/011990.html</a><br>
Great, thanks!<br>
<br>
&gt; &gt; It&#39;d be good to state publicly the oldest kernel and glibc (o=
r even other<br>
&gt; &gt; libc<br>
&gt; &gt; versions) we support.=C2=A0 This would allow us to remove some le=
gacy code or<br>
&gt; &gt; force<br>
&gt; &gt; support for legacy code.<br>
<br>
<br>
&gt; Maybe we could also state the oldest GCC version too? Though I haven&#=
39;t seen<br>
&gt; any conflict or supporting issue from my side, it helps avoid some<br>
&gt; potential error in cross-compilation I guess.<br>
+1<br>
Not sure if we want to specify also clang.<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">I do not use cla=
ng often, so I hope others can advise more here.</div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0i.e.=C2=A0 kernel-3.10.0 / glibc-2.17 / gcc-4.8.0<b=
r>
This is for RHEL7 I guess.<br></blockquote><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small">Correct.=C2=A0</span></div><div><span class=3D=
"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 /<=
br>
gcc-4.4.7 (clang-3.4.2, but we don&#39;t test it with clang). I&#39;m ok to=
 have this<br>
older dependency, just to make sure it builds.=C2=A0 But code would be clea=
ner for<br>
sure if we drop it.<br></blockquote><div><div class=3D"gmail_default" style=
=3D"font-size:small">+1</div></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Sounds good to me.</div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 / glibc-2.11.=
3 /<br>
gcc-4.3.4 - older glibc and gcc), but this is not even in travis.<br>
But for testing these distros we use older releases (the same mentioned Jan=
 [1]).<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"">Agreed, we can explicitly declare that(in some place of Doc) from a=
 specific LTP(e.g ltp-full-20200120) version, we don&#39;t provide code sup=
porting for the older kernel/glibc/gcc package anymore. If people who are g=
oing to test old distros, they can just pick up an old released LTP version=
 and hack it by themself. The latest branch of LTP doesn&#39;t accept that =
patch for old things.=C2=A0</div></div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
I wonder if there is really somebody using 2.6.x or 3.x &lt; 3.10 on master=
.<br>
If not, we can drop some lapi files which mention 2.6.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"http://lists.linux.it/pipermail/ltp/2019-May/011991.html" re=
l=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/2019=
-May/011991.html</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fe45ec05a10913e4--


--===============1175552676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1175552676==--

