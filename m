Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72D39DAC9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:10:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87EBB3C7CBA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:10:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CAC473C4D5E
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:10:33 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0A441200C1A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:10:32 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3E5621A8D;
 Mon,  7 Jun 2021 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623064232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj82R3l92++KxJYOwdwiVd0tDN4qZCznjqResncwx0E=;
 b=BBqRmdKxItR/xVdw7oCopUJcR3PrdQZOB0JTqmUkrWQXfndNJYB78eu2q+Pok1ROPgEheo
 UIcJf/oMQ/b8dqTlniLoLNdNR0hskclfovu5B0zAIiAC/1x0LfHCYcMfdSWR0e9pNs2hz7
 UxXvKX3647RsYsCFp9fDVk9E4Pc6PmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623064232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj82R3l92++KxJYOwdwiVd0tDN4qZCznjqResncwx0E=;
 b=IgKK1+9WuToiL/1IlC1BbQC0NjxmNnmEyoZVKGAG/vC71/uzFJvcq7ra5bram00J0s1cYA
 szlJ4hnH1hkiPaCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2A4B511A98;
 Mon,  7 Jun 2021 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623064232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj82R3l92++KxJYOwdwiVd0tDN4qZCznjqResncwx0E=;
 b=BBqRmdKxItR/xVdw7oCopUJcR3PrdQZOB0JTqmUkrWQXfndNJYB78eu2q+Pok1ROPgEheo
 UIcJf/oMQ/b8dqTlniLoLNdNR0hskclfovu5B0zAIiAC/1x0LfHCYcMfdSWR0e9pNs2hz7
 UxXvKX3647RsYsCFp9fDVk9E4Pc6PmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623064232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj82R3l92++KxJYOwdwiVd0tDN4qZCznjqResncwx0E=;
 b=IgKK1+9WuToiL/1IlC1BbQC0NjxmNnmEyoZVKGAG/vC71/uzFJvcq7ra5bram00J0s1cYA
 szlJ4hnH1hkiPaCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uFb8CKj+vWA5TgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 11:10:32 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  7 Jun 2021 13:10:16 +0200
Message-Id: <20210607111016.20630-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607111016.20630-1-pvorel@suse.cz>
References: <20210607111016.20630-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] io: Remove stress_cd
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
Cc: automated-testing@yoctoproject.org,
 Zeng Linggang <zenglg.jy@cn.fujitsu.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Yixin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Similarly to previous commit, also CDROM / DVD aren't much used
nowadays and thus it does not make much sense to keep and further
cleanup stress_cd.c.

Remove also diskio.sh, which was used only for stress_{cd,floppy}.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/io_cd                             |   1 -
 testcases/kernel/io/stress_cd/.gitignore  |   1 -
 testcases/kernel/io/stress_cd/Makefile    |  25 ---
 testcases/kernel/io/stress_cd/stress_cd.c | 244 ----------------------
 testscripts/diskio.sh                     |  31 ---
 5 files changed, 302 deletions(-)
 delete mode 100644 runtest/io_cd
 delete mode 100644 testcases/kernel/io/stress_cd/.gitignore
 delete mode 100644 testcases/kernel/io/stress_cd/Makefile
 delete mode 100644 testcases/kernel/io/stress_cd/stress_cd.c
 delete mode 100755 testscripts/diskio.sh

diff --git a/runtest/io_cd b/runtest/io_cd
deleted file mode 100644
index f4ca5604c..000000000
--- a/runtest/io_cd
+++ /dev/null
@@ -1 +0,0 @@
-stress_cd stress_cd
diff --git a/testcases/kernel/io/stress_cd/.gitignore b/testcases/kernel/io/stress_cd/.gitignore
deleted file mode 100644
index 1c7ad9a55..000000000
--- a/testcases/kernel/io/stress_cd/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-/stress_cd
diff --git a/testcases/kernel/io/stress_cd/Makefile b/testcases/kernel/io/stress_cd/Makefile
deleted file mode 100644
index 252cdedb9..000000000
--- a/testcases/kernel/io/stress_cd/Makefile
+++ /dev/null
@@ -1,25 +0,0 @@
-#
-#  Copyright (c) International Business Machines  Corp., 2001
-#
-#  This program is free software;  you can redistribute it and/or modify
-#  it under the terms of the GNU General Public License as published by
-#  the Free Software Foundation; either version 2 of the License, or
-#  (at your option) any later version.
-#
-#  This program is distributed in the hope that it will be useful,
-#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-#  the GNU General Public License for more details.
-#
-#  You should have received a copy of the GNU General Public License
-#  along with this program;  if not, write to the Free Software
-#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-#
-
-top_srcdir		?= ../../../..
-
-include $(top_srcdir)/include/mk/testcases.mk
-
-LDLIBS			+= -lpthread
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/io/stress_cd/stress_cd.c b/testcases/kernel/io/stress_cd/stress_cd.c
deleted file mode 100644
index ede187168..000000000
--- a/testcases/kernel/io/stress_cd/stress_cd.c
+++ /dev/null
@@ -1,244 +0,0 @@
-/*
- *   Copyright (c) International Business Machines  Corp., 2001
- *    06/20/2001 Robbie Williamson (robbiew@us.ibm.com)
- *    11/08/2001 Manoj Iyer (manjo@austin.ibm.com)
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software Foundation,
- *   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * Usage:	stress_cd [-n n] [-f file] [-m xx] [-d]
- *		where:
- *		  -n n     Number of threads to create
- *		  -f file  File or device to read from
- *		  -m xx    Number of MB to read from file
- *		  -b xx    Number of bytes to read from file
- *		  -d       Enable debugging messages
- */
-
-#include <pthread.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <assert.h>
-#include <errno.h>
-#include <sys/types.h>
-#include <unistd.h>
-#include <string.h>
-
-#define DEFAULT_NUM_THREADS	10
-#define DEFAULT_NUM_BYTES	(1024*1024*100)	/* 100Mb */
-#define DEFAULT_FILE		"/dev/cdrom"
-
-static void sys_error(const char *, int);
-static void parse_args(int, char **);
-static void *thread(int *);
-static int read_data(int, unsigned long *);
-
-static int num_threads = DEFAULT_NUM_THREADS;
-static int num_bytes = DEFAULT_NUM_BYTES;
-static char *file = DEFAULT_FILE;
-static unsigned long checksum;
-static int debug;
-
-int main(int argc, char **argv)
-{
-	pthread_attr_t attr;
-	int rc = 0, i;
-
-	/* Parse command line arguments and print out program header */
-	parse_args(argc, argv);
-
-	/* Read data from CDROM & compute checksum */
-	read_data(0, &checksum);
-	if (debug)
-		printf("Thread [main] checksum: %-#12lx\n", checksum);
-
-	if (pthread_attr_init(&attr))
-		sys_error("pthread_attr_init failed", __LINE__);
-	if (pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE))
-		sys_error("pthread_attr_setdetachstate failed", __LINE__);
-
-	printf("\tThread [main] Creating %d threads\n", num_threads);
-
-	pthread_t array[num_threads];
-	int arg[num_threads];
-
-	for (i = 0; i < num_threads; i++) {
-		if (debug)
-			printf("\tThread [main]: creating thread %d\n", i + 1);
-		arg[i] = i + 1;
-		if (pthread_create((pthread_t *)&array[i], &attr,
-				   (void *)thread, (void *)&arg[i])) {
-			if (errno == EAGAIN) {
-				fprintf(stderr,
-					"\tThread [main]: unable to create "
-					"thread %d\n", i);
-			} else {
-				sys_error("pthread_create failed", __LINE__);
-			}
-		}
-		if (debug)
-			printf("\tThread [main]: created thread %d\n", i + 1);
-	}
-	if (pthread_attr_destroy(&attr))
-		sys_error("pthread_attr_destroy failed", __LINE__);
-
-	for (i = 0; i < num_threads; i++) {
-		void *exit_value;
-		printf("\tThread [main]: waiting for thread: %d\n", i + 1);
-		if (pthread_join(array[i], &exit_value))
-			sys_error("pthread_join failed", __LINE__);
-
-		if (debug)
-			printf("\tThread [%d]: return %ld\n", i + 1,
-			       (long)exit_value);
-		rc += (long)exit_value;
-	}
-
-	if (rc != 0) {
-		printf("test failed!\n");
-		exit(-1);
-	}
-
-	printf("\tThread [main] All threads completed successfully...\n");
-	exit(0);
-}
-
-static void *thread(int *parm)
-{
-	int num = *parm;
-	unsigned long cksum = 0;
-
-	if (debug)
-		printf("\tThread [%d]: begin\n", num);
-
-	read_data(num, &cksum);
-	if (checksum != cksum) {
-		fprintf(stderr, "\tThread [%d]: checksum mismatch!\n", num);
-		pthread_exit((void *)-1);
-	}
-
-	if (debug)
-		printf("\tThread [%d]: done\n", num);
-
-	pthread_exit(NULL);
-}
-
-static int read_data(int num, unsigned long *cksum)
-{
-	int fd;
-	const int bufSize = 1024;
-	char *buffer;
-	int bytes_read = 0;
-	int n;
-	char *p;
-
-	if (debug)
-		printf("\tThread [%d]: read_data()\n", num);
-
-	if ((fd = open(file, O_RDONLY, NULL)) < 0)
-		sys_error("open failed /dev/cdrom", __LINE__);
-
-	buffer = malloc(sizeof(char) * bufSize);
-	assert(buffer);
-
-	lseek(fd, 1024 * 36, SEEK_SET);
-	while (bytes_read < num_bytes) {
-		n = read(fd, buffer, bufSize);
-		if (n < 0)
-			sys_error("read failed", __LINE__);
-		else if (n == 0)
-			sys_error("End of file", __LINE__);
-		bytes_read += n;
-
-		for (p = buffer; p < buffer + n; p++)
-			*cksum += *p;
-
-		if (debug)
-			printf("\tThread [%d] bytes read: %5d checksum: "
-			       "%-#12lx\n", num, bytes_read, *cksum);
-	}
-	free(buffer);
-
-	if (debug)
-		printf("\tThread [%d] bytes read: %5d checksum: %-#12lx\n",
-		       num, bytes_read, *cksum);
-
-	if (close(fd) < 0)
-		sys_error("close failed", __LINE__);
-
-	if (debug)
-		printf("\tThread [%d]: done\n", num);
-
-	return (0);
-}
-
-static void parse_args(int argc, char **argv)
-{
-	int i;
-	int errflag = 0;
-	char *program_name = *argv;
-	extern char *optarg;	/* Command line option */
-
-	while ((i = getopt(argc, argv, "df:n:b:m:?")) != EOF) {
-		switch (i) {
-		case 'd':	/* debug option */
-			debug++;
-			break;
-		case 'f':	/* file to read from */
-			file = optarg;
-			break;
-		case 'm':	/* num MB to read */
-			num_bytes = atoi(optarg) * 1024 * 1024;
-			break;
-		case 'b':	/* num bytes to read */
-			num_bytes = atoi(optarg);
-			break;
-		case 'n':	/* number of threads */
-			num_threads = atoi(optarg);
-			break;
-		case '?':	/* help */
-			errflag++;
-			break;
-		}
-	}
-	if (num_bytes < 0) {
-		errflag++;
-		fprintf(stderr, "ERROR: num_bytes must be greater than 0");
-	}
-	if (num_threads < 0) {
-		errflag++;
-		fprintf(stderr, "ERROR: num_threads must be greater than 0");
-	}
-
-	if (errflag) {
-		fprintf(stderr, "\nUsage: %s"
-			" [-n xx] [-m|b xx] [-d]\n\n"
-			"\t-n xx    Number of threads to create (up to %d)\n"
-			"\t-f file  File to read from\n"
-			"\t-m xx    Number of MB to read\n"
-			"\t-b xx    Number of bytes to read\n"
-			"\t-d       Debug option\n", program_name,
-			DEFAULT_NUM_THREADS);
-		exit(2);
-	}
-}
-
-static void sys_error(const char *msg, int line)
-{
-	fprintf(stderr, "ERROR [%d: %s: %s]\n", line, msg, strerror(errno));
-	exit(-1);
-}
diff --git a/testscripts/diskio.sh b/testscripts/diskio.sh
deleted file mode 100755
index e3300eef8..000000000
--- a/testscripts/diskio.sh
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/sh
-# These tests require the corresponding media to be present:
-#
-#  stress_cd: Requires ANY data CD with a minimum of 100MB of data.
-
-cd `dirname $0`
-
-export LTPROOT=${PWD}
-echo $LTPROOT | grep testscripts > /dev/null 2>&1
-if [ $? -eq 0 ]; then
- cd ..
- export LTPROOT=${PWD}
-fi
-
-export TMPDIR=/tmp
-
-mkdir /tmp/diskiopan-$$
-cd /tmp/diskiopan-$$
-
-export PATH="${PATH}:${LTPROOT}/testcases/bin"
-
-${LTPROOT}/ver_linux
-
-${LTPROOT}/bin/ltp-pan -e -l /tmp/diskiopan.log -S -a ltpdiskio -n ltpdiskio -f ${LTPROOT}/runtest/io_cd
-
-if [ $? -eq "0" ]; then
-  echo ltp-pan reported PASS
-else
-  echo ltp-pan reported FAIL
-fi
-
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
