Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE391FA2
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 11:06:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F30563C1D1D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 11:06:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 708B43C1814
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 11:06:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 14CF320021E
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 11:06:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B69BADEC
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:06:01 +0000 (UTC)
References: <20190812143941.8119-1-chrubis@suse.cz>
 <20190812143941.8119-2-chrubis@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190812143941.8119-2-chrubis@suse.cz>
Date: Mon, 19 Aug 2019 11:06:01 +0200
Message-ID: <877e79wmme.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 01/11] lib: Add support for guarded buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Cyril Hrubis <chrubis@suse.cz> writes:

> +
> +/*
> + * Buffer description consist of a pointer to a pointer and buffer type/size
> + * encoded as a different structure members.
> + *
> + * Only one of the size and iov_sizes can be set at a time.
> + */
> +struct tst_buffers {
> +	/*
> +	 * This pointer points to a buffer pointer.
> +	 */
> +	void *ptr;
> +	/*
> +	 * Buffer size.
> +	 */
> +	size_t size;
> +	/*
> +	 * Array of iov buffer sizes terminated by -1.
> +	 */
> +	int *iov_sizes;
> +};
> +
> +/*
> + * Allocates buffers based on the tst_buffers structure.
> + *
> + * @bufs NULL terminated array of test buffer descriptions.
> + *
> + * This is called from the test library if the tst_test->bufs pointer is set.
> + */
> +void tst_buffers_alloc(struct tst_buffers bufs[]);
> +
> +/*
> + * strdup() that callls tst_alloc().
> + */
> +char *tst_strdup(const char *str);
> +
> +/*
> + * Allocates size bytes, returns pointer to the allocated buffer.
> + */
> +void *tst_alloc(size_t size);
> +
> +/*
> + * Allocates iovec structure including the buffers.
> + *
> + * @sizes -1 terminated array of buffer sizes.
> + */
> +struct iovec *tst_iovec_alloc(int sizes[]);
> +
> +/*
> + * Frees all allocated buffers.
> + *
> + * This is called at the end of the test automatically.
> + */
> +void tst_free_all(void);

We could add guarded buffers to huge numbers of tests by wrapping the
user supplied buffer in various calls to SAFE_* macros and tst_*
functions. This could be configurable at compile time and it should be
detectable if a buffer is already guarded, so double wrapping should not
be an issue.

However I am not sure the current API makes this easy. We should
probably have a tst_free(void *buf) and/or tst_buffer_alloc(struct
tst_buffer *buf) and tst_buffer_free(struct tst_buffer *buf) (which
could just put the buffer on a free list for reuse).

I am not sure if this is something which needs to be addressed now or
can be left for another patch set. My main concern is that one of the
existing API functions will need to be changed.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
