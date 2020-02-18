Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48762161E6F
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 02:15:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1E733C2665
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 02:15:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0C4673C2393
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 02:15:38 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0D74F600B11
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 02:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581988536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xyEBRYg8AOCiWyXSfNuZG0IgTQpu6l9g6gFTRewc0E4=;
 b=dQOwhD3MmElBwjBAcxsVHn87fgF0Evh+byR1GTQ0LVVfhgHiy2PQqb5wYEr62Qz0LVK9p8
 FgW7V61iFD9uojaaHxQz5HkQCq3+ty4SqWTYG7k+9DeXeRPbxzSfk9HHyltpY4yMGCADOc
 J6GW1h0XbU1fVcHJVVLkn9Fg3Yk54Lw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-x2rASYgjMEKGLIX6-dEp7Q-1; Mon, 17 Feb 2020 20:15:33 -0500
Received: by mail-oi1-f200.google.com with SMTP id e22so9213549oig.1
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 17:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ep13/mfHRnpY1zJeSD4TG3sl3SMyhRfFJA/2chrPyrw=;
 b=nukUhiM4VtQ5piujxPlLxWreNYiJBGnci+5P0X/T5tXnW/ueT+lNQ9BUQ7vxrqPirc
 Jy3dkCjK27lFYO7D9t3FFCvn2SDiDUDxZrDIcBsSUG3e3f0GLBrSm7w9t+Q4AAVv8TXZ
 Q556TdEj2o7lWjSMPSfv4Hw0GaIG/Qb19xYG0GDRMzCsVOljk36eBs1AyxB+9kYzFgqk
 b6hxDTuW3h5ZVt8uUEcFkSl9bGWE0+t8rbMGtgH/NP65J0Axe8F4Z5P0KbLkDx+H7SQm
 I3Y7FZ6IXc2OM0dED0hitfZpxxtmkbh0kNgGvs3F+7aahPrew4aOF6nuC9dVPsBgZDT7
 vMRQ==
X-Gm-Message-State: APjAAAXdJdANGG69Yxa2FNMKi8hVDSlHmlbmCIwcL+MzK30PxGz7+ykB
 QkKV6yRud3xjj+Bll8jin10mNFsPD96cDpy4htAqBUitivBblYU/uzd1/MhCYHoHYZRSaMMdCX/
 BTAgFi4bzEjiH5MnFpwkuS+yxl8A=
X-Received: by 2002:a9d:395:: with SMTP id f21mr14235664otf.67.1581988532862; 
 Mon, 17 Feb 2020 17:15:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxE4s3Qw+8y6K9lwyV6OQ/1jNTfSk4xzm+zxwo6NW40BVGbKWCkuJEXY9jctPDd9eG4lBHN8Is++cuwf4d8d2g=
X-Received: by 2002:a9d:395:: with SMTP id f21mr14235651otf.67.1581988532658; 
 Mon, 17 Feb 2020 17:15:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
In-Reply-To: <20200217133638.GB14410@rei>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 09:15:21 +0800
Message-ID: <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: x2rASYgjMEKGLIX6-dEp7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Vikas.Kumar2@arm.com
Content-Type: multipart/mixed; boundary="===============1894779897=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1894779897==
Content-Type: multipart/alternative; boundary="000000000000873b7b059ecf68e9"

--000000000000873b7b059ecf68e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > > +static struct tst_test test =3D {
> > > +       .min_kver =3D "5.2",
> > >
> >
> > I suggest removing .min_kver check in all of the tests to let they can =
be
> > running on many distributions(which backport the features).
>
> If we do that we have to explicitely check for ENOSYS errno in each
> test, quite possibly with a dummy call to the tested syscall in test
> setup, because once these calls gets libc wrappers we will no longer
> call the tst_syscall() that checks for it.
>

+1 add dummy call to the tested syscall in the setup.
Agree, thanks for point out this.

--=20
Regards,
Li Wang

--000000000000873b7b059ecf68e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defaul=
t" style=3D"font-size:small">...</span><br>
&gt; &gt; +static struct tst_test test =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;5.2&quot;,<br>
&gt; &gt;<br>
&gt; <br>
&gt; I suggest removing .min_kver check in all of the tests to let they can=
 be<br>
&gt; running on many distributions(which backport the features).<br>
<br>
If we do that we have to explicitely check for ENOSYS errno in each<br>
test, quite possibly with a dummy call to the tested syscall in test<br>
setup, because once these calls gets libc wrappers we will no longer<br>
call the tst_syscall() that checks for it.<br></blockquote><div>=C2=A0</div=
><div><span class=3D"gmail_default" style=3D"font-size:small">+1 add dummy =
call to the tested syscall in the setup.</span>=C2=A0</div></div><div class=
=3D"gmail_default" style=3D"font-size:small"></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Agree, thanks for point out this.</div>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--000000000000873b7b059ecf68e9--


--===============1894779897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1894779897==--

