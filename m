Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622E23CAB0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3F133C32BA
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:47:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A34963C6079
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:34:26 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D78EE2013EA
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:34:25 +0200 (CEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87D8F2054F;
 Mon,  3 Aug 2020 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596458062;
 bh=CqDYfczcR1q266t02Vom+AVTSJNakCMLYWVNuU1vHTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoQrCL+oQCXUMv4UKHkiv7SrlmHJFp7bkkGYydn8kgA9zmNHwN+3sCaNhxM/mtaQn
 kycP4nEREMBGCXRKiZeLqQkpcU8pqkNmy89F9WtkczF2OcXF7oHOXwc7UD9BPnzDTq
 xQuDosOGp5YEGSCOttpZaFhbnomb7SYiDcPX76lY=
Date: Mon, 3 Aug 2020 13:34:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200803123400.GE4502@sirena.org.uk>
References: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
 <1881588710.5797015.1596457102422.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1881588710.5797015.1596457102422.JavaMail.zimbra@redhat.com>
X-Cookie: They just buzzed and buzzed...buzzed.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: Re: [LTP] [PATCH] selftests: vdso: hash entry size on alpha,
 s390x is 8 bytes
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
Cc: linux-kernel@vger.kernel.org, ltp@lists.linux.it, skhan@linuxfoundation.org
Content-Type: multipart/mixed; boundary="===============0266152926=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0266152926==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2020 at 08:18:22AM -0400, Jan Stancek wrote:

> > Do similar check in parse_vdso.c and treat hash entries as double word.

> Ping, any thoughts about the issue or patch?

I'd suggest contacting the authors of that code.

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8oBDgACgkQJNaLcl1U
h9CCPwf+NIw+rcyLIhnRorwowwqEVgX/nqjDNZIycdnQe86dOazM/FkHhE8xFP8X
ehM0B/EoDmMfXz/AxXWt9hwAH8O5jZyjpLg6M3onsS6uzfwoJloTsAtyahtjidQG
7jDlMXEwhomOQRr7N+KQe+4LArk5Td2AMpA7luEpE/WMtNXjE6slnQJke+GIBeSc
SVOz6ID/cv1n1O+c+LV++2xvsupajfPhINLHp9tmholkiy9k+02zkph6SXra0tSv
cfg3Q+IdGq+yr9KAYpj6+yFcG10X5gQmgQjhbe6ZiLdGOV2IouQc5q1n3+ceSHTl
AVY1i+c9WXnihPbxDrKB72Uqdb7MWQ==
=7zqN
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--

--===============0266152926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0266152926==--
