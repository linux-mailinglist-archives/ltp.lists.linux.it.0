Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87932553379
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 15:20:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A36443C9457
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 15:20:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB0B33C93E4
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 15:19:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E4C22600907
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 15:19:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3BB1219E9;
 Tue, 21 Jun 2022 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655817594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+cthWpyg0EVee/7DjyG+PNX4Hgy3l87bKTOIkRdtKc=;
 b=DlwCMQyRV/nzNhDiGHlv7iVOb1iDuPR/6VmNDy7w7Wa8adDEbHJMl3utHAl1FBUp+c+LUE
 e0Ff6gX2h3ZgKwPhx9QkaPBXdBjRmBf5npUHzYZP8XWX15XZEm6H8blHdvx2Xyfwb+AyAC
 im/t7TaQcOo+wkZ/iB4V3n6fDpcWkrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655817594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+cthWpyg0EVee/7DjyG+PNX4Hgy3l87bKTOIkRdtKc=;
 b=tpXAclzetvWZEX1aekuVXar/9sL6gQX0GkqXJWP9jZfF8zSyIENaC4RZVAQAPYfSgm45+T
 iA4mK3wWKxkkM3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA35713A88;
 Tue, 21 Jun 2022 13:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5L0yMHnFsWK3KAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Jun 2022 13:19:53 +0000
Date: Tue, 21 Jun 2022 15:22:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Kane Wong (??????)" <wangkaiyuan@inspur.com>
Message-ID: <YrHF+XhIDwQglbBF@yuki>
References: <e993933bccac3dbf38c6aa661c9263e9@sslemail.net>
 <YqMu/4Qh9hU333xL@yuki>
 <6d6f7ae3098648018781effd62b2f6e5@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d6f7ae3098648018781effd62b2f6e5@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] ????: [PATCH] Fix the statistical number of results in
 the html
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
Cc: Harris Song <songkai01@inspur.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Please send plain text emails only to the mailing list.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
