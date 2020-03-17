Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DED187BFF
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:27:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5DD93C5605
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:27:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BD45D3C0889
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:27:26 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2E5AE1000DDA
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584437244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E1b52vUacxHGR6ECqCICxxXi0ZgBAhetVIevM7wK1t4=;
 b=idBKWLHcBqvoL0jCHlTzhtlbVnRoxEdmwcvtW3gP0e1xbGYW5Op/ZS+YrRKHT40P4bD8Dc
 qvpBzFuqP7N2xLm09QAZi7YXVPsGE9E09+2STP0eFkwnwGYyiS1GiMDElcilDFthlWgwi0
 1gnYRBEqJ8mycmBPK09xGQxGHfGwdoU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-RU3R502XNnaX1xf2KW1n2g-1; Tue, 17 Mar 2020 05:27:20 -0400
X-MC-Unique: RU3R502XNnaX1xf2KW1n2g-1
Received: by mail-ot1-f69.google.com with SMTP id 31so13459364otl.11
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bj7Y2roBwT61oH0TSkaHwfmyVCWMlvOifSfl+sBbtT8=;
 b=YncmX6mzOVcwGEet4w1ynM+jpu0h40wsm0BAcnti0j5Ge4ntZ+I/owdxMuqcPGHC2y
 85K8Yg7mdEeLfRS31lON5IkWMeEAI5NQBRCB0bCdUVM1dLsCEDAei/tkPBCJ3GDF0AoN
 4YgYbatzDCWF7v84S7PQNijKpnMjv+lzPLM25+FrzvZDBr1GJ/pShzsQY/lwZLQ6wcK2
 4ouqCjImUuApAAOB5VQjDrYImfHtrjf4r4s3IiTOqcGhab56XCuWOSGNW10DZrXbPTFj
 mTvcudReI8vO9HWH9Mq0KjfS7WTP110it6X362nQBWmlfxsbYTlFEn+c9GWZZSm26miE
 3+tA==
X-Gm-Message-State: ANhLgQ2mbErnNcpYLsL0iMb0/iryrr6RYKiScgn3PZxATZKNPqp9BgAm
 WlwxiKbuVHOcMsKDIqkZ+ebu3mRSRJUmcAJSAtGvdEIhtXPOxYfWuFYA1DPeXI32qcYJP+T4WbX
 hABWlWwfGZCzY8nEUDpV0fHckrxc=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2802536otf.26.1584437239155; 
 Tue, 17 Mar 2020 02:27:19 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtpqElRNqOhERfzm+tPkjWIi/OYIgpO9g0Dih65bCmumU3G0b4jvJNaZTpStGPl9hRdYv+U0BwS2myUnfH2bZk=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2802525otf.26.1584437238946; 
 Tue, 17 Mar 2020 02:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
 <20200317081547.GA15989@dell5510>
 <CAEemH2dCckuUw=x-yKpBe4FpjTdovytSqpOoRSTFiR96_ECeDA@mail.gmail.com>
 <20200317090412.GA31467@dell5510>
In-Reply-To: <20200317090412.GA31467@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 17:27:07 +0800
Message-ID: <CAEemH2dxrEdFxaro_e3roe=VUs6_mbnSLdfV4kz4OA09hiw08Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0771102239=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0771102239==
Content-Type: multipart/alternative; boundary="000000000000cbf19605a1098a98"

--000000000000cbf19605a1098a98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Mar 17, 2020 at 5:04 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > > The oldest system in travis we have CentOS 6: kernel-2.6.32 /
> glibc-2.12 /
> > > gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to
> have
> > > this
> > > older dependency, just to make sure it builds.  But code would be
> cleaner
> > > for
> > > sure if we drop it.
>
> > +1
> > Sounds good to me.
> I'm sorry, are you for removing CentOS 6 from Travis or not?
>

I previously think these words mean that only make sure LTP build passes on
CentOS6(but not remove it).

But removing is also Ok to me, we can do that after we reaching an
agreement on the supporting package-version and write it down in Docs. That
probably occurring in the next release if everything goes well:).

--=20
Regards,
Li Wang

--000000000000cbf19605a1098a98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 5:04 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi L=
i,<br>
<br>
&gt; &gt; The oldest system in travis we have CentOS 6: kernel-2.6.32 / gli=
bc-2.12 /<br>
&gt; &gt; gcc-4.4.7 (clang-3.4.2, but we don&#39;t test it with clang). I&#=
39;m ok to have<br>
&gt; &gt; this<br>
&gt; &gt; older dependency, just to make sure it builds.=C2=A0 But code wou=
ld be cleaner<br>
&gt; &gt; for<br>
&gt; &gt; sure if we drop it.<br>
<br>
&gt; +1<br>
&gt; Sounds good to me.<br>
I&#39;m sorry, are you for removing CentOS 6 from Travis or not?<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I previously=C2=A0think these words mean that only make sure LTP buil=
d passes on CentOS6(but not remove it).</div></div><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">But removing is also Ok =
to me, we can do that after we reaching an agreement on the supporting pack=
age-version and write it down in Docs. That probably occurring in the next =
release if everything goes well:).</div></div><div>=C2=A0</div></div>-- <br=
><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--000000000000cbf19605a1098a98--


--===============0771102239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0771102239==--

