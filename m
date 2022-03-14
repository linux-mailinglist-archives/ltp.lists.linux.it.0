Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BDC4D85E1
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Mar 2022 14:27:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E1083CA7EE
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Mar 2022 14:27:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F24F3C0CEA
 for <ltp@lists.linux.it>; Mon, 14 Mar 2022 14:27:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7C96E10000F6
 for <ltp@lists.linux.it>; Mon, 14 Mar 2022 14:27:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 85DFE218FF;
 Mon, 14 Mar 2022 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647264457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8+wq46hrG/FNr0v/Bn+Fp2Wk6E5KA9MEqNRFtrho6k=;
 b=HO6CLjLeoxLeLWL2OHIkjim1gAfG/kKVXxvDFUdsjIKtFA3I7WUsInqIxUyumrLO5+PJwA
 QWhxc5d9sYn4MJmSSEV16u7+1MdQB1Tc+ci9KYgVqs0K+FP8pAhy5MzIlsyNTor3WwDTC1
 M2fQY+79trsfoetFSGKvVwWiDHdmD24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647264457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8+wq46hrG/FNr0v/Bn+Fp2Wk6E5KA9MEqNRFtrho6k=;
 b=/6Ue67bmLZZ8SVz7QcQHY/SyAB3UIGjl1JCmo4N3PS2NCNMNuP+DmC6D04rqNKKTTuH5YO
 8sjmu9T2oO7KSDAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B7DC13ADA;
 Mon, 14 Mar 2022 13:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZpPQFMlCL2KKXAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 14 Mar 2022 13:27:37 +0000
Date: Mon, 14 Mar 2022 14:27:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <Yi9Cx1DTJi3nxxUd@pevik>
References: <20220314130248.22869-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220314130248.22869-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] quotactl: Check for missing quota_v2 module
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin, Xu,

I wonder whether quotactl04 still needs check for ESRCH search in do_mount()
implemented by Martin in 4aab31e4c7 ("syscalls/quotactl: Skip tests if FS quota
is not supported"), because that could be caught by CONFIG_QFMT_V2 and now
quota_v2, right?

It uses fs_opts[] = {"-I 256", "-O quota,project", NULL} parameters for mkfs,
thus it is probably needed. But shouldn't it be used also in quotactl08, which
also uses fs_opts[] = { "-O quota", NULL} ?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
