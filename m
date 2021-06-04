Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79539BF39
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:01:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 810A43C7FE1
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:01:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF0F93C1CB7
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:01:49 +0200 (CEST)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ABD851400041
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:01:48 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id h12so5178086pfe.2
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Gf1FTOsYgPE7VPE+ReqwXl+Qwu4qfS8bu658e78pzKs=;
 b=mTJR35REFbsroa2slQOy87Lhc27joiqXJCsVVeu+aR7OeUNG63agZjXQm5UMHGVoot
 UOyI0pog6UsAWTryPbF6D5zkEk9O90vN/iKdB7bv+1jINJH8NKV/iI3SaXRKv5qfNchJ
 GzpzFgODhfnuDhzMEQupNhSSxrx8lajQDCLdHgxCLS1836GPgstaHBGklBGulYmCrped
 17unMsNN+QGsyQ8MNyw/pb4dBTlOi6sp/jS3R5P9eLubXdjtIX5zQpi6d2Jrza9JItLA
 g4yZeiVn5TBThKVIJVlYKKvp1r3z8GVUDPC1M6Yh983Vf60FIgnBx+JxNl8XNQPqga5k
 4tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Gf1FTOsYgPE7VPE+ReqwXl+Qwu4qfS8bu658e78pzKs=;
 b=n8GwMeCSlQ3bz1Vmmw+BcYbQRUq8LUmBmK0Ko5WtcOu71ywCa2BSc3JNbESDEkAPIG
 wureJtCsvwmnprtEETp7oy5SflSD/gi+wc94dKUSJ5Um6ZYY1qQA2Uqt4R5X6QffKIcj
 V47wuWllC5KWCv/XIoIhaE6wVGT/E1/yW/ql4n/2ruX1wDyZbECJtN+nIl60TNySnJj1
 DwnIbJZV9jZHOhiMSVZDgwbazKyBYFSDq4UxOU69cmj5M7m6LWFClE9HAsX0NjhIg3Oj
 rATb1LastoFiQkv0owoY9RNbyqVhhEQOehlWW5m7qoEjrTnBOYIBb7mjOXbj50ER0jwx
 35YQ==
X-Gm-Message-State: AOAM532tylW6pnVbxwDpLccV+Fi6+xZYQy6CxxS90K8+PJgfTK7oleDa
 aGx9WxFARd09hSiC+XZ4d1sIirTymGS4/LBK
X-Google-Smtp-Source: ABdhPJxv3/zfPloVON7TIq0qSagt5H5isAFKctnKU9Uq7U9WqNbw/k77bMYNlIENlaOXLS4ODVOYiw==
X-Received: by 2002:a62:2bc6:0:b029:2e7:a7c2:201 with SMTP id
 r189-20020a622bc60000b02902e7a7c20201mr5653297pfr.64.1622829707064; 
 Fri, 04 Jun 2021 11:01:47 -0700 (PDT)
Received: from [192.168.20.29] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id 65sm2314119pfu.159.2021.06.04.11.01.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jun 2021 11:01:46 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Message-Id: <392BDC1B-F73E-411E-AE03-71DA0CBAB2D8@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Date: Fri, 4 Jun 2021 11:01:45 -0700
In-Reply-To: <20210603183827.24339-2-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
References: <20210603183827.24339-1-pvorel@suse.cz>
 <20210603183827.24339-2-pvorel@suse.cz>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/3] make: Add make check{,-c,-shell} targets
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1586848722=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1586848722==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_10B8D8DB-7B6E-45C7-883D-8F7C31E9E348";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_10B8D8DB-7B6E-45C7-883D-8F7C31E9E348
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2021, at 11:38 AM, Petr Vorel <pvorel@suse.cz> wrote:
>=20
> For testing C and shell API.

Why not just add a single =E2=80=9Cmake check=E2=80=9D target that calls =
the C and shell targets to match what most open source projects do in =
terms of testing? Also, continuing on in light of errors seems like a =
good default behavior to have as it would prevent a single error/failure =
from gathering all other results.

My 2 cents,
-Enji

--Apple-Mail=_10B8D8DB-7B6E-45C7-883D-8F7C31E9E348
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtvtxN6kOllEF3nmX5JFNMZeDGN4FAmC6aokACgkQ5JFNMZeD
GN41bQ/+L0lZfs1gMHn7ifWynMoledq1Z8pXhcRCY/49K0L0qCqLedVsEeM/ttQf
mTLnPTZGunSudP0CfyNw2IIGc4kD6T+lMGw2xAbErIYfU3Pvp22MFTlG902hMBq4
jB5qY8J/R3WiJigFwWK1mmoiRS4Tz+4vYQyyf9HSD2q/g8YodMlrGmXoX9PDiX+X
tvElDX4woq1h57wSFDUCqf6GKTDMGMZ7FKMaOJXYsM1MmTB2CRmSJ8JJA/PXg8p5
LDV4kyo8CbJ8T2Xg97ifwjc/ItAg+JUkAATOA5aBiWnrTw6KzKTISC9ZvnJB75Zj
AnouiEkBi9pbj+J6d6r1gVrCTZqfwUpyuWxSRvhpL6Avt3jwegWqb3VtIw2HHhiB
k9/BnW3zW9W/sZe/GMAVMgJRnls8nc8z0h4C4fTytaOy1s6UFDWIWiyXNcicnhDU
7JUAONIj4d8+6EiyQdean24jCOazQqCYmCP8OrxzQnS5KvgbWbkLJ3/94WUxueaY
drAOfI71wZrbMEi9fi2q5K5N3DElk+PpZACx9OBYUn30oSIE4g7g96o+Lnbtqdzi
r7Nrc2R2Ac9JVDbndW4qXaVevN8xvbWBx8y70gfV0sZQg7NgGiCtWsBztb9F0j5T
0wfVpG/HT7W0z3VW/2HXA7gUXvcb/RuI6dsDWEy3uIlki+gXN2w=
=0ZSd
-----END PGP SIGNATURE-----

--Apple-Mail=_10B8D8DB-7B6E-45C7-883D-8F7C31E9E348--

--===============1586848722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1586848722==--
