Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851644545D
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 14:57:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 637B43C7339
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 14:57:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C8CB3C4B8F
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 14:57:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E008C1A00112
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 14:57:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA6781FD34;
 Thu,  4 Nov 2021 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636034260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=scATPIhp8WCFxWXVqls8EabsxKF9RGBbxwoU2ivas08=;
 b=JCbhSQBXZLcu3RyN9O9zpb3/R/sz3PPSuX+CdeaIo2p51kPn2yD6kZlDG7g8v1CEoMnrgO
 wrN7VVSATQejy09h9yiHF0p2qEj7/dlb6msP5xDPn9rn9YcyG5o2aN45362B2QuoYl+R3L
 y3EC4nw/0rHRuGbb994hvKqiU6+vINI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636034260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=scATPIhp8WCFxWXVqls8EabsxKF9RGBbxwoU2ivas08=;
 b=8r2jF4WNKQvieHWWEo4MqME8R8yc053vdrqwMlmoNMX0FPV2Hhv/diUFe/sgqNBddeWyFr
 35pzkd4gp6K0SBBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C673D13BD9;
 Thu,  4 Nov 2021 13:57:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0/tBL9Tmg2E9PgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 04 Nov 2021 13:57:40 +0000
Date: Thu, 4 Nov 2021 14:58:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YYPnDq4bP3y3jjJh@yuki>
References: <20211103100235.22007-1-bogdan.lezhepekov@suse.com>
 <YYPff0zN0ydo5Z9h@yuki>
 <VI1PR04MB495821F6033AD4F7AF967CAE938D9@VI1PR04MB4958.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB495821F6033AD4F7AF967CAE938D9@VI1PR04MB4958.eurprd04.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] netns_netlink: Ensure tuntap is enabled in
 kernel
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I was missing that it's possible with the test API. Then of course it would be better.

Actually the config parser implements full boolean expressions :-).

> Should I submit V2?

No need, I will remove the =y before applying.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
