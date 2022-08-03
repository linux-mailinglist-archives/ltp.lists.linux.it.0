Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA15F589175
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 19:32:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 880FC3C920E
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 19:32:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC1733C55FE
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 19:32:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B9AA010007EA
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 19:32:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3F993E8A9;
 Wed,  3 Aug 2022 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659547936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0zolso21gIIYgt/NVDVnyPudwarrGOFdNb/MuQYrTSc=;
 b=qv7I4F0RkfNXR+bwstcSHy/FVgDnDnDoq0M0rJt937T6EYVmGiX+ys23ROwKWuU7bdPjdU
 hMI2Py04t+YIeL5dW84Ro1R0Ot6P4x/ZQRMSHEBm+AN/rnYSYGExyNnm73eaahbgELWs0j
 Ez1eaOroHpiDY2x6QWFZjxkrr8ERaHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659547936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0zolso21gIIYgt/NVDVnyPudwarrGOFdNb/MuQYrTSc=;
 b=keixfypQ5H+ldwvcs85XoWkt6LL8C897zTc3DBTFMXVnmCAhtBQ98yB1KcL0pl6sTR8VCp
 w61YBlvxA8y2TuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E02813A94;
 Wed,  3 Aug 2022 17:32:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p65fGyCx6mLOawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Aug 2022 17:32:16 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  3 Aug 2022 19:32:11 +0200
Message-Id: <20220803173211.14292-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] aiodio: Fix format string for 32bit
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 32bit char pointer is int and size_t is unsigned int,
Cast to long / unsigned long.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

IMHO %zu is C99, we don't define -std and my gcc 12 uses by default -std=gnu17.
Therefore I'm surprised that %zu does not work.

Based on Andrea patch:
https://patchwork.ozlabs.org/project/ltp/patch/20220803120905.3107-1-andrea.cervesato@suse.com/

Kind regards,
Petr

 testcases/kernel/io/ltp-aiodio/common.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/common.h b/testcases/kernel/io/ltp-aiodio/common.h
index d9cbd8611..283f7f5db 100644
--- a/testcases/kernel/io/ltp-aiodio/common.h
+++ b/testcases/kernel/io/ltp-aiodio/common.h
@@ -19,7 +19,7 @@ static inline char *check_zero(char *buf, int size)
 		if (*buf != 0) {
 			tst_res(TINFO,
 				"non zero buffer at buf[%lu] => 0x%02x,%02x,%02x,%02x",
-				buf - p, (unsigned int)buf[0],
+				(long)(buf - p), (unsigned int)buf[0],
 				size > 1 ? (unsigned int)buf[1] : 0,
 				size > 2 ? (unsigned int)buf[2] : 0,
 				size > 3 ? (unsigned int)buf[3] : 0);
@@ -78,8 +78,8 @@ static inline void io_read(const char *filename, int filesize, volatile int *run
 			if (r > 0) {
 				bufoff = check_zero(buff, r);
 				if (bufoff) {
-					tst_res(TINFO, "non-zero read at offset %zu",
-						offset + (bufoff - buff));
+					tst_res(TINFO, "non-zero read at offset %lu",
+						(long int)offset + (bufoff - buff));
 					break;
 				}
 				offset += r;
-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
