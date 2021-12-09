Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0A46F53D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Dec 2021 21:49:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64AF33C8191
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Dec 2021 21:49:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B6DF3C7F38
 for <ltp@lists.linux.it>; Thu,  9 Dec 2021 21:49:11 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A02271A00905
 for <ltp@lists.linux.it>; Thu,  9 Dec 2021 21:49:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D77BD210EA;
 Thu,  9 Dec 2021 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639082949;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MuVXbfGaAsDD2wNtVX0sMsfW+JVLpEF8FK0PQA4T+U=;
 b=g5V3mX8XuYfmwLjOw8dbluLcw+0VjXf2A9/6gJqroRhRxR+z8bJMjo+0jSBLGYmaQY0HIs
 /OUjrFIuxtK08AkSpuz68SbPiZo/HPD4fiN9fjzCZFnq9Y/4v3RVBXFOvxx2WhvVvbsMcI
 Kse9ynkBpUpRcVU1Sm3lWesWi9ITbec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639082949;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MuVXbfGaAsDD2wNtVX0sMsfW+JVLpEF8FK0PQA4T+U=;
 b=DizDhRBzDtiXoBhY09mu6XN5dA+ukP7z8cy7XugZrMwprjUlNXxWFcBa4/sCswLouSXKGG
 8a9VzfoP54FO0eCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A502613D8F;
 Thu,  9 Dec 2021 20:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PYqEI8VrsmHZRQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Dec 2021 20:49:09 +0000
Date: Thu, 9 Dec 2021 21:49:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YbJrw5aYVCNK+hTJ@pevik>
References: <YbDl7YtVZvYXPxwp@pevik>
 <1639020068-2198-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1639020068-2198-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1639020068-2198-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] testcase: make use of needs_cmd version
 check
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

Hi Xu,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

>  testcases/kernel/syscalls/quotactl/quotactl04.c | 11 +----------
>  testcases/kernel/syscalls/statx/statx05.c       | 13 ++-----------
>  2 files changed, 3 insertions(+), 21 deletions(-)

NOTE: you could also remove #include <stdio.h> from both files,
it was needed only for popen() pclose() and fscanf()

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
