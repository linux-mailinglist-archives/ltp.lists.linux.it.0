Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D486E6F27F4
	for <lists+linux-ltp@lfdr.de>; Sun, 30 Apr 2023 09:48:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9806A3CB938
	for <lists+linux-ltp@lfdr.de>; Sun, 30 Apr 2023 09:48:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB4C23CB1C6
 for <ltp@lists.linux.it>; Sun, 30 Apr 2023 09:48:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2DE7C6002A1
 for <ltp@lists.linux.it>; Sun, 30 Apr 2023 09:48:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9979F21C3B;
 Sun, 30 Apr 2023 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1682840896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbJNZf8gfn4lWCtNOVzEtA3w3Ve/G/Q1nVJs3jwRWro=;
 b=QYgqVJhDMmPnH49LG3aCwNVKzPXUfvgzHBBsRwaUAoYucUh+e6nqZbqjtc0QxSVl/9soFU
 XRBpG23mZIrL6rNI6gJ1Gx6DtePCGjR3j0xrHNeSxeRgQSRbh/LVHn49auVHJ/9QgNysvj
 OhnazeNF2ZVgvUTgeCU7W+ihYMpngSo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6C9C13319;
 Sun, 30 Apr 2023 07:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JTZALz8dTmT7aQAAMHmgww
 (envelope-from <wegao@suse.com>); Sun, 30 Apr 2023 07:48:15 +0000
To: ltp@lists.linux.it
Date: Sun, 30 Apr 2023 03:48:09 -0400
Message-Id: <20230430074811.29555-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230428101038.7253-1-wegao@suse.com>
References: <20230428101038.7253-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v12 0/2] cgroup_core03.c: New case test cgroup kill
 feature
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Wei Gao (2):
  tst_cgroup.c: Add a cgroup base controller
  cgroup_core03.c: New case test cgroup kill feature

 lib/tst_cgroup.c                              |  44 ++++--
 runtest/controllers                           |   1 +
 .../kernel/controllers/cgroup/.gitignore      |   1 +
 .../kernel/controllers/cgroup/cgroup_core03.c | 130 ++++++++++++++++++
 4 files changed, 163 insertions(+), 13 deletions(-)
 create mode 100644 testcases/kernel/controllers/cgroup/cgroup_core03.c


base-commit: b67facdd9c3f0ef471d74dd59ac276139e63f4c4
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
