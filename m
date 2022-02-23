Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8A4C16DB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6A363C9B9E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Feb 2022 16:33:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B524E3C979B
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 18159206503
 for <ltp@lists.linux.it>; Wed, 23 Feb 2022 16:32:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A73F21637;
 Wed, 23 Feb 2022 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645630377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBgkRtPpgD7+nEMynk7/AXAmTudcyDTG5kv0iXiXOPk=;
 b=DlwFvcws03MCq/T1be+wPDkB9PCbz3d1oXK6Juk0tqQE7cRbd1AWUFyuF8KIOL15XLCbBA
 +lbn4GjztGJOlfTg38tZvLnl1Pyf6oc3I9TPo1hlz+DRI6DQXf34MtUGGegavQMdImIot9
 +OHkc8+01lGpl6Bwma9upmaJWqZBqFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645630377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBgkRtPpgD7+nEMynk7/AXAmTudcyDTG5kv0iXiXOPk=;
 b=/YG5/fZFbCHIULYBeeunwJ8cAO7JzjK5YTI51tBvWdjbBnXdAgWvOqivQLJ/lOw3Rg864e
 WNBHbPNA+uMaBYBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF9E713D88;
 Wed, 23 Feb 2022 15:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iMfrLKhTFmKZawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 23 Feb 2022 15:32:56 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Feb 2022 16:32:40 +0100
Message-Id: <20220223153243.317-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] quotactl ESRCH fixes
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

Hi,

simple cleanup to use already provided errno ESRCH handling.

Fortunately all tests which require do_mount() use
quotactl_syscall_var.h, thus I didn't have to introduce yet another
header.

Kind regards,
Petr

Petr Vorel (3):
  quotactl: Move do_mount() to header
  quotactl08: Use do_mount()
  quotactl09: Use do_mount()

 .../kernel/syscalls/quotactl/quotactl04.c     | 25 ++-----------------
 .../kernel/syscalls/quotactl/quotactl08.c     |  2 +-
 .../kernel/syscalls/quotactl/quotactl09.c     | 16 +++++++++---
 .../syscalls/quotactl/quotactl_syscall_var.h  | 25 +++++++++++++++++--
 4 files changed, 39 insertions(+), 29 deletions(-)

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
