Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E634C309
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 07:33:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AA313C2605
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 07:33:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 30DE13C25E9
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 07:33:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 441AF2009C2
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 07:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616996024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7ZAnrewZeWF4dLttTVw1whKReD0rZvN1uJKvvqNtXY=;
 b=egXEJvCgL9+Tnz+d9CQIEf76ZEJwKk2y8ROJOAVpbZX2VQDBrr619rop4QLY8sUGfmofHL
 sfnepAWZbIAH6XZzo38w8AvfF43FArYadrEQvwcIebx0xIkLBWS26THD6tky6alN9+1Ljx
 qxTECcCbFRh+m/WapIG/bHtEny4+T8I=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-MlF3fIKjO9ilZnJBqs6D7A-1; Mon, 29 Mar 2021 01:33:42 -0400
X-MC-Unique: MlF3fIKjO9ilZnJBqs6D7A-1
Received: by mail-yb1-f197.google.com with SMTP id f124so16378263ybc.0
 for <ltp@lists.linux.it>; Sun, 28 Mar 2021 22:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7ZAnrewZeWF4dLttTVw1whKReD0rZvN1uJKvvqNtXY=;
 b=QNlgzxFsPRnBsvnyYShlFtOJiUvoy7EAznq2n0fNAbpUhwvGjL2PH9GdiDjViAAd6/
 DEA5b2USYBeEvWsR2hz9CiEfKjEN4fOstcgUdATLKBmrZXS7Zyrr1gV+augSEqzKq5R7
 qRL7gOs5ufhW7r5tD6Pw5ewGc1th2HqcwIHYDJ3ac2Uw527Lzk4jMvmNrI5PlGk5ScEV
 Htv06leviwgxxnEeTAFpTGPePLph3ANhliZD79XBW/gelBsAKplhR15UjHlmVRFGgPEQ
 dusPIovc61p7ORt4pfl5PJkF6QwQDVT9dTvsjshUGTKcoFextM4HuuB1YMJ38R9diGiI
 /9pw==
X-Gm-Message-State: AOAM530bt1kUwU0oWIWXh7S7hZ13bPlAcchPmv3NGmC4sOHz3dvr5h6X
 h9Q3itqHUYeunGWHt/aOeuy+bVCOhutpnjvmJfHyMH+pThFXfwYttOER+hzha/YrpVXXikcdJUn
 4dG9hL8ZO3MygUr3VlFdXQSpMGW8=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr36462341ybg.97.1616996021777; 
 Sun, 28 Mar 2021 22:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzkFNWvOUnAUWz3m6DkGlAcBXGRyRMGBT3Ll+1Od82TwE4kwNDltKro1QQWQUsqCvBCs9Luzx370LlVVZZ06Q=
X-Received: by 2002:a25:dd06:: with SMTP id u6mr36462325ybg.97.1616996021571; 
 Sun, 28 Mar 2021 22:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
In-Reply-To: <20210327103226.99073-1-qi.fuli@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Mar 2021 13:33:30 +0800
Message-ID: <CAEemH2dQPS+zhp0gEcTjPswjwX+csN72xbCuHzwW=ExcgUPKNQ@mail.gmail.com>
To: QI Fuli <fukuri.sai@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] Convert syscalls/swap{on, off}/ to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1409472498=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1409472498==
Content-Type: multipart/alternative; boundary="000000000000782b3c05bea639a2"

--000000000000782b3c05bea639a2
Content-Type: text/plain; charset="UTF-8"

Hi Fuli,

QI Fuli <fukuri.sai@gmail.com> wrote:

From: QI Fuli <qi.fuli@fujitsu.com>
>
> Rename libs/libltpswapon libs/libltpswap and Convert it to the new API
> Convert syscalls/swap{on,off}/ to the new API
>
> QI Fuli (6):
>   libs/libltpswap: Add libs/libltpswap by using the new API
>   syscalls/swapon/swapon01: Convert swapon01 to the new API
>   syscalls/swapon/swapon02: Convert swapon02 to the new API
>   syscalls/swapon/swapon03: Convert swapon03 to the new API
>   syscalls/swapoff/swapoff01: Convert swapoff01 to the new API
>   syscalls/swapoff/swapoff02: Convert swapoff02 to the new API
>

I made some changes based on your patchset and pushed it.

* remove the libs/libltpswapon from patch 1/6
* add [Description] in the comment to make ltp/docparse happy
* fix some TTERRNO/TERRNO usage issues
* code indent issue e.g. add brackets while more than two lines in
if...else sentence

Btw, next time you can add '-v2' parameter when generating the second patch
version.

`git format-patch -v2 -6 ...`

-- 
Regards,
Li Wang

--000000000000782b3c05bea639a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Fuli,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">QI Fuli &lt;<a href=3D"mailto:fukuri.sai@gmai=
l.com" target=3D"_blank">fukuri.sai@gmail.com</a>&gt; wrote:<br></div><div =
dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: QI Fuli &lt;<a href=3D"mailto:qi.fuli@fujitsu.com" =
target=3D"_blank">qi.fuli@fujitsu.com</a>&gt;<br>
<br>
Rename libs/libltpswapon libs/libltpswap and Convert it to the new API<br>
Convert syscalls/swap{on,off}/ to the new API<br>
<br>
QI Fuli (6):<br>
=C2=A0 libs/libltpswap: Add libs/libltpswap by using the new API<br>
=C2=A0 syscalls/swapon/swapon01: Convert swapon01 to the new API<br>
=C2=A0 syscalls/swapon/swapon02: Convert swapon02 to the new API<br>
=C2=A0 syscalls/swapon/swapon03: Convert swapon03 to the new API<br>
=C2=A0 syscalls/swapoff/swapoff01: Convert swapoff01 to the new API<br>
=C2=A0 syscalls/swapoff/swapoff02: Convert swapoff02 to the new API<br></bl=
ockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I made some changes based on your patchset and pushed it.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">* remove the=C2=A0libs/libltpswapon fr=
om patch 1/6</div><div class=3D"gmail_default" style=3D"font-size:small">* =
add [Description] in the comment to make ltp/docparse happy</div><div class=
=3D"gmail_default" style=3D"font-size:small">* fix some TTERRNO/TERRNO=C2=
=A0usage issues</div><div class=3D"gmail_default" style=3D"font-size:small"=
>* code indent issue e.g. add brackets while more than two lines in if...el=
se sentence</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Btw, next tim=
e you can add &#39;-v2&#39; parameter when generating the second patch vers=
ion.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">`git format-patch -v=
2 -6 ...`</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000782b3c05bea639a2--


--===============1409472498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1409472498==--

