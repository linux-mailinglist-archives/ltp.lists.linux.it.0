Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A35491B36EC
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:44:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22F973C624C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:44:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4B9F83C2977
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:44:31 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C382A1A006F0
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587534269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ylR4grm+TbSmmnCluZx/pRZ5Eo26kqpDIiz8LoJE5X4=;
 b=i4kxwMj0kswFRuS48QFF9XwQASRszPMUD91ghQG+EAUE876YDOh6qbYw9hl9xUx8423653
 7nxZPQDz/scZWBYC7UReX7cuh618Aan+so23169xEOv/R9g09ZH6ojBgJV5TgO6nI9N/Wu
 Kmfsj0h896nBFucWBRBy5LotWqdX1JQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-mHpSGBXbMWaDbUuSw7wLqA-1; Wed, 22 Apr 2020 01:44:23 -0400
X-MC-Unique: mHpSGBXbMWaDbUuSw7wLqA-1
Received: by mail-lf1-f69.google.com with SMTP id v6so498774lfi.6
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/6NdpS8/1J4qcibpAG4FObpmrBbhlxesOZT07JPkf8=;
 b=M8RViXjcYtONngLgeRpqciKCA29I6rgb9cApnabYR3uyWeIC62hnUD45U5cW3Zi1el
 rusSRIOOeLq2A48N5cKeHaPzjkPR15Le6sIlawSVaC7sXz8S4RKyu+BHfDKEEUsemWCu
 0SKrxVCl/nq11N8z+IGdvgyEx0BytSNWG4zcASPGTNripUVVoWgq7LcEDQUcCMnux88Y
 Yh+4QPMYpjIkIBTVIhCC/qG7ihk1N6Fnf3hZjUJcp9wQeDWqRNMu2Kk0SpHHhYYopyVR
 Ty38IKYbUByWYPMTJi8ixaPq19LHTIiY5vrKu57DrKirBb1zlObSppAi9+GKXNEHPVZ4
 vEqw==
X-Gm-Message-State: AGi0Pua6K0tvZ1IX3dG29WY7kkjEL7As7iqRxi/dsx125VxLii0Aa8i9
 AU8es6SsVnhTeJKhM4MHRRVgyrFKhDsGVNibj6zKenmPf+pT/nJrPimJcjEKANMNRriWQzdgGzu
 TBbzTVRYcCZgpCIJt3JazgMgDCCk=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr16237333lfc.60.1587534261942; 
 Tue, 21 Apr 2020 22:44:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYRP2LSk5SGuiC4P/W+3vXpKtLE3D0QqT5hFEhWeTUg53dNDS+kHNs9E3tLSFy7Ow7AYj/aa/mYzCFDh0cD9g=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr16237320lfc.60.1587534261725; 
 Tue, 21 Apr 2020 22:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <7dd91d5aa2d64bcd0223120916c202f19c327237.1587471007.git.jstancek@redhat.com>
In-Reply-To: <7dd91d5aa2d64bcd0223120916c202f19c327237.1587471007.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 13:44:10 +0800
Message-ID: <CAEemH2d_0PxgFM6cqQ8WRgaab-w1CmXbBHxkxDawQ+pUEtcMew@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: tst_taint: Ignore WARN taint flag if
 already set
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
Cc: LTP List <ltp@lists.linux.it>, Chang Yin <cyin@redhat.com>
Content-Type: multipart/mixed; boundary="===============0804663028=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0804663028==
Content-Type: multipart/alternative; boundary="000000000000bd500705a3da9f65"

--000000000000bd500705a3da9f65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 8:15 PM Jan Stancek <jstancek@redhat.com> wrote:

> This commit changes the library so that it ignores the taint warn flag
> if it was set prior to the test run. It turns out that the warn taint
> flag is not well defined and could be easily set on a freshly booted
> kernel for example when buggy BIOS is detected.
>
> Other recent example is disabling ip forward on kvm guests:
>   https://github.com/containers/libpod/issues/5815
>
> https://lore.kernel.org/netdev/a47b6a3b-c064-2f53-7cf6-d0d0720e9d99@redha=
t.com/
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> CC: Chang Yin <cyin@redhat.com>
> CC: Li Wang <liwang@redhat.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>
--=20
Regards,
Li Wang

--000000000000bd500705a3da9f65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 21, 2020 at 8:15 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">This commit changes =
the library so that it ignores the taint warn flag<br>
if it was set prior to the test run. It turns out that the warn taint<br>
flag is not well defined and could be easily set on a freshly booted<br>
kernel for example when buggy BIOS is detected.<br>
<br>
Other recent example is disabling ip forward on kvm guests:<br>
=C2=A0 <a href=3D"https://github.com/containers/libpod/issues/5815" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/containers/libpod/issues/5=
815</a><br>
=C2=A0 <a href=3D"https://lore.kernel.org/netdev/a47b6a3b-c064-2f53-7cf6-d0=
d0720e9d99@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/netdev/a47b6a3b-c064-2f53-7cf6-d0d0720e9d99@redhat.com/</a><br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
CC: Chang Yin &lt;<a href=3D"mailto:cyin@redhat.com" target=3D"_blank">cyin=
@redhat.com</a>&gt;<br>
CC: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwa=
ng@redhat.com</a>&gt;<br></blockquote><div>=C2=A0</div><div><span class=3D"=
gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small"></span></div></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000bd500705a3da9f65--


--===============0804663028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0804663028==--

