Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A42751E3
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:50:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 017EA3C4D3C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:50:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DBCCC3C29D8
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:50:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BA8A310009D9
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600843852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9eASbDfxjp0hr5frSWNA5RONiTHTyA6GIy1bYnZQVHk=;
 b=dL/6JDyS9Bki0uLTnB+ODPqHd8cDqny3mLRI1CD/BhNlOtAdvU0nPQEnozEzNxU5ZNddWs
 qzH1NOJHx2WqYB/2S4iwbYuz7qxtaagHf2ZtXTJ3WJj8Sz16fOymSjSVaFIJGvpctagZL8
 cx2AR2bWA9d5B6K9Zul3ofKkMCFbCaw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-97wUS2qYOAe135l5GIgLvg-1; Wed, 23 Sep 2020 02:50:46 -0400
X-MC-Unique: 97wUS2qYOAe135l5GIgLvg-1
Received: by mail-yb1-f197.google.com with SMTP id e190so18427507ybf.18
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 23:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eASbDfxjp0hr5frSWNA5RONiTHTyA6GIy1bYnZQVHk=;
 b=TFEMdOiQZVbdnselnHTrSqzm6W4DgEdWGSbP/NXLhcOWJiAPdanIHoCuiI/Khm+uef
 MhnbBk5tHa53F8pBWcubOOwmBBbkExOX3jZNu9AFCw0AQu1CMKY3ANXO2VPAYbBai6Nb
 1Au5CSuu5WeLrhoj5XBfjHTPAo03jG98RH6S7qc5wT46WBcu0BNfjTQGCziiE0pdCR+7
 mBqfkWug594acOF56wGIDBSxHFIs/rCVnILR7Wc+9Kwpvac/MQPmupBH5+UPYlDDciYg
 p2BqQjP+GI5Ou4GZBjpNKZXrmpeATl73J/v3Jz2WWYgbjj8AbmLsENUYaB5YK2ORYu0Q
 ++xw==
X-Gm-Message-State: AOAM530IzqVc93c8KKs0lXVVFH7s4xsavrlwe09D4WAGW2Q9+DzFAgfY
 IUO673V7B10dYDISZFRNkFERlUemuUY0RpARRHEiNhmYkj1Xuj4mBe6wVaj/LUb78iChYJGQ5+P
 qHrdjyauydukYrbt3gYjyVB5x9pU=
X-Received: by 2002:a25:730a:: with SMTP id o10mr5349730ybc.403.1600843846427; 
 Tue, 22 Sep 2020 23:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPTOtyKZphB/KFnb6jMsDvwa4G/5H1G6gX2IwND2jI8C52V6TIsq+UGwZQtJMVF3YjBeHp5AuyRLsN4Db9N9o=
X-Received: by 2002:a25:730a:: with SMTP id o10mr5349719ybc.403.1600843846240; 
 Tue, 22 Sep 2020 23:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan> <20200922182102.GB12980@yuki.lan>
In-Reply-To: <20200922182102.GB12980@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 14:50:34 +0800
Message-ID: <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Content-Type: multipart/mixed; boundary="===============1715145802=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1715145802==
Content-Type: multipart/alternative; boundary="000000000000cbea6d05aff580e8"

--000000000000cbea6d05aff580e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> As far as I can tell I've pushed the last patch that should have been in
> the release just now. With that we should have a week worth of
> pre-release testing since we are aiming for a release at the end of the
> September. If you haven't tried LTP git HEAD yet, please do so now and
> report any problems you find.
>

We still got this persistent fail on some kernels(RHEL8, kernel-v5.9-rc4):

---
send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)

---
fanotify10.c:404: TFAIL: group 0 (4) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12
fanotify10.c:404: TFAIL: group 1 (4) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12
fanotify10.c:404: TFAIL: group 2 (4) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12
fanotify10.c:404: TFAIL: group 0 (0) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12
fanotify10.c:404: TFAIL: group 1 (0) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12
fanotify10.c:404: TFAIL: group 2 (0) got event: mask 1020 (expected 1000)
pid=3D95067 fd=3D12

---
recvmmsg01.c:86:9: error: request for member =E2=80=98type=E2=80=99 in some=
thing not a
structure or union
  timeout.type =3D tv->ts_type;

Otherwise, the latest LTP test good from my side(RHEL8, mainline-kernel).

--=20
Regards,
Li Wang

--000000000000cbea6d05aff580e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
As far as I can tell I&#39;ve pushed the last patch that should have been i=
n<br>
the release just now. With that we should have a week worth of<br>
pre-release testing since we are aiming for a release at the end of the<br>
September. If you haven&#39;t tried LTP git HEAD yet, please do so now and<=
br>
report any problems you find.<br></blockquote><div><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">We still got this persistent fail =
on some kernels(RHEL8, kernel-v5.9-rc4):</div><div class=3D"gmail_default">=
<br></div><div class=3D"gmail_default">---</div>send02.c:86: FAIL: recv() e=
rror: EAGAIN/EWOULDBLOCK (11)<br>send02.c:86: FAIL: recv() error: EAGAIN/EW=
OULDBLOCK (11)<br>send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<=
br><div class=3D"gmail_default" style=3D"font-size:small">send02.c:86: FAIL=
: recv() error: EAGAIN/EWOULDBLOCK (11)</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">---</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><div class=3D"gmail_default" style=3D"font-size:small">fanotify10=
.c:404: TFAIL: group 0 (4) got event: mask 1020 (expected 1000) pid=3D95067=
 fd=3D12<br>fanotify10.c:404: TFAIL: group 1 (4) got event: mask 1020 (expe=
cted 1000) pid=3D95067 fd=3D12<br>fanotify10.c:404: TFAIL: group 2 (4) got =
event: mask 1020 (expected 1000) pid=3D95067 fd=3D12<br>fanotify10.c:404: T=
FAIL: group 0 (0) got event: mask 1020 (expected 1000) pid=3D95067 fd=3D12<=
br>fanotify10.c:404: TFAIL: group 1 (0) got event: mask 1020 (expected 1000=
) pid=3D95067 fd=3D12<br>fanotify10.c:404: TFAIL: group 2 (0) got event: ma=
sk 1020 (expected 1000) pid=3D95067 fd=3D12<br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">---</div><div class=3D"gmail_default" style=3D"font-=
size:small">recvmmsg01.c:86:9: error: request for member =E2=80=98type=E2=
=80=99 in something not a structure or union<br>=C2=A0 timeout.type =3D tv-=
&gt;ts_type;<br></div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Otherwis=
e, the latest LTP test good from my side(RHEL8, mainline-kernel).</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div></div>-- <br><=
div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--000000000000cbea6d05aff580e8--


--===============1715145802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1715145802==--

