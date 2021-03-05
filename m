Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3632E41F
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 10:03:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F0C43C5639
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 10:03:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2C16F3C4D05
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 10:03:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D9AC81401227
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 10:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614934990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fYS8gBEtr5Qoq5SjKNo+e0INabcS+BFXLk7n9gNW2GI=;
 b=cstZxpdGNX1Yd4HaoO6/kg4h22LbDmgsVyWhzvQWiH3papVSjg6wQ3qXIB8JHk89zjiJ6g
 kSZm/Tr8gx6bJxavemTUidX+e2t44IyS1R78QkyNKIxqcjzfz42RrvNDn3zRC0nrkl7sNM
 6QC7wH0DPHBbfTLa38SdAhhRRDlqqYM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-4-Re4o5nNOqHTEvZCfSbyw-1; Fri, 05 Mar 2021 04:03:06 -0500
X-MC-Unique: 4-Re4o5nNOqHTEvZCfSbyw-1
Received: by mail-yb1-f198.google.com with SMTP id l10so1838152ybt.6
 for <ltp@lists.linux.it>; Fri, 05 Mar 2021 01:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYS8gBEtr5Qoq5SjKNo+e0INabcS+BFXLk7n9gNW2GI=;
 b=EdiyFM2M7u3WK8kM1wjZd8UBHMv5nQlC2/V1CbiSp66HqmfottYdpNrLDDBp/lO1HF
 eGtfHwWG6eycpYHTy05RCZk+dbjcBJUQj52TlRBPGp/8ui5c3gKA7HPZo7QWYBwWJuGm
 tHCqrKvfKO+7OUSdmRPbgnXxCn6/0DOcclTDC09AfOtu2uxtTdREI1X8ZEnVAcVJ155b
 pPN/bWvg5YCtuDkDsmyfVqU8wZx6OroPPzTyRsyOaXHf4yuM3AiFjUdGgpmN9uDiq1tw
 dvrfvsQ5EXEZUhm4FHP+25/x2OZbaSYIil0ioESwNo7pgdevYq3PeuuzOqmmv12/MIst
 QpDA==
X-Gm-Message-State: AOAM530VZkGIMqLOBAToG//28b+Lj5R18eLJnf7+i3Ppj1loRQB5XJtl
 aq4tggZEfsKVipmiQ/oVi+z4jwCqiTSikyNPdqtubKDNgS7YRnEoy0knAXOTc8JnXhCPxby7wae
 ol0iRX7pjij2dq2HDwBBAjZw563I=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr13100868ybd.243.1614934985547; 
 Fri, 05 Mar 2021 01:03:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvjZbyzOJpnfgPQVVWT7iV2DF32/AQs2n3pKMsFXZqHZrab6kFyE9tHAKEYVvRqMZ2l7nr8EB0hiUDw8DNARc=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr13100828ybd.243.1614934985241; 
 Fri, 05 Mar 2021 01:03:05 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <YBE03REJywKIlM0X@yuki.lan> <2021012718043566596022@chinatelecom.cn>
 <CAEemH2dA0T1F3wsdwtG2hsfDUUJsY8gFeTLTHyGz+pu034gH4g@mail.gmail.com>
 <202103051352110688245@chinatelecom.cn>
In-Reply-To: <202103051352110688245@chinatelecom.cn>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Mar 2021 17:02:53 +0800
Message-ID: <CAEemH2cW9djj3sN8j9Xj_A5iNB9DLhYYkK=nu8ypaOtiYMnLyw@mail.gmail.com>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1224050601=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1224050601==
Content-Type: multipart/alternative; boundary="0000000000002190a005bcc65a67"

--0000000000002190a005bcc65a67
Content-Type: text/plain; charset="UTF-8"

Hi Xinpeng,

On Fri, Mar 5, 2021 at 1:52 PM liuxp11@chinatelecom.cn <
liuxp11@chinatelecom.cn> wrote:

> --- a/lib/tst_memutils.c
> +++ b/lib/tst_memutils.c
> @@ -36,6 +36,13 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
>         if (info.freeram - safety < maxsize / info.mem_unit)
>                 maxsize = (info.freeram - safety) * info.mem_unit;
>
>  ==>Thanks,but the maxsize original code need to be deleted,Right?
>

No, the maxsize code is also useful, it needs to define the value in
most common situations(i.e. CommitLimit > MemAvailable).

But I'm still hesitating to use ComitLimit as the threshold for 'maxsize'.
Because according to the Linux document, it says that only take effort
when overcommit_memory is setting to 2. But our test system all set 0
by default.

   "This limit is only adhered to if strict overcommit accounting is enabled
    (mode 2 in 'vm.overcommit_memory')."
    see:
https://github.com/torvalds/linux/blob/master/Documentation/filesystems/proc.rst

Seems to use CommitLimit looks a bit strict and strange to test.

And I even think the way to use MemAvailable is acceptable if
MemFree > MemAvailable, just like what you did in your last patch.

I'm still not very sure so far~
(But one thing I can confirm that MemAvailable < MemFree is correct
behavior sometimes)



>
> +       /*
> +        * To respect CommitLimit to prevent test invoking OOM killer,
> +        * this may appear on system with a smaller swap-disk (or
> disabled).
> +        */
> +       if (SAFE_READ_MEMINFO("CommitLimit:") <
> SAFE_READ_MEMINFO("MemAvailable:"))
> +               maxsize = SAFE_READ_MEMINFO("CommitLimit:") * 1024 -
> (safety * info.mem_unit);
> +
>         blocksize = MIN(maxsize, blocksize);
>         map_count = maxsize / blocksize;
>         map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
>


-- 
Regards,
Li Wang

--0000000000002190a005bcc65a67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xinpeng,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Mar 5, 2021 at 1:52 PM <a href=3D"ma=
ilto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@chinatelecom.cn</a>=
 &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@c=
hinatelecom.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>
<div><span></span><div class=3D"gmail_quote"><span class=3D"gmail_default">=
--- a/lib/tst_memutils.c<br>+++ b/lib/tst_memutils.c<br>@@ -36,6 +36,13 @@ =
void tst_pollute_memory(size_t maxsize, int fillchar)<br><strike>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (info.freeram - safety &lt; maxsize / info.mem_unit)<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxsize =3D (info=
.freeram - safety) * info.mem_unit;</strike><br><br></span></div><div class=
=3D"gmail_quote"><span class=3D"gmail_default">=C2=A0=3D=3D&gt;Thanks,but t=
he maxsize original code need to be deleted,Right?<br></span></div></div></=
div></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">No, the maxsize code is also useful, it needs to define th=
e value in</div><div class=3D"gmail_default" style=3D"font-size:small">most=
 common situations(i.e. CommitLimit &gt;=C2=A0MemAvailable).</div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">But I&#39;m st=
ill hesitating to use ComitLimit=C2=A0as the=C2=A0threshold for &#39;maxsiz=
e&#39;.</div><div class=3D"gmail_default" style=3D"font-size:small">Because=
 according to the Linux document, it says that only take effort</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">when overcommit_memory is =
setting to 2. But our test system all set 0</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">by default.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><span class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 =C2=A0</span>&quot;This limit is only adhered to if=
 strict overcommit accounting is enabled</div><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0 =C2=A0 </span>(mode 2 in &#39;vm.ove=
rcommit_memory&#39;).&quot;<br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 see:<a href=3D"https://github.com/torva=
lds/linux/blob/master/Documentation/filesystems/proc.rst" target=3D"_blank"=
> https://github.com/torvalds/linux/blob/master/Documentation/filesystems/p=
roc.rst</a></div></div><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Seems to use CommitLimit looks a bit strict and stra=
nge to test.</div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">And I even think the way to use MemAvailable is acceptable if<=
/div><div class=3D"gmail_default" style=3D"font-size:small">MemFree &gt; Me=
mAvailable, just like what you did in your last patch.</div><div class=3D"g=
mail_default" style=3D"font-size:small"></div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I&#39;m still not very sure so far~</div><div class=3D"gmai=
l_default" style=3D"font-size:small">(But one thing I can confirm that MemA=
vailable &lt; MemFree is correct behavior sometimes)</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><di=
v class=3D"gmail_quote"><span class=3D"gmail_default"><br></span></div><div=
 class=3D"gmail_quote"><span class=3D"gmail_default">+ =C2=A0 =C2=A0 =C2=A0=
 /*<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* To respect CommitLimit to prevent tes=
t invoking OOM killer,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* this may appear on=
 system with a smaller swap-disk (or disabled).<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>+ =C2=A0 =C2=A0 =C2=A0 if (SAFE_READ_MEMINFO(&quot;CommitLimit:=
&quot;) &lt; SAFE_READ_MEMINFO(&quot;MemAvailable:&quot;))<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxsize =3D SAFE_READ_MEMINFO(&quot;=
CommitLimit:&quot;) * 1024 - (safety * info.mem_unit);<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 blocksize =3D MIN(maxsize, blocksize);<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 map_count =3D maxsize / blocksize;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 map_blocks =3D SAFE_MALLOC(map_count * sizeof(void *));</span></div>=
</div></div></blockquote><div>=C2=A0</div></div><div><br></div>-- <br><div =
dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--0000000000002190a005bcc65a67--


--===============1224050601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1224050601==--

