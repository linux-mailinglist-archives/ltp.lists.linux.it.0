Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610E1A62FB
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 08:21:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB3163C2BA9
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 08:21:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 55D503C0B93
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 08:21:23 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3B75B6010FA
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 08:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586758880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FPvC1v7lnLv6pnRYGkPNKlAkrD5vrZNXjyEV79KPKEA=;
 b=SkVaHF0AuLQVW78HJs0fWS/h4UanPOg22za+ziQFm8/ya/BB2kXKqUCi1gakLWhN+VDrNG
 1Ji6mXbQTb5WpkxnQPNxz/T3Zm3+ehY+DNZ4X1XoWSV94dpaO5pZf7+PaXRzurH3lT6mRm
 jvUaQSl5r2cBwLksXfq/Po5Lqx5vx94=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-XJfjvThiNzSr-T004Lye1g-1; Mon, 13 Apr 2020 02:21:18 -0400
X-MC-Unique: XJfjvThiNzSr-T004Lye1g-1
Received: by mail-lj1-f198.google.com with SMTP id u8so1186694ljg.9
 for <ltp@lists.linux.it>; Sun, 12 Apr 2020 23:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MzypeutTgnr+qzGGnZNUGaDF6W0KLjpT3GdT7b5vcCE=;
 b=IT0UHlatKSacLUBOpxsPYnd25pYjBVxQrBS7Q1lmT1kOpqVsrMDdvF/MrKn4Kw780q
 Vv2UoVNraLI4tslzMSXBF+Az6KKbH2lB9V8svgT48UpT4Tcv+0FtBrpzsVks9aW8AmID
 YZ5EEme1QBofDwG48TdSvtBMEkLHqpz8R3PD55OFSLFAsjMJTEAocSEhnwxDvQIan9LE
 gAKjCVhLsa+ce2QTkRC5J/GLIiBHzeA8vi2h5BdxJbaVWaD65iNuvPq+AnYO0IpD1QLX
 FwR0O7Hs0g8xNnZ82/vOROYvP3CYBiGV2cl6b272o4KJ1NBuwKe08YtMpNJO/4sEIUGY
 0jTg==
X-Gm-Message-State: AGi0PualaKPm6SXEez7eJa0EbPM9mJmqbHowxlsQW2Iy5Qy8ckCM5wdB
 EBkb2SNb5mcRv7ezBQrrlKmzPg2UVWEX5OcCgc9QEXlQopEYCAUj90KYXict01aUGVKVWDNTmDJ
 EndzShW5+B5ERspsWEek8rxNq4lo=
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr9692954lfd.110.1586758876090; 
 Sun, 12 Apr 2020 23:21:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypLcaRYEpJZLGZUjdSQf/SqICrNXID/TDOsr52ApTVGayyzKcOzHjqt1agp7d7AhOBXWR9I+/97iMa1PvZQNqWw=
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr9692945lfd.110.1586758875879; 
 Sun, 12 Apr 2020 23:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <bd1dc27b-5680-5a7e-941e-bbd085880ffa@linux.ibm.com>
 <85165f62-1148-aead-30dc-8a23aeb19c96@cn.fujitsu.com>
In-Reply-To: <85165f62-1148-aead-30dc-8a23aeb19c96@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 13 Apr 2020 14:21:04 +0800
Message-ID: <CAEemH2fQxooTB7tXkKSSO5ZSRUY2AmuKMCmMaUE+wTn-zq1odQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: fix a null pointer
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
Cc: Desnes Augusto Nunes do Rosario <desnesn@linux.ibm.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1034833833=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1034833833==
Content-Type: multipart/alternative; boundary="00000000000024347105a3261748"

--00000000000024347105a3261748
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

...
> > I was about to post the same fix on the mailing list - just tested in
> > powerpc arch and it looks good to me.
> >
> > It is safe to use 0 since function pci_get_bus_and_slot(unsigned int
> > bus, unsigned int devfn) removed on kernel commit <5cf0c37a71da0f3>
> > ("PCI: Remove pci_get_bus_and_slot() function") used to be a wrapper fo=
r
> > pci_get_domain_bus_and_slot(0, bus, devfn).
>


> Sorry for the late reply. Thanks for your review. I think this should be
> added into commit message, so make this fix more clear.
>

I helped to add the hint messages and pushed. Thanks for your fix/review.

--=20
Regards,
Li Wang

--00000000000024347105a3261748
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">x=
uyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defa=
ult" style=3D"font-size:small">...</span><br>
&gt; I was about to post the same fix on the mailing list - just tested in =
<br>
&gt; powerpc arch and it looks good to me.<br>
&gt; <br>
&gt; It is safe to use 0 since function pci_get_bus_and_slot(unsigned int <=
br>
&gt; bus, unsigned int devfn) removed on kernel commit &lt;5cf0c37a71da0f3&=
gt; <br>
&gt; (&quot;PCI: Remove pci_get_bus_and_slot() function&quot;) used to be a=
 wrapper for <br>
&gt; pci_get_domain_bus_and_slot(0, bus, devfn).<br></blockquote><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Sorry for the late reply. Thanks for your review. I think this should be <b=
r>
added into commit message, so make this fix more clear.<br></blockquote><di=
v><br></div><div class=3D"gmail_default" style=3D"font-size:small">I helped=
 to add the hint messages and pushed. Thanks for your fix/review.</div></di=
v><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000024347105a3261748--


--===============1034833833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1034833833==--

