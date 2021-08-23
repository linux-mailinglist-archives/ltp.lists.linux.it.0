Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA33F4C3D
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 16:19:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D358A3C9E93
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 16:19:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 806DD3C18F7
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 16:19:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F0F651400C4C
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 16:19:51 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4386D21B5A;
 Mon, 23 Aug 2021 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629728391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CnsQz0E5JEZ4LXaa55NNNdMONjlKShkOictxp8+4/40=;
 b=Mz8leW+/cCmrIlqUqrvJ5roGBTEj1wjVnHpDIYkh2zS2EgBKE7LU4y6rJrP5y6CiaIaFNk
 sS5E7UTZgoN/vp9WIVxAj7iMmPQ1jJSdYS+bjZS0Mvdg/l4rQhzWvj82kY6R1osVhf6/a7
 x947LEf0iNGo3gGoDOebiIqTZHAPYo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629728391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CnsQz0E5JEZ4LXaa55NNNdMONjlKShkOictxp8+4/40=;
 b=lXmwkS4TUoUZPufjM15R2ao/wJ4NjDiI0fOUZcOCxWEBp1Xu4IfOZNSv2bOy9E2wZ1bfqe
 dyeDyLW1eC295KBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DD98413B2A;
 Mon, 23 Aug 2021 14:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tXVrNIauI2FkMwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 23 Aug 2021 14:19:50 +0000
Date: Mon, 23 Aug 2021 16:19:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YSOuhTL87oYnwfk3@pevik>
References: <20210804015248.GA22328@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804015248.GA22328@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6,
 1/4] lib: tst_umount: umount a mount point instead of a device
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo,

as I noted at forth patch, some tests use tst_umount with the default parameter.
Thus we should set the default TST_MNTPOINT to use $PWD as well.

I'd also add quotes around $mntpoint in TCONF/TINFO messages in tst_mount() as
the original message was a bit confusing when the mountpoint was called
'mntpoint' (TWARN: The mntpoint is not an absolute path).

Kind regards,
Petr

+++ testcases/lib/tst_test.sh
@@ -279,31 +279,35 @@ tst_mount()
 
 tst_umount()
 {
-	local device="${1:-$TST_DEVICE}"
+	local mntpoint="${1:-$TST_MNTPOINT}"
 	local i=0
 
-	[ -z "$device" ] && return
+	[ -z "$mntpoint" ] && return
 
-	if ! grep -q "$device" /proc/mounts; then
-		tst_res TINFO "The $device is not mounted, skipping umount"
+	if ! echo "$mntpoint" | grep -q ^/; then
+		tst_brk TCONF "The '$mntpoint' is not an absolute path"
+	fi
+
+	if ! grep -q "${mntpoint%/}" /proc/mounts; then
+		tst_res TINFO "The '$mntpoint' is not mounted upon, skipping umount"
 		return
 	fi
 
 	while [ "$i" -lt 50 ]; do
-		if umount "$device" > /dev/null; then
+		if umount "$mntpoint" > /dev/null; then
 			return
 		fi
 
 		i=$((i+1))
 
-		tst_res TINFO "umount($device) failed, try $i ..."
+		tst_res TINFO "umount($mntpoint) failed, try $i ..."
 		tst_res TINFO "Likely gvfsd-trash is probing newly mounted "\
 		              "fs, kill it to speed up tests."
 
 		tst_sleep 100ms
 	done
 
-	tst_res TWARN "Failed to umount($device) after 50 retries"
+	tst_res TWARN "Failed to umount($mntpoint) after 50 retries"
 }
 
 tst_mkfs()
@@ -628,7 +632,7 @@ tst_run()
 		cd "$TST_TMPDIR"
 	fi
 
-	TST_MNTPOINT="${TST_MNTPOINT:-mntpoint}"
+	TST_MNTPOINT="${TST_MNTPOINT:-$PWD/mntpoint}"
 	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
 
 		TST_DEVICE=$(tst_device acquire)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
