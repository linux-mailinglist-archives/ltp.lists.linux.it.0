Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87E3B8DE9
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:53:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53D1C3C91DF
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:53:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D73F23C6AF3
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:53:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5C13D1A01212
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:53:18 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2EF522803;
 Thu,  1 Jul 2021 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625122397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwDBB+NJOZYNoLPzyUVawuR54ditSq8Q/TpDLYyB9to=;
 b=YterP6ELexOGeScqIZV4gXWIAiJqWkc4RLNXtonxT0W9wqDvBGetJ+jhkZufGnOjnWMYcM
 l+C1y/WNTxVhhV+sVcJlMaIlF5fctjF/vlqV+Eqc081ZKptGxFGgsE892z61OQi4TCk1gN
 g3DSdC03C9ykrzWspgwDfOJxjMJbRkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625122397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwDBB+NJOZYNoLPzyUVawuR54ditSq8Q/TpDLYyB9to=;
 b=PBHo0NtMw3c77b5kAyoCPIJm6+2a/ITfj8YrLF7a9w+FW5MMSYNH2tmwqs4SPrqxkU4Yth
 61V/BjakIZp+TEAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5C3F3118DD;
 Thu,  1 Jul 2021 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625122397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwDBB+NJOZYNoLPzyUVawuR54ditSq8Q/TpDLYyB9to=;
 b=YterP6ELexOGeScqIZV4gXWIAiJqWkc4RLNXtonxT0W9wqDvBGetJ+jhkZufGnOjnWMYcM
 l+C1y/WNTxVhhV+sVcJlMaIlF5fctjF/vlqV+Eqc081ZKptGxFGgsE892z61OQi4TCk1gN
 g3DSdC03C9ykrzWspgwDfOJxjMJbRkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625122397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwDBB+NJOZYNoLPzyUVawuR54ditSq8Q/TpDLYyB9to=;
 b=PBHo0NtMw3c77b5kAyoCPIJm6+2a/ITfj8YrLF7a9w+FW5MMSYNH2tmwqs4SPrqxkU4Yth
 61V/BjakIZp+TEAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id f2zaFF1m3WC1WAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 01 Jul 2021 06:53:17 +0000
Date: Thu, 1 Jul 2021 08:53:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YN1mWgrwYQQOY84b@pevik>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <20210701050314.1005067-3-petr.vorel@gmail.com>
 <87im1u37ll.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87im1u37ll.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/tests: Rename test to tst_fuzzy_sync03.c
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

Hi all,

thanks for your review, both patches merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
