Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FB375089
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 10:06:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 969343C56BD
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 10:06:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 36EBE3C0CBC
 for <ltp@lists.linux.it>; Thu,  6 May 2021 10:06:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9BAF600678
 for <ltp@lists.linux.it>; Thu,  6 May 2021 10:06:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11834B176;
 Thu,  6 May 2021 08:06:08 +0000 (UTC)
References: <20210504134100.20666-1-rpalethorpe@suse.com>
 <20210504134100.20666-4-rpalethorpe@suse.com>
 <CAEemH2dnRA==KvFE73_u4eeqYvWF_+8CjLK=w6D0cv5L+gNBnw@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dnRA==KvFE73_u4eeqYvWF_+8CjLK=w6D0cv5L+gNBnw@mail.gmail.com>
Date: Thu, 06 May 2021 09:06:07 +0100
Message-ID: <87tungl21c.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/7] Add new CGroups APIs
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

Hello Li,

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
> With my pleasure for patchset:
> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks for the reviews!

>
> Also, the below typos should be corrected (someone who merges these
> can help modify).
>
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -147,7 +147,7 @@ static const files_t cgroup_ctrl_files = {
>         /* procs exists on V1, however it was read-only until kernel v3.0. */
>         { "cgroup.procs", "tasks", 0 },
>         { "cgroup.subtree_control", NULL, 0 },
> -       { "cgroup.clone_children", "clone_children", 0 },
> +       { "cgroup.clone_children", "cgroup.clone_children", 0 },

+1

>         { }
>  };
>
> @@ -158,7 +158,7 @@ static const files_t memory_ctrl_files = {
>         { "memory.swap.current", "memory.memsw.usage_in_bytes", CTRL_MEMORY },
>         { "memory.swap.max", "memory.memsw.limit_in_bytes", CTRL_MEMORY },
>         { "memory.kmem.usage_in_bytes", "memory.kmem.usage_in_bytes",
> CTRL_MEMORY },
> -       { "memory.kmem.limit_in_bytes", "memory.kmem.usage_in_bytes",
> CTRL_MEMORY },
> +       { "memory.kmem.limit_in_bytes", "memory.kmem.limit_in_bytes",
> CTRL_MEMORY },
>         { }
>  };


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
