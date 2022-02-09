Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F114AF63D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 17:13:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9279E3C9D96
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 17:13:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0420F3C9C7F
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 17:13:14 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A997200D24
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 17:13:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A336A1F383;
 Wed,  9 Feb 2022 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644423193;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4A74q+i6nb5hc9mfFrVQveNvVqSoZjqEuhNewqS1EgI=;
 b=bbTzRCsQ+f4aKWpkOFJP8OTy54tvglByRpHt48ysHc28vusVqnQtakRsqfIplGvPtTeLuz
 rxK2S/JRW/9zHDO7zN2OMG9aiyEfctFwPN+ewm++/y6rL3I9KY1QvQfGUlwrfyWEJB4sNQ
 BnS6iySUGF6ib3U0McwyTcHMWIK7ToY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644423193;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4A74q+i6nb5hc9mfFrVQveNvVqSoZjqEuhNewqS1EgI=;
 b=WoOvxSJRQONFH2n8BLI3An+EN25Ij6XYgiUs6uMkJbXeePE9cI5kACiiR6jMID5l8IiCB4
 gkzpORgPxlTHZtAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78D9513D58;
 Wed,  9 Feb 2022 16:13:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7ggKGxnoA2LNJQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 09 Feb 2022 16:13:13 +0000
Date: Wed, 9 Feb 2022 17:13:11 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YgPoF/A7o8hCuYhR@pevik>
References: <20220126181210.24897-1-pvorel@suse.cz>
 <20220126181210.24897-3-pvorel@suse.cz> <YgJ47NfU3vP3XcyE@yuki>
 <YgKxkgXjqRXfHDF1@pevik> <YgK2a1maq9GGsgnZ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgK2a1maq9GGsgnZ@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] tst_test.sh: tst_mkfs(): Add support for
 extra opts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

this commit si going to be replaced by this code:

+++ testcases/lib/tst_test.sh
@@ -342,19 +342,21 @@ tst_umount()
 tst_mkfs()
 {
 	local fs_type=${1:-$TST_FS_TYPE}
-	local device=${2:-$TST_DEVICE}
 	[ $# -ge 1 ] && shift
-	[ $# -ge 1 ] && shift
-	local fs_opts="$@"
 
-	if [ -z "$device" ]; then
-		tst_brk TBROK "No device specified"
+	local opts="$@"
+
+	if [ -z "$opts" ]; then
+		if [ "$TST_NEEDS_DEVICE" != 1 ]; then
+			tst_brk "Using default parameters in tst_mkfs requires TST_NEEDS_DEVICE=1"
+		fi
+		opts="$TST_DEVICE"
 	fi
 
 	tst_require_cmds mkfs.$fs_type
 
-	tst_res TINFO "Formatting $device with $fs_type extra opts='$fs_opts'"
-	ROD_SILENT mkfs.$fs_type $fs_opts $device
+	tst_res TINFO "Formatting $fs_type with opts='$opts'"
+	ROD_SILENT mkfs.$fs_type $opts
 }
 
 # Detect whether running under hypervisor: Microsoft Hyper-V

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
