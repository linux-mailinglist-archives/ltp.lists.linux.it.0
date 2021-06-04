Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0839BF03
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:42:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D0363C1976
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:42:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03F323C1976
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:42:32 +0200 (CEST)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 856D16010A2
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:42:32 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id z26so7972891pfj.5
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=fRollee5HtdOEeJ1Xv4EhS16on7bbmOfKj7vTX69tpM=;
 b=k/D5S9USoBijDMIn22LasBRIdakIvrWPw5aS57NUJfTjSENgd4PLNBTFtYvSYpT2VU
 C15xfn3kGyvV/sC5cMriVriGE32bFKUd4hAHRwXhP26kRJU46TWAFegDbgIy0AjoYC0Y
 oLwaqYDdBbAcktyaFeesvEIXeuRTG5V3rTZogvRIRnOQcrfV4uw6nSrPFclJzm8HdzYu
 uWYL7iI/8E/HfYp9p4rxCZD/bsuk+iD2gM/9Pp+qQdA8LLyNGkkzUSyR4pjQgANLmPJg
 ptSJUiORO5PWCIB5eeRihs09ai2b+XBvzhp0DbpcAVx2YM1Q7aHmnanVdpf+1UgLUR1W
 s8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=fRollee5HtdOEeJ1Xv4EhS16on7bbmOfKj7vTX69tpM=;
 b=CGRu2TuyB6z2zp1NA8wh6JkyuM4PrBUKokqiNXat3Au8VOKnnm5/XbB+vY63JU/3MI
 9O7Ubl7iDMa7wHLZjhBfZ1lPClZx9qKiHhFJX7mSf9I9FRPU2MePKGlvrFlhNtCoWMzd
 5nF608gE8a6jBcZ+LqtTO0qeG2bPPDG84MZ/hkbiYi1bqrnCG0dh59fpowgL0NgShCC8
 ozbJLvaLDBS+8QwPw5YWAHVkCJVK7M7uLG26F8RDg8WuusVYZoc7qJEIsn4LFskFP5GD
 uzBOXyoXEYrveTqKTEde0fyVhht+6/NPVfTcIA7KI3vO7+zn4gq/SVF01gP9JOTVF6JH
 K5LQ==
X-Gm-Message-State: AOAM530TSYB6YBjTwF0sasFAJTx23GGRoGL0T+pkHWYeYlEx3Fg8vpmm
 i3B2aKmYxqsGOS/TGklDUHA=
X-Google-Smtp-Source: ABdhPJxK1/8HzIpl4m7PNasTNd4WU5lMylS7yZNTsXxCabhb48C9FuEsERubU8a5EV6PWUrsocftZw==
X-Received: by 2002:aa7:8507:0:b029:2ea:559:da5 with SMTP id
 v7-20020aa785070000b02902ea05590da5mr5552759pfn.45.1622828550746; 
 Fri, 04 Jun 2021 10:42:30 -0700 (PDT)
Received: from [192.168.20.29] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id e6sm5567465pjl.3.2021.06.04.10.42.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jun 2021 10:42:30 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Message-Id: <656D3EBA-5A3C-45F5-84B0-1427CE69C1F2@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Date: Fri, 4 Jun 2021 10:42:27 -0700
In-Reply-To: <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
References: <YLh9jvI/p/VxsSmx@pevik>
 <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>,
 automated-testing <automated-testing@yoctoproject.org>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0142175508=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0142175508==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_699AC0CC-0EE4-4047-9FDD-A2F2DF328D38";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_699AC0CC-0EE4-4047-9FDD-A2F2DF328D38
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A3781822-65C2-4C7A-82A8-475880246D42"


--Apple-Mail=_A3781822-65C2-4C7A-82A8-475880246D42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 4, 2021, at 10:12 AM, Jan Stancek <jstancek@redhat.com> wrote:
>=20
>=20
>=20
> On Thu, Jun 3, 2021 at 8:58 AM Petr Vorel <pvorel@suse.cz =
<mailto:pvorel@suse.cz>> wrote:
> Hi,
>=20
> does anybody use testcases/kernel/io/disktest ?
>=20
> It supports various OS, but not sure if it's relevant now in SSD era.
> Last update was in 2008 (version 1.4.2).
>=20
> I don't think I ever used it, it does look outdated, so I won't miss =
it.
> If it has upstream repo somewhere, we could put a reference in commit =
message.

I say nuke it from orbit.

It exists in VCS still, so if someone wants to restore it and work on =
it, they can go back through the git history and do so.

Cheers,
-Enji

--Apple-Mail=_A3781822-65C2-4C7A-82A8-475880246D42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 4, 2021, at 10:12 AM, Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" class=3D"">jstancek@redhat.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_default" style=3D"font-family:monospace"><br =
class=3D""></div></div><br class=3D""><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 8:58 AM Petr =
Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" =
class=3D"">pvorel@suse.cz</a>&gt; wrote:<br class=3D""></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi,<br class=3D"">
<br class=3D"">
does anybody use testcases/kernel/io/disktest ?<br class=3D"">
<br class=3D"">
It supports various OS, but not sure if it's relevant now in SSD era.<br =
class=3D"">
Last update was in 2008 (version 1.4.2).<br class=3D""></blockquote><div =
class=3D""><br class=3D""></div><div class=3D""><div =
style=3D"font-family:monospace" class=3D"gmail_default">I don't think I =
ever used it, it does look outdated, so I won't miss it.<br =
class=3D""></div><div style=3D"font-family:monospace" =
class=3D"gmail_default">If it has upstream repo somewhere, we could put =
a reference in commit message.<br =
class=3D""></div></div></div></div></div></blockquote></div><br =
class=3D""></div><div class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">I say nuke it from =
orbit.</span><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">It exists in VCS still, so if =
someone wants to restore it and work on it, they can go back through the =
git history and do so.</div></div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D""><br class=3D""></div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Cheers,</div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">-Enji</div></body></html>=

--Apple-Mail=_A3781822-65C2-4C7A-82A8-475880246D42--

--Apple-Mail=_699AC0CC-0EE4-4047-9FDD-A2F2DF328D38
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtvtxN6kOllEF3nmX5JFNMZeDGN4FAmC6ZgQACgkQ5JFNMZeD
GN7mFA//Tevu+PAw5iKdtKSAboeVAlccwaqyr4cBTGrwTcCiTzve5lKGuyQdm1BZ
lYVy9xPmfYkkML8wKlnuwZFjVVL86bgFWQCrh6FBlOrn9p/70UgWOnzZ7q38aSKp
KeX59D7V6kFd1PkqQdhxc39uImCTWtCvQ27iP+7YH85EfDWP0rn/GtIjQcNy0nd6
GCjwWFjNeRxJejAGaYhgpWtmBcHGDgpzNZYs9arp9lgXnfkAiSIs9rNfBEuI1hKS
+KMptmAsSwwviIqCXRZ1EtB+/h5x+tfkJW2htI3bAiyj9GyPxxu0OW0p7Ls5+MEc
TaR+nTCTxsOKP2z/2/s4qpP6qqhVdxAlUaydRVckAcs8+lLpOGsUENQ5i29UUdtJ
61nn5LsKwA7ItDObgEiJuw+DG2HUyjdiKznS3WMUuOM4Iz9LQbuLJNxVpoyJbxKK
9NSfg/0LwqKLDHOzf60OxZ+BqNRNR87zxAknlf37Ju53YD7QGsyEYpqup46GRPEm
r9tVMfNm/ANQVUWqNjp4ZfTjXqZ9oPmmk4C0gzpcCNy5nIzXl90o6mkNVSbRLbia
oQXtA7JDAx7n7ziS/QJR5QBYs8qYeR1XG4w7BtK6RrTn1x9zht95tJgiyJDe71r1
p+DcKcIC+z8T1aK5dSm3mskd6brylgfdYvWU9kloo3nFw+rEqOc=
=0OTD
-----END PGP SIGNATURE-----

--Apple-Mail=_699AC0CC-0EE4-4047-9FDD-A2F2DF328D38--

--===============0142175508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0142175508==--
