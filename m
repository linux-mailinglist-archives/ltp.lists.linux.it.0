Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEF5B5937
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 13:21:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E44C3CAAE6
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 13:21:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A93F83C0475
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 13:21:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A86E60071A
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 13:21:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A55D22482;
 Mon, 12 Sep 2022 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662981684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yXZhgkr4Z8bt+JZCTdEyAlkWt5xoznp4foeE0Rt2Hb0=;
 b=JNzW2sXiGqIJKRmIjjEnTlDXUHfn+syzAgskQXqsVwJUV2iypow5kXUhzbF0Ejjlo9X6fS
 LaLL6GWKdFEMMN0Hho4gF76AF0xUIB46VjwN9JyMzDP5iMAk8tehU438/s7mY37+K9bUZw
 la+/RtlbgdGOjR6VLBdiMVQs1ASpdek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662981684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yXZhgkr4Z8bt+JZCTdEyAlkWt5xoznp4foeE0Rt2Hb0=;
 b=0GKQenwNGIViye/cUpdrg6x1b3SMB7bb7JiGya+MMwYsBYZ/ZCAWurVlF2f0UAw9ICKTG1
 2traQ2WiwtAYDWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6EBE139E0;
 Mon, 12 Sep 2022 11:21:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vtspMTMWH2OXdgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Sep 2022 11:21:23 +0000
Date: Mon, 12 Sep 2022 13:21:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <Yx8WMboYVwZa9/VF@pevik>
References: <20220909141840.18327-1-pvorel@suse.cz>
 <20220909141840.18327-6-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909141840.18327-6-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 05/10] tst_supported_fs: Support skip list when
 query single fs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

thread for v4 [1] [2] should have been for v5.

Therefore repeat here there will be diff below:
FYI if anybody wants to test v5 with this fix, it's in my fork in branch
shell/all_filesystems.v5.fixes [3]

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/5e01e854-7cc6-7b08-d1f8-7f0709fbc07d@suse.cz/
[2] https://lore.kernel.org/ltp/Yx7GPOsudkoRn5Nd@pevik/
[3] https://github.com/pevik/ltp/commits/shell/all_filesystems.v5.fixes

diff --git lib/tst_supported_fs_types.c lib/tst_supported_fs_types.c
index 35ec82071..80d0d163a 100644
--- lib/tst_supported_fs_types.c
+++ lib/tst_supported_fs_types.c
@@ -138,17 +138,10 @@ enum tst_fs_impl tst_fs_is_supported(const char *fs_type)
 enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
 					      *const *skiplist)
 {
-	int ret;
-
-	ret = tst_fs_is_supported(fs_type);
-
-	if (!ret)
-		return ret;
-
 	if (tst_fs_in_skiplist(fs_type, skiplist))
 		return TST_FS_UNSUPPORTED;
 
-	return ret;
+	return tst_fs_is_supported(fs_type);
 }
 
 const char **tst_get_supported_fs_types(const char *const *skiplist)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
