Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EyDOFuCmGlMJQMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:48:43 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B7169079
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:48:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CE3E3D0861
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 16:48:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 61F503D085E
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 16:47:53 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 060CB200213
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 16:47:52 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34DDF3E725;
 Fri, 20 Feb 2026 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771602468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvTXUl9qbfn0OuG2l/XfEbh8IznF7bDqRGjn/B6K0mo=;
 b=thbrIQMxc7DNXRg0+gNpJDtg5oDOxKT2zVkTNeNIP3Mx5EC2hqmBzm9wK4az1bK/WNsNfQ
 eFzXHEy3jD6obD+rrW+BRm2zQBN8NA2Ceg+P4ZanZbepxN+QnK2zMvEFwuSKFbqndWJsxw
 hJQSJp90nHrir5cMjJZjMZ281dILQ6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771602468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvTXUl9qbfn0OuG2l/XfEbh8IznF7bDqRGjn/B6K0mo=;
 b=KoLmfmwgeirc2NETg9NTbcVttfp2Q/gcAcgtbQFz0Z86k2dqR3EEcuspT/vXSHypQ/dTIy
 hYIDpVha2D6+j2DA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=QG7IXJto;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="/6D11Ig6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771602467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvTXUl9qbfn0OuG2l/XfEbh8IznF7bDqRGjn/B6K0mo=;
 b=QG7IXJtos8rmhM07EkW7z2it1e0lnwpRubr7wb86A9vxTbTbt7Y+hsgP9zyHX7ak1OZiaj
 bbup8gc1rYwKD0CNTJSnDeYE5G41u1fjmfMQjRds49Qcyn02Qxru0qaX2uyzEQ4D5BBKGy
 L3y16jN+NOWtqCsJcpcHJjbERQei5b4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771602467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvTXUl9qbfn0OuG2l/XfEbh8IznF7bDqRGjn/B6K0mo=;
 b=/6D11Ig6saaNk8XAxXR6EGkKOCBh+p4yt9w4ieUgPtcvlMS5s7bxyZT6sVYXdnUB/WtM38
 FTrj7/cTAlSo1rDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13A3A3EA66;
 Fri, 20 Feb 2026 15:47:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6L+ZBCOCmGkmdwAAD6G6ig
 (envelope-from <mdoucha@suse.cz>); Fri, 20 Feb 2026 15:47:47 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ppavlu@suse.cz,
	ltp@lists.linux.it
Date: Fri, 20 Feb 2026 16:47:08 +0100
Message-ID: <20260220154742.54150-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220154742.54150-1-mdoucha@suse.cz>
References: <20260220154742.54150-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] tst_fs.h: Add TST_TRACEFS_MAGIC constant
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mdoucha@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,suse.cz:mid,suse.cz:email]
X-Rspamd-Queue-Id: 8F7B7169079
X-Rspamd-Action: no action

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index ceae78e7e..6dfa157a5 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -11,6 +11,7 @@
 #define TST_NFS_MAGIC      0x6969
 #define TST_RAMFS_MAGIC    0x858458f6
 #define TST_TMPFS_MAGIC    0x01021994
+#define TST_TRACEFS_MAGIC  0x74726163
 #define TST_V9FS_MAGIC     0x01021997
 #define TST_XFS_MAGIC      0x58465342
 #define TST_EXT2_OLD_MAGIC 0xEF51
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
