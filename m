Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1880A3AE425
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 09:25:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D579A3C2479
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 09:25:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB6A03C2307
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 09:25:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F3D441A00707
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 09:25:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C8101FD2A;
 Mon, 21 Jun 2021 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624260332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KGecVkh6SlUjV2xvawXYr8Q6Fpa8hMK+PfHh9YMa4Q=;
 b=PlMt1Is5c5vgLyxKVm719oz4CnU/YddM03Mg7vb1EWVNRhqs63+eEh6oEIy930U5BH60n8
 IAEK30QqEk1q7+SMfNV6IShDYLEV8zX0nNc9Ka/fy9T6x/Sko+U/eH8mJXHIMAs6FCTl+S
 zyw9QKAiDapO9UNNR3qBLcYcM2AKko4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624260332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KGecVkh6SlUjV2xvawXYr8Q6Fpa8hMK+PfHh9YMa4Q=;
 b=QXRexnOpRwIJ8IFZyXPkQA6LOF6Nkmq42eqKHwahJ1Jzv0UDO8/+Y6Za5iYPmJgDegWjH1
 EY96VMigOH2YisDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C73EB118DD;
 Mon, 21 Jun 2021 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624260332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KGecVkh6SlUjV2xvawXYr8Q6Fpa8hMK+PfHh9YMa4Q=;
 b=PlMt1Is5c5vgLyxKVm719oz4CnU/YddM03Mg7vb1EWVNRhqs63+eEh6oEIy930U5BH60n8
 IAEK30QqEk1q7+SMfNV6IShDYLEV8zX0nNc9Ka/fy9T6x/Sko+U/eH8mJXHIMAs6FCTl+S
 zyw9QKAiDapO9UNNR3qBLcYcM2AKko4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624260332;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KGecVkh6SlUjV2xvawXYr8Q6Fpa8hMK+PfHh9YMa4Q=;
 b=QXRexnOpRwIJ8IFZyXPkQA6LOF6Nkmq42eqKHwahJ1Jzv0UDO8/+Y6Za5iYPmJgDegWjH1
 EY96VMigOH2YisDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oZFML+s+0GAcBwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 21 Jun 2021 07:25:31 +0000
Date: Mon, 21 Jun 2021 09:25:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNA+6shWiWYRNi2P@pevik>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <20210519063109.224352-2-lkml@jv-coder.de> <YKToUgBnK6ZQ5I0Q@yuki>
 <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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

Hi all,

I wonder what is the state of this patchset?
Do we still consider it?
Apart from reducing shells (i.e. which distro has ash, which is not
alias to other shell in the list) I'm not against non-default shells, but I
don't like how whole test gets complicated by this.

Also we're reinventing wheel with printing results, checking whether test exist
etc. Maybe using test API for this?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
