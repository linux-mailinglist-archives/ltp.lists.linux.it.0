Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EE36A437
	for <lists+linux-ltp@lfdr.de>; Sun, 25 Apr 2021 04:38:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA0493C6996
	for <lists+linux-ltp@lfdr.de>; Sun, 25 Apr 2021 04:38:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 345213C2949
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 04:38:38 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D31AE1A00659
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 04:38:36 +0200 (CEST)
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FSXFD4y8Cz5tWx
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 10:35:28 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sun, 25 Apr 2021 10:38:32 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Sun, 25 Apr 2021 10:38:32 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/getdtablesize: Update to the new api
Thread-Index: Adc5eAvcgOpDIzK8Ty2KFDSMKkxFdA==
Date: Sun, 25 Apr 2021 02:38:32 +0000
Message-ID: <3994ca6745484df182d5f4e9abd2b7a1@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getdtablesize: Update to the new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Thanks for your review!

I have some different opinions:

1) 
>> +	if (getrlimit(RLIMIT_NOFILE, &rlp))
>> +		max_val_opfiles = FILE_OPEN_MAX;
>> +	else
>> +		max_val_opfiles = (rlim_t)rlp.rlim_cur;

>Why do we fallback to sysconf() here? Does hte getrlmit() fail in some cases? The original test just called getrlimit() and I do not remmeber it failing.

In man 3 getdtablesize, we can see that the glibc version of getdtablesize() calls getrlimit(2) and returns the current RLIMIT_NOFILE limit, or OPEN_MAX when that fails,
So max_val_opfiles may be equal to SAFE_SYSCONF(_SC_OPEN_MAX) or  (rlim_t)rlp.rlim_cur.

In this case, just replace the getrlimit with SAFE_GETRLIMIT will be ok?

2)
> > +	while (1) {
> > +		temp_fd = open(TESTFILE, O_CREAT | O_RDONLY, 0755);
> > +		if (temp_fd == -1)
> > +			break;
> > +		fd[count++] = temp_fd;
> > +	}
> 
> Here we blindly assume that the file descriptors will fit into the table,
> which may not be true if the system is broken.
> 
> Also why do we need the array in the first place? The file descriptors
> _are_ allocated continuously so the last fd we get from the open() call is
> the maximal number of fds - 1, since the standard streams start at 0.
> Technically we can even close the these descriptors if we store the first fd
> we got from the open() call since the rest of fds will be in the range,
> [first_fd, last_fd].

For closing all the opened fds before test exit, I used a array to save the opend fds. And the array size is OPEN_MAX.
In my opinion, the size seems be enough in this case.


Thanks so much!

Best Regards,
Gongyi


> 
> Hi!
> > --- a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> > +++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> > @@ -1,119 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> >  /*
> >   * Copyright (c) International Business Machines  Corp., 2005
> >   * Copyright (c) Wipro Technologies Ltd, 2005.  All Rights Reserved.
> >   *
> > - * This program is free software; you can redistribute it and/or
> > modify it
> > - * under the terms of version 2 of the GNU General Public License as
> > - * published by the Free Software Foundation.
> 
> This is GPL-2.0 so the SPDX has to be without the -or-later part here.
> 
> > +#define TESTFILE "getdtablesize01_testfile"
> 
> This can be just "testfile" the test teporary directory is already unique
> enough and has getdtablesize in it's name.
> 
> > +#define FILE_OPEN_MAX SAFE_SYSCONF(_SC_OPEN_MAX)
> >
> > -char *TCID = "getdtablesize01";
> > -int TST_TOTAL = 1;
> > +static int *fd, count;
> >
> > -int main(void)
> > +static void run(void)
> >  {
> > -	int table_size, fd = 0, count = 0;
> > +	int temp_fd;
> >  	int max_val_opfiles;
> >  	struct rlimit rlp;
> >
> > -	setup();
> > -	table_size = getdtablesize();
> > -	getrlimit(RLIMIT_NOFILE, &rlp);
> > -	max_val_opfiles = (rlim_t) rlp.rlim_cur;
> > -
> > -	tst_resm(TINFO,
> > -		 "Maximum number of files a process can have opened is %d",
> > -		 table_size);
> > -	tst_resm(TINFO,
> > -		 "Checking with the value returned by
> getrlimit...RLIMIT_NOFILE");
> > -
> > -	if (table_size == max_val_opfiles)
> > -		tst_resm(TPASS, "got correct dtablesize, value is %d",
> > -			 max_val_opfiles);
> > -	else {
> > -		tst_resm(TFAIL, "got incorrect table size, value is %d",
> > -			 max_val_opfiles);
> > -		cleanup();
> > -	}
> > +	TEST(getdtablesize());
> > +	tst_res(TINFO,
> > +		"Maximum number of files a process can have opened is %d",
> > +		TST_RET);
> >
> > -	tst_resm(TINFO,
> > -		 "Checking Max num of files that can be opened by a
> process.Should be: RLIMIT_NOFILE - 1");
> > -	for (;;) {
> > -		fd = open("/etc/hosts", O_RDONLY);
> > +	tst_res(TINFO, "Checking with the value returned by getrlimit");
> >
> > -		if (fd == -1)
> > -			break;
> > -		count = fd;
> > +	if (getrlimit(RLIMIT_NOFILE, &rlp))
> > +		max_val_opfiles = FILE_OPEN_MAX;
> > +	else
> > +		max_val_opfiles = (rlim_t)rlp.rlim_cur;
> 
> Why do we fallback to sysconf() here? Does hte getrlmit() fail in some
> cases? The original test just called getrlimit() and I do not remmeber it
> failing.
> 
> > -#ifdef DEBUG
> > -		printf("Opened file num %d\n", fd);
> > -#endif
> > -	}
> > +	if (TST_RET == max_val_opfiles)
> > +		tst_res(TPASS, "got correct dtablesize, value is %d "
> > +			"max_val_opfiles value is %d",
> > +			TST_RET, max_val_opfiles);
> > +	else
> > +		tst_res(TFAIL, "got incorrect dtablesize, value is %d"
> > +			 "max_val_opfiles value is %d",
> > +			 TST_RET, max_val_opfiles);
> 
> The LKML coding style says that we shouldn't break strings even if they are
> over 80 characters.
> 
> > -//Now the max files opened should be RLIMIT_NOFILE - 1 , why ? read
> > getdtablesize man page
> > +	tst_res(TINFO,
> > +		"Checking Max num of files that can be opened by a process."
> > +		"Should be: RLIMIT_NOFILE - 1");
> >
> > -	if (count > 0)
> > -		close(count);
> > -	if (count == (max_val_opfiles - 1))
> > -		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
> > -	else if (fd < 0 && errno == ENFILE)
> > -		tst_brkm(TCONF, cleanup, "Reached maximum number of open
> files for the system");
> > -	else
> > -		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));
> > +	while (1) {
> > +		temp_fd = open(TESTFILE, O_CREAT | O_RDONLY, 0755);
> > +		if (temp_fd == -1)
> > +			break;
> > +		fd[count++] = temp_fd;
> > +	}
> 
> Here we blindly assume that the file descriptors will fit into the table,
> which may not be true if the system is broken.
> 
> Also why do we need the array in the first place? The file descriptors
> _are_ allocated continuously so the last fd we get from the open() call is
> the maximal number of fds - 1, since the standard streams start at 0.
> Technically we can even close the these descriptors if we store the first fd
> we got from the open() call since the rest of fds will be in the range,
> [first_fd, last_fd].
> 
> > -	cleanup();
> > -	tst_exit();
> > +	if (fd[count - 1] == (max_val_opfiles - 1))
> > +		tst_res(TPASS,
> > +			"max open file fd is correct, %d = %d",
> > +			fd[count - 1], (max_val_opfiles - 1));
> > +	else if (temp_fd < 0 && errno == ENFILE)
> > +		tst_brk(TCONF,
> > +			"Reached maximum number of open files for the system");
> > +	else
> > +		tst_res(TFAIL | TERRNO, "%d != %d", fd[count - 1],
> (max_val_opfiles
> > +- 1));
> >  }
> >
> > -void setup(void)
> > +static void setup(void)
> >  {
> > -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> > -
> > -	TEST_PAUSE;
> > +	fd = SAFE_MALLOC(FILE_OPEN_MAX * sizeof(int));
> >  }
> >
> > -void cleanup(void)
> > +static void cleanup(void)
> >  {
> > +	int i;
> > +	for (i = 0; i < count; i++)
> > +		SAFE_CLOSE(fd[i]);
> > +
> > +	free(fd);
> > +	fd = NULL;
> >  }
> > +
> > +static struct tst_test test = {
> > +	.needs_tmpdir = 1,
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.cleanup = cleanup,
> > +};
> > +
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
