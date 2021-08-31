Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C593FC6AD
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:06:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981C93C9A44
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:06:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 651173C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:05:58 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BB01E1A00CA4
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:05:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8B0322201;
 Tue, 31 Aug 2021 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630411556;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROR5otM7mnxyTYQSAGT6OBgfb7HvUIAp62GJFfnhWDk=;
 b=FVelftKgwJopMh/q9xLzuiaoFhsgaDxdG3HhBGYq1SCyjJKb9dIBQYovqC7zW8t0DKlRqh
 vR9uUOFco+oFLyxvQ1RNian3PkA716efRLgVaGbf5dATfx5K5OUIKl2HZp8nilJ3TRkvbm
 LONXJmW6hlvQv3JnwKDQoHmVq3QB690=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630411556;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROR5otM7mnxyTYQSAGT6OBgfb7HvUIAp62GJFfnhWDk=;
 b=QxVYNfhI6THXziFZZQXKmVMI83aKoFSCLwK6dg/d+/FF5ELhFnCBp2Y4eZ4Er5wXMtPGB4
 oJEfStLtLiqSYPDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B3A0B13A92;
 Tue, 31 Aug 2021 12:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id jOG3JyQbLmH5FQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 12:05:56 +0000
Date: Tue, 31 Aug 2021 14:05:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS4bIkChYKjUaOSZ@pevik>
References: <20210827095210.23602-1-rpalethorpe@suse.com>
 <20210827095210.23602-2-rpalethorpe@suse.com>
 <YS3rTs3V+Ta2SlAT@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YS3rTs3V+Ta2SlAT@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Add CHECK_NOFLAGS and checkpatch.pl to 'make
 check'
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

Hi Cyril, Richie,

Thanks both, merged!

> I guess that we should update the Test Contribution Checklist in the
> test-writing-guidelines.txt and remove the point 2 about checkpath and
> move the point 6 about make check to the second place in the list.
I plan to update docs in a patchset which adds checkbashism.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
