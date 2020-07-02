Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33143212051
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 11:48:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4E253C011E
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 11:48:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C709A3C011E
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:48:42 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EA8B81000AEB
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593683320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aPd0RxOnHaXIYEXK+cRasRL0W8kg/NXTD+fvMTHj1Xc=;
 b=hybUMdl5zcOIdN4C0QxlHGxaP9cqSHtGTwXtFuNGtMXunXiRFNYPsu+roPssKlcMg95GPn
 vLeI0IaFnKwlwwlU+FcrnkQH7W+7Z4ah0opVYwzayqGJYCZUmsY4Xn/5CF3AOjeuAwSzSl
 z2NYtFLADPNm2OKYFEaLWqfx0M++hqs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-l3pfb39ZMG68Fnn8wvSkDg-1; Thu, 02 Jul 2020 05:48:38 -0400
X-MC-Unique: l3pfb39ZMG68Fnn8wvSkDg-1
Received: by mail-lf1-f72.google.com with SMTP id c9so8263484lfr.6
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 02:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aPd0RxOnHaXIYEXK+cRasRL0W8kg/NXTD+fvMTHj1Xc=;
 b=bZbacs+aIPI4nrqcXMCfexjzmxM8T49GWGcIu7RYSWV829G6i2OFnbQo65BowQZw+V
 7nxDOs5tSFeC6n6rYVypAgn0GdhSPhNgbKIDnSdB0WgFP6ZyKob2vb4TPnRxK5wa4d08
 kHsxCiU7MLBiYCKs4y/eBfOTtNrVukWJ4epCJj+Yr0laPUVl0IXjGSdLy+D3nas1tvul
 P0gz6ZW+llPD2Lq6CrMUfGaBWWf0QJ7JUd+zFEzZJhgisYYCJDO0FL5o2I/9c35Vzv6Q
 1uiBTyj+q3E1cN9hj8o/fD2067cLETO//h0ZE9s4GNBHB2TWleXuK1CBJ/TRHDrQODb4
 BNQQ==
X-Gm-Message-State: AOAM532/zW0+tPHqTBgHdJ0BTLLawIBZCRe0pz4sFtuia0TXbkSz/8Ut
 mhU8yCkB1cJI8NUmMrc4dWGBIr2vfL15BxC71y5fK6kD47prrmA7LbJWXKGmCnw4nx9MO333Rzz
 tj+UjGuyt+aKdNySD9Cle/v9X4x0=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr17803599lfa.60.1593683316027; 
 Thu, 02 Jul 2020 02:48:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOl+LqXl4wQF1mHtIladuzBQfQVFjEQ/g9u4pf/yhf6ALkIAslWfZ1jhxokDR2dDMzOSi0ROiy4YegIYaw0XU=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr17803588lfa.60.1593683315773; 
 Thu, 02 Jul 2020 02:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200701151456.851-1-mdoucha@suse.cz>
 <20200701151456.851-2-mdoucha@suse.cz>
In-Reply-To: <20200701151456.851-2-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jul 2020 17:48:23 +0800
Message-ID: <CAEemH2f2D9xBYxeQ33w0thxZFpkSHK3gn1bBQWMZSA=X5y-AWQ@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add test for CVE 2017-1000405
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
Content-Type: multipart/mixed; boundary="===============0947081728=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0947081728==
Content-Type: multipart/alternative; boundary="000000000000ebedd905a9724fbe"

--000000000000ebedd905a9724fbe
Content-Type: text/plain; charset="UTF-8"

Martin Doucha <mdoucha@suse.cz> wrote:

...
> +static void *alloc_zero_page(void *baseaddr)
> +{
> +       int i;
> +       void *ret;
> +
> +       /* Find aligned chunk of address space. MAP_HUGETLB doesn't work.
> */
> +       for (i = 0; i < 16; i++, baseaddr += thp_size) {
> +               ret = mmap(baseaddr, thp_size, PROT_READ,
> +                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>

I'm wondering why here request the READ ONLY memory, shouldn't we write
something into the write_thp loopingly then?

-- 
Regards,
Li Wang

--000000000000ebedd905a9724fbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz">md=
oucha@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D=
"gmail_default" style=3D"font-size:small">...</span><br>
+static void *alloc_zero_page(void *baseaddr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find aligned chunk of address space. MAP_HUG=
ETLB doesn&#39;t work. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 16; i++, baseaddr +=3D thp=
_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mmap(basead=
dr, thp_size, PROT_READ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m wond=
ering why here request the READ ONLY memory, shouldn&#39;t we write somethi=
ng into the write_thp loopingly then?</div></div><div>=C2=A0</div></div>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ebedd905a9724fbe--


--===============0947081728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0947081728==--

