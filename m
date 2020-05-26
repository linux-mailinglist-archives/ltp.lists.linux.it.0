Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 331B91D2F30
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 14:09:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC9953C2219
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 14:09:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D0D5B3C094C
 for <ltp@lists.linux.it>; Thu, 14 May 2020 14:09:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9C920601A0E
 for <ltp@lists.linux.it>; Thu, 14 May 2020 14:09:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82F5CAD31;
 Thu, 14 May 2020 12:09:28 +0000 (UTC)
Date: Thu, 14 May 2020 14:09:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200514120954.GA4176@yuki.lan>
References: <20200514084157.30625-1-vikas.kumar2@arm.com>
 <20200514084157.30625-2-vikas.kumar2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514084157.30625-2-vikas.kumar2@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscall: Add io_uring test
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
Cc: ltp@lists.linux.it, viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Added Linux asynchronous I/O API Test for
> io_uring_setup(), io_uring_register() and io_uring_enter().
> This test will check io_uring api basic operation.
> 
> Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
> ---
>  testcases/kernel/syscalls/io_uring/Makefile   |   8 +
>  .../kernel/syscalls/io_uring/io_uring01.c     | 194 ++++++++++++++++++
>  2 files changed, 202 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/io_uring/Makefile
>  create mode 100644 testcases/kernel/syscalls/io_uring/io_uring01.c
> 
> diff --git a/testcases/kernel/syscalls/io_uring/Makefile b/testcases/kernel/syscalls/io_uring/Makefile
> new file mode 100644
> index 000000000..24cd01ba8
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_uring/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2020 ARM Embedded Technologies Private Ltd. All rights reserved.
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/io_uring/io_uring01.c b/testcases/kernel/syscalls/io_uring/io_uring01.c
> new file mode 100644
> index 000000000..cfa1e5c9a
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_uring/io_uring01.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 ARM Embedded Technologies Private Ltd. All rights reserved.
> + * Author: Vikas Kumar <vikas.kumar2@arm.com>
> + *
> + * Added Test for Linux asynchronous I/O raw API: io_uring_setup(), io_uring_register() and io_uring_enter().
> + */
> +
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include "config.h"
> +#include "tst_test.h"
> +#include "lapi/io_uring.h"
> +
> +char *TCID = "io_uring01";

The TCID is old API, new API test shouldn't define that one.

> +static struct tcase {
> +	int test_count;
> +	int flag;
> +}tcases[] = {{1, 0},};
> +
> +#define QUEUE_DEPTH 1
> +#define BLOCK_SZ    1024
> +
> +struct io_sq_ring {
> +	unsigned *head;
> +	unsigned *tail;
> +	unsigned *ring_mask;
> +	unsigned *ring_entries;
> +	unsigned *flags;
> +	unsigned *array;
> +};
> +
> +struct io_cq_ring {
> +	unsigned *head;
> +	unsigned *tail;
> +	unsigned *ring_mask;
> +	unsigned *ring_entries;
> +	struct io_uring_cqe *cqes;
> +};
> +
> +struct submitter {
> +    int ring_fd;
> +    struct io_sq_ring sq_ring;
> +    struct io_uring_sqe *sqes;
> +    struct io_cq_ring cq_ring;
> +};

Are these copied from kernel headers? If so these should be part of the
lapi/io_uring.h instead...

> +struct file_info {
> +    off_t buff_sz;
> +    struct iovec iovecs[];      
> +};

There are trailing whitespaces there, you can use checkpatch.pl from the
linux kernel sources to check for style violations such as this one.

> +struct submitter *s;
> +struct file_info *fi;
> +sigset_t sig;
> +
> +int setup_io_uring_test(struct submitter *s) {

In LKML coding style the opening curly brace for functions has to be on
a separate line.

> +    struct io_sq_ring *sring = &s->sq_ring;
> +    struct io_cq_ring *cring = &s->cq_ring;
> +    struct io_uring_params p;
> +    void *ptr;
> +
> +    memset(&p, 0, sizeof(p));
> +    s->ring_fd = io_uring_setup(QUEUE_DEPTH, &p);
> +    if (-1 == s->ring_fd) {
> +	tst_res(TFAIL | TTERRNO, "io_uring setup return error");
> +        return 1;
> +    }

The indentation is wrong here.

> +    //submission queue ring buffer mapping
> +    ptr = mmap(0, p.sq_off.array + p.sq_entries * sizeof(__u32),
> +            PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
> +            s->ring_fd, IORING_OFF_SQ_RING);
> +    if (ptr == MAP_FAILED) {        
> +        return 1;
> +    }

You should use SAFE_MMAP() instead.

> +    // save global submission queue struct info
> +    sring->head = ptr + p.sq_off.head;
> +    sring->tail = ptr + p.sq_off.tail;
> +    sring->ring_mask = ptr + p.sq_off.ring_mask;
> +    sring->ring_entries = ptr + p.sq_off.ring_entries;
> +    sring->flags = ptr + p.sq_off.flags;
> +    sring->array = ptr + p.sq_off.array;
> +
> +    //submission queue entries ring buffer mapping
> +    s->sqes = mmap(0, p.sq_entries * sizeof(struct io_uring_sqe),
> +            PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
> +            s->ring_fd, IORING_OFF_SQES);
> +    if (s->sqes == MAP_FAILED) {        
> +        return 1;
> +    }
> +
> +    //completion queue ring buffer mapping
> +    ptr = mmap(0,
> +            p.cq_off.cqes + p.cq_entries * sizeof(struct io_uring_cqe),
> +            PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
> +            s->ring_fd, IORING_OFF_CQ_RING);
> +    if (ptr == MAP_FAILED) {
> +        return 1;
> +    }
> +
> +    //save global completion queue struct info
> +    cring->head = ptr + p.cq_off.head;
> +    cring->tail = ptr + p.cq_off.tail;
> +    cring->ring_mask = ptr + p.cq_off.ring_mask;
> +    cring->ring_entries = ptr + p.cq_off.ring_entries;
> +    cring->cqes = ptr + p.cq_off.cqes;
> +    
> +    return 0;
> +}
> +
> +int submit_to_uring_sq(struct submitter *s) {
> +
> +    unsigned index = 0, tail = 0, next_tail = 0;
> +    struct io_sq_ring *sring = &s->sq_ring;
> +    int ret;    
> +
> +    fi = malloc(sizeof(*fi));
> +    if (!fi) {
> +        return 1;
> +    }

We do have SAFE_MALLOC() as well, moreover these should be allocate
with the guaded buffers API, see:
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2231-guarded-buffers

> +    fi->buff_sz = BLOCK_SZ;
> +    fi->iovecs[index].iov_base = (void *)fi; 
> +    fi->iovecs[index].iov_len = (size_t)fi->buff_sz; 
> + 
> +    ret = io_uring_register(s->ring_fd, IORING_REGISTER_BUFFERS, fi->iovecs, QUEUE_DEPTH);
> +    if (0 != ret) {

Also it's not wrong it's very unusuall to put the constant on the left
size of the comparsion.

> +	tst_res(TFAIL | TTERRNO, "io_uring register return error: %d", ret);
> +        return 1;
> +    }    
> +
> +    //Submission queue entry addition to the tail of the SQE ring buffer
> +    next_tail = tail = *sring->tail;
> +    next_tail++;
> +    index = tail & *s->sq_ring.ring_mask;
> +    struct io_uring_sqe *sqe = &s->sqes[index];
> +    sqe->flags = 0;
> +    sqe->opcode = IORING_OP_NOP; 
> +    sqe->addr = (unsigned long) fi->iovecs;
> +    sqe->user_data = (unsigned long long) fi;
> +    sring->array[index] = index;
> +    tail = next_tail;
> +
> +    //Kernel to notice the tail update 
> +    if(*sring->tail != tail) {
> +        *sring->tail = tail;
> +    }

LKML prefers not to have curly braces around single line code blocks.

> +    ret =  io_uring_enter(s->ring_fd, 1, 1, IORING_ENTER_GETEVENTS, &sig);
> +    if(ret < 0) {
> +	tst_res(TFAIL | TTERRNO, "io_uring enter return error");
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void setup(void){
> +	int ret;
> +	s = malloc(sizeof(*s));
> +    	if (!s) {
> +        	return;
> +    	}
> +	memset(s, 0, sizeof(*s));
> +	ret = setup_io_uring_test(s);
> +	if (ret) {
> +		tst_res(TFAIL | TTERRNO, "io_uring setup status: %d", ret);
> +    	}	
> +}
> +
> +static void run(void){
> +	int ret;
> +	ret = submit_to_uring_sq(s);
> +	if (ret) {
> +		tst_res(TFAIL | TTERRNO, "io_uring submit status: %d", ret);
> +    	}else{
> +		tst_res(TPASS, "functionality of io_uring() is correct");
> +	}
> +}
> +
> +static void cleanup(void){
> +}

There is no point in defining empty cleanup function, just do not
initialize the .cleanup field in the test structure in that case.

> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = run,
> +	.cleanup = cleanup,	
> +	.tcnt = ARRAY_SIZE(tcases),
> +};
> +
> -- 
> 2.17.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
