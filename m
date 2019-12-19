Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E679125BE1
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:10:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F8773C1C8A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:10:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7E4743C131B
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:10:21 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7AD1C600E36
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576739418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWHzdCB4yvDOKP6XVkX9cxnaOV57L/ZoXchD+e/Rj/4=;
 b=VC4VGJ5jv83voAJATsyuuPcAl7+paJYk8hSjAH3HDfzdFsOKCiMB3wvEsT3thcWTmiBXko
 KwjM5Hwgb5hKIJmolLYGHKv+xOH39+DKPa1LPyYw0P0xgcP22DpuE7+ybbgY5GtW+nd6Z8
 eoZMydIcMG7TZJP03rQa0ONSE1xSXAQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Le5XgiMnOd24YHErLS5CXw-1; Thu, 19 Dec 2019 02:10:14 -0500
Received: by mail-ot1-f71.google.com with SMTP id m18so1847286otp.20
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 23:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6342sfccEZTJ7MJk+IwFRpu4dtM2ThNTBF4TRDps8g=;
 b=WHr+GmDkl5xpNtuIlhJJMoJN5zqB6HfDYeHcqMzrnJ9ge/XqqbRJE+/3woL+TIyo36
 XW7TxGIqlFwsr7egKUgnoVABwSe1JHmyTXgyAL3mlIsAIC2C7NOBCoYV/cilmZPUrgw8
 ko6vvnNYzPKDshRrMBFnR9ZIU1v5xoFVKDLK4XrBVQLdxuBHtpMPZdjtA1oEmZ/zYiHA
 JYFpQBYGK08rHdG9TjlwERo+yiZQac1M5kYYRAXzMO9XZD61GS6/0IrG6zLh/NdLZklW
 8dnJ9Z/2q7RjZyrE3eTW81U4y6M8Lfm95PGvuWSX6L0uBNJWa9Cg0bHhygsKlx2wquMF
 Axhw==
X-Gm-Message-State: APjAAAVhUNEvJa3lBsy7R3pREUOkO7bCPSYBh1Du7WjjVmmSflHsdb1T
 TFN2z5xGJmCqHngjl/iImKGBAXgIEdurzLKwBA/ijJTiZMEH9oWjS2lRR0lapjbLS5ruMp3zIJf
 OtqMIZ0sex5RtAx+zPWaxjQt/QuY=
X-Received: by 2002:aca:5b89:: with SMTP id p131mr1634675oib.138.1576739414092; 
 Wed, 18 Dec 2019 23:10:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLOINEAqZV+WDC5TQnQokdZL3ZF5f74L9i4bFs9OIej3DrtCi9xIXWODmXWmSuVflYijpqISXnMsxDPkfGIHI=
X-Received: by 2002:aca:5b89:: with SMTP id p131mr1634668oib.138.1576739413790; 
 Wed, 18 Dec 2019 23:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
In-Reply-To: <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Dec 2019 15:10:02 +0800
Message-ID: <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-MC-Unique: Le5XgiMnOd24YHErLS5CXw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Content-Type: multipart/mixed; boundary="===============1006833946=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1006833946==
Content-Type: multipart/alternative; boundary="000000000000a9b3fc059a0940e2"

--000000000000a9b3fc059a0940e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

On Wed, Dec 18, 2019 at 6:14 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> + Cyril (who originally proposed upper bound check)
>
> On Wed, 18 Dec 2019 at 14:55, Jan Stancek <jstancek@redhat.com> wrote:
> >
> >
> > ----- Original Message -----
> > > " The test's assumptions are fundamentally false; it thinks it can lo=
ok
> > > at IO counters (tst_dev_bytes_written) for a disk before and after a
> > > system call, and attribute all of the IO seen to the system call that
> > > was made - this isn't necessarily correct. Other processes may genera=
te
> > > IO in the background.
> >
> > We create our own block device, so there shouldn't be other processes
> > writing to it.
> >
> > > ext4 defers a lot of IO on a freshly made filesystem to the kernel -
> > > for example it will initialize the journal and inode tables after the
> > > mount
> >
> > Journal was my guess as well.
>
> To avoid similar scenarios, I suggested to add a "sync()" call just
> prior to test here [1]. And I couldn't reproduce the failure in
> 1000-times run with 4.19 kernel.
>

Yes, that makes sense to me.


>
> Also, I think having a "sync()" call becomes more important in case we
> remove the upper bound otherwise test might not provide reliable
> results.
>
> [1] http://lists.linux.it/pipermail/ltp/2019-October/014157.html
>
> -Sumit
>
> >
> > > Let's remove the toplimit of write back, and think as long as we sync=
ed
> > > at least the expected amount, the test passes. The +10% limit seems
> > > arbitrary.
> >
> > I think this is reasonable approach until we find better way
> > to measure what was synced.
> >
> > Acked-by: Jan Stancek <jstancek@redhat.com>
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000a9b3fc059a0940e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Sumit,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 18, 2019 at 6:14 PM Sumit Gar=
g &lt;<a href=3D"mailto:sumit.garg@linaro.org" target=3D"_blank">sumit.garg=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">+ Cyril (who originally proposed upper bound check)<br>
<br>
On Wed, 18 Dec 2019 at 14:55, Jan Stancek &lt;<a href=3D"mailto:jstancek@re=
dhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; ----- Original Message -----<br>
&gt; &gt; &quot; The test&#39;s assumptions are fundamentally false; it thi=
nks it can look<br>
&gt; &gt; at IO counters (tst_dev_bytes_written) for a disk before and afte=
r a<br>
&gt; &gt; system call, and attribute all of the IO seen to the system call =
that<br>
&gt; &gt; was made - this isn&#39;t necessarily correct. Other processes ma=
y generate<br>
&gt; &gt; IO in the background.<br>
&gt;<br>
&gt; We create our own block device, so there shouldn&#39;t be other proces=
ses<br>
&gt; writing to it.<br>
&gt;<br>
&gt; &gt; ext4 defers a lot of IO on a freshly made filesystem to the kerne=
l -<br>
&gt; &gt; for example it will initialize the journal and inode tables after=
 the<br>
&gt; &gt; mount<br>
&gt;<br>
&gt; Journal was my guess as well.<br>
<br>
To avoid similar scenarios, I suggested to add a &quot;sync()&quot; call ju=
st<br>
prior to test here [1]. And I couldn&#39;t reproduce the failure in<br>
1000-times run with 4.19 kernel.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Yes, that makes sense to m=
e.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Also, I think having a &quot;sync()&quot; call becomes more important in ca=
se we<br>
remove the upper bound otherwise test might not provide reliable<br>
results.<br>
<br>
[1] <a href=3D"http://lists.linux.it/pipermail/ltp/2019-October/014157.html=
" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/=
2019-October/014157.html</a><br>
<br>
-Sumit<br>
<br>
&gt;<br>
&gt; &gt; Let&#39;s remove the toplimit of write back, and think as long as=
 we synced<br>
&gt; &gt; at least the expected amount, the test passes. The +10% limit see=
ms<br>
&gt; &gt; arbitrary.<br>
&gt;<br>
&gt; I think this is reasonable approach until we find better way<br>
&gt; to measure what was synced.<br>
&gt;<br>
&gt; Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=
=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><b=
r>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000a9b3fc059a0940e2--


--===============1006833946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1006833946==--

