Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41D2CDA23
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:29:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DC1E3C4CA3
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:29:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 56D693C246E
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:29:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D083B1A01063
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:29:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D0C7AC65;
 Thu,  3 Dec 2020 15:29:36 +0000 (UTC)
Date: Thu, 3 Dec 2020 16:30:30 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201203153030.GE5809@yuki.lan>
References: <20201127071419.20370-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127071419.20370-1-lkml@jv-coder.de>
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
> +static long get_total_batch_size_bytes(void)
> +{
> +	struct sysinfo info;
> +	long ncpus = tst_ncpus_conf();
> +	long pagesize = getpagesize();
> +	SAFE_SYSINFO(&info);
> +
> +	/* see linux source mm/mm_init.c mm_compute_batch() (This is in pages) */
> +	long batch_size = MAX(
> +			ncpus * 2,
> +			MAX(
> +				32,
> +				MIN(
> +					INT32_MAX,
> +					(long)(info.totalram / pagesize) / ncpus / 256
> +				)
> +			)
> +		);
> +
> +	/* there are ncpu separate counters, that can all grow up to
> +	 * batch_size. So the maximum error for __vm_enough_memory is
> +	 * batch_size * ncpus. */
> +	return batch_size * ncpus * pagesize;
> +}

This version looks better. However two (minor) comments for this
function still apply.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
