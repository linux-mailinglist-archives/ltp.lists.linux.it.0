Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA54C8D94
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 15:23:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F6533CA2CB
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 15:23:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 498823CA08D
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 15:23:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 644C87DEB01
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 15:23:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87914218A9;
 Tue,  1 Mar 2022 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646144604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xBeYZG1vb4u5dS4LjB/3WmxRf9UgKjHkq7RiQ/lukp0=;
 b=OyNEeHFzJLWZqcxZ7CNB6scQ1ayN+c+JobpMAqf4QcpRxZ6OVYZfJdz3ft2bO/5BI5H4ZM
 YZnXkfYRhu6D0NaNjE6aamG3ZxRcxAOH7xB85M9Yck4cOt6PGg1k/RCj++bD0oZKYeEwTq
 OBnGaxVc3E7FL6dwI+m9rGKZa2eZ4ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646144604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xBeYZG1vb4u5dS4LjB/3WmxRf9UgKjHkq7RiQ/lukp0=;
 b=ezHsjRFFUXEtPgTE/BefjdjiaQ+IjJLbqYTaCN0UcYgD4OxAb59uMSPqM1+XrkCI8mPhIF
 5zes625uhbi/FSBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 509BB13B67;
 Tue,  1 Mar 2022 14:23:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z4ziEVwsHmJ8aAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 01 Mar 2022 14:23:24 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue,  1 Mar 2022 15:23:20 +0100
Message-Id: <20220301142322.31885-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/2] aio-stress test refactoring
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Introduced new LTP API in the aio-stress test and updated runtest files
according with the new test options.

Andrea Cervesato (2):
  Rewrite aio-stress test using LTP API
  Update ltp-aio-stress suites using new options

 runtest/ltp-aio-stress.part1                | 146 ++--
 runtest/ltp-aio-stress.part2                |  64 +-
 testcases/kernel/io/ltp-aiodio/aio-stress.c | 892 ++++++++------------
 3 files changed, 455 insertions(+), 647 deletions(-)

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
