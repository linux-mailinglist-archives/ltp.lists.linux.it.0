Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECF391139
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 09:11:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97A323C2B2E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 09:11:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D83A3C1A39
 for <ltp@lists.linux.it>; Wed, 26 May 2021 09:11:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0BACA600D5B
 for <ltp@lists.linux.it>; Wed, 26 May 2021 09:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622013109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Z/7/itDl3UEuXFg21WVxqPHBdPDLYVPnUXZD8I/lmo=;
 b=Y27OyRLSem+70hAtxV2dM+blXiNNm9B7D8x/YgkQb1Bqll+rcbzaIOFnUD4iLszEJhvgWY
 D1ncT43irYUPuXgT7Y6LWqdRW3rYDlhEvEZTWW+YRVEbzrkccmPl5L2jaJ7KgF/sbCx6HK
 Mv+krY/DublpFotVn6W1twozmuBFFhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622013109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Z/7/itDl3UEuXFg21WVxqPHBdPDLYVPnUXZD8I/lmo=;
 b=pse+YHIIx22qRd0RF4Pf7ySBZuih69YsiQq69FbApOjoWTvzk+wpt6pt9aHEmZYWU1NVsw
 m8r7TmkI+NWUg5CA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4338FB0E5;
 Wed, 26 May 2021 07:11:49 +0000 (UTC)
Date: Wed, 26 May 2021 09:11:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YK30s96vF0kdxKRv@pevik>
References: <20210525135012.877-1-pvorel@suse.cz>
 <20210525135012.877-3-pvorel@suse.cz>
 <ef263c10-d6f6-0ec7-aa4b-2e305f920d15@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef263c10-d6f6-0ec7-aa4b-2e305f920d15@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] nfs_lib.sh: Print verbose mount info on error
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
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> Thanks Petr! For the patch series:

> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

Thanks a lot! Merged this commit, more info at other commits.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
