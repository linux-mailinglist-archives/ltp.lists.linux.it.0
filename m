Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACF1C6EC8
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 12:56:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3CCB3C261B
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 12:56:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 370883C176A
 for <ltp@lists.linux.it>; Wed,  6 May 2020 12:56:54 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id F19192010E4
 for <ltp@lists.linux.it>; Wed,  6 May 2020 12:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588762612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FoPHSHo8PDSxrkOXzNOwibIIV1IlZ6ycAGVqElZD29I=;
 b=BahIImC3YpUo8pXp8rwi+VPM/Ql7wRFRlhWWkf44Sj2abc7/3UsLHM6r4nrLzy8hbNyQTS
 L8zgcqhyXLoGAFAzBTk0s1rrXBKPpOhWt35jsrdSRj5VzSV1+wIyZAs01AYBrsEvmC50+d
 OLcEL3GCCJLGAvlDud/0YOY3XujWSU8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-8FlAofaVMi2vY8yUTIcOxA-1; Wed, 06 May 2020 06:56:50 -0400
X-MC-Unique: 8FlAofaVMi2vY8yUTIcOxA-1
Received: by mail-lf1-f69.google.com with SMTP id q8so675735lfb.15
 for <ltp@lists.linux.it>; Wed, 06 May 2020 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FoPHSHo8PDSxrkOXzNOwibIIV1IlZ6ycAGVqElZD29I=;
 b=ojyPBpKnl7ykAQ1aGssJU//6Azw5TERC+5hASDJd24SOMERGd7eANF/L7Bovkef+SJ
 H+f6LVwu574BHct0G+g5XNZ3aqtuCohk/MGjmop9XUoyk7L63IpRQ2WIbHmE8f7KPmCv
 WjADx+j9ZNaa2VSxwmBAG1TLZ0coLnrKCYLazcVthE7+2NBlOh9O3FmTJw0gNj40tNs1
 FI59iZwQuZe91VNr7gc9GpWHfoQmh6EsvzP/0EJpLzjaj5agfxOvfnbWa7wnYlWz7XOv
 fbHyFNKTq27WQg3sSyToRrZy2QmydUrtNA4pOLHxnbY5LGRrPvSo0f2Eb/Fgu2sQxaUN
 7WNw==
X-Gm-Message-State: AGi0Pub+olchhbHZDh/Jd5LClF7Xx5yO8ubrLvw7uPWvxpLILnMi6Hw4
 pPwoKtx/ED4x0bHJtnyAzRrnYoME5UlP5IOXCuzgnQR8qaJkYnxBnYd0piNlqaS/hM8cbLtDmd8
 NeSPCXyfQEl+dD9bZya17CqjsypM=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr4459171ljg.217.1588762608610; 
 Wed, 06 May 2020 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLrI/Of64OPiFUZn28lno2T5I2ucafu9/D7paZrypd6riIPTIY7qqlbC9XYUFl6Sy1TeiL7XtMz+nhv2iyGhfo=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr4459163ljg.217.1588762608382; 
 Wed, 06 May 2020 03:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510>
 <87d07isaka.fsf@our.domain.is.not.set> <877dxpsb4n.fsf@our.domain.is.not.set>
 <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
In-Reply-To: <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 6 May 2020 18:56:36 +0800
Message-ID: <CAEemH2coDuWHPt8SMosAtpjNd4VxmkGw3FWWajUOYXaNN7o0og@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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
Content-Type: multipart/mixed; boundary="===============1469288667=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1469288667==
Content-Type: multipart/alternative; boundary="000000000000e7d6d005a4f89ed6"

--000000000000e7d6d005a4f89ed6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2020 at 6:50 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Hi,
> >
> > Richard Palethorpe <rpalethorpe@suse.de> writes:
> >
> > > Hello,
> > >
> > > Petr Vorel <pvorel@suse.cz> writes:
> > >
> > >> Hi Richard,
> > >>
> > >>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > >>> ---
> > >>
> > >> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > >>
> > >> BTW Every second run with this patch it blocks after pty04.c:214:
> PASS:
> > >> Read netdev 1
> > >> and then:
> > >> tst_checkpoint.c:147: BROK: pty04.c:249: tst_checkpoint_wait(0,
> 10000):
> > >> ETIMEDOUT (110)
> > >> tst_test.c:373: BROK: Reported by child (26650)
> > >> safe_macros.c:258: BROK: pty04.c:215: read(5,0x7efebc306001,8191)
> failed,
> > >> returned -1: ENETDOWN (100)
> > >> pty04.c:139: PASS: Writing to PTY interrupted by hangup
> > >> tst_test.c:373: WARN: Reported by child (26648)
> > >>
> > >> Tested on 5.7.0-rc3 in Tumbleweed.
> > >> But it looks this is not caused by this change, but was here before,
> > >> because the
> > >> same behavior I see when testing pty04 *without* this patch on vario=
us
> > >> kernels
> > >> (5.3.7, 5.6.0-rc5) and some of the never SLES (4.12 based).
> > >>
> > >> Kind regards,
> > >> Petr
> > >
> > > This looks similar to the issue reported by Jan:
> > >
> > > https://github.com/linux-test-project/ltp/issues/674
> > >
> > > Is this the full output?
> > >
> > > Thinking aloud: the following (probably) happens when writing to the
> PTY
> > >
> > > write() -> PTY -> SLIP/SLCAN -> netdev -> read()
> > >
> > > Writing to the PTY causes the PTY to write to the line discipline. Wh=
at
> > > I found was that when the line discipline receive buffer got full and
> the
> > > PTY
> > > send buffer got full. The write would go to sleep and never wake up
> > > because the line discipline drained the receive buffer, but doesn't
> > > signal it is ready for more data (with tty_unthrottle). So I used
> > > nonblocking writes which just retry writing.
> > >
> > > From Jan's errors it looks like it might just be reading that is
> failing
> > > in one case and that writing is also failing in the other until we
> > > cancel the read. I doubt this is anything to do with the netdev code
> > > because it is generic networking code AFAICT and should work correctl=
y
> > > with blocking reads...
> >
> > Probably the best thing todo for now is to remove the test before the
> > release as this requires some more investigation.
>
> We can keep it in tree, I'd just disable it in runtest file(s), so it's n=
ot
> run by default.
>

But we still facing the compiled errors in the old kernels, that will break
the LTP build in the compiling phase.

RHEL-7:

pty04.c: In function =E2=80=98check_data=E2=80=99:
pty04.c:255:7: error: =E2=80=98struct can_frame=E2=80=99 has no member name=
d =E2=80=98__pad=E2=80=99
   i =3D offsetof(struct can_frame, __pad);
       ^
pty04.c:256:10: error: =E2=80=98struct can_frame=E2=80=99 has no member nam=
ed =E2=80=98__pad=E2=80=99
   if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) {
          ^
pty04.c:256:23: error: =E2=80=98struct can_frame=E2=80=99 has no member nam=
ed =E2=80=98__res0=E2=80=99
   if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) {
                       ^
pty04.c:256:37: error: =E2=80=98struct can_frame=E2=80=99 has no member nam=
ed =E2=80=98__res0=E2=80=99
   if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) {
                                     ^
pty04.c:256:51: error: =E2=80=98struct can_frame=E2=80=99 has no member nam=
ed =E2=80=98__res1=E2=80=99
   if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) {


--=20
Regards,
Li Wang

--000000000000e7d6d005a4f89ed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 6, 2020 at 6:50 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
<br>
----- Original Message -----<br>
&gt; Hi,<br>
&gt; <br>
&gt; Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.de" target=
=3D"_blank">rpalethorpe@suse.de</a>&gt; writes:<br>
&gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank=
">pvorel@suse.cz</a>&gt; writes:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Hi Richard,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:r=
palethorpe@suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz"=
 target=3D"_blank">pvorel@suse.cz</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; BTW Every second run with this patch it blocks after pty04.c:=
214: PASS:<br>
&gt; &gt;&gt; Read netdev 1<br>
&gt; &gt;&gt; and then:<br>
&gt; &gt;&gt; tst_checkpoint.c:147: BROK: pty04.c:249: tst_checkpoint_wait(=
0, 10000):<br>
&gt; &gt;&gt; ETIMEDOUT (110)<br>
&gt; &gt;&gt; tst_test.c:373: BROK: Reported by child (26650)<br>
&gt; &gt;&gt; safe_macros.c:258: BROK: pty04.c:215: read(5,0x7efebc306001,8=
191) failed,<br>
&gt; &gt;&gt; returned -1: ENETDOWN (100)<br>
&gt; &gt;&gt; pty04.c:139: PASS: Writing to PTY interrupted by hangup<br>
&gt; &gt;&gt; tst_test.c:373: WARN: Reported by child (26648)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Tested on 5.7.0-rc3 in Tumbleweed.<br>
&gt; &gt;&gt; But it looks this is not caused by this change, but was here =
before,<br>
&gt; &gt;&gt; because the<br>
&gt; &gt;&gt; same behavior I see when testing pty04 *without* this patch o=
n various<br>
&gt; &gt;&gt; kernels<br>
&gt; &gt;&gt; (5.3.7, 5.6.0-rc5) and some of the never SLES (4.12 based).<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Kind regards,<br>
&gt; &gt;&gt; Petr<br>
&gt; &gt;<br>
&gt; &gt; This looks similar to the issue reported by Jan:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/linux-test-project/ltp/issues/674" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-project/=
ltp/issues/674</a><br>
&gt; &gt;<br>
&gt; &gt; Is this the full output?<br>
&gt; &gt;<br>
&gt; &gt; Thinking aloud: the following (probably) happens when writing to =
the PTY<br>
&gt; &gt;<br>
&gt; &gt; write() -&gt; PTY -&gt; SLIP/SLCAN -&gt; netdev -&gt; read()<br>
&gt; &gt;<br>
&gt; &gt; Writing to the PTY causes the PTY to write to the line discipline=
. What<br>
&gt; &gt; I found was that when the line discipline receive buffer got full=
 and the<br>
&gt; &gt; PTY<br>
&gt; &gt; send buffer got full. The write would go to sleep and never wake =
up<br>
&gt; &gt; because the line discipline drained the receive buffer, but doesn=
&#39;t<br>
&gt; &gt; signal it is ready for more data (with tty_unthrottle). So I used=
<br>
&gt; &gt; nonblocking writes which just retry writing.<br>
&gt; &gt;<br>
&gt; &gt; From Jan&#39;s errors it looks like it might just be reading that=
 is failing<br>
&gt; &gt; in one case and that writing is also failing in the other until w=
e<br>
&gt; &gt; cancel the read. I doubt this is anything to do with the netdev c=
ode<br>
&gt; &gt; because it is generic networking code AFAICT and should work corr=
ectly<br>
&gt; &gt; with blocking reads...<br>
&gt; <br>
&gt; Probably the best thing todo for now is to remove the test before the<=
br>
&gt; release as this requires some more investigation.<br>
<br>
We can keep it in tree, I&#39;d just disable it in runtest file(s), so it&#=
39;s not<br>
run by default.<br></blockquote><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">But we still facing the compiled errors in the o=
ld kernels, that will break the LTP build in the compiling phase.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">RHEL-7:</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">pty04.c: In function =E2=80=98check_data=E2=80=99:<=
br>pty04.c:255:7: error: =E2=80=98struct can_frame=E2=80=99 has no member n=
amed =E2=80=98__pad=E2=80=99<br>=C2=A0 =C2=A0i =3D offsetof(struct can_fram=
e, __pad);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>pty04.c:256:10: error: =E2=80=
=98struct can_frame=E2=80=99 has no member named =E2=80=98__pad=E2=80=99<br=
>=C2=A0 =C2=A0if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>pty04.c:256:23: error: =E2=80=
=98struct can_frame=E2=80=99 has no member named =E2=80=98__res0=E2=80=99<b=
r>=C2=A0 =C2=A0if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1)=
 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^<br>pty04.c:256:37: error: =E2=80=98struct can_frame=E2=80=
=99 has no member named =E2=80=98__res0=E2=80=99<br>=C2=A0 =C2=A0if (frm.__=
pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>pty04.c:256:51: error: =E2=80=
=98struct can_frame=E2=80=99 has no member named =E2=80=98__res1=E2=80=99<b=
r>=C2=A0 =C2=A0if (frm.__pad !=3D frm.__res0 || frm.__res0 !=3D frm.__res1)=
 {<br></div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--000000000000e7d6d005a4f89ed6--


--===============1469288667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1469288667==--

