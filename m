Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AE3B02B0
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:23:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D96E3C7051
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:23:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4DA813C2192
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:23:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BBF336001F5
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:23:46 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 114811FD45;
 Tue, 22 Jun 2021 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624361026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+Mra0z45Fe84tcmgyUfqfSSbGUwxPKHx+byxR3B4pE=;
 b=a6scGWT8EOYfmtUDDzsjw2Sur8fFsICcTIsIm3y0h2sTK0RSSr29dGbR7vCKJiqIcZnQkh
 BwCfkSCUeLrACSE4nLYdHpixmsLcBLelQANu6GLQl521dvV6X+us14pp4PXjYhHPW+W9RS
 4lfd/K5URNjhPwv8YRpLvkG9hWnFPLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624361026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+Mra0z45Fe84tcmgyUfqfSSbGUwxPKHx+byxR3B4pE=;
 b=CxlDknMbrGaLFSRNNBnljHWSuvIRQl7CeRLujMvNrS2wkAYAIc2XDyMOxNhxrQ/MsRukyp
 I9nY5eKbtJGdhpCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E73A1118DD;
 Tue, 22 Jun 2021 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624361026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+Mra0z45Fe84tcmgyUfqfSSbGUwxPKHx+byxR3B4pE=;
 b=a6scGWT8EOYfmtUDDzsjw2Sur8fFsICcTIsIm3y0h2sTK0RSSr29dGbR7vCKJiqIcZnQkh
 BwCfkSCUeLrACSE4nLYdHpixmsLcBLelQANu6GLQl521dvV6X+us14pp4PXjYhHPW+W9RS
 4lfd/K5URNjhPwv8YRpLvkG9hWnFPLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624361026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+Mra0z45Fe84tcmgyUfqfSSbGUwxPKHx+byxR3B4pE=;
 b=CxlDknMbrGaLFSRNNBnljHWSuvIRQl7CeRLujMvNrS2wkAYAIc2XDyMOxNhxrQ/MsRukyp
 I9nY5eKbtJGdhpCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0wP2NkHI0WDmbAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 22 Jun 2021 11:23:45 +0000
Date: Tue, 22 Jun 2021 12:58:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YNHCQ8qWSBdHIAra@yuki>
References: <1624356737-508-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624356737-508-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] syscalls/ipc: Make use of TST_EXP_FAIL macro
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Since TST_EXP_FAIL macro only recognizes sycalls succeeded when syscalls return 0,
> Can we use this macro directly for the these syscalls's error test? It may result in
> invalid retval value and print errno when syscall succeeded. I think it
> is a nit and it can improve this api usage range. Is it right?

I guess that it would be slightly cleaner to add more generic macro that
allows us to pass the condition for succeess and build TST_EXP_FAIL() on
the top of that. Maybe something as:

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 89dfe5a31..4d41741a4 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -120,13 +120,13 @@ extern void *TST_RET_PTR;
                        TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
        } while (0)                                                            \

-#define TST_EXP_FAIL(SCALL, ERRNO, ...)                                        \
+#define TST_EXP_FAIL_(PASS_COND, SCALL, ERRNO, ...)                            \
        do {                                                                   \
                TEST(SCALL);                                                   \
                                                                               \
                TST_PASS = 0;                                                  \
                                                                               \
-               if (TST_RET == 0) {                                            \
+               if (PASS_COND) {                                               \
                        TST_MSG_(TFAIL, " succeeded", #SCALL, ##__VA_ARGS__);  \
                        break;                                                 \
                }                                                              \
@@ -150,4 +150,8 @@ extern void *TST_RET_PTR;
                }                                                              \
        } while (0)

+#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO)
+
+#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, ERRNO)
+
 #endif /* TST_TEST_MACROS_H__ */

The only hard thing is to find a good name for TST_EXP_FAIL2(), I'm out
of ideas here...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
