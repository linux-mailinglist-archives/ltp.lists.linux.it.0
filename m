Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4836B728
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 18:44:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77DF33C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 18:44:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E08BA3C27BB
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:44:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C322960083F
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:44:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 259D1ACFD;
 Mon, 26 Apr 2021 16:44:45 +0000 (UTC)
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-6-rpalethorpe@suse.com>
 <CAEemH2dkbD_-gRQeKKAh+H6vo8gb+s0dWCa1-mJ_1-eg0eLeAA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dkbD_-gRQeKKAh+H6vo8gb+s0dWCa1-mJ_1-eg0eLeAA@mail.gmail.com>
Date: Mon, 26 Apr 2021 17:44:44 +0100
Message-ID: <87fszdm1vn.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 5/7] docs: Update CGroups API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

>> +static void run(void)
>> +{
>> +       char buf[BUFSIZ];
>> +       size_t mem = 0;
>> +
>> +       cg_child = tst_cgroup_mk(cg, "child");
>> +       SAFE_CGROUP_PRINTF(cg_child, "cgroup.procs", "%d", getpid());
>> +
>> +       if (SAFE_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
>> +               SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+memory");
>> +       if (SAFE_CGROUP_VER(cg, "cpuset") != TST_CGROUP_V1)
>> +               SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+cpuset");
>>
>
> Kind reminder:
>
> If you decide to add controllers automatically (as I suggested in patch3/7)
> in
> tst_cgroup_mk(), then these lines should be removed.
>
>
>> +Another example of an edge case is the following.
>> +
>> +[source,c]
>>
>> +-------------------------------------------------------------------------------
>> +       if (tst_cgroup_ver(cg, "memory") == TST_CGROUP_V1)
>> +               SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", ~0UL);
>> +       else
>> +               SAFE_CGROUP_PRINT(cg, "memory.swap.max", "max");
>>
>
> typo PRINT --> PRINTF ^.

This function actually exists :-p

>
> Btw, these documented works are quite awesome!

Thanks!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
