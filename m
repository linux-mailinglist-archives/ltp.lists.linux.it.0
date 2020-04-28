Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBE1BB976
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:06:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 163343C2858
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:06:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 67FAB3C285C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 02:51:44 +0200 (CEST)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8E1851000935
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 02:51:43 +0200 (CEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 49B34Z34sLzKmZM;
 Tue, 28 Apr 2020 02:51:42 +0200 (CEST)
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id r3EXWYFXzHLQ; Tue, 28 Apr 2020 02:51:38 +0200 (CEST)
Date: Tue, 28 Apr 2020 10:51:26 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200428005126.6wncibudt6ohghvc@yavin.dot.cyphar.com>
References: <f969e7d45a8e83efc1ca13d675efd8775f13f376.1586830316.git.josh@joshtriplett.org>
 <20200427135210.GB5770@shao2-debian> <20200427142733.GD7661@rei>
MIME-Version: 1.0
In-Reply-To: <20200427142733.GD7661@rei>
X-Rspamd-Queue-Id: 0E0701771
X-Rspamd-Score: -9.44 / 15.00 / 15.00
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 28 Apr 2020 11:06:32 +0200
Subject: Re: [LTP] [fs] ce436509a8: ltp.openat203.fail
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@arndb.de>, kernel test robot <rong.a.chen@intel.com>,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 lkp@lists.01.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0505887073=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0505887073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tk4luxag2mt2b3sb"
Content-Disposition: inline


--tk4luxag2mt2b3sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-04-27, Cyril Hrubis <chrubis@suse.cz> wrote:
> Hi!
> > commit: ce436509a8e109330c56bb4d8ec87d258788f5f4 ("[PATCH v4 2/3] fs: o=
penat2: Extend open_how to allow userspace-selected fds")
> > url: https://github.com/0day-ci/linux/commits/Josh-Triplett/Support-use=
rspace-selected-fds/20200414-102939
> > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftes=
t.git next
>=20
> This commit adds fd parameter to the how structure where LTP test was
> previously passing garbage, which obviously causes the difference in
> errno.
>=20
> This could be safely ignored for now, if the patch gets merged the test
> needs to be updated.

It wouldn't be a bad idea to switch the test to figure out the ksize of
the struct, so that you only add bad padding after that. But then again,
this would be a bit ugly -- having CHECK_FIELDS would make this simpler.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--tk4luxag2mt2b3sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXqd+CwAKCRCdlLljIbnQ
EgeUAP9m6EkEl0AGN+/eOT+i/EalQ0VpBQZ8UYtvJP5HbYDC8gEA3HtLFj8eHbce
Y9pj4AZCRJVLhR1qVwrou+X6rZVJ0Ao=
=p2HM
-----END PGP SIGNATURE-----

--tk4luxag2mt2b3sb--

--===============0505887073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0505887073==--
