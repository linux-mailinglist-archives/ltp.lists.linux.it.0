Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 006173AE5CC
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:18:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567553C98A7
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:18:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E52E3C7076
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:17:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BB79600856
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:17:56 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 63F5B1FD42;
 Mon, 21 Jun 2021 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624267076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=TT7jwjquIaSACRM3Ssaxs5FzDWs4ATJ7u+UCzKO4GgMHurit1IriiMOEDfFU4Sdgc+DyWO
 2lfU7cOwtJKEwj4Xwf//ELCMMTRCKnmH7c7qOcA+2E9mDEFzADc/SR0FdDqL1gtFEF02YM
 jlpqKdtsccVPRejys5v4c3N6KIGqg8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624267076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=up2WWwshcmSwnKKotPTdNzS8ZiHLhwOhTb11qwMFVm46dB/wF7y1iShl72ahl5l2/eMBSK
 ncX7kwlIeg9Y6nBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 465DD118DD;
 Mon, 21 Jun 2021 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624267076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=TT7jwjquIaSACRM3Ssaxs5FzDWs4ATJ7u+UCzKO4GgMHurit1IriiMOEDfFU4Sdgc+DyWO
 2lfU7cOwtJKEwj4Xwf//ELCMMTRCKnmH7c7qOcA+2E9mDEFzADc/SR0FdDqL1gtFEF02YM
 jlpqKdtsccVPRejys5v4c3N6KIGqg8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624267076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/F5R5GpuFPnXnfvZfrijv7DtSyPwTeFWupVjdT03QvQ=;
 b=up2WWwshcmSwnKKotPTdNzS8ZiHLhwOhTb11qwMFVm46dB/wF7y1iShl72ahl5l2/eMBSK
 ncX7kwlIeg9Y6nBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /2AaDkRZ0GA7RAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 09:17:56 +0000
Date: Mon, 21 Jun 2021 10:52:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YNBTRCi5g6CsQ2Go@yuki>
References: <20210618094210.183027-1-xieziyao@huawei.com>
 <20210618094210.183027-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618094210.183027-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] io_destroy01: Add docparse formatting and
 more detailed description
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
Applied, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
