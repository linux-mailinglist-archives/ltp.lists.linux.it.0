Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD2135371
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 07:59:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 849A03C24A3
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 07:59:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CE3B03C23F8
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 07:59:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id DE9FA201130
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 07:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578553181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yBa+Mf9zIKwwi0GHgGdqX51DIhlwHa/fJaUrY+FiT5c=;
 b=hQuaoivonvU446MCl8kj+1FGt++A6pswR96aNYGXv8SqdfTePZj2/9DmNzvE7VqFPvuMvB
 JGt6xH+1k2higCjCXtS02hIcZv+c6Q4Ql+qqPEplx1FsI/UO4Eh746m8aCBhENLZUJ8NsF
 5VypQ15yKfKwbtB66JrqVwfkSVTTTiY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ogwujDbuNEai0lX1HVN1BQ-1; Thu, 09 Jan 2020 01:59:39 -0500
Received: by mail-ot1-f72.google.com with SMTP id v2so3207983otq.2
 for <ltp@lists.linux.it>; Wed, 08 Jan 2020 22:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OfvYbxOX8a0fb2bsTutYK5z+G/Yo8S0f/aN3526wcA=;
 b=cB2pJpNnkJz/t8LkTz4QxfDoQQdJqMEcIpTj3H6ks6yfceigugXr0cvnemi5hCDpCa
 S0W4wW/oEKAzaM/P17gjBjm5HkXG9QVaDS7Qw/qxhk15nIA9vKInC00LOTQ+e6Aakl8v
 MHfhNtW3H5Fjy950+yNYsyv9BzseuxxPwYCDYOvE9DsUUcA3NLbF7C9DVfHv1v8CT/Ah
 FeubnCOJKMvQ/yDhpYxC2crxnHakOVW5ZeJGPkg0gnDf9dZxyPkJ7UFaHDSLmgzLi5vG
 hE6lMopJnYjkF6OAxj/NYP4X+G3CSTuxO9DBoBc8STuTjRrVWIcXTVkIoxDs4kO5+rIf
 PSwg==
X-Gm-Message-State: APjAAAWZa2Sm151GQ6irACPEcOrx9/EQK4Fd32pgLKF1BKVh/DTHb3os
 VwLvN6ZE8JERpJHx2TDwkKyn5QmYS+sfyjkOuJY8os3TOJUVWP2tsiEtS1lujVtqajB2x26IlXA
 WN9BvmNdMRjTcmp7GnMA3xRGHQiw=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr7575687otr.67.1578553178864; 
 Wed, 08 Jan 2020 22:59:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6pjIHeg/ozHjMjoFBV7Xae79dVEyDx5VbxXZETGvnGJPrqCbd0zK2A9rupopYm5HGsoslGXkmSFiVnmAwhXQ=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr7575633otr.67.1578553177614; 
 Wed, 08 Jan 2020 22:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
 <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
 <20200108112537.GA22954@dell5510> <20200108113535.GA17272@rei.lan>
 <CAEemH2dZ0pVqpaecjO06stw8RiK-hmSUWwo=kndm3EsvoXCW2w@mail.gmail.com>
 <20200108114141.GB17272@rei.lan> <20200108114545.GA28867@dell5510>
In-Reply-To: <20200108114545.GA28867@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Jan 2020 14:59:26 +0800
Message-ID: <CAEemH2dUhpixZoorh_-H1CHenk9-XG9ZocjHB30RqzW_Kb0dCw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: ogwujDbuNEai0lX1HVN1BQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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
Content-Type: multipart/mixed; boundary="===============0797213381=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0797213381==
Content-Type: multipart/alternative; boundary="000000000000694505059baf8d14"

--000000000000694505059baf8d14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2020 at 7:45 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li, Cyril,
>
> > Hi
> > > Btw I just pushed a simple fix to include unistd.h, it seems not work=
s.
>
> > You would need to define _GNU_SOURCE at the top of each test that uses
> > it otherwise the definition is not exposed.
> Yep :(. I join to Cyril's vote for raw syscall.
> BTW please test it with travis or locally build.sh script (which adds
> -Werror=3Dimplicit-function-declaration).
>

I'd go with syscall(__NR_syncfs, fd) in the tst_device.h and
define _GNU_SOURCE in relevant test cases.

The reason why not use tst_syscall() is that involves a new compile error
of tst_brk, and it can not get rid of errors only via include tst_test.h
file.


>
> I guess we should work on travis CI integration so we don't have to push
> it to
> travis manually [1].
>

That's a good proposal. I feel so sorry for pushing without a compiling in
Travis this time, because I thought the code is good enough but ...

--=20
Regards,
Li Wang

--000000000000694505059baf8d14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jan 8, 2020 at 7:45 PM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Li, Cyril,<br>
<br>
&gt; Hi<br>
&gt; &gt; Btw I just pushed a simple fix to include unistd.h, it seems not =
works.<br>
<br>
&gt; You would need to define _GNU_SOURCE at the top of each test that uses=
<br>
&gt; it otherwise the definition is not exposed.<br>
Yep :(. I join to Cyril&#39;s vote for raw syscall.<br>
BTW please test it with travis or locally build.sh script (which adds<br>
-Werror=3Dimplicit-function-declaration).<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d go with=
=C2=A0syscall(__NR_syncfs, fd) in the tst_device.h and define=C2=A0_GNU_SOU=
RCE in relevant=C2=A0test cases.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><span class=3D"gmail_default" style=3D"font-siz=
e:small">The reason why not use </span>tst_syscall<span class=3D"gmail_defa=
ult" style=3D"font-size:small">() is that involves a new compile error of t=
st_brk, and it can not get rid of errors only via include tst_test.h file.<=
/span><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
I guess we should work on travis CI integration so we don&#39;t have to pus=
h it to<br>
travis manually [1].<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">That&#39;s a good proposal. I feel so =
sorry for pushing without a compiling in Travis this time, because I though=
t the code is good enough but ...</div></div></div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000694505059baf8d14--


--===============0797213381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0797213381==--

