Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649B1EA56A
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 15:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DEA53C309E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 15:57:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 933723C2314
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 15:57:16 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 271B86009C3
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 15:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591019834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vL/PGE3cuBUu6ThyQWiaMghKkY4tBxm13Muzaff28Ck=;
 b=Ebx8irLOQONAPywMH9pRZoqhf3z9fo3ETMCfHL7O4PDFCgd67RobOEIN6NZ189T8jbAL98
 EZ1/w818KRC+qYD3vEWJ7TMrNhsVK+xPavivaJpmOms5Awdee2yIC4DnPe6o1fRoCtg38E
 HwqWXq4qS1KfWH2ZN3X1PS8x4BNCoCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-Wjmnld_jNG-FKJ9kqP1DRw-1; Mon, 01 Jun 2020 09:57:12 -0400
X-MC-Unique: Wjmnld_jNG-FKJ9kqP1DRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF563100CCC6
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 13:57:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8CF9579A3
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 13:57:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C205B86BF4;
 Mon,  1 Jun 2020 13:57:11 +0000 (UTC)
Date: Mon, 1 Jun 2020 09:57:11 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200601100459.32511-1-liwang@redhat.com>
References: <20200601100459.32511-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.30]
Thread-Topic: add new cgroup test API
Thread-Index: rALRZh0oJYAXVaWmywcA9A4aV54vGw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include "tst_test.h"
> +
> +static void run(void)
> +{
> +	...
> +
> +	tst_cgroup_move_current(PATH_TMP_CG1_MEM);
> +	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG1_MEM, MEMSIZE);

Goal for API is to hide differences between cgroup 1/2, but example above
is passing cgroup specific directory.

My suggestion was to have directory parameter relative to cgroup mount,
I didn't consider there would be need for mounting cgroup more than once
from single process. Is there such need?

Since there's only one global 'tst_cgroup_mnt_path', is there need to have
paths absolute? If we assume that single process will mount cgroup only once,
then all paths could be relative to 'tst_cgroup_mnt_path', and test doesn't
need to even use 'tst_cgroup_mnt_path'.

> +
> +static void tst_cgroup_set_path(const char *cgroup_dir)
> +{
> +	struct tst_cgroup_path *tst_cgroup_path, *a;
> +
> +	if (!cgroup_dir)
> +		tst_brk(TBROK, "Invalid cgroup dir, plese check cgroup_dir");
> +
> +	sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
> +	sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
> +
> +	/* To store cgroup path in the shared 'path' list */
> +	tst_cgroup_path = SAFE_MMAP(NULL, (sizeof(struct tst_cgroup_path)),
> +			PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, -1, 0);

I'm not sure I understand what is the reason to have tst_cgroup_path. Is it expected,
that mount and umount are called by different processes? It might be easier
to define API as per-process and require same process to call mount and umount.

> +	tst_cgroup_path->mnt_path = SAFE_MALLOC(strlen(tst_cgroup_mnt_path));
> +	tst_cgroup_path->new_path = SAFE_MALLOC(strlen(tst_cgroup_new_path));

Pointers are in shared memory, but content they point to is not, so it's accessible
only from process that called tst_cgroup_set_path().

Can you describe all different scenarios you wanted to support?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
