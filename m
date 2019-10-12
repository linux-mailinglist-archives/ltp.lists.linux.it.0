Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7CD4ECF
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 11:56:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2737C3C220B
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 11:56:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 60CB53C1833
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 11:56:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BC6491A00F36
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 11:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570874176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0smxh9PELKUOVxLMt4h6dGrDQ0AXSP+M1pFME2sjVY=;
 b=dFJEJW6GPnmo/k3PHBmOSVA9EXNTrZrSAtH+JGec61Oc63WEHqHprVWEbuW6DiZTseSAyH
 LaTKxAId6bNXutFuazULrtkhaWdaljrFPSdbRFqgcpP+7FaIfknT+qDyVSKZUFy5n662Tw
 YWAF8zb4AvXrpDDWdY/yRRV7Hr7A7UI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-AK6KO4SuNca7M5EMWeDwwg-1; Sat, 12 Oct 2019 05:56:12 -0400
Received: by mail-oi1-f198.google.com with SMTP id g25so6304850oiy.12
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 02:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=chIXCEKZgrD40hvHxr0hLE6IKsdhameiXXfUrDwwgPA=;
 b=gBkw8ymfncMrqMMoWAMJaQmfYJ3XoUOhWK47YxcAEww+uatwhkiON2TmeohOL4Ad9Y
 LWMR19qVG0JFtTaDbjXK96owPIRRTP4r3DupFsIIDb4VHH3ZuCdgt5MO7Dp72SPZP7Oy
 DGuyvUyVlpSJVVDYndioBRr/Jb8+7qUJiYEAjGxVRfVOo2cCjIagG6moXHUYAKK8W4wq
 iRmxGy+RNGqt/h3iovjG6Yy14/dtVxlnjGpdsdBhB2Q9dKJ9ZlJ7sOZamsM6ydlpyys9
 2n6ealhDdr2//wyLOm7JNahv95+ez+ufUtyRwXGKqOzB98iThf+EMbXS2DNjRkNVxIbu
 6D4g==
X-Gm-Message-State: APjAAAVp9R1k9fQ3v8POCJZrU4UTwxGr2B9iUNHl8IWkgGl3EMwdU+s2
 0FahSi8FYGPwXeOR3V9wxTKLBtxR2yalXlbQwaWYGlR43nRdU1ueboUrbvu/IPmA0qH/CFZS6A2
 2oLwmP0JWzmDXu71TnJ041tGjn04=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr9518077otk.26.1570874171948; 
 Sat, 12 Oct 2019 02:56:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBgveD00oidCC0mr04lHEMqYbfTMYQC1n/n2Cy2LtBk76O+tHaBBJqFn19W+LFWtsp8BG8XNyVsTVP/4Bn12I=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr9518070otk.26.1570874171740; 
 Sat, 12 Oct 2019 02:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191011095442.10541-1-pvorel@suse.cz>
 <20191011095442.10541-4-pvorel@suse.cz>
 <1570797394.4238.7.camel@suse.de> <20191011125413.GA30000@dell5510>
 <20191011125648.GF2591@rei> <20191011133129.GA23391@dell5510>
In-Reply-To: <20191011133129.GA23391@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Sat, 12 Oct 2019 17:55:59 +0800
Message-ID: <CAEemH2d7SG0vGp91TPVPuEBV0zD_m8gEk9WtpQrN0Yo2VCytFg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: AK6KO4SuNca7M5EMWeDwwg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/5] shell: Add timeout shell API tests
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
Cc: cfamullaconrad@suse.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1411526191=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1411526191==
Content-Type: multipart/alternative; boundary="000000000000fe77530594b3a44f"

--000000000000fe77530594b3a44f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 9:31 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > > timeout02 1 TCONF: LTP_TIMEOUT_MUL must be number >=3D 1! (0)
> > > BTW I wonder if TBROK shouldn't be used instead of TCONF.
> > > Anybody strong opinion?
>
> > If we fail to run a test because user passed wrong input data it has to
> > be TBROK because TCONF can end up unnoticed.
> +1.
>
> I'd like to merge v5 with following diff:
> Please let me know if anything else is problematic.
>

Thanks for your work Petr!
For patchset:
    Tested-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000fe77530594b3a44f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 9:31 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; &gt; timeout02 1 TCONF: LTP_TIMEOUT_MUL must be number &gt;=3D 1! (0)<=
br>
&gt; &gt; BTW I wonder if TBROK shouldn&#39;t be used instead of TCONF.<br>
&gt; &gt; Anybody strong opinion?<br>
<br>
&gt; If we fail to run a test because user passed wrong input data it has t=
o<br>
&gt; be TBROK because TCONF can end up unnoticed.<br>
+1.<br>
<br>
I&#39;d like to merge v5 with following diff:<br>
Please let me know if anything else is problematic.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Thanks =
for your work Petr!</div></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">For patchset:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 =C2=A0 Tested-by: Li Wang &lt;<a href=3D"mailto:liwang@red=
hat.com">liwang@redhat.com</a>&gt;</div></div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--000000000000fe77530594b3a44f--


--===============1411526191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1411526191==--

