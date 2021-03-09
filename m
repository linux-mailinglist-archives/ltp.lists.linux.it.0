Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAF332AEA
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:46:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32A363C6A84
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:46:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A89B03C4BF0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:46:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4CD9E600C45
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:46:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C73DAE84;
 Tue,  9 Mar 2021 15:46:28 +0000 (UTC)
References: <20210302152510.15116-1-rpalethorpe@suse.com>
 <20210302152510.15116-6-rpalethorpe@suse.com> <YEeMKc9HO9lFv+r7@yuki.lan>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
In-reply-to: <YEeMKc9HO9lFv+r7@yuki.lan>
Date: Tue, 09 Mar 2021 15:46:27 +0000
Message-ID: <8735x4gwj0.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 5/7] docs: Update CGroups API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> +static void setup(void)
>> +{
>> +	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
>> +	cg = tst_cgroup_get_default();
>> +	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
>> +	SAFE_CGROUP_PRINTF(&cg->memory.max, "%lu", MEMSIZE);
>
> I've been looking at the API for a while and I do not understand why we
> need to create the tst_cgroup_files for each supported controller and
> each node in the hierarchy. Why can't we make this more driver-like? All
> we need to know is the controller type, cgroup version and file we want
> to read/write.
>
> If I were designing the API I would have made these so that they take a
> pointer to a cgroup node, controller type and filename, then the
> printf-like formatting.
>
> So the end result would look like:
>
> 	SAFE_CGROUP_PRINTF(cg, TST_CGROUP_MEMORY, "memory.max", "%lu", MEMSIZE);

If we use V2 naming the controller is always specified in the file
name. So we can just write.

SAFE_CGROUP_PRINTF(cg, "memory.max", ...);

So both you and Li Wang think this is too complex and I wasn't sure, so
I will respin it with a lookup table instead.

>
> Which would be build on the top of:
>
> int tst_cgroup_open(struct tst_cgroup *cg, enum tst_cgroup_ctrl ctrl, const char *fname);
>
> And instead of storing the file structures into the tst_cgroup structure
> we would translate the v2 to v1 on the fly. We would have to open and
> close the files on each printf/scanf but I do not think that it's
> unreasonable given the simplification of the interface.
>
> We would end up with a simple translation tables for different
> controllers instead of the structures that are allocated for each node
> then, such as:
>
> static const struct cgroup_map cgroup_memory_map[] = {
> 	{"memory.usage_in_bytes", "memory.current"},
> 	{"memory.limit_in_bytes", "memory.max"},
> 	{"memory.memsw.usage_in_bytes", "memory.swap.current"},
> 	{"memory.memsw.limitin_bytes", "memory.swap.max"},
> 	{}
> };
>
> Or is there a reason why this cannot be done so?
>
> -- 
> Cyril Hrubis
> chrubis@suse.cz


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
