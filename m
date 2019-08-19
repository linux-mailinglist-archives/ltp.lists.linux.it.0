Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A636392099
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 11:44:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DBF03C1CE4
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 11:44:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4F8483C18F7
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 11:44:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7E3D91400B61
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 11:44:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7F1BAF0B
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 09:44:40 +0000 (UTC)
References: <20190812143941.8119-1-chrubis@suse.cz>
 <20190812143941.8119-4-chrubis@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190812143941.8119-4-chrubis@suse.cz>
Date: Mon, 19 Aug 2019 11:44:40 +0200
Message-ID: <875zmtwktz.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 03/11] doc: Add guarded buffers documentation
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

Just nitpicking...

Cyril Hrubis <chrubis@suse.cz> writes:

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  doc/test-writing-guidelines.txt | 68 +++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index 573dd08d9..e5ee2fef0 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1699,6 +1699,74 @@ struct tst_test test = {
>  };
>  -------------------------------------------------------------------------------
>  
> +2.2.31 Guarded buffers
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> +The test library also supports guarded buffers, which are buffers allocated so
> +that:

Don't need 'also'

> +
> +* The end of the buffer is followed by PROT_NONE page
                                         ^ a
> +
> +* The rest of the page before the buffer is filled with random canary
         ^ remainder                                                     ^data

> +
> +Which means that the any access after the buffer with yield Segmentation
                                                    ^ will    ^ a
> +fault or EFAULT depending on if the access happened in userspace or kernel
                                                                      ^the
> +respectively. The canary before the buffer will also catch any write access
> +outside of the buffer.
> +
> +The purpose of the patch is to catch off-by-one bugs happening while buffers
                                                      ^ which happen
                                                      when buffers ...

> +and structures are passed to syscalls. New tests should allocate guarded
> +buffers for all data passed to the tested syscall which are passed by a
> +pointer.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +#include "tst_test.h"
> +
> +static struct foo *foo_ptr;
> +static struct iovec *iov;
> +static void *buf_ptr;
> +static char *id;
> +...
> +
> +static void run(void)
> +{
> +	...
> +
> +	foo_ptr->bar = 1;
> +	foo_ptr->buf = buf_ptr;
> +
> +	...
> +}
> +
> +static void setup(void)
> +{
> +	...
> +
> +	id = tst_strdup(string);
> +
> +	...
> +}
> +
> +static struct tst_test test = {
> +	...
> +	.bufs = (struct tst_buffers []) {
> +		{&foo_ptr, .size = sizeof(*foo_ptr)},
> +		{&buf_ptr, .size = BUF_SIZE},
> +		{&iov, .iov_sizes = (int[]){128, 32, -1},
> +		{}
> +	}
> +};
> +-------------------------------------------------------------------------------
> +
> +Guarded buffers can be allocated on runtime in a test setup() by a
                                    ^ at                        ^ function
> +'tst_alloc()' or by 'tst_strdup()' as well as by filling up the .bufs array in
^ call to

> +the tst_test structure.
> +
> +So far the tst_test structure supports allocating either a plain buffer by
> +setting up the size or struct iovec, which is allocated recursively including
> +the individual buffers as described by an '-1' terminated array of buffer
> +sizes.
>  
>  2.3 Writing a testcase in shell
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -- 
> 2.21.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
