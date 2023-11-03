Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86A7DFFBF
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 09:30:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700F23CC81C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 09:30:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAEB03CC7D9
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 09:30:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CDB18200250
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 09:29:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 912592191E;
 Fri,  3 Nov 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1699000198;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HqUHYsp9eJ/oLoFaJ6/w7xFpuIwGMUb6GNNhfxIzuuE=;
 b=1y3C+eNPzEdS0EUJCjweVXaogAKqKUvDBO1gWba+FGTriO0j9iGUvylTRd0YeiA2mDrekl
 UMh+f5PevDjw0UmlJt8b00fbVrFliGznE1kEnEx2LZt58I70NzoCl9eHHIcjWJfjkwfe4m
 +XIn/ulkAGUnab8bqS8W5VeszZzmFX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1699000198;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HqUHYsp9eJ/oLoFaJ6/w7xFpuIwGMUb6GNNhfxIzuuE=;
 b=l1wbwxupskEOQ5pdDTtuf8IqYZONKYzt9H85rWunJSVnJPg2ygYPKqRGZUlo+Ld/6fFM0g
 g5UlgmqT6CjLFfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BD381348C;
 Fri,  3 Nov 2023 08:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eLwHGYavRGUKWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 03 Nov 2023 08:29:58 +0000
Date: Fri, 3 Nov 2023 09:29:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <20231103082956.GA1024452@pevik>
References: <20231102230054.3195864-1-edliaw@google.com>
 <20231102230054.3195864-2-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102230054.3195864-2-edliaw@google.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise11: Replace /etc/mtab with /proc/mounts
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Edward,

> Android does not have the /etc/mtab symlink, so trying to open it fails
> with TBROK.  Replace it with /proc/mounts.

Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

BTW there are other tests which mention /etc/mtab, but only as tst_resm(TINFO, )
message.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
