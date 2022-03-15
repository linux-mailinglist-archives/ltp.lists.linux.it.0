Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A54D98CD
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 11:33:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BD1B3C91FE
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 11:33:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25FFE3C20CC
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 11:32:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 96D911000A4D
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 11:32:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0641F37E;
 Tue, 15 Mar 2022 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647340377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i+IMrvFANSdnloUMrdPIHZxjZ9h7/fZdqbqSOT9D5Ag=;
 b=06NJtCJvwIGiKKbzDR45uhYGOFeti980KGaNJUZGi1eQ4IpEd62eDihzD8Nnz94bx8lYEZ
 JiIODCv5jLsX3SzdC6mZ8QGvYzsZDXXmRnyqtICB9mRjOS/97FJT5FleMcPcMU3IHFGe+T
 wyahcitEfiAMz7f/Ywo5Xe1Ukh2TK+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647340377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i+IMrvFANSdnloUMrdPIHZxjZ9h7/fZdqbqSOT9D5Ag=;
 b=mriC9X7hfuPvDBtJgYqnkdwyVJC2IeJWTsTNwFPnE925VX+3/XgR81AWR89Xl9zkfTLZdr
 TxhZ6m44izRCvDBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53C8313B59;
 Tue, 15 Mar 2022 10:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j2i3DllrMGKHHwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 15 Mar 2022 10:32:57 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue, 15 Mar 2022 11:32:44 +0100
Message-Id: <20220315103254.7185-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 00/10] Rewrite sysvipc testing suite using new LTP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rewritten all sysvipc tests and removed libclone dependency.
Removed TST_CHECKPOINT_INIT from all tests and replaced it with the
.checkpoints support.

Andrea Cervesato (10):
  Rewrite mesgq_nstest.c using new LTP API
  Rewrite msg_comm.c using new LTP API
  Rewrite sem_comm.c using new LTP API
  Rewrite sem_nstest.c using new LTP API
  Rewrite semtest_2ns.c using new LTP API
  Rewrite shmnstest.c using new LTP API
  Rewrite shmem_2nstest.c using new LTP API
  Rewrite shm_comm.c using new LTP API
  Remove libclone dependency from sysvipc test suite
  Delete ipcns_helper.h in the sysvipc test suite

 runtest/containers                            |  30 +-
 testcases/kernel/containers/sysvipc/Makefile  |  26 +-
 testcases/kernel/containers/sysvipc/common.h  | 108 ++++++
 .../kernel/containers/sysvipc/ipcns_helper.h  |  41 ---
 .../kernel/containers/sysvipc/mesgq_nstest.c  | 243 +++++--------
 .../kernel/containers/sysvipc/msg_comm.c      | 180 +++-------
 .../kernel/containers/sysvipc/sem_comm.c      | 180 +++-------
 .../kernel/containers/sysvipc/sem_nstest.c    | 210 ++++-------
 .../kernel/containers/sysvipc/semtest_2ns.c   | 326 +++++++-----------
 .../kernel/containers/sysvipc/shm_comm.c      | 167 +++------
 .../kernel/containers/sysvipc/shmem_2nstest.c | 239 +++++--------
 .../kernel/containers/sysvipc/shmnstest.c     | 180 ++++------
 12 files changed, 717 insertions(+), 1213 deletions(-)
 create mode 100644 testcases/kernel/containers/sysvipc/common.h
 delete mode 100644 testcases/kernel/containers/sysvipc/ipcns_helper.h

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
