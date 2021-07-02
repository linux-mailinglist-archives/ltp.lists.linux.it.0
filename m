Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A443BA0ED
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 15:08:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92B203C8E5B
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 15:08:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 06AF33C6AD2
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 15:07:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 67C4B14013A3
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 15:07:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C576520563;
 Fri,  2 Jul 2021 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625231270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b2eoep2JluTXuZ27w/tey6m6PJe4tp8RvPCK6ner+E=;
 b=F9n+ekbBxSDhu+Z8jYIYXEz1JRXZoe5V7i01lkVY9tQQd+mHIfOm19TI5MlIxXjDZcoSzv
 eIfwXlKGthMgbXf7oPQBBb/vYXnC2L4chFt48+y3t4s+RBddNf4bBQ/+Fj8vN8t+oylAR2
 bnXibs/KmzBljrs3LFZpW+e0JQ77W/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625231270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b2eoep2JluTXuZ27w/tey6m6PJe4tp8RvPCK6ner+E=;
 b=061UoZqV6gniwIt0LCx2aeMeetzX6nAcQhAWHtqeX+ur2HJRB6p7hutl5V6kUX2kU8q0DW
 aXIF1pbzDjvmjgBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A322F11C84;
 Fri,  2 Jul 2021 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625231270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b2eoep2JluTXuZ27w/tey6m6PJe4tp8RvPCK6ner+E=;
 b=F9n+ekbBxSDhu+Z8jYIYXEz1JRXZoe5V7i01lkVY9tQQd+mHIfOm19TI5MlIxXjDZcoSzv
 eIfwXlKGthMgbXf7oPQBBb/vYXnC2L4chFt48+y3t4s+RBddNf4bBQ/+Fj8vN8t+oylAR2
 bnXibs/KmzBljrs3LFZpW+e0JQ77W/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625231270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b2eoep2JluTXuZ27w/tey6m6PJe4tp8RvPCK6ner+E=;
 b=061UoZqV6gniwIt0LCx2aeMeetzX6nAcQhAWHtqeX+ur2HJRB6p7hutl5V6kUX2kU8q0DW
 aXIF1pbzDjvmjgBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DUl4JqYP32CDNwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 13:07:50 +0000
Date: Fri, 2 Jul 2021 14:42:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YN8Jp5iAVVjmU7js@yuki>
References: <20210701032931.132468-1-xieziyao@huawei.com>
 <20210701032931.132468-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701032931.132468-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fork08: Rewrite the test to a proper
 synchronization
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
Can we please get rid of the FILE and use file descriptors instead?

Here as well the test is invalid since the whole file is read into libc
buffers on the first call to getc().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
