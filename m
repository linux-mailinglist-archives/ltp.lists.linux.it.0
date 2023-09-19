Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5B7A61A3
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Sep 2023 13:47:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A31A3CE458
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Sep 2023 13:47:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 106143CBED4
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 13:47:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F77B1400B9A
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 13:47:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFE991FE8B
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695124022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vqScj5J5uhy2KuyvPNr2fRdgfkfOUnvgxFlbtc3MNA=;
 b=195K7C9LnL9/iATUkLcfIPWZCg7ifDMylqF3XJ+dCGq3sEVIBA2uHXSsnVz65ebchmGjH+
 FB7JLkhYxBsYWQ0QlcuLaltQ8lWnyvCh8IkxXz9z4TdIMVnGa/PMGElbSRdXr+wouly8nS
 5JmwgLhfP2+AKtyS8XvT4E/8XBDBSSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695124022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vqScj5J5uhy2KuyvPNr2fRdgfkfOUnvgxFlbtc3MNA=;
 b=eG2xQ8IM/+kydodIFx1Hk1gHfA3+CcpfFWE00tYO7R+dPh/rrd0x2aE07iTduJMfKT+cZx
 p/3HN3U1fKNPzLCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4D2013A49
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 11:47:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WEAqMzaKCWX8eAAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 11:47:02 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 Sep 2023 13:46:59 +0200
Message-ID: <20230919114701.15327-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919114701.15327-1-mdoucha@suse.cz>
References: <20230919114701.15327-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] nfs_lib.sh: Fail the test if NFS unmount fails
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index a996f7cc8..099c78759 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -214,7 +214,7 @@ nfs_cleanup()
 		local_dir="$(get_local_dir $i $n)"
 		if grep -q "$local_dir" /proc/mounts; then
 			tst_res TINFO "Unmounting $local_dir"
-			umount $local_dir
+			umount $local_dir || tst_res TFAIL "Unmount failed"
 		fi
 		n=$(( n + 1 ))
 	done
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
