Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A946409665
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 16:51:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA70D3C92A3
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 16:51:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 236063C4EE0
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 16:51:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4DE5B1A00CA9
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 16:51:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D04A1FFF3;
 Mon, 13 Sep 2021 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631544661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GzF3V1hrrvABiYT69ZF2Qr/bCsy9oCVHCZVulQDcHgA=;
 b=F0sAQdwe2yEpnWNWfzAzqI2gSDz4adL3L7sbjK+EtblNd1ZJajw1ZbGpsA+q/qwKbuooVf
 /5S6BYzOn8vBhQxZ0g7F+eCVoS3kJCNWZsiMnygmuUBvwxyHAosm8X0u6Vjo26c5FOQlrH
 8cujhEfEzGiFQvJXR7hsaZlwnSR+hVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631544661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GzF3V1hrrvABiYT69ZF2Qr/bCsy9oCVHCZVulQDcHgA=;
 b=6IXQBnPHmyNZzZrt4+LgjUuQI53qsdw0VO4BDJPDkeR6tKL+TT32FpcdSDT98rv0VLdmQ4
 mqCDguo9fcvOOnDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6511F13AAB;
 Mon, 13 Sep 2021 14:51:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nTAmGVVlP2EfcgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 13 Sep 2021 14:51:01 +0000
Date: Mon, 13 Sep 2021 16:51:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YT9laHIulnmtBSgK@yuki>
References: <20210909155126.2720-1-mdoucha@suse.cz>
 <20210909155126.2720-8-mdoucha@suse.cz>
 <287a9879ef8b3342cb88225e4e319733@suse.de>
 <3b789dc4-5232-a6d6-d864-7f75c5a0a030@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b789dc4-5232-a6d6-d864-7f75c5a0a030@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/8] syscalls/setresuid03: Convert to new API
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
Cc: pvorel <pvorel@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> -?????? if (getpwnam("bin") == NULL) {
> >> -?????????????? tst_brkm(TBROK, NULL, "bin must be a valid user.");
> >> +?????? if (TST_ERR != tc->exp_errno) {
> > nit: checkpatch complains (TST_ERR should be second)
> 
> checkpatch.pl wrongly assumes that TST_ERR is a constant.

Good catch, I guess that we will have to patch checkpatch to ignore
macros that start with TST_, what about?

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88cb294dc..87572b2f4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5462,7 +5462,9 @@ sub process {
                        my $comp = $3;
                        my $to = $4;
                        my $newcomp = $comp;
-                       if ($lead !~ /(?:$Operators|\.)\s*$/ &&
+
+                       if ($const !~ /^\QTST_/ &&
+                           $lead !~ /(?:$Operators|\.)\s*$/ &&
                            $to !~ /^(?:Constant|[A-Z_][A-Z0-9_]*)$/ &&
                            WARN("CONSTANT_COMPARISON",
                                 "Comparisons should place the constant on the right side of the test\n" . $herecurr) &&


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
