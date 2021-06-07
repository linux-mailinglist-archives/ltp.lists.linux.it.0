Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7339DAC7
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:10:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9F7B3C4DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 13:10:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF6523C269A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:10:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D30DC1400963
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 13:10:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 335DD1FDA1;
 Mon,  7 Jun 2021 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623064230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7IMQNVd589rS0u0Mw6Z34liKVwGLpVAmkYb9ADduy9M=;
 b=1tO/JL+xIYFLOjJjKWOFqez3nDuXTu/nkPynVtNKEwjpWhyNgZX10lWA6a/SlI/26khKk9
 ruNvxCuYSK+vprY93qpCTrXltkwEyUHol5Ro9zCvWSm72ySIXH6UqoJJeDJwCelxdjVinX
 cWOp7Yor4LH3MG/MJ/61QttOxv4tPts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623064230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7IMQNVd589rS0u0Mw6Z34liKVwGLpVAmkYb9ADduy9M=;
 b=hjdWe2crS2g1WXDVVGxnwULGEtTXRgnq59ZK4O4scQBE9OyO+kDNSGi+3vWFEhowfYyW8s
 zXjaDhG0SD4267Bg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D69CB118DD;
 Mon,  7 Jun 2021 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623064230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7IMQNVd589rS0u0Mw6Z34liKVwGLpVAmkYb9ADduy9M=;
 b=1tO/JL+xIYFLOjJjKWOFqez3nDuXTu/nkPynVtNKEwjpWhyNgZX10lWA6a/SlI/26khKk9
 ruNvxCuYSK+vprY93qpCTrXltkwEyUHol5Ro9zCvWSm72ySIXH6UqoJJeDJwCelxdjVinX
 cWOp7Yor4LH3MG/MJ/61QttOxv4tPts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623064230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7IMQNVd589rS0u0Mw6Z34liKVwGLpVAmkYb9ADduy9M=;
 b=hjdWe2crS2g1WXDVVGxnwULGEtTXRgnq59ZK4O4scQBE9OyO+kDNSGi+3vWFEhowfYyW8s
 zXjaDhG0SD4267Bg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yWy5MqX+vWA5TgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 11:10:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  7 Jun 2021 13:10:14 +0200
Message-Id: <20210607111016.20630-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/2] Remove floppy and CDROM stress tests
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

Hi,

does anybody use these tests? Does anybody need to test froppy or CDROM
(even on VM)?

Kind regards,
Petr

Petr Vorel (2):
  io: Remove stress_floppy
  io: Remove stress_cd

 runtest/io_cd                                 |     1 -
 runtest/io_floppy                             |     1 -
 testcases/kernel/io/stress_cd/.gitignore      |     1 -
 testcases/kernel/io/stress_cd/Makefile        |    25 -
 testcases/kernel/io/stress_cd/stress_cd.c     |   244 -
 testcases/kernel/io/stress_floppy/.gitignore  |     4 -
 testcases/kernel/io/stress_floppy/Makefile    |    25 -
 .../io/stress_floppy/datafiles/Makefile       |    31 -
 .../kernel/io/stress_floppy/datafiles/dd_file | 21441 ----------------
 .../datafiles/dumpdir/.gitignore              |     1 -
 .../stress_floppy/datafiles/dumpdir/1K_file   |    19 -
 .../stress_floppy/datafiles/dumpdir/Makefile  |    40 -
 .../datafiles/dumpdir/generate.sh             |    22 -
 .../kernel/io/stress_floppy/stress_floppy     |   264 -
 testscripts/diskio.sh                         |    37 -
 15 files changed, 22156 deletions(-)
 delete mode 100644 runtest/io_cd
 delete mode 100644 runtest/io_floppy
 delete mode 100644 testcases/kernel/io/stress_cd/.gitignore
 delete mode 100644 testcases/kernel/io/stress_cd/Makefile
 delete mode 100644 testcases/kernel/io/stress_cd/stress_cd.c
 delete mode 100644 testcases/kernel/io/stress_floppy/.gitignore
 delete mode 100644 testcases/kernel/io/stress_floppy/Makefile
 delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/Makefile
 delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dd_file
 delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdir/.gitignore
 delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdir/1K_file
 delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdir/Makefile
 delete mode 100755 testcases/kernel/io/stress_floppy/datafiles/dumpdir/generate.sh
 delete mode 100755 testcases/kernel/io/stress_floppy/stress_floppy
 delete mode 100755 testscripts/diskio.sh

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
