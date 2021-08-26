Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E43F8B24
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:36:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E21333C2F29
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D3433C2E47
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:35:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1C30200066
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:35:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48FF51FD33;
 Thu, 26 Aug 2021 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629992146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Me9WsmLjl5sMcY7JxUr0OdKUBJ41qtaL28sJyrn7OZM=;
 b=0rNlVEUJhOtjHkzwSQTEa4IDk7oBctUgZeuAMgLHZe+QBd9Uqny74KP7qlI1yjsWWMOmFX
 7aFfkS93cMI+el7j5YBy8vZ5D5ZVRpVZpGrt2fPDB+TyeWLBvhrfsIBw2RwNVmT4+ywa/x
 cu0XxvFkp885NbILXnUWxshVfNpbxv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629992146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Me9WsmLjl5sMcY7JxUr0OdKUBJ41qtaL28sJyrn7OZM=;
 b=2mgo1+PtwAfjl5EhV34qcZzXK2fSe7DnQWYhyGjDd0JjpndcLygEeA6iQ7bSs53PFER0eq
 U83IDBdSmzy85LBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2560113C6F;
 Thu, 26 Aug 2021 15:35:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RQWACNK0J2H1CwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 26 Aug 2021 15:35:46 +0000
Date: Thu, 26 Aug 2021 17:35:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <ziyaoxie@outlook.com>
Message-ID: <YSe021+kRN7NqlnA@yuki>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
 <OSZP286MB0871452D0FEE65A20447AAB1CCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSZP286MB0871452D0FEE65A20447AAB1CCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4 v2] epoll_create: Add test for epoll_create02
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
> + * Verify that epoll_create returns -1 and set errno to EINVAL if size is not
> + * positive.

I've changed the 'positive' here to 'greater than zero' to make it
clearer.

And pushed the two test for epoll_create, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
