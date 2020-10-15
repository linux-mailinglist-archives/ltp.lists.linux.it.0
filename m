Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD828ED2A
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 08:45:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A5F13C3245
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 08:45:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 790513C266F
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 08:45:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D79D1600747
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 08:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602744345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hDfc4ItqX6X1MniP6e5qDQY81nmi14+JPRfWkBIjbc=;
 b=U5ixT3v7iWZObMmp2KcwxtRV9buu44vp7fo66LEO0XNGYi5BmoRBVGtGB/E7fCDcM3f+03
 so6YzUXKWDz8oRMxizOSJkYqmJ9ai+i0GFy6CVYWPyPkv4P08j1jkb/lfKGT7Z4zG/HsQB
 RDComdyT9/VTj+W1USihj4Ok3nK6s0A=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-NPlnLYCfMm-4zEqywaQX7Q-1; Thu, 15 Oct 2020 02:45:39 -0400
X-MC-Unique: NPlnLYCfMm-4zEqywaQX7Q-1
Received: by mail-yb1-f199.google.com with SMTP id n13so1934133ybk.9
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 23:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hDfc4ItqX6X1MniP6e5qDQY81nmi14+JPRfWkBIjbc=;
 b=Vt0VXJ5UV6cxoQ42DZnGMumKsFdjBZHi6lp9yNNAZnXVM2yAZzPDtzns1nAtXTMCSK
 anCn8qfLcsEfrTlrxM4f5FykKa/kdPNqSRc9SGRN5t4wl/Z2CgFUrTGY2XsQ3zoS9/AZ
 y6/iH1aitFTGdr3z4fqtbQJJxNvLhm0yRuIIZohHQDKCdtDQas7d72xc79gvjpdwSgMJ
 JJPpj27VhVQGzSMYXvsgqVjzQuNRZuP/i+OcZ9lpwvf5FmHk+Qk6Y+DBUlGioDGCFd6i
 VNfCoKUfLJDNUqruMV5CQa4Z6xOMwmXphM1jD96VuVIPLj6C6afYkQcO/0m6gP/16cUL
 tmTA==
X-Gm-Message-State: AOAM533wEyCRuvMXfVL8KbqZaRxIuqswK6T+2+xBv0NrExgv44HfDmFR
 3zvyA4sVKB5WVHfmpNZAt8r14B+f3Zeqct73ZWgkqQOLbdfv5R+lUP0w5Rcfhb/nfGfRaw1CA7J
 GoY6vhH9shNZYMIDPxTBS4eakJkA=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr3469202ybe.110.1602744339172; 
 Wed, 14 Oct 2020 23:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzkX6SMtNGutHN9Tm9XBhbiwMaTOorgFFuCeOg103Jq9V/aOPJPXF8FEI3gLFpA58U3xL5+DSPQVcv7aia4x8=
X-Received: by 2002:a25:ae47:: with SMTP id g7mr3469186ybe.110.1602744338965; 
 Wed, 14 Oct 2020 23:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <57e1161dae434ffda48b0e0cc261e706@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <57e1161dae434ffda48b0e0cc261e706@G08CNEXMBPEKD04.g08.fujitsu.local>
From: Li Wang <liwang@redhat.com>
Date: Thu, 15 Oct 2020 14:45:27 +0800
Message-ID: <CAEemH2f_XrhCWq_B-njUDC5_rz-PNChm8Os-zDF18pN3AQpfgA@mail.gmail.com>
To: "Chen, Hanxiao" <chenhx.fnst@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_use_hierarchy_test.sh: skip setting
 use_hierarchy if not available
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1286742386=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1286742386==
Content-Type: multipart/alternative; boundary="000000000000fd80b905b1affea2"

--000000000000fd80b905b1affea2
Content-Type: text/plain; charset="UTF-8"

Chen, Hanxiao <chenhx.fnst@cn.fujitsu.com> wrote:

 *...*
>
> >@Li, I think this patch is ok, Do you have some comment about it?
>
> >
>
> >I'm ok to go with memory.use_hierarchy checking in the preconditioning
> phase.
>
> >
>
> >But how can you assert the default memory cgroup is mount at path:
> "/sys/fs/cgroup/memory", is there any possibility the default path mount at
> other places(for different distribution)?
>
>
>
>
> https://github.com/torvalds/linux/blob/b5fc7a89e58bcc059a3d5e4db79c481fb437de59/kernel/cgroup/cgroup.c#L5768
>
>
>
> WARN_ON(sysfs_create_mount_point(fs_kobj, "cgroup"));
>
>
>
> So the default mount place should be /sys/fs/cgroup if distributions
>
> did not modify these lines.
>
>
>
> As the discussion above,
>
> mount -t cgroup -omemory memcg /dev/memcg
>
> kernel will find a suitable cgroup root for us.
>
>
>
> How about reading /dev/memcg/memory.use_hierarchy as Yang recommended
> instead?
>

Sure.

But also, shouldn't we check if the '/dev/memcg' has sub-directory
before changing the memory.use_hiearchy in memcg_lib.sh?

As you noted in the description, enabling/disabling will fail if either
the cgroup already has other cgroups created below it.

-- 
Regards,
Li Wang

--000000000000fd80b905b1affea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Chen, Hanxiao &lt;<a href=3D"mailto:chenhx.fnst@cn.fuji=
tsu.com" target=3D"_blank">chenhx.fnst@cn.fujitsu.com</a>&gt; wrote:<br></d=
iv><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u><span class=3D"gmail_default" style=3D"font-size:small">...=
</span></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
&gt;@Li, I think this patch is ok, Do you have some comment about it?<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
&gt;<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
&gt;I&#39;m ok to go with memory.use_hierarchy checking in the precondition=
ing phase.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
&gt;<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
&gt;But how can you assert the default memory cgroup is mount at path: &quo=
t;/sys/fs/cgroup/memory&quot;, is there any possibility the default path mo=
unt at other places(for different distribution)?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<a href=3D"https://github.com/torvalds/linux/blob/b5fc7a89e58bcc059a3d5e4db=
79c481fb437de59/kernel/cgroup/cgroup.c#L5768" target=3D"_blank"><span style=
=3D"color:rgb(31,73,125);text-decoration:none">https://github.com/torvalds/=
linux/blob/b5fc7a89e58bcc059a3d5e4db79c481fb437de59/kernel/cgroup/cgroup.c#=
L5768</span></a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
WARN_ON(sysfs_create_mount_point(fs_kobj, &quot;cgroup&quot;));<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
So the default mount place should be /sys/fs/cgroup if distributions<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
did not modify these lines.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
As the discussion above,
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
mount -t cgroup -omemory memcg /dev/memcg<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
kernel will find a suitable cgroup root for us.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
How about reading /dev/memcg/memory.use_hierarchy as Yang recommended inste=
ad?</span></p></div></div></div></div></div></div></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">Sure.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">But also,=C2=A0shouldn&#39;t w=
e check if the &#39;/dev/memcg&#39; has sub-directory</div><div class=3D"gm=
ail_default" style=3D"font-size:small">before changing the memory.use_hiear=
chy in memcg_lib.sh?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">As y=
ou noted in the description, enabling/disabling will fail if either=C2=A0</=
div><div class=3D"gmail_default" style=3D"font-size:small">the cgroup alrea=
dy has other cgroups created below it.</div></div></div><div><br></div>-- <=
br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br=
></div></div></div></div>

--000000000000fd80b905b1affea2--


--===============1286742386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1286742386==--

