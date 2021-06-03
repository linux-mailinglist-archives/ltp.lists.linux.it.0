Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E139A03D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 364FF3C5412
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:52:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BFA03C183E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:52:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 89051600953
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:52:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D1020219D7;
 Thu,  3 Jun 2021 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622721164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kg2c8jhMpEoiaK4g7YUZ0HPqI0Gh+BzePgd+DCcQluY=;
 b=Xh0YypSRf51dqxcOLcOOP6xELro7OkESVaaTxAuH5rwNYR7XB00x7t3Ls68SyN/7EJq+F+
 dsagNUUeNwxaNPsNnfm5jZrtqxFGUt2+1HHrM1HLRpz0EDsz5rcCJxlrapNDlNrAB02xun
 ZbVG912peUd+sUrool6mSxGa92sCYco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622721164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kg2c8jhMpEoiaK4g7YUZ0HPqI0Gh+BzePgd+DCcQluY=;
 b=ZNSFNP4qUj7AHUqe35MhDVByb6zeNRevn6JW1WpYUtDWM80ckovdi3ZxSPCmsAOk56/Zro
 jD3G/iZYy7VwFnDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B3E48118DD;
 Thu,  3 Jun 2021 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622721164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kg2c8jhMpEoiaK4g7YUZ0HPqI0Gh+BzePgd+DCcQluY=;
 b=Xh0YypSRf51dqxcOLcOOP6xELro7OkESVaaTxAuH5rwNYR7XB00x7t3Ls68SyN/7EJq+F+
 dsagNUUeNwxaNPsNnfm5jZrtqxFGUt2+1HHrM1HLRpz0EDsz5rcCJxlrapNDlNrAB02xun
 ZbVG912peUd+sUrool6mSxGa92sCYco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622721164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kg2c8jhMpEoiaK4g7YUZ0HPqI0Gh+BzePgd+DCcQluY=;
 b=ZNSFNP4qUj7AHUqe35MhDVByb6zeNRevn6JW1WpYUtDWM80ckovdi3ZxSPCmsAOk56/Zro
 jD3G/iZYy7VwFnDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id V3TIKozCuGAcBgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 03 Jun 2021 11:52:44 +0000
Date: Thu, 3 Jun 2021 13:26:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YLi8fjhmEpXlzC9d@yuki>
References: <20210531114935.26000-1-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531114935.26000-1-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] syscalls/chown: Rewrite chown/chown04.c with
 the new api
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
Pushed with two minor changes, thanks.

* Removed the cleanup() since there is no need to reset the UID at the
  end of the test in the new library

* Made use of tst_get_bad_addr() instead of the hardcoded mmap() call

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
