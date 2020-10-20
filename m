Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3A29348C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 08:04:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFC9B3C56EF
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 08:04:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 57D013C2644
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 08:04:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9CC560078C
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 08:04:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED383ACF3;
 Tue, 20 Oct 2020 06:04:23 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook> <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Roman Gushchin <guro@fb.com>
In-reply-to: <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
Date: Tue, 20 Oct 2020 07:04:22 +0100
Message-ID: <87k0vlwhzt.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@linux.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Roman,

Roman Gushchin <guro@fb.com> writes:

> On Fri, Oct 16, 2020 at 07:15:02PM +0200, Michal Koutny wrote:
>> On Fri, Oct 16, 2020 at 10:53:08AM -0400, Johannes Weiner <hannes@cmpxchg.org> wrote:
>> > The central try_charge() function charges recursively all the way up
>> > to and including the root.
>> Except for use_hiearchy=0 (which is the case here as Richard
>> wrote). The reparenting is hence somewhat incompatible with
>> new_parent.use_hiearchy=0 :-/
>> 
>> > We should clean this up one way or another: either charge the root or
>> > don't, but do it consistently.
>> I agree this'd be good to unify. One upside of excluding root memcg from
>> charging is that users are spared from the charging overhead when memcg
>> tree is not created.  (Actually, I thought that was the reason for this
>> exception.)
>
> Yeah, I'm completely on the same page. Moving a process to the root memory
> cgroup is currently a good way to estimate the memory cgroup overhead.
>
> How about the patch below, which consistently avoids charging the root
> memory cgroup? It seems like it doesn't add too many checks.
>
> Thanks!
>
> --
>
> From f50ea74d8f118b9121da3754acdde630ddc060a7 Mon Sep 17 00:00:00 2001
> From: Roman Gushchin <guro@fb.com>
> Date: Mon, 19 Oct 2020 14:37:35 -0700
> Subject: [PATCH RFC] mm: memcontrol: do not charge the root memory cgroup
>
> Currently the root memory cgroup is never charged directly, but
> if an ancestor cgroup is charged, the charge is propagated up to the
> root memory cgroup. The root memory cgroup doesn't show the charge
> to a user, neither it does allow to set any limits/protections.
> So the information about the current charge is completely useless.
>
> Avoiding to charge the root memory cgroup allows to:
> 1) simplify the model and the code, so, hopefully, fewer bugs will
>    be introduced in the future;
> 2) avoid unnecessary atomic operations, which are used to (un)charge
>    corresponding root page counters.
>
> In the default hierarchy case or if use_hiearchy == true, it's very
> straightforward: when the page counters tree is traversed to the root,
> the root page counter (the one with parent == NULL), should be
> skipped. To avoid multiple identical checks over the page counters
> code, for_each_nonroot_ancestor() macro is introduced.
>
> To handle the use_hierarchy == false case without adding custom
> checks, let's make page counters of all non-root memory cgroup
> direct ascendants of the corresponding root memory cgroup's page
> counters. In this case for_each_nonroot_ancestor() will work correctly
> as well.
>
> Please, note, that cgroup v1 provides root level memory.usage_in_bytes.
> However, it's not based on page counters (refer to mem_cgroup_usage()).
>
> Signed-off-by: Roman Gushchin <guro@fb.com>
> ---
>  mm/memcontrol.c   | 21 ++++++++++++++++-----
>  mm/page_counter.c | 21 ++++++++++++---------
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 2636f8bad908..34cac7522e74 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5339,17 +5339,28 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
>  		memcg->swappiness = mem_cgroup_swappiness(parent);
>  		memcg->oom_kill_disable = parent->oom_kill_disable;
>  	}
> -	if (parent && parent->use_hierarchy) {
> +	if (!parent) {
> +		/* root memory cgroup */
> +		page_counter_init(&memcg->memory, NULL);
> +		page_counter_init(&memcg->swap, NULL);
> +		page_counter_init(&memcg->kmem, NULL);
> +		page_counter_init(&memcg->tcpmem, NULL);
> +	} else if (parent->use_hierarchy) {
>  		memcg->use_hierarchy = true;
>  		page_counter_init(&memcg->memory, &parent->memory);
>  		page_counter_init(&memcg->swap, &parent->swap);
>  		page_counter_init(&memcg->kmem, &parent->kmem);
>  		page_counter_init(&memcg->tcpmem, &parent->tcpmem);
>  	} else {
> -		page_counter_init(&memcg->memory, NULL);
> -		page_counter_init(&memcg->swap, NULL);
> -		page_counter_init(&memcg->kmem, NULL);
> -		page_counter_init(&memcg->tcpmem, NULL);
> +		/*
> +		 * If use_hierarchy == false, consider all page counters direct
> +		 * descendants of the corresponding root level counters.
> +		 */
> +		page_counter_init(&memcg->memory, &root_mem_cgroup->memory);
> +		page_counter_init(&memcg->swap, &root_mem_cgroup->swap);
> +		page_counter_init(&memcg->kmem, &root_mem_cgroup->kmem);
> +		page_counter_init(&memcg->tcpmem, &root_mem_cgroup->tcpmem);
> +
>  		/*
>  		 * Deeper hierachy with use_hierarchy == false doesn't make
>  		 * much sense so let cgroup subsystem know about this

Perhaps in this case, where the hierarchy is broken, objcgs should also
be reparented directly to root? Otherwise it will still be possible to
underflow the counter in a descendant of root which has use_hierarchy=0,
but also has children.

> diff --git a/mm/page_counter.c b/mm/page_counter.c
> index b24a60b28bb0..8901b184b9d5 100644
> --- a/mm/page_counter.c
> +++ b/mm/page_counter.c
> @@ -13,6 +13,9 @@
>  #include <linux/bug.h>
>  #include <asm/page.h>
>  
> +#define for_each_nonroot_ancestor(c, counter) \
> +	for ((c) = (counter); ((c) && ((c)->parent)); (c) = (c)->parent)
> +
>  static void propagate_protected_usage(struct page_counter *c,
>  				      unsigned long usage)
>  {
> @@ -20,9 +23,6 @@ static void propagate_protected_usage(struct page_counter *c,
>  	unsigned long low, min;
>  	long delta;
>  
> -	if (!c->parent)
> -		return;
> -
>  	min = READ_ONCE(c->min);
>  	if (min || atomic_long_read(&c->min_usage)) {
>  		protected = min(usage, min);
> @@ -68,7 +68,7 @@ void page_counter_charge(struct page_counter *counter, unsigned long nr_pages)
>  {
>  	struct page_counter *c;
>  
> -	for (c = counter; c; c = c->parent) {
> +	for_each_nonroot_ancestor(c, counter) {
>  		long new;
>  
>  		new = atomic_long_add_return(nr_pages, &c->usage);
> @@ -97,7 +97,7 @@ bool page_counter_try_charge(struct page_counter *counter,
>  {
>  	struct page_counter *c;
>  
> -	for (c = counter; c; c = c->parent) {
> +	for_each_nonroot_ancestor(c, counter) {
>  		long new;
>  		/*
>  		 * Charge speculatively to avoid an expensive CAS.  If
> @@ -137,8 +137,11 @@ bool page_counter_try_charge(struct page_counter *counter,
>  	return true;
>  
>  failed:
> -	for (c = counter; c != *fail; c = c->parent)
> +	for_each_nonroot_ancestor(c, counter) {
> +		if (c == *fail)
> +			break;
>  		page_counter_cancel(c, nr_pages);
> +	}
>  
>  	return false;
>  }
> @@ -152,7 +155,7 @@ void page_counter_uncharge(struct page_counter *counter, unsigned long nr_pages)
>  {
>  	struct page_counter *c;
>  
> -	for (c = counter; c; c = c->parent)
> +	for_each_nonroot_ancestor(c, counter)
>  		page_counter_cancel(c, nr_pages);
>  }
>  
> @@ -211,7 +214,7 @@ void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages)
>  
>  	WRITE_ONCE(counter->min, nr_pages);
>  
> -	for (c = counter; c; c = c->parent)
> +	for_each_nonroot_ancestor(c, counter)
>  		propagate_protected_usage(c, atomic_long_read(&c->usage));
>  }
>  
> @@ -228,7 +231,7 @@ void page_counter_set_low(struct page_counter *counter, unsigned long nr_pages)
>  
>  	WRITE_ONCE(counter->low, nr_pages);
>  
> -	for (c = counter; c; c = c->parent)
> +	for_each_nonroot_ancestor(c, counter)
>  		propagate_protected_usage(c, atomic_long_read(&c->usage));
>  }


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
