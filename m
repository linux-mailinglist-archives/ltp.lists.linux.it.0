Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051734FAEE
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 09:58:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AB8E3C267E
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 09:58:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B14A03C22BC
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 09:58:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1EDC5601145
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 09:58:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D53D8B134;
 Wed, 31 Mar 2021 07:58:34 +0000 (UTC)
Date: Wed, 31 Mar 2021 09:58:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YGQrqdryrb+4f5UO@pevik>
References: <20210329145738.986-1-pvorel@suse.cz> <87czvhneqb.fsf@suse.de>
 <YGMYpaeR7Mp7rATD@pevik> <87a6qkom1p.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6qkom1p.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_mkfs: Add -I option to mkfs.vfat
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

instead of using -I I tried Martin Doucha's suggestion to rescan partition table
with ioctl BLKRRPART. But I get EINVAL. Not sure if O_RDONLY is a proper flag,
but I also tried to open with args used for manipulating loop (open(path,
O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR)) and a same issue. Happens on recent
kernel and very old kernel 3.16.

I wonder if I have wrong flags or BLKRRPART is just not supported on loop
devices. Looking into kernel sources it's this part blkdev_reread_part():

	if (!disk_part_scan_enabled(bdev->bd_disk) || bdev_is_partition(bdev))
		return -EINVAL;
Kind regards,
Petr

diff --git lib/tst_mkfs.c lib/tst_mkfs.c
index 736324f04..06fafcd18 100644
--- lib/tst_mkfs.c
+++ lib/tst_mkfs.c
@@ -15,6 +15,10 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <sys/ioctl.h>
+#include <sys/mount.h>
+#include <fcntl.h>
+
 #include "test.h"
 #include "ltp_priv.h"
 #include "tst_mkfs.h"
@@ -26,7 +30,7 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 	       const char *dev, const char *fs_type,
 	       const char *const fs_opts[], const char *const extra_opts[])
 {
-	int i, pos = 1, ret;
+	int fd, i, pos = 1, ret;
 	char mkfs[64];
 	const char *argv[OPTS_MAX] = {mkfs};
 	char fs_opts_str[1024] = "";
@@ -93,6 +97,13 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 			"tst_clear_device() failed");
 	}
 
+	/* force kernel to reread partition table */
+	fd = open(dev, O_RDONLY);
+	tst_resm_(file, lineno, TINFO, "dev: %s, fd: %d", dev, fd);
+	ret = ioctl(fd, BLKRRPART);
+	tst_resm_(file, lineno, TINFO, "rc: %d", ret);
+	close(fd);
+
 	tst_resm_(file, lineno, TINFO,
 		"Formatting %s with %s opts='%s' extra opts='%s'",
 		dev, fs_type, fs_opts_str, extra_opts_str);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
