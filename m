Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31E245B08
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 05:28:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 650763C591C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 05:28:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EF3D23C1CDD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:28:29 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E6B49200903
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597634905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6ZrpH+WkDj03NpjuzepQ0TABF0Sy8gmVCOjY3FwrSE=;
 b=KjcFdELho9yXlw9qU3a6oFirzmLgl4uSSb2mvc95LVdXDpAxa6VB3+wdmLapEjM4cQYdgM
 jPftwcvObRdUdLSS6T3Y8T9FVprv5fGwa6z8ABVYUx0xKrJ4HxtG30FxWR9mzR9qx4zSl9
 XSN7wi1epZCWbJjQdsc4tncFSUx9fCw=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-n8BsdJSWMVO6BekMzUq-cg-1; Sun, 16 Aug 2020 23:28:23 -0400
X-MC-Unique: n8BsdJSWMVO6BekMzUq-cg-1
Received: by mail-yb1-f199.google.com with SMTP id 83so17326928ybf.2
 for <ltp@lists.linux.it>; Sun, 16 Aug 2020 20:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P6ZrpH+WkDj03NpjuzepQ0TABF0Sy8gmVCOjY3FwrSE=;
 b=mWHi4i+fLzA0091AI7bwTi8vBcCRZjGvO/K3xyx9qZ6K/C8KJGH26lDQbf0p0qfG5w
 LsKqKtqtQayRhfCn7fS6kLVV1HDhEmBenBM+ZFjQeOUmKbA0HKPXFVnOCVG9h0zouKrl
 n9noFx/w1QSV40dzyzpejh+rAQWRuOsrJU47hpz4x7LVajBALJpHJBbmkegvyR5UVu9M
 lyYUW4e6X7zZtfvcME317F+DQjv/C0Nc1TMB9+Lejv/7F2ecyeyV1m0q40pQ1E9i+34m
 f3m4GoW+s/FYazqZ/DwJ64qwiaI47qRvVHnSoR6W9XhqMd51rdJhhUAkJT1UwPYazyHw
 M33w==
X-Gm-Message-State: AOAM533cRUScplh1E3QYvHK2xT/AGTPhwoHXCMDNFEhUanC6UvX2b4BR
 s7CuM4gWTRkvbx2/4WwSmqw4boxRODyY8lDLPi0SVN95zyEpc5olANyLtpsWo1RSxzta6CZgyzT
 LDXHJpG3FrnJpGHYwGtjHfHwTI2w=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr18454486ybc.243.1597634903113; 
 Sun, 16 Aug 2020 20:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN/molyV1oXgGXzw8QNT0u96CdPjGILoyHlXCmAMxRcatDiDYlSTYZVRM9wILhL+9OZittXqOFLF1n8sl6cZM=
X-Received: by 2002:a25:7b44:: with SMTP id w65mr18454474ybc.243.1597634902852; 
 Sun, 16 Aug 2020 20:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200806162356.16920-1-mdoucha@suse.cz>
 <752669298.7180757.1597047872449.JavaMail.zimbra@redhat.com>
In-Reply-To: <752669298.7180757.1597047872449.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Aug 2020 11:28:11 +0800
Message-ID: <CAEemH2cCq1LL_91pOavNWHmHGQs6EfFsyGXaOBuqh-CrFxP7Pg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1077978335=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1077978335==
Content-Type: multipart/alternative; boundary="000000000000ddae4405ad0a5ccb"

--000000000000ddae4405ad0a5ccb
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 10, 2020 at 4:24 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > The mem01 test often fails on PPC systems mainly because it doesn't take
> into
> > account page sizes larger than 4KB. Test scenario review revealed that
> it's
> > not particularly useful because it doesn't have any more specific goal
> than
> > filling large amount of memory and the hardcoded allocation limits are
> too
> > low for modern and future systems. The useful part of this test mostly
> > overlaps with coverage by existing OOM tests.
> >
> > Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>
> Acked-by: Jan Stancek <jstancek@redhat.com>


Pushed, thanks!


-- 
Regards,
Li Wang

--000000000000ddae4405ad0a5ccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 10, 2020 at 4:24 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; The mem01 test often fails on PPC systems mainly because it doesn&#39;=
t take into<br>
&gt; account page sizes larger than 4KB. Test scenario review revealed that=
 it&#39;s<br>
&gt; not particularly useful because it doesn&#39;t have any more specific =
goal than<br>
&gt; filling large amount of memory and the hardcoded allocation limits are=
 too<br>
&gt; low for modern and future systems. The useful part of this test mostly=
<br>
&gt; overlaps with coverage by existing OOM tests.<br>
&gt; <br>
&gt; Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" ta=
rget=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
<br>
Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"=
_blank">jstancek@redhat.com</a>&gt;</blockquote><div>=C2=A0=C2=A0</div></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Pushed, thank=
s!</div><br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div=
></div></div>

--000000000000ddae4405ad0a5ccb--


--===============1077978335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1077978335==--

