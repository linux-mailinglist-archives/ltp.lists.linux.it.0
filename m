Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C5293ACD
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 14:02:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD6063C31B4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 14:02:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 17C963C26BE
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 14:02:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 997411400BF2
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 14:02:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01499ABD1;
 Tue, 20 Oct 2020 12:02:37 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook> <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
 <87k0vlwhzt.fsf@suse.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Roman Gushchin <guro@fb.com>
In-reply-to: <87k0vlwhzt.fsf@suse.de>
Date: Tue, 20 Oct 2020 13:02:35 +0100
Message-ID: <87h7qpw1es.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Shakeel
 Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@linux.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hello Roman,
>
> Roman Gushchin <guro@fb.com> writes:
>
>> -		page_counter_init(&memcg->memory, NULL);
>> -		page_counter_init(&memcg->swap, NULL);
>> -		page_counter_init(&memcg->kmem, NULL);
>> -		page_counter_init(&memcg->tcpmem, NULL);
>> +		/*
>> +		 * If use_hierarchy == false, consider all page counters direct
>> +		 * descendants of the corresponding root level counters.
>> +		 */
>> +		page_counter_init(&memcg->memory, &root_mem_cgroup->memory);
>> +		page_counter_init(&memcg->swap, &root_mem_cgroup->swap);
>> +		page_counter_init(&memcg->kmem, &root_mem_cgroup->kmem);
>> +		page_counter_init(&memcg->tcpmem, &root_mem_cgroup->tcpmem);
>> +
>>  		/*
>>  		 * Deeper hierachy with use_hierarchy == false doesn't make
>>  		 * much sense so let cgroup subsystem know about this
>
> Perhaps in this case, where the hierarchy is broken, objcgs should also
> be reparented directly to root? Otherwise it will still be possible to
> underflow the counter in a descendant of root which has use_hierarchy=0,
> but also has children.

Sorry ignore me, parent_mem_cgroup already selects root. So in the case
of a broken hierarchy objcgs are reparented directly to root.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
