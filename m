Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C8D22D5
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 10:33:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C362A3C1CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 10:33:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6E54F3C0B98
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 10:33:37 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 772FB1401A97
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 10:33:36 +0200 (CEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D54211A2D
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 08:33:34 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id b2so2413534oie.21
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 01:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyBgGviTtUHYXIz5oD2ZoZj9KvVd/ddmmuYUKV7TQ+M=;
 b=Qo5Q/tc7VL7HcmE7qQ/vlQt640pM90YARi9/wv9QznEfLzWGSX3m5eWhjW7nT6Navh
 AEAwO9bLEn9qKMZ4Is+uEg7b9IWtqVsJXVIHTSRMPXjgytE+JFdyYIkcIv3+AMmrw/Hx
 u2BVRxN2jVMHB4vDp209ZVP1xk6NibRHB1xjUgKDpjFapaSJwu+y2ZoPSX7Nnvwvs3gz
 jDfQyahkPoSsR/WxQN1U7g7yEVUX7JAdwPiSHfj4vkUbWth7WmZd0ewXJYXSlJtuKlIb
 2Cr1KOapb39Vs7206aiRU76hh/iKoMM8vRNE0XD0wY+SdS4auOiJEu3h/1nc0mo3yzEB
 C/Mw==
X-Gm-Message-State: APjAAAWR7QTAbaDQu5OKcITdw9ULlcpLZTb5KRusxgmmXp7RCbW56hyN
 ONRBGE9w7KIBMaLTVt3b2vqw996UN1yyu78HQ8SYNcNavjVmoDtylb5KZ4m0HCBsE4KMPRqTpik
 1JcvvQd37udsqGfa6SBkZOYpD2W4=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr6495173oth.118.1570696414163; 
 Thu, 10 Oct 2019 01:33:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztxa/juoQZzEh9g2hhYxpl6jtkD9N6qpnXksGXTVN2A0hpecpdaebmvvhX1TDHuO9yMlF9FBdYP2rSV9UDbTg=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr6495156oth.118.1570696413914; 
 Thu, 10 Oct 2019 01:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191010081752.11334-1-pifang@redhat.com>
In-Reply-To: <20191010081752.11334-1-pifang@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Thu, 10 Oct 2019 16:33:20 +0800
Message-ID: <CAEemH2dNjGXpw87wLqLc8jcEoT_Zc6yap4CfjPxmU=y1JyZ9oA@mail.gmail.com>
To: Ping Fang <pifang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>,
 Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] acct: fix version check on big endian system
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
Content-Type: multipart/mixed; boundary="===============1295289735=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1295289735==
Content-Type: multipart/alternative; boundary="000000000000cd424b05948a415f"

--000000000000cd424b05948a415f
Content-Type: text/plain; charset="UTF-8"

Ping Fang <pifang@redhat.com> wrote:

ac_version = ACCT_VERION | ACCT_BYTEORDER
> which is 0x83 (131) on big endian system.
>
> failure output:
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-4.18.0-147.el8.s390x'
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config
> '/boot/config-4.18.0-147.el8.s390x'
> acct02.c:239: INFO: Verifying using 'struct acct_v3'
> acct02.c:192: INFO: == entry 1 ==
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:192: INFO: == entry 2 ==
> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> acct02.c:133: INFO: ac_exitcode != 32768 (0)
> acct02.c:141: INFO: ac_ppid != 34501 (34500)
> acct02.c:147: INFO: ac_version != 3 (131)
> acct02.c:182: FAIL: end of file reached
>

I'm wondering that is there any necessary to use do{}...while loop for
entry many times? Since the verify_acct() only check the dummy
program(acct02_helper) accounting struct. So in the error logs, we could
see some meaningless data(acct02) in entry 2.

    acct02.c:192: INFO: == entry 2 ==
    acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
    acct02.c:133: INFO: ac_exitcode != 32768 (0)
    acct02.c:141: INFO: ac_ppid != 34501 (34500)

This needs to be fixed in a separate patch.


> Signed-off-by: Ping Fang <pifang@redhat.com>
>

The patch itself looks good. Ack.

-- 
Regards,
Li Wang

--000000000000cd424b05948a415f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Ping Fang &lt;<a href=3D"mailto:pifang@redhat.com">pifa=
ng@redhat.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ac_version =3D=
 ACCT_VERION | ACCT_BYTEORDER<br>
which is 0x83 (131) on big endian system.<br>
<br>
failure output:<br>
tst_kconfig.c:62: INFO: Parsing kernel config<br>
&#39;/boot/config-4.18.0-147.el8.s390x&#39;<br>
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s<br>
tst_kconfig.c:62: INFO: Parsing kernel config<br>
&#39;/boot/config-4.18.0-147.el8.s390x&#39;<br>
acct02.c:239: INFO: Verifying using &#39;struct acct_v3&#39;<br>
acct02.c:192: INFO: =3D=3D entry 1 =3D=3D<br>
acct02.c:147: INFO: ac_version !=3D 3 (131)<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>acct02.c:192=
: INFO: =3D=3D entry 2 =3D=3D<br>
acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (&#39;acct02&#39;)<=
br>
acct02.c:133: INFO: ac_exitcode !=3D 32768 (0)<br>
acct02.c:141: INFO: ac_ppid !=3D 34501 (34500)<br>
acct02.c:147: INFO: ac_version !=3D 3 (131)<br>
acct02.c:182: FAIL: end of file reached<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m wondering t=
hat is there any necessary to use do{}...while loop for entry many times? S=
ince the verify_acct() only check the dummy program(acct02_helper) accounti=
ng struct. So in the error logs, we could see some meaningless data(acct02)=
 in entry 2.</div></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0=
 =C2=A0=C2=A0<span class=3D"gmail_default"></span>acct02.c:192: INFO: =3D=
=3D entry 2 =3D=3D</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">=C2=A0 =C2=A0 acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (=
&#39;acct02&#39;)<br>=C2=A0 =C2=A0 acct02.c:133: INFO: ac_exitcode !=3D 327=
68 (0)<br>=C2=A0 =C2=A0 acct02.c:141: INFO: ac_ppid !=3D 34501 (34500)<br><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">This needs to be fixed=C2=
=A0in a separate patch.</div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
Signed-off-by: Ping Fang &lt;<a href=3D"mailto:pifang@redhat.com" target=3D=
"_blank">pifang@redhat.com</a>&gt;<br></blockquote><div><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">The patch itself looks good. =
Ack.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div></div></div>

--000000000000cd424b05948a415f--

--===============1295289735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1295289735==--
