Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D0130197D
	for <lists+linux-ltp@lfdr.de>; Sun, 24 Jan 2021 05:33:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 199473C63A2
	for <lists+linux-ltp@lfdr.de>; Sun, 24 Jan 2021 05:33:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8ED393C283C
 for <ltp@lists.linux.it>; Sun, 24 Jan 2021 05:33:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BA23014001ED
 for <ltp@lists.linux.it>; Sun, 24 Jan 2021 05:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611462787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZfcMSlwS7Lky+kXglRU69wjObGgAUZb+SCeURLgDG08=;
 b=eI8iTAE+CtAL4SNR+9X1WmbBOaurzBnTV+eJrVAMH2Yr7Qc05bBVGVv52IEdM2YELD/Egd
 0SZUYEDqeXGp5NxtfGkCab/DqDwcxa0UNuqw2BMCwsFBQwhAFb7A9GNAiaGbtgVNIrCTKD
 iju5PyLrAH3xQ3q/M3J2qpi910vz3KE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-aqEduk0SMj-JEc_aGrzqTQ-1; Sat, 23 Jan 2021 23:33:04 -0500
X-MC-Unique: aqEduk0SMj-JEc_aGrzqTQ-1
Received: by mail-yb1-f199.google.com with SMTP id w30so4363947ybi.7
 for <ltp@lists.linux.it>; Sat, 23 Jan 2021 20:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfcMSlwS7Lky+kXglRU69wjObGgAUZb+SCeURLgDG08=;
 b=X1Twho9HpuHBriQJlSOvytKQZ2ge4GMD/FDeNnmxPvVdoudgAa56hT7mPH4+q7lK65
 XEDZJXTsWlMAfnMSisQto2NAewcH7Qr42yFJuZhxfKeouzFQfACYuSSDFQCITs+EMvXg
 zql/0v1iG6ffssbmnHtiMRv8hIVFHrMa9hG9VUZyJvdyEjZTQFLUr/oh+e/MIRIUXt6v
 055dvh4wcsoOzKEyXtT8L2ODTUEOxojPU5mMCypP1MdBRftZjpbPO5ukx/tFQqIaawHL
 CuCfWLd7wA0c/r5GOASxDmCnwD+TLE6+xoQ+dAkFKzeQrmNXOh7soO1pk2n3V59dJ0bv
 MV9g==
X-Gm-Message-State: AOAM530g/v5vLthwQpUWCofPtjO+dZPaPnh8Sd2SGLyGb+A6jE2lcwRR
 ys4DsrKa+WyGSEfVH+qpVAkkmhrzRbCi8+t0/zGBNODhM5O+iSa1gWWLOCw5TCjQpD4WOIewK1J
 kDZvNo/2q8eIAslFkd6cUp+r3tw0=
X-Received: by 2002:a25:8203:: with SMTP id q3mr16693570ybk.86.1611462784086; 
 Sat, 23 Jan 2021 20:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjQyj/xlAsHCc/opJ2fSSjNdcOLJyVFnbLpv+m5zt9TwuVBN8lh0p6NTqxXFXTt7PM6jfLOsNhVjJa4zNnITI=
X-Received: by 2002:a25:8203:: with SMTP id q3mr16693546ybk.86.1611462783738; 
 Sat, 23 Jan 2021 20:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
 <CAEemH2cseOGtSem9vhChygLNeYz6E0bVEu+u-UH8agLBoHJo4Q@mail.gmail.com>
 <CAEemH2e=ySuT+JEoDkF0e0TYeooeZbT0mu4D+47NLjwvsPecnA@mail.gmail.com>
 <87y2glxv3x.fsf@oc8242746057.ibm.com>
In-Reply-To: <87y2glxv3x.fsf@oc8242746057.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 24 Jan 2021 12:32:51 +0800
Message-ID: <CAEemH2cwsTCUh5QF2EkqR+0q8S2TtCycyOiFLnk-W5RoBXKLBA@mail.gmail.com>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
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
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Content-Type: multipart/mixed; boundary="===============1309107378=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1309107378==
Content-Type: multipart/alternative; boundary="000000000000cb42a205b99deaa5"

--000000000000cb42a205b99deaa5
Content-Type: text/plain; charset="UTF-8"

Hi Alex, Petr,

Patch applied, thanks!

Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

...
> > But I still think the swapping01 not very precise to some degree.
> > We probably need to rewrite it someday but currently, I have no better
> > idea.
>
> 100% agree. It is very fragile. I was thinking maybe we could find out
> how much swap space is assigned to a *particular* process, maybe something
> in /proc/ can be used ?


Sounds practicable, we can have a try.

-- 
Regards,
Li Wang

--000000000000cb42a205b99deaa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alex, Petr,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Patch applied, thanks!</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Alexander Egorenkov &lt;<a href=3D"mailto:e=
gorenar@linux.ibm.com">egorenar@linux.ibm.com</a>&gt; wrote:<br></div><div =
dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">.=
..</span><br>
&gt; But I still think the swapping01 not very precise to some degree.<br>
&gt; We probably need to rewrite it someday but currently, I have no better=
<br>
&gt; idea.<br>
<br>
100% agree. It is very fragile. I was thinking maybe we could find out<br>
how much swap space is assigned to a *particular* process, maybe something<=
br>
in /proc/ can be used ?</blockquote><div>=C2=A0</div></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Sounds practicable, we can have a tr=
y.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--000000000000cb42a205b99deaa5--


--===============1309107378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1309107378==--

