Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D443D78CB
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 16:47:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FFDC3C912B
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 16:47:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 344353C5793
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 16:47:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 74AA5600BC0
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 16:47:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A75D520143;
 Tue, 27 Jul 2021 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627397269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MoqQyBS8acZlpaFlX7HspEs6jrRa6gaVAAPeKf36ZJc=;
 b=ZEAyMjcZK32OwvOc0r0iYJpgYUzeiyePNkPdqxun+sgpRmKgOVBSJFDheMMeoAWxwbWu7r
 ExPkjMRLiyt46lgYbOBsVJTKj8OmHrHgQRVv5gr7rYItRaj4oAtm3I8Ebw0t53ZPgNxE0u
 U4V+72khPkJ5+uQ4pBnj3IP0Odo32F8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627397269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MoqQyBS8acZlpaFlX7HspEs6jrRa6gaVAAPeKf36ZJc=;
 b=Dwqd4lbnj+ZKC53I5nZHxfeZs4FMD13Q6MBCRdt3KcpK+TOPvVLci702IeZcLsuvbMG7+s
 5KqtdEFAzPcnL4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FDAD13A5D;
 Tue, 27 Jul 2021 14:47:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 14RNFpUcAGF6XAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 27 Jul 2021 14:47:49 +0000
Date: Tue, 27 Jul 2021 16:47:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YQAclm1a3juLgb0T@yuki>
References: <20210727124507.28356-1-xieziyao@huawei.com>
 <20210727124507.28356-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727124507.28356-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_process_state: Add
 tst_process_state_wait2 to newlib
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
> Add tst_process_state_wait2 to newlib for epoll_pwait01.

The original purpose of this function was to work around the limitation
of the old test library, where you couldn't use the test library API
from a child processes. There is no point in adding it to the new
library, the test should just switch to the TST_PROCESS_STATE_WAIT()
instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
