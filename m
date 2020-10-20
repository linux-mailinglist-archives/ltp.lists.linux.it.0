Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6F294160
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 19:25:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81B793C56D3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 19:25:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6D9B33C31B3
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 19:25:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 120FB1000A23
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 19:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603214706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkUZcV0RHvBQCtddDCi8Jl1PDarJsxHvw9FO675doK0=;
 b=kWO2SM7cpF0FkTdM/cFGdvR38/5kht/iq0z+RnxlxCeAi5dvBHQol/wc3WHvyyHjkzIpqx
 dyZbzFhkUgIa1XkoKodi3De9X0nGHMAA7IXmWm9mk71t6uxW/ztMBrpqDV3guj3y/7q7be
 x6zD1ouQqeadG5LlZlgJaudBsBbh69I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFD9DADCC;
 Tue, 20 Oct 2020 17:25:05 +0000 (UTC)
Date: Tue, 20 Oct 2020 19:24:02 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20201020172402.GD46039@blackbook>
References: <87lfg2ob83.fsf@suse.de>
 <20201019095812.25710-1-rpalethorpe@suse.com>
 <CALvZod6FNH3cZfZxLSFXtQR5bV_2Tese0793Ve9rd1YNW22MKg@mail.gmail.com>
 <87mu0hwik7.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87mu0hwik7.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] mm: memcg/slab: Stop reparented obj_cgroups
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
Cc: Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1008030686=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1008030686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Tue, Oct 20, 2020 at 06:52:08AM +0100, Richard Palethorpe <rpalethorpe@suse.de> wrote:
> I don't think that is relevant as we get the memcg from objcg->memcg
> which is set during reparenting. I suppose however, we can determine if
> the objcg was reparented by inspecting memcg->objcg.
+1

> If we just check use_hierarchy then objects directly charged to the
> memcg where use_hierarchy=0 will not be uncharged. However, maybe it is
> better to check if it was reparented and if use_hierarchy=0.
I think (I had to make a table) the yielded condition would be:

if ((memcg->use_hierarchy && reparented) || (!mem_cgroup_is_root(memcg) && !reparented))
	 __memcg_kmem_uncharge(memcg, nr_pages);

(I admit it's not very readable.)


Michal

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+PHSwACgkQia1+riC5
qSiqORAAmQO74JHeb74RQGqy+cE/teEdvHO884KVh6QnHVdHqekJdJ1f+9FhN0/B
Yn0Ou7ySZDTT9X3dtRKX/eP7jjF6wRtyP9GD2T6a6XG5LGSGh3lLjsVnYTkq4Bef
C5xqA/fUoSsJClVHwzyWEhfboLwXlgJmFIOoa2uhrZpIO39jIppNu4Vwslrpznaj
qtPdaHNa5PDlXruFNdKxzLVPvrvrmEaLdM0a+8CGD81pENDrTXdSBNnAgnwi6zA/
aK/co/Kt8BJBs+SKQCBIFyEH/HTGfHtYm15vfuYHOU7SDWGNtH1+BAzeVQw5jrAK
qZHR2w5D5RJ2lLU33j/7yHYcdHIv8CShM7CE8LN4JkcSoZZGbSsUpd6LYth6jptW
/EhIYQQ7Ub+JTBGP5nbe78vO8P/qInBy7/R4jWyKk1F7sJa30ktqQTcfYPI9L2Fp
QwrkvMSm0RrJ9MkAyy7NPhkB5hASdDtdGEumWHSKB+KJDLjiE74QAV1qmlsTiUbn
CDkmCc8eMBeIHAjDq2dDT8ed6uXY7GHd+wWIFuYbwo6EJtCwhYCtmVfpnMY03QG4
+qoSzv5g9ADW/WwdeHnIcFujFUD012hmuLN5iQvrRs8iuxAvRlIuK8iNjvgJbK9Z
F74NC2z/cOUKtA3fGrNCmMfQ52oLgbg/iMQAwRPAZVilCXH1s/c=
=IzbP
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--

--===============1008030686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1008030686==--
