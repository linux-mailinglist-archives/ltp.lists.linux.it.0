Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA755955DB
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 11:05:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3264A3C97FA
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 11:05:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 39AC13C1FED
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 11:05:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2E4D560083A
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 11:05:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0846A1FAC5;
 Tue, 16 Aug 2022 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660640708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hSAZQm8Lbv8vR8eeVyursYoI2GHQ762SyRHdd0Kc8nI=;
 b=bE4gQXOV1CUts7qW8BQRQkBC5WIwVfSwTu8bq07egFJfGv8r/++axHLtRiBNGGyk5ulRfe
 gECCTkW+Siu9LYRSL3JnFhzGWlqRF4HvxIIkj1b0eZ5t+TnLz263hai2+Hky6UsQjAp+i2
 PYKEX7mQAjgU+f2kElkl+KrP0rGQB38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660640708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hSAZQm8Lbv8vR8eeVyursYoI2GHQ762SyRHdd0Kc8nI=;
 b=1Z8ytSRilpRRhGbTnCeSNmgDqYfD+FcExRwAPVqjU7ienxmA6V1g6F/sXqwq/aoYhpR9oO
 PeBe7Bg31xOI6+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8638B139B7;
 Tue, 16 Aug 2022 09:05:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W6zKH8Nd+2LnbgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 16 Aug 2022 09:05:07 +0000
Date: Tue, 16 Aug 2022 11:07:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YvteNq9F1YuhsD8J@yuki>
References: <20220811135731.2228-1-pvorel@suse.cz>
 <20220811135731.2228-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811135731.2228-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] mount03: Convert to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> --- a/testcases/kernel/syscalls/mount/mount03.c
> +++ b/testcases/kernel/syscalls/mount/mount03.c
> @@ -1,389 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> + * Copyright (c) Linux Test Project, 2022
>   * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

This is GPL-2.0 not GPL-2.0-or-later

> -/*
> - * DESCRIPTION
> - *	Check for basic mount(2) system call flags.
> +/*\
> + * [Description]
>   *
> - *	Verify that mount(2) syscall passes for each flag setting and validate
> - *	the flags
> - *	1) MS_RDONLY - mount read-only.
> - *	2) MS_NODEV - disallow access to device special files.
> - *	3) MS_NOEXEC - disallow program execution.
> - *	4) MS_SYNCHRONOUS - writes are synced at once.
> - *	5) MS_REMOUNT - alter flags of a mounted FS.
> - *	6) MS_NOSUID - ignore suid and sgid bits.
> - *	7) MS_NOATIME - do not update access times.
> + * Verify mount(2) for various flags.
>   */

Can we please be a bit more verbose here?

> +#include <stdio.h>
> +#include <stdlib.h>
>  #include <sys/types.h>
> -#include <sys/mount.h>
> -#include <sys/stat.h>
>  #include <sys/wait.h>
> -#include <assert.h>
> -#include <errno.h>
> -#include <fcntl.h>
>  #include <pwd.h>
> -#include <unistd.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -static void setup(void);
> -static void cleanup(void);
> -static int test_rwflag(int, int);
> -
> -char *TCID = "mount03";
> -int TST_TOTAL = 7;
> -
> -#define TEMP_FILE	"temp_file"
> -#define FILE_MODE	(S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
> -#define DIR_MODE	(S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP| \
> -			 S_IXGRP|S_IROTH|S_IXOTH)
> -#define SUID_MODE	(S_ISUID|S_IRUSR|S_IXUSR|S_IXGRP|S_IXOTH)
> -
> -static const char mntpoint[] = "mntpoint";
> -static const char *device;
> -static const char *fs_type;
> -static int fildes;
> -
> -static char write_buffer[BUFSIZ];
> -static char read_buffer[BUFSIZ];
> -static char path_name[PATH_MAX];
> +#include "old_resource.h"
> +#include "tst_test.h"
> +#include "lapi/mount.h"
> +
> +#define MNTPOINT        "mntpoint"
> +#define TESTBIN	"mount03_setuid_test"
> +#define TEST_STR "abcdefghijklmnopqrstuvwxyz"
> +#define FILE_MODE	0644
> +#define SUID_MODE	0511
> +
> +static int otfd;
> +static char wbuf[BUFSIZ];
> +static char rbuf[BUFSIZ];
>  static char file[PATH_MAX];
> +static uid_t nobody_uid;
> +static gid_t nobody_gid;
>  
> -long rwflags[] = {
> -	MS_RDONLY,
> -	MS_NODEV,
> -	MS_NOEXEC,
> -	MS_SYNCHRONOUS,
> -	MS_RDONLY,
> -	MS_NOSUID,
> -	MS_NOATIME,
> -};
> -
> -int main(int argc, char *argv[])
> +static void test_rdonly(void)
>  {
> -	int lc, i;
> -
> -	tst_parse_opts(argc, argv, NULL, NULL);
> -
> -	setup();
> +	snprintf(file, PATH_MAX, "%s/rdonly", MNTPOINT);
> +	TST_EXP_FAIL(otfd = open(file, O_CREAT | O_RDWR, 0700), EROFS);
> +}
>  
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +static void test_nodev(void)
> +{
> +	snprintf(file, PATH_MAX, "%s/nodev", MNTPOINT);
> +	SAFE_MKNOD(file, S_IFBLK | 0777, 0);
> +	TST_EXP_FAIL(otfd = open(file, O_RDWR, 0700), EACCES);
> +	SAFE_UNLINK(file);
> +}
>  
> -		tst_count = 0;
> +static void test_noexec(void)
> +{
> +	snprintf(file, PATH_MAX, "%s/noexec", MNTPOINT);
> +	otfd = SAFE_OPEN(file, O_CREAT | O_RDWR, 0700);
> +	TST_EXP_FAIL(execlp(file, basename(file), NULL), EACCES);
> +}
>  
> -		for (i = 0; i < TST_TOTAL; ++i) {
> +static void test_synchronous(void)
> +{
> +	strcpy(wbuf, TEST_STR);
> +	snprintf(file, PATH_MAX, "%s/synchronous", MNTPOINT);
> +	otfd = SAFE_OPEN(file, O_RDWR | O_CREAT, FILE_MODE);
> +	SAFE_WRITE(1, otfd, wbuf, strlen(wbuf));
> +	SAFE_LSEEK(otfd, 0, SEEK_SET);
> +	SAFE_READ(0, otfd, rbuf, sizeof(rbuf));
> +	TST_EXP_EQ_STR(rbuf, wbuf);
> +}

This is completely bogus check, this has to work regardless of the
MS_SYNCHRONOUS. The only way how to check MS_SYNCHRONOUS would be
pulling out the device just after write before page cache had a chance
to write out data but not before the disk flushes its caches.

I guess that it may be possible to check this if create a loop device,
mount it MS_SYNCHRONOUS, write to a file on the loop device and check
that the data has been written to the underlying file. But that would
be completely different and quite complex test.

> -			TEST(mount(device, mntpoint, fs_type, rwflags[i],
> -				   NULL));
> +static void test_remount(void)
> +{
> +	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, MS_REMOUNT, NULL);
> +	snprintf(file, PATH_MAX, "%s/remount", MNTPOINT);
> +	TST_EXP_FD(otfd = open(file, O_CREAT | O_RDWR, 0700));
> +}
>  
> -			if (TEST_RETURN != 0) {
> -				tst_resm(TFAIL | TTERRNO, "mount(2) failed");
> -				continue;
> -			}
> +static void test_nosuid(void)
> +{
> +	pid_t pid;
> +	int status;
> +
> +	pid = SAFE_FORK();
> +	if (!pid) {
> +		SAFE_SETGID(nobody_gid);
> +		SAFE_SETREUID(-1, nobody_uid);
> +		SAFE_EXECLP(TESTBIN, TESTBIN, NULL);
> +	}
>  
> -			/* Validate the rwflag */
> -			if (test_rwflag(i, lc) == 1)
> -				tst_resm(TFAIL, "mount(2) failed while"
> -					 " validating %ld", rwflags[i]);
> -			else
> -				tst_resm(TPASS, "mount(2) passed with "
> -					 "rwflag = %ld", rwflags[i]);
> +	SAFE_WAITPID(pid, &status, 0);
>  
> -			TEST(tst_umount(mntpoint));
> -			if (TEST_RETURN != 0)
> -				tst_brkm(TBROK | TTERRNO, cleanup,
> -					 "umount(2) failed for %s", mntpoint);
> +	if (WIFEXITED(status)) {
> +		switch (WEXITSTATUS(status)) {
> +		case EXIT_FAILURE:
> +			tst_res(TFAIL, "%s failed", TESTBIN);
> +			return;
> +		case EXIT_SUCCESS:
> +			tst_res(TPASS, "%s passed", TESTBIN);
> +			return;
> +		default:
> +		case TBROK:
> +			break;
>  		}
>  	}
>  
> -	cleanup();
> -	tst_exit();
> +	tst_brk(TBROK, "Child %s", tst_strstatus(status));
>  }
>  
> -/*
> - * test_rwflag(int i, int cnt)
> - * Validate the mount system call for rwflags.
> - */
> -int test_rwflag(int i, int cnt)
> +static void test_noatime(void)
>  {
> -	int ret, fd, pid, status;
> -	char nobody_uid[] = "nobody";
>  	time_t atime;
> -	struct passwd *ltpuser;
> -	struct stat file_stat;
> +	struct stat st;
>  	char readbuf[20];
>  
> -	switch (i) {
> -	case 0:
> -		/* Validate MS_RDONLY flag of mount call */
> -
> -		snprintf(file, PATH_MAX, "%stmp", path_name);
> -		fd = open(file, O_CREAT | O_RDWR, S_IRWXU);
> -		if (fd == -1) {
> -			if (errno == EROFS) {
> -				return 0;
> -			} else {
> -				tst_resm(TWARN | TERRNO,
> -					 "open didn't fail with EROFS");
> -				return 1;
> -			}
> -		}
> -		close(fd);
> -		return 1;
> -	case 1:
> -		/* Validate MS_NODEV flag of mount call */
> -
> -		snprintf(file, PATH_MAX, "%smynod_%d_%d", path_name, getpid(),
> -			 cnt);
> -		if (mknod(file, S_IFBLK | 0777, 0) == 0) {
> -			fd = open(file, O_RDWR, S_IRWXU);
> -			if (fd == -1) {
> -				if (errno == EACCES) {
> -					return 0;
> -				} else {
> -					tst_resm(TWARN | TERRNO,
> -						 "open didn't fail with EACCES");
> -					return 1;
> -				}
> -			}
> -			close(fd);
> -		} else {
> -			tst_resm(TWARN | TERRNO, "mknod(2) failed to create %s",
> -				 file);
> -			return 1;
> -		}
> -		return 1;
> -	case 2:
> -		/* Validate MS_NOEXEC flag of mount call */
> -
> -		snprintf(file, PATH_MAX, "%stmp1", path_name);
> -		fd = open(file, O_CREAT | O_RDWR, S_IRWXU);
> -		if (fd == -1) {
> -			tst_resm(TWARN | TERRNO, "opening %s failed", file);
> -		} else {
> -			close(fd);
> -			ret = execlp(file, basename(file), NULL);
> -			if ((ret == -1) && (errno == EACCES))
> -				return 0;
> -		}
> -		return 1;
> -	case 3:
> -		/*
> -		 * Validate MS_SYNCHRONOUS flag of mount call.
> -		 * Copy some data into data buffer.
> -		 */
> -
> -		strcpy(write_buffer, "abcdefghijklmnopqrstuvwxyz");
> -
> -		/* Creat a temporary file under above directory */
> -		snprintf(file, PATH_MAX, "%s%s", path_name, TEMP_FILE);
> -		fildes = open(file, O_RDWR | O_CREAT, FILE_MODE);
> -		if (fildes == -1) {
> -			tst_resm(TWARN | TERRNO,
> -				 "open(%s, O_RDWR|O_CREAT, %#o) failed",
> -				 file, FILE_MODE);
> -			return 1;
> -		}
> +	snprintf(file, PATH_MAX, "%s/noatime", MNTPOINT);
> +	TST_EXP_FD_SILENT(otfd = open(file, O_CREAT | O_RDWR, 0700));
>  
> -		/* Write the buffer data into file */
> -		if (write(fildes, write_buffer, strlen(write_buffer)) !=
> -		    (long)strlen(write_buffer)) {
> -			tst_resm(TWARN | TERRNO, "writing to %s failed", file);
> -			close(fildes);
> -			return 1;
> -		}
> +	SAFE_WRITE(1, otfd, TEST_STR, strlen(TEST_STR));
> +	SAFE_FSTAT(otfd, &st);
> +	atime = st.st_atime;
> +	sleep(1);
>  
> -		/* Set the file ptr to b'nning of file */
> -		if (lseek(fildes, 0, SEEK_SET) < 0) {
> -			tst_resm(TWARN, "lseek() failed on %s, error="
> -				 " %d", file, errno);
> -			close(fildes);
> -			return 1;
> -		}
> -
> -		/* Read the contents of file */
> -		if (read(fildes, read_buffer, sizeof(read_buffer)) > 0) {
> -			if (strcmp(read_buffer, write_buffer)) {
> -				tst_resm(TWARN, "Data read from %s and written "
> -					 "mismatch", file);
> -				close(fildes);
> -				return 1;
> -			} else {
> -				close(fildes);
> -				return 0;
> -			}
> -		} else {
> -			tst_resm(TWARN | TERRNO, "read() Fails on %s", file);
> -			close(fildes);
> -			return 1;
> -		}
> -
> -	case 4:
> -		/* Validate MS_REMOUNT flag of mount call */
> -
> -		TEST(mount(device, mntpoint, fs_type, MS_REMOUNT, NULL));
> -		if (TEST_RETURN != 0) {
> -			tst_resm(TWARN | TTERRNO, "mount(2) failed to remount");
> -			return 1;
> -		} else {
> -			snprintf(file, PATH_MAX, "%stmp2", path_name);
> -			fd = open(file, O_CREAT | O_RDWR, S_IRWXU);
> -			if (fd == -1) {
> -				tst_resm(TWARN, "open(%s) on readonly "
> -					 "filesystem passed", file);
> -				return 1;
> -			} else {
> -				close(fd);
> -				return 0;
> -			}
> -		}
> -	case 5:
> -		/* Validate MS_NOSUID flag of mount call */
> -
> -		snprintf(file, PATH_MAX, "%smount03_setuid_test", path_name);
> -
> -		pid = fork();
> -		switch (pid) {
> -		case -1:
> -			tst_resm(TBROK | TERRNO, "fork failed");
> -			return 1;
> -		case 0:
> -			ltpuser = getpwnam(nobody_uid);
> -			if (setreuid(ltpuser->pw_uid, ltpuser->pw_uid) == -1)
> -				tst_resm(TWARN | TERRNO,
> -					 "seteuid() failed to change euid to %d",
> -					 ltpuser->pw_uid);
> -
> -			execlp(file, basename(file), NULL);
> -			exit(1);
> -		default:
> -			waitpid(pid, &status, 0);
> -			if (WIFEXITED(status)) {
> -				/* reset the setup_uid */
> -				if (status)
> -					return 0;
> -			}
> -			return 1;
> -		}
> -	case 6:
> -		/* Validate MS_NOATIME flag of mount call */
> -
> -		snprintf(file, PATH_MAX, "%satime", path_name);
> -		fd = open(file, O_CREAT | O_RDWR, S_IRWXU);
> -		if (fd == -1) {
> -			tst_resm(TWARN | TERRNO, "opening %s failed", file);
> -			return 1;
> -		}
> -
> -		if (write(fd, "TEST_MS_NOATIME", 15) != 15) {
> -			tst_resm(TWARN | TERRNO, "write %s failed", file);
> -			close(fd);
> -			return 1;
> -		}
> -
> -		if (fstat(fd, &file_stat) == -1) {
> -			tst_resm(TWARN | TERRNO, "stat %s failed #1", file);
> -			close(fd);
> -			return 1;
> -		}
> -
> -		atime = file_stat.st_atime;
> -
> -		sleep(1);
> -
> -		if (read(fd, readbuf, sizeof(readbuf)) == -1) {
> -			tst_resm(TWARN | TERRNO, "read %s failed", file);
> -			close(fd);
> -			return 1;
> -		}
> -
> -		if (fstat(fd, &file_stat) == -1) {
> -			tst_resm(TWARN | TERRNO, "stat %s failed #2", file);
> -			close(fd);
> -			return 1;
> -		}
> -		close(fd);
> -
> -		if (file_stat.st_atime != atime) {
> -			tst_resm(TWARN, "access time is updated");
> -			return 1;
> -		}
> -		return 0;
> -	}
> -	return 0;
> +	SAFE_READ(0, otfd, readbuf, sizeof(readbuf));
> +	SAFE_FSTAT(otfd, &st);
> +	TST_EXP_EQ_LI(st.st_atime, atime);
>  }
>  
> +#define FLAG_DESC(x) .flag = x, .desc = #x
> +static struct tcase {
> +	unsigned int flag;
> +	char *desc;
> +	void (*test)(void);
> +} tcases[] = {
> +	{FLAG_DESC(MS_RDONLY), test_rdonly},
> +	{FLAG_DESC(MS_NODEV), test_nodev},
> +	{FLAG_DESC(MS_NOEXEC), test_noexec},
> +	{FLAG_DESC(MS_SYNCHRONOUS), test_synchronous},
> +	{FLAG_DESC(MS_RDONLY), test_remount},
> +	{FLAG_DESC(MS_NOSUID), test_nosuid},
> +	{FLAG_DESC(MS_NOATIME), test_noatime},
> +};
> +
>  static void setup(void)
>  {
> -	char path[PATH_MAX];
> -	struct stat file_stat;
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> +	struct stat st;
> +	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
>  
> -	tst_require_root();
> +	nobody_uid = ltpuser->pw_uid;
> +	nobody_gid = ltpuser->pw_gid;
>  
> -	tst_tmpdir();
> +	snprintf(file, PATH_MAX, "%s/%s", MNTPOINT, TESTBIN);
> +	TST_RESOURCE_COPY(NULL, TESTBIN, file);
>  
> -	fs_type = tst_dev_fs_type();
> -	device = tst_acquire_device(cleanup);
> -
> -	if (!device)
> -		tst_brkm(TCONF, cleanup, "Failed to obtain block device");
> -
> -	tst_mkfs(cleanup, device, fs_type, NULL, NULL);
> +	SAFE_STAT(file, &st);
> +	if (st.st_mode != SUID_MODE)
> +	    SAFE_CHMOD(file, SUID_MODE);
> +}
>  
> -	SAFE_MKDIR(cleanup, mntpoint, DIR_MODE);
> +static void cleanup(void)
> +{
> +	if (otfd >= 0)
> +		SAFE_CLOSE(otfd);
>  
> -	if (getcwd(path_name, sizeof(path_name)) == NULL)
> -		tst_brkm(TBROK, cleanup, "getcwd failed");
> +	if (tst_is_mounted(MNTPOINT))
> +		SAFE_UMOUNT(MNTPOINT);
> +}
>  
> -	if (chmod(path_name, DIR_MODE) != 0)
> -		tst_brkm(TBROK, cleanup, "chmod(%s, %#o) failed",
> -			 path_name, DIR_MODE);
>  
> -	strncpy(path, path_name, PATH_MAX);
> -	snprintf(path_name, PATH_MAX, "%s/%s/", path, mntpoint);
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
>  
> -	SAFE_MOUNT(cleanup, device, mntpoint, fs_type, 0, NULL);
> -	TST_RESOURCE_COPY(cleanup, "mount03_setuid_test", path_name);
> +	tst_res(TINFO, "Testing flag %s", tc->desc);
>  
> -	snprintf(file, PATH_MAX, "%smount03_setuid_test", path_name);
> -	SAFE_STAT(cleanup, file, &file_stat);
> +	TST_EXP_PASS_SILENT(mount(tst_device->dev, MNTPOINT, tst_device->fs_type,
> +		   tc->flag, NULL));
> +	if (!TST_PASS)
> +		return;
>  
> -	if (file_stat.st_mode != SUID_MODE &&
> -	    chmod(file, SUID_MODE) < 0)
> -		tst_brkm(TBROK, cleanup,
> -			 "setuid for setuid_test failed");
> -	SAFE_UMOUNT(cleanup, mntpoint);
> +	if (tc->test)
> +		tc->test();
>  
> -	TEST_PAUSE;
> +	cleanup();
>  }
>  
> -static void cleanup(void)
> -{
> -	if (device)
> -		tst_release_device(device);
> -
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.format_device = 1,
> +	.resource_files = (const char *const[]) {
> +		TESTBIN,
> +		NULL,
> +	},
> +	.forks_child = 1,
> +	.mntpoint = MNTPOINT,
> +	.all_filesystems = 1,
> +	.skip_filesystems = (const char *const []){
> +		"exfat",
> +		"vfat",
> +		"ntfs",
> +		NULL
> +	},
> +};
> -- 
> 2.37.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
