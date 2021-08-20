Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FD3F2A6F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:59:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F01B3C4E39
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:59:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45E2B3C194A
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:59:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4C6011400DEB
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:59:17 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A75C22135;
 Fri, 20 Aug 2021 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629457156;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tyLnxTOhy0BbPnhmCGNlSQUwJY+cUqKCZhlXS92Gg8c=;
 b=nwz6L9k3DQzSA27iC8Z5swcBcKLUf59C7lsiUBRnh2bZxuQrmqiHdPBMb+v5bOIBNLKLVO
 x1O1YtrQ1aFYy1Nqeu4WCogM6M8AAQsUNv7c1xQZk9BVT4vBKLkV/s+503iK6j8xRtQwzz
 nTewvH5mFmjuEM6VdETvuWfB+7aauQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629457156;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tyLnxTOhy0BbPnhmCGNlSQUwJY+cUqKCZhlXS92Gg8c=;
 b=Ki2n1juoLkwIYeQN102EoFJv8ylKQfrIXQnu02xlIYkTXST13kyIYZzclX0IMic7Gy0uF6
 qZOCBOSQJTllvABA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4358B13AC4;
 Fri, 20 Aug 2021 10:59:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wsXxDQSLH2FbcAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 10:59:16 +0000
Date: Fri, 20 Aug 2021 12:59:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YR+LAmVDEUcZ51Wt@pevik>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812043807.3497492-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] shell: Add checkpoints api for new lib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

LGTM, good idea.

But I'd rename $LTP_IPC_PATH to $TST_IPC_PATH to follow conventions to new API
(There are also some LTP_* definitions in the legacy C API which were renamed as
TST_* in the new API).


> +	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "${LTP_IPC_PATH}" ]; then
nit (remove unnecessary {}):
    if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$TST_IPC_PATH" ]; then
> +		rm ${LTP_IPC_PATH}
and here:
		rm $TST_IPC_PATH

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
