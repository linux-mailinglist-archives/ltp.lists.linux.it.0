Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31B5F6084
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 07:16:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0A063C2830
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Oct 2022 07:16:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94DF63C1509
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 07:16:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB46B600F2E
 for <ltp@lists.linux.it>; Thu,  6 Oct 2022 07:16:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 720261F85D;
 Thu,  6 Oct 2022 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665033375;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MpaJS317M8ktAfARJbZ/gX+XAEj05smcdmt3SPriNmc=;
 b=kgtPcXnWiQ4E27nXgWpvWsqNSaen6+f+xyWm+s74S4R0NJmftkOZByy7OkHgn0rqU5MpVy
 YDb37+AiUJJvJio2cSM24/EOP4ZlW1moNZ7Dnyr7r/+NZTx9Ec/y5jGRXjSFbFQP2mj7rv
 wixD0hQeWlYKXkQg8bEf4R3GgzkF+tQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665033375;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MpaJS317M8ktAfARJbZ/gX+XAEj05smcdmt3SPriNmc=;
 b=Z36XVtdFdjPswyIvpAvLAfGZuV0d8EoH0O3hDMqsy+LiWteweMe2vRx69QYjLUnDqaczRy
 hGgBtYQKtWJi7IBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54F3E139D2;
 Thu,  6 Oct 2022 05:16:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M25WE59kPmN5ZQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 06 Oct 2022 05:16:15 +0000
Date: Thu, 6 Oct 2022 07:16:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Yz5knc+5gFFoPgdh@pevik>
References: <20221005131529.15930-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005131529.15930-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/creat09: Add reference to CVE 2021-4037
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

thx, merged!

> +++ b/testcases/kernel/syscalls/creat/creat09.c
> @@ -155,6 +155,7 @@ static struct tst_test test = {
>  	.tags = (const struct tst_tag[]) {
>  		{"linux-git", "0fa3ecd87848"},
>  		{"CVE", "2018-13405"},
> +		{"CVE", "2021-4037"},

How about this change:

diff --git runtest/cve runtest/cve
index 9ab6dc282..6ad3f51fb 100644
--- runtest/cve
+++ runtest/cve
@@ -55,7 +55,7 @@ cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
 cve-2018-12896 timer_settime03
-cve-2018-13405 creat09
+cve-2018-13405-cve-2021-4037 creat09
 cve-2018-18445 bpf_prog04
 cve-2018-18559 bind06
 cve-2018-18955 userns08

Kind regards,
Petr

>  		{"linux-git", "01ea173e103e"},
>  		{"linux-git", "1639a49ccdce"},
>  		{"linux-git", "426b4ca2d6a5"},

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
