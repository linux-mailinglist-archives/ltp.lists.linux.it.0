Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 153AC39D9EA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:42:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D05CE3C4DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:42:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 646853C4DBB
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:42:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 93EE41400E15
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:42:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDCA11FDA5;
 Mon,  7 Jun 2021 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623062561;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+FBhjh30g7QYOFMVCSgKopCUfuiMFioHlV9yxZl5Jo=;
 b=lmUqSZumYEU4QpXXWt8LSwy7dabCg0hneWlmvBgGsJZJsEDGMGTW4xRzIObT0fLVCmmjwr
 xHiQPu1sk+IxWAMWpFmwluGLg7f/d8uJBRG9yCIlAoVHS2EMjGtmWMKGmW6hFH3iIKRO6T
 /WjOyVMx3MiISXQ761YFOYqr/wAvePg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623062561;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+FBhjh30g7QYOFMVCSgKopCUfuiMFioHlV9yxZl5Jo=;
 b=L9LfXMyS2ciQo2i3Df/eU8fGdsYP9LumG+SePvaJt9k8hg51TM4+MR2s2U0dEtva0VMjp5
 YVPAH65fOyrRKDBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1170D118DD;
 Mon,  7 Jun 2021 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623062561;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+FBhjh30g7QYOFMVCSgKopCUfuiMFioHlV9yxZl5Jo=;
 b=lmUqSZumYEU4QpXXWt8LSwy7dabCg0hneWlmvBgGsJZJsEDGMGTW4xRzIObT0fLVCmmjwr
 xHiQPu1sk+IxWAMWpFmwluGLg7f/d8uJBRG9yCIlAoVHS2EMjGtmWMKGmW6hFH3iIKRO6T
 /WjOyVMx3MiISXQ761YFOYqr/wAvePg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623062561;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+FBhjh30g7QYOFMVCSgKopCUfuiMFioHlV9yxZl5Jo=;
 b=L9LfXMyS2ciQo2i3Df/eU8fGdsYP9LumG+SePvaJt9k8hg51TM4+MR2s2U0dEtva0VMjp5
 YVPAH65fOyrRKDBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id n0VeOyD4vWD4PQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 10:42:40 +0000
Date: Mon, 7 Jun 2021 12:42:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YL34Huk/jV8Xm1+V@pevik>
References: <YLh9jvI/p/VxsSmx@pevik>
 <YL3mN28Y22I5yK6p@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL3mN28Y22I5yK6p@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>, automated-testing@yoctoproject.org,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi!
> > does anybody use testcases/kernel/io/disktest ?

> Ack for removoval from me as well.

Thanks a lot all for your ack, merged.

f7350d6a2 ("Remove disktest")

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
