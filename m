Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5429346F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 07:52:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB9503C56EA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 07:52:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 712153C2616
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 07:52:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CEA4810007EF
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 07:52:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE8A2AD7C;
 Tue, 20 Oct 2020 05:52:09 +0000 (UTC)
References: <87lfg2ob83.fsf@suse.de>
 <20201019095812.25710-1-rpalethorpe@suse.com>
 <CALvZod6FNH3cZfZxLSFXtQR5bV_2Tese0793Ve9rd1YNW22MKg@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Shakeel Butt <shakeelb@google.com>
In-reply-to: <CALvZod6FNH3cZfZxLSFXtQR5bV_2Tese0793Ve9rd1YNW22MKg@mail.gmail.com>
Date: Tue, 20 Oct 2020 06:52:08 +0100
Message-ID: <87mu0hwik7.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
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
Reply-To: rpalethorpe@suse.de
Cc: Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <guro@fb.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Shakeel,

Shakeel Butt <shakeelb@google.com> writes:
>>
>> V3: Handle common case where use_hierarchy=1 and update description.
>>
>>  mm/memcontrol.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 6877c765b8d0..34b8c4a66853 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -291,7 +291,7 @@ static void obj_cgroup_release(struct percpu_ref *ref)
>>
>>         spin_lock_irqsave(&css_set_lock, flags);
>>         memcg = obj_cgroup_memcg(objcg);
>> -       if (nr_pages)
>> +       if (nr_pages && (!mem_cgroup_is_root(memcg) || memcg->use_hierarchy))
>
> If we have non-root memcg with use_hierarchy as 0 and this objcg was
> reparented then this __memcg_kmem_uncharge() can potentially underflow
> the page counter and give the same warning.

Yes, although the kernel considers such a config to be broken, and
prints a warning to the log, it does allow it.

>
> We never set root_mem_cgroup->objcg, so, no need to check for root

I don't think that is relevant as we get the memcg from objcg->memcg
which is set during reparenting. I suppose however, we can determine if
the objcg was reparented by inspecting memcg->objcg.

> here. I think checking just memcg->use_hierarchy should be sufficient.

If we just check use_hierarchy then objects directly charged to the
memcg where use_hierarchy=0 will not be uncharged. However, maybe it is
better to check if it was reparented and if use_hierarchy=0.

>
>>                 __memcg_kmem_uncharge(memcg, nr_pages);
>>         list_del(&objcg->list);
>>         mem_cgroup_put(memcg);
>> @@ -3100,6 +3100,7 @@ static bool consume_obj_stock(struct obj_cgroup *objcg, unsigned int nr_bytes)
>>  static void drain_obj_stock(struct memcg_stock_pcp *stock)
>>  {
>>         struct obj_cgroup *old = stock->cached_objcg;
>> +       struct mem_cgroup *memcg;
>>
>>         if (!old)
>>                 return;
>> @@ -3110,7 +3111,9 @@ static void drain_obj_stock(struct memcg_stock_pcp *stock)
>>
>>                 if (nr_pages) {
>>                         rcu_read_lock();
>> -                       __memcg_kmem_uncharge(obj_cgroup_memcg(old), nr_pages);
>> +                       memcg = obj_cgroup_memcg(old);
>> +                       if (!mem_cgroup_is_root(memcg) || memcg->use_hierarchy)
>> +                               __memcg_kmem_uncharge(memcg, nr_pages);
>>                         rcu_read_unlock();
>>                 }
>>
>> --
>> 2.28.0
>>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
