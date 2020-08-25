Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD725560F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 10:11:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D00363C55DE
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 10:11:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F311C3C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:44:24 +0200 (CEST)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1B6861401118
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:44:21 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbLbb0zRZz9sTY;
 Tue, 25 Aug 2020 17:44:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1598341457;
 bh=Y7qAOm5LXj3xJO1LU4/Uc9yKGGyRuix0iKjtoR5Ybwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pgC21sqz65fkwXGPg1EjAn6DYcG7FDJ2dkW3Xt++e2hodyY7IDjPbmP1ThGopEZt7
 N7zwytmjKsXkZpmrmzMWYQZ3Ev1ii1RjEXYowBSHiqKFfmz7kf+raEUT+bNzKH8etX
 aUlVKvw2qXS6zM78dURS7e+z3IVSPUA+vJOjQD/36p5Pl10NOspmjX2eqIw97v6nbS
 H1oWoMAVl4V2b4RApkVbG4fEgdcLPT7/7i/g64AJw0tMv5lzoP2lsGCNQokI6taMVG
 Y54H1X33vqBOGURyOYenuLLKzFJVvQmZK95AjFybhysrpAjNScXw1GTf4ZHddt/xPI
 YFPXyhtZVB16Q==
Date: Tue, 25 Aug 2020 17:44:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200825174410.1af823db@canb.auug.org.au>
In-Reply-To: <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
 <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 28 Aug 2020 10:11:51 +0200
Subject: Re: [LTP] BUG: Bad page state in process true pfn:a8fed on arm
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
Cc: opendmb@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 afzal.mohd.ma@gmail.com, Christoph Hellwig <hch@lst.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1955621841=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1955621841==
Content-Type: multipart/signed; boundary="Sig_/Z40Eod_0LnLaojqiTY7/wC+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z40Eod_0LnLaojqiTY7/wC+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Aug 2020 13:03:53 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote: =20
> > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024 =20
> >
> > Somebody freed a page table without calling __ClearPageTable() on it. =
=20
>=20
> After running git bisect on this problem,
> The first suspecting of this problem on arm architecture this patch.
> 424efe723f7717430bec7c93b4d28bba73e31cf6
> ("mm: account PMD tables like PTE tables ")
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
>=20
> Additional information:
> We have tested linux next by reverting this patch and confirmed
> that the reported BUG is not reproduced.
>=20
> These configs enabled on the running device,
>=20
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
>=20
>=20
> -- Suspecting patch --
> commit 424efe723f7717430bec7c93b4d28bba73e31cf6
> Author: Matthew Wilcox <willy@infradead.org>
> Date:   Thu Aug 20 10:01:30 2020 +1000
>=20
>     mm: account PMD tables like PTE tables

OK, I have reverted that patch from todays' linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z40Eod_0LnLaojqiTY7/wC+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9EwUoACgkQAVBC80lX
0GxJJwf/VPBxX45ROMwkoKpUInftEerYb6NZ5Muk8AS1xBRl0rD+0luk9VA1ABGi
TzqC7jVz4maQV4fxLZH9+sMMvVkaW9ltHXDgxmoksmFNvLBPkVdMOWNyEYIecxAX
zExf6S4P2NsZ8yky3DSEW+nOhFqCuktnR91sJXhUN45buP9vKKmszqgtFOrdNtkG
rwUlJP2GHr0TOLvEUKthE3lUnxL/whN2X5ZDYj/0HiIn00C0YSbLF3vGyFnlwKy8
lkMCk87hk+xKpND9DEk/IjcpLPIaJfFiVhxucEAgDjFv3/uRb/D+owtmdXAmRKip
/3gVT9vtSLlOrwBo95Pu4mB1Ke46YQ==
=bf3j
-----END PGP SIGNATURE-----

--Sig_/Z40Eod_0LnLaojqiTY7/wC+--

--===============1955621841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1955621841==--
