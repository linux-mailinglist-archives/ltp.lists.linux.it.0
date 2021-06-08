Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06C39F161
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:50:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 344A83C4DA5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:50:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01EA53C269A
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:50:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 327BE200D42
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:50:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74939219C4;
 Tue,  8 Jun 2021 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623142220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZ5fkB8o7b7Qf7OMQSRGRcLBTdCUQVVuTJDf4HBvF5I=;
 b=HTfqqPbcZWiQjywjt/MI9onLHKsl3GzBYcDR6CbxVOmKLT8gR0w1Bv1xJkWUVu87731xsx
 ctKp0H6tGzid27OYFv/0TvS2dJhdtNlV3NzbaOwkHtD9iR+5hQJjuzptmeR6tSS4Jb2lAC
 Xu+s9jKmrTwjaH/uCT5TFfV8h4NmpSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623142220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZ5fkB8o7b7Qf7OMQSRGRcLBTdCUQVVuTJDf4HBvF5I=;
 b=vk5RnrxEaVud8oN5iHZLDf9dvKLdRs8eA6cRidlRq8O6YJIXiMNtFWaXa9o087ff6/508P
 gNcqO6Pna9JlJ2DQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 598DB118DD;
 Tue,  8 Jun 2021 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623142220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZ5fkB8o7b7Qf7OMQSRGRcLBTdCUQVVuTJDf4HBvF5I=;
 b=HTfqqPbcZWiQjywjt/MI9onLHKsl3GzBYcDR6CbxVOmKLT8gR0w1Bv1xJkWUVu87731xsx
 ctKp0H6tGzid27OYFv/0TvS2dJhdtNlV3NzbaOwkHtD9iR+5hQJjuzptmeR6tSS4Jb2lAC
 Xu+s9jKmrTwjaH/uCT5TFfV8h4NmpSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623142220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kZ5fkB8o7b7Qf7OMQSRGRcLBTdCUQVVuTJDf4HBvF5I=;
 b=vk5RnrxEaVud8oN5iHZLDf9dvKLdRs8eA6cRidlRq8O6YJIXiMNtFWaXa9o087ff6/508P
 gNcqO6Pna9JlJ2DQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id qvDAFEwvv2AdSAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 08 Jun 2021 08:50:20 +0000
Date: Tue, 8 Jun 2021 10:24:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: dongshijiang <dongshijiang@inspur.com>
Message-ID: <YL8pPn8Z8O566R/g@yuki>
References: <20210608084431.62769-1-dongshijiang@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608084431.62769-1-dongshijiang@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix pan/ltp-pan return values
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
Can we please stop adding band aids over the broken-by-design runltp
script and ltp-pan?

We are going to finally push runltp-ng into LTP git during this
development cycle and finally deprecate ltp-pan, feel free to try it
yourself:

https://github.com/metan-ucw/runltp-ng

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
