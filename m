Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF88D2C1B76
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 03:39:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BA823C6088
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 03:39:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2A0EE3C2449
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 03:39:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 80B511A00357
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 03:39:24 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,364,1599494400"; d="scan'208";a="101680097"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Nov 2020 10:39:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 419B24CE547A;
 Tue, 24 Nov 2020 10:39:19 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 24 Nov 2020 10:39:17 +0800
Message-ID: <5FBC7254.6070801@cn.fujitsu.com>
Date: Tue, 24 Nov 2020 10:39:16 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>, Viresh Kumar <viresh.kumar@linaro.org>
References: <b758999c1bd02a52a68cbb6449bb3d82dd2a4e69.1606120441.git.viresh.kumar@linaro.org>
 <20201123140630.GA17077@yuki.lan>
In-Reply-To: <20201123140630.GA17077@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 419B24CE547A.ADD83
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] syscalls: Add tests for name_to_handle_at()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Viresh
> Hi!
>> diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
>> new file mode 100644
>> index 000000000000..19c08545802a
>> --- /dev/null
>> +++ b/include/lapi/name_to_handle_at.h
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 Linaro Limited. All rights reserved.
>> + * Author: Viresh Kumar<viresh.kumar@linaro.org>
>> + */
>> +
>> +#ifndef NAME_TO_HANDLE_AT_H__
>> +#define NAME_TO_HANDLE_AT_H__
>> +
>> +#include<sys/syscall.h>
>> +#include "config.h"
>> +#include "tst_buffers.h"
>> +#include "tst_test.h"
>> +
>> +#ifndef HAVE_NAME_TO_HANDLE_AT
>> +struct file_handle {
>> +	unsigned int handle_bytes;
>> +	int handle_type;
>> +	/* File identifier.  */
>> +	unsigned char f_handle[0];
>> +};
>> +
>> +int name_to_handle_at(int dfd, const char *pathname, struct file_handle *handle,
>> +		      int *mount_id, int flags);
>> +int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
>
> This still is not complete solution. As far as I can tell this will fail
> to link on machine where libc does not implement these, so we have to
> make them static inline functions that actually call the tst_syscall().
>
Agree.

> Eitherway these functions were added to glibc 2.14 which is 2011 which
> seems to be old enough, but I'm not sure about musl libc support. Does
> anyone have an idea?
>
musl libc supports them since 2018.9 after this patch[1] and it is about 
2 year ago. We should add a fallback for it like setns.h.

[1]https://git.musl-libc.org/cgit/musl/commit/?id=3e14bbcd1979376b188bfabb816ff828608fb5d7
>> +#endif
>> +
>> +/* Returns a valid pointer on success, NULL on errors */
>> +static inline struct file_handle *
>> +allocate_file_handle(int dfd, const char *pathname)
>> +{
>> +	struct file_handle fh = {}, *fhp;
>> +	int mount_id;
>> +
>> +	/*
>> +	 * Make an initial call to name_to_handle_at() to discover the size
>> +	 * required for the file handle.
>> +	 */
>> +	TEST(name_to_handle_at(dfd, pathname,&fh,&mount_id, 0));
>> +	if (TST_RET != -1 || TST_ERR != EOVERFLOW) {
>> +		tst_res(TFAIL | TTERRNO,
>> +			"name_to_handle_at() should fail with EOVERFLOW");
>> +		return NULL;
>> +	}
>> +
>> +	/* Valid file handle */
>> +	fhp = tst_alloc(sizeof(*fhp) + fh.handle_bytes);
>> +	fhp->handle_type = fh.handle_type;
>> +	fhp->handle_bytes = fh.handle_bytes;
>> +
>> +	return fhp;
>> +}
>> +
>> +#endif /* NAME_TO_HANDLE_AT_H__ */
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index a5363277f478..65f2e58a87e4 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -846,6 +846,9 @@ nanosleep01 nanosleep01
>>   nanosleep02 nanosleep02
>>   nanosleep04 nanosleep04
>>
>> +name_to_handle_at01 name_to_handle_at01
>> +name_to_handle_at02 name_to_handle_at02
>> +
>>   nftw01 nftw01
>>   nftw6401 nftw6401
>>
>> diff --git a/testcases/kernel/syscalls/name_to_handle_at/.gitignore b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
>> new file mode 100644
>> index 000000000000..268a8a34f85e
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
>> @@ -0,0 +1,2 @@
>> +name_to_handle_at01
>> +name_to_handle_at02
>> diff --git a/testcases/kernel/syscalls/name_to_handle_at/Makefile b/testcases/kernel/syscalls/name_to_handle_at/Makefile
>> new file mode 100644
>> index 000000000000..18896b6f28c0
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/name_to_handle_at/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +top_srcdir		?= ../../../..
>> +
>> +include $(top_srcdir)/include/mk/testcases.mk
>> +
>> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
>> new file mode 100644
>> index 000000000000..1213654d108f
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
>> @@ -0,0 +1,113 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 Viresh Kumar<viresh.kumar@linaro.org>
>> + */
>> +
>> +/*\
>> + * [DESCRIPTION]
>> + *
>> + * Basic name_to_handle_at() tests.
>> + *
>> + * [ALGORITHM]
>> + *  - Check that EOVERFLOW is returned as expected by name_to_handle_at().
>> + *  - Check that we were able to access a file's stat with name_to_handle_at()
>> + *    and open_by_handle_at().
>> +\*/
>> +#define _GNU_SOURCE
>> +#include<fcntl.h>
>> +#include<sys/stat.h>
>> +#include "lapi/name_to_handle_at.h"
>> +
>> +#define TEST_FILE "test_file"
>> +#define TEST_DIR "test_dir"
>> +
>> +static int dir_fd, fd_atcwd = AT_FDCWD;
>> +static struct file_handle *fhp;
>> +
>> +static struct tcase {
>> +	int *dfd;
>> +	const char *pathname;
>> +	int name_flags;
>> +	int flags;
>> +} tcases[] = {
>> +	{&dir_fd, TEST_FILE, 0, O_RDWR},
>> +	{&dir_fd, TEST_FILE, 0, O_RDONLY},
>> +	{&dir_fd, TEST_FILE, 0, O_WRONLY},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
>> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
>> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
>> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
>> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
>> +	{&dir_fd, "", AT_EMPTY_PATH, O_RDONLY},
>> +
>> +	{&fd_atcwd, TEST_FILE, 0, O_RDWR},
>> +	{&fd_atcwd, TEST_FILE, 0, O_RDONLY},
>> +	{&fd_atcwd, TEST_FILE, 0, O_WRONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
>> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
>> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
>> +	{&fd_atcwd, "", AT_EMPTY_PATH, O_RDONLY},
>
> Reading manual we can supposedly pass a dirfd reffering to a file with
> AT_EMPTY_PATH, so we may as well add that test here as well.
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
