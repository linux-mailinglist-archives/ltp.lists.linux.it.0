Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776B324275
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:50:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 144C33C5A7C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:50:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B95A13C5A6A
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 78880601A75
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FD9AAF9C;
 Wed, 24 Feb 2021 16:49:24 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 24 Feb 2021 17:50:44 +0100
Message-Id: <20210224165045.17738-5-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224165045.17738-1-chrubis@suse.cz>
References: <20210224165045.17738-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] Sample hardware discovery and reconfigure
 scripts
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
Cc: Michal Simek <michals@xilinx.com>, Carlos Hernandez <ceh@ti.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is not going to be part of the final patchset.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 hardware-discovery.sh   | 36 ++++++++++++++++++++++++++++++++++++
 hardware-reconfigure.sh |  3 +++
 2 files changed, 39 insertions(+)
 create mode 100755 hardware-discovery.sh
 create mode 100755 hardware-reconfigure.sh

diff --git a/hardware-discovery.sh b/hardware-discovery.sh
new file mode 100755
index 000000000..2d1eeefaa
--- /dev/null
+++ b/hardware-discovery.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+if [ "$1" = "UART-loopback" ]; then
+	echo '{'
+	echo ' "reconfigure": "hardware-reconfigure.sh",'
+	echo ' "hwconfs": ['
+	echo '  {'
+	echo '   "uid": "ttyUSB0-ttyUSB0-01",'
+	echo '   "tx": "/dev/ttyUSB0",'
+	echo '   "rx": "/dev/ttyUSB0",'
+	echo '   "hwflow": 0,'
+	echo '   "baud_rates": ['
+	echo '    4800,'
+	echo '    9600,'
+	echo '    19200'
+	echo '   ]'
+	echo '  },'
+	echo '  {'
+	echo '   "uid": "ttyUSB0-ttyUSB0-02",'
+	echo '   "tx": "/dev/ttyUSB0",'
+	echo '   "rx": "/dev/ttyUSB0",'
+	echo '   "hwflow": 1,'
+	echo '   "baud_rates": ['
+	echo '    4800,'
+	echo '    9600,'
+	echo '    19200'
+	echo '   ]'
+	echo '  }'
+	echo ' ]'
+	echo '}'
+
+	exit 0
+fi
+
+echo '{}'
+exit 0
diff --git a/hardware-reconfigure.sh b/hardware-reconfigure.sh
new file mode 100755
index 000000000..079f6588a
--- /dev/null
+++ b/hardware-reconfigure.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+echo "Reconfigure '$@'"
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
