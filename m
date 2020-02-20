Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FA16568F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:11:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 671043C24FF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:11:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 531193C2245
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:11:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id ECA801A016FE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582175476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+tVHZzErsANLjXEBpgz6jES+xkJyNaWHGJ0Nua2lFg4=;
 b=SmN8TjTxpSZi1iJemziz+5qEhBhApTL4BmLahhYhOp6qCX9WpmKHyeuaxoFPbmDe38jR4b
 1sI8Op2nXZnnazuW8ozQg2BOdXg7oHShGX9hzW1x7iKVRyX9MB9R6t5pgu/RGPo89YDwlZ
 ZuBD+FXuqQyDVgWIvUaKOQiOIUBMgYE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-qXV7cKM5NBOxfsSI7QWN8A-1; Thu, 20 Feb 2020 00:11:07 -0500
Received: by mail-oi1-f200.google.com with SMTP id n4so3411755oih.12
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d8LV2vAYH5h/Q6o5UxL01QQ61WaOMhFxUYkABnddQyI=;
 b=hauRxswvUZ005KDMj0Jty2HxHACegiKHVcNKwfBBmMfy2Ppb8HTYLCl+vCkYALUqnI
 o5YfnwRH8vVFZsbYamtSzp97VJyFy0NWfgdjE/gQY5yf4JDTWIpoFlgZBBecAqLL0B7A
 K8VFqT8QDjyrCdIzfSldXkGiozCQB7F2e3a1IOBlQm0jXvdmVv6hxcjqbqFit0Qmkpo6
 21lIN5145BuSq/Ky6fy69lcvpIBAlDRjyQiCbSUNTgVajw88bizHAVDp5JNAJS7rPER5
 awWIV2Gvs/dCjfBBddUoS/jSqDQQ+8ctpmgh08ualnj0B7q73p8Sn353oNd3bfp9aBPH
 W0hA==
X-Gm-Message-State: APjAAAUadscuDCMv0gXbmwj+1IrAjYPglCXiLDO9cTpfxsNsdNbHY4Va
 Or4OyLR6lnZhTlLRygqRlnyAIsj1h+qZP2C3qzV9Bel8duEcCj5KZvVjciH451gpAXEU0mQy8Um
 00YWSE2VffASXItl+CSvVuD3yJIM=
X-Received: by 2002:a9d:395:: with SMTP id f21mr22484267otf.67.1582175466642; 
 Wed, 19 Feb 2020 21:11:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRdkHHrGTuFHY/7T/R9HbfHV21HgKH7OcxuzYoP/E6V5nRWBSFygP6OTpevx3NJMHI/QDO2riC2zO1Bc0qAHE=
X-Received: by 2002:a9d:395:: with SMTP id f21mr22484247otf.67.1582175466344; 
 Wed, 19 Feb 2020 21:11:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 13:10:54 +0800
Message-ID: <CAEemH2d9DmK3-1hNH4Y-L+qikN7GXPbtguM7q4AQ__9is2MoPA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: qXV7cKM5NBOxfsSI7QWN8A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 01/10] tst_device: Add tst_ismount() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2094679776=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2094679776==
Content-Type: multipart/alternative; boundary="000000000000a4e533059efaee17"

--000000000000a4e533059efaee17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This patch moves the ismount() helper added to the fsmount syscall tests
> to the standard library and renames it to tst_ismount(). The helper can
> be used across different files now.
>
> Minor modifications are also done to the helper.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
> +/*
> + * Verifies if an earlier mount is successful or not.
> + * @path: Mount path to verify
> + */
> +int tst_ismount(const char *path);
>

I have slightly thought to rename it as 'tst_is_mounted(const char *path)',
but it also depends on other reviewer's opinion, I have no strong insist
here.

--=20
Regards,
Li Wang

--000000000000a4e533059efaee17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This patch moves the ismount() helper added to the fsmount syscall t=
ests<br>
to the standard library and renames it to tst_ismount(). The helper can<br>
be used across different files now.<br>
<br>
Minor modifications are also done to the helper.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br></blockquote><div><spa=
n class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang &lt;<=
a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>=
&gt;</span></div><div><span class=3D"gmail_default" style=3D"font-size:smal=
l"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
+/*<br>
+ * Verifies if an earlier mount is successful or not.<br>
+ * @path: Mount path to verify<br>
+ */<br>
+int tst_ismount(const char *path);<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I have slightly thought to r=
ename it as &#39;tst_is_mounted(const char *path)&#39;, but it also depends=
 on other reviewer&#39;s opinion, I have no strong insist here.</div><div><=
br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--000000000000a4e533059efaee17--


--===============2094679776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2094679776==--

