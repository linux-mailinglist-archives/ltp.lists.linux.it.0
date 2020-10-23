Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 361272973EC
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:32:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8E693C317D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:32:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D38933C23CB
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:32:34 +0200 (CEST)
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0EEEB201082
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:32:33 +0200 (CEST)
Received: by mail-qt1-x841.google.com with SMTP id h19so1390478qtq.4
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=otK2xA8v8qWmWLWMrDWaTpQeBb9p8Hm57qmSK0JBmb8=;
 b=z8nsTyCYFCOST4TXZPaey2SY8VFRd0iebOTlu5+j0on+94luwg1h2Tt973fyNulw6G
 0+S/9f0pOHZPxMbqxiS43LAWlawfINi5VIqUl0F3OGHze6Zr3ARy9dzJnmT4oegH6tqp
 RKfdgiWivifk1HAJNkchrEBD3uAzC+ZGQ3GLCLPJEp3IBQR5IaT3nQyydfo70KJLaiL1
 UINuLzKEr7LWcHHPOt5U9WJyNtlK67YaCsX08baal2yJoBnaPqLpjwtJG3fempMmIHa2
 Gla9PQ4vZxWp4Uq2gEIFpUz56ib+ruIYJFnkzRIi5drplneehgdrupFbRTxy4TATzQjM
 th3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=otK2xA8v8qWmWLWMrDWaTpQeBb9p8Hm57qmSK0JBmb8=;
 b=RUTlRePg69JCekP9kLgPPa0vFFu4Uf9CrELqtHskAk4EfXiXSvtLyYorLfIqz/2XTn
 FbHn2tSoEUibhRYYS+ohlSFIdWmYaTyugNL/T263gZMV69D8ygedcYZX9kXB5YHMSzsq
 29QyvUIEUEdMnDlyJyC29/H2rpYcbMndhfhzA9sqb1UBel3WPDQjZPS0fFtQGMKcbhRA
 4MK8cih2925iZX8j6lu4jRhcg/U+koQC1vkjRo7RmlmmwxgSiHl4ctKkzfEQzgNfH/9t
 VeymKJiKin4uiimc3J5MknKdGX0GR1OJtoxfELkh5fQAf+azOctMYtZbmScyyPeNlR7k
 gSDA==
X-Gm-Message-State: AOAM533tx52UlFVSxPS3MGMVTC9KzbVdmuFss0Z5B/bQx9vhc9+yFPJp
 3lCfMon/MAHSl5pO97+w38YH4g==
X-Google-Smtp-Source: ABdhPJyIpHNoKFReeo/s8D25hhOsKucPeO2uMAXJ2UXBrKMwgcOoMIt0du72wmcaB22RwhAJPsRpoQ==
X-Received: by 2002:ac8:7517:: with SMTP id u23mr2823683qtq.261.1603470752834; 
 Fri, 23 Oct 2020 09:32:32 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:c400])
 by smtp.gmail.com with ESMTPSA id a3sm1203866qtp.63.2020.10.23.09.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:32:32 -0700 (PDT)
Date: Fri, 23 Oct 2020 12:30:53 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Roman Gushchin <guro@fb.com>
Message-ID: <20201023163053.GB535375@cmpxchg.org>
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
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tejun Heo <tj@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 21, 2020 at 12:33:22PM -0700, Roman Gushchin wrote:
> On Tue, Oct 20, 2020 at 02:18:22PM -0400, Johannes Weiner wrote:
> > On Tue, Oct 20, 2020 at 10:07:17AM -0700, Roman Gushchin wrote:
> > > If we want these counter to function properly, then we should go into the opposite
> > > direction and remove the special handling of the root memory cgroup in many places.
> > 
> > I suspect this is also by far the most robust solution from a code and
> > maintenance POV.
> > 
> > I don't recall the page counter at the root level having been a
> > concern in recent years, even though it's widely used in production
> > environments. It's lockless and cache compact. It's also per-cpu
> > batched, which means it isn't actually part of the memcg hotpath.
> 
> 
> I agree.
> 
> Here is my first attempt. Comments are welcome!
> 
> It doesn't solve the original problem though (use_hierarchy == false and
> objcg reparenting), I'll send a separate patch for that.
> 
> Thanks!
> 
> --
> 
> From 9c7d94a3f999447417b02a7100527ce1922bc252 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Tue, 20 Oct 2020 18:05:43 -0700
> Subject: [PATCH RFC] mm: memcontrol: do not treat the root memory cgroup
>  specially
> 
> Currently the root memory cgroup is treated in a special way:
> it's not charged and uncharged directly (only indirectly with their
> descendants), processes belonging to the root memory cgroup are exempt
> from the kernel- and the socket memory accounting.
> 
> At the same time some of root level statistics and data are available
> to a user:
>   - cgroup v2: memory.stat
>   - cgroup v1: memory.stat, memory.usage_in_bytes, memory.memsw.usage_in_bytes,
>                memory.kmem.usage_in_bytes and memory.kmem.tcp.usage_in_bytes
> 
> Historically the reason for a special treatment was an avoidance
> of extra performance cost, however now it's unlikely a good reason:
> over years there was a significant improvement in the performance
> of the memory cgroup code. Also on a modern system actively using
> cgroups (e.g. managed by systemd) there are usually no (significant)
> processes in the root memory cgroup.
> 
> The special treatment of the root memory cgroups creates a number of
> issues visible to a user:
> 1) slab stats on the root level do not include the slab memory
>    consumed by processes in the root memory cgroup
> 2) non-slab kernel memory consumed by processes in the root memory cgroup
>    is not included into memory.kmem.usage_in_bytes
> 3) socket memory consumed by processes in the root memory cgroup
>    is not included into memory.kmem.tcp.usage_in_bytes
> 
> It complicates the code and increases a risk of new bugs.
> 
> This patch removes a number of exceptions related to the handling of
> the root memory cgroup. With this patch applied the root memory cgroup
> is treated uniformly to other cgroups in the following cases:
> 1) root memory cgroup is charged and uncharged directly, try_charge()
>    and cancel_charge() do not return immediately if the root memory
>    cgroups is passed. uncharge_batch() and __mem_cgroup_clear_mc()
>    do not handle the root memory cgroup specially.
> 2) per-memcg slab statistics is gathered for the root memory cgroup
> 3) shrinkers infra treats the root memory cgroup as any other memory
>    cgroup
> 4) non-slab kernel memory accounting doesn't exclude pages allocated
>    by processes belonging to the root memory cgroup
> 5) if a socket is opened by a process in the root memory cgroup,
>    the socket memory is accounted
> 6) root cgroup is charged for the used swap memory.
> 
> Signed-off-by: Roman Gushchin <guro@fb.com>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>

This looks great.

The try_charge(), cancel_charge() etc. paths are relatively
straight-forward and look correct to me.

The swap counters too.

Slab is a bit trickier, but it also looks correct to me.

I'm having some trouble with the shrinkers. Currently, tracked objects
allocated in non-root cgroups live in that cgroup. Tracked objects in
the root cgroup, as well as untracked objects, live in a global pool.
When reclaim iterates all memcgs and calls shrink_slab(), we special
case the root_mem_cgroup and redirect to the global pool.

After your patch we have tracked objects allocated in the root cgroup
actually live in the root cgroup. Removing the shrinker special case
is correct in order to shrink those - but it removes the call to
shrink the global pool of untracked allocation classes.

I think we need to restore the double call to shrink_slab() we had
prior to this:

commit aeed1d325d429ac9699c4bf62d17156d60905519
Author: Vladimir Davydov <vdavydov.dev@gmail.com>
Date:   Fri Aug 17 15:48:17 2018 -0700

    mm/vmscan.c: generalize shrink_slab() calls in shrink_node()
    
    The patch makes shrink_slab() be called for root_mem_cgroup in the same
    way as it's called for the rest of cgroups.  This simplifies the logic
    and improves the readability.

where we iterate through all cgroups, including the root, to reclaim
objects accounted to those respective groups; and then a call to scan
the global pool of untracked objects in that numa node.

For ease of review/verification, it could be helpful to split the
patch and remove the root exception case-by-case (not callsite by
callsite, but e.g. the swap counter, the memory counter etc.).

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
