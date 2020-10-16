Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24228FDA8
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 07:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 845EF3C2665
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 07:41:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 244533C247B
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 07:41:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 911361A008B1
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 07:40:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9BECADC2;
 Fri, 16 Oct 2020 05:40:58 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201014200833.GA19363@carbon.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Roman Gushchin <guro@fb.com>
In-reply-to: <20201014200833.GA19363@carbon.lan>
Date: Fri, 16 Oct 2020 06:40:57 +0100
Message-ID: <87v9fasp7a.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
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
Reply-To: rpalethorpe@suse.de
Cc: linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@linux.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Roman,

Roman Gushchin <guro@fb.com> writes:

> Hi Richard!
>
>> SLAB objects which outlive their memcg are moved to their parent
>> memcg where they may be uncharged. However if they are moved to the
>> root memcg, uncharging will result in negative page counter values as
>> root has no page counters.
>> 
>> To prevent this, we check whether we are about to uncharge the root
>> memcg and skip it if we are. Possibly instead; the obj_cgroups should
>> be removed from their slabs and any per cpu stocks instead of
>> reparenting them to root?
>
> It would be really complex. I think your fix is totally fine.
> We have similar checks in cancel_charge(), uncharge_batch(),
> mem_cgroup_swapout(), mem_cgroup_uncharge_swap() etc.
>
>
> Acked-by: Roman Gushchin <guro@fb.com>
>
> Thanks!

Great I will respin.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
