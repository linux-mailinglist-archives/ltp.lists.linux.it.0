Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B365A2ACAA8
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 02:47:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 827B63C6093
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 02:47:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B48113C2407
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 02:47:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 1446110008FE
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 02:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604972869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ouH51SZZlA8Q6qq4CkGKCx+b6OJdfO4ZeP2fxCSi8A=;
 b=EDGftfgfNYS8JMQb0waJii9iNFyK9x0WnJ6WU696yn1ohN9z7KKOgoUo83GioAxY1I8Js2
 1TyD9HqD/zOTImFyQ2y6VfEcSZnV/gw29jQNUSn8WEw0vo5TD0qgzvKLteum9i1eom3YkX
 G7v64dFyEtGiBAGQZ1FToflZMUEV+dI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-iA9ABXbOOROS34pNGm7fLA-1; Mon, 09 Nov 2020 20:47:47 -0500
X-MC-Unique: iA9ABXbOOROS34pNGm7fLA-1
Received: by mail-yb1-f198.google.com with SMTP id x197so13146209ybg.18
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 17:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ouH51SZZlA8Q6qq4CkGKCx+b6OJdfO4ZeP2fxCSi8A=;
 b=DBvK/5FXWYsNi1uaLs+GF90vZIGi1aWnOxuqCv5LsNoSSGBtT42DUMvphm2mbSF5+e
 Mao6XVPu0RxVmKugNwvrP+/17/WnkBjG8qjFaCoXPIvF4BvYWwIf86WiMlGqM5LZw5bY
 ExMrxkhAoh2Rnvf73tGZkUl+7Hlrs2hs8l5vEIkaE7OqXshx6iSrTor2/1Lqf7z5LG5N
 K4fjPmgKy+BQJjYGRmwTkv+hSrr5E0U/ynWsHaNi7kZ2uo5RvRrG46L3f/Xgon5bSEeE
 OytzPXtuDLi41vrVzC+XOrYezasQejSAKXPIr94WuIjibZlSxA2Xc2oiPlS2wTzmLg3o
 UvUw==
X-Gm-Message-State: AOAM5336EJMR9c3dEo/rETTJCd7ubx1g9bOUxNYy8gQyK6j3hrv/cviI
 W5UvVgsIw2luMgI4WjPX3PbSVAOu1N+YbiM5I716cVyV/AYmbQKWyouzMRS9MwB1olZnZAazJBu
 nvma3oHhzw+z596aa944f83aB9kQ=
X-Received: by 2002:a25:d7d4:: with SMTP id o203mr9215263ybg.286.1604972866896; 
 Mon, 09 Nov 2020 17:47:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzK0imfrXaOIxG8eTStbS/yDTNg3fZyskwhHFKWhSnQPRD2hbyVD11RfB5siq0IFdwNaIHGCsyhguitTr0S3Q=
X-Received: by 2002:a25:d7d4:: with SMTP id o203mr9215248ybg.286.1604972866661; 
 Mon, 09 Nov 2020 17:47:46 -0800 (PST)
MIME-Version: 1.0
References: <5d6e978c803e4e6449cabd89596729bfad996a17.1604408825.git.jstancek@redhat.com>
 <CAEemH2dHXYbmkbzccWNurYURZQJJ4GENRBr=6KfQaL5HJaBO2g@mail.gmail.com>
 <CAEemH2f-okBCGktRfT5-RgkXziAu3FrFAN7Qih2vz=A9mfJzRw@mail.gmail.com>
 <69530275.22574785.1604926148605.JavaMail.zimbra@redhat.com>
In-Reply-To: <69530275.22574785.1604926148605.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 10 Nov 2020 09:47:34 +0800
Message-ID: <CAEemH2eA1SdVjPk8=GEmWRt66ATX9pfktm8US0JtA=S7EDf9ig@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
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
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: fix short reads of mems/cpus
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
Content-Type: multipart/mixed; boundary="===============0439406953=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0439406953==
Content-Type: multipart/alternative; boundary="0000000000009785e205b3b6ddd1"

--0000000000009785e205b3b6ddd1
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 8:49 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Wed, Nov 4, 2020 at 2:22 PM Li Wang <liwang@redhat.com> wrote:
> >
> > > ...
> > >> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf);
> > >> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf,
> > >> sizeof(buf));
> > >>         tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
> > >> -       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems);
> > >> +       tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems,
> > >> sizeof(buf));
> > >>
> > >
> > > sizeof() is generally used to calculate the size (in bytes) of a data
> type,
> > > e.g sizeof(char *).
> > > I think here to pass 'BUFSIZ' directly is better than sizeof(buf).
> > >
> >
> > Jan, do you agree with this point?
> > If yes, I can help to modify and apply this patch.
>
> 2nd line should have been sizeof(mems), but BUFSIZ will work too.
>

Pushed, thanks!

-- 
Regards,
Li Wang

--0000000000009785e205b3b6ddd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 9, 2020 at 8:49 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Wed, Nov 4, 2020 at 2:22 PM Li Wang &lt;<a href=3D"mailto:liwang@re=
dhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; ...<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH=
_TMP_CG_CST, &quot;cpus&quot;, buf);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH=
_TMP_CG_CST, &quot;cpus&quot;, buf,<br>
&gt; &gt;&gt; sizeof(buf));<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_write_file=
s(PATH_TMP_CG_CST, &quot;cpus&quot;, buf);<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH=
_TMP_CG_CST, &quot;mems&quot;, mems);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_cpuset_read_files(PATH=
_TMP_CG_CST, &quot;mems&quot;, mems,<br>
&gt; &gt;&gt; sizeof(buf));<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; sizeof() is generally used to calculate the size (in bytes) of a =
data type,<br>
&gt; &gt; e.g sizeof(char *).<br>
&gt; &gt; I think here to pass &#39;BUFSIZ&#39; directly is better than siz=
eof(buf).<br>
&gt; &gt;<br>
&gt; <br>
&gt; Jan, do you agree with this point?<br>
&gt; If yes, I can help to modify and apply this patch.<br>
<br>
2nd line should have been sizeof(mems), but BUFSIZ will work too.<br></bloc=
kquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Pushed, thanks!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--0000000000009785e205b3b6ddd1--


--===============0439406953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0439406953==--

