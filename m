Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B530F474569
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 15:43:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DBF73C8C4C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 15:43:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A8C73C8BC0
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 15:43:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 031DB60047C
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 15:43:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16E5321124;
 Tue, 14 Dec 2021 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639492993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8SdZAkFQ7Nm1CEJ561yGvSVU2LJ+PEzrgvX72FhfP+c=;
 b=zR66ADT+Je1v96bXGSs8VqfCisgEhUnKB5YLwVroYLmD3exXsDZV6fUQXOjFyor1GSfo3w
 L/J+Cc/iPAp8DCG6wJehWahdbrP6Qt93JUzLu+fBZYPUXoVBPajybjCn6PJXiVGR9pkk6F
 8vniMe62PzK4hKkX9pseUB4gomgotmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639492993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8SdZAkFQ7Nm1CEJ561yGvSVU2LJ+PEzrgvX72FhfP+c=;
 b=mvPqLYhVlsW4oZ8+cK+0thX71VYUHTz/bfE9mSnh/+3ww4rE1BaHsj2FgTILZ01e/PCmN5
 Bvb4TMJoKcOgJgDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4EBA13EA2;
 Tue, 14 Dec 2021 14:43:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7i+cLICtuGEkTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Dec 2021 14:43:12 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Dec 2021 15:43:06 +0100
Message-Id: <20211214144309.6704-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] Add support for debugging .all_filesystems
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

Hi all,

Changes v1->v2:
* 2 new commits (add tst_defaults.h, print variables on -h)
* rename variable to LTP_SINGLE_FS_TYPE

Kind regards,
Petr

Petr Vorel (3):
  lib: Introduce tst_defaults.h
  tst_test: Print environment variables on -h
  lib: Add support for debugging .all_filesystems

 doc/user-guide.txt           |  2 ++
 include/old/ltp_priv.h       | 13 +------------
 include/tst_defaults.h       | 21 +++++++++++++++++++++
 include/tst_private.h        |  1 +
 lib/tst_supported_fs_types.c |  9 +++++++++
 lib/tst_test.c               | 14 ++++++++++++++
 6 files changed, 48 insertions(+), 12 deletions(-)
 create mode 100644 include/tst_defaults.h

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
