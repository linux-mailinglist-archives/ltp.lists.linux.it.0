Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA1DF247
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:54:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B65294AB8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:54:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2297D3EACA3
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:54:38 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 16D1214016F0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:54:37 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id o33so4469965uae.12
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 01:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpyWqFpSJREeJRcmLk7I8Gf9z/wMQzu9c7uU5QdaIm8=;
 b=rklJWBtTpj5CN/mbsvzooJNI8m/I0Gg++gD5UoTA71kK5nZ3dM/v5RHiMJCvOfFWc+
 4mphbNEs0b9w8AeDJi+suznUl3l5rROTNnUs+/uepDmvRy8pKl2jqCRfZLbKLM5bOxNt
 bRoZPgFJ4xQZjr2wQV1VRjs7Ie2ZDu/1vRQFDk607owO0k6agOQiLxHUYxelolixgX3I
 038wFtB7yxnbyBrOHCzzV2j2RI3trIwzZ1KGmPnpT9kuYB440T5JduRyoxxfZSZYxxfr
 8o/IVC9qyEDZvCIytgSJXQOU7SI1g8Wfzy4Daym9hiEUVaU/kc04xTnMU82a7RvY+9N8
 Z7xQ==
X-Gm-Message-State: APjAAAUg5qmgPlzzIS7EXW3bPE9a2zfjThpA1gp+uSl4yU5R93zZ9CTQ
 EkYIFjk21pol/4xCTT+T9tBlcHFNVc0KCMGF/q04PA==
X-Google-Smtp-Source: APXvYqzWedgR5ypwHLyvkK9kFcA1VAFZDx1/9EkJgveRGwECyGNXefKQ70VjerI/lq/0ulJP8TPQTeaK6CfTCxWZmEE=
X-Received: by 2002:ab0:6983:: with SMTP id t3mr188877uaq.142.1556614474911;
 Tue, 30 Apr 2019 01:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 16:54:23 +0800
Message-ID: <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1720668552=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1720668552==
Content-Type: multipart/alternative; boundary="000000000000d477030587bb8cde"

--000000000000d477030587bb8cde
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 4:31 PM Murphy Zhou <xzhou@redhat.com> wrote:

> On Tue, Apr 30, 2019 at 04:14:23PM +0800, Li Wang wrote:
> > On Tue, Apr 30, 2019 at 3:21 PM Murphy Zhou <xzhou@redhat.com> wrote:
> >
> > > Currently swapfiles on Overlayfs are not supported.
> > >
> > > So if we are on overlayfs and we get EINVAL from swapon() we return
> TCONF.
> > >
> > > Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> > > ---
> > >  testcases/kernel/syscalls/swapon/swapon02.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/testcases/kernel/syscalls/swapon/swapon02.c
> > > b/testcases/kernel/syscalls/swapon/swapon02.c
> > > index 4af5105c6..211cdfc4e 100644
> > > --- a/testcases/kernel/syscalls/swapon/swapon02.c
> > > +++ b/testcases/kernel/syscalls/swapon/swapon02.c
> > > @@ -86,6 +86,11 @@ static void verify_swapon(struct test_case_t *test)
> > >                         return;
> > >         }
> > >
> > > +       if (fs_type == TST_OVERLAYFS_MAGIC && errno == EINVAL) {
> > > +               tst_resm(TCONF, "Swapfile on overlayfs not
> implemeted");
> > > +                       return;
> > > +       }
> > >
> >
> > The code looks correct.
> >
> > But it already has a test skipping for BTRFS, is there any possibility to
> > combine these filesystems check together?
>
> Good idea~  Sending V2.
>

One more comment.

I just noticed that it also has an FS skipping list in setup(), do u think
can we move BTRFS and OVERLAYFS to there?

-- 
Regards,
Li Wang

--000000000000d477030587bb8cde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 30, 2019 at 4:31 PM Murphy Zhou &lt;<a =
href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Apr 30, 2019 at 04=
:14:23PM +0800, Li Wang wrote:<br>
&gt; On Tue, Apr 30, 2019 at 3:21 PM Murphy Zhou &lt;<a href=3D"mailto:xzho=
u@redhat.com" target=3D"_blank">xzhou@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Currently swapfiles on Overlayfs are not supported.<br>
&gt; &gt;<br>
&gt; &gt; So if we are on overlayfs and we get EINVAL from swapon() we retu=
rn TCONF.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com=
" target=3D"_blank">xzhou@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/swapon/swapon02.c | 5 +++++<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/testcases/kernel/syscalls/swapon/swapon02.c<br>
&gt; &gt; b/testcases/kernel/syscalls/swapon/swapon02.c<br>
&gt; &gt; index 4af5105c6..211cdfc4e 100644<br>
&gt; &gt; --- a/testcases/kernel/syscalls/swapon/swapon02.c<br>
&gt; &gt; +++ b/testcases/kernel/syscalls/swapon/swapon02.c<br>
&gt; &gt; @@ -86,6 +86,11 @@ static void verify_swapon(struct test_case_t *=
test)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_type =3D=3D TST_<span class=3D=
"gmail_default" style=3D"font-size:small"></span>OVERLAYFS_MAGIC &amp;&amp;=
 errno =3D=3D EINVAL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(=
TCONF, &quot;Swapfile on overlayfs not implemeted&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; <br>
&gt; The code looks correct.<br>
&gt; <br>
&gt; But it already has a test skipping for BTRFS, is there any possibility=
 to<br>
&gt; combine these filesystems check together?<br>
<br>
Good idea~=C2=A0 Sending V2.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">One more comment.</div></div><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
 just noticed that it also has an FS skipping list in setup(), do u think c=
an we move BTRFS and OVERLAYFS to there?</div></div></div><div><br></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d477030587bb8cde--

--===============1720668552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1720668552==--
