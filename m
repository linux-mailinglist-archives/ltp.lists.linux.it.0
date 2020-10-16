Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D26DB290228
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:48:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90BF93C3238
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:48:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4C5503C3230
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:47:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 874BB60123A
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602841627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDB5UEUrkBNCh2xtKefDnttBa3itZcKarLkBKMAP85c=;
 b=GHhY115QpXOP/li/piMyOcErB3jxQAbmT6uDTeto7iEt7jEEWDFm46UWJgxB4J70q7CxEx
 Y9R+JypcumFRJAyZvNv3+bF70X6pTJk+b/87IhZz5Oire3KSpPPdvRmWezqnb2y3L7LfJs
 Mr50b0oRnRY9v94DQAmV5cY48PP8mRg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACAD6ACF1;
 Fri, 16 Oct 2020 09:47:07 +0000 (UTC)
Date: Fri, 16 Oct 2020 11:47:02 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20201016094702.GA95052@blackbook>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201014190749.24607-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 16 Oct 2020 11:48:26 +0200
Subject: Re: [LTP] [RFC PATCH] mm: memcg/slab: Stop reparented obj_cgroups
 from charging root
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
Cc: linux-kernel@vger.kernel.org, Roman Gushchin <guro@fb.com>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0161695819=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0161695819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, Oct 14, 2020 at 08:07:49PM +0100, Richard Palethorpe <rpalethorpe@suse.com> wrote:
> SLAB objects which outlive their memcg are moved to their parent
> memcg where they may be uncharged. However if they are moved to the
> root memcg, uncharging will result in negative page counter values as
> root has no page counters.
Why do you think those are reparented objects? If those are originally
charged in a non-root cgroup, then the charge value should be propagated up the
hierarchy, including root memcg, so if they're later uncharged in root
after reparenting, it should still break even. (Or did I miss some stock
imbalance?)

(But the patch seems justifiable to me as objects (not)charged directly to
root memcg may be incorrectly uncharged.)

Thanks,
Michal

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+JbBAACgkQia1+riC5
qSjC0w//aMd+WraEXQVcGywU5HBwq4ZhMLA8dUsyH97TuiT8gtiKLwMm/uwbS7HC
D7h+DRxt7TdyUrTAqmmQpqbfDL1hBRUXvBHpy8SxLYqulPYmSpt2WIKNP7ph3e6J
A4RGJqUxI5p0tepxMYD9ixRNaGH8mR7koXgGsxBsFTgXOnQiwwDbJuXoVcf4zpAR
Niel4m7H4BHrzqeas8NQMN6oe+cLyMVz3M3pH/GCNwDRztVFSe+23ygJYxZ3R+3M
Kd7FGn/Ny8izuDDEL786DojBi+uar+FlXMKPvhk6WJqGKsmMs63vxpClKnHECJ0d
V/7ZQlqQeFkjyp1No+JnGOQbHUlgX4J9LQwF1mI9PpOP6u1enzk2briQ7GA1+kEd
bMC8oyFdALFTUFqZNaNOKdrFLp2cTJLzxmy7FxGEfBtVkey/FGSFLFwPhi7EGKnQ
fyIsIlZJnPE0LqNkj3WUJquGpA6YJLlJHsXAn79UI2qZaHLBH0IiebP8fUmkAwwX
rg9v6BuK1/jOEJK79L6dTPrkbnuhyCpM79ww3opWdg67VOLdaPvvD14VL7ovPClE
QO2p4PRN8soZo+bjSP0wx8N1FDKMsn0DN8GWdblqKxlS3rPltNcIjx7HZs1Nf8ef
uMFg1Tf61euYE/nJxP7sxBMW+I+O6OtGo8Z15FqmjhO4K6UJv3c=
=pMdi
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============0161695819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0161695819==--
