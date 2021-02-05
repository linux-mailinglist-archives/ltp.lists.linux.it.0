Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7C310D76
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:57:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8F813C72FD
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:57:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 608723C70EF
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:57:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E01F01A01104
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:57:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BFCCAC43
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:57:00 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:56:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YB1qyucNa+aN3p2V@pevik>
References: <20210204110342.11821-1-mdoucha@suse.cz>
 <20210204110342.11821-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204110342.11821-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] Add safe functions for io_uring to LTP
 library
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +++ b/include/tst_safe_io_uring.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) Linux Test Project, 2021
> + */
> +
> +#ifndef TST_IO_URING_H__
> +#define TST_IO_URING_H__
> +
> +#include "config.h"
> +#include "lapi/io_uring.h"
> +
> +struct tst_io_uring {
> +	int fd;
> +	void *sqr_base, *cqr_base;
> +	/* buffer sizes in bytes for unmapping */
> +	size_t sqr_mapsize, cqr_mapsize;
> +
> +	/* Number of entries in the ring buffers */
> +	uint32_t sqr_size, cqr_size;
> +
> +	/* Submission queue pointers */
> +	struct io_uring_sqe *sqr_entries;
> +	const uint32_t *sqr_head, *sqr_mask, *sqr_flags, *sqr_dropped;
> +	uint32_t *sqr_tail, *sqr_array;
> +
> +	/* Completion queue pointers */
> +	const struct io_uring_cqe *cqr_entries;
> +	const uint32_t *cqr_tail, *cqr_mask, *cqr_overflow;
> +	uint32_t *cqr_head;
> +
nit: blank line.
> +};
...

> +++ b/lib/tst_safe_io_uring.c
...
> +	uring->sqr_base = safe_mmap(file, lineno, NULL, uring->sqr_mapsize,
> +		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
> +		IORING_OFF_SQ_RING);
> +
> +	if (uring->sqr_base == MAP_FAILED)
> +		return -1;
IMHO this is not needed, safe_mmap() breaks on rval == MAP_FAILED.
> +
> +	uring->sqr_entries = safe_mmap(file, lineno, NULL,
> +		params->sq_entries * sizeof(struct io_uring_sqe),
> +		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
> +		IORING_OFF_SQES);
> +
> +	if (uring->sqr_entries == MAP_FAILED)
> +		return -1;
And here.
> +
> +	uring->cqr_base = safe_mmap(file, lineno, NULL, uring->cqr_mapsize,
> +		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
> +		IORING_OFF_CQ_RING);
> +
> +	if (uring->cqr_base == MAP_FAILED)
> +		return -1;
And here.

No need to repost, these two can be removed before merge.
The rest LGTM.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
