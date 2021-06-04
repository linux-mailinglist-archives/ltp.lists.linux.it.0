Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E739B62E
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:47:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DA383C4F3C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:47:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DCCB73C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:46:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D9851001266
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:46:59 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A35661FD4C;
 Fri,  4 Jun 2021 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622800018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYWd5dp7WinUaKpBXvEvreMS7obLPfsX6oJfVnZLczA=;
 b=rWAJpsxWXek53DU/4C05hWSsXV9m5KEG4LwS+7VOoPF9/QQComEIycXrxeTX7IIsao2Ud7
 PwgIq/PAPQKBJEaNJZXRzAF9Q1WK9iHN6odupT+5ZjjK4p1Zq3VxCMjO4ZxG6NeTdVTPiT
 orW4eOsLqMF+2bRrBBLSTiFYlR30NaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622800018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYWd5dp7WinUaKpBXvEvreMS7obLPfsX6oJfVnZLczA=;
 b=+Ah3Hw4QnrzTcNRFfZpDcF/I71xn9t9qby9jKBgWFMvorCeA7xUjMF5khEC4SCHFgkqmA4
 gf3yaDFTrftlNuCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8F4EE118DD;
 Fri,  4 Jun 2021 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622800018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYWd5dp7WinUaKpBXvEvreMS7obLPfsX6oJfVnZLczA=;
 b=rWAJpsxWXek53DU/4C05hWSsXV9m5KEG4LwS+7VOoPF9/QQComEIycXrxeTX7IIsao2Ud7
 PwgIq/PAPQKBJEaNJZXRzAF9Q1WK9iHN6odupT+5ZjjK4p1Zq3VxCMjO4ZxG6NeTdVTPiT
 orW4eOsLqMF+2bRrBBLSTiFYlR30NaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622800018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYWd5dp7WinUaKpBXvEvreMS7obLPfsX6oJfVnZLczA=;
 b=+Ah3Hw4QnrzTcNRFfZpDcF/I71xn9t9qby9jKBgWFMvorCeA7xUjMF5khEC4SCHFgkqmA4
 gf3yaDFTrftlNuCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 5Je0IZL2uWBYdAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 09:46:58 +0000
Date: Fri, 4 Jun 2021 11:21:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YLnwhbojc2LcX++Z@yuki>
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
 <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> My perspective is to stay on the safe side, keep one in the LTP root
> dir and one in the subproject(e.g. open_posix).
> 
> The general files go with the SPDX identifier header.

That is indeed the safest option, can't disagreee with that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
