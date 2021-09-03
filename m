Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA943FFE35
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 12:31:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26D7F3C9594
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 12:31:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A08A93C1AF2
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 12:31:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C98E14012D8
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 12:30:59 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 630FB1FD80;
 Fri,  3 Sep 2021 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630665059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhzF/lWlfSTwcXo1SEItc/DQCskI+ZzBRMECI3rpHiI=;
 b=WdM+ZobxaINcHEYiiNaIGz1B/FL/oc03r0UW+SwN82eGED5XdiJOSnr+839MMM2tN7y3dz
 PEe3yoguczRCNpophJWGMks8sqxvlvOXBPVA+H+YnfaCM8VC0CCgZC/zbyxqcj3gTsVyZN
 TXPd4Tj9ybN5cUaZQIgXwo36VoidGJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630665059;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhzF/lWlfSTwcXo1SEItc/DQCskI+ZzBRMECI3rpHiI=;
 b=a6QgJwQ1myYooTfq5mp3r3MH1uYztDaAZ0mFBMYWVCeUoPfQT7hfrcB6DoPsX0r1jO3RGs
 HRbd4+HVBTQm9yCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2790C136DE;
 Fri,  3 Sep 2021 10:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 20TEB2P5MWHFDgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 10:30:59 +0000
Date: Fri, 3 Sep 2021 12:30:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YTH5YaacIHvvjxAq@pevik>
References: <20210902115837.2199-1-pvorel@suse.cz>
 <YTDSn6ucuuIsfB19@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTDSn6ucuuIsfB19@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] checkbashisms: Disable 'type' check
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> Looks good.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Looks like 'command -v' which is POSIX works (tested in bash, dash, busybox sh
and android shell), thus I suggest to drop this patch and use 'command -v'
instead of 'type'.

$ foo(){ echo "in foo";}
$ command -v foo
foo

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
