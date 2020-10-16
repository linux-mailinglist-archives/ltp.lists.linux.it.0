Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89449290A5E
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:15:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F68F3C57B7
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:15:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 781AA3C3238
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:15:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D8956013DB
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602868506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mFbdqeNtBNjHicVP7D22X8dVYCOccFrfnE1MEFdmE4Q=;
 b=XxTbbwghhHpophO+3RjhXcyLzig0YGtPJto1PjCXVaIqqRh2BMY7/wsbkhZKeJCHEcIUlr
 tcf9Z+eMHuNLVBv4mAlx6kN1UhYmgqBn0fvhLzqWmmln0ig07f3Z4APC6JQQtoHyV5J0MX
 mmLtn8iRvngf4JSjLM85IlwvLtUGl6E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5266AC4D;
 Fri, 16 Oct 2020 17:15:06 +0000 (UTC)
Date: Fri, 16 Oct 2020 19:15:02 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20201016171502.GA102311@blackbook>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <20201016145308.GA312010@cmpxchg.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: linux-kernel@vger.kernel.org, Richard Palethorpe <rpalethorpe@suse.com>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <guro@fb.com>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============2006638932=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============2006638932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 10:53:08AM -0400, Johannes Weiner <hannes@cmpxchg.org> wrote:
> The central try_charge() function charges recursively all the way up
> to and including the root.
Except for use_hiearchy=0 (which is the case here as Richard
wrote). The reparenting is hence somewhat incompatible with
new_parent.use_hiearchy=0 :-/

> We should clean this up one way or another: either charge the root or
> don't, but do it consistently.
I agree this'd be good to unify. One upside of excluding root memcg from
charging is that users are spared from the charging overhead when memcg
tree is not created.  (Actually, I thought that was the reason for this
exception.)

Michal

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+J1Q4ACgkQia1+riC5
qSgPXxAAlksCkqR8l99ZzFc6f0VtH0koSVgI6EMj4AI/sNjao5oMhMkmB5UWFJVW
kxFvARHCJ0JShOiEB3lk2VEPuebsvzOUeeTixyyLs8VyFXUwq5WryvJPmbvq3AoI
3kaPRv6vO+pUldVVwA/puWX9V2yi2eNM3Qrn7ibjfWnRc0f2oP6VB6zJAIDeU4gU
vKkmYiOmPIPNWp5Sn+IoH0qWqhXJHMykw7F7YdIQNfvCcDU2RFVAmHqhxm40noI2
Ke6oBTqCD5esJpf38Qx6+DYkYrGZ8Ehbuk0PYFrBMz3oLhRUB9L4LdTOZmkIBLl3
sGWAuOQ1k8cmngSuLkiDgO3/WDHkFMKgXoBMz+hWsUmWaFRdctyTahCEIVTj+v6K
fm3brShqrVWKjoF9EcHpFy4iC6fyBl1TUn6a0yo8/V6EOMwjxCYzH53FFZj996V+
VUg/MATOqeAz38xWgomfwb2Sw797ueue4Cv+YM1CBXCQNC3koDlxT58u6VlG+T4J
+xNlvWILhqXxXuQdJ8a0LTf2KWSAiaFxy59EnVIHY3NKLELglS8yN30EJJbyW2cu
KTajMd5yitZSxkNyrwflOdmeBQtBv/MgvtfyM8YzMQF/Mt8J6AtH9WASMUNtNvKC
qlJ5hRkE3xbMdwIVqThcyGbW+F32fSj1/dmOAMumYGh3U8gT584=
=FgAq
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============2006638932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2006638932==--
