Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D81294076
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:27:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86A523C31C0
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 18:27:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AA9253C31B1
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:27:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 434991A0036A
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 18:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603211236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzYcROWuVOVd8ipDDT9hgv+k46oTwcfYxWb+oVaSXs4=;
 b=DV8KuQTmR4sinkZeP4ARKfFF8Bl8hg/X3enbY0qekdkeaQ11/ycvVkPD4pXcHOdhRS3u+A
 oAfX1zi0UJxQLjnRh52dyEYDQwa+d9jeVM80QfpUfNmiGfRp/8xZApxEVQMtjz7vuIe8a4
 /D1zbogUDlWk8Vjhce4CutBBjoNtRaM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B27EAC82;
 Tue, 20 Oct 2020 16:27:16 +0000 (UTC)
Date: Tue, 20 Oct 2020 18:27:14 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Roman Gushchin <guro@fb.com>
Message-ID: <20201020162714.GC46039@blackbook>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
MIME-Version: 1.0
In-Reply-To: <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1894089675=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1894089675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Mon, Oct 19, 2020 at 03:28:45PM -0700, Roman Gushchin <guro@fb.com> wrote:
> Currently the root memory cgroup is never charged directly, but
> if an ancestor cgroup is charged, the charge is propagated up to the
s/ancestor/descendant/

> The root memory cgroup doesn't show the charge to a user, neither it
> does allow to set any limits/protections.
An appealing claim, I'd like this to be true...

> Please, note, that cgroup v1 provides root level memory.usage_in_bytes.
> However, it's not based on page counters (refer to mem_cgroup_usage()).
...and it almost is. But there are still exposed kmem and tcpmem counters.


> To avoid multiple identical checks over the page counters
> code, for_each_nonroot_ancestor() macro is introduced.
If the assumptions behind this patch's idea were true, I think the
implementation would be simpler by merely (not)connecting the root
counters and keep the traversal as is.

> direct ascendants of the corresponding root memory cgroup's page
s/asc/desc/ ;-)

Michal

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+PD90ACgkQia1+riC5
qSjDuA//Wm7T97tLWHY64gjWUvx1R3ROAlPEceShGwKYdOE93BUbmeIK33gh+JlF
XS9K7//xLTozIipTH4yA0+Yo+8WaxvdE+MCBSKjyzTGCs/YlZRcVUZQTLQlXztVM
+jOOnQ49nznWYrbsPBh16/FzHm/MYAiZk4ZZXlZtbGzKemH+bwkPfy/E5XkxlFm7
EFqagyTdT53oaec7llA85f0O7RHZzHbfiWQx3LVBi21cEtf/Drui1gNjlRP5Q2S0
qz2DgfKBhUgOhtQa2pFznJtQTtjNlPYaP7XLL2HiXDjHgN+S+q/Z/yZuYYRjZdyL
xy017aWL24RCCtHqOmS58/i1yPGAraxVl1SJnL+0/6Mib1/7dT1XvnNqW7HzrZxW
WKZihtdr2Zgaj9i+gJmc3QUdHiGu4TFYYM2VYwSdEVGoD2oqWGn19XG+oo7Zwold
mnJc6Gc6/ASNnVuNsukqoTbkT66pOLL7JFqK8ehsVH+NEfIDmElAykEvBbhEIiIu
mqeV5H0GztrQ1FQsq99Ov43bbO/acdgcFi3SX0/XCWQK4G5rmtWYFj40fsuHfYVX
JUgjPa5wGHXd/pmKrcrodA0FRhBJSAsEVDT9AzzVEnU/TnDdMmYz123Fgh3fyLr1
BM2eBYT/iM4b9F5f+CHQNNQfKaHdtLdvtUwt/H2JLq/eUtySExk=
=xnZY
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--

--===============1894089675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1894089675==--
