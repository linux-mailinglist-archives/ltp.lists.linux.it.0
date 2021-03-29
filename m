Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BF534C1DF
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:10:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4F893C2B75
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:10:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 708B03C1D25
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:10:05 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A5E7F140051A
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616983803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ojm+VRp5RfvEjPSW9PRV0G2de2eBBjisUDSvRx/hzx8=;
 b=I6Utgdhr1V2e15XCDZEOulRT5az41/wH+Q7uucyYrN/ADDSNNDgi4Evk4oOrVCKgQS8ElH
 YX8+tm4TkSUES8IV6U0Vu41GnJ+1ED6LbJfQ+Mlc42e89QJzEzYd79xgKnviN3RavRDQ1v
 kv7vbdBfDxHGy1vofWS1C/iTiII6h90=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-YCCaaEJdMh68j7tOjn-oGQ-1; Sun, 28 Mar 2021 22:09:59 -0400
X-MC-Unique: YCCaaEJdMh68j7tOjn-oGQ-1
Received: by mail-yb1-f198.google.com with SMTP id d1so2424001ybj.15
 for <ltp@lists.linux.it>; Sun, 28 Mar 2021 19:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ojm+VRp5RfvEjPSW9PRV0G2de2eBBjisUDSvRx/hzx8=;
 b=mGBATXeaD47jfVqwpncD5vvh8lvEUJrg1FnFWmVSQNjfaTJDjMlE705sA5RaNptGhL
 LkAQ6AXwHTU4LCWrwVLf/QYxpSskXF3hLD7B6VBN0CSP3qg7Rm+tBIHOdoUPtiT+AAlH
 kQ5AXz3P4NogA4WjfFvfKUBZJXQlctQZe1OD8zTYlKljUg6p8VAgt0M8T9NFm3j/aMT3
 f4G8w7LHrrrP2uxmgxoKxWmX6hdORYH5hllJces9ucIKZB2Trn2r4ZgWW6aPCg1m0KKl
 gkxtir18mo38omy5WOYFVG23Lb1Hj6eGzQ6Dm++TbQs1DxRDSCp8V8HuhQZTY/1NkJvb
 1faQ==
X-Gm-Message-State: AOAM531Fgqq8c1oy4KnOFIhEVmNNz5m89DRQ+O8fLdyGZG1l8xqMdHr6
 KTHdqJf02r/JOzkv2x10YdxSYrAbzpV21djx9LpjomRq/dt5b4CZT7ccmXbhBcTIiSH79wdszfx
 MWb+OoyQmYqfAl5ez0e2ydw+jN+A=
X-Received: by 2002:a25:768c:: with SMTP id r134mr2671102ybc.366.1616983799341; 
 Sun, 28 Mar 2021 19:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzetN4biOz086fxdnqdvcuNwMQEH9Ke+6CBRvZZ3g9VxJGgkDEkuxl5wAz/r7LhIw/um4XeGvDzEtdMy0RQNsU=
X-Received: by 2002:a25:768c:: with SMTP id r134mr2671093ybc.366.1616983799179; 
 Sun, 28 Mar 2021 19:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCB7@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCB7@dggeml531-mbx.china.huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Mar 2021 10:09:47 +0800
Message-ID: <CAEemH2foLxSYEGrmLOeXJAKWx7cBHEEkD9BrUFXKAyoCpE6rug@mail.gmail.com>
To: zhaogongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============1176631072=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1176631072==
Content-Type: multipart/alternative; boundary="000000000000f542ae05bea3601b"

--000000000000f542ae05bea3601b
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 29, 2021 at 9:56 AM zhaogongyi <zhaogongyi@huawei.com> wrote:

> Hi Li,
>
>
>
> Actually, I have no effective tools to find out all of this type problems.
>
>

Indeed, the wrong usage of TTERRNO you find mostly occurred in bad code
logic.
That's hard to correct them in an automatic way.

-- 
Regards,
Li Wang

--000000000000f542ae05bea3601b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 9:56 AM zhaogongyi &lt;<a h=
ref=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_-2200730713390592469WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">Hi Li,<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">Actually, I have no effecti=
ve tools to find out all of this type problems. =C2=A0</span></p></div></di=
v></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Indeed, the wrong usage of TTERRNO=C2=A0you find mostly occu=
rred=C2=A0in bad code logic.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">That&#39;s hard to correct them in an automatic=C2=A0way.</di=
v></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--000000000000f542ae05bea3601b--


--===============1176631072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1176631072==--

