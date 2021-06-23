Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE353B1843
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:53:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A29E3C6FDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 12:53:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BFFF3C2B9A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:53:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 044E010000CD
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 12:53:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 750952196A;
 Wed, 23 Jun 2021 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624445600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdiujwT/5a87iXbEPpFy92Pn6NicCS1run/pXL7t7LQ=;
 b=l/0VUgVPwSKUl82f0npz9GfSOBmp0EX3x6997q27rO5qE+6LSJNZ0e3taIE9GGQl+XUJmj
 k9moPNOKDh6dJtlBoZLW/pwWlcvJ0fxteCTv1HXZUxYKD8frJb7UJZ9qSkUvcWdPqxM8Qy
 gkyVrwAskPgj7h2sI0pcRqKwnN5WXsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624445600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdiujwT/5a87iXbEPpFy92Pn6NicCS1run/pXL7t7LQ=;
 b=5Xk5+GamqfhQesWf4Y8yx1eNwEnX2rBGc7mY5ILjSpVDciHsuag8cItesSOV0YwAR7IfAb
 +DmbugNhGY84cmDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 549BC11A97;
 Wed, 23 Jun 2021 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624445600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdiujwT/5a87iXbEPpFy92Pn6NicCS1run/pXL7t7LQ=;
 b=l/0VUgVPwSKUl82f0npz9GfSOBmp0EX3x6997q27rO5qE+6LSJNZ0e3taIE9GGQl+XUJmj
 k9moPNOKDh6dJtlBoZLW/pwWlcvJ0fxteCTv1HXZUxYKD8frJb7UJZ9qSkUvcWdPqxM8Qy
 gkyVrwAskPgj7h2sI0pcRqKwnN5WXsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624445600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdiujwT/5a87iXbEPpFy92Pn6NicCS1run/pXL7t7LQ=;
 b=5Xk5+GamqfhQesWf4Y8yx1eNwEnX2rBGc7mY5ILjSpVDciHsuag8cItesSOV0YwAR7IfAb
 +DmbugNhGY84cmDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OOz3E6AS02CwaAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 10:53:20 +0000
Date: Wed, 23 Jun 2021 12:27:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YNMMoXqTJpDc7LcU@yuki>
References: <20210622161753.32550-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622161753.32550-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_rtnetlink: pass error codes using
 rtnl_errno variable
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
This is fine as well.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
