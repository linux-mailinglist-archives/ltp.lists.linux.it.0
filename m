Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D41245B65
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:23:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E9553C5910
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 06:23:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7EB903C1CB8
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:23:50 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C692E1A00A52
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 06:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597638228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTsF6jArqyPHoeXwsqg1E9qe0rlwhwR3b+V7v8wBoyY=;
 b=GHGOTXgByk1d7reTnv/DlY48iTRZcewRhFEe/I7roHYVSKDwL4zmt2gVTQ5bItuti9TAb9
 8B4AxAhuZmfufy/DGcoDoTB6/LD/IQZak67C97fytsWOB+en+KnJC1AmvlWBcQEFuj4me3
 rUjpDCRybjXhFZXnCS3o8xRVCTWRc1w=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-Yxhry86IOOe5Q4L33shOHw-1; Mon, 17 Aug 2020 00:23:45 -0400
X-MC-Unique: Yxhry86IOOe5Q4L33shOHw-1
Received: by mail-yb1-f198.google.com with SMTP id d26so17248515yba.20
 for <ltp@lists.linux.it>; Sun, 16 Aug 2020 21:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTsF6jArqyPHoeXwsqg1E9qe0rlwhwR3b+V7v8wBoyY=;
 b=GJzDe5fRkcCJwJmzoPREfmHAsuET/hLXXs+DGioEN2tXgIFygRomeB5wuzAuo53vy1
 rzuZgaWZtichgrkPX5YnwoPTwKWW61/qazwVUhgvgAj3KcPfUIc8mdclX0aeue72TXHg
 POnKHjO5mfrdcObNAZBLGJZsJvb7qqR081TnKkjvOJXgkOPUQxytSUf5HigV2lTdZ/LA
 ab9GRaz9uC3+J1SqESsZ7tEzOz6qqW4l0EhAoUPNK8oQkhagq7ju3NumAU+M+44tCilK
 gRBBXGKkvzLTQtJWpC4noVrlDm56rI5XJPC9l31HbnY1EwSJ755XI/EQu5mimw9WqPyY
 ZqiQ==
X-Gm-Message-State: AOAM532a5QILt1y2MbK6ANa2T2Cu4rdeou47Mx2TIF6kFbxCjE+qH4zO
 i/YtwYAZPM0buo97TgO7bGU/gCs8hyZlikmxEaUkAAL2/lbAVISV8zJdXpnrFfX0uWoTWgjsf2X
 aVhnZXQCYU9/UOQ/WK+Fg6Fho8Hw=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr18422059ybg.286.1597638225016; 
 Sun, 16 Aug 2020 21:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUbaKCV0zwZHJ2O+1NaOKcjP7GvbvUVgxbTR2OefjE4DxSRoKHcQzMIznmNFKX0YLgQznsUtuUsvqRlHTFOWQ=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr18422048ybg.286.1597638224806; 
 Sun, 16 Aug 2020 21:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200806162356.16920-1-mdoucha@suse.cz>
 <752669298.7180757.1597047872449.JavaMail.zimbra@redhat.com>
 <CAEemH2cCq1LL_91pOavNWHmHGQs6EfFsyGXaOBuqh-CrFxP7Pg@mail.gmail.com>
 <462582af-8a13-e5c1-a8f7-63a7e03571c7@cn.fujitsu.com>
In-Reply-To: <462582af-8a13-e5c1-a8f7-63a7e03571c7@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Aug 2020 12:23:33 +0800
Message-ID: <CAEemH2cVgM8tmANMRUBnL1M6E_t94H7vb5eaahy8YyO2StEPcA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Drop the mem01 test
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
Cc: Michal Hocko <mhocko@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1040734924=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1040734924==
Content-Type: multipart/alternative; boundary="000000000000dea07305ad0b2204"

--000000000000dea07305ad0b2204
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 11:47 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Li
>
>
> >
> >
> > On Mon, Aug 10, 2020 at 4:24 PM Jan Stancek <jstancek@redhat.com
> > <mailto:jstancek@redhat.com>> wrote:
> >
> >
> >     ----- Original Message -----
> >      > The mem01 test often fails on PPC systems mainly because it
> >     doesn't take into
> >      > account page sizes larger than 4KB. Test scenario review revealed
> >     that it's
> >      > not particularly useful because it doesn't have any more specific
> >     goal than
> >      > filling large amount of memory and the hardcoded allocation
> >     limits are too
> >      > low for modern and future systems. The useful part of this test
> >     mostly
> >      > overlaps with coverage by existing OOM tests.
> >      >
> >      > Signed-off-by: Martin Doucha <mdoucha@suse.cz
> >     <mailto:mdoucha@suse.cz>>
> >
> >     Acked-by: Jan Stancek <jstancek@redhat.com <mailto:
> jstancek@redhat.com>>
> >
> > Pushed, thanks!
> >
> [root@localhost ltp]# git grep mem01
> testcases/kernel/syscalls/ioctl/ioctl_sg01.c: * a read-accessible
> SCSI-compatible device (e.g. SATA disk). Running mem01
> [root@localhost ltp]#
>
> ioctl_sg01.c has such description " Running mem01
>   * test program before this one may increase the chance of successfully
>   * reproducing the bug."
>
> I guess we should also remove this or use oom testcases can also
> increase this rate(I don't try ).
>

Good catch, I will help submit a patch to fix that code comment.

-- 
Regards,
Li Wang

--000000000000dea07305ad0b2204
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 17, 2020 at 11:47 AM Yang Xu &lt;<a hre=
f=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li=
<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Aug 10, 2020 at 4:24 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank">js=
tancek@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----- Original Message -----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The mem01 test often fails on PPC systems mai=
nly because it<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t take into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; account page sizes larger than 4KB. Test scen=
ario review revealed<br>
&gt;=C2=A0 =C2=A0 =C2=A0that it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; not particularly useful because it doesn&#39;=
t have any more specific<br>
&gt;=C2=A0 =C2=A0 =C2=A0goal than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; filling large amount of memory and the hardco=
ded allocation<br>
&gt;=C2=A0 =C2=A0 =C2=A0limits are too<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; low for modern and future systems. The useful=
 part of this test<br>
&gt;=C2=A0 =C2=A0 =C2=A0mostly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; overlaps with coverage by existing OOM tests.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Martin Doucha &lt;<a href=3D"m=
ailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mdoucha@suse.cz" targe=
t=3D"_blank">mdoucha@suse.cz</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstance=
k@redhat.com" target=3D"_blank">jstancek@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&g=
t;&gt;<br>
&gt; <br>
&gt; Pushed, thanks!<br>
&gt; <br>
[root@localhost ltp]# git grep mem01<br>
testcases/kernel/syscalls/ioctl/ioctl_sg01.c: * a read-accessible <br>
SCSI-compatible device (e.g. SATA disk). Running mem01<br>
[root@localhost ltp]#<br>
<br>
ioctl_sg01.c has such description &quot; Running mem01<br>
=C2=A0 * test program before this one may increase the chance of successful=
ly<br>
=C2=A0 * reproducing the bug.&quot;<br>
<br>
I guess we should also remove this or use oom testcases can also <br>
increase this rate(I don&#39;t try ).<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Good catch, I will he=
lp submit a patch to fix that code comment.</div></div></div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000dea07305ad0b2204--


--===============1040734924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1040734924==--

