Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D013A955C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 10:51:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84F3B3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 10:51:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB4253C0B9A
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 10:51:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3BD8360085B
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 10:51:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3213C21A57;
 Wed, 16 Jun 2021 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623833507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kIyK1SIdd7N/TM5jq5MXRw9yrtKEI68SzG0gktmGaU=;
 b=kEhAGz7ghrZ87YCRbSWVtX3r2YSuh14seglj8JWZNx7XSmQdiNZfiL7BZI90w3lpykkknc
 1c+wTapf4I4C7efsrc0gWVQSkVh66y2PJsb5052P+YswhU/jtWgVtDPxdbY/hvLpdhRm9p
 5pu8K4/mRvQYFUi0c8P2HV70I3yaomM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623833507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kIyK1SIdd7N/TM5jq5MXRw9yrtKEI68SzG0gktmGaU=;
 b=FPDAuPjMsyuLhR/6yx7tqzWxQd8zWrIvUr+JsrIXfkdyIUFOSQ3pasl6vsYdKZscGABU7G
 Me/sgHd4tKEpZHDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E6743118DD;
 Wed, 16 Jun 2021 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623833507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kIyK1SIdd7N/TM5jq5MXRw9yrtKEI68SzG0gktmGaU=;
 b=kEhAGz7ghrZ87YCRbSWVtX3r2YSuh14seglj8JWZNx7XSmQdiNZfiL7BZI90w3lpykkknc
 1c+wTapf4I4C7efsrc0gWVQSkVh66y2PJsb5052P+YswhU/jtWgVtDPxdbY/hvLpdhRm9p
 5pu8K4/mRvQYFUi0c8P2HV70I3yaomM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623833507;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kIyK1SIdd7N/TM5jq5MXRw9yrtKEI68SzG0gktmGaU=;
 b=FPDAuPjMsyuLhR/6yx7tqzWxQd8zWrIvUr+JsrIXfkdyIUFOSQ3pasl6vsYdKZscGABU7G
 Me/sgHd4tKEpZHDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id KpLcNaK7yWAlFgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 08:51:46 +0000
Date: Wed, 16 Jun 2021 10:51:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YMm7oOH9Tk9VdaQ1@pevik>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMmiQfWgvqtCzOmg@pevik> <60C9A6D7.2080102@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60C9A6D7.2080102@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

Merged with all my suggested changes + slightly adjusted docparse description
and commit message.

Thanks a lot!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
