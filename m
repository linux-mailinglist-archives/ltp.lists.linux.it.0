Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E102A39045E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:56:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7E293C77CD
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:56:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6ECD53C2B2E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:56:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C773A601403
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621954570;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0c6a6ApXnFcL3MmTdZPBdfstDJ0AY6DAv0y7Ag5XQfU=;
 b=n0I29ysYX6Tmh2j59ZJ89tsvtiRLp7cQRVf+3FDCxaBZgbdS7LNfP/DmXJuF7fVTKcX17l
 W5ooduisipY6kMAkCS0k3J6tSXHTbboNXTqqVmJVcaIP/DYK4Gmpuw92ZX2FLMLW/9tnGA
 1632vUAS0zxNYbXsk58fKeTyKCB3m+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621954570;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0c6a6ApXnFcL3MmTdZPBdfstDJ0AY6DAv0y7Ag5XQfU=;
 b=W9D6/sn3TfEOucmOrf20qmYS8ua9IYsbfex0g9CnCgYV7flfGsotiLXuPAVtuwg5Ka2DQK
 ofj4VUP00CcQgHDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3640AE5C;
 Tue, 25 May 2021 14:56:09 +0000 (UTC)
Date: Tue, 25 May 2021 16:56:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YK0QCD3CTXDpPcN1@pevik>
References: <20210506130950.110267-1-xieziyao@huawei.com>
 <20210506130950.110267-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506130950.110267-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/fchown: Convert fchown01 to the new
 API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

merged with these changes, thanks!

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fchown/fchown01.c testcases/kernel/syscalls/fchown/fchown01.c
index 32fc53d6c..77913ce32 100644
--- testcases/kernel/syscalls/fchown/fchown01.c
+++ testcases/kernel/syscalls/fchown/fchown01.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2006-2021
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- * AUTHOR: William Roske
- * CO-PILOT: Dave Fenner
+ * Author: William Roske
+ * Ported to LTP: Dave Fenner
  */
 
 /*\
@@ -22,7 +23,8 @@
 #define MODE 0700
 
 static int fd;
-static int uid, gid;
+static uid_t uid;
+static gid_t gid;
 
 static void run(void)
 {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
