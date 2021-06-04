Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4D39BF0D
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:47:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 715043C4F67
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 19:47:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B11323C1976
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:47:33 +0200 (CEST)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3824D1A0071E
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 19:47:33 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id u18so7966630pfk.11
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=kTkwD7RBpwNTTntRInw19wDMHlfj8FVTHBKrIP6vCJY=;
 b=obPtaFMjOS1VQ/wcHhDSOnQ5h2rutqJBFCXGtF8tPqCneCZBAsysd27OMuv4g/Kyfh
 i+98VjMSLUfiRtCquOiqedb4PaupDUonBqOzRvJYl0Xqg8xzv76s2+Hoz6NXNloD9Qzl
 VxJR6eTCSlTi3O7HO73d00/xijnxGBhO980ljjEUDYnE24HVB8F7G1azRrYdhsKOEPKQ
 u2HEvJ3+pz1TUPCjzI3CRYeB7Iqtg2hddM/6qEwosrUgK+Zkq/PP2HTNi0ArZ5Kjhxz/
 u08JTMVZkFUmxeOfnxiljtT14uW35gk2KMgUafnzVifj+QtEjOBc7UZm4wVebxwIOHYa
 xJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=kTkwD7RBpwNTTntRInw19wDMHlfj8FVTHBKrIP6vCJY=;
 b=h2AugrlB6MKCJJnJ0qwUiuXusymrtJgw45ugFInFlMPM+06pJObasAn0b2N6iXWndO
 UnexFUpj71KwkRzWNqye2KM1BgB41YAsdr6UgC5yX86idOG6C5cWqWj5ye7JshoAmQDw
 8SWL0WNFudWSq26DGMSYyNgtklx21Tg9sGKr0kEk70HP3QXFGZGFl3IH5fBIt3Y3d+a3
 iBwHPoDFlTC+HL84sU5kkF6mkkqmpzf3csQEI66FJ4frQVwUI3Q3JYFyfasvVAhYiJ4l
 K3VDpNrWB20VhL4HYnjtAtePvPFHWRX8+Mc81nFrmLzX0XzeGMlaTKo3uSbb1picYNko
 Td4A==
X-Gm-Message-State: AOAM532NjJfpdWneyc3/KhqHqLtpQJcgPWSYk+fgNbOuLh53v02EdfFj
 BPtGHbOhfzX6VhZbidXijWU=
X-Google-Smtp-Source: ABdhPJzABX6QtqXYgBq+USJ5j5GYJApHk4BRwaaTOfti3LA/rFIRVYLoSe3Wvsyej9XGik3bda5Avw==
X-Received: by 2002:aa7:8426:0:b029:2e9:bc0e:5c3f with SMTP id
 q6-20020aa784260000b02902e9bc0e5c3fmr5831015pfn.22.1622828851690; 
 Fri, 04 Jun 2021 10:47:31 -0700 (PDT)
Received: from [192.168.20.29] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id r28sm2472399pgm.53.2021.06.04.10.47.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jun 2021 10:47:31 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Message-Id: <3F3FDAE9-7190-4046-9438-17D2BE14FCA0@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Date: Fri, 4 Jun 2021 10:47:30 -0700
In-Reply-To: <YLn3BQHhZIq5vNId@pevik>
To: Petr Vorel <pvorel@suse.cz>
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
 <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
 <YLn3BQHhZIq5vNId@pevik>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1756983163=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1756983163==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B0F0C3C2-38BE-4CEF-8D4F-5C65AE72146B";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_B0F0C3C2-38BE-4CEF-8D4F-5C65AE72146B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I=E2=80=99d actually exercise some caution here. If there was a =
top-level LICENSE file that was distributed, that would be awesome, but =
if people take bits and pieces of subprojects and hack it in elsewhere =
without there being appropriate attributions to the original authors and =
such, you could get into serious legal trouble.

Doing the =E2=80=9Cright thing=E2=80=9D requires getting all authors=E2=80=
=99 sign-off in order to change licensing information and such. The =
FreeBSD project for instance has had to hop through a lot of hoops to =
change code from BSD 3-clause to 2-clause because some of the authors =
didn=E2=80=99t sign over the code to the project when contributing it, =
since the concern with signing off on code and such predated the code =
contribution.

Unless there=E2=80=99s a real need for consolidating the LICENSE files, =
I=E2=80=99d leave it well enough alone in the source tree and just =
aggregate all of the licenses as an uber license and distribute it with =
the binary packages.

That=E2=80=99s just my 2 cents,
-Enji

--Apple-Mail=_B0F0C3C2-38BE-4CEF-8D4F-5C65AE72146B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtvtxN6kOllEF3nmX5JFNMZeDGN4FAmC6ZzIACgkQ5JFNMZeD
GN5nRw//WSe8bTwDZK3Tx3mreR5R3q9Z5WQ6iDVLCjJ1IvOdQ2+z3f/Mhl92NMDS
AnzJ6rCZDNyyWuhO2gRUlVTHNbX6zuaiP+FaYorji2Lc9W1xvUold/64jgHOR3wj
n3QWziYyQHCNxvdH8c57w6RcThRI8tV3nY8vXihnXqKn++HzzsqGurDUmosWbQMp
1CNXKiEQgqfoeIrDcBFtYSKpaD9pdDu6T5arE0h4t/C7PGKyX2oWt3aFhNmioTep
e25Fswj8n2iWb99nK+lrrrFQK/3elsLMiYCcDaPAm4+3yeSDPLN4zafcFgixNpd/
q0SMOVJlKI7sUuLfQGUA2z0RRkggXaDxpBjzv0Ekvd/lTTk12DAJzVgTXi+0Cslf
IJ5lt5l6NBEKQrLmYJEPqDAt70+DNVPhSiIl9At4DiLuMKFurZ3nMYyWsiEp4mVa
StFT2cIWrBJKeA45LeNjpGiq9LPYXgnyweJVC+xNGuRyLBfjUiFX1iw7fYcqx4Vl
eNJU2KSB0Lhq69645LUwrb3BQ4SRILzVqipOtamp6/absoowwYXlWsifyxog5RT3
DbMa5HGitZm6jHUHMwzfeUIawww25RFT33DPbR3A2IyMHZRJGY7ki9hg/yKXBQTN
WTSRF3zK8xNQx96eLhiFJB3Fqca2tRa2oQ2YJr+d/stdW7vdXgY=
=ZVSm
-----END PGP SIGNATURE-----

--Apple-Mail=_B0F0C3C2-38BE-4CEF-8D4F-5C65AE72146B--

--===============1756983163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1756983163==--
