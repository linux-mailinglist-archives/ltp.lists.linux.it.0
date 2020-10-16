Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1C290AB2
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:26:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96E683C57D1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 19:26:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 49F173C011E
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:26:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CFDBC20103A
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 19:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602869197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7adOyJQobTs7oFN7R41/ee6ZODNptFcC0aLMfk4q+Q=;
 b=cvs1EqQJad6ys0IgBRtNq+qkk7IAGgPYw8pc+utGMKssl6HaCS8gQoJoBHSjjuuEmU1ksy
 Ds1TvB9F1dI6TZbBH9+Ek+woExdQtDWvp9GT5QRl0QoCdLF2WHvKMhuVxJucc50i5/U3+M
 k/KNwdhcwmKXqSKlzi+r3bAGjhwnk5k=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29212AC19;
 Fri, 16 Oct 2020 17:26:37 +0000 (UTC)
Date: Fri, 16 Oct 2020 19:26:35 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20201016172635.GB102311@blackbook>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook> <87sgaesba0.fsf@suse.de>
 <87pn5irz2m.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87pn5irz2m.fsf@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Roman Gushchin <guro@fb.com>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============2017271375=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============2017271375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 04:05:21PM +0100, Richard Palethorpe <rpalethorpe@suse.de> wrote:
> I'm don't know if that could happen without reparenting. I suppose if
> use_hierarchy=1 then actually this patch will result in root being
> overcharged, so perhaps it should also check for use_hierarchy?
Right, you'd need to distinguish whether the uncharged objcg was
originally (not)charged in the root memcg or it was only reparented to
it. (I originally considered only the genuine root objcgs.)

In this light, homogenous charing to root memcg looks really simpler but
I wonder what other surprises it brings about.

Michal

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl+J18cACgkQia1+riC5
qSgBlA/9E7AebKZQjQP9HUGpWS+49sRCns58CiQJhFugbkHlJl5PsgvI9rQs9j6k
AhG6e0WZlMb35II+naqx3kNnAYoRiw8xWcuAH+lvWFXKI1saYN4UOjKNzigojTw0
x3fi9bRJveQtpwPY6IwXbiOJkYZnEplEskwiqbY0kCFZMhQlvnBfJIAzegEa5Jty
ZCcqYPMxcfczsm3+vtrcHDWBXzujoxp9QPyyNWmRAkIjgTebO3ZmGRieCVmuPTm7
PY1nCA/65amYSsxBPvo+L7U5a4jKOV04pSLg0PeBByJbiy3TEoLi0938arMVg7P5
MT2PdqfzJ5W1T+7zh1SsRWV2/7b05JLVHnLPTL3SlvNIn2GIouSWSnAbdiZvqenB
XFafC+4PbL0xTdo5Lrp3pqTgw8kwScNUz/5FnRAdNw7eET2bGRQ46ah3EBQsoqNw
kOv07/gipMp3BBNJy6JHV+hSwK8CfOvy45FuyIJ6TAzYKZdOaBVWv4kt2eesHj+I
qzGRmmhS1rPcSzMtZU2rBIXcWfy7tgUsPdyEOgx+0VE10O0Vn0qFEWcupTSLYykv
8C301Q+aMnXbFcytJ5dSixD3oxzI5OP3x8VIkyuuoFe9MsRJZuBwBAYS6Vl+Wwd4
fmJBhroGerid+YzHDvvB0zeNr+j4IBjztGGJznC0/Mgm/Bf3rn8=
=j9PI
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--

--===============2017271375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2017271375==--
