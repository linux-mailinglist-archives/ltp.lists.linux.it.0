Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A4401D7B
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 17:17:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2F523C952C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 17:17:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D6B03C05A0
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 17:17:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E4E531A009BB
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 17:17:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 259E62217D;
 Mon,  6 Sep 2021 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630941431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vexp+N8Hq1xxmQYQQhmLlptBktyNUduMIMuVM1VKDco=;
 b=Y+Ske27KlEb6JRhMDDrcXcozJIkJjXXKxMjLyyvBxkWIc5kOr+bEc9zYe9Cbf9kVbTtp09
 Sutio8kd99DJjGl/4r5UH8ayjCJcBzH2+ERmgzE7WD0L8EPDrvmtgKf4FJl1bSCy4gOMmR
 L639WHjBTpdBUIqTK3KEfPKRsdkqn98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630941431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vexp+N8Hq1xxmQYQQhmLlptBktyNUduMIMuVM1VKDco=;
 b=47SfKevAVBSBKvbvUg+zsZflUeQnIq5kAONwjw+S4/RbOZsBTFFaLejAjAJfIRHJcukcjB
 OajCyjqwmp2DUhAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AC8A13C29;
 Mon,  6 Sep 2021 15:17:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QjzPAfcwNmGBbAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 06 Sep 2021 15:17:11 +0000
Date: Mon, 6 Sep 2021 17:17:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
Message-ID: <YTYxAnd1FDGq/nTW@yuki>
References: <20210826090511.106853-1-threefifteen.wangkunfeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826090511.106853-1-threefifteen.wangkunfeng@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getuid: Convert getuid01 and getuid03 to new API
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
Looks good, but there is no value in keeping the getuid01.c because it
tests same assertion that is covered in getuid03.c as well.

So I would keep only getuid01.c and moved the functionality from
getuid03.c there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
