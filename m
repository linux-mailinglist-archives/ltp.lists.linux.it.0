Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488B64A340
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 15:27:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1C623CBE40
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 15:27:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2482E3CA4DD
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 15:27:15 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ABB881400532
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 15:27:14 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C765D337DC;
 Mon, 12 Dec 2022 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670855233;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ua/5/FVHTVBJVbYXNz/l2byh+C4aJ9gDatMOSbMz6bo=;
 b=QBnOTnw7Yu5uhFS2rHJ/y1PClxL4rWdkghyI2MJQs5nUr2hyiHkvxwPu5e2BCGiKXwwzUS
 2+gXcMS/gbdy1S/pWeHKUrguVsR0bFaW0ok1dIAhGwFrEnH2m+Sj+WOQnFUmwyHO4+j1MC
 EZqaf7RfPHzX7XqWB0yNK1iLsfL6Mu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670855233;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ua/5/FVHTVBJVbYXNz/l2byh+C4aJ9gDatMOSbMz6bo=;
 b=shtlK8bHr+JKMV+GjljlgPfZJW1DyTfyXd9p8nkSL5sKJefEFYRfjsfnxSQuF/H7wClue3
 3SJcBhsoRMuCd5BA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 79F842C141;
 Mon, 12 Dec 2022 14:27:13 +0000 (UTC)
References: <20221201122844.142062-1-tsahu@linux.ibm.com>
 <20221201122844.142062-7-tsahu@linux.ibm.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Tarun Sahu <tsahu@linux.ibm.com>
Date: Mon, 12 Dec 2022 14:26:56 +0000
Organization: Linux Private Site
In-reply-to: <20221201122844.142062-7-tsahu@linux.ibm.com>
Message-ID: <87zgbsu27z.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/8] Hugetlb: Migrating libhugetlbfs
 map_high_truncate_2
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
Cc: aneesh.kumar@linux.ibm.com, ltp@lists.linux.it, sbhat@linux.ibm.com,
 geetika@linux.ibm.com, vaibhav@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Tarun Sahu <tsahu@linux.ibm.com> writes:

> Migrating the libhugetlbfs/testcases/map_high_truncate_2.c test
>
> Test Description: At one stage, a misconversion of hugetlb_vmtruncate_list
> to a prio_tree meant that on 32-bit machines, certain combinations of
> mapping and truncations could truncate incorrect pages, or
> overwrite pmds from other VMAs, triggering BUG_ON()s or other
> wierdness.
>
> Test adapted from an example by Kenneth Chen <kenneth.w.chen@intel.com>
>
> WARNING: The offsets and addresses used within are specifically
> calculated to trigger the bug as it existed.  Don't mess with them
> unless you *really* know what you're doing.
>
> The kernel bug in question was fixed with
> 'commit 856fc2950555 ("[PATCH] hugetlb: fix prio_tree unit")'.
>
> Signed-off-by: Tarun Sahu <tsahu@linux.ibm.com>
Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
