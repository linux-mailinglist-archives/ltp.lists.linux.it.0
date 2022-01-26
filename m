Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF949D183
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 19:13:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D81D83C9722
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 19:13:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03A8A3C9714
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 19:12:17 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D995E140009D
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 19:12:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5C4C218F3;
 Wed, 26 Jan 2022 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643220735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pMJJHWFTKC7tKn3xchFnB//WUiScnWWc4fhw8PXBJm4=;
 b=QOVKQkK4qKCNBvEjyFoq3sNMUy9XZD8qbtT2T2Sf7AUNToroSJ17jHUFMMOuxU/CQ/Hoc1
 e1+nLi/eS7viQx6Wr+pmiJlXoVQsu2S11AAnizAFJIk1Ff2JvScae+QVSnzN5hh27JvFHg
 5PnNQvGbVtBF0fLhC+KNVz8rttxJ8dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643220735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pMJJHWFTKC7tKn3xchFnB//WUiScnWWc4fhw8PXBJm4=;
 b=pyq/Y0kUp2y6osrmXLyaybxPdgqShItRYbydPYff0ITxJjl1iL6MQmK5wxG2an8X0JJ9+x
 aOfMC06I3KBw2EDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BA6D13E30;
 Wed, 26 Jan 2022 18:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LREWI/+O8WGbcQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 26 Jan 2022 18:12:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 Jan 2022 19:12:05 +0100
Message-Id: <20220126181210.24897-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] shell: Add TST_FORMAT_DEVICE support
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

it's nice to sync with C API, but I don't expect that many tests would
need formatting device.  The main reason is to preparation for
TST_ALL_FILESYSTEMS support (useful for NFS tests).

Kind regards,
Petr

Petr Vorel (5):
  tst_test.sh: Add $TST_DEFAULT_FS_TYPE
  tst_test.sh: tst_mkfs(): Add support for extra opts
  tst_test.sh: Add $TST_FORMAT_DEVICE and related vars
  df01.sh: Use TST_FORMAT_DEVICE=1
  shell: Add test for TST_FORMAT_DEVICE=1

 doc/shell-test-api.txt                      |  9 +++++++-
 lib/newlib_tests/shell/tst_format_device.sh | 24 ++++++++++++++++++++
 testcases/commands/df/df01.sh               |  7 ++----
 testcases/commands/mkfs/mkfs01.sh           |  4 ++--
 testcases/lib/tst_test.sh                   | 25 ++++++++++++---------
 5 files changed, 51 insertions(+), 18 deletions(-)
 create mode 100755 lib/newlib_tests/shell/tst_format_device.sh

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
