Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088549F8FB
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 13:12:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E773C974A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 13:12:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 088D23C973F
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 13:12:19 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6E19C600A0C
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 13:12:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BF671F384;
 Fri, 28 Jan 2022 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643371938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMY9iB9lSqqWSzTt9jcr91UKBkq6z6BjfcN/PvIw4ts=;
 b=Utygwy+G0++ot3Iv6TB1xCXMVdfYzqt3RvErXdlhjJMkA0s6PxlqXCUucVublp9pcKUu6q
 i8KCPZLZD3x0YNKWJ6uKfmpKyOgX167RuhO/Q86w5in0wbfOerZfQAvxCwj+txKydqdiDC
 QxzQldtqnYngL2wkj3z+WewnlDtVgCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643371938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMY9iB9lSqqWSzTt9jcr91UKBkq6z6BjfcN/PvIw4ts=;
 b=fJmxcc4ZZiZB8+7mQFO2nKGhbmCQTCYlHMRdZnWzGR8eFw61HNoNnPAoEnPt+c+odWtoFi
 nMoRmGKipaYJhXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CC9A13AB5;
 Fri, 28 Jan 2022 12:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ueqeD6Ld82EjUwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 28 Jan 2022 12:12:18 +0000
Date: Fri, 28 Jan 2022 13:12:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kushal Chand <kushalkataria5@gmail.com>
Message-ID: <YfPdoCAfr8h/4Cnx@pevik>
References: <20220126050555.14435-1-kushalkataria5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126050555.14435-1-kushalkataria5@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] tst_taint: print readable error message
 instead of numerical codes
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

Hi Kushal,

> Fixes: #776

> I have did the necessary changes as discussed in our communication.
> Now we print each taint flag using tst_res(TINFO, ...) and a final
> tst_brk(TBROK, ...) which informs the kernel is tainted.

> Regards,
> Kushal
FYI this test above should be ...

> ---
... here after '---'. Because everything after '---' does not go to the git
commit message (designed for notes which should not be preserved in the commit
message).

Anyway, added text "tainted: " and merged. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
