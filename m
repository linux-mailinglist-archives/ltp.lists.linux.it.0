Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A86A7BB3
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 08:16:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BCB43CCE04
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 08:16:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD8703CB9D3
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 08:16:19 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3E3C320E759
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 08:16:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0BB5021B08;
 Thu,  2 Mar 2023 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1677741378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bINPhAbJ31Wi8OZsEBP0TdlpGXZSpw2r88ULvog7tg=;
 b=HItgcnG9ADH1zLnEmBvwKc5cBntk5F4blwiYSMsPPmMgIGRolvusxBsGuDN7FkOyy3KEFf
 cOpv9r1XXumPdL9+FwPmKRXJGuMxbOeCCYdZKHSZY8ff5CtnNkGCFOdONAKygE1jAC5M4l
 uBFq8C9ShegmbocRRLZosveIvgbiwPI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5547713A5C;
 Thu,  2 Mar 2023 07:16:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C4PTC0FNAGRxeQAAMHmgww
 (envelope-from <wegao@suse.com>); Thu, 02 Mar 2023 07:16:17 +0000
To: ltp@lists.linux.it
Date: Thu,  2 Mar 2023 02:15:53 -0500
Message-Id: <20230302071555.18420-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120010533.11202-1-wegao@suse.com>
References: <20230120010533.11202-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/2] Refactor semaphore
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
  Move semaphore/ tests to semop/
  semop04:Refactor with new API

 runtest/syscalls                              |   2 +
 testcases/kernel/ipc/semaphore/.gitignore     |   2 -
 testcases/kernel/ipc/semaphore/Makefile       |  30 ----
 testcases/kernel/ipc/semaphore/sem01.c        | 164 ------------------
 .../kernel/syscalls/ipc/semop/.gitignore      |   2 +
 testcases/kernel/syscalls/ipc/semop/Makefile  |   5 +-
 testcases/kernel/syscalls/ipc/semop/semop04.c | 137 +++++++++++++++
 .../sem02.c => syscalls/ipc/semop/semop05.c}  |   0
 8 files changed, 145 insertions(+), 197 deletions(-)
 delete mode 100644 testcases/kernel/ipc/semaphore/.gitignore
 delete mode 100644 testcases/kernel/ipc/semaphore/Makefile
 delete mode 100644 testcases/kernel/ipc/semaphore/sem01.c
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop04.c
 rename testcases/kernel/{ipc/semaphore/sem02.c => syscalls/ipc/semop/semop05.c} (100%)

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
