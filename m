Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC18063F
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Aug 2019 14:55:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90863C2044
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Aug 2019 14:55:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C3E793C1DC7
 for <ltp@lists.linux.it>; Sat,  3 Aug 2019 14:55:55 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D8D4D1000CAD
 for <ltp@lists.linux.it>; Sat,  3 Aug 2019 14:55:47 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id r3so53089537vsr.13
 for <ltp@lists.linux.it>; Sat, 03 Aug 2019 05:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7kL82HtEsnDaT5cQB9VDtwND9p8OzArEyJgrvkf0nE=;
 b=KvDkdtlIqNFWXEFB3EWmsz0oVT6JU1FHop/vQMFsx8Kl0CuMpCur/nIzw994th1vgW
 11oSSOZ8LvQvxVl5SAko6koH++FU4UQn1euat2sAt6CVm603utWduZgeV6rQTRS8ikrN
 sAWrp5FVMweEGQDslgFGxynhu5MIId64m1CmYaLnRQb8fnb/G0LTb8BgB/yLyvdfuBTq
 74rpi+ZGnX3JEqq/OnJzUbxPwjdXfiQ9X57gohnpGeblVxkHEq6ZxBazyQaPPd9AbcWe
 9uQ4FMSI98HhPAvVUd/3gFmDsYYSoyX8wvJdNoyQUPqrT3Uob5n3Rw/jF/BXkrGUKWfG
 2XWQ==
X-Gm-Message-State: APjAAAXAyQjNKlK9v8b76gEoh2FcgQwb90gICiwXHyII7M0SAdh9Mtlb
 jXeseSI51SNtDbBTCTm2CBDxKo57lzInN7ZFcKZqYdZT7D8=
X-Google-Smtp-Source: APXvYqxtYGinvmnFBeq40vszwYjDBOiPf4NsTpyYV3b5MfbyHSt0duPlSBNJ2x1x5gQf+nq+WFpbtyuCM7PZDvEjQbc=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr27300342vsq.179.1564836952234; 
 Sat, 03 Aug 2019 05:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
In-Reply-To: <20190801092616.30553-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sat, 3 Aug 2019 20:55:41 +0800
Message-ID: <CAEemH2dBj6Re=+booW5Lc77P1yumEbqP_4g6NMRPji-CtUG-aw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

This is a quite good idea to involve guard buffer in LTP testing. And
you patch set looks very clean & tidy, just have some few comments in
below.

On Thu, Aug 1, 2019 at 5:27 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> This commit adds a support for guarder buffers. Guarded buffer is a
> buffer allocated so that there is PROT_NONE page immediatelly after the
> end of the buffer i.e. any access after the buffer generates
> SEGFAULT/EFAULT etc.
>
> The library is hooked into the tst_test structure so that all you need
> is to fill up an NULL terminated array of buffer pointers and sizes to
> get the respective buffers allocated. The library supports allocating
> memory in test runtime as well as well as allocating more complex
> buffers, which currently are iovec vectors.
>
> All buffers are freeed automatically at the end of the test.
...

> + * Allocates size bytes, returns pointer to the allocated buffer.
> + */
> +void *tst_alloc(size_t size);

What about drawing a simple picture in the code comments? That can
help people to understand what kind of buffer structure the
tst_alloc() returned.

/*
 * Allocates size bytes, returns pointer to the allocated buffer.
 *
 * This is the structure of the allocated buferr:
 *
 * |<--  1 page  -->|                 |<--  1 page  -->|
 *
 * -----------------------------------------------------
 * | buf_shift | <-- bufs[i].size --> |  1 guard page  |
 * -----------------------------------------------------
 */
void *tst_alloc(size_t size);

> +++ b/include/tst_test.h
> @@ -35,6 +35,7 @@
>  #include "tst_path_has_mnt_flags.h"
>  #include "tst_sys_conf.h"
>  #include "tst_coredump.h"
> +#include "tst_buffers.h"
>
>  /*
>   * Reports testcase result.
> @@ -200,6 +201,11 @@ struct tst_test {
>          * test.
>          */
>         const char *const *needs_kconfigs;
> +
> +       /*
> +        * NULL-terminated array to be allocated buffers.
> +        */
> +       struct tst_buffers *bufs;

I tend to agree with Richard for this. Looks like adding such a new
field in tst_test struct is a little bit complicated. Maybe we can
define a series macro for doing that, which something likes:

TST_INIT_GUARD_BUFFER(ptr, size)
TST_INIT_IOVEC_GUARD_BUFFER(ptr, iov_sizes)

then, testcase just calling it in setup() if needed.

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
