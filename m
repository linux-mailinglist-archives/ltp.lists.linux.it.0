Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563027A796
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 08:34:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C43E63C2B2B
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 08:34:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1D4963C003D
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 08:34:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E4F216404A1
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 08:34:37 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601274876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGlOKGRgNysHo+/BO6GuQlco1rNhgNZEP482uMe2rLI=;
 b=WyS11UP5VBTymJHLHGpbxhWWU0GPZYINxarij6tUfDjFLj9LbHuayxBxWGdpASChYX59k4
 j6y1YLjo3CrY9V5krVnpMoFyNmsPyuJnc977GGlwu/SO7zs71WePynpPI2XGuYzGxADpK0
 wqxrYwVTF7VJp1arQ/qhCWCvdKUrwlw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-5HPWcPdENeGYBrj39xZs8A-1; Mon, 28 Sep 2020 02:34:33 -0400
X-MC-Unique: 5HPWcPdENeGYBrj39xZs8A-1
Received: by mail-yb1-f198.google.com with SMTP id 139so61868ybe.15
 for <ltp@lists.linux.it>; Sun, 27 Sep 2020 23:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KGlOKGRgNysHo+/BO6GuQlco1rNhgNZEP482uMe2rLI=;
 b=QI1Cjbz49r/9/6fZIQY9dixG/Ipv2rvLOKFHVW6LPh0WMPcqZaOjQtgvMvAbA5Fd7o
 uADH5fal9NuGbJJxUf/vwq4+xqfxqIxc0V0D+zlHq3F/JXXfrXlFricm9c07snT0gBiu
 Hxk3HY3jtuTAm2Baub/34l9G82jkeIuOXRcklgVUCFE9g3I/+fKf7U7PHo1Znmp8xikm
 3MZ5LefK9G7aXvHzJ8vdB9QDenjMrQIJ9zxzuIAHLS+A7aicOCKolj/L11a10iUQf0G9
 pOQo+XfSDS9gDUMYWdKcGFHO50FcUcp9hacLsTS3ZUU8Zrc31qNg4MizmutKDpkPkL7z
 /iPA==
X-Gm-Message-State: AOAM5324wlAMJDF52vLW49YNmPZYiO++TwqXRssFXQ9XjvmH6f2iu+kt
 56SHH0vufq3jngLs+0fURIjbynHrLu8QiddsONMB1rTsQxvIeCwGhpZUs+Qna8F4tfi70ct+1tR
 p2rCGZBfDK7suDdzSPYhM8Sgwzcs=
X-Received: by 2002:a25:730a:: with SMTP id o10mr91080ybc.403.1601274872516;
 Sun, 27 Sep 2020 23:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyxJ8gsYMQJiIipL3OH7p5ngwKSBYEl5C4iGD0tQwe2Jv5qc7hC9LVfwLYrrhSag8SN2bkKJqZsOy6FzKBQNk=
X-Received: by 2002:a25:730a:: with SMTP id o10mr91066ybc.403.1601274872311;
 Sun, 27 Sep 2020 23:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200928054043.17058-1-po-hsu.lin@canonical.com>
In-Reply-To: <20200928054043.17058-1-po-hsu.lin@canonical.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Sep 2020 14:34:20 +0800
Message-ID: <CAEemH2dfGU3ieQhrFY7t+=1oUp_rji_eAY37tt30z=QzpeYrQA@mail.gmail.com>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_inherit_test: compatibility fix for DASH
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
Content-Type: multipart/mixed; boundary="===============0501250338=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0501250338==
Content-Type: multipart/alternative; boundary="000000000000f3cafc05b059db04"

--000000000000f3cafc05b059db04
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 1:41 PM Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:

> The /bin/sh was symbolically link to dash in Ubuntu, in which the
> "let" expression does not work, it will complain about:
>     cpuset_inherit_testset.sh: let: not found
>
> Fix it with double parentheses arithmetic expansion to improve the
> compatibility.
>
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
>

Pushed, thanks!


-- 
Regards,
Li Wang

--000000000000f3cafc05b059db04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 1:41 PM Po-Hsu Lin &lt;<a h=
ref=3D"mailto:po-hsu.lin@canonical.com">po-hsu.lin@canonical.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The /bin/sh=
 was symbolically link to dash in Ubuntu, in which the<br>
&quot;let&quot; expression does not work, it will complain about:<br>
=C2=A0 =C2=A0 cpuset_inherit_testset.sh: let: not found<br>
<br>
Fix it with double parentheses arithmetic expansion to improve the<br>
compatibility.<br>
<br>
Signed-off-by: Po-Hsu Lin &lt;<a href=3D"mailto:po-hsu.lin@canonical.com" t=
arget=3D"_blank">po-hsu.lin@canonical.com</a>&gt;<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Pushed, t=
hanks!</div><br></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--000000000000f3cafc05b059db04--


--===============0501250338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0501250338==--

