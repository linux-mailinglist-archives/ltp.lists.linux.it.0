Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9FEABB5
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:43:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123AF3C22BC
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:43:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 424253C1C8A
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:43:37 +0100 (CET)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D54381A00459
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:43:35 +0100 (CET)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4805A85537
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 08:43:33 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id g3so3155275otq.6
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 01:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETEva3rGOIjlhymH4C/bALHaiR1nGbbDOYhwwrX8Vyc=;
 b=fWgQsrmZpDDKoUEIJ/USqiCNkN+3gQlbOf3zQRzFRmnmHYwbWCPCgecQg7KNVn9QH4
 RIyXVl2VfILsOJzQEvi4wnU5J7bR2Tzk5GzQD8ZpBthbqgbPlcArCPteF2PAkbIU1esD
 Fg27YWmiv1VCUn5xDQYC+LzrtmCoOkchC1kdrhfaIYuamrBB0KLrZbJ7WTYgaZ03PQ5U
 qELZCElsiqVEViCUkb0CvNtp3GMmulPr+VasPv2cDIamP3pAV2R+NzhIbRwLFBROAcQ1
 dmTcUU7aNh7Kn1uz4XvpAAGR4jmJElqyyKEDZmvOeyLk8NOz7Pp1mWuZSL+KExd2sIzm
 JQQg==
X-Gm-Message-State: APjAAAXuu0WPqkQvEZhZrD/MwqZMmsFAD5LwQK7jEbVcJmj4ty674ITM
 indp+9KYpXBL0hkQS21Nd8efazKAlvdKDVgnhmXjThh48OFS0MtVbkhBiq37CZUPBXe13MFEmbP
 AKqVobWQQL0wKqnWAleGmj4S19S8=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr3011045oia.153.1572511412614; 
 Thu, 31 Oct 2019 01:43:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD1lFDdduANWeL88F9LOrEc00Nyeq0V+FxP5QEmzEC/T/SCByBpioXQkJj3xDYrw4pO9ojZGCNTUhA9Ph7dto=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr3011029oia.153.1572511412371; 
 Thu, 31 Oct 2019 01:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
In-Reply-To: <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Oct 2019 16:43:20 +0800
Message-ID: <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0310328471=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0310328471==
Content-Type: multipart/alternative; boundary="00000000000023da4a059630d81e"

--00000000000023da4a059630d81e
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 1:41 AM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Hi Jan,
> >
> > > > I'm seeing similar failure:
> >
> > > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > tst_kconfig.c:62: INFO: Parsing kernel config
> > > > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > > > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > > > acct02.c:192: INFO: == entry 1 ==
> > > > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> >
> > > ^^ This is 'acct02_helper', which seemingly started before
> 'start_time'.
> >
> > > ac_btime is calculated back from current time and elapsed time at
> > > fill_ac():
> >
> > >   ac->ac_btime = get_seconds() - elapsed;
> >
> > > s390s are slower, so my guess is another second ticks before btime gets
> > > calculated,
> > > and it appears to have started later.
> > Agree.
> >
> > > > acct02.c:192: INFO: == entry 2 ==
> > > > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > > > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> > > > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > > > acct02.c:141: INFO: ac_ppid != 25608 (25607)
> >
> > > The 2nd record is filled at acct(NULL), even though process still runs:
> >
> > > [ 1156.025654] CPU: 0 PID: 11772 Comm: acct02_helper Tainted: G
> > > OE  ------------   3.10.0-1106.el7.s390x #1
> > > <>
> > > [ 1156.027105]  [<00000000001dd630>] fill_ac+0x0/0x440
> > > [ 1156.027108] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> > > [ 1156.027110]  [<00000000001de3ae>] acct_process+0xf6/0x140
> > > [ 1156.027112]  [<000000000014de32>] do_exit+0x752/0xa38
> > > [ 1156.027116]  [<000000000014e216>] do_group_exit+0x66/0xf8
> > > [ 1156.027118]  [<000000000014e2ea>] SyS_exit_group+0x42/0x48
> >
> > > [ 1157.033294] CPU: 1 PID: 11771 Comm: acct02 Tainted: G           OE
> > > ------------   3.10.0-1106.el7.s390x #1
> > > <>
> > > [ 1157.033384]  [<00000000001dd630>] fill_ac+0x0/0x440
> > > [ 1157.033386] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> > > [ 1157.033389]  [<00000000001ddcda>] acct_pin_kill+0x52/0xa8
> > > [ 1157.033391]  [<000000000034a83e>] pin_kill+0xb6/0x178
> > > [ 1157.033395]  [<00000000001ddfe8>] SyS_acct+0x2b8/0x350
> >
> > Hm, did you reproduce it on 4.18 (rhel8)?
>
> Above was RHEL7. Do you expect different outcome on RHEL8?
> I was looking at upstream sources too and it looked similar.
>
> Anyway, I don't think this part is an issue, test will skip it
> because "comm" doesn't match.
>
> We can tweak 'ac_btime' condition, but I think the test will remain
>

How much time of the ac_btime shaking to be tolerated is proper?

> race-y in environments with higher steal time:
>

I'm sorry, what does it mean here?



>
> acct02.c:239: INFO: Verifying using 'struct acct_v3'
> acct02.c:192: INFO: == entry 1 ==
> acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> acct02.c:192: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:127: INFO: elap_time/clock_ticks >= 2 (236/100: 2.00)
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 43213 (43212)
> acct02.c:182: FAIL: end of file reached
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--00000000000023da4a059630d81e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2019 at 1:41 AM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
----- Original Message -----<br>
&gt; Hi Jan,<br>
&gt; <br>
&gt; &gt; &gt; I&#39;m seeing similar failure:<br>
&gt; <br>
&gt; &gt; &gt; tst_kconfig.c:62: INFO: Parsing kernel config<br>
&gt; &gt; &gt; &#39;/boot/config-3.10.0-1106.el7.cki.s390x&#39;<br>
&gt; &gt; &gt; tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s<br>
&gt; &gt; &gt; tst_kconfig.c:62: INFO: Parsing kernel config<br>
&gt; &gt; &gt; &#39;/boot/config-3.10.0-1106.el7.cki.s390x&#39;<br>
&gt; &gt; &gt; acct02.c:239: INFO: Verifying using &#39;struct acct_v3&#39;=
<br>
&gt; &gt; &gt; acct02.c:192: INFO: =3D=3D entry 1 =3D=3D<br>
&gt; &gt; &gt; acct02.c:88: INFO: ac_btime &lt; 1572367954 (1572367953)<br>
&gt; <br>
&gt; &gt; ^^ This is &#39;acct02_helper&#39;, which seemingly started befor=
e &#39;start_time&#39;.<br>
&gt; <br>
&gt; &gt; ac_btime is calculated back from current time and elapsed time at=
<br>
&gt; &gt; fill_ac():<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0ac-&gt;ac_btime =3D get_seconds() - elapsed;<br>
&gt; <br>
&gt; &gt; s390s are slower, so my guess is another second ticks before btim=
e gets<br>
&gt; &gt; calculated,<br>
&gt; &gt; and it appears to have started later.<br>
&gt; Agree.<br>
&gt; <br>
&gt; &gt; &gt; acct02.c:192: INFO: =3D=3D entry 2 =3D=3D<br>
&gt; &gt; &gt; acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (&#3=
9;acct02&#39;)<br>
&gt; &gt; &gt; acct02.c:88: INFO: ac_btime &lt; 1572367954 (1572367953)<br>
&gt; &gt; &gt; acct02.c:133: INFO: ac_exitcode !=3D 32768 (0)<br>
&gt; &gt; &gt; acct02.c:141: INFO: ac_ppid !=3D 25608 (25607)<br>
&gt; <br>
&gt; &gt; The 2nd record is filled at acct(NULL), even though process still=
 runs:<br>
&gt; <br>
&gt; &gt; [ 1156.025654] CPU: 0 PID: 11772 Comm: acct02_helper Tainted: G<b=
r>
&gt; &gt; OE=C2=A0 ------------=C2=A0 =C2=A03.10.0-1106.el7.s390x #1<br>
&gt; &gt; &lt;&gt;<br>
&gt; &gt; [ 1156.027105]=C2=A0 [&lt;00000000001dd630&gt;] fill_ac+0x0/0x440=
<br>
&gt; &gt; [ 1156.027108] ([&lt;00000000001ddae8&gt;] do_acct_process+0x78/0=
x1a0)<br>
&gt; &gt; [ 1156.027110]=C2=A0 [&lt;00000000001de3ae&gt;] acct_process+0xf6=
/0x140<br>
&gt; &gt; [ 1156.027112]=C2=A0 [&lt;000000000014de32&gt;] do_exit+0x752/0xa=
38<br>
&gt; &gt; [ 1156.027116]=C2=A0 [&lt;000000000014e216&gt;] do_group_exit+0x6=
6/0xf8<br>
&gt; &gt; [ 1156.027118]=C2=A0 [&lt;000000000014e2ea&gt;] SyS_exit_group+0x=
42/0x48<br>
&gt; <br>
&gt; &gt; [ 1157.033294] CPU: 1 PID: 11771 Comm: acct02 Tainted: G=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OE<br>
&gt; &gt; ------------=C2=A0 =C2=A03.10.0-1106.el7.s390x #1<br>
&gt; &gt; &lt;&gt;<br>
&gt; &gt; [ 1157.033384]=C2=A0 [&lt;00000000001dd630&gt;] fill_ac+0x0/0x440=
<br>
&gt; &gt; [ 1157.033386] ([&lt;00000000001ddae8&gt;] do_acct_process+0x78/0=
x1a0)<br>
&gt; &gt; [ 1157.033389]=C2=A0 [&lt;00000000001ddcda&gt;] acct_pin_kill+0x5=
2/0xa8<br>
&gt; &gt; [ 1157.033391]=C2=A0 [&lt;000000000034a83e&gt;] pin_kill+0xb6/0x1=
78<br>
&gt; &gt; [ 1157.033395]=C2=A0 [&lt;00000000001ddfe8&gt;] SyS_acct+0x2b8/0x=
350<br>
&gt; <br>
&gt; Hm, did you reproduce it on 4.18 (rhel8)?<br>
<br>
Above was RHEL7. Do you expect different outcome on RHEL8?<br>
I was looking at upstream sources too and it looked similar.<br>
<br>
Anyway, I don&#39;t think this part is an issue, test will skip it<br>
because &quot;comm&quot; doesn&#39;t match.<br>
<br>
We can tweak &#39;ac_btime&#39; condition, but I think the test will remain=
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">How much time of the ac_btime=C2=A0shaking to be tolerated is p=
roper?</div><div class=3D"gmail_default" style=3D"font-size:small"></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
race-y in environments with higher steal time:<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m sorr=
y, what does it mean here?</div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small"></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
acct02.c:239: INFO: Verifying using &#39;struct acct_v3&#39;<br>
acct02.c:192: INFO: =3D=3D entry 1 =3D=3D<br>
acct02.c:127: INFO: elap_time/clock_ticks &gt;=3D 2 (236/100: 2.00)<br>
acct02.c:192: INFO: =3D=3D entry 2 =3D=3D<br>
acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (&#39;acct02&#39;)<=
br>
acct02.c:127: INFO: elap_time/clock_ticks &gt;=3D 2 (236/100: 2.00)<br>
acct02.c:133: INFO: ac_exitcode !=3D 32768 (0)<br>
acct02.c:141: INFO: ac_ppid !=3D 43213 (43212)<br>
acct02.c:182: FAIL: end of file reached<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000023da4a059630d81e--

--===============0310328471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0310328471==--
