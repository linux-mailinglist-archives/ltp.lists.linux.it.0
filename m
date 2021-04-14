Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DD35F123
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 12:01:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BF113C70D2
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 12:01:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BE7B3C0F6A
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 12:00:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7AD2E2009F9
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 12:00:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0A49AEC2;
 Wed, 14 Apr 2021 10:00:57 +0000 (UTC)
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B50C0@dggeml531-mbx.china.huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <87h7k92olk.fsf@suse.de>
In-reply-to: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B50C0@dggeml531-mbx.china.huawei.com>
Date: Wed, 14 Apr 2021 11:00:56 +0100
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=PDS_TONAME_EQ_TOLOCAL_SHORT,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

zhaogongyi <zhaogongyi@huawei.com> writes:

> Hi Richard,
>
> Calling setpgid in this testcase is aim to make the task group be controlled by memory.kmem.limit_in_bytes since we have set the pgid to cgroup.procs.
>

Please see cgroup_procs_write_start in cgroup/cgroup.c. It calls
find_task_by_vpid which interprets pid as PIDTYPE_PID not PIDTYPE_PGID.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
