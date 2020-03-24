Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A15091905B5
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 07:27:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 219B43C4D2C
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 07:27:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A4BB83C4D22
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 07:27:38 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C69731400FAE
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 07:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585031256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yc7i34TrIychrGPYYTux171Y+C0lo0JSheP5F8igllo=;
 b=cfgD7mTL/8ig5FvLo8gQWuRkj6Zvn62Uh8XXZ5L1tAuWDnD05fRR8c0qpzwRzN60Mxxe8i
 ejIShuKxEBzFTIifTCFiagn/esBkeJSJTjsY3mAF99YwiqTiL+mRqJrZbQHc7ME9AGpNqW
 D/V+gM2Uiq+dLIk/YZoSevesFOxmnug=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-vahux5vROFqvX700oPH68w-1; Tue, 24 Mar 2020 02:27:31 -0400
X-MC-Unique: vahux5vROFqvX700oPH68w-1
Received: by mail-oi1-f197.google.com with SMTP id 11so4181560oii.8
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PgfgTVJZuA/aQ0j75GsOlInO8J42jY6mHvIy287PgPg=;
 b=agwXX8JaZraPYOoNplYTG/baRYZUweJlXCl5ha2NSYH8onlEg748zDbx9nnkeSyo3Y
 ZruKAkzs+dT0EQXQ/t8d+Ic8S+eTKrw4mtk/wmNMsvvyeCLAj1I+NawN5eoQCasoZgCI
 CW92+UyPP2wC83pIKjokYfunGkpva2G+6bY2GMBUIOCCWwKw0fiyzgaTndRKYz6t8bVs
 eZEvcz62vlLI8SiNN83+Vb+Yt04YoilKcAHkJKBwrD96LAUANK+ZPfa0ns26YsRtGK4j
 yfzdeUypSk4MI+MWy88eO1YBFg6BKyMVM//1ATYiePFwn2fL2mJo9vAfcwGJx5u6VIyV
 1CAQ==
X-Gm-Message-State: ANhLgQ26DP4l8n2RJKtb1PrS8lpinGuZb76FjCq7dn4jZuXv0yBnf0iQ
 5qfrlyXssHhYdAvV3OMYzUUWpGoEdo+OeiH1A635RtLxwnCB19TSqcEahG2Sl01WXkWqWu02R7k
 8KBYiXvw61jzTxSnNMqNUg06wFpg=
X-Received: by 2002:aca:5e88:: with SMTP id s130mr2187323oib.47.1585031250587; 
 Mon, 23 Mar 2020 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvUOiDV2golLxxAcokbR9AaNysl0xeZShTFOkvPGYSkphgnBIF+jyEz4aZ1gp3jiphSis/+r3nU12Xz5k73Rz4=
X-Received: by 2002:aca:5e88:: with SMTP id s130mr2187308oib.47.1585031250267; 
 Mon, 23 Mar 2020 23:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
 <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
 <20200323154907.GB15673@dell5510>
In-Reply-To: <20200323154907.GB15673@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 24 Mar 2020 14:27:19 +0800
Message-ID: <CAEemH2fpJw0T0qkRrhFos22A_E+seRXtZ6Rp4jvxUthAuTOQ_g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============0916516481=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0916516481==
Content-Type: multipart/alternative; boundary="000000000000a1669005a193d834"

--000000000000a1669005a193d834
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Mar 23, 2020 at 11:49 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> ...
> > > > > kernel/syscalls/copy_file_range/copy_file_range02.c
> > > > only affect test6 and test7
> > > >  6) Try to copy contents to a file chattred with +i
> > > >  *    flag -> EPERM
> > > >  * 7) Try to copy contents to a swapfile ->ETXTBSY
> > > Yes, it'd be bad to break all tests due it.
>
> > > Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I
> don't
> > > remember), which returns exit code 255 on error, so it's not possible
> to
> > > distinguish this from the case whether command is not available (any
> idea,
> > > how
> > > to fix it?).
>
> > Maybe we could achieve a tst_cmd_available(char *cmd) in the C version?
> > which uses popen() to open a process like: "whereis/which command" and =
do
> > string parse in the result to see the path(/usr/bin/cmd, /usr/sbin/cmd)
> of
> > the bin if it has been found.
> Or how about loop whole path like whereis/which command? I want to cover
> also
> these "strange systems" (Android and embedded).
>

Yes, looping the whole PATH is necessary. I'd like to go the access() way
which you improved in the last email.


>
> I wonder if to use this all the time (e.g. in safe_run_cmd(), because
> solution
> in tst_run_cmd_fds_() (errno =3D=3D ENOENT) works most of the time. Maybe
> changing
> exit code 255 to something less common (e.g. INT_MAX - 5).
>

That might be feasible. I hope to hear more voices from others here.
@Cyril @Xu what do you think?


> Do you want to use tst_cmd_available() also  not only as API
>

Hmm. I guess we can add a new filed in tst_test struct as '.cmd_check' to
make the command support checking automatically in the setup() phase.
That's not very needed but better to testcase manage if we do.

--=20
Regards,
Li Wang

--000000000000a1669005a193d834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 11:49 PM Petr Vore=
l &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Li,<br>
<br>
...<br>
&gt; &gt; &gt; &gt; kernel/syscalls/copy_file_range/copy_file_range02.c<br>
&gt; &gt; &gt; only affect test6 and test7<br>
&gt; &gt; &gt;=C2=A0 6) Try to copy contents to a file chattred with +i<br>
&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0 flag -&gt; EPERM<br>
&gt; &gt; &gt;=C2=A0 * 7) Try to copy contents to a swapfile -&gt;ETXTBSY<b=
r>
&gt; &gt; Yes, it&#39;d be bad to break all tests due it.<br>
<br>
&gt; &gt; Here is also problem with swapoff (or maybe chattr, mkswap, swapo=
n; I don&#39;t<br>
&gt; &gt; remember), which returns exit code 255 on error, so it&#39;s not =
possible to<br>
&gt; &gt; distinguish this from the case whether command is not available (=
any idea,<br>
&gt; &gt; how<br>
&gt; &gt; to fix it?).<br>
<br>
&gt; Maybe we could achieve a tst_cmd_available(char *cmd) in the C version=
?<br>
&gt; which uses popen() to open a process like: &quot;whereis/which command=
&quot; and do<br>
&gt; string parse in the result to see the path(/usr/bin/cmd, /usr/sbin/cmd=
) of<br>
&gt; the bin if it has been found.<br>
Or how about loop whole path like whereis/which command? I want to cover al=
so<br>
these &quot;strange systems&quot; (Android and embedded).<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Y=
es, looping the whole PATH is necessary. I&#39;d like to go the access() wa=
y which you improved in the last email.</div></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
I wonder if to use this all the time (e.g. in safe_run_cmd(), because solut=
ion<br>
in tst_run_cmd_fds_() (errno =3D=3D ENOENT) works most of the time. Maybe c=
hanging<br>
exit code 255 to something less common (e.g. INT_MAX - 5).<br></blockquote>=
<div><div class=3D"gmail_default" style=3D"font-size:small"></div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">That might be feasible. I hope to hear =
more voices from others here.</div></div><div class=3D"gmail_default" style=
=3D"font-size:small">@Cyril @Xu what do you think?<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Do you want to use tst_cmd_available() also=C2=A0 not only as API<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Hmm. I guess we can add a new filed in tst_test struct as &#39;.cmd_check=
&#39;=C2=A0to make the command support checking automatically in the setup(=
) phase. That&#39;s not very needed but better to testcase manage if we do.=
</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a1669005a193d834--


--===============0916516481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0916516481==--

