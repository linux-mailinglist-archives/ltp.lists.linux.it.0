Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88A39C1AD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 22:53:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56BE03C7FE8
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 22:53:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 364643C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 22:53:44 +0200 (CEST)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5699D200924
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 22:53:44 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id 11so5262338plk.12
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=48rgPq6bnkG5AkiLDPZtgrxLoexxSWEz7hr1b8kFUv0=;
 b=ubLGOWBWdCBRHdJHaDzNGZVtYO0knk0TyhrzhomSjYhP6iCm7bB8nEn/zXGhF/Tp1H
 ZeN7R5jXYuiZID4Q3oSLP8awlaxcLJLoxXxTaFHfy3oyUp/mDNmjYI3626WHkyzJBwez
 daSMchKj4Nmn0w8oouOIgLgOB/V+KME2uCvK7BktiDlAYvo00uIfQGiPitKuXTMWuEGS
 BqNE++S7PpJe9hzOcDncpFkNItYW3mIP4PIDbjz4gANUBT0NFESaOGCxFOjO05JAZsfZ
 JiGd7+tYc/ALCbznMKFv0UkiGx6fpxL/E0lLB7n1Z4p7vNxkhvMheqyjtGCMWUaOWXXZ
 LWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=48rgPq6bnkG5AkiLDPZtgrxLoexxSWEz7hr1b8kFUv0=;
 b=Hzc5Q/RCnutG5U5g0Ei/u+obvzCVCfERLtD5Wdu9F7UQONWW97amqV/W50HrsgdCjE
 T9NyhWVctnYcGS2ze41jk9ZJCsy/gFX7ETDBNNy8yVAfmlzdgfHYG2TnkFOZNXbY5YjV
 S0QUqbwnPBjPy334LBeb4deuKWe/7jRmDRd7Bnx6/uNEiH323GcfquU0caJt/Gwy8Mif
 GOPfFBYhSaP/TkQCdsiBE0CENxeEdw+h8jMjGHYlXXBtGOt8wA2UQnXVCjPhRs0OGEH7
 0GTVGUfzMAMffirDTiDDYLngRfAD47pRp9baU9N2cey980Yhd4LL9s/MuCPNSNWvSqDb
 FHqw==
X-Gm-Message-State: AOAM532Y9drLSL+DhiDKDBF0o+Ck2ginElYP2iElrVAbh4Xifp2mPidE
 wHE4sTb3ma7tBL/fvdj4guM=
X-Google-Smtp-Source: ABdhPJzueK4utxaOTs1UH4QhXrXFg0UYasU2XJ4r9RUsFdLpHTXQDLsHknSFhxMcQIsxwwADJAhKWQ==
X-Received: by 2002:a17:902:aa4c:b029:ee:ec17:89f with SMTP id
 c12-20020a170902aa4cb02900eeec17089fmr6123581plr.11.1622840022721; 
 Fri, 04 Jun 2021 13:53:42 -0700 (PDT)
Received: from [192.168.20.29] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id k12sm2683424pga.13.2021.06.04.13.53.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jun 2021 13:53:42 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Message-Id: <2049AE25-BA87-4E1E-8429-E6506107B8F7@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Date: Fri, 4 Jun 2021 13:53:40 -0700
In-Reply-To: <YLqEGb/fWiGJDI6z@pevik>
To: Petr Vorel <pvorel@suse.cz>
References: <YLh9jvI/p/VxsSmx@pevik>
 <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
 <656D3EBA-5A3C-45F5-84B0-1427CE69C1F2@gmail.com> <YLqEGb/fWiGJDI6z@pevik>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1803927397=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1803927397==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F636EAA7-CEC6-48C2-B6D2-5EE216200CC5";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_F636EAA7-CEC6-48C2-B6D2-5EE216200CC5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 4, 2021, at 12:50 PM, Petr Vorel <pvorel@suse.cz> wrote:
>=20
> Hi Enji,
>=20
>>> does anybody use testcases/kernel/io/disktest ?
>=20
>>> It supports various OS, but not sure if it's relevant now in SSD =
era.
>>> Last update was in 2008 (version 1.4.2).
>=20
>>> I don't think I ever used it, it does look outdated, so I won't miss =
it.
>>> If it has upstream repo somewhere, we could put a reference in =
commit message.
>=20
>> I say nuke it from orbit.
>=20
>> It exists in VCS still, so if someone wants to restore it and work on =
it, they can go back through the git history and do so.
>=20
> I have not found the original project in sourceforge. Would you please =
post a
> link, I'll add it to the commit message of the removal commit.

I honestly don=E2=80=99t know where it came from :/=E2=80=A6

My comment was more the fact that it exists in the LTP github repo, =
which means (even after it=E2=80=99s deleted), it can be restored.

Cheers,
-Enji

--Apple-Mail=_F636EAA7-CEC6-48C2-B6D2-5EE216200CC5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtvtxN6kOllEF3nmX5JFNMZeDGN4FAmC6ktQACgkQ5JFNMZeD
GN5xCA/+J1Np/5UOo6Mb5fNUWspp3lQ/n6x19SU9cXaqpTRo5nYzu6nIlVsaTmOj
HvJ0a169Nvq1ancMBbUP5RhTQz/ufM7q+jMYmFQA1i5p3ybSZBwp1H4SLVUEVd51
tFxWo3ASa5Zj6pENnb7j31dyXSZlMNQ8C1VSTXFZJ9VrK3CfjrctBOyWLIZozFS8
UBlcddr0mZcUu2NgKPCB/2x3T8CSLX4MBdRX0/2a3g5T9PfNrGoXW8pH3yXCZgme
FlQ9dsVoZ0OZQRZwCu8SNi1BdXxZodEpy8PbzvdrZbOvsbs4+Z47nqRCClY7B1xW
MYP0+Pu8Qsh+Pa41i3YrkoXQKD3J1FUiAOjusGAgYF65p53NL+y9e1x1dMgwGtXk
p23KmMGyGFKogWv68hctRbrke5To3ZQm3kakTEb61a3i+RE+drtTN9qitVIMvjj2
pnEirnBh3p3VOrszXsEc2TXFXrhBt8EDBvGQ9LQImCjfqmji/o0ZD++Ax+r8uZce
jd4rEfJE2aAe3Sb0//5pptMyG8ReJxSaRrUHUnFJQCcyplWWVaA+eKwhnjyQTWer
DbDbShcaxJPr/mLCcNSmQNtbQszHH46IPj63MREgDWlVkYa7XfjTJy9Ox1cMDY1s
MooOPSX6zbinsWbV+2LTkdMoCYYvYKQGB3dpOE7NbwOzhDiTuDU=
=V0uc
-----END PGP SIGNATURE-----

--Apple-Mail=_F636EAA7-CEC6-48C2-B6D2-5EE216200CC5--

--===============1803927397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1803927397==--
