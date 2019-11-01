Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192FEBD6C
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 07:03:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9AE23C249D
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 07:03:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9408F3C2419
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 07:03:30 +0100 (CET)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C80F5600664
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 07:03:29 +0100 (CET)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D277C05A1C0
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 06:03:27 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id t185so5532515oif.13
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 23:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fg1wUxVMAwkjyPRT7WbgQ1MpTRC7TqlCpb7LnXWpOOM=;
 b=TsX1DUSyYrzmcGv/9in375vA+dSjNMtTx8sRMVYjqKflDxHxs9mIUtyP95PNZQyov2
 j05sgtKbhgi2UZQZ29Qfe4i5+RR6g0Vl3VBGCcN4EuWdnasg/7hSfP0v+0t61a3sYCI2
 b0beYIxP2AVd31IQ5ZY5LcwFbbcWeQ0avYj3yD2OlP+cDU99iICPAjR+ffXAO2V8ukwE
 /y/aBzYEm6wOjbjqxzcKJNhfxKx4+ahEEqAfrCBTK8aaU4H8R4gPfnPr0AG+V1Pi4U9C
 qVzFVdzKZsJuRIzZ0a9sm1+05H3dKp26fYsQ1UmWLWhSH8vdhA2oFxQcD9LwbbITjnx+
 hyKw==
X-Gm-Message-State: APjAAAU3i0xWhC3MtryHGm8y5yJ9/lfLXR71LVyIX9vo0/k5/NMaEQeh
 u/Bg+myz+q2DCny+qxM99xN9DUa7L2WS2JkQW52JE+hKQmULgs74sN0j4nPiev2vXZDppFhyOZM
 uO2CjIY6odHDTtkkZDB5Ap3ZzvL0=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr2436124oia.153.1572588207116; 
 Thu, 31 Oct 2019 23:03:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynXpqC/qbIB+UU7LGUsBLIGguTJKvn8JrcMp67tCRE1s4TfcT5Q+nlVZN6gWwIc9jXC7B36LSB+2Hhsy2d0jY=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr2436097oia.153.1572588206465; 
 Thu, 31 Oct 2019 23:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
 <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
 <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
In-Reply-To: <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 1 Nov 2019 14:03:15 +0800
Message-ID: <CAEemH2eT1aAujLbt7HtuBo1gpE2OadYFuBCf5fiaVKxboj7TtQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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
Content-Type: multipart/mixed; boundary="===============2034442921=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2034442921==
Content-Type: multipart/alternative; boundary="0000000000006cca50059642b9b3"

--0000000000006cca50059642b9b3
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 4:53 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > > Above was RHEL7. Do you expect different outcome on RHEL8?
> > > I was looking at upstream sources too and it looked similar.
> > >
> > > Anyway, I don't think this part is an issue, test will skip it
> > > because "comm" doesn't match.
> > >
> > > We can tweak 'ac_btime' condition, but I think the test will remain
> > >
> >
> > How much time of the ac_btime shaking to be tolerated is proper?
>
> I wanted to go with 1 sec:
>

I'm ok with that. Seems no better way so far.


>
> @@ -83,7 +83,7 @@ static int verify_acct(void *acc, int elap_time)
>                 ret = 1;
>         }
>
> -       if (ACCT_MEMBER(ac_btime) < start_time) {
> +       if (ACCT_MEMBER(ac_btime) + 1 < start_time) {
>                 tst_res(TINFO, "ac_btime < %d (%d)", start_time,
>                         ACCT_MEMBER(ac_btime));
>                 ret = 1;
>
> >
> > > race-y in environments with higher steal time:
> > >
> >
> > I'm sorry, what does it mean here?
>
> I was referring to failed check below. s390 is scarce resource
> and when over-committed, sleeps are less consistent.
> E.g. sleep(1) taking 2+ seconds:
>   nanosleep({1, 0}, NULL) = 0 <1.926617>
>

Okay.

>
> >
> >
> >
> > >
> > > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > > acct02.c:192: INFO: == entry 1 ==
> > > acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> > > acct02.c:192: INFO: == entry 2 ==
> > > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > > acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> > > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > > acct02.c:141: INFO: ac_ppid != 43213 (43212)
> > > acct02.c:182: FAIL: end of file reached
>


-- 
Regards,
Li Wang

--0000000000006cca50059642b9b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2019 at 4:53 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; &gt; Above was RHEL7. Do you expect different outcome on RHEL8?<br>
&gt; &gt; I was looking at upstream sources too and it looked similar.<br>
&gt; &gt;<br>
&gt; &gt; Anyway, I don&#39;t think this part is an issue, test will skip i=
t<br>
&gt; &gt; because &quot;comm&quot; doesn&#39;t match.<br>
&gt; &gt;<br>
&gt; &gt; We can tweak &#39;ac_btime&#39; condition, but I think the test w=
ill remain<br>
&gt; &gt;<br>
&gt; <br>
&gt; How much time of the ac_btime shaking to be tolerated is proper?<br>
<br>
I wanted to go with 1 sec:<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;m ok with that. Seems no=
 better way so far.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
@@ -83,7 +83,7 @@ static int verify_acct(void *acc, int elap_time)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ACCT_MEMBER(ac_btime) &lt; start_time) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ACCT_MEMBER(ac_btime) + 1 &lt; start_time) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quo=
t;ac_btime &lt; %d (%d)&quot;, start_time,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ACCT_MEMBER(ac_btime));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
<br>
&gt; <br>
&gt; &gt; race-y in environments with higher steal time:<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m sorry, what does it mean here?<br>
<br>
I was referring to failed check below. s390 is scarce resource<br>
and when over-committed, sleeps are less consistent.<br>
E.g. sleep(1) taking 2+ seconds:<br>
=C2=A0 nanosleep({1, 0}, NULL) =3D 0 &lt;1.926617&gt;<br></blockquote><div>=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Okay.</div=
><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; acct02.c:239: INFO: Verifying using &#39;struct acct_v3&#39;<br>
&gt; &gt; acct02.c:192: INFO: =3D=3D entry 1 =3D=3D<br>
&gt; &gt; acct02.c:127: INFO: elap_time/clock_ticks &gt;=3D 2 (236/100: 2.0=
0)<br>
&gt; &gt; acct02.c:192: INFO: =3D=3D entry 2 =3D=3D<br>
&gt; &gt; acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (&#39;acc=
t02&#39;)<br>
&gt; &gt; acct02.c:127: INFO: elap_time/clock_ticks &gt;=3D 2 (236/100: 2.0=
0)<br>
&gt; &gt; acct02.c:133: INFO: ac_exitcode !=3D 32768 (0)<br>
&gt; &gt; acct02.c:141: INFO: ac_ppid !=3D 43213 (43212)<br>
&gt; &gt; acct02.c:182: FAIL: end of file reached<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000006cca50059642b9b3--

--===============2034442921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2034442921==--
