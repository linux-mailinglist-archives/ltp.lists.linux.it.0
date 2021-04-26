Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8436B568
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:07:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C93B3C675A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 17:07:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADEFC3C27BB
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:07:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D103060096A
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 17:07:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34591AB87;
 Mon, 26 Apr 2021 15:07:22 +0000 (UTC)
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-2-rpalethorpe@suse.com>
 <CAEemH2dqcf+GRL3P5SZKmOxvdvzFN1O1Y6NXoxG_DJ7GGpQmOg@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dqcf+GRL3P5SZKmOxvdvzFN1O1Y6NXoxG_DJ7GGpQmOg@mail.gmail.com>
Date: Mon, 26 Apr 2021 16:07:21 +0100
Message-ID: <87r1ixm6dy.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/7] API: Add safe openat, printfat,
 readat and unlinkat
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
> On Mon, Apr 12, 2021 at 10:55 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> Add 'at' variants for a number of system calls and LTP SAFE API
>> functions. This avoids using sprintf everywhere to build paths.
>>
>> Also adds tst_decode_fd which allows us to retrieve the path for an FD
>> for debugging purposes without having to store it ourselves. However
>> the proc symlink may not be available on some systems.
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  include/tst_safe_file_ops.h |  39 ++++++++
>>  lib/tst_safe_file_ops.c     | 171 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 210 insertions(+)
>>  create mode 100644 lib/tst_safe_file_ops.c
>>
>> diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
>> index 223eddd1f..dff6a793c 100644
>> --- a/include/tst_safe_file_ops.h
>> +++ b/include/tst_safe_file_ops.h
>> @@ -57,4 +57,43 @@
>>  #define TST_MOUNT_OVERLAY() \
>>         (mount_overlay(__FILE__, __LINE__, 0) == 0)
>>
>> +#define SAFE_OPENAT(dirfd, path, oflags, ...)                  \
>> +       safe_openat(__FILE__, __LINE__,                         \
>> +                   (dirfd), (path), (oflags), ## __VA_ARGS__)
>> +
>> +#define SAFE_FILE_READAT(dirfd, path, buf, nbyte)                      \
>> +       safe_file_readat(__FILE__, __LINE__,                            \
>> +                        (dirfd), (path), (buf), (nbyte))
>> +
>> +
>> +#define SAFE_FILE_PRINTFAT(dirfd, path, fmt, ...)                      \
>> +       safe_file_printfat(__FILE__, __LINE__,                          \
>> +                          (dirfd), (path), (fmt), __VA_ARGS__)
>> +
>> +#define SAFE_UNLINKAT(dirfd, path, flags)                              \
>> +       safe_unlinkat(__FILE__, __LINE__, (dirfd), (path), (flags))
>> +
>>
>
> The above macros are suggested to leave in this "tst_safe_file_ops.h"
> file.

I think this is just for legacy reasons. To separate new and old API
function definitions. These *at functions will never be in the old API
though.

>
> But, the function prototypes below should be moved to "safe_file_ops_fn.h",
> because that purposely to separate macros and function in different places.
> (I remember I had commented this in V2, probably you were missing it:)
>

Probably the best thing to do is create tst_safe_file_at.{c,h} and move
these functions there. This would be more consistent with the new API.

I think I was trying to think of a better solution, but then forgot
about it.

>
>
>> +char *tst_decode_fd(int fd);
>> +
>> +int safe_openat(const char *file, const int lineno,
>> +               int dirfd, const char *path, int oflags, ...);
>> +
>> +ssize_t safe_file_readat(const char *file, const int lineno,
>> +                        int dirfd, const char *path, char *buf, size_t
>> nbyte);
>> +
>> +int tst_file_vprintfat(int dirfd, const char *path, const char *fmt,
>> va_list va);
>> +int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)
>> +                       __attribute__ ((format (printf, 3, 4)));
>> +
>> +int safe_file_vprintfat(const char *file, const int lineno,
>> +                       int dirfd, const char *path,
>> +                       const char *fmt, va_list va);
>> +
>> +int safe_file_printfat(const char *file, const int lineno,
>> +                      int dirfd, const char *path, const char *fmt, ...)
>> +                       __attribute__ ((format (printf, 5, 6)));
>> +
>> +int safe_unlinkat(const char *file, const int lineno,
>> +                 int dirfd, const char *path, int flags);
>
> +
>>  #endif /* TST_SAFE_FILE_OPS */
>>
>
>
>
>> diff --git a/lib/tst_safe_file_ops.c b/lib/tst_safe_file_ops.c
>> new file mode 100644
>> index 000000000..af4157476
>> --- /dev/null
>> +++ b/lib/tst_safe_file_ops.c
>>
>
> And, we'd better achieve all the functions in "lib/safe_file_ops.c"
> but not create a separate new C file.

This would mean they all have a useless argument for the old API.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
