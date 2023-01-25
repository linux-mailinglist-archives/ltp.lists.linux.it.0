Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5967BE8E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 22:30:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99ABB3CC768
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 22:30:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 529103CB3A8
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 22:30:30 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 603051000955
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 22:30:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E9D41F890;
 Wed, 25 Jan 2023 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674682229;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8+hyg3TLhKIUmTQIjxoqA2/DCEmNdDZB2O3XVgbFfQ=;
 b=BS0DlZvWz5kFpbo1MMrT21krdsu4/973kOsLuNvFtMgdVknzPcoF9S40YfLsWzLg3LkTQU
 qGmR4tSmyu7ImA2SnzIKh/pA/jMu7eGYVO1iW4sAWOWRgiMW+OoEx4pplaXW7S6b4DK8ya
 SyZnNeQEClN3zVtiEvVqon00coP6l8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674682229;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8+hyg3TLhKIUmTQIjxoqA2/DCEmNdDZB2O3XVgbFfQ=;
 b=uyotjzcGM59qU6nKV6ET1RQ1A6Z6tHO/9y/yxV7pd6f4ZsiaQeLL+z20LJu1pBjWyvUhUj
 KmjGlaM49MBIErDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A4011358F;
 Wed, 25 Jan 2023 21:30:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Km0ADHWf0WNLHgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 25 Jan 2023 21:30:29 +0000
Date: Wed, 25 Jan 2023 22:30:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, ltp@lists.linux.it
Message-ID: <Y9Gfc+OzdKG3Bdvi@pevik>
References: <20230124044227.13635-1-akihiko.odaki@daynix.com>
 <Y8/AoCIniws6bVjd@pevik> <Y8/O/S/CCh4KCmFV@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8/O/S/CCh4KCmFV@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/stress/http: Do not use SIGPIPE
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

Hi Akihiko,

merged, thank you!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
