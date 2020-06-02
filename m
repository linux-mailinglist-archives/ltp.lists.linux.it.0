Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F37291EB795
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 10:42:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B97543C302C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 10:42:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B94BE3C2314
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 10:42:21 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 83C64600635
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 10:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591087338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=WXQPBF/P93W/Tqfp55SA7aZbc4q/ox9WhCYBEDDj9kY=;
 b=E3qPW1fKGkQnFTPRduSiUZvW9Rcj+jAHkNM/skPoznnCPi0mzVRbX4pdTm1ny9zfSOFq6o
 Ll9GhYosFSP3bHA5c+VIGyX4pqdUoY/nDiSzrDAF85r9TbDvzUaT+njKQKKu1AF83UUgMe
 kJm9eEXAGaoMAPI7GRRebCblazytAak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-D0y7CtgmPs2jGDHD9XL4fA-1; Tue, 02 Jun 2020 04:42:17 -0400
X-MC-Unique: D0y7CtgmPs2jGDHD9XL4fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583CB800053;
 Tue,  2 Jun 2020 08:42:16 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3F77F0A6;
 Tue,  2 Jun 2020 08:42:12 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  2 Jun 2020 10:42:06 +0200
Message-Id: <2f353cb69600740308c196dcfa8f570ba6420bfa.1591087232.git.jstancek@redhat.com>
In-Reply-To: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
References: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/ioctl_loop05: set loop blksize to bdev
 blksize
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test is failing on s390, where default loop blksize is less than
backing dev's blksize (4096):
  tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
  tst_device.c:88: INFO: Found free device 0 '/dev/loop0'
  ioctl_loop05.c:116: INFO: /dev/loop0 default logical_block_size is 512
  ioctl_loop05.c:62: INFO: Without setting lo_offset or sizelimit
  ioctl_loop05.c:63: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)

Per kernel comment at __loop_update_dio(), direct io is supported
when ".. logical block size of loop is bigger than the backing device's".

Set loop blksize to one of backing device. Retry is there to avoid
EAGAIN warning "loop0 (test.img) has still dirty pages".

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop05.c      | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

Changes in v2:
- check if LOOP_SET_BLOCK_SIZE is supported in setup()

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index 6c9ea2802981..2a3c127959aa 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -96,6 +96,9 @@ static void verify_ioctl_loop(void)
 
 static void setup(void)
 {
+	int fd;
+	struct stat buf;
+
 	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
 		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
 
@@ -105,6 +108,14 @@ static void setup(void)
 
 	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
 	tst_fill_file("test.img", 0, 1024, 1024);
+
+	fd = SAFE_OPEN("test.img", O_RDONLY);
+	SAFE_FSTAT(fd, &buf);
+	SAFE_CLOSE(fd);
+
+	logical_block_size = buf.st_blksize;
+	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
+
 	tst_attach_device(dev_path, "test.img");
 	attach_flag = 1;
 	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
@@ -112,8 +123,19 @@ static void setup(void)
 	if (ioctl(dev_fd, LOOP_SET_DIRECT_IO, 0) && errno == EINVAL)
 		tst_brk(TCONF, "LOOP_SET_DIRECT_IO is not supported");
 
-	SAFE_IOCTL(dev_fd, BLKSSZGET, &logical_block_size);
-	tst_res(TINFO, "%s default logical_block_size is %d", dev_path, logical_block_size);
+	/*
+	 * from __loop_update_dio():
+	 *   We support direct I/O only if lo_offset is aligned with the
+	 *   logical I/O size of backing device, and the logical block
+	 *   size of loop is bigger than the backing device's and the loop
+	 *   needn't transform transfer.
+	 */
+	if (ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size) != 0) {
+		if (errno == EINVAL)
+			tst_brk(TCONF, "LOOP_SET_BLOCK_SIZE is not supported");
+		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE,
+			logical_block_size), TST_RETVAL_EQ0);
+	}
 }
 
 static void cleanup(void)
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
