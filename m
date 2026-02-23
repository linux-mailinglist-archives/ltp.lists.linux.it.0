Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPK8E8IynGkKAgQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F3175333
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771844288; h=date : to :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=MnNRQ/9bSJl2EC74w4xizidq+SWGoECrOXMBhbltJ8w=;
 b=SaGcMlKHRAFoJwUzm1GFgXRPBGeu+OnY+2x4hH6i4CaLFbBYy9kxL7Xi5oB6gtjAFQEwc
 DPVOQczAfWbBXwLRKzyx6tTwpSXpqe02xX9vMAc5enNigqsZawq3M+AqrlOoowRVqubkeOs
 2bGVZCW/goFyoS+qLusGxJY3qMsjvgM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5CCA3D0EF2
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Feb 2026 11:58:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1B2D23C7C41
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:28 +0100 (CET)
Received: from lf-1-131.ptr.blmpb.com (lf-1-131.ptr.blmpb.com
 [103.149.242.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D53EB1A00245
 for <ltp@lists.linux.it>; Mon, 23 Feb 2026 04:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1771816696; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lgz26iRoNLXrakDTd1oz5hGJkO9cQ5KBGDvtOFjCr5E=;
 b=QQOdpO2/ta2vcchlW6pnCN6nuGo+Jr5PGSKfuksRT1kKGttNQ9iPStd1AWmdODrI0+GXh0
 jNQYVJj7C2BRzpV3Ma8smAV2nCfLZ+6v6Ow4cxBmyz2xhWBMF8FV5aq77y0oBtTRdiFcdN
 pqRh4RFceG+9Hex9UKzPfvy6p/WT68K/DGrKuDiDmeXQM0sUEW7wdm5h5i/oosLgqHwgh1
 /rOGkLrri1Fb1XYiEH1i3QCzNZoiDc9L4U8Lapn3eaL7d0VpVfzR1RlAshsp9P1YoqzT7m
 3x9BJe+WSXBPQ5g/vJb3cx8OlbMGzYJJQA56sl54zTL7S9XKeRNHekITkR19BQ==
Date: Mon, 23 Feb 2026 11:18:59 +0800
To: <ltp@lists.linux.it>
X-Mailer: git-send-email 2.20.1
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Message-Id: <20260223031903.4037526-1-weiguixiong@bytedance.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2699bc6f7+43e3c1+lists.linux.it+weiguixiong@bytedance.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 23 Feb 2026 11:57:56 +0100
Subject: [LTP] [PATCH 0/4] syscalls/ipc: shmctl04: Fix /proc/sysvipc/shm
 parsing
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
From: Guixiong Wei via ltp <ltp@lists.linux.it>
Reply-To: Guixiong Wei <weiguixiong@bytedance.com>
Cc: Guixiong Wei <weiguixiong@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[bytedance.com:s=2212171451];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,bytedance.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[weiguixiong@bytedance.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,bytedance.com:mid,bytedance.com:replyto,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: AD3F3175333
X-Rspamd-Action: no action

Hi,

This series fixes shmctl04 parsing and reporting for /proc/sysvipc/shm.

On systems with large SHM segments, the "bytes" column in /proc/sysvipc/shm may
exceed int range, which can lead to truncation and incorrect accounting. The
series parses the size column as unsigned long, requires fscanf() to match all
expected fields to avoid using stale values on partial matches, fixes format
specifiers when reporting counters, and uses SAFE_FOPEN/SAFE_FCLOSE for /proc
reads.

Thanks.

Guixiong Wei (4):
  syscalls/ipc: shmctl04: Parse /proc/sysvipc/shm size as unsigned long
  syscalls/ipc: shmctl04: Require full fscanf match
  syscalls/ipc: shmctl04: Use SAFE_FOPEN for /proc parsing
  syscalls/ipc: shmctl04: Fix shm_info print formats

 .../kernel/syscalls/ipc/shmctl/shmctl04.c     | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
