Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E95A80A1
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 16:52:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 695693CA6CE
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 16:51:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CBDF3CA4E1
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 16:51:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1F0BA680E5A
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 16:51:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58BEC218FC;
 Wed, 31 Aug 2022 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661957514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXxfa5CvndonpaK4tpk++G+4yfreAoZVf6vWX/y+cCo=;
 b=JK0RTbVfonXQKhB9IfMlUD0EuoEAbL8MJNqYblPyNCFM3kZKBQGh7ziWHtelaLaKw2VrKc
 LcyQiNKad0unTYU6JAFNDxqk+dI/jYKacgrU4syhoP+VtyODByIA3WwBvdejexbdxp8ubF
 B6ziy/FjTIrgXbPN85A1m6umULX+6d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661957514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXxfa5CvndonpaK4tpk++G+4yfreAoZVf6vWX/y+cCo=;
 b=adI9ejrMSGveMWYefh+fqgzElJdsJuWGdKctYNBh02BYlT89SMLKBGMYRe8JExLrY8aQVo
 OzuZrwKzGaqelJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4673513A7C;
 Wed, 31 Aug 2022 14:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3Z2SAYl1D2MkXgAAMHmgww
 (envelope-from <akumar@suse.de>); Wed, 31 Aug 2022 14:51:53 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Luo xiaoyu <luoxiaoyu9@huawei.com>, ltp@lists.linux.it
Date: Wed, 31 Aug 2022 20:21:50 +0530
Message-ID: <5857767.lOV4Wx5bFT@localhost>
Organization: SUSE
In-Reply-To: <Yw9VzAE1YhkwaR1f@pevik>
References: <20220831112620.54251-1-luoxiaoyu9@huawei.com>
 <Yw9VzAE1YhkwaR1f@pevik>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/open04.c: Rewrite open04.c using new LTP
 API --------------------
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Luo, Petr,

FYI, There is already a patch for this on the list which I had sent last month, it might have been missed.
http://patchwork.ozlabs.org/project/ltp/patch/20220714060722.18894-1-akumar@suse.de/


Regards,
Avinesh




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
