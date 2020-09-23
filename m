Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AF2756CE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 13:03:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E51D83C4D4F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 13:03:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 885533C29EC
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 13:03:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B251D1A009A6
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 13:03:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 516AFADC4;
 Wed, 23 Sep 2020 11:03:57 +0000 (UTC)
References: <20200609095102.21153-1-liwang@redhat.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20200609095102.21153-1-liwang@redhat.com>
Date: Wed, 23 Sep 2020 12:03:17 +0100
Message-ID: <87pn6cycui.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Cc: chrubis@suze.cz, pvorel@suze.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> Many of our LTP tests need Control Group in the configuration,
> this patch makes cgroup unified mounting at setup phase to be
> possible. The method is extracted from mem.h with the purpose
> of extendible for further developing, and trying to compatible
> the current two versions of cgroup,
>
> It's hard to make all APIs be strictly consistent because there
> are many differences between v1 and v2. But it capsulate the detail
> of cgroup mounting in high-level functions, which will be easier
> to use cgroup without considering too much technical thing.   
>
> Btw, test get passed on RHEL7(x86_64), RHEL8(ppc64le),
> Fedora32(x86_64).

This appears to be broken on SUSE.

> +enum tst_cgroup_ver tst_cgroup_version(void)
> +{
> +	if (tst_cgroup_check("cgroup2")) {
> +		if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))

Unfortunately this is backwards: if a cgroup controller is mounted
(e.g. memory) in the v1 separated hierarchy then it is not available in
the cgroup v2 unified hierarchy even though the v2 unified hierarchy
exists.

So ksm{03,04} fails with:

safe_file_ops.c:299: BROK: Failed to close FILE
'/tmp/cgroup_mem/cgroup.subtree_control' at tst_cgroup.c:301: ENOENT (2)

because we have the memory controller (in fact all the controllers)
mounted in the V1 way, but we also have the cgroup2 mounted. If I
unmount the memory controller from V1 then the test passes.

Another potential problem is that it may be possible to remove access to
controllers some other way in which case you have to check
cgroup.controllers to see what is available. OTOH maybe this is not
possible because you mount a new cgroup2 hierarchy?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
