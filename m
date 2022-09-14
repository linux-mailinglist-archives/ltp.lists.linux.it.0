Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508465B8CC1
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 18:20:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F414C3CAC05
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Sep 2022 18:20:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28A253CABB3
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 18:19:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 232F2601F7F
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 18:19:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42D3B20334
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663172371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VzsygHjVQGdu4kz1SzgLBHjArGNQGNrJrzwL9VQZQEo=;
 b=ET/2QdJSgO80hWIY7M1XBirw2XFj9+QACZATq6LJmtHyWXOF1V7qEhFVaH2UjKNDGINORZ
 awwR3YONtm2om8/3pIB/eVUzMW98Eynj2Rj11r+f2OvMxf4ERXqHmcerHne9cYHzkFup4G
 hJTOgq5katVhP4oCquYN9zLot2Ek5YQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663172371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VzsygHjVQGdu4kz1SzgLBHjArGNQGNrJrzwL9VQZQEo=;
 b=LtcTvUIwP4k4NvpuzXMH5491CkLhLjJ+Q+x+X4WjhrY6/3dt2yVTZGeLUc/2NFKkOd2eXB
 UMMs7zEc5ratofAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 283C7134B3
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KLHaCBP/IWMwYgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 14 Sep 2022 16:19:31 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Sep 2022 18:19:25 +0200
Message-Id: <20220914161930.27681-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/5] Max_runtime timeout fixes
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

The introduction of max_runtime system shortly before the latest LTP release
has caused some random timeout issues, particularly for sendfile09 and
ioctl_sg01. This patchset fixes those issues.

All of these patches are independent and can be merged out of order.

Martin Doucha (5):
  ioctl_sg01: Add max_runtime
  copy_file_range01: Add max_runtime
  perf_event_open02: Add max_runtime
  readahead02: Add max_runtime
  sendfile09: Add max_runtime

 .../kernel/syscalls/copy_file_range/copy_file_range01.c  | 1 +
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c             | 1 +
 .../kernel/syscalls/perf_event_open/perf_event_open02.c  | 1 +
 testcases/kernel/syscalls/readahead/readahead02.c        | 9 +++++++--
 testcases/kernel/syscalls/sendfile/sendfile09.c          | 1 +
 5 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
