Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD82A4624
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:22:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 520D33C3023
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 14:22:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 20F3E3C245E
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:22:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 670061A013C4
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 14:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604409742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VeA9Qsqxu1/i14CMSGPPmW3KXKC7b+HEm7qKKl5XDvg=;
 b=Pxo79IfAbvAKkRNNFMbGkHgZWU7zirElkyhd/EpedIl5/ACqkBp91t0MQK0Gwnhw0iiO/G
 zK20Exyj3tPnz68nn91WwrEvThhmjjygMxsW7/Mzw82amVnPx/GxV7zJaHowJCDqpugz9m
 IbwhDG6IGCbT463rGcyFKbt3U2zSqXQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF85DAB0E;
 Tue,  3 Nov 2020 13:22:21 +0000 (UTC)
Date: Tue, 3 Nov 2020 14:22:21 +0100
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <guro@fb.com>
Message-ID: <20201103132221.GI21990@dhcp22.suse.cz>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
 <20201020162714.GC46039@blackbook>
 <20201020170717.GA153102@carbon.DHCP.thefacebook.com>
 <20201020181822.GA397401@cmpxchg.org>
 <20201021193322.GA300658@carbon.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021193322.GA300658@carbon.dhcp.thefacebook.com>
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
Cc: Christoph Lameter <cl@linux.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
I am sorry but I was quite busy at the time this has been discussed.
Now that I got to this thread finally I am wondering whether this
resp. other root cgroup exceptions have any follow up.

I have seen the issue is fixed in Linus tree by 8de15e920dc8 ("mm:
memcg: link page counters to root if use_hierarchy is false"). Thanks
for taking care of that! I do agree that this approach is the most
reasonable immediate fix.

Btw. we have been carrying a warning about non hierarchical hierarchies
for years in our distribution kernels and haven't heard of any actual
bug reports (except for LTP driven ones). So we might be really close to
simply drop this functionality completely. This would simplify the code
and prevent from future surprises.

Thanks!
-- 
Michal Hocko
SUSE Labs

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
