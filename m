Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADB59DA80
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Aug 2022 12:13:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B5EC3CA313
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Aug 2022 12:13:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8D5783C2E42
 for <ltp@lists.linux.it>; Tue, 23 Aug 2022 12:13:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 18B8010007CD
 for <ltp@lists.linux.it>; Tue, 23 Aug 2022 12:13:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4F712265E;
 Tue, 23 Aug 2022 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661249595;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4n7C6J80yiBLIegCcjgsFZ1y9d+haaTeQRCUP+oHdsU=;
 b=2jsxbRH5KO0eoIWNR2R2xS7cr4AMVfm5DAltTVnjGfUmhm8K65mDn4K8Oiu73VdWTvYk0Y
 SQjtcuxWoODiZLboKv0tgfzslYVZQTlGBXKtLtJqtA7jD6/7oSwDjD+b9FXHRMocIFqv7T
 K+Ut+/x7SPIEsB8LWjjH352kIXetxVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661249595;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4n7C6J80yiBLIegCcjgsFZ1y9d+haaTeQRCUP+oHdsU=;
 b=buVQs4Bse2l99LSn1bg9cotEeZ9jLAIcNymRx05wo44/AEgfxUyqKWKqQpcZl/A+sGd+ud
 wB+jrCyHMaqCSVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C3B913AB7;
 Tue, 23 Aug 2022 10:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dJTxHzuoBGOzCQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 23 Aug 2022 10:13:15 +0000
Date: Tue, 23 Aug 2022 12:13:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YwSoOTCv1WGIxW5O@pevik>
References: <20220818110117.16754-1-andrea.cervesato@suse.com>
 <20220818110117.16754-2-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220818110117.16754-2-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] Add SAFE_SETHOSTNAME macro
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

Hi Andrea,

you forget to add safe_sethostname() into include/safe_net_fn.h
That's why there are warnings when compiled with second patch.

utsname02.c:27:2: warning: implicit declaration of function 'safe_sethostname' is invalid in C99 [-Wimplicit-function-declaration]

utsname03.c:35:2: warning: implicit declaration of function 'safe_sethostname' is invalid in C99 [-Wimplicit-function-declaration]

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
