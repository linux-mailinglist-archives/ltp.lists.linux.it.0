Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581B12F4EA
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:25:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3580B3C2457
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 08:25:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 707AE3C23A4
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:25:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A20D2600C9A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 08:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578036331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MY51jQask+Gf8jVet44MjBta2eoBF34O7iJ1tAAgi/U=;
 b=aY5wcVmZKm0fjOuKQz2jPcBHqJvBPg1DgzmQ1ctxNQ3hT2uO0pUG9S7ZLPSCLQS+VWe35T
 ghpuiX2HNPCTlIA6SRcPnKrdKikVaXo004C2v5kCNso1391Hj9yQx57oRUjtu/Gmr1uoMh
 P2WThzE/2onAo2lkfidCTnxQLoo/YTY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-SMujmhK3MQOKxzff3WJA4Q-1; Fri, 03 Jan 2020 02:25:28 -0500
Received: by mail-oi1-f197.google.com with SMTP id d9so14557849oij.4
 for <ltp@lists.linux.it>; Thu, 02 Jan 2020 23:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XagzuYqxIOUu2nJKk/tV/1ddDzg7VikpQf6LcAhdJwc=;
 b=BMxJCpOi/M/iXqxMYDUoazcR6R6n8rSI3rq0frYBBBnLZ3J8P4i7c+HeKHTAPrVOLx
 YbU94DzOq9urXXTJkUegtvawr/N4/jVtX6R8az/B0XctVihOSs/rLh+aNFTolWjxRWGq
 ncuCrra9LCZANjsDO8S5TF2g/CDhSup1vvRpEvd+4uUqMpwZU6vIsZp8ItbL7anTgamz
 oVw80LpdsSaECs53khT+4pLBYEW5kvrfp5/ahYhE74U6RlyG6GE3fqCQzCcAelzy+I/+
 XhKbfdGYbuAnNm4iGEcPK/0qq64ysHr9lqEJ1HGEzmPdVFEpE6rXS/JnQVlTkkJQkZOI
 CFPw==
X-Gm-Message-State: APjAAAXGeR8opqVGbG3AdwB0crzFOjCNZLT/K77YGi1ZuARZpRl9r9Pq
 gx3K5Gm5SH4woKapUVFieiYBSGnwL7MfuzhQ2B+EL3ul22f2bGBoxtH2PHG58jsjnqPbP0olcid
 v+nIQiNp7wQr54jDNcqV14SEYOso=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr100662913otq.17.1578036327855; 
 Thu, 02 Jan 2020 23:25:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQB6oZh8KoFMbCoiUQWGMGimtQMMdvs9klB029angaS7gTUgMfrMspxmijJ5VrWx0VHxTL+OCK7apn1Fp5TAE=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr100662900otq.17.1578036327702; 
 Thu, 02 Jan 2020 23:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20200102015236.7400-1-liwang@redhat.com>
 <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
 <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
 <94af8423-337a-8e96-8ab2-b818afb43a76@cn.fujitsu.com>
In-Reply-To: <94af8423-337a-8e96-8ab2-b818afb43a76@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Jan 2020 15:25:16 +0800
Message-ID: <CAEemH2cCN7LwBEiitzU+=B=8YwR4pUX9Hg1rm-t7Ygc_HvSbHQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: SMujmhK3MQOKxzff3WJA4Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Content-Type: multipart/mixed; boundary="===============1196444116=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1196444116==
Content-Type: multipart/alternative; boundary="000000000000c17f9c059b37368d"

--000000000000c17f9c059b37368d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2020 at 2:46 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote=
:

>
>
> on 2020/01/02 14:31, Li Wang wrote:
> >
> >
> > On Thu, Jan 2, 2020 at 10:10 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
> >
> >
> >
> >     Hi Li
> >      > To avoid FS deferred IO metadata/cache interferes test result, s=
o
> we
> >      > do sync simply before the tst_dev_bytes_written invocation.
> >      >
> >     Looks good, acked. Also, I think we can mention it in
> >     doc/test-writing-guidelines.txt when using this api.
> >
> >
> > Ok, I will append one line as:
> > --- a/doc/test-writing-guidelines.txt
> > +++ b/doc/test-writing-guidelines.txt
> > @@ -1072,7 +1072,9 @@ unsigned long tst_dev_bytes_written(const char
> *dev);
> >
>  ------------------------------------------------------------------------=
-------
> >
> >   This function reads test block device stat file
> > (/sys/block/<device>/stat) and
> > -returns the bytes written since the last invocation of this function.
> > +returns the bytes written since the last invocation of this function.
> > To avoid
> > +FS deferred IO metadata/cache interferes the test result, we suggest
> > doing sync()
> > +before the tst_dev_bytes_written first invocation.
> OK.
>
> I also meet another problem when using this api on old kernel.
>
> tst_device.c:395: CONF: Test device stat file: /sys/block/loop0/stat brok=
en
>
> /sys/block/loop0/stat is all 0 and case reports TCONF. on new kernel,
> this value is normal. This is a block layer or loop device driver
> modifition several yeas ago?
>

It sounds like a kernel issue, can you tell which kernel version you did
test?

>
> ps:I know ltp used LOOP_SET_FD to make loop device simulate other
> filesystems. I am trying to find a generic way about this api.
>
> Best Regards
> Yang Xu
> >
> > --
> > Regards,
> > Li Wang
>
>
>

--=20
Regards,
Li Wang

--000000000000c17f9c059b37368d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jan 2, 2020 at 2:46 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
on 2020/01/02 14:31, Li Wang wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Jan 2, 2020 at 10:10 AM Yang Xu &lt;<a href=3D"mailto:xuyang20=
18.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a> <b=
r>
&gt; &lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Li<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; To avoid FS deferred IO metadata/cache interf=
eres test result, so we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; do sync simply before the tst_dev_bytes_writt=
en invocation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Looks good, acked. Also, I think we can mention it =
in<br>
&gt;=C2=A0 =C2=A0 =C2=A0doc/test-writing-guidelines.txt when using this api=
.<br>
&gt; <br>
&gt; <br>
&gt; Ok, I will append one line as:<br>
&gt; --- a/doc/test-writing-guidelines.txt<br>
&gt; +++ b/doc/test-writing-guidelines.txt<br>
&gt; @@ -1072,7 +1072,9 @@ unsigned long tst_dev_bytes_written(const char *=
dev);<br>
&gt;=C2=A0 =C2=A0----------------------------------------------------------=
---------------------<br>
&gt; <br>
&gt;=C2=A0 =C2=A0This function reads test block device stat file <br>
&gt; (/sys/block/&lt;device&gt;/stat) and<br>
&gt; -returns the bytes written since the last invocation of this function.=
<br>
&gt; +returns the bytes written since the last invocation of this function.=
 <br>
&gt; To avoid<br>
&gt; +FS deferred IO metadata/cache interferes the test result, we suggest =
<br>
&gt; doing sync()<br>
&gt; +before the tst_dev_bytes_written first invocation.<br>
OK.<br>
<br>
I also meet another problem when using this api on old kernel.<br>
<br>
tst_device.c:395: CONF: Test device stat file: /sys/block/loop0/stat broken=
<br>
<br>
/sys/block/loop0/stat is all 0 and case reports TCONF. on new kernel,<br>
this value is normal. This is a block layer or loop device driver <br>
modifition several yeas ago?<br></blockquote><div><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">It sounds like a kernel issue, can =
you tell which kernel version you did test?</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
ps:I know ltp used LOOP_SET_FD to make loop device simulate other <br>
filesystems. I am trying to find a generic way about this api.<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000c17f9c059b37368d--


--===============1196444116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1196444116==--

