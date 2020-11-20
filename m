Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF602BB1AA
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 18:46:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47BA43C5F39
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 18:46:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4781A3C32BD
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 18:46:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3AB1C200909
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 18:46:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605894383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05hfz9UibGY8EhxM5vF9mb80d6tYqyKPBz9VqyDSJc8=;
 b=QvRl43zJlLeKUsGjBxQf6ne5Uw3/1C0Qtmn7HmKfQ6WlxIaJ1KwpHKuoXqb59U/vVgsSGw
 Kvq+ousxPqvyiTvY4EOatnAvXVr//wSqIjGFG+vW58+WrFpPb5cL1gnd52E99PUgUPNQZb
 Xr1YJH68aRUOOgBvonHANFW6d9UU33Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C3A7ACBA;
 Fri, 20 Nov 2020 17:46:23 +0000 (UTC)
Date: Fri, 20 Nov 2020 18:46:16 +0100
To: Shakeel Butt <shakeelb@google.com>, Roman Gushchin <guro@fb.com>
Message-ID: <20201120174616.GA94676@blackbook>
References: <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
 <20201020162714.GC46039@blackbook>
 <20201020170717.GA153102@carbon.DHCP.thefacebook.com>
 <20201020181822.GA397401@cmpxchg.org>
 <20201021193322.GA300658@carbon.dhcp.thefacebook.com>
 <20201023163053.GB535375@cmpxchg.org>
 <20201110012758.GA2612097@carbon.dhcp.thefacebook.com>
 <CALvZod7GrYayHjYsqtF2AfcvkbTHCyWQJW4oXoO3fSGJeotDpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALvZod7GrYayHjYsqtF2AfcvkbTHCyWQJW4oXoO3fSGJeotDpQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
From: =?utf-8?q?Michal_Koutn=C3=BD_via_ltp?= <ltp@lists.linux.it>
Reply-To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Michal Hocko <mhocko@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0069457487=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0069457487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Tue, Nov 10, 2020 at 07:11:28AM -0800, Shakeel Butt <shakeelb@google.com> wrote:
> > The problem is that cgroup_subsys_on_dfl(memory_cgrp_subsys)'s return value
> > can change at any particular moment.
The switch can happen only when singular (i.e. root-only) hierarchy
exists. (Or it could if rebind_subsystems() waited until all memcgs are
completely free'd.)

> Since the commit 0158115f702b0 ("memcg, kmem: deprecate
> kmem.limit_in_bytes"), we are in the process of deprecating the limit
> on kmem. If we decide that now is the time to deprecate it, we can
> convert the kmem page counter to a memcg stat, update it for both v1
> and v2 and serve v1's kmem.usage_in_bytes from that memcg stat.
So with the single memcg, it may be possible to reconstruct the
necessary counters in both directions using the statistics (or some
complementarity, without fine grained counters removal).

I didn't check all the charging/uncharging places, these are just my 2
cents to the issue.

Michal

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+4AOMACgkQia1+riC5
qShDDA//VKPWDCNm70dyHIeZkqaD/EqDTDbcSYSs+4zTlOnYg4Mf1oahYAuZJR9i
5UwJwvyNu7zDQJJb2wGPBfrhWnc8LMJwKuedjWYUhZnm1mifdL1/4eomL/B6UdhI
qjaWI5C+NCc/Yvu4tjTDvGwJvQsRNlEqHNvlcU8Lq6xhBO0+eFSm6LClcbLJDpC2
lMNHkcIlyA7la+dDkOJGQ798tbZUAeIaBaj6v/cmWP4By9QZFLctIIFuwZVE7zUY
irzTx2B2zeVXpQDdkriRG/+WtQRmAYvhcgHuhCORDJd2Ue7gYD8ShD+Z9zTdbkHH
OkdvZ7vQ2B3Rf/uoiOU+Q4Mk9qmlpLlYWHlTvvQaOcFSvx37FDWVsZRE2vTjI8PH
8/pji3Qd27cGLzqlsWbNFPGcz5mouoLMV5M5FfpPL5tzTc+CrONmgRv5SOW9ID8e
EChWvp6sVrU2hiSZ7EODR3c1OsntR8GxVZGeJJL9YJO6H6FPW5m88oGTpXl07jUh
bYlZPdmD4F3ar8kP0acD5wDqQhRaz2Ryj+37uV+IdmVS4br26bUf/jgGQ9Vj/4Pa
xypvUHRP6DRxfytu20OEbCa8e9/kI27MAjRVOFX6pUrfAu5tf0zjlvLFBFjBlaTn
2Mr2wJn3VO8bOToSzu/JLlIqGN2F1oya9KQqmZSRKUGypR3qQv4=
=tHCs
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

--===============0069457487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0069457487==--
