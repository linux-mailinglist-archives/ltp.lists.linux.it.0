Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B425A4C8797
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 10:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BF373CA300
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 10:15:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B338E3CA2BD
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 10:15:21 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1AE5E601483
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 10:15:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3ABD921637;
 Tue,  1 Mar 2022 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646126120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L4KgLzP1o8oicRXm95UwcoAHlYNzBfblyWYy/xkl8jI=;
 b=LFhzNpZwAZ3LjiBt5CIC/hTH2AH9VPd2q2fJeBq82Z925qFQkXHleHuvZ1NrwLlZmMerNZ
 kYy8h+F3Bt0Q9E9Gks9ekBkHLAEgg1RkvLm0HGE5r4HwtOkfS4NNW0g20hbcpnCC4nZBYi
 AHfKDfDJOYu73qm2iZxFZu8V5sQ2NJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646126120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L4KgLzP1o8oicRXm95UwcoAHlYNzBfblyWYy/xkl8jI=;
 b=xBdFPdRGqzU3MKR0Ku6MOzgbQOgP/TWAPrAgden4ITAicDooOWG7PRWV5ouKdajtPuGdrb
 2GNJQo5QbvnsJJBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C485113B08;
 Tue,  1 Mar 2022 09:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B6A3KifkHWJ3VwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 01 Mar 2022 09:15:19 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue,  1 Mar 2022 10:15:11 +0100
Message-Id: <20220301091517.11142-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/6] Rewrite mountns testing suite
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

mountns testing suite has been rewritten using new LTP API and libclone
has been removed from dependences.

Andrea Cervesato (6):
  Rewrite mountns01 test using new LTP API
  Rewrite mountns02 test using new LTP API
  Rewrite mountns03 test using new LTP API
  Rewrite mountns04 test using new LTP API
  Removed obsolete mountns_helper.h
  Removed libclone usage from mountns testing suite

 testcases/kernel/containers/mountns/Makefile  |  21 +-
 testcases/kernel/containers/mountns/mountns.h |  50 +++++
 .../kernel/containers/mountns/mountns01.c     | 185 +++++++---------
 .../kernel/containers/mountns/mountns02.c     | 186 +++++++---------
 .../kernel/containers/mountns/mountns03.c     | 206 +++++++-----------
 .../kernel/containers/mountns/mountns04.c     | 109 ++++-----
 .../containers/mountns/mountns_helper.h       |  61 ------
 7 files changed, 334 insertions(+), 484 deletions(-)
 create mode 100644 testcases/kernel/containers/mountns/mountns.h
 delete mode 100644 testcases/kernel/containers/mountns/mountns_helper.h

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
