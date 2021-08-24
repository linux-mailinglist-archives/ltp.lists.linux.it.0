Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A41D3F5E49
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:46:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B62F83C31FA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:46:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 296C73C3189
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:46:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 42E1E140112D
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:46:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4AE31FD8B;
 Tue, 24 Aug 2021 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629809215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QYrkh4Pvk5bGOanCa33rGoLes2xlfGP0ooYR8e6e6F4=;
 b=S+3xw3d022RDHvauEgU98I+jMw0tBaza/GfSyTh31iHu3/UAUYtbo+dz+cr7792mo1kNUE
 aK4GHvo4hLacfz8W9VMU6hc09uNxKohUHKxuAXOrsd5rKWj75yQfCSeAWSd14vcbFK4YDc
 1euim8jS3UQZJRfhb0olODs9iPeK5Z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629809215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QYrkh4Pvk5bGOanCa33rGoLes2xlfGP0ooYR8e6e6F4=;
 b=WiZd0L8ot0KawL+JSLjRZXM8R9jy10zexDwatOCWPIEx6fpGe5bUdMSS9PH6E7vtsgBi3E
 sBUnogXzNP/0jVCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3EAB413A54;
 Tue, 24 Aug 2021 12:46:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id EmKFDT/qJGF0KwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 24 Aug 2021 12:46:55 +0000
Date: Tue, 24 Aug 2021 14:46:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YSTqPdIl493giI1t@pevik>
References: <YSTj7CB6PdG2HZsQ@ubuntu02>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSTj7CB6PdG2HZsQ@ubuntu02>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7,
 4/4] Make argument to tst_umount an absolute path
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

Also evm_overlay.sh needs to be fixed, I'll change it before merge:

+++ testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
@@ -34,7 +34,7 @@ setup()
 	TST_FS_TYPE="overlay"
 
 	mntpoint_backup="$TST_MNTPOINT"
-	TST_MNTPOINT="$merged"
+	TST_MNTPOINT="$PWD/$merged"
 
 	params_backup="$TST_MNT_PARAMS"
 	TST_MNT_PARAMS="-o lowerdir=$lower,upperdir=$upper,workdir=$work"

Reviewed-by: Petr Vorel <pvorel@suse.cz>
for whole patchset.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
