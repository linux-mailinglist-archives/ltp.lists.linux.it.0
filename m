Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B15452D77CA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 15:28:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD2433C61B2
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 15:28:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1C4673C4B4D
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 15:28:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 87FE41A013D5
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 15:28:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E584B27F;
 Fri, 11 Dec 2020 14:28:07 +0000 (UTC)
Date: Fri, 11 Dec 2020 15:29:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <X9OCL/ZFVhKtkySv@yuki.lan>
References: <20201127071419.20370-1-lkml@jv-coder.de>
 <20201203153030.GE5809@yuki.lan>
 <f17f7936-5fd2-b217-e945-1409d9d40eeb@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f17f7936-5fd2-b217-e945-1409d9d40eeb@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I do wonder, are the counters flushed if task is migrated between CPUs?
> > If so we wouldn't need the multiplication by bcpus.
> IIRC, no they are not flushed and there wouldn't be any reason for that. 
> These counters are not supposed to account per cpu statistics, they are 
> just used to prevent lock contention. If a task is migrated to another 
> cpu and it's memory is freed there, the counter may become negative, 
> which is perfectly fine.
> Additionally this total batch size is the maximum amount, the global 
> counter can deviate from the real value. This takes into account all 
> processes running on all cpus, because the overcommit limit is a global 
> limit, not a per task one.

Sounds reasonable.

Btw I wonder if we can get into a situation where
commit_left < total_batch_size, but I guess that it's unlikely.

> > Can we please call the get_total_back_size_bytes() in the test setup and
> > store the value.
> I think I left this in the test function, because there is a slight 
> chance, that the value changes over time due to hotplug. If cpus are 
> added (really plugged into the system, not only enabled) or if there is 
> memory added, the value changes. In vms with memory ballooning, I think 
> this is more likely to happen. The cost is not very high, so why add the 
> possiblity to break this?

Well this does not fix the race, in a fact it does not even shrink the
race window that much. If the hotplug happens anwhere after the call to
the tst_ncpus_conf() it will still fail since the change will not be
reflected in the test anyways.

So I would prefer simply stating that the test results are undefined if
hotplug happens while the test is running and put the call to the test
setup. There are couple of NUMA tests in LTP that are not CPU hotplug
safe anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
