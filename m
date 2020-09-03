Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA625BE1F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 11:10:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E754C3C2D58
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 11:10:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 717823C2CF9
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:10:47 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id AD8901400B6D
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 11:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599124245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVjfAVm3iXeDnJCf3BPz0FZJ7RZwZhQInQ7h6zI12BU=;
 b=PCEiOcd1inyAVA6WMt13G7pyZpXbNxA3IUZH9msmQuP4zwudnfoqvxw4yTHA+InWTThtnD
 O+i2KtRQfMcVwCS6s3d/RpDMK1DrOa4lcOh3urNftySW0gbkEMzA98cjcfPWNXRaUhtAqR
 /3YVbwlhdYJH2yRxp2RGgleiu/n6yyU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-V_xc_UvyNtGdq6w3MIkHYg-1; Thu, 03 Sep 2020 05:10:42 -0400
X-MC-Unique: V_xc_UvyNtGdq6w3MIkHYg-1
Received: by mail-yb1-f199.google.com with SMTP id g127so2221301ybf.11
 for <ltp@lists.linux.it>; Thu, 03 Sep 2020 02:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVjfAVm3iXeDnJCf3BPz0FZJ7RZwZhQInQ7h6zI12BU=;
 b=C6Uib4lxma5USxrhERlburzzI7hLVob3ZN4BCwhSSS75G+boV+yH7aGJYQfwyl3h6Z
 O9mdKdVKwMVQt7cddvt1CpKFg7hYTd5H61ezLCuRkiFOpQsO4Bsj+/55z4egMq7fXl5f
 r1l2n+lDSphC/lIw09Kl8tfh0qDJ/tj0HpUc+nOT2Pm3NwcPCkkuY5cT70YGikFDzb86
 fxYxhTWyvPsmkg058cdOjxLAgLHBmYrdZhh3cQJquk/dw0gjZcwyzzTby1Q0MMfggRf7
 AC5DbJehMFpiLZOpoL5dOX2ye+ZvUGpWFL2x69Pj5Ae6JAvolx0R4mFSMYwvoZOm2W1R
 S9Xw==
X-Gm-Message-State: AOAM532Pc4SQ4I/eo+uIN3vThZnTNLuXlNxAfI3wxdETa2JIknHv4Nwn
 kZ9vyysR0Q850RPlv1//3KevKgaBvyF+KpjCA/G5ZcIWzmXtUOXVdohMCBu98+FekW033s5aE4a
 tcdLNy2iV5u8TF44pcJtSLqzq7+E=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr1407686ybt.252.1599124242495; 
 Thu, 03 Sep 2020 02:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFxWPCDZSPzsQN0oZglDKY2O5fgMQKyasxcXWOvjuC6oQ8exRPxpHy7gmqpJLvkpqmdHM82Wg2kZd5vcPieQo=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr1407657ybt.252.1599124242165; 
 Thu, 03 Sep 2020 02:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
 <aabe6b47c9387e5ef3fc5b2a559295b72adc3c67.1599115178.git.viresh.kumar@linaro.org>
In-Reply-To: <aabe6b47c9387e5ef3fc5b2a559295b72adc3c67.1599115178.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 3 Sep 2020 17:10:29 +0800
Message-ID: <CAEemH2cHo=sS8b26988UmruGiK=63Zuaj7+qSM=qjuz+Wh9nnw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls: select: Verify that data is
 available to read
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0260089074=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0260089074==
Content-Type: multipart/alternative; boundary="00000000000068224805ae652046"

--00000000000068224805ae652046
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 2:40 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> select() returns a positive value on success if timeout hasn't happened,
> else returns 0. Check that and send some data to the write file
> descriptor for the same.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> ---
> Cyril,
>
> Is this what you were looking for ? I am not sure why, but the last
> test (with named pipe) times out all the time.
> ---
>  testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/select/select01.c
> b/testcases/kernel/syscalls/select/select01.c
> index 4367e7f3af3f..b3dcf1fff6f3 100644
> --- a/testcases/kernel/syscalls/select/select01.c
> +++ b/testcases/kernel/syscalls/select/select01.c
> @@ -25,24 +25,31 @@ static struct select_info {
>         int nfds;
>         fd_set *readfds;
>         fd_set *writefds;
> +       int *writefd;
>  } tests[] = {
> -       {4, &readfds_reg, NULL},
> -       {5, &readfds_pipe, &writefds_pipe},
> -       {5, &readfds_npipe, &writefds_npipe},
> +       {4, &readfds_reg, NULL, NULL},
> +       {5, &readfds_pipe, &writefds_pipe, &fds_pipe[1]},
> +       {5, &readfds_npipe, &writefds_npipe, &fd_npipe},
>

The 'nfds' should be equal to 'fd + 1', otherwise, it gets timeout as you
mentioned above.

  {7, &readfds_npipe, &writefds_npipe, &fd_npipe}

-- 
Regards,
Li Wang

--00000000000068224805ae652046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 3, 2020 at 2:40 PM Viresh Kumar &lt;<a =
href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">select() ret=
urns a positive value on success if timeout hasn&#39;t happened,<br>
else returns 0. Check that and send some data to the write file<br>
descriptor for the same.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
<br>
---<br>
Cyril,<br>
<br>
Is this what you were looking for ? I am not sure why, but the last<br>
test (with named pipe) times out all the time.<br>
---<br>
=C2=A0testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---<br>
=C2=A01 file changed, 10 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel=
/syscalls/select/select01.c<br>
index 4367e7f3af3f..b3dcf1fff6f3 100644<br>
--- a/testcases/kernel/syscalls/select/select01.c<br>
+++ b/testcases/kernel/syscalls/select/select01.c<br>
@@ -25,24 +25,31 @@ static struct select_info {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int nfds;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_set *readfds;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_set *writefds;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int *writefd;<br>
=C2=A0} tests[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{4, &amp;readfds_reg, NULL},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{5, &amp;readfds_pipe, &amp;writefds_pipe},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{5, &amp;readfds_npipe, &amp;writefds_npipe},<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{4, &amp;readfds_reg, NULL, NULL},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{5, &amp;readfds_pipe, &amp;writefds_pipe, &amp=
;fds_pipe[1]},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{5, &amp;readfds_npipe, &amp;writefds_npipe, &a=
mp;fd_npipe},<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">The &#39;nfds&#39; should be equal to &#39;fd=
 + 1&#39;, otherwise, it gets timeout as you mentioned above.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">=C2=A0=C2=A0{7, &amp;readfds_npipe, &a=
mp;writefds_npipe, &amp;fd_npipe}</div></div><div>=C2=A0</div></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--00000000000068224805ae652046--


--===============0260089074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0260089074==--

